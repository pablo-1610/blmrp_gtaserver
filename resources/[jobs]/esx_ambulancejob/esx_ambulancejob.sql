USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_ambulance', 'Ambulance', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_ambulance', 'Ambulance', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_ambulance', 'Ambulance', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary) VALUES
	('avocat',0,'ambulance','Ambulancier',20)
	('avocat',1,'doctor','Medecin',40,)
	('avocat',2,'boss','Chirurgien',80)

INSERT INTO `jobs` (name, label) VALUES
	('avocat','Avocat')
;

INSERT INTO `items` (name, label, `limit`) VALUES
	('bandage','Bandage', 20),
	('medikit','Medikit', 5)
;

ALTER TABLE `users`
	ADD `is_dead` TINYINT(1) NULL DEFAULT '0'
;
