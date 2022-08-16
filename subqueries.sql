/*  Subqueries, sometimes referred to as inner queries or nested queries, 
are used to transform table data by nesting one query within another query.
A nested sub query is when the inner query is run first
*/
--Subquery is very similar to a join does the same thing but the code is more readable fashion inner query is run first
SELECT first_name, last_name
FROM band_students 
WHERE id IN (
  SELECT id
  FROM drama_students
);
--Query that will delete students from the drama table if they are in the band table
DELETE FROM drama_students 
WHERE id in (
  SELECT id
  band_students
);
--subquery with comparison operator
SELECT *
FROM drama_students
WHERE grade = (
  SELECT grade
  FROM band_students
  WHERE id = 20
);
/* 
When an IN clause is used, results retrieved from the external query must appear within the subquery results.
 Similarly, when a NOT IN clause is used, results retrieved from the external query must 
 not appear within the subquery results.
*/
SELECT first_name,last_name
FROM band_students
WHERE id 
NOT IN (
  SELECT id
  FROM drama_students
);

SELECT grade
FROM band_students
WHERE EXISTS (
  SELECT grade
  FROM drama_students
);

SELECT * FROM flights
WHERE origin in (
  SELECT code 
  FROM airports
  WHERE elevation < 2000
);