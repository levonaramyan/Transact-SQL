-----------------------------------------
------------- Transact-SQL --------------
-----------------------------------------
--- Lesson 5 ---- System Catalog --------
-----------------------------------------

USE Astro

-------------------------------
--- 1. Object Catalog Views ---
-------------------------------

SELECT * FROM sys.objects -- selecting all the params of all of the objects of the database

SELECT * FROM sys.objects -- slecting all the details of all of objects of type U (tables)
WHERE type = 'U'

SELECT * FROM sys.objects -- selecting all of the objects with schema_id 'dbo'
WHERE schema_id = SCHEMA_ID('dbo')


SELECT * FROM sys.tables -- selecting all of the table information of all of the tables

SELECT * FROM sys.views -- all the info of all of the views

SELECT * FROM sys.triggers -- all the info of all of the triggers

SELECT * FROM sys.procedures -- all the info of all of the procedures

SELECT * FROM sys.objects -- all the info of all of the objects of any of the mentioned types
WHERE type IN ('FN', 'IF', 'TF', 'FS', 'FT','U') ;

-- more details about the types:
-- https://msdn.microsoft.com/en-us/library/ms190324.aspx


-----------------------------------
--- 2. System Stored Procedures ---
-----------------------------------

EXEC sp_help -- selects all the objects Name, Owner, Object_type
-- ALT + F1, returns the same without a code

EXEC sp_help 'Galaxies' -- the properties of the table

EXEC sp_views_rowset 'CHECK_CONSTRAINTS' -- the properties of view

EXEC sp_databases -- No parameters, returns: DATABASE_NAME, DATABASE_SIZE,REMARKS

EXEC sp_tables -- info of all of the tables (TABLE_TYPE: table, view)

EXEC sp_tables @table_owner='dbo' -- all the tables, where owner is 'dbo'

EXEC sp_columns 'Galaxies' -- column info of columns of table 'Galaxies'

EXEC sp_pkeys 'Galaxies' -- the primary keys of table 'Galaxies'

EXEC sp_depends 'Galaxies' -- all the dependencies of table 'Galaxies'

EXEC sp_depends 'Stars' -- the dependencies of table 'Stars'
