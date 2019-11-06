/*creates the Library database*/
CREATE DATABASE db_library;
GO
USE db_library;

/*creates the Library Branch table, which contains the local branch ID, name, and address*/
CREATE TABLE Library_Branch (
	BranchID INT PRIMARY KEY NOT NULL,
	BranchName VARCHAR(30) NOT NULL,
	BranchAddress VARCHAR(50) NOT NULL
);

/*creates the Publisher table, which contains the publisher name, address, and phone number*/
CREATE TABLE Publisher (
	PublisherName VARCHAR(30) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(50) NOT NULL,
	PublisherPhone VARCHAR(20) NOT NULL
);

/*creates the Books table, which contains the book ID, Title, and publisher name (which is linked
to the Publisher table)*/
CREATE TABLE Books (
	BookID VARCHAR(20) PRIMARY KEY NOT NULL,
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(30) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName)
		ON UPDATE CASCADE ON DELETE CASCADE
);

/*creates the Book Copies table, which contains the book ID (linked to the Books table), branch ID
(which is linked to the Library Branch table), and the number of copies there are of the book*/
CREATE TABLE Book_Copies (
	BookID VARCHAR(20) NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES Library_Branch(BranchID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

/*creates the Book Author table, which contains the book ID (linked to the Books table), and author name*/
CREATE TABLE Book_Author (
	BookID VARCHAR(20) NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES Books(BookID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(30) NOT NULL
);

/*creates the Borrowers table, which contains the card number, borrower name, address, and phone number*/
CREATE TABLE Borrower (
	CardNumber VARCHAR(10) PRIMARY KEY NOT NULL,
	BorrowerName VARCHAR(30) NOT NULL,
	BorrowerAddress VARCHAR(30) NOT NULL,
	BorrowerPhoneNumber VARCHAR(20) NOT NULL
);

/*creates the Book Loans table, which contains the book ID (linked to the Books table), branch ID,
card number (linked to Borrower table), date taken out, and due date*/
CREATE TABLE Book_Loans (
	BookID VARCHAR(20) NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES Books(BookID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES Library_Branch(BranchID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CardNumber VARCHAR(10) NOT NULL CONSTRAINT fk_CardNumber FOREIGN KEY REFERENCES Borrower(CardNumber)
		ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut VARCHAR(30) NOT NULL,
	DateDue VARCHAR(30) NOT NULL
);

/*inserts 4 branches into the Library_Branch table*/
INSERT INTO Library_Branch
	(BranchID, BranchName, BranchAddress)
	VALUES
	(1, 'Sharpstown', '343 Industry Lane'),
	(2, 'Central', '123 Main Street'),
	(3, 'Fortham', '1033 Quarter Avenue'),
	(4, 'Innsmouth', '233 Dagon Road')
;

/*inserts publishers into the Publisher table*/
INSERT INTO Publisher
	(PublisherName, PublisherAddress, PublisherPhone)
	VALUES
	('Grey Page Publishings', '199 Classic Road', '311-299-6621'),
	('HorrorMinds', '2066 Pennywise Street', '311-373-1111'),
	('FantasyFans', '297 Drizzt Avenue', '503-777-2122'),
	('Marvel', '444 Avengers Road', '503-221-8960')
;

/*inserts 20 books into the Books table*/
INSERT INTO Books
	(BookID, Title, PublisherName)
	VALUES
	('0118999889', 'The Lost Tribe', 'Grey Page Publishings'),
	('0119213675', 'The Shining', 'HorrorMinds'),
	('0119113311', 'IT', 'HorrorMinds'),
	('0118223322', 'House Of The Scorpion', 'Grey Page Publishings'),
	('0120033012', 'The Orc King', 'FantasyFans'),
	('0121001101', 'The Ghost King', 'FantasyFans'),
	('0121221061', 'The Witcher', 'FantasyFans'),
	('0122036631', 'Hatchet', 'Grey Page Publishings'),
	('0133299336', 'To Kill A Mockingbird', 'Grey Page Publishings'),
	('0130011968', 'The Kite Runner',  'Grey Page Publishings'),
	('0141006981', 'Punisher MAX Vol 1', 'Marvel'),
	('0145599678', 'Punisher MAX Vol 2', 'Marvel'),
	('0140568911', 'Punisher MAX Vol 3', 'Marvel'),
	('0141122113', 'Punisher MAX Vol 4', 'Marvel'),
	('0145533342', 'Punisher MAX Vol 5', 'Marvel'),
	('0155663213', 'DeadPool Vol 1', 'Marvel'),
	('0153322139', 'DeadPool Vol 2', 'Marvel'),
	('0158989812', 'DeadPool Vol 3', 'Marvel'),
	('0150001333', 'DeadPool Mini-Collection 1', 'Marvel'),
	('0150013001', 'DeadPool Mini-Collection 2', 'Marvel'),
	('0153319211', 'Preacher Vol 1', 'Marvel')
;

/*inserts info into the Book_Copies table, defining the books info and how many copies there are*/
INSERT INTO Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	/*all the books at the Sharpstown branch*/
	('0118999889', 1, 3),
	('0119213675', 1, 3),
	('0119113311', 1, 3),
	('0120033012', 1, 3),
	('0121001101', 1, 3),
	('0121221061', 1, 3),
	('0141006981', 1, 3),
	('0145599678', 1, 3),
	('0140568911', 1, 3),
	('0141122113', 1, 4),
	('0145533342', 1, 5),
	/*all the books at the Central branch*/
	('0119213675', 2, 5),
	('0119113311', 2, 5),
	('0118223322', 2, 5),
	('0120033012', 2, 4),
	('0121001101', 2, 4),
	('0121221061', 2, 4),
	('0122036631', 2, 6),
	('0133299336', 2, 6),
	('0130011968', 2, 6),
	('0141006981', 2, 6),
	('0145599678', 2, 5),
	/*all the books at the Fortham branch*/
	('0121221061', 3, 2),
	('0122036631', 3, 2),
	('0133299336', 3, 2),
	('0130011968', 3, 2),
	('0145533342', 3, 2),
	('0155663213', 3, 2),
	('0153322139', 3, 2),
	('0158989812', 3, 2),
	('0150001333', 3, 2),
	('0150013001', 3, 2),
	('0153319211', 3, 2),
	/*all the books at the Innsmouth branch*/
	('0118999889', 4, 4),
	('0119213675', 4, 3),
	('0119113311', 4, 3),
	('0118223322', 4, 3),
	('0120033012', 4, 2),
	('0121001101', 4, 2),
	('0121221061', 4, 3),
	('0158989812', 4, 2),
	('0150001333', 4, 5),
	('0150013001', 4, 2),
	('0153319211', 4, 3)
;

/*inserts 10 authors into the Book_Author table*/
INSERT INTO Book_Author
	(BookID, AuthorName)
	VALUES
	('0118999889', 'Mark Lee'),
	('0119213675', 'Stephen King'),
	('0119113311', 'Stephen King'),
	('0118223322', 'Nancy Farmer'),
	('0120033012', 'R.A. Salvatore'),
	('0121001101', 'R.A. Salvatore'),
	('0121221061', 'Andrzej Sapkowski'),
	('0122036631', 'Gary Paulsen'),
	('0133299336', 'Haper Lee'),
	('0130011968', 'Khaled Hosseini'),
	('0141006981', 'Garth Ennis'),
	('0145599678', 'Garth Ennis'),
	('0140568911', 'Garth Ennis'),
	('0141122113', 'Garth Ennis'),
	('0145533342', 'Garth Ennis'),
	('0155663213', 'Markle Moore'),
	('0153322139', 'Jacob Singer'),
	('0158989812', 'Mike Wade'),
	('0150001333', 'Jimmy Alfredo'),
	('0150013001', 'Johnny TwoFeet'),
	('0153319211', 'Garth Ennis')
;

INSERT INTO Borrower
	(CardNumber, BorrowerName, BorrowerAddress, BorrowerPhoneNumber)
	VALUES
	('103310892', 'Levi Blodgett', '243 Gently Lane', '360-776-8960'),
	('103321100', 'Jonny Blodgett', '6839 Broadway Street', '503-221-5612'),
	('103001301', 'Juliette Suvante', '6839 Broadway Street', '503-220-1337'),
	('104055899', 'Quinton Valentino', '1004 20th Avenue', '360-112-3117'),
	('104168689', 'Peggy Valentino', '1004 20th Avenue', '360-999-8811'),
	('104991617', 'Lizzy Blodgett', '1014 20th Avenue', '360-111-0023'),
	('105011032', 'Jimmy TwoFeet', '1043 Winnebaga Street', '105-781-9263'),
	('105116213', 'Jimmy LooseLips', '1268 PizzaPasta Corner', '105-881-2261'),
	('106220087', 'Jonny NoFace', '1265 PizzaPasta Corner', '106-333-2911'),
	('106001313', 'Timmy OneEye', '1266 PizzaPasta Corner', '105-369-9251')
;

INSERT INTO Book_Loans
	(BookID, BranchID, CardNumber, DateOut, DateDue)
	VALUES
	/*all book loans for Levi Blodgett*/
	('0119213675', 4, '103310892', '10-28-19', '11-4-19'),
	('0119113311', 4, '103310892', '10-28-19', '11-4-19'),
	('0141006981', 4, '103310892', '10-30-19', '11-6-19'),
	('0158989812', 4, '103310892', '10-30-19', '11-6-19'),
	('0150001333', 4, '103310892', '10-30-19', '11-6-19'),
	('0150013001', 4, '103310892', '10-30-19', '11-6-19'),
	/*all book loans for Jonny Blodgett*/
	('0118223322', 2, '103321100', '11-1-19', '11-10-19'),
	('0119213675', 2, '103321100', '11-1-19', '11-10-19'),
	('0119113311', 2, '103321100', '11-1-19', '11-10-19'),
	('0118223322', 2, '103321100', '11-3-19', '11-13-19'),
	('0120033012', 2, '103321100', '11-3-19', '11-13-19'),
	/*all book loans for Juliette Suvante*/
	('0121221061', 3, '103001301', '11-2-19', '11-11-19'),
	('0122036631', 3, '103001301', '11-2-19', '11-11-19'),
	('0133299336', 3, '103001301', '11-2-19', '11-11-19'),
	('0158989812', 3, '103001301', '11-2-19', '11-11-19'),
	('0150001333', 3, '103001301', '11-2-19', '11-11-19'),
	('0150013001', 3, '103001301', '11-2-19', '11-11-19'),
	('0153319211', 3, '103001301', '11-2-19', '11-11-19'),
	/*all book loans for Quinton Valentino*/
	('0118999889', 4, '104055899', '11-5-19', '11-14-19'),
	('0119213675', 4, '104055899', '11-5-19', '11-14-19'),
	('0119113311', 4, '104055899', '11-5-19', '11-14-19'),
	('0158989812', 4, '104055899', '11-5-19', '11-14-19'),
	('0150001333', 4, '104055899', '11-5-19', '11-14-19'),
	('0150013001', 4, '104055899', '11-5-19', '11-14-19'),
	('0153319211', 4, '104055899', '11-5-19', '11-14-19'),
	('0158989812', 4, '104055899', '11-5-19', '11-14-19'),
	/*all book loans for Peggy Valentino*/
	('0118999889', 1, '104168689', '11-5-19', '11-14-19'),
	('0119213675', 1, '104168689', '11-5-19', '11-14-19'),
	('0119113311', 1, '104168689', '11-5-19', '11-14-19'),
	('0121221061', 1, '104168689', '11-5-19', '11-14-19'),
	('0141006981', 1, '104168689', '11-5-19', '11-14-19'),
	('0145599678', 1, '104168689', '11-6-19', '11-15-19'),
	('0140568911', 1, '104168689', '11-6-19', '11-15-19'),
	('0141122113', 1, '104168689', '11-6-19', '11-15-19'),
	/*all book loans for Lizzy Blodgett*/
	('0120033012', 1, '104991617', '11-6-19', '11-15-19'),
	('0121001101', 1, '104991617', '11-6-19', '11-15-19'),
	('0121221061', 1, '104991617', '11-6-19', '11-15-19'),
	('0130011968', 2, '104991617', '11-5-19', '11-14-19'),
	('0141006981', 2, '104991617', '11-5-19', '11-14-19'),
	('0145599678', 2, '104991617', '11-5-19', '11-14-19'),
	/*all book loans for Jimmy TwoFeet*/
	('0118223322', 2, '105011032', '10-20-19', '10-25-19'),
	('0120033012', 2, '105011032', '10-20-19', '10-25-19'),
	('0121001101', 2, '105011032', '10-20-19', '10-25-19'),
	('0121221061', 2, '105011032', '10-20-19', '10-25-19'),
	('0133299336', 2, '105011032', '10-20-19', '10-25-19'),
	('0130011968', 2, '105011032', '10-20-19', '10-25-19'),
	('0141006981', 2, '105011032', '10-20-19', '10-25-19'),
	('0145599678', 2, '105011032', '10-20-19', '10-25-19'),
	/*all book loans for Jimmy LooseLips*/
	('0158989812', 4, '105116213', '10-21-19', '10-26-19'),
	('0150001333', 4, '105116213', '10-21-19', '10-26-19'),
	('0150013001', 4, '105116213', '10-21-19', '10-26-19'),
	('0153319211', 4, '105116213', '10-21-19', '10-26-19')
;

SELECT * FROM Library_Branch;
SELECT * FROM Publisher;
SELECT * FROM Books;
SELECT * FROM Book_Copies;
SELECT * FROM Book_Author;
SELECT * FROM Borrower;
SELECT * FROM Book_Loans;