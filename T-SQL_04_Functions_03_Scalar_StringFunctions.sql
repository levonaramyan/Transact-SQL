------------- Transact-SQL --------------
-----------------------------------------
--- Lesson 4 ---- Scalar Functions ------
-----------------------------------------

-----------------------------------------
----- Scalar functions return values ----
-----------------------------------------

-- 3. String Functions

-- ASCII / UNICODE, returns the ASCII / UNICODE of the first symbol in char
SELECT
		ASCII('Բարև') [ASCII],
		UNICODE(N'Բարև') [UNICODE]

-- CHAR / NCHAR, converts the int code to a char letter
SELECT
		CHAR(72),
		NCHAR(1330)

-- LEFT,RIGHT,LOWER,UPPER,LEN,REVERSE
SELECT
LEFT('abcdefg',3) AS [LEFT],	--> taking left 3 symbols
RIGHT('abcdefg',3) AS [RIGHT],	--> taking right 3 symbols
LOWER('ThIs iS mIxEd TeXt') AS [LOWER],	--> converting to lowercase
UPPER('ThIs iS mIxEd TeXt') AS [UPPER],	--> converting to uppercase
LEN('Spaces at the end are not counted           ') AS [LEN], --> the length without ending spaces
REVERSE('123456789') --> the reversed text

-- STUFF, SUBSTRING
-- LTRIM,RTRIM,SPACE,REPLICATE,CHARINDEX,PATINDEX,REPLACE,CONCAT

SELECT
	STUFF('abcdef',4,3,'!') AS [Stuff], --> replacing 3 symbols starting from 4 into !
	SUBSTRING('abcdef',4,3) AS [Substring] --> getting a string of length 3 starting from 4th

PRINT LTRIM('           my') -- removing the all of the spaces at the left side
PRINT RTRIM('query        ') -- removing the all of the spaces at the right side
PRINT 'My|'+SPACE(7)+'|query' -- creates a new char with 7 spaces and sets in between
PRINT REPLICATE('-',16) -- creates a new char with 16 '-' symbols
PRINT REPLICATE('haf',5) -- creates a new char with 5 repeats of 'haf'

SELECT
	CHARINDEX('three','One two three four three four'), -- the index of first argument in second, starting from 1
	CHARINDEX('three','One two three four three four',10), -- the same but starting from 10th index
	PATINDEX('%f__r%','One two three four three four') -- index of pattern match

SELECT REPLACE('One two three four three four','three','3')

SELECT	
	'My'+' '+'query',	--> 'My query'
	'My'+' '+NULL,		--> NULL
	'My'+' '+ISNULL(NULL,''),	--> 'My '
	CONCAT('My',' ', NULL)		--> 'My '

-- STRING_SPLIT, starting from SQL Server 2016
SELECT
VALUE FROM STRING_SPLIT('start|a|b|b|c|d|r|t|h|k|end','|') -- splitting the string with separator
