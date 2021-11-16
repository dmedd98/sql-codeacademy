-- What are the column names of each table?
SELECT * FROM users LIMIT 10;
SELECT * FROM posts LIMIT 10;
SELECT * FROM subreddits LIMIT 10;

-- Write a query to count how many different subreddits there are.
SELECT COUNT(DISTINCT(name)) AS 'Subreddit Count'
FROM subreddits;

-- What user has the highest score?
-- What post has the highest score?
-- What are the top 5 subreddits with the highest subscriber_count?
SELECT username, score
FROM users
ORDER BY score DESC
LIMIT 1;
SELECT title, score
FROM posts
ORDER BY score DESC
LIMIT 1;
SELECT name 
FROM subreddits
ORDER BY subscriber_count DESC
LIMIT 5;

-- Use a LEFT JOIN with the users and posts tables to find out how many posts each user has made. Have the users table as the left table and order the data by the number of posts in descending order.
SELECT 
      users.username,
      COUNT(posts.id) AS 'posts'
FROM users
LEFT JOIN posts
ON users.id = posts.user_id
GROUP BY users.id
ORDER BY 2 DESC;

-- We only want to see existing posts where the users are still active, so use an INNER JOIN to write a query to get these posts. Have the posts table as the left table.
SELECT *
FROM posts p
INNER JOIN users u
  ON p.user_id = u.id;

-- Some new posts have been added to Reddit!
-- Stack the new posts2 table under the existing posts table to see them
SELECT * FROM posts
UNION
SELECT * FROM posts2;

-- Now you need to find out which subreddits have the most popular posts. We’ll say that a post is popular if it has a score of at least 5000. We’ll do this using a WITH and a JOIN
WITH popular_posts AS (
  SELECT * FROM posts
  WHERE score >= 5000
) 
SELECT s.name, pp.title, pp.score
FROM popular_posts pp
JOIN subreddits s
  ON pp.subreddit_id = s.id
ORDER BY pp.score DESC;

-- Next, you need to find out the highest scoring post for each subreddit.
SELECT s.name, p.title, MAX(p.score) AS 'highest_score'
FROM posts p
JOIN subreddits s
  ON p.subreddit_id = s.id
GROUP BY s.name;

-- Finally, you need to write a query to calculate the average score of all the posts for each subreddit
SELECT s.name, AVG(p.score) AS 'Average Score'
FROM subreddits s
JOIN posts p
  ON s.id = p.subreddit_id
GROUP BY s.name
ORDER BY 2 DESC;





