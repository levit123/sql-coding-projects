USE db_zoo2;
GO

/*checks to see if there are any "ja guars" (intentionally misspelled) are at this zoo*/
EXEC [dbo].[getANIMAL_INFO] 'ja guar'

/*checks to see if there are any "jaguars" (properly spelled this time) are at this zoo*/
/*
EXEC [dbo].[getANIMAL_INFO] 'jaguar'
*/