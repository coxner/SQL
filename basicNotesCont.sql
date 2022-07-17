-- Query to select babies that start with the letter S
SELECT name 
FROM babies
WHERE name LIKE 'S%' 
LIMIT 20;


-- Finding the TOP 10 baby names from the year 1880
SELECT name, gender, number
FROM babies
WHERE year = 1880
ORDER BY number DESC
LIMIT 10;


-- Use a query to find the names 
-- and emails associated with these transactions. Good to find the middle name of a user
SELECT full_name, email
FROM transaction_data 
WHERE full_name = 'Art Vandelay' OR full_name LIKE '% der %';

--Counting all the emails ending in .com
SELECT COUNT(*)
FROM users
WHERE email LIKE '%.com'; 

-- Calling custom column name
SELECT ROUND(watch_duration_in_minutes) AS 'duration', COUNT(*) AS 'count'
FROM watch_history
GROUP BY duration
ORDER BY 1;

-- Using COUNT to count a category
SELECT COUNT(money_in)
FROM transactions
WHERE currency = 'BIT';