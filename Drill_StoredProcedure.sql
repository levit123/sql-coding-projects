USE AdventureWorks2014
GO

CREATE PROCEDURE dbo.uspGetPhoneInfo @numberID nvarchar(30) = '1', @numberID2 nvarchar(30) = '2'
	AS
	SELECT
		Person.PersonPhone.PhoneNumber, Person.PhoneNumberType.PhoneNumberTypeID
		FROM Person.PersonPhone
		INNER JOIN Person.PhoneNumberType ON Person.PersonPhone.PhoneNumberTypeID = CONVERT(nvarchar(30),Person.PhoneNumberType.PhoneNumberTypeID)
		WHERE Person.PhoneNumberType.PhoneNumberTypeID = @numberID OR Person.PhoneNumberType.PhoneNumberTypeID = @numberID2
GO