--1
SELECT name FROM world
WHERE population >
(SELECT population FROM world
  WHERE name='Russia');
--2
SELECT name FROM world
WHERE gdp/population >
(SELECT gdp/population FROM world
  WHERE name='United Kingdom')
AND continent = 'Europe';
--3
SELECT name,continent FROM world
WHERE continent = (SELECT continent FROM world
  WHERE name = 'Argentina')
OR continent = (SELECT continent FROM world
  WHERE name = 'Australia')
ORDER BY name;
--4
SELECT name,population FROM world
WHERE population > (SELECT population FROM world
  WHERE name = 'Canada')
AND population < (SELECT population FROM world
  WHERE name = 'Poland');
--5
SELECT name, CONCAT(ROUND(population/(SELECT population FROM world
      WHERE name = 'Germany')*100),'%')
FROM world
WHERE continent = 'Europe';
--6
SELECT name
FROM world
WHERE gdp >= ALL(SELECT gdp
  FROM world
  WHERE gdp > 0 AND continent = 'Europe')
AND continent != 'Europe';
--7
SELECT continent, name, area FROM world x
WHERE area >= ALL
(SELECT area FROM world y
  WHERE y.continent=x.continent
  AND area>0);
--8
SELECT continent, name
FROM world
WHERE name = (SELECT MIN(name) FROM world WHERE continent = 'Africa')
OR name = (SELECT MIN(name) FROM world WHERE continent = 'Asia')
OR name = (SELECT MIN(name) FROM world WHERE continent = 'Caribbean')
OR name = (SELECT MIN(name) FROM world WHERE continent = 'Eurasia')
OR name = (SELECT MIN(name) FROM world WHERE continent = 'Europe')
OR name = (SELECT MIN(name) FROM world WHERE continent = 'North America')
OR name = (SELECT MIN(name) FROM world WHERE continent = 'Oceania')
OR name = (SELECT MIN(name) FROM world WHERE continent = 'South America')
ORDER BY continent;
--9
SELECT name, continent, population FROM world a
WHERE 25000000 >= ALL (SELECT population FROM world b WHERE a.continent = b.continent AND population > 0);
--10
SELECT name, continent
FROM world x
WHERE population/3 >= ALL
(SELECT population
  FROM world y
  WHERE y.continent=x.continent
  AND x.name != y.name);
