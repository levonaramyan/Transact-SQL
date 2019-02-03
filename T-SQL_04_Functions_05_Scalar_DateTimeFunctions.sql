------------- Transact-SQL --------------
-----------------------------------------
--- Lesson 4 ---- Scalar Functions ------
-----------------------------------------

-----------------------------------------
----- Scalar functions return values ----
-----------------------------------------

-- 5. Date and Time Functions
-- CURRENT_TIMESTAMP, GETDATE()

SELECT CURRENT_TIMESTAMP, -- Standard SQL function
		GETDATE() -- Transact SQL alternative of CURRENT_TIMESTAMP

USE MyDB
GO
-- DATENAME,DATEPART,DAY,MONTH,YEAR
-- to get the employees, who was born on January
SELECT FName,LName,BirthDate
FROM Employees
WHERE MONTH(BirthDate) = 1

-- the same with DATEPART
SELECT FName,LName,BirthDate
FROM Employees
WHERE DATEPART(MONTH,BirthDate) = 1

DECLARE @today datetime = GETDATE()

SELECT
	DATENAME(YEAR,@today), -- year as a char
	DATENAME(WEEKDAY,@today), -- the name of the day: 'monday',etc.
	DATEPART(YEAR,@today), -- the year as a number
	DATEPART(MONTH,@today), -- the month as a number
	DATEPART(DAYOFYEAR,@today), -- the day of the year
	DATEPART(QUARTER,@today), -- the quarter of the year
	DAY(@today), -- the day as a number
	MONTH(@today), -- the month as a number
	YEAR(@today) -- the year as a number

-- DATEFROMPARTS,DATETIMEFROMPARTS,TIMEFROMPARTS
SELECT
	DATEFROMPARTS(2019,01,25),
	DATETIMEFROMPARTS(2019,01,25,14,00,15,155),
	TIMEFROMPARTS(14,00,15,12345,5)

-- DATEDIFF,DATEADD
SELECT
	DATEDIFF(MONTH,'20010101','20010301'), -- how many times the month was changed in this period
	DATEDIFF(MONTH,'20010131','20010301'), -- the changes of months are the same than in previos case
	DATEADD(MONTH,-6,GETDATE()) -- adding a period of time on date
