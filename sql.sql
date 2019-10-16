-- Read this article. Take a moment and reflect on the implications of how and week SQL
-- executes in the order that it does. Then look at the following examples, and
-- write out in order /explain what order the code runs. 
-- BONUS: after you've going through once and done either (write out/explain)
-- try to go back and do the other.

-- EXAMPLE:
SELECT film_id, title, actor_id
FROM film JOIN film_actor
WHERE language_id = 1 AND
	  rating = 'G'
ORDER BY film_id;

-- ANSWER:
1 - film JOIN film_actor
2 - FROM #1
3 - WHERE language_id = 1 AND rating = 'G'
4 - SELECT *
5 ORDER BY film_id;

-- Alternative answer:
-- We first take the film table and join it to the film_actor table as the base 
-- table for the query. That is then filtered by the WHERE clause to only rows 
-- that have both language_id #1 AND rated 'G'. From that, film_id, title, and 
-- actor_id are selected (/returned), and the results are ordered by film_id.
  
https://jvns.ca/blog/2019/10/03/sql-queries-don-t-start-with-select/
  
  

SELECT payment_date 
From payment
WHERE payment_date > '2007-05-01'
ORDER BY payment_date DESC;

1 - from payment >>> where is data coming from?
2 - WHERE payment_date > '2007-05-01' >>> removes unecessary rows to look at based on filter
3 - SELECT payment_date >>> drops unecessary columns 
4 - ORDER BY payment_date DESC >>> sorts out data left


SELECT payment_id, payment_date
From payment
WHERE amount < 3;

1 - from payment >>> where is data coming from?
2 - WHERE amount < 3 >>> removes unecessary rows to look at based on filter
3 - SELECT payment_id, payment_date >>> drops unecessary columns


SELECT customer_id, email, active
From customer
WHERE store_id = 1 AND active = 0
ORDER BY last_update;

1 - From customer >>> where is data coming from?
2 - WHERE store_id = 1 AND active = 0 >>> removes unecessary rows to look at based on filter
3 - SELECT customer_id, email, active >> drops unecessary columns 
4 - ORDER BY last_update >>> sorts out data left

-- THESE TWO ARE A BIT TRICKIER
SELECT c.name, COUNT(f.film_id) as total
FROM film as f
JOIN film_category AS fc  ON f.film_id=fc.film_id
JOIN category AS c ON fc.category_id=c.category_id
GROUP BY c.category_id
ORDER BY total DESC ;

1 - FROM film as f JOIN film_category AS fc  ON f.film_id=fc.film_id JOIN category AS c ON fc.category_id=c.category_id >>>> where is data coming from?
2 - GROUP BY c.category_id >> changes format of data pulled
3 - SELECT c.name, COUNT(f.film_id) as total >>> removes unecessary columns
4 - ORDER BY total DESC >>> sorts out data left


SELECT *
FROM payment
WHERE amount > (SELECT AVG(amount) FROM payment);


1 - SELECT AVG(amount) FROM payment >> must run first to be able to use it. Another source of data. 
2 - FROM payment >>> second source of data established
3 - WHERE amount > (X) >>> removes unecessary rows to look at based on filter
4 - SELECT * >>> remove unecessary columns, if any

