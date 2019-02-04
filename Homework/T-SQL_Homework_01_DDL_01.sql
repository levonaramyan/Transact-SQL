-- 1․Ստեղծել բազա
CREATE DATABASE Astro

USE Astro

-- DROP DATABASE Astro

-- 2․Ստեղծել "Freestyle" table, որը պետք է ունենա մինիմում 10 column,
--   որից միայն 5-6ն է հենց table ստեղծելու ժամանակ տրվում
--   (ցանկալի է տարբեր տիպեր օգտագործել)

CREATE TABLE Galaxies
(
    ID int IDENTITY NOT NULL,
    Name varchar(30) NULL,
	CoordinateRA decimal(9,6) NULL,
	CoordinateDec decimal(8,6) NULL,
	Morphology varchar(5) NULL,
	DistanceMPC decimal (7,2) NULL
)

-- DROP TABLE Galaxies

SELECT * FROM Galaxies -- վիզուալ ստուգում ենք ինչպես է ստեղծվել

-- 3.Փոփոխել table-ը և ավելացնել մնացած column-երը միանգամից (multiple)
ALTER TABLE Galaxies
ADD IsAGN bit,
	AGNClass varchar(10),
	IsInteracting char(3),
	SpiralArmClass smallint

--ALTER TABLE Galaxies
--DROP COLUMN IsAGN,AGNClass,IsInteracting,SpiralArmClass

-- 4.Փոփոխել column-երից մի քանիսը
ALTER TABLE Galaxies
ALTER COLUMN Name varchar(30) NOT NULL

ALTER TABLE Galaxies
ALTER COLUMN IsInteracting bit

ALTER TABLE Galaxies
ALTER COLUMN SpiralArmClass tinyint
