                                                -- EXERCİSE 1 --

-- Find the title of each film 
SELECT title FROM movies;

-- Find the director of each film
SELECT director FROM movies; 

-- Find the title and director of each film
SELECT title, director FROM movies; 

-- Find the title and year of each film 
SELECT title, year FROM movies; 

-- Find all the information about each film
SELECT * FROM movies; 

                                                -- EXERCİSE 2 --

-- Find the movie with a row id of 6
SELECT id, title FROM movies 
WHERE id = 6;

-- Find the movies released in the years between 2000 and 2010
SELECT title, year FROM movies
WHERE year BETWEEN 2000 AND 2010;

-- Find the movies not released in the years between 2000 and 2010
SELECT title, year FROM movies
WHERE year < 2000 OR year > 2010;

-- Find the first 5 Pixar movies and their release year
SELECT title, year FROM movies
WHERE year <= 2003;

                                                -- EXERCİSE 3 --

-- Find all the Toy Story movies
SELECT title, director FROM movies 
WHERE title LIKE "Toy Story%";

-- Find all the movies directed by John Lasseter
SELECT title, director FROM movies 
WHERE director = "John Lasseter";

-- Find all the movies (and director) not directed by John Lasseter
SELECT title, director FROM movies 
WHERE director != "John Lasseter";

-- Find all the WALL-* movies
SELECT * FROM movies 
WHERE title LIKE "WALL-_";

                                                -- EXERCİSE 4 --

-- List all directors of Pixar movies (alphabetically), without duplicates
SELECT DISTINCT director FROM movies
ORDER BY director ASC;

-- List the last four Pixar movies released (ordered from most recent to least)
SELECT title, year FROM movies
ORDER BY year DESC
LIMIT 4;

-- List the first five Pixar movies sorted alphabetically
SELECT title FROM movies
ORDER BY title ASC
LIMIT 5;

-- List the next five Pixar movies sorted alphabetically 
SELECT title FROM movies
ORDER BY title ASC
LIMIT 5 OFFSET 5;

                                                -- SQL REVİEW --

-- List all the Canadian cities and their populations 
SELECT city, population FROM north_american_cities
WHERE country = "Canada";

-- Order all the cities in the United States by their latitude from north to south
SELECT city, latitude FROM north_american_cities
WHERE country = "United States"
ORDER BY latitude DESC;

-- List all the cities west of Chicago, ordered from west to east
SELECT city, longitude FROM north_american_cities
WHERE longitude < -87.629798
ORDER BY longitude ASC;

-- List the two largest cities in Mexico (by population) 
SELECT city, population FROM north_american_cities
WHERE country LIKE "Mexico"
ORDER BY population DESC
LIMIT 2;

-- List the third and fourth largest cities (by population) in the United States and their population 
SELECT city, population FROM north_american_cities
WHERE country LIKE "United States"
ORDER BY population DESC
LIMIT 2 OFFSET 2;

                                            -- EXERCİSE 6 --

-- Find the domestic and international sales for each movie 
SELECT title, domestic_sales, international_sales
FROM movies
    JOIN boxoffice
        ON movies.id = boxoffice.movide_id;

-- Show the sales numbers for each movie that did better internationally rather than domestically
SELECT title, domestic_sales, international_sales
FROM movies
    JOIN boxoffice
        ON movies.id = boxoffice.movide_id
WHERE international_sales > domestic_sales;

-- List all the movies by their ratings in descending order
SELECT title, rating
FROM movies
    JOIN boxoffice
        ON movies.id = boxoffice.movide_id
ORDER BY rating DESC;

                                            -- EXERCİSE 7 --

-- Find the list of all buildings that have employees 
SELECT DISTINCT building FROM employees;

-- Find the list of all buildings and their capacity
SELECT * FROM buildings;

-- List all buildings and the distinct employee roles in each building (including empty buildings) 
SELECT DISTINCT building_name, role
FROM buildings
    LEFT JOIN employees
    ON building_name = building;


                                            -- EXERCİSE 8 --

-- Find the name and role of all employees who have not been assigned to a building
SELECT name, role FROM employees
WHERE building IS NULL;

-- Find the names of the buildings that hold no employees
SELECT DISTINCT building_name
FROM buildings 
  LEFT JOIN employees
    ON building_name = building
WHERE role IS NULL;


                                            -- EXERCİSE 9 --

-- List all movies and their combined sales in millions of dollars
SELECT title, (domestic_sales + international_sales) / 1000000 AS gross_sales_millions
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

-- List all movies and their ratings in percent
SELECT title, rating * 10 AS rating_percent
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id;

-- List all movies that were released on even number years
SELECT title, year
FROM movies
WHERE year % 2 = 0;


                                            -- EXERCİSE 10 --

-- Find the longest time that an employee has been at the studio
SELECT MAX(years_employed) as Max_years_employed
FROM employees;

-- For each role, find the average number of years employed by employees in that role 
SELECT role, AVG(years_employed) as Average_years_employed
FROM employees
GROUP BY role;

-- Find the total number of employee years worked in each building
SELECT building, SUM(years_employed) as Total_years_employed
FROM employees
GROUP BY building;


                                            -- EXERCİSE 11 --

-- Find the number of Artists in the studio (without a HAVING clause)
SELECT role, COUNT(*) as Number_of_artists
FROM employees
WHERE role = "Artist";

-- Find the number of Employees of each role in the studio
SELECT role, COUNT(*)
FROM employees
GROUP BY role;

-- Find the total number of years employed by all Engineers 
SELECT role, SUM(years_employed)
FROM employees
GROUP  BY role
HAVING role = "Engineer"


                                            -- Exercise 12 --

-- Find the number of movies each director has directed
SELECT director, COUNT(id) as Num_movies_directed
FROM movies
GROUP BY director;

-- Find the total domestic and international sales that can be attributed to each director
SELECT director, SUM(domestic_sales + international_sales) as Cumulative_sales_from_all_movies
FROM movies
    INNER JOIN boxoffice
        ON movies.id = boxoffice.movide_id
GROUP BY director;


                                            -- EXERCİSE 13 --

-- Add the studio's new production, Toy Story 4 to the list of movies (you can use any director)
INSERT INTO movies VALUES (4, "Toy Story 4", "El Directore", 2015, 90);

-- Toy Story 4 has been released to critical acclaim! It had a rating of 8.7,
-- and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table
INSERT INTO boxoffice VALUES (4, 8.7, 340000000, 270000000);


                                            -- EXERCİSE 14 --

-- The director for A Bug's Life is incorrect, it was actually directed by John Lasseter
UPDATE movies
SET director = "John Lasseter"
WHERE id = 2

-- The year that Toy Story 2 was released is incorrect, it was actually released in 1999
UPDATE movies
SET year = 1999
WHERE id = 3;

-- Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich
UPDATE movie
SET title = "Toy Story 3", director = "Lee Unkrich"
Where id = 11;

                                            -- EXERCİSE 15 --

-- This database is getting too big, lets remove all movies that were released before 2005
DELETE FROM movies
WHERE year < 2005;

-- Andrew Stanton has also left the studio, so please remove all movies directed by him
DELETE FROM movies
WHERE director = "Andrew Stanton";


                                            -- EXERCİSE 16 --

-- Create a new table named Database with the following columns:
-- Name A string (text) describing the name of the database
-- Version A number (floating point) of the latest version of this database
-- Download_count An integer count of the number of times this database was downloaded
-- This table has no constraints.
CREATE TABLE Database (
    Name TEXT,
    Version FLOAT,
    Download_count INTEGER
);


                                            -- EXERCİSE 17 --

-- Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in.
ALTER TABLE movies
    ADD COLUMN Aspect_ratio FLOAT DEFAULT 2.39;

-- Add another column named Language with a TEXT data type to store the language that the movie was released in. 
-- Ensure that the default for this language is English.
ALTER TABLE movies
    ADD COLUMN Language TEXT DEFAULT "English";


                                            -- EXERCİSE 18 --


