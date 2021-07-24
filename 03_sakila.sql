use sakila; 
-- 1. What query would you run to get all the customers inside city_id = 312? 
-- Your query should returm customer first name, last name, email, and address.
SELECT a.first_name, a.last_name, a.email, b.address, b.address2, c.city
FROM customer a, address b, city c 
WHERE a.address_id=b.address_id AND b.city_id=c.city_id 
AND b.city_id= 312;
 
-- 2. What query would you run to get all comedy films? Your query would return 
-- film title, description, release year, rating, special features and genre.
SELECT a.title, a.description, a.release_year, a.rating, a.special_features, 
c.name as genre FROM film a, film_category b, category c 
WHERE a.film_id=b.film_id AND b.category_id=c.category_id and c.name='Comedy'; 

-- 3. What query would you run to get all the films joined by actor_id=5? 
-- Your query shoud return the film title, description and release year.
SELECT c.actor_id, c.first_name, c.last_name, a.title, a.description, a.release_year
FROM film a, film_actor b, actor c
WHERE a.film_id=b.film_id AND b.actor_id=c.actor_id AND b.actor_id=5;

-- 4. What query would you run to get all the customers in store_id = 1 and inside 
-- these cities (1, 42, 312 and 459)? Your query should return customer first name, 
-- last name, email, and address.
SELECT a.first_name, a.last_name, a.email, b.address, b.address2 
FROM customer a, address b
WHERE a.address_id=b.address_id AND  b.city_id IN (1,42,312,459) AND a.store_id=1;

-- 5. What query would you run to get all the films with a rating = G and special 
-- feature = behind the scenes, joined by actor_id = 15? Your query shoud return 
-- the film title, description, release year, rate and special feature.
SELECT a.title, a.description, a.release_year, a.rating, a.special_features
FROM film a, film_actor b, actor c
WHERE a.film_id=b.film_id AND b.actor_id=c.actor_id AND b.actor_id=15
AND a.rating='G' AND special_features LIKE '%Behind the scene%';

-- 6. What query would you run to get all the actors that joined in the film_id = 369? 
-- Your query should return the first_name, last name and last_update of the actors.
SELECT a.first_name, a.last_name, a.last_update 
FROM actor a, film_actor b
WHERE a.actor_id=b.actor_id AND b.film_id=369;

-- 7. What query would you run to get all drama films with a rental rate of 2.99 ? 
-- Your query should return film title, description, release year, rating, special 
-- features and genre.
SELECT a.title, a.description, a.release_year, a.rating, a.special_features, c.name
FROM film a, film_category b, category c
WHERE a.film_id = b.film_id AND b.category_id = c.category_id 
AND c.name = "Drama" AND a.rental_rate=2.99;

-- 8. What query would you run to get all the action films joined by SANDRA KILMER. 
-- Your query should return film title, description, release year, rating, special 
-- features, genre and actor's first name and last name.
SELECT a.title, concat(d.first_name," ",d.last_name) as Actor_Name, a.description, 
a.release_year, a.special_features, c.name 
FROM film a, film_category b, category c, actor d, film_actor e
WHERE a.film_id=b.film_id AND b.category_id=c.category_id AND a.film_id=e.film_id 
AND e.actor_id = d.actor_id AND c.name="Action" 
AND d.first_name="Sandra" AND d.last_name="Kilmer"
