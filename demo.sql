/*creates database of a zoo and all its animals*/
CREATE DATABASE db_zoo;

/*tells the system that we're using the specified database when creating tables and values*/
USE db_zoo;

/*creates a table in the database*/
CREATE TABLE tbl_animalia (
	/*creates the table's first column, "animalia_id", and it's data type, integer (INT), and whether it has a null value or not, and how it's
	identified in the system and how it increments each time (in this case, first row in the column has ID of 1, and is incremented by 1 each row,
	so the next is 2, then 3, then 4, etc.)*/
	animalia_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	/*second column, "animalia_type", and it's data type, string (VARCHAR), and how many characters it can hold (in this case, 50),
	and whether or not is has a null value*/
	animalia_type VARCHAR(50) NOT NULL
);

/*inserts value into specified table by specifying which column to insert into, and then listing the values*/
/*NOTE: whitespace in SQL isn't as big a deal as in other languages, but it's good to make whitespace on functions like this to make it easier for
humans to read*/
INSERT INTO tbl_animalia
	(animalia_type)
	VALUES ('vertebrate'),('invertebrate')
;

/*pulls everything (by using an asterisk for the pull value) from specified table of records in the database*/
SELECT * FROM tbl_animalia;

CREATE TABLE tbl_class (
	class_id INT PRIMARY KEY NOT NULL IDENTITY (100, 1),
	class_type VARCHAR(50) NOT NULL
);

INSERT INTO tbl_class
	(class_type)
	VALUES
	('bird'),
	('reptilian'),
	('mammal'),
	('arthropod'),
	('fish'),
	('worm'),
	('cnidaria'),
	('echinoderm')
;

SELECT * FROM tbl_class;

/*updates existing table and modifies specified value to be a different value (in this case, changes "bird" to "birds")*/
UPDATE tbl_class SET class_type = 'birds' WHERE class_type = 'bird';

/*changes "birds" back to "bird"*/
UPDATE tbl_class SET class_type = 'bird' WHERE class_type = 'birds';

/*replaces value in existing table with specified value, but it's different from "UPDATE" because "REPLACE" is only temporary*/
SELECT REPLACE(class_type, 'bird', 'birds') FROM tbl_class;

/*pulls specified column ("class_type") from specified table ("tbl_class") and it's specified value ("bird") and outputs it as all uppercase*/
SELECT UPPER(class_type) FROM tbl_class WHERE class_type = 'bird';

CREATE TABLE tbl_persons (
	persons_id INT PRIMARY KEY NOT NULL	IDENTITY (1,1),
	persons_fname VARCHAR(50) NOT NULL,
	persons_lname VARCHAR(50) NOT NULL,
	persons_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_persons
	(persons_fname, persons_lname, persons_contact)
	VALUES
	('bob', 'smith', '232-345-5768'),
	('mary', 'ann', '232-345-5768'),
	('tex', 'burns', '232-345-5768'),
	('gerry', 'kerns', '232-345-5768'),
	('sally', 'fields', '232-345-5768')
;

/*pulls a persons info from the table whose last name begins with "ke" using a wildcard operator (the "%" symbol)*/
SELECT persons_fname, persons_lname, persons_contact FROM tbl_persons WHERE persons_lname LIKE 'ke%';

/*pulls data from the table and outputs it with aliases ("First Name", "Last Name", etc.) to look nicer in the output*/
SELECT persons_fname AS 'First Name', persons_lname AS 'Last Name', persons_contact AS 'Phone' FROM tbl_persons WHERE persons_lname LIKE 'ke%';

/*deletes a row in the table based on the specified value (in this case, we're deleting the row that has a last name of "smith")*/
DELETE FROM tbl_persons WHERE persons_lname = 'smith';

SELECT persons_fname AS 'First Name', persons_lname AS 'Last Name', persons_contact AS 'Phone' FROM tbl_persons;

/*deletes a table and it's contents entirely*/
DROP TABLE tbl_persons;

CREATE TABLE tbl_order (
	order_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	order_type VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_care (
	care_id VARCHAR(50) PRIMARY KEY NOT NULL,
	care_type VARCHAR(50) NOT NULL,
	care_specialist INT NOT NULL
);

CREATE TABLE tbl_nutrition (
	nutrition_id INT PRIMARY KEY NOT NULL IDENTITY (2200,1),
	nutrition_type VARCHAR(50) NOT NULL,
	nutrition_cost MONEY NOT NULL
);

CREATE TABLE tbl_habitat (
	habitat_id INT PRIMARY KEY NOT NULL IDENTITY(5000,1),
	habitat_type VARCHAR(50) NOT NULL,
	habitat_cost MONEY NOT NULL
);

CREATE TABLE tbl_specialist (
	specialist_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	specialist_fname VARCHAR(50) NOT NULL,
	specialist_lname VARCHAR(50) NOT NULL,
	specialist_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_order
	(order_type)
	VALUES
	('carnivore'),
	('herbivore'),
	('omnivore')
;
SELECT * FROM tbl_order;

INSERT INTO tbl_care
	(care_id, care_type, care_specialist)
	VALUES
	('care_0', 'replace the straw', 1),
	('care_1', 'repair or replace broken toys', 4),
	('care_2', 'bottle feed vitamins', 1),
	('care_3', 'human contact_pet subject', 2),
	('care_4', 'clean up animal waste', 1),
	('care_5', 'move subject to exercise pen', 3),
	('care_6', 'drain and refill aquarium', 1),
	('care_7', 'extensive dental work', 3)
;
SELECT * FROM tbl_care;

INSERT INTO tbl_nutrition
	(nutrition_type, nutrition_cost)
	VALUES
	('raw fish', 1500),
	('living rodents', 600),
	('mixture of fruit and rice', 800),
	('warm bottle of milk', 600),
	('syringe feed broth', 600),
	('lard and seed mix', 300),
	('aphids', 150),
	('vitamins and marrow', 3500)
;
SELECT * FROM tbl_nutrition;

INSERT INTO tbl_habitat
	(habitat_type, habitat_cost)
	VALUES
	('tundra', 40000),
	('grassy gnoll with trees', 12000),
	('10 ft pond and rocks', 30000),
	('icy aquarium with snowy facade', 50000),
	('short grass, shade, and moat', 50000),
	('netted forest atrium', 10000),
	('jungle vines and winding branches', 15000),
	('cliff with shaded cave', 15000)
;
SELECT * FROM tbl_habitat;

INSERT INTO tbl_specialist
	(specialist_fname, specialist_lname, specialist_contact)
	VALUES
	('margret', 'nyguen', '384-576-2899'),
	('mary', 'fischer', '384-784-4856'),
	('arnold', 'holden', '385-475-3944'),
	('kem', 'byesan', '384-485-4855'),
	('delmonte', 'fyedo', '768-288-3749')
;
SELECT * FROM tbl_specialist;

/*creates a table of animal species using foreign keys to seperate data from each other. This process is called a "one to many"*/
CREATE TABLE tbl_species (
	species_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	species_name VARCHAR(50) NOT NULL,
	/*names the foreign key "fk_animalia_id" where "fk" makes it clear to us that it's a foreign key. The tag
	"FOREIGN KEY" actually specifies that it's a foreign key, and the "REFERENCES" tag relates the foreign
	key to the "tbl_animalia" table and the specified id "animalia_id"*/
	species_animalia INT NOT NULL CONSTRAINT fk_animalia_id FOREIGN KEY REFERENCES tbl_animalia(animalia_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_class INT NOT NULL CONSTRAINT fk_class_id FOREIGN KEY REFERENCES tbl_class(class_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_order INT NOT NULL CONSTRAINT fk_order_id FOREIGN KEY REFERENCES tbl_order(order_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_habitat INT NOT NULL CONSTRAINT fk_habitat_id FOREIGN KEY REFERENCES tbl_habitat(habitat_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_nutrition INT NOT NULL CONSTRAINT fk_nutrition_id FOREIGN KEY REFERENCES tbl_nutrition(nutrition_id) ON UPDATE CASCADE ON DELETE CASCADE,
	species_care VARCHAR(50) NOT NULL CONSTRAINT fk_care_id FOREIGN KEY REFERENCES tbl_care(care_id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_species
	(species_name, species_animalia, species_class, species_order, species_habitat, species_nutrition, species_care)
	VALUES
	('brown bear', 1, 102, 3, 5007, 2200, 'care_1'),
	('jaguar', 1, 102, 1, 5007, 2200, 'care_4'),
	('penguin', 1, 100, 1, 5003, 2200, 'care_6'),
	('ghost bat', 1, 102, 1, 5007, 2204, 'care_2'),
	('chicken', 1, 100, 3, 5001, 2205, 'care_0'),
	('panda', 1, 102, 3, 5006, 2202, 'care_4'),
	('bobcat', 1, 102, 1, 5001, 2204, 'care_5'),
	('grey wold', 1, 102, 1, 5000, 2201, 'care_4')
;
SELECT * FROM tbl_species;

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
;

/*the output of the above function would be:
species_name: brown bear
animalia_type: vertebrate
class_type: mammal
order_type: omnivore
habitat_type: cliff with shaded cave
nutrition_type: raw fish
care_type: repair or replace broken toys

again, the purpose of using "INNER JOIN" would be to output more detailed/specific info related to a certain animal
(habitat, nutrition, needed care, etc.), rather than just generic animal info from the larger table