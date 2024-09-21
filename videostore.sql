DROP TABLE 		Customers;
CREATE TABLE 	Customers(
		MemberID	INT			NOT NULL,
		FirstName	VARCHAR(24)	NOT NULL,
		LastName	VARCHAR(24)	NOT NULL,
		PhoneNumber	VARCHAR(15)	NOT NULL,
	CONSTRAINT 	CustomersPK
	PRIMARY KEY	(MemberID)
);
CREATE INDEX	IDX_Customers_PhoneNumber
ON				Customers (PhoneNumber);


DROP TABLE 		Actors;
CREATE TABLE 	Actors(
		ActorID		INT			NOT NULL
								PRIMARY KEY,
		ActorName	VARCHAR(50)	NOT NULL,
		BirthName	VARCHAR(50)	NOT NULL,
		DateOfBirth	DATE 		NOT NULL,
		Popularity	DECIMAL		NOT NULL
);
CREATE INDEX	IDX_Actors_Name
ON				Actors (ActorName);


DROP TABLE 		Categories;
CREATE TABLE 	Categories(
		CategoryID		INT			NOT NULL
									PRIMARY KEY,
		CategoryName	VARCHAR(50)	NOT NULL,
);
CREATE INDEX	IDX_Categories_Name
		ON		Categories (CategoryName);


DROP TABLE		Movies;
CREATE TABLE	Movies(
		MovieID		INT 		NOT NULL,
		CategoryID	INT 		FOREIGN KEY REFERENCES
									Categories(CategoryID),
		Title		VARCHAR(50)	NOT NULL,
		Length		TIME		NOT NULL
);
CREATE INDEX	IDX_Movies_Title
		ON		Movies(Title);


DROP TABLE		Castings;
CREATE TABLE	Castings(
		MovieID		INT 		NOT NULL
								FOREIGN KEY REFERENCES
									Movies(MovieID),
		ActorID 	INT 		NOT NULL
								FOREIGN KEY REFERENCES
									Actors(ActorID),
		CONSTRAINT	PK_Castings
					PRIMARY KEY (MovieID, ActorID)
);


DROP TABLE		Copies;
CREATE TABLE	Copies(
		CopyID		INT 		NOT NULL
								PRIMARY KEY,
		MovieID		INT 		NOT NULL
								FOREIGN KEY REFERENCES
									Movies(MovieID),
		InStock		BOOLEAN		NOT NULL,
		DVDNumber	INT,
		VHSNummber	INT
);


DROP TABLE		Rentals;
CREATE TABLE	Rentals(
		CopyID		 		INT 		NOT NULL
										FOREIGN KEY REFERENCES
										Copies(CopyID),
		MemberID			INT 		NOT NULL
										FOREIGN KEY REFERENCES
										Customers(MemberID),
		CheckoutDateTime	DATETIME 	NOT NULL,
		DueDate				DATE 		NOT NULL,
		ReturnedDateTime	DATETIME,
		RentalStatus		VARCHAR(16)	NOT NULL,
		LateFees			MONEY,
		CONSTRAINT	PK_Rentals
					PRIMARY KEY (CopyID, MemberID)
);


-- Insert into Customers
INSERT INTO	Customers
VALUES (69121893,	'John',		'Donahue',	19198763020);
INSERT INTO	Customers
VALUES (24451736,	'Anne',		'Williams',	12527440993);
INSERT INTO	Customers
VALUES (18663258,	'Ahmed',	'Farhid',	17048915629);
INSERT INTO	Customers
VALUES (88107045,	'Bella',	'Talous',	13439467313);


-- Insert into Actors
INSERT INTO Actors
VALUES (22,	'Mel Gibson',		'Mel Columcille Gerard Gibson',	'1956-1-3', 	6.2);
INSERT INTO Actors
VALUES (65,	'Julia Roberts', 	'Julia Fiona Roberts', 			'1967-10-28',	8.0);
INSERT INTO Actors
VALUES (1,	'Denzel Washington', 'Denzel Hayes Washington Jr.',	'1954-12-28',	9.4);
INSERT INTO Actors
VALUES (108, 'Natalie Portman', 'Natalie Hershlag', 			'1981-6-9', 	7.7);


-- Insert into Categories
INSERT INTO Categories
VALUES (1, 'Action');
INSERT INTO Categories
VALUES (2, 'Comedy');
INSERT INTO Categories
VALUES (3, 'Science Fiction');
INSERT INTO Categories
VALUES (4, 'Crime');


-- Insert into Movies
INSERT INTO Movies
VALUES (1, 		1, 'Lethal Weapon', '1:49:04');
INSERT INTO Movies
VALUES (8, 		2, 'Pretty Woman', '1:59:58');
INSERT INTO Movies
VALUES (61,		1, 'The Book of Eli', '1:58:43');
INSERT INTO Movies
VALUES (758,	3, 'Star Wars: Episode I - The Phantom Menace', '2:16:20');


-- Insert into Castings
INSERT INTO Castings
VALUES (1, 22);
INSERT INTO Castings
VALUES (8, 65);
INSERT INTO Castings
VALUES (61, 1);
INSERT INTO Castings
VALUES (758, 108);


-- Insert into Copies
INSERT INTO Copies
		(CopyID, 	MovieID,	InStock,	DVDNumber)
VALUES 	(1, 		65, 		0,			1);
INSERT INTO Copies
		(CopyID, 	MovieID,	InStock,	VHSNummber)
VALUES 	(2, 		8, 			1,			1);
INSERT INTO Copies
		(CopyID, 	MovieID,	InStock,	DVDNumber)
VALUES 	(405, 		61, 		0,			223);
INSERT INTO Copies
		(CopyID, 	MovieID,	InStock,	VHSNummber)
VALUES 	(2364, 		758, 		1,			104);


-- Insert into Rentals
INSERT INTO RentalStatus
(CopyID, MemberID, CheckoutDateTime, DueDate, ReturnedDateTime, RentalStatus)
VALUES
(405, 69121893, '2019-12-8 16:51:04', '2019-12-15', '2019-12-13 16:13:22', 'Returned');
INSERT INTO RentalStatus
(CopyID, MemberID, CheckoutDateTime, DueDate, ReturnedDateTime, RentalStatus, LateFees)
VALUES
(2, 24451736, '2020-6-16 11:12:40', '2020-6-23', '2020-6-26' '11:12:40', 'Returned', 4.00);
INSERT INTO RentalStatus
(CopyID, MemberID, CheckoutDateTime, DueDate, RentalStatus, LateFees)
VALUES
(2364, '18663258', '2021-1-30 9:20:59', '2021-2-6', 'Overdue', 15.00);
INSERT INTO RentalStatus
(CopyID, MemberID, CheckoutDateTime, DueDate, RentalStatus)
VALUES
(1, '88107045', '2021-3-25 20:45:20', '2021-4-1', 'Checked Out');

SELECT * FROM Rentals;
SELECT * FROM Copies;
SELECT * FROM Movies;
SELECT * FROM Customers;
SELECT * FROM Categories;
SELECT * FROM Castings;
SELECT * FROM Actors;