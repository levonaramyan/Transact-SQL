------------- Transact-SQL --------------
-----------------------------------------
--- Lesson 4 ---- Scalar Functions ------
-----------------------------------------

-----------------------------------------
----- Scalar functions return values ----
-----------------------------------------

-- 6. Logical Functions
-- CHOOSE, will return the value of an element in the list, which has a given index
SELECT Id,FName,BirthDate,
CHOOSE(MONTH(BirthDate),'winter','winter','spring','spring','spring',
		'summer','summer','summer','autumn','autumn','autumn','winter')
FROM Employees

-- 7. Metadata Functions
-- OBJECT_ID, OBJECT_NAME
-- example, if a table with object_id = OBJECT_ID('Cars') not exists, then create a table
IF NOT EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('Cars'))
BEGIN
	CREATE TABLE Cars
	(
		Id int Identity,
		Name Varchar(20)
	)
END
GO

SELECT OBJECT_ID('Employees'), -- find object id by name
		OBJECT_NAME(OBJECT_ID('Employees')) -- find obj name by id

-- if a table with name Cars exists, then delete it
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('Cars'))
BEGIN
	DROP TABLE Cars -- delete the table Cars
END
GO
