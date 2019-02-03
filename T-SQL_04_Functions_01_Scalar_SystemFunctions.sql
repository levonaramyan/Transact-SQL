-----------------------------------------
------------- Transact-SQL --------------
-----------------------------------------
--- Lesson 4 ---- Scalar Functions ------
-----------------------------------------

-----------------------------------------
----- Scalar functions return values ----
-----------------------------------------

-- GO, is a separator of bacth of instructions
-- GO, is not a function of SQL
-- it wil be recognized as a separator in SQL Server Management Studio

-- 1. System Functions
-- @@ERROR
DECLARE @MyInt Int
SET @MyInt = 1/0
GO

SELECT @@ERROR
GO

BEGIN TRY
	DECLARE @MyInt Int
	SET @MyInt = 'asasfasf'
END TRY
BEGIN CATCH
	SELECT
	ERROR_NUMBER() AS [Error Number],
	ERROR_LINE() AS [Error Line],
	ERROR_SEVERITY() AS [Error Severity],
	ERROR_STATE() AS [Error State],
	ERROR_MESSAGE() AS [Message]
END CATCH

-- @@IDENTITY, returns the value of the last setted identificator
-- SCOPE_IDENTITY, IDENT_CURRENT - similar functions

INSERT Students
VALUES
('Poghos','Poghosyan', 5)
GO
SELECT @@IDENTITY
GO

-- @@ROWCOUNT, returns the number of rows, affected during the last instruction
UPDATE Students
SET LName = 'Galstyan'
WHERE ID = 11
GO
SELECT @@ROWCOUNT
GO

-- NEWID, creates a new unique value of type uniqueidentifier

DECLARE @myId uniqueidentifier
SET @myId = NEWID()
PRINT @myId

-- ISNUMERIC, checks whether the variable is of numeric type (int, decimal, etc.)
-- returns 1, if true, else 0

SELECT
ISNUMERIC(1),				---> 1 yes
ISNUMERIC(1.5),				---> 1 yes
ISNUMERIC('15'),			---> 1 although is char, but convertable to numeric
ISNUMERIC('01/01/1991'),	---> 0 not numeric
ISNUMERIC('aaa'),			---> 0 not numeric
ISNUMERIC(@myId),			---> 0 has non numeric form
ISNUMERIC('+'),				---> 1 single symbol has numeric value
ISNUMERIC('$')				---> 1 single symbol has numeric value

-- ISNULL, gets given value, if the selected value is NULL

SELECT Id,FName,LName, ISNULL(Salary,0.0) AS Salary
FROM Employees

DECLARE @myNullVar int
SELECT
	@myNullVar + 5,				---> NULL + 5 = NULL
	ISNULL(@myNullVar,0) + 5	---> 0 + 5 = 5
