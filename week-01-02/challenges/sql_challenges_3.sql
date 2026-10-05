/*
*******************************************************************************
*******************************************************************************

SQL CHALLENGES 3

*******************************************************************************
*******************************************************************************

In the exercises below you will need to use the following clauses/operators:
	- ORDER BY
	- LIMIT
    - MIN(), MAX()
    - COUNT(), AVG(), SUM()

In SQL we can have many databases, they will show up in the schemas list
We must first define which database we will be working with.
*/

USE publications;

/******************************************************************************
ORDER BY
******************************************************************************/
-- https://www.w3schools.com/sql/sql_orderby.asp

/* 1. Select the title and ytd_sales from the table titles. Order them by the
year to date sales. */

SELECT title, ytd_sales
FROM titles
ORDER BY ytd_sales;

-- 2. Repeat the same query, but this time sort the titles in descending order

SELECT title, ytd_sales
FROM titles
ORDER BY ytd_sales DESC;

/******************************************************************************
LIMIT

https://www.w3schools.com/mysql/mysql_limit.asp
******************************************************************************/

-- 3. Select the top 5 titles with the most ytd_sales from the table titles

SELECT ytd_sales, title
FROM titles
ORDER BY ytd_sales DESC
LIMIT 5;

SELECT title, price
FROM titles
WHERE price IS NOT NULL
ORDER BY price ASC
LIMIT 5 OFFSET 5;

/******************************************************************************
MIN and MAX

https://www.w3schools.com/sql/sql_min_max.asp
******************************************************************************/

-- 4. What's the maximum amount of books ever sold in a single order?

SELECT MAX(qty)
FROM sales;

-- Ich habe hier erst ord_num benutzt. 

-- OFFSET ÜBUNG wäre noch gut
-- 5. What's the price of the cheapest book?

SELECT MIN(price)
FROM titles;

-- Der Querie funktionert aber wirft nur eine Zahl ohne Titel aus und das ist ggf nicht brauchbar.
-- Deswegen habe ich versucht den Titel mit in die Ausgabe zu ziehen. Bei meinem ersten Versuch habe ich NULL als ergebnis gehabt. 
-- Mit der Erweiterung WHERE price IS NOT NULL kann man das Problem beheben. 

SELECT title, price
	FROM titles
		WHERE price IS NOT NULL
			ORDER BY price ASC
				LIMIT 1;
 

/******************************************************************************
COUNT, AVG, and SUM

https://www.w3schools.com/sql/sql_count_avg_sum.asp

******************************************************************************/

 -- 6. How many rows are there in the table authors?

SELECT COUNT (column_authors)
FROM authors;
 -- Das war wohl falsch. Column_Name war hier nur ein placeholder. 

SELECT COUNT(*)
FROM authors;

 -- 7. What's the total amount of year-to-date sales?

SELECT SUM(ytd_sales)
	FROM titles;
	-- Nach Sum ohne Leertaste ( schreiben -- 
    
 -- 8. What's the average price of books?

SELECT AVG(price)
	FROM titles;

/* 9. In a single query, select the count, average and sum of quantity in the
table sales */

SELECT COUNT(qty), AVG(qty), SUM(qty)
FROM sales;

/*
In the exercises below you will need to use the following clauses/operators:
	- SELECT FROM
    - AS
	- DISTINCT
	- WHERE
	- AND / OR / NOT
	- ORDER BY
	- LIMIT
    - MIN(), MAX()
    - COUNT(), AVG(), SUM()

*/

-- 10. From how many different states are our authors?

SELECT COUNT(DISTINCT state)
FROM authors;

-- 11. How many publishers are based in the USA?

SELECT COUNT(country)
FROM publishers
WHERE country = 'USA';

-- 12. What's the average quantity of titles sold per sale by store 7131?

SELECT AVG(qty)
FROM sales
WHERE stor_id = 7131;

-- 13. When was the employee with the highest level hired?

SELECT hire_date, job_lvl
	FROM employee
		ORDER BY job_lvl DESC
			LIMIT 1;

-- In der falschen Tabelle gesucht --

-- 14. What's the average price of psychology books?

SELECT
	AVG(price)
FROM 
	titles
WHERE 
	type = "psychology";

-- 15. Which category of books has had more year-to-date sales, "business" or
-- "popular_comp"? You can write two queries to answer this question.

-- Aufgabe 15
-- Ich musste hier einmal eine Query machen um zu sehen welche types existieren. Gibt es eine einfachere Lösung? 

SELECT 
	DISTINCT type
FROM 
	titles
ORDER 
	BY type;

-- business
SELECT 
	SUM(ytd_sales)
FROM 
	titles
WHERE 
	type = "business";

-- popular_comp
SELECT 
	SUM(ytd_sales)
FROM 
	titles
WHERE 
	type = "popular_comp";

-- 16. What's the title and the price of the most expensive book?

SELECT title, price 
	FROM titles
		ORDER BY price DESC
			LIMIT 1;

-- 17. What's the price of the most expensive psychology book?

SELECT title, price, type
	FROM titles
		WHERE type = 'psychology'
			ORDER BY price DESC
				LIMIT 1;

-- 18. How many authors live in either San Jose or Salt Lake City

 -- Aufgabe 18 
 
SELECT
	COUNT(au_id)
FROM 
	authors
WHERE 
	city = "San Jose" OR "Salt Lake City";
    -- Ich hab hier city vergessen und deswegen erkennt MySql nur San Jose und zählt deswegen nur 1 
    
SELECT 
	COUNT(au_id)
FROM 
	authors
WHERE 
	city = 'San Jose' OR city = 'Salt Lake City';
   
