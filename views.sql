
---------To fetch the branches---------
CREATE VIEW ALL_BRANCH_VIEW AS
SELECT
	*
FROM
	Branch
UNION
SELECT	
	*
FROM
	BRANCH@bank_a_b;
SELECT * FROM ALL_BRANCH_VIEW;
---------To view all loans distributed to students--------
CREATE VIEW ALL_STUDENTADDRESS_VIEW AS
SELECT
	*
FROM
	STUDENTADDRESS
UNION
SELECT	
	*
FROM
	STUDENTADDRESS@bank_a_b;
SELECT * FROM ALL_STUDENTADDRESS_VIEW;
---------View all students and their respective branch------
CREATE VIEW ALL_STUDENT_VIEW AS
SELECT
	S.STUDENTID,
	S.LASTNAME,
	B.BRANCHNAME,
	Z.ZIPCODE
FROM 
	STUDENT S
	JOIN STUDENTADDRESS SA
		ON SA.STUDENTADDRESSID = S.STUDENTADDRESS_STUDENTADDRESSID
	JOIN BRANCH B
		ON B.ZIPCODE_ZIPCODE = SA.ZIPCODE_ZIPCODE
	JOIN ZIPCODE Z
		ON Z.ZIPCODE = B.ZIPCODE_ZIPCODE
UNION
SELECT
	S.STUDENTID,
	S.LASTNAME,
	B.BRANCHNAME,
	Z.ZIPCODE
FROM 
	STUDENT@bank_a_b S
	JOIN STUDENTADDRESS@bank_a_b SA
		ON SA.STUDENTADDRESSID = S.STUDENTADDRESS_STUDENTADDRESSID
	JOIN BRANCH@bank_a_b B
		ON B.ZIPCODE_ZIPCODE = SA.ZIPCODE_ZIPCODE
	JOIN ZIPCODE@bank_a_b Z
		ON Z.ZIPCODE = B.ZIPCODE_ZIPCODE;
SELECT * FROM ALL_STUDENTADDRESS_VIEW;
---------See account transactions---------
CREATE VIEW ALL_ZIPCODE_VIEW AS
SELECT
	*
FROM
	ZIPCODE
UNION
SELECT	
	*
FROM
	ZIPCODE@bank_a_b;
SELECT * FROM ALL_ZIPCODE_VIEW;
---------Fetch the Bank Employees and their respective Branch----
CREATE VIEW ALL_EMPLOYEES_VIEW AS
SELECT
	E.EMPID,
	E.LAST_NAME,
	E.ROLE,
	E.PHONE,
	E.EMAIL,
	B.BRANCHID
	B.BRANCHNAME
FROM
	BRANCH B
	JOIN BANKEMPLOYEE E
		ON B.BRANCHID = E.BRANCH_BRANCHID
UNION
SELECT
	E.EMPID,
	E.LAST_NAME,
	E.ROLE,
	E.PHONE,
	E.EMAIL,
	B.BRANCHID,
	B.BRANCHNAME
FROM
	BRANCH@bank_a_b B
	JOIN BANKEMPLOYEE@bank_a_b E
		ON B.BRANCHID = E.BRANCH_BRANCHID;
SELECT * FROM ALL_EMPLOYEES_VIEW;