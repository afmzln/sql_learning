/*
======================================
        INSERT with Manual Values
======================================
*/

-- Insert data by manually specifying values
-- Syntax: INSERT INTO table_name(column1, column2, column3,...) VALUES (value1, value2, value3,...)

INSERT INTO customers(id, first_name, country, score)
VALUES 
    (6, 'Anna', 'USA', NULL),
    (7, 'Sam', NULL, 100);
/*
======================================
       INSERT with SELECT
======================================
*/


-- Insert data from one table into another using SELECT
-- Here we're copying data from 'customers' to 'persons' with some transformations

INSERT INTO persons (id, person_name, birth_date, phone)
SELECT 
    Id,
    First_name,
    NULL,              -- Setting birth_date as NULL
    'Unknown'           -- Default phone value
FROM customers;

/*
=================================
           UPDATE Command
=================================
*/
-- Update existing records in a table
-- Always include WHERE clause to avoid updating all rows accidentally

-- Basic syntax:
-- UPDATE table_name
-- SET column1 = value1, column2 = value2
-- WHERE condition;

-- Update score for customer with ID 6
UPDATE customers
SET score = 0
WHERE id = 6;

-- Update multiple columns for customer with ID 10
UPDATE customers
SET 
    score = 0,
    country = 'UK'
WHERE id = 10;

-- Update all customers with NULL scores to 0
UPDATE customers
SET score = 0
WHERE score IS NULL;
/*
===================================
           DELETE Command
===================================
*/
-- Delete specific records from a table
-- Always include WHERE clause to avoid deleting all data

-- Delete customers with ID greater than 5
DELETE FROM customers
WHERE id > 5;

-- TRUNCATE clears the entire table quickly (no WHERE clause allowed)
TRUNCATE TABLE persons;
