/*
PARTITION BY is a subclause of the OVER clause and divides a query’s result set into parts. It’s very similar to 
GROUP BY except it does not reduce the number of rows returned.
*/




SELECT 
   month,
   change_in_followers,
   SUM(change_in_followers) OVER (
      ORDER BY month
   ) AS 'running_total',
   AVG(change_in_followers) OVER (
      ORDER BY month
   ) AS 'running_avg',
   COUNT(change_in_followers) OVER (
      ORDER BY month
   ) AS 'running_count'
FROM
   social_media
WHERE
   username = 'instagram';


SELECT 
    username,
    month,
    change_in_followers,
    SUM(change_in_followers) OVER (
      PARTITION BY username 
      ORDER BY month
    ) 'running_total_followers_change',
    AVG(change_in_followers) OVER (
      PARTITION BY username 
      ORDER BY month
    ) 'running_avg_followers_change'
FROM
    social_media;


/* 
This query should look familiar overall as it follows the standard window function format, however, we are using FIRST_VALUE now for posts. This means our window function will pull the first value from the posts column.
OVER (PARTITION BY username ORDER BY posts) fewest_posts: here we can see that posts is going to be pulled based on username due to the PARTITION BY. We are naming this column fewest_posts because of the ORDER BY which defaults to ascending order.
*/
SELECT
   username,
   posts,
   FIRST_VALUE (posts) OVER (
      PARTITION BY username 
      ORDER BY posts
   ) fewest_posts
FROM
   social_media;
