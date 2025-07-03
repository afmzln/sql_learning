/*
==================================================
        Basic Comparison Operators
==================================================
= (equals), != or <> (not equals), >, >=, <, <=
==================================================
*/
/*
==================================================
            = (equals)
==================================================
*/
-- Get all customers from Germany
SELECT * 
FROM customers
WHERE country = 'Germany';
/*
==================================================
          = or <> (not equals)
==================================================
*/
-- Get all customers not from Germany
SELECT * 
FROM customers
WHERE country != 'Germany';

/*
==================================================
           > (greater than)
==================================================
*/
-- Get customers with score greater than 500
SELECT *
FROM customers
WHERE score > 500;
/*
==================================================
         >= (greater than more/ equals)
==================================================
*/
-- Get customers with score 500 or more
SELECT *
FROM customers
WHERE score >= 500;
/*
==================================================
           < (less than)
==================================================
*/
-- Get customers with score less than 500
SELECT *
FROM customers
WHERE score < 500;
/*
==================================================
         <= ( less than less or equals)
==================================================
*/
-- Get customers with score 500 or less
SELECT *
FROM customers
WHERE score <= 500;

/*
==================================================
            Logical Operators
==================================================
         AND, OR, NOT operators
==================================================
*/
/*
==========================================
         AND (All conditions must be TRUE)
==========================================
*/
-- Customers from USA with score > 500
SELECT *
FROM customers
WHERE country = 'USA' AND score > 500;
/*
================================================
      OR (At least one conditions must be TRUE)
================================================
*/
-- Customers either from USA OR with score > 500
SELECT *
FROM customers
WHERE country = 'USA' OR score > 500;
/*
=================================================
         NOT (Reverse) Excludes matching values
=================================================
*/
-- Customers with score not less than 500 (same as >= 500)
SELECT *
FROM customers
WHERE NOT score < 500;

/*
==================================================
          Advanced Conditions
==================================================
         BETWEEN, IN, LIKE
==================================================
*/
/*
================================
      BETWEEN (inclusive range)
================================
*/
-- Retrieve all customers whose score falls in the range between 100 and 500
SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500;
/*
================================
    IN (match any value in list)
================================
*/
-- Retrieve all customers from either Germany or USA
SELECT *
FROM customers
WHERE country IN ('Germany', 'USA');
/*
================================
    LIKE (pattern matching)
================================
*/
-- Names starting with 'M'
SELECT *
FROM customers
WHERE first_name LIKE 'M%';

-- Names ending with 'n'
SELECT *
FROM customers
WHERE first_name LIKE '%n';

-- Names containing 'r'
SELECT *
FROM customers
WHERE first_name LIKE '%r%';

-- Names with 'r' as the 3rd character
SELECT *
FROM customers
WHERE first_name LIKE '__r%';
