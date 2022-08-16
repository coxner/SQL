-- Question what follows a insert statement
INSERT INTO tblCustomer (customerName, location, age)
SELECT customerName, location, age
FROM tblOrders
WHERE tblOrders.customerID = tblCustomer.customerID;

-- Working with constraints
name VARCHAR(15) [NOT NULL]; -- Cannot be null
id CHAR(6)[UNIQUE]; -- Value must be unique
feedback VARCHAR(2500) [LENGTH > 150]; -- Length must be longer 
 
/* 
An UPDATE SQL statement can be used to replace data within a table
An INSERT statement is used to add data to a table
A DELETE statement is used to delete records from a table */
DELETE FROM department
WHERE department_number = 11;

--The TRUNCATE command will delete all data from a table
TRUNCATE TABLE employee;
--The DROP command will remove a table entirely from the database
DROP TABLE employee;
--The CREATE statement creates an entirely new table in the database
CREATE TABLE location
(
  location_name varchar,
  location_id number,
  department_number number
);