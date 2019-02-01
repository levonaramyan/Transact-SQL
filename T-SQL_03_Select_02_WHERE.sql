--------------------------------------------
-------------- TRANSACT-SQL ----------------
--------------------------------------------
--- Lesson III --- SELECT ------------------
--------------------------------------------
--------------------------------------------
----------------- WHERE --------------------
--------------------------------------------

-- 1. Finding the rows with equality
SELECT * FROM Employees
WHERE Salary = 8000 -- selecting those, with salary = 8000

SELECT * FROM Employees
WHERE Department = 'Sales' 
ORDER BY Salary DESC -- selecting those, with department = 'Sales', by salary descending order

-----------------------------------------
--------- Comparison Operators ----------
--- =, <> or !=, >, <, >=, <=, !<, !> ---
-----------------------------------------
-- 2. Finding rows by using comparison operators
SELECT * FROM Employees
WHERE Salary > 6000 -- selecting those, with salaries more than 6000

SELECT * FROM Employees
WHERE Salary !> 6000 -- selecting those, with salaries not more (i.e. <=) than 6000

---------------------------------------------------------------
----------------------- Logic Operators -----------------------
--- ALL, AND, ANY, BETWEEN, EXISTS, IN, LIKE, NOT, OR, SOME ---
---------------------------------------------------------------
-- 3. Finding rows, which corresponds to several logic terms
SELECT * FROM Employees
WHERE Department = 'Law' AND BirthDate > '03/03/2019'

-- 4. Finding rows, which corresponds to one of the mentioned logic terms
SELECT * FROM Employees
WHERE Department = 'Law' OR Department = 'marketing'

SELECT * FROM Employees
WHERE Salary > 5000 AND (Department = 'Law' OR Department = 'marketing')

-- 5. IN, finding rows which have a value from the list
SELECT * FROM Employees
WHERE Department IN ('Sales', 'Marketing', 'Law')

SELECT * FROM Employees
WHERE Department IN ('Sales', 'Marketing', 'Law')
AND Salary >= 8000

-- ALL, ANY | SOME, EXISTS -- are used with subrequests


-- 6. BETWEEN, find rows with a value in range
SELECT * FROM Employees
WHERE BirthDate BETWEEN '01/01/2019' AND '05/05/2019'

-- 7. LIKE, find rows with values like a given text expression
---- Wildcard Characters, % , _, [], [^]
SELECT * FROM Employees
WHERE Phone LIKE '042%' -- selection, where Phone starts with 042

SELECT * FROM Employees
WHERE Id LIKE '_3%' -- selection, where the second digit of Id is 3

SELECT * FROM Employees
WHERE Id LIKE '[1,4]3%' -- selection, where Id starts with 1 or 4, and second digit is 3

SELECT * FROM Employees
WHERE Id LIKE '[2-7]3%' -- selection, where Id starts with 2 to 7, and second digit is 3

SELECT * FROM Employees
WHERE Id LIKE '[^3-7]3%' -- selection, where Id doesn't start with 3 to 7, and second digit is 3

-- 8. Comparison with NULL
SELECT * FROM Employees
WHERE Salary IS NULL

SELECT * FROM Employees
WHERE Salary IS NOT NULL

SELECT * FROM Employees
WHERE Salary IN (5000,6000, NULL) -- useless, i.e. NULL will not be included

SELECT * FROM Employees
WHERE Salary IN (5000,6000)
OR Salary IS NULL -- selection, where salary is 5000, 6000, or NULL
