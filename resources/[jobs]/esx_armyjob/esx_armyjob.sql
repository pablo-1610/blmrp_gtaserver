 INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_army', 'army', 1);

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_army', 'army', 1) ;


INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_army', 'army', 1);


INSERT INTO `jobs` (name, label) VALUES
	('army','US-army')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('army',0,'recruit','Soldat',20,'{}','{}'),
	('army',1,'officer','Sergent',40,'{}','{}'),
	('army',2,'sergeant','Sergent-chef',60,'{}','{}'),
	('army',3,'lieutenant','Lieutenant',85,'{}','{}'),
	('army',4,'boss','Colonel',100,'{}','{}')
;



