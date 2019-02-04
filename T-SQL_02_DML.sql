--------------------------------------------
-------------- TRANSACT-SQL ----------------
--------------------------------------------
--- Lesson II --- DDL ----------------------
--------------------------------------------
----------------- DML ----------------------

CREATE TABLE Students
(
    Id int NOT NULL IDENTITY,
    FName nvarchar(20) NULL,
	LName nvarchar(20) NULL,
	Phone char(12) NULL,
	EMail varchar(30) NULL
)

--DML
--INSERT #1
INSERT INTO Students --(FName, LName, Phone, EMail)
	VALUES
		(N'Լևոն', N'Արամյան', '(012)3456789', 'la@blabla.com'),
		(N'Levon', N'Aramyan', NULL, 'levon@alalal.com')

		
-- allowing to manually modify/add the value of IDENTITY
SET IDENTITY_INSERT Students ON

INSERT INTO Students 
(Id, FName, LName, Phone, EMail)
	VALUES
		(3, NULL, N'Ghazaryan', '(012)3456788', 'ghazaryan@blabla.com')
		
-- restricting the manual modification of IDENTITY column
SET IDENTITY_INSERT Students OFF

--SELECT, selecting rows and columns from the table
SELECT * FROM Students -- selecting all the columns from table Students

SELECT LName, EMail FROM Students -- selecting the columns LName and EMail

SELECT LName, EMail FROM Students
	WHERE Id = 1 -- selecting the LName and EMail of the rows, which Id is 1
	
--INSERT #2
CREATE TABLE StudentPhones
(
    Id int,
	LastName nvarchar(20),
	PhoneNumber char(12)
)

INSERT StudentPhones
	SELECT Id, LName, Phone FROM Students -- taking the values from another table

SELECT * FROM StudentPhones -- slecting all of the columns and rows from the table

--UPDATE: making changes in the elemnts
--#1
UPDATE Students
	SET Phone = NULL

--#2
UPDATE Students
	SET Phone = sp.PhoneNumber -- filling from table Students
	FROM Students s 
	JOIN StudentPhones sp ON s.Id = sp.Id -- joining tables by Id

--DELETE, deleting the rows
DELETE Students
	--WHERE Id = 1

-- TRUNCATE (DDL)
-- TRUNCATE TABLE is doing the same than DELETE, but it is much faster,
-- because it removes the table at once, while DELETE removes the rows one by one.
-- Another difference is that TRUNCATE TABLE resets the IDENTITY,
-- while after DELETE operation, the new rows will continue from previous value
-- of IDENTITY

TRUNCATE TABLE Students
TRUNCATE TABLE StudentPhones

-- OUTPUT: it allows to obtain an information about the last modified/added/deleted (by DML) rows.
-- The resulting changes it gives out by two tables: inserted and deleted
INSERT Students (FName, LName, Phone, EMail)
OUTPUT inserted.* -- outputs all of the columns of the inserted rows
	VALUES
		(N'Լևոն', N'Արամյան', '(012)3456789', 'la@blabla.com'),
		(N'Levon', N'Aramyan', NULL, 'levon@alalal.com')

DELETE Students
OUTPUT deleted.Id, deleted.LName -- outputs the Id and LName of deleted rows
	WHERE Id = 1
	
UPDATE Students
	SET Phone = '(012)3456789'
	OUTPUT inserted.Id, inserted.LName, inserted.Phone AS [Inserted Phone], deleted.Phone "Deleted Phone"
	WHERE Id = 2
	
DELETE Students
OUTPUT deleted.Id, deleted.LName, deleted.Phone INTO StudentPhones

-- table variable: it is a variable, but has all of the features of the table
DECLARE @deleteTable table (Id int, LastName nvarchar(20));	

DELETE Students
OUTPUT deleted.Id, deleted.LName INTO @deleteTable -- inserting the deleted cols. to variable

SELECT * FROM @deleteTable -- selecting all of the deleted columns from the variable
