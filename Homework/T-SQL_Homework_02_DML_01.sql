USE Astro

SELECT name FROM sys.tables -- printing out the names of existing tables in current DB

SELECT * FROM Galaxies

truncate Table Galaxies

INSERT INTO Galaxies (Name,CoordinateRA,CoordinateDec)--,Morphology,DistanceMPC,IsAGN,AGNClass,IsInteracting,SpiralArmClass)
VALUES	('M31',10.684793, 41.269065),
		('NGC1151',44.269281,-15.013038)

UPDATE Galaxies
SET Morphology = 'Sb',
	AGNClass = 'LINER',
	DistanceMPC = 0.75
WHERE Name = 'M31'

UPDATE Galaxies
SET	IsInteracting = 0
-- without filtering, it will set IsInteracting = 0 for all of the rows

INSERT INTO Galaxies (Name,DistanceMPC)
VALUES	('M87',23.8),('NGC1300',21.1),('M63',10.15)

UPDATE Galaxies
SET DistanceMPC = 131.6
WHERE Name like('N__115_')

SELECT	AVG(DistanceMPC) AS AVG_Distance,
		COUNT(*) AS [Number of Galaxies],
		COUNT(CoordinateDec) AS [Galaxies with coords]
		FROM Galaxies

SELECT COALESCE(Morphology,'Unknown Morphology') as Morph, COUNT(ID) as Num
INTO Morphologies ---> creating a new table Morphologies with the selection
FROM Galaxies
GROUP BY Morphology ---> Grouping the table by the morphologies

DROP TABLE Morphologies
