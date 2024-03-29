USE [db_zoo2]
GO
/****** Object:  StoredProcedure [dbo].[getANIMAL_INFO]    Script Date: 10/28/2019 1:09:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*modifies the procedure that gets a specific animals info from "db_zoo2" database, based on user input, to check
if the animal exists in the database or not*/
ALTER PROC [dbo].[getANIMAL_INFO]
@animalName varchar(50) /*parameter is user input, of which animal they want to get info for*/
AS
BEGIN	
	/*declares the variables (error string to display, and results)*/
	DECLARE @errorString varchar(50)
	DECLARE @results varchar(5)

	/*defines the error message*/
	SET @errorString = 'There are no ' + @animalName + '''s found at this zoo.'

	/*checks to see if the specified animal exists in the database. if it does, displays
	the animal info. if not, gives an error message*/
	BEGIN TRY
		SET @results = (SELECT COUNT(tbl_species.species_name) FROM tbl_species WHERE species_name = @animalName)
			/*if animal is not found in database, give an error message*/
			IF @results = 0
				BEGIN
					/*displays the string we defined earlier as the error message, then uses "RETURN" to break out of the code*/
					RAISERROR(@errorString, 16, 1)
					RETURN
				END
			/*if animal is found in database, displays the animal info*/
			ELSE IF @results = 1
				BEGIN
					/*pulls a specific animal's info (in this case, "brown bear"), and joins it with related tables to display the info more detailed and understandable,
					as well as more related to the specified animal ("brown bear")*/
					SELECT
						a1.species_name, a2.animalia_type,
						a3.class_type, a4.order_type, a5.habitat_type,
						a6.nutrition_type, a7.care_type
						FROM tbl_species a1
						/*pulls info from a specific animal and assigns it to an alias ("tbl_animalia" value goes to a2, "tbl_class"
						value goes to a3, etc.)*/
						INNER JOIN tbl_animalia a2 ON a2.animalia_id = a1.species_animalia
						/*pulls info from "tbl_class" and sets the "class_id" value to be equal to the "species_class" value*/
						INNER JOIN tbl_class a3 ON a3.class_id = a1.species_class
						INNER JOIN tbl_order a4 ON a4.order_id = a1.species_order
						INNER JOIN tbl_habitat a5 ON a5.habitat_id = a1.species_habitat
						INNER JOIN tbl_nutrition a6 ON a6.nutrition_id = a1.species_nutrition
						INNER JOIN tbl_care a7 ON a7.care_id = a1.species_care
						WHERE species_name = @animalName
					;
				END
	END TRY

	BEGIN CATCH
		SELECT @errorString = ERROR_MESSAGE()
		RAISERROR (@errorString, 10, 1)
	END CATCH
END