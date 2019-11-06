USE [db_zoo2];
GO

/*declares the money/cost related variables*/
DECLARE @totalHab MONEY;
DECLARE @totalNut MONEY;
DECLARE @results MONEY;

/*defines the money/cost related variables by getting the sum (total) of all costs from the specified tables (tbl_habitat, tbl_nutrition, etc.)*/
SET @totalHab = (SELECT SUM(habitat_cost) FROM tbl_habitat);
SET @totalNut = (SELECT SUM(nutrition_cost) FROM tbl_nutrition);
/*defines the total cost by adding the total habitat cost to the total nutrition cost*/
SET @results = (@totalHab + @totalNut);

PRINT (
	CONVERT(varchar(50), @totalHab) + char(9) + ' - The total habitat cost' + char(13) +
	CONVERT(varchar(50), @totalNut) + char(9) + char(9) + ' - The Total Nutrition Cost ' + char(13) + '----------' + char(13) +
	CONVERT(varchar(50), @results)
);