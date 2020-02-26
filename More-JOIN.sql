--1
SELECT id, title
FROM movie
WHERE yr=1962;
--2
SELECT yr
FROM movie
WHERE title='Citizen Kane';
--3
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;
--4
SELECT id
FROM actor
WHERE name='Glenn Close';
--5
SELECT id
FROM movie
WHERE title='Casablanca';
--6
SELECT name FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid
WHERE movie.id = (SELECT id FROM movie WHERE title = 'Casablanca');
--7
SELECT name FROM actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid
WHERE movie.id = (SELECT id FROM movie WHERE title = 'Alien');
--8
SELECT movie.title FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE casting.actorid = (SELECT actor.id FROM actor WHERE name = 'Harrison Ford');
--9
SELECT movie.title FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE casting.actorid = (SELECT actor.id FROM actor WHERE name = 'Harrison Ford') AND casting.ord != 1;
--10
SELECT movie.title, actor.name FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE movie.yr = 1962 
AND casting.ord = 1;
--11
SELECT yr,COUNT(title) FROM
movie JOIN casting ON movie.id=movieid
JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;
--12
SELECT movie.title, actor.name FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE movie.id IN 
(SELECT casting.movieid FROM casting WHERE casting.actorid IN 
  (SELECT actor.id FROM actor WHERE name = 'Julie Andrews')) 
AND casting.ord = 1
GROUP BY movie.title;
--13
SELECT actor.name
FROM casting
JOIN actor ON casting.actorid = actor.id
WHERE casting.ord = 1 
GROUP BY casting.actorid
HAVING COUNT(casting.ord) >= 15
ORDER BY actor.name;
--14
SELECT movie.title, COUNT(casting.actorid)
FROM casting
JOIN movie ON casting.movieid = movie.id
WHERE yr = 1978
GROUP BY movie.title
ORDER BY COUNT(casting.actorid) DESC, movie.title;
--15
SELECT actor.name
FROM casting
JOIN actor ON casting.actorid = actor.id
WHERE casting.movieid IN (SELECT casting.movieid
  FROM casting
  JOIN actor ON casting.actorid = actor.id
  WHERE actor.name = 'Art Garfunkel')
AND actor.name != 'Art Garfunkel';
