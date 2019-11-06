PRINT 'Hello World!'

/*declares a variable by giving it a name and the data type*/
DECLARE @myVariable INT
/*sets the value of the variable (in this case, it sets it to 6)*/
SET @myVariable = 6
/*outputs the value of the variable*/
PRINT @myVariable

/*declares two variables*/
DECLARE @var1 INT, @var2 INT
/*sets the value of the variables*/
SET @var1 = 3
SET @var2 = 5

/*concatenates two strings and prints them*/
PRINT 'Having fun with ' + 'TSQL and MS SQL server!'

/*temporarily converts var1 (which is an INT) to a string (aka, a VARCHAR) so it can work with the strings
used with the PRINT function, then outputs it's value as a string.*/
PRINT 'I have ' + CONVERT(varchar(50),@var1) + CHAR(13) + ' dollars...'

/*converts the integers to strings and outputs them with linebreaks, using "CHAR(13)"*/
PRINT 'Variable 1 = ' + CONVERT(varchar(5),@var1) + CHAR(13) + 'Variable 2 = ' + CONVERT(varchar(5),@var2) + CHAR(13) + 'Total: '
/*does NOT convert the variables, but adds their values together and prints the result*/
PRINT @var1 + @var2

IF @var1 <= 3
	BEGIN
		PRINT 'Variable 1 is <= 3' + CHAR(13)
	END
ELSE
	BEGIN
		PRINT 'Variable 1 is not < 3' + CHAR(13)
	END