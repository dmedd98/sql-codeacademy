 -- What are the column names?
 SELECT *
 FROM met
 LIMIT 10;

 -- How many pieces are in the American Decorative Art collection?
 SELECT COUNT(*) AS '# of pieces'
 FROM met;

 -- Count the number of pieces where the category includes ‘celery’.
SELECT COUNT(*) AS 'Celery Count'
FROM met
WHERE category LIKE '%celery%';

-- Find the title and medium of the oldest piece(s) in the collection
SELECT title, medium, date
FROM met
ORDER BY date ASC
LIMIT 1;

-- Find the top 10 countries with the most pieces in the collection.
SELECT country, COUNT(*)
FROM met
WHERE country IS NOT NULL
GROUP BY country
ORDER BY COUNT(*) DESC
LIMIT 10;

-- Find the categories HAVING more than 100 pieces.
SELECT category, COUNT(*)
FROM met
GROUP BY category
HAVING COUNT(*) > 100
ORDER BY 2 DESC;

-- Count the number of pieces where the medium contains ‘gold’ or ‘silver’.
SELECT medium, COUNT(*)
FROM met
WHERE medium LIKE '%gold%'
OR medium LIKE '%silver%'
GROUP BY 1
ORDER BY 2 DESC;
