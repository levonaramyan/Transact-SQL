------------------------------------
------------ Data Types ------------
------------------------------------

--BIT: declaring and initializing
DECLARE @myBit bit = 0
PRINT @myBit

SET @myBit = 99
PRINT @myBit

--INTEGER: declaring and initializing
DECLARE @myInt int = 32 
PRINT @myInt

SET @myInt = 2147483647 + 1
PRINT @myInt

--DECIMAL (NUMERIC)
DECLARE @myDecimal1 decimal = 234.87 
PRINT @myDecimal

DECLARE @myDecimal2 decimal(8,5) = 234.87
PRINT @myDecimal2

SET @myDecimal2 = 123.123456 -- will get 123.12346
PRINT @myDecimal2

SET @myDecimal2 = 1234.56 -- will get error, more than 3 digits before point
PRINT @myDecimal2

--DATE
DECLARE @myDate date = '01-08-1991' -- mm-dd-yyyy
PRINT @myDate

SET @myDate = '19910108' -- another universal way to write dates
PRINT @myDate

SET @myDate = '17-01-2017' -- will get error, because it could not get dd-mm-yyyy form
PRINT @myDate

--DATETIME
DECLARE @myDateTime datetime = '01-08-1991 08:01:35' -- MM-dd-yyyy hh:mm:ss
PRINT @myDateTime

SET @myDateTime = '19910108 08:01:35:335'
PRINT @myDateTime

--TIME
DECLARE @myTime time = '08:06:34:1' -- the last is in milliseconds
PRINT @myTime

SET @myTime = '08:06:34.1234567' -- ends with seconds
PRINT @myTime

--NCHAR
DECLARE @myNChar nchar(19) = N'Սա ցանկացած տեքստ է' -- the length is always 19
PRINT @myNChar

--NVARCHAR
DECLARE @myNVarChar nvarchar(15) = N'մեկ այլ տեքստ' -- the length could be at most 15
PRINT @myNVarChar

----------------------------------------------------
--------------- Arithmetic operations --------------
----------------------------------------------------
-- operator: +

DECLARE @x int = 125, @y int = 625
SELECT @x + @y

DECLARE @date datetime = '19910108 08:00'
SELECT @date + 1.25 -- adding 1.25 days, i.e. 1 days and 6 hours

SELECT 'My SQL' + ' Query!' -- For strings, this is concatenation

-- Operators -, *, / and %

SELECT  17/5,      -- will get 3
	7/10,      -- will get 0
	17.0/5,    -- will get 3.4
	17/5.0     -- will get 3.4

SELECT 8/0 -- Divide by zero error

SELECT  17/5, -- is 3
	17%5  -- is 2
