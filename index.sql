/*Points to data inside the table reduces time it takes to retrieve data
UNIQUE attribute prevents duplication of data*/

--Be careful with the UNIQUE clause! Every column that is specified will require unique values
CREATE UNIQUE INDEX name_of_index
ON name_of_table (column1, column2, ...);

--Index without use of unique
CREATE INDEX name_of_index
ON name_of_table;

--DROP View command

/* 
Anytime you DROP anything using the SQL DROP command, you should feel a little nervous tension. 
After all, something is being removed (possibly permanently) from the database! 
However, with by dropping a view, the original data is unaffected. 
This is why the View is such a great tool for end users in the first place: the table behind the scenes is safe.
Although you can use the DROP command to drop/delete an entire table or column of data, 
it's usually not wise to remove a table full of data! However, if you create Views of the data in the database, 
it's a lot easier to drop the View and start over should you run into snags or glitches.

*/

CREATE VIEW Employee_View AS
  SELECT empID, empFullName, empJobTitle
  FROM tblEmployee
  WHERE empID > 0;


DROP VIEW Employee_View;