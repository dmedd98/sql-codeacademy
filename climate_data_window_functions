-- Let’s see what our table contains
SELECT * FROM state_climate LIMIT 10;
-- Let’s start by looking at how the average temperature changes over time in each state.
SELECT 
  state,
  year,
  ROUND(tempf, 3) AS 'AVG_temp',
  ROUND(AVG(tempf) OVER (
    PARTITION BY state
    ORDER BY year
  ), 3) AS 'Running_AVG_temp'
FROM state_climate
LIMIT 10;
-- let’s explore the lowest temperatures for each state.
SELECT
  state,
  year,
  ROUND(MIN(tempf), 3) AS 'Lowest_Temp_F'
FROM
  state_climate
GROUP BY state;
-- now we will also return the highest temperature (highest_temp) for each state.
SELECT
  state,
  year,
  ROUND(MAX(tempf), 3) AS 'Highest_temp'
FROM
  state_climate
GROUP BY state;
-- Write a query to select the same columns but now you should write a window function that returns the change_in_temp from the previous year
-- show biggests shifts in yearly temp
SELECT
  state,
  year,
  tempf AS 'Temp_F',
  tempf - LAG(tempf, 1, tempf) 
  OVER (PARTITION BY state
        ORDER BY year) AS 'change_in_temp'
FROM
  state_climate
ORDER BY 4 DESC
LIMIT 20;

SELECT
  state,
  year,
  tempf AS 'Temp_F',
  tempf - LAG(tempf, 1, tempf) 
  OVER (PARTITION BY state
        ORDER BY year) AS 'change_in_temp'
FROM
  state_climate
ORDER BY 4 ASC
LIMIT 20;
-- Write a query to return a rank of the coldest temperatures on record (coldest_rank)
SELECT
  RANK() OVER (
    ORDER BY tempf
  ) as 'coldest_rank',
  state,
  year,
  tempf
FROM 
  state_climate
LIMIT 10;
-- Modify your coldest_rank query to now instead return the warmest_rank for each state, meaning your query should return the warmest temp/year for each state
SELECT
  RANK() OVER (
    PARTITION BY state
    ORDER BY tempf DESC
  ) as 'warmest_rank',
  state,
  year,
  tempf
FROM 
  (state_climate);
-- Let’s now write a query that will return the average yearly temperatures in quartiles instead of in rankings for each state
SELECT
  NTILE(4) OVER (
    PARTITION BY state
    ORDER BY tempf
  ) AS 'quartile',
  year,
  state,
  tempf
FROM
  state_climate;
-- Lastly, we will write a query that will return the average yearly temperatures in quintiles (5).
SELECT
  NTILE(5) OVER (
    ORDER by tempf
  ) AS 'quintile',
  year, state, tempf
FROM
  state_climate;

