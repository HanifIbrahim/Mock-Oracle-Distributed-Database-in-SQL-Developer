------------RUN THESE QUERIES IN BOTH DATABASES DBST663a and DBST663b-------
    ADD DB VARCHAR2(20);
ALTER TABLE STUDENTADDRESS
    ADD DB VARCHAR2(20);
ALTER TABLE ZIPCODE
    ADD DB VARCHAR2(20);
----------FRAGMENTATION----------
INSERT INTO STUDENTADDRESS@bank_a_b (
    STUDENTADDRESSID,
    STUDENTADDRESS,
	ZIPCODE_ZIPCODE
    )
SELECT 
    studentaddressid STUDENTADDRESSID,
studentaddress STUDENTADDRESS,
zipcode_zipcode ZIPCODE_ZIPCODE
FROM (
    SELECT 	
    SA.STUDENTADDRESSID,
    SA.STUDENTADDRESS,
	SA.ZIPCODE_ZIPCODE
    FROM STUDENTADDRESS SA
    JOIN ZIPCODE Z
        ON SA.ZIPCODE_ZIPCODE = Z.ZIPCODE
    WHERE Z.STATE = 'MD' OR Z.STATE = 'NC' 
    )
;

INSERT INTO BRANCH@bank_a_b (
BRANCHID,
BRANCHNAME,
ZIPCODE_ZIPCODE
)
SELECT
BRANCHID BRANCHID,
BRANCHNAME BRANCHNAME,
ZIPCODE_ZIPCODE ZIPCODE_ZIPCODE
FROM (
SELECT
B.BRANCHID,
B.BRANCHNAME,
B.ZIPCODE_ZIPCODE
FROM BRANCH B
JOIN ZIPCODE Z
ON B.ZIPCODE_ZIPCODE = Z.ZIPCODE
WHERE Z.STATE = 'MD' OR Z.STATE = 'NC'
)
;
COMMIT;

INSERT INTO ZIPCODE@bank_a_b (
    ZIPCODE, CITY,
    STATE, COUNTRY, DB
    )
SELECT 
    *
FROM (
    SELECT
        ZIPCODE, CITY,
        STATE, COUNTRY
    FROM
        ZIPCODE
    WHERE
        STATE = 'MD' OR STATE = 'NC'
    ORDER BY
        ZIPCODE
    )
;