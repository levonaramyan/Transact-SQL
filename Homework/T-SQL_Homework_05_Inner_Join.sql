-- creating table stars with primary key - Id
CREATE TABLE Stars
(
    Id int NOT NULL Primary Key,
    Name varchar(20) NOT NULL,
	Temp int NULL
);

-- creating table planets, with primary key -Id, and foreign key - Star_Id
CREATE TABLE Planets
(
    Id int NOT NULL PRIMARY KEY,
    Name varchar(20) NOT NULL,
	Distance_AU int NULL,
	Star_Id int FOREIGN KEY REFERENCES Stars(Id)
);

-- Inserting some rows into tables
INSERT INTO Stars (Id,Name)
VALUES (1,'Sun'),(2,'Sirius'),(3,'Vega')

INSERT INTO Planets (Id,Name,Star_Id)
VALUES (1,'Earth',1),(2,'Mars',1),(3,'New Planet',2),
		(4,'Another planet',3)

-- Not allowed to set as a foreign key a value, out of the list of primary keys
INSERT INTO Planets (Id,Name,Star_Id)
VALUES (8,'Unknown planet',5)

-- joining tables stars and planets with selection criteria
select pl.Name,pl.Star_Id,s.Name,s.Id from Planets as Pl
join Stars as S on Pl.Star_Id = S.Id
where pl.Id > 2 or S.Name like ('S_n')

-- joining tables stars and planets and grouping by star names, showing with the number of their planets
select s.Name, count(Pl.Id)from Planets as Pl
join Stars as S on Pl.Star_Id = S.Id
where pl.Id > 2 or S.Name like ('S_n')
group by s.Name
