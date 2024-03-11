SELECT * from genres;
SELECT * from series;

SELECT s.title, g.name from series s,genres g where s.genre_id=g.id;

#Por otro lado, necesitamos listar los títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada uno de ellos.
SELECT * FROM actors;
SELECT * FROM actor_episode;
SELECT * FROM episodes;

SELECT (SELECT concat(first_name,' ',last_name) FROM actors WHERE id=actor_id) AS Actor,
       (SELECT title FROM episodes WHERE id=episode_id) AS episode
FROM actor_episode order by 2;

#Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices que su película favorita sea cualquiera de la saga de La Guerra de las Galaxias.
SELECT first_name,last_name, (SELECT title FROM movies WHERE id=favorite_movie_id) AS movie
FROM actors 
WHERE favorite_movie_id IN (SELECT id FROM movies WHERE title LIKE '%La Guerra de las Galaxias%');

#Para nuestro próximo desafío, necesitamos obtener a todos los actores o actrices que han trabajado en cualquier película de la saga de La Guerra de las Galaxias.


SELECT a.first_name,a.last_name, (SELECT m.title FROM movies m WHERE m.id = am.movie_id) AS Movie
FROM actors a, 
    actor_movie am
WHERE 
    EXISTS (
        SELECT 1 
        FROM movies m 
        WHERE m.id = am.movie_id 
        AND m.title LIKE 'La Guerra de las Galaxias%'
    )
    AND a.id = am.actor_id;

# Crear un listado a partir de la tabla de películas, mostrar un reporte de la cantidad de películas por nombre de género. 
SELECT genres.name, COUNT(movies.id)
FROM movies,genres
WHERE movies.genre_id = genres.id
GROUP BY genres.id;

SELECT genres.name, COUNT(movies.id)
FROM movies
INNER JOIN genres ON movies.genre_id = genres.id
GROUP BY genres.id;