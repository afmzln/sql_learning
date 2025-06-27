
/* 
	=================================================
		CODING and EXECUTE ORDERS
	=================================================
	Script Purpose:
	This script focus on SQL queries statement. 
	Below are the order of execution:
		1.FROM
		2.WHERE
		3.GROUP BY
		4.HAVING
		5.SELECT (including DISTINCT)
		6.ORDER BY
		7.TOP/LIMIT
	The Syntax: 
		SELECT DISTINCT TOP 2 
		FROM 
		WHERE 
		GROUP BY 
		HAVING 
		ORDER BY 
*/


 /* 
************************************************************
         [SELECT ALL]
************************************************************
Script Purpose:  
    This script retrieves all customer data.  
===========================================================
*/
	SELECT * FROM customers 
-----------------------------------------------------------------------------------------------------------------------------
 /* 
************************************************************
         [SELECT FEW COLUMNS]
************************************************************
Script Purpose:  
    This script retrieves the customer's name, country, and score.  
=============================================================
*/
	SELECT 
		first_name,
		country,
		score
	FROM customers
------------------------------------------------------------------------------------------------------------------------------
/*	
************************************************************
             [WHERE]
************************************************************
Script Purpose:  
    This script filters rows before any groupings are applied.  
    Aggregate functions cannot be used here.  

Example clauses:  
    1. Retrieve scores not equal to zero.  
    2. Retrieve customers from Germany.  
=============================================================
*/
	SELECT * 
	FROM customers
	WHERE score != 0
------------------------------------------------------------------------------------------------------------------------------
	SELECT 
		first_name,
		country
	FROM customers
	WHERE country ='Germany'
------------------------------------------------------------------------------------------------------------------------------
/*	
************************************************************
           [ORDER BY]
************************************************************
Script Purpose:
  This script sorts the result set by the specified column(s).
  You can specify ASC (ascending) or DESC (descending) order.

Examples:
  1. Retrieve all customers and sort the results by the highest score first (DESC).
  2. Retrieve all customers and sort the results by the lowest score first (ASC).
=============================================================
*/
	SELECT *
	FROM customers
	ORDER BY score DESC
------------------------------------------------------------------------------------------------------------------------------
	SELECT *
	FROM customers
	ORDER BY score ASC
------------------------------------------------------------------------------------------------------------------------------
/*	
************************************************************
            [NESTED ORDER BY]
************************************************************
Script Purpose:
	This script retrieves  all customers  and sorts the results by country and then by the HIGHEST score 
=============================================================
*/
	SELECT *
	FROM customers
	ORDER BY country ASC, score DESC
------------------------------------------------------------------------------------------------------------------------------
/*	
************************************************************
		[GROUP BY]
************************************************************
Script Purpose:
   This script groups rows that have the same values into summary rows.
   It is used with aggregate functions (COUNT, SUM, AVG, etc.).

Examples:
  1. Calculate the total score for each country.
  2. Find the total score and total number of customers for each country.
=============================================================
*/
	SELECT --3rd 
		country,
		SUM(score) as total_score
	FROM customers --1st
	GROUP BY country --2nd
------------------------------------------------------------------------------------------------------------------------------
	SELECT  --3rd
		country,
		SUM(score) as total_score,
		COUNT(id) as total_customers
	FROM customers --1st
	GROUP BY country --2nd
------------------------------------------------------------------------------------------------------------------------------
 /*	
************************************************************
		[HAVING]
************************************************************
Script Purpose:
   This script filters groups after the GROUP BY clause is applied.
   Unlike WHERE, it allows the use of aggregate functions.

Example:
   Find the average score for each country,
   considering only customers with a score not equal to 0,
   and return only those countries with an average score > 430.
=============================================================
*/  
	SELECT 
		country, 
		AVG(score) as avg_score
	FROM customers --1st
	WHERE score != 0 --2nd
	GROUP BY country --3rd
	HAVING AVG(score) > 430 --4th 

------------------------------------------------------------------------------------------------------------------------------
 /*	
************************************************************
		[DISTINCT]
************************************************************
Script Purpose:
  This script retrieves only unique/distinct values.
  It eliminates duplicate rows from the results.

Example:
    Return a unique list of all countries.
=============================================================
*/  
	SELECT /*2nd*/ DISTINCT country /*3rd*/
	FROM customers --1st--
------------------------------------------------------------------------------------------------------------------------------
 /*	
************************************************************
		[TOP(Limit)]
************************************************************
Script Purpose:
  This script limits the number of rows returned.

Examples:
  1. Retrieve the top 3 customers with the highest score.
  2. Retrieve the 2 lowest-scoring customers.
  3. Get the two most recent orders.
=============================================================
*/         
	SELECT TOP 3 * --3rd 
	FROM customers --1st 
	ORDER BY score DESC --2nd
------------------------------------------------------------------------------------------------------------------------------
	SELECT TOP 2 * 
	FROM customers 
	ORDER BY score ASC 
------------------------------------------------------------------------------------------------------------------------------
	SELECT TOP 2 * 
	FROM orders 
	ORDER BY order_date DESC 
