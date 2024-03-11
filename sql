##SELECT
#Mostrar todos los registros en la tabla movies
SELECT * from movies;

#Mostrar el nombre, apellido y rating de todos los actores
SELECT first_name, last_name,rating from actors;

#Mostrar el titulo de todas las series.
SELECT title from series;

##WHERE Y ORDER BY
#Mostrar el nombre y apellido de los actores cuyo rating sea mayor a 7,5
SELECT first_name, last_name, rating from actors where rating>7.5 order by rating;

#Mostrar el titulo de las peliculas, el rating y los premios de las peliculas con un rating mayor a 7,5
SELECT title,rating,awards from movies where rating>7.5 order by rating;

#Mostrar el titulo de las peliculas y el rating ordenadas por rating en forma ascendente.alter
SELECT title,rating from movies  order by rating ASC;

#BETWEEN Y LIKE
#Mostrar el titulo y el rating de todas las peliculas cuyo titulo incluya Toy Story
SELECT title from movies where title like '%Toy Story%';

#Mostrar a todos los actores cuyos nombrs empiecen con Sam
SELECT first_name,last_name from actors where first_name like 'Sam%';

#Mostrar el titulo de las peliculas que salieron entre el '2004-01-01' y '2008-12-31'
SELECT title,release_date from movies where release_date between '2004-01-01' and '2008-12-31';

SELECT title, MIN(rating) AS min_rating
FROM moviesusuario
GROUP BY title;
