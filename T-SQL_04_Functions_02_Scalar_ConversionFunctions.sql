-----------------------------------------
------------- Transact-SQL --------------
-----------------------------------------
--- Lesson 4 ---- Scalar Functions ------
-----------------------------------------

-----------------------------------------
----- Scalar functions return values ----
-----------------------------------------

-- 2. Conversion Functions
-- CAST		|
--			|==> conversion of one type to another
-- CONVERT	|

SELECT
	20/7,
	20.0/7,
	CAST(20 AS decimal)/7,
	CONVERT(decimal,20)/7

DECLARE @myDateTime char(14) = '19910108 08:00'
SELECT @myDateTime, CONVERT(datetime2,@myDateTime)

SELECT
	GETDATE() AS [Unconverted DateTime],
	CAST(GETDATE() AS varchar(30)) [Converted by CAST],
	CONVERT(varchar(30),GETDATE(),126) [Converted by CONVERT] -- 3-rd param. is convertion style and is optional
GO

-- PARSE, coukld be given the cultureinfo manually
SELECT PARSE('Sunday, 03 February 2019' AS datetime2 USING 'en-US') AS Result

SELECT PARSE('€345,98' AS money USING 'de-DE') AS Result

SET LANGUAGE 'Russian'
SELECT  PARSE('28/02/2019' AS datetime2) AS [From Russian],
		PARSE('02/28/2019' AS datetime2 USING 'en-US') AS [From English]


-- TRY_CAST,TRY_COVERT,TRY_PARSE: are the same than without try,
-- but when the conversion is impossible, it returns NULL
-- instead of throwing an error.

SELECT
	CAST('12/31/2018' AS date),
	CAST('31/12/2018' AS date), ---> error
	CONVERT(date, '12/31/2018'),
	CONVERT(date, '31/12/2018') ---> error

SELECT
	TRY_CAST('12/31/2018' AS date),
	TRY_CAST('31/12/2018' AS date), ---> NULL
	TRY_CONVERT(date, '12/31/2018'),
	TRY_CONVERT(date, '31/12/2018') ---> NULL
