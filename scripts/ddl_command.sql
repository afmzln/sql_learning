/* 
==========================================
  Data Definition Languages - DDL 
===========================================
Command are used  to define,modify and delete database structures
	 - CREATE
	 - ALTER
	 - DELETE
*/
/* 
===========================================================
	CREATE
===========================================================
Script Purposes:
	Creates a new database object
	Can be used for tables, databases, views, indexes, etc.
Example:
	Create a new table called persons with columns:id, 
	person_name, birth_date, and phone
============================================================
*/
	CREATE TABLE persons(
		id INT NOT NULL,
		person_name VARCHAR(50) NOT NULL,
		birth_date DATE,
		phone VARCHAR(15) NOT NULL,
		CONSTRAINT pk_persons PRIMARY KEY (id)
)
-------------------------------------------------------------------------------------------------------------
/* 
===========================================================
	ALTER
===========================================================
Script Purposes:
	Modifies an existing database object
	Can add/drop/modify columns, constraints, indexes, etc.
Example:
	1. add new column called email to the persons table  
	2. remove column phone from the persons table 
============================================================
*/
	ALTER TABLE persons
		ADD email VARCHAR(50) NOT NULL
-------------------------------------------------------------------------------------------------------------
	ALTER TABLE persons
		DROP COLUMN phone 
-------------------------------------------------------------------------------------------------------------
/* 
===========================================================
	DROP
===========================================================
Script Purposes:
	Deletes an existing database object
	Use with caution (no undo unless a backup exists).
Example:
	delete the table persons from the databases  
============================================================
*/
	DROP TABLE persons
