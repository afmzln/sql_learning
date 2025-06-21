
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
	This script retrieve all data from customers 
===========================================================
*/
	SELECT * FROM customers 
-----------------------------------------------------------------------------------------------------------------------------
 /* 
************************************************************
         [SELECT FEW COLUMNS]
************************************************************
Script Purpose:
	This script retrieve customer's name, country and score
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
	This script is to filters rows before any groupings are made
	Cannot use aggregate functions here
Example clauses: 
	1. retrieve score not equal to zero 
	2. retrieve customers from GERMANY 
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
	This script to sorts the result set by specified column(s)
	ASC (ascending) or DESC (descending) can be specified
Example: 
	1. retrieve all customers  and sort the results by the HIGHEST score first
	2. retrieve  all customers  and sort the results by the LOWEST score first
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
	This script retrieve  all customers  and sort the results by country and then by the HIGHEST score 
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
	This script is to groups rows that have the same values into summary rows
	Used with aggregate functions (COUNT, SUM, AVG, etc.)
Example:
	1. the total score for each country 
	2. find the total score and total numbers of customers for each country 
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
	This script is to filters groups after the GROUP BY is applied
	Can use aggregate functions here (unlike WHERE)
Example:
	To find the average score for each country 
	considering only customers with a score not equal to 0
	and return only those countries with an average score > 430 
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
	This script is retrieves only unique/different values
	Eliminates duplicate rows from the result
Example:
		to return unique list of all countries
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
	This script is to limits the number of rows returned (SQL Server syntax)
Example:
		1. retrieve TOP 3 customers with HIGHEST score
		2. retrieve lowest 2 customers based on score
		3. get two most recent orders
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
