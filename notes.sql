-- counts all the rows of table startups
SELECT COUNT(*) FROM startups;
--Sum of a column
SELECT SUM(valuation) FROM startups;
-- max value from a column
SELECT MAX(raised) FROM startups;
-- Selecting max from a column with a condition
SELECT MAX(raised) FROM startups WHERE stage = 'Seed' ;
-- oldest year 
SELECT MIN(founded) FROM startups;
-- Avg of a column
SELECT AVG(valuation) FROM startups;
-- the average column value from each category rounded two decimal places ordered from highest avg to lowest
SELECT category, ROUND(AVG(valuation), 2)
FROM startups
GROUP BY 1
ORDER BY 2 DESC;
-- returns each category and total number of companies in each category since we group by a aggregate function we have to use having
--instead of WHERE, ORDER BY 2 selects the second column and sorts highest to lowest
SELECT category, COUNT(*)
FROM startups
GROUP BY category
HAVING COUNT(*) > 3
ORDER BY 2 DESC;
-- Another example of having
SELECT location, AVG(employees) FROM startups
GROUP BY location
HAVING AVG(employees) > 500
ORDER BY 2 DESC;

-- Retruns the top 5 from the score column
SELECT title, score 
FROM hacker_news
ORDER BY score DESC
LIMIT 5;
-- Selects users with a score > 200
SELECT user, SUM(score)
FROM hacker_news
GROUP BY user
HAVING SUM(score) > 200
ORDER BY 2 DESC;
-- Seeing how many times a user has poster a url
SELECT user, COUNT(*)
FROM hacker_news
WHERE url LIKE '%watch?v=dQw4w9WgXcQ%'
GROUP BY 1
ORDER BY COUNT(*) DESC;
-- Counts all urls with these keywords in them names the column source count(*) sums up each category and group by groups
--them by there source
SELECT CASE
  WHEN url LIKE '%github.com%' THEN 'Github'
  WHEN url LIKE '%medium.com%' THEN 'Medium'
  WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
  ELSE 'Other'
END AS 'Source',
COUNT(*)
FROM hacker_news
GROUP BY 1;

SELECT CASE
   WHEN medium LIKE '%gold%'   THEN 'Gold'
   WHEN medium LIKE '%silver%' THEN 'Silver'
   ELSE NULL
  END AS 'Bling',
  COUNT(*)
FROM met
WHERE Bling IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;
-- using the strftime function
SELECT timestamp,
   strftime('%H', timestamp)
FROM hacker_news
GROUP BY 1
LIMIT 20;
/* 
This returns the hour, HH, of the timestamp column!

For strftime(__, timestamp):

%Y returns the year (YYYY)
%m returns the month (01-12)
%d returns the day of the month (1-31)
%H returns 24-hour clock (00-23)
%M returns the minute (00-59)
%S returns the seconds (00-59)
if timestamp format is YYYY-MM-DD HH:MM:SS.

*/
-- Returns the hour time of each article the AVG score and how many articles have been posted that hour
SELECT strftime('%H', timestamp), AVG(score), COUNT(*)
FROM hacker_news
GROUP BY 1
ORDER BY 1;
-- Renames columns and returns values where the timestamp column is not Null
SELECT strftime('%H', timestamp), ROUND(AVG(score), 1) AS 'Average Score', COUNT(*) AS 'Number Of Stores'
FROM hacker_news
WHERE timestamp IS NOT null
GROUP BY 1
ORDER BY 1;