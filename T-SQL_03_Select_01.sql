--------------------------------------------
-------------- TRANSACT-SQL ----------------
--------------------------------------------
--- Lesson III --- SELECT ------------------
--------------------------------------------

-- DISTINCT, selection without duplicates
SELECT DISTINCT Department FROM Employees

-- TOP, selecting a given number of rows
SELECT TOP 15 * FROM Employees -- top 15 rows, with all columns

SELECT TOP 15 FName,LName, EMail FROM Employees -- top 15 rows, with given columns

SELECT TOP 20 PERCENT * FROM Employees -- top 20 percent rows, with all columns

-- ORDER BY, ordering the selection by given term
SELECT TOP 10 * FROM Employees
ORDER BY FName -- ordering by FName

SELECT TOP 15 PERCENT * FROM Employees
ORDER BY Salary, LName -- ordering by salary, then by LName

SELECT TOP 20 * FROM Employees
ORDER BY BirthDate -- Ordering chronologicaly

SELECT TOP 10 * FROM Employees
ORDER BY FName DESC -- orders by FName by descending order (the default is ASC)

SELECT TOP 10 * FROM Employees
ORDER BY 6 DESC, 1 -- the ordering columns could be given with their indexes

-- WITH TIES, adding also the rows which have the same value (in ordered column) than the last selected
SELECT TOP 25 PERCENT WITH TIES FName, LName, Salary FROM Employees
ORDER BY Salary DESC -- returns 25% + N (Ties)

-- SELECT ... INTO ..., save the result into another table
SELECT Id,FName,LName,Salary
INTO EmpSalaries
FROM Employees
