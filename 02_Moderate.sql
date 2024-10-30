-- =============== Question Set 2 – Moderate 

-- 1. Write query to return the email, first name, last name, & Genre of all Rock Music 
-- listeners. Return your list ordered alphabetically by email starting with A

-- listeners : customers
-- customers who listen Rock Music
-- Get email, first name, last name, : of these customers having genre rock

-- name and email are in customer table 
-- we have to use inner join and connect multiple table to get the rock genre

SELECT * FROM genre
WHERE NAME LIKE '%Rock%';


/*
SELECT DISTINCT first_name, last_name, email
FROM customer AS c
JOIN invoice AS i ON c.customer_id = i.customer_id
JOIN invoice_line AS iline ON iline.invoice_id = i.invoice_id
WHERE track_id IN (
	SELECT track_id FROM track
	JOIN genre
	ON track.genre_id = genre.genre_id
	WHERE genre.name LIKE 'Rock'
)
ORDER BY email;
*/

SELECT * FROM customer
LIMIT 3;
SELECT * FROM invoice
LIMIT 3;
SELECT * FROM track
LIMIT 3;
SELECT * FROM invoice_line
LIMIT 3;
SELECT * FROM genre
LIMIT 3;

SELECT DISTINCT first_name, last_name, email
FROM customer AS c
JOIN invoice AS i ON c.customer_id = i.customer_id
JOIN invoice_line AS il ON il.invoice_id = i.invoice_id
WHERE track_id IN (
	SELECT track_id 
	FROM track as t
	JOIN genre as g
	ON t.genre_id = g.genre_id
	WHERE g.name LIKE 'Rock'
)
ORDER BY email



-- 2. Let's invite the artists who have written the most rock music in our dataset. 
-- Write a query that returns the Artist name and total track count of the top 10 rock bands 

SELECT * FROM track
LIMIT 2;

SELECT * FROM  genre
LIMIT 2;

SELECT count(*) FROM track
WHERE genre_id = '1';

SELECT t.album_id, count(*) as total_count
FROM track AS t
JOIN genre AS g
ON t.genre_id = g.genre_id
WHERE g.genre_id = '1'
GROUP BY album_id
ORDER BY total_count DESC;

SELECT t.album_id, art.name, count(*) as total_count
FROM track AS t
JOIN genre AS g ON t.genre_id = g.genre_id
JOIN album AS al ON al.album_id = t.album_id
JOIN artist AS art ON art.artist_id = al.album_id
WHERE g.genre_id = '1'
GROUP BY t.album_id
ORDER BY total_count DESC;

select * from album
where album_id = '141';

-- Final Answer
SELECT artist.artist_id, artist.name, count(artist.artist_id) AS total_count 
from track 
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON track.genre_id = genre.genre_id
where genre.name like 'Rock'
GROUP BY artist.artist_id
ORDER BY total_count DESC
limit 10;


-- 3. Return all the track names that have a song length longer than the average song length. 
-- Return the Name and Milliseconds for each track. Order by the song length with the 
-- longest songs listed first 

SELECT * FROM track;

select name, Milliseconds 
from track
where Milliseconds > (
	select avg(Milliseconds) 
	from track 
)
order by milliseconds DESC

