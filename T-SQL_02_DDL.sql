--------------------------------------------
-------------- TRANSACT-SQL ----------------
--------------------------------------------
--- Lesson II --- DDL ----------------------
--------------------------------------------
----------------- DDL ----------------------
--DATABASE
CREATE DATABASE MyDatabase  -- creating a database with default parameters

ALTER DATABASE MyDatabase            
COLLATE Cyrillic_General_CI_AS	-- change the sorting parameter of the database

DROP DATABASE MyDatabase -- deleting the database

-- TABLE
CREATE DATABASE MyDatabase
COLLATE Cyrillic_General_CI_AS

USE MyDatabase -- start using MyDatabase

-- CTRL + K, X snippets: auto complete procedures (ex. creating tables, etc.)
CREATE TABLE Students -- creating table
(
    Id int NOT NULL IDENTITY, -- the identity column
    FName nvarchar(20),
	LName nvarchar(20),
	Phone char(12),
	EMail varchar(20),
)

ALTER TABLE Students -- changing table Students
ALTER COLUMN LName nvarchar(30) NOT NULL -- changing the column LName

ALTER TABLE Students -- changing table Students
ADD MName nvarchar(30) -- adding a new column

ALTER TABLE Students
DROP COLUMN MName -- deleting the column MName

DROP TABLE Students -- deleting the table 
