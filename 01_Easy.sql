-- testing the db's restored data

SELECT * FROM album
LIMIT 1;

SELECT * FROM Album
LIMIT 2;

SELECT * FROM ALbuM
LIMIT 3;

-- NOTE : Table name are case insensitive 








-- =============== Question Set 1 - Easy

-- 1. Who is the senior most employee ?
-- Question is for employee so mostly we will get the answer in employee table


SELECT * FROM employee
ORDER BY hire_date asc
LIMIT 1;


-- 2. Which countries have the most Invoices? 
-- Question if for invoice and country we need to find a table that has both or related.

SELECT * FROM INVOICE;
-- INVOICE has column billing country which will help in our question 
-- as we just need the max count 

-- Top 1
SELECT billing_country, COUNT(billing_country) AS c
FROM invoice
GROUP BY (billing_country)
ORDER BY c DESC
LIMIT 1;

-- Top 3
SELECT billing_country, COUNT(billing_country) AS c
FROM invoice
GROUP BY (billing_country)
ORDER BY c DESC
LIMIT 3;


-- 3. What are top 3 values of total invoice? 

SELECT total FROM invoice
ORDER BY total DESC
LIMIT 3;


-- 4. Which city has the best customers? We would like to throw a promotional Music 
-- Festival in the city we made the most money. Write a query that returns one city that 
-- has the highest sum of invoice totals. Return both the city name & sum of all invoice 
-- totals

SELECT billing_city AS c, SUM(total) AS t 
FROM invoice
GROUP BY c
ORDER BY t DESC;


-- 5. Who is the best customer? The customer who has spent the most money will be 
-- declared the best customer. Write a query that returns the person who has spent the 
-- most money 

SELECT * FROM invoice
SELECT * FROM customer

SELECT customer_id, sum(total) as t
FROM invoice
GROUP BY customer_id
ORDER BY t DESC;

-- Final answers
SELECT c.customer_id, c.first_name, SUM(total) AS t
FROM invoice as i
JOIN customer as c
ON i.customer_id = c.customer_id
GROUP BY c.customer_id
ORDER BY t DESC
LIMIT 1;

