USE db_library
GO

/*gets the number of copies of the book The Lost Tribe owned by Sharpstown*/
CREATE PROCEDURE dbo.uspGetLostTribeSharpstown
	AS
	SELECT
		Number_Of_Copies, BranchID
		FROM Book_Copies
		WHERE BookID = '0118999889' AND BranchID = 1
GO

/*gets the number of copies of the book The Lost Tribe owned by each branch*/
CREATE PROCEDURE dbo.uspGetLostTribeAll
	AS
	SELECT
		Number_Of_Copies, BranchID
		FROM Book_Copies
		WHERE BookID = '0118999889'
GO

/*gets the names of the borrowers who do not have books checked out*/
CREATE PROCEDURE dbo.uspGetBorrowersNotCheckedOut
	AS
	SELECT
		BorrowerName, CardNumber
		FROM Borrower
		WHERE CardNumber NOT IN
			(SELECT CardNumber
			FROM Book_Loans)
GO

/*for each book that is loaned out from the Sharpstown branch and whose Due Date is the 14th,
retrieve the book title, borrower's name, and borrowers address*/
CREATE PROCEDURE dbo.uspGetBooksDue
	AS
	SELECT
		Books.Title, Books.BookID, Borrower.BorrowerName, Borrower.BorrowerAddress, Book_Loans.DateDue
		FROM Books
		INNER JOIN Book_Loans ON Books.BookID = Book_Loans.BookID
		INNER JOIN Borrower ON Book_Loans.CardNumber = Borrower.CardNumber
		WHERE Book_Loans.BranchID = 1 AND Book_Loans.DateDue = '11-14-19'
GO

/*for each library branch, retrieve the branch name and the total number
of books loaned out from that branch*/
CREATE PROCEDURE dbo.uspGetBookCount
	AS
	/*gets the info for the Sharpstown branch*/
	SELECT
		COUNT(BookID)
		FROM Book_Loans
		WHERE BranchID = 1
	;
	/*gets the info for the central branch*/
	SELECT
		COUNT(BookID)
		FROM Book_Loans
		WHERE BranchID = 2
	;

	/*gets the info for the Fortham branch*/
	SELECT
		COUNT(BookID)
		FROM Book_Loans
		WHERE BranchID = 3
	;

	/*gets the info for the Innsmouth branch*/
	SELECT
		COUNT(BookID)
		FROM Book_Loans
		WHERE BranchID = 4
	;
GO

/*goes through each person andsees if each person has 5 or more
books checked out. if so, display their info*/
CREATE PROCEDURE dbo.uspGetFiveLoans
	AS
	/*1sts person*/
	IF (SELECT
		COUNT(Book_Loans.CardNumber)
		FROM Book_Loans
		WHERE Book_Loans.CardNumber = '103310892'
	) >= 5
	BEGIN
		SELECT
			Borrower.BorrowerName, Borrower.BorrowerAddress
			FROM Borrower
			WHERE Borrower.BorrowerName = 'Levi Blodgett'
		END
	;
	/*2nd person*/
	IF (SELECT
		COUNT(Book_Loans.CardNumber)
		FROM Book_Loans
		WHERE Book_Loans.CardNumber = '103321100'
	) >= 5
	BEGIN
		SELECT
			Borrower.BorrowerName, Borrower.BorrowerAddress
			FROM Borrower
			WHERE Borrower.BorrowerName = 'Jonny Blodgett'
		END
	;
	/*3rd person*/
	IF (SELECT
		COUNT(Book_Loans.CardNumber)
		FROM Book_Loans
		WHERE Book_Loans.CardNumber = '103001301'
	) >= 5
	BEGIN
		SELECT
			Borrower.BorrowerName, Borrower.BorrowerAddress
			FROM Borrower
			WHERE Borrower.BorrowerName = 'Juliette Suvante'
		END
	;
	/*4th person*/
	IF (SELECT
		COUNT(Book_Loans.CardNumber)
		FROM Book_Loans
		WHERE Book_Loans.CardNumber = '104055899'
	) >= 5
	BEGIN
		SELECT
			Borrower.BorrowerName, Borrower.BorrowerAddress
			FROM Borrower
			WHERE Borrower.BorrowerName = 'Quinton Valentino'
		END
	;
	/*5th person*/
	IF (SELECT
		COUNT(Book_Loans.CardNumber)
		FROM Book_Loans
		WHERE Book_Loans.CardNumber = '104168689'
	) >= 5
	BEGIN
		SELECT
			Borrower.BorrowerName, Borrower.BorrowerAddress
			FROM Borrower
			WHERE Borrower.BorrowerName = 'Peggy Valentino'
		END
	;
	/*6th person*/
	IF (SELECT
		COUNT(Book_Loans.CardNumber)
		FROM Book_Loans
		WHERE Book_Loans.CardNumber = '104991617'
	) >= 5
	BEGIN
		SELECT
			Borrower.BorrowerName, Borrower.BorrowerAddress
			FROM Borrower
			WHERE Borrower.BorrowerName = 'Lizzy Blodgett'
		END
	;
	/*7th person*/
	IF (SELECT
		COUNT(Book_Loans.CardNumber)
		FROM Book_Loans
		WHERE Book_Loans.CardNumber = '105011032'
	) >= 5
	BEGIN
		SELECT
			Borrower.BorrowerName, Borrower.BorrowerAddress
			FROM Borrower
			WHERE Borrower.BorrowerName = 'Jimmy TwoFeet'
		END
	;
	/*8th person*/
	IF (SELECT
		COUNT(Book_Loans.CardNumber)
		FROM Book_Loans
		WHERE Book_Loans.CardNumber = '105116213'
	) >= 5
	BEGIN
		SELECT
			Borrower.BorrowerName, Borrower.BorrowerAddress
			FROM Borrower
			WHERE Borrower.BorrowerName = 'Jimmy LooseLips'
		END
	;
GO

/*retrieves the info on books from Central branch written by Stephen King*/
CREATE PROCEDURE dbo.uspGetStephenKing
	AS
	SELECT
	Books.Title, Book_Copies.Number_Of_Copies, Book_Author.AuthorName, Book_Copies.BranchID
	FROM Books
	INNER JOIN Book_Copies ON Books.BookID = Book_Copies.BookID
	INNER JOIN Book_Author ON Book_Copies.BookID = Book_Author.BookID
	WHERE Book_Copies.BranchID = 2 AND Book_Author.AuthorName = 'Stephen King'
;