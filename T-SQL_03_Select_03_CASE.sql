--------------------------------------------
-------------- TRANSACT-SQL ----------------
--------------------------------------------
--- Lesson III --- SELECT ------------------
--------------------------------------------

-------------------------------------------------
-------------------- CASE -----------------------
-------------------------------------------------
-- Expression CASE
-- 1. Simple expression CASE
SELECT Id,FName,LName,Salary,

CASE
	WHEN Salary >= 8000 THEN 'chief'
	WHEN Salary >= 6000 THEN 'manager'
	WHEN Salary IS NULL THEN 'unknown'
	ELSE 'worker' -- default value is 'worker'
END AS Position, -- the name of new column

CASE
	WHEN Salary >= 8000 THEN 'chief'
	WHEN Salary >= 6000 THEN 'manager'
	WHEN Salary IS NULL THEN 'unknown'
	-- without default value, it will get NULL
END AS Position2

FROM Employees

-- 2. Searching expressions
SELECT Id, FName, LName, Department, Salary,

CASE Department
	WHEN 'Administration & Support' THEN '100%'
	WHEN 'Law' THEN '80%'
	WHEN 'Sales' THEN '60%'
	ELSE '40%'
END AS [Bonus%], -- when keysymbols are used write in brackets []

Salary/100*
CASE Department
	WHEN 'Administration & Support' THEN 100
	WHEN 'Law' THEN 80
	WHEN 'Sales' THEN 60
	ELSE 40
END AS Bonus,

(Salary/100*
CASE Department
	WHEN 'Administration & Support' THEN 100
	WHEN 'Law' THEN 80
	WHEN 'Sales' THEN 60
	ELSE 40
END) + Salary
AS [Salary + Bonus]

FROM Employees

-- IIF, starting from SQL Server 2012
SELECT Id,FName,LName,Salary,
IIF(Salary >= 6000,'manager','worker') AS Position
-- this is the similar to
-- CASE 
--		WHEN Salary >= 6000 THEN 'manager'
--		ELSE 'worker'
-- END AS Position
FROM Employees

ALTER TABLE Employees
ADD Gender bit

UPDATE Employees
SET Gender = IIF(Id >= 40, 1 ,0)

SELECT Id,FName,LName,
IIF(Gender = 1, 'man','woman') AS Gender
FROM Employees

-- GROUP BY
SELECT Department, Gender FROM Employees
GROUP BY Department, Gender
-- The same is: SELECT DISTINCT Department, Gender FROM Employees

-- HAVING
SELECT Department, Gender FROM Employees
GROUP BY Department, Gender
	HAVING Department Like 'l%' -- grouping and filtering, where department will start with 'l'
