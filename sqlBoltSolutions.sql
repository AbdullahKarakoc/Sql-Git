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