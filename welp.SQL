-- Let’s see what these tables contain
SELECT * FROM places;
SELECT * FROM reviews;

-- If each dollar sign ($) represents $10, how could you find all places that cost $20 or less?
SELECT *
FROM places
WHERE price_point IN ('$', '$$');

-- Do an INNER JOIN on the two tables to show all reviews for restaurants that have at least one review.
SELECT *
FROM places
INNER JOIN reviews
  ON places.id = reviews.place_id;

-- Modify your previous query to select only the most important columns in order to display a log of reviews:
SELECT 
  p.name,
  p.average_rating,
  r.username,
  r.rating,
  r.review_date,
  r.note
FROM places p
INNER JOIN reviews r
  ON p.id = r.place_id;

-- Now write a query to do a LEFT JOIN on the tables, selecting the same columns as the previous question
-- How are the results of this query different?
-- This query includes places that do not have any reviews
SELECT 
  p.name,
  p.average_rating,
  r.username,
  r.rating,
  r.review_date,
  r.note
FROM places p
LEFT JOIN reviews r
  ON p.id = r.place_id;

-- Write a query to find all the ids of places that currently do not have any reviews in our reviews tabl
SELECT p.id, p.name
FROM places p
LEFT JOIN reviews r
  ON p.id = r.place_id
WHERE r.id IS NULL;

-- Write a query using the WITH clause to select all the reviews that happened in 2020. JOIN the places to your WITH query to see a log of all reviews from 2020.
WITH reviews_2020 AS (
  SELECT *
  FROM reviews
  WHERE STRFTIME('%Y', review_date) = '2020'
)
SELECT *
FROM reviews_2020 r
JOIN places p
  ON p.id = r.place_id;

-- Businesses want to be on the lookout for …ahem… difficult reviewers. Write a query that finds the reviewer with the most reviews that are BELOW the average rating for places
SELECT r.username,
      COUNT(r.rating < p.average_rating) AS 'below_average_ratings'
FROM reviews r
JOIN places p
  ON r.place_id = p.id
GROUP BY r.username
ORDER BY 2 DESC
LIMIT 1;


