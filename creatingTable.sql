
CREATE TABLE friends (
  id INTEGER,
  name TEXT,
  birthday DATE
);

INSERT INTO friends (id, name, birthday) VALUES (1,'Ororo Munroe', '1940-05-30');

SELECT * FROM friends;

INSERT INTO friends (id, name, birthday) VALUES (2, 'Marky Mark', '1999-07-25');

INSERT INTO friends (id, name, birthday) VALUES (3, 'Marcus Mark', '1999-06-31');

UPDATE friends
SET name = "Storm"
WHERE id = 1 ;


ALTER TABLE friends ADD COLUMN email TEXT;
UPDATE friends 
SET email = "storm@codecademy.com"
WHERE id = 1;
SELECT * FROM friends;
DELETE FROM friends WHERE id = 1;
SELECT * FROM friends;

--Finding only unique values of a column
SELECT DISTINCT order_date
FROM orders;