USE sakila;

## Consultas básicas sobre la BD 
SELECT * FROM actor LIMIT 10; 

## Filtros sobre la tabla actores
SELECT * FROM actor 
WHERE first_name = 'JOHNNY';

# Consultar todas las peliculas que demoran dos horas o mas
SELECT * FROM film
WHERE length >= 120;

# Consultar todas las peliculas que empiezan por la letra A
SELECT * FROM film
WHERE title LIKE '%A'
ORDER BY length DESC;

# Consultar todas las peliculas que tienen menos de 10 caracteres en el titulo
SELECT title, LENGTH(title) FROM film
WHERE LENGTH(title) < 10;

SELECT first_name, last_name
FROM actor
ORDER BY first_name DESC;

## Ordenar los datos por nombre ascendente y apellido descendente
SELECT first_name, last_name
FROM actor
ORDER BY first_name ASC, last_name DESC ;


##---------------------------------------
## Insertar un nuevo actor
INSERT INTO actor (first_name, last_name)
VALUES ('CRISTIAN','SAINEA');

## Colombia es el numero 24
INSERT INTO city (city, country_id)
VALUES ('Ciudad Gotica',24);

##---------------------------------------
## Actualizar del actor recien ingresado

UPDATE actor
SET 
first_name = 'SYLVESTER',
last_name = 'STALLONE'
WHERE actor_id = '201';


##---------------------------------------
## Borrar el actor recien ingresado
START TRANSACTION; 
DELETE FROM actor
WHERE actor_id = 201;

SELECT * FROM Actor

COMMIT;


#----------------------------
## Agregaciones
SELECT COUNT(first_name) FROM actor;

SELECT COUNT(DISTINCT first_name) FROM actor;

SELECT rating, SUM(rental_duration) FROM film
GROUP BY rating;

## Muestreme los ratings de peliculas con un promedio de duración mayor a 115
SELECT rating, avg(length) FROM film
# WHERE length > 115 NO VA EL WHERE
GROUP BY rating
HAVING avg(length) > 115;

SELECT rental_duration, rating, AVG(length) FROM film
GROUP BY rental_duration, rating;
#-----------------------




#¿Hay paises que no tienen ninguna ciudad asociada?
SELECT * FROM country AS t1
LEFT JOIN city AS t2 ON t1.country_id = t2.country_id
WHERE t2.city_id IS NULL

SELECT * FROM city;





SELECT actor.first_name, actor.last_name, film.title FROM film_actor
JOIN film ON film_actor.film_id = film.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id;

# Cuantos actores hay en cada pelicula?
SELECT film.title , COUNT(actor.first_name)FROM film_actor
JOIN film ON film_actor.film_id = film.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
GROUP BY film.title; 

# Hay peliculas que no tengan actores?
SELECT film_actor.actor_id, film.film_id, film.title FROM film_actor
RIGHT JOIN film ON film_actor.film_id = film.film_id
WHERE film_actor.actor_id IS NULL;


# Hay actores que no este en ninguna pelicula?
SELECT film_actor.film_id, actor.actor_id, actor.first_name FROM film_actor
RIGHT JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE film_actor.film_id IS NULL;

SELECT * FROM film_actor;