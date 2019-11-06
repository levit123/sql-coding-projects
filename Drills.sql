USE db_zoo2;
GO

/*displays all info from the habitat table*/
SELECT * FROM tbl_habitat;

/*displays the names from the species tables that have a species_order value of 3*/
SELECT species_name FROM tbl_species WHERE species_order = 3;

/*displays the types of nutrition from the nutrition table that have a cost of 600 or less*/
SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600;

/*displays the names of species using the alias "Species Name" from the species table and
their corresponding nutrition_type under the alias "Nutrition Type" from the nutrition table*/
SELECT species_name AS 'Species Name' FROM tbl_species;
SELECT nutrition_type AS 'Nutrition Type' FROM tbl_nutrition;