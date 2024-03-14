
-- 1 List the number of films per category.
SELECT c.name AS category_name, COUNT(film_id) AS number_of_films
FROM film_category fc
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

-- 2 Retrieve the store ID, city, and country for each store.
SELECT s.store_id, ci.city, co.country
FROM store AS s
JOIN address AS a ON s.address_id = a.address_id
JOIN city AS ci ON a.city_id = ci.city_id
JOIN country AS co ON ci.country_id = co.country_id;


-- 3 Calculate the total revenue generated by each store in dollars.

SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM store AS s
JOIN address AS a ON s.address_id = a.address_id
JOIN customer AS c ON s.store_id = c.store_id
JOIN payment AS p ON c.customer_id = p.customer_id
GROUP BY s.store_id, a.address;

-- Determine the average running time of films for each category.

SELECT AVG(f.length) AS Running_time,  c.name AS category_name
FROM film_category fc
JOIN film f ON fc.film_id = f.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;