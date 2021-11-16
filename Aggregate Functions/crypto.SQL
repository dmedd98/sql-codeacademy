 --What are the column names?
 SELECT *
 FROM transactions;

 -- What is the total money_in in the table?
 SELECT SUM(money_in) AS 'Total $ In'
 FROM transactions;

 -- What is the total money_out in the table?
 SELECT SUM(money_out) AS 'Total $ Out'
 FROM transactions;

--How many money_in transactions are in this table?
--How many money_in transactions are in this table where ‘BIT’ is the currency?
SELECT COUNT(*) AS 'total transactions'
FROM transactions
WHERE money_in IS NOT NULL;

SELECT COUNT(*) AS 'Bitcoin Transactions'
FROM transactions
WHERE money_in IS NOT NULL
AND currency = 'BIT';

-- What was the largest transaction in this whole table?
SELECT MAX(money_in)
FROM transactions;
SELECT MAX(money_out)
FROM transactions;

-- What is the average money_in in the table for the currency Ethereum (‘ETH’)?
SELECT AVG(money_in)
FROM transactions
WHERE currency = 'ETH';

-- Select date, average money_in, and average money_out from the table.
-- And group everything by date
-- Round the averages to 2 decimal places.
-- Give the column aliases using AS for readability
SELECT 
  date, 
  ROUND(AVG(money_in), 2) AS 'Average Money In',
  ROUND(AVG(money_out), 2) AS 'Average Money Out'
FROM transactions
GROUP BY 1;



