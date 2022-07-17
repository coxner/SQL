/* Selct grabs multiple tables, From is first table we want to look in, Join says we want to combine info 
the ON is the two columns we want to match to each other
*/
SELECT *
FROM orders
JOIN subscriptions
ON orders.subscription_id = subscriptions.subscription_id;
-- Counting mathcing ID from two different tables
SELECT COUNT(*) FROM newspaper;
SELECT COUNT(*) FROM online;
SELECT COUNT(*)
FROM newspaper 
JOIN online 
  ON newspaper.id = online.id;
-- Left join keeps all the rows of the first table whether they have matching values or not omit unmatched row of second table
SELECT *
FROM newspaper
LEFT JOIN online
  ON newspaper.id = online.id 
  -- WHERE will show us which users to not subscribe to online edition
  WHERE online.id IS NULL;

-- Simple cross join of two tables
SELECT *
FROM newspaper
CROSS JOIN months;
--CROSS JOIN example grouping if a user is subscribed 
SELECT month,
   COUNT(*) AS 'subscribers'
FROM newspaper
CROSS JOIN months
WHERE start_month <= month 
   AND end_month >= month
GROUP BY month;
--Stack two tables on top of each other
SELECT * FROM newspaper
UNION
SELECT * FROM online;
--USING WITH to check the number of subscriptions of a user we can save a query to a variable name with WITH
WITH previous_query AS (SELECT customer_id,
   COUNT(subscription_id) AS 'subscriptions'
FROM orders
GROUP BY customer_id
)
SELECT customers.customer_name, 
   previous_query.subscriptions
FROM previous_query 
JOIN customers 
ON previous_query.customer_id = customers.customer_id

--Statement telling us if user is active or inactive
SELECT premium_users.user_id,
  months.months,
  CASE
    WHEN (
      premium_users.purchase_date <= months.months
      )
      AND
      (
        premium_users.cancel_date >= months.months
        OR
        premium_users.cancel_date IS NULL
      )
    THEN 'active'
    ELSE 'not_active'
  END AS 'status'
  FROM premium_users
CROSS JOIN months;

-- Using a join statement with a created query
WITH play_count AS 
(SELECT song_id,
   COUNT(*) AS 'times_played'
FROM plays
GROUP BY song_id)

SELECT songs.title, songs.artist, play_count.times_played
FROM songs
JOIN play_count
ON songs.id = play_count.song_id;

SELECT username, COUNT(*), average_rating
FROM places
LEFT JOIN reviews
ON places.id = reviews.place_id
WHERE rating < average_rating 
GROUP BY username
ORDER BY COUNT(*) DESC;
-- COunting the number of post a user made have to user order by or only one user will be shown

SELECT username, COUNT(*) AS 'Number of posts'
FROM posts
LEFT JOIN users
ON posts.user_id = users.id
GROUP BY username
ORDER BY 2 DESC;
-- Another with example
WITH popular_posts AS (
SELECT *
FROM posts
WHERE score > 5000
) 
SELECT name, title, score
FROM subreddits 
JOIN popular_posts
ON subreddits.id = popular_posts.subreddit_id
ORDER BY score DESC;
-- Selects the posts from a subreddit with the highest score 
SELECT name, MAX(score) AS 'Highest post score'
FROM posts
JOIN subreddits
ON posts.subreddit_id = subreddits.id
GROUP BY name
ORDER BY 2 desc;

-- Finding the average post score of a subreddit
SELECT name, ROUND(AVG(score),0) AS 'Average post score'
FROM posts
JOIN subreddits
ON posts.subreddit_id = subreddits.id
GROUP BY name
ORDER BY 2 desc;

--Finding projects that have been not chosen by employees comparing two tables
SELECT project_name 
FROM projects
WHERE project_id NOT IN (
   SELECT current_project
   FROM employees
   WHERE current_project IS NOT NULL);