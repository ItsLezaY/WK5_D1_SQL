--                     Week 5 - Monday Questions


-- 1. How many actors are there with the last name ‘Wahlberg’? 
-- (ans: 2)


SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';


-- 2. How many payments were made between $3.99 and $5.99? 
-- (ans: 5607)


SELECT COUNT (amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;


-- 3. What film does the store have the most of? (search in inventory)
-- (ans: Multiple films are tied at 8)


SELECT film_id, COUNT(film_id) AS occurrences
FROM inventory
GROUP BY film_id
ORDER BY occurrences DESC;


-- 4. How many customers have the last name ‘William’?
-- (ans: 0)


-- SELECT last_name
-- FROM customer                      -- Did this for my curiousity ^^;
-- ORDER BY last_name DESC;


SELECT COUNT (last_name)
FROM customer
WHERE last_name = 'William';


-- 5. What store employee (get the id) sold the most rentals?
-- (ans: 1 - 8040)


SELECT staff_id, COUNT(rental_id) AS rental_count
FROM rental
GROUP BY staff_id
ORDER BY rental_count DESC
LIMIT 1;


-- 6. How many different district names are there?
-- (ans: 378)


SELECT COUNT(DISTINCT district)
FROM address;


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- (ans: film_id 508 - 15 actors)


SELECT film_id, COUNT (film_id) AS most_actors
FROM film_actor
GROUP BY film_id
ORDER BY most_actors DESC
LIMIT 1;


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? 
-- (use customer table)
-- (ans: 13)


SELECT COUNT (customer_id) as names_ending_in_es
FROM customer
WHERE store_id = 1 AND last_name like '%es';


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals 
-- above 250 for customers with ids between 380 and 430? 
-- (use group by and having > 250)
-- (ans: 3)


SELECT amount, COUNT(rental_id) AS rental_count
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;


-- 10. Within the film table, how many rating categories are there? And what 
-- rating has the most movies total?
-- (ans: 5 ratings, PG-13 has the most)


SELECT rating, COUNT(rating) AS movie_ratings
FROM film
GROUP BY rating
ORDER BY movie_ratings DESC;

