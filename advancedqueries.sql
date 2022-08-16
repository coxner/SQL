/* 
    Concat functions combine two seperate rows with a / in the middle
    Replace replaces all occurce of 'P' with 'X'
*/
SELECT PONumber, POitem,
 CONCAT(PONumber,'/',POItem) AS 'PO Identifier',
 REPLACE(PONumber,'P','X'), DateOfDelivery, ( QuantityDelivered * 2 )
FROM PODelivery;

/* 
The TRIM function removes trailing blanks, thus if the field name has value 'Peter     ', TRIM(name) gives 'Peter'
The RIGHT function extracts a sub-string of 'x' characters from the right from a string, thus RIGHT(TRIM(name),2) gives 'er'
Similarly, the LEFT function works like the RIGHT, thus LEFT(TRIM(name),2) gives 'Pe'
Finally, the LEN function gives the length of the stored value. LEN(name) here will give the value 10 as the trailing blanks will also be counted.
*/

/*ISNULL function returns 0 if it is not null and one if value is null 
this query would add a 0 if the value of cost is null*/
SELECT itemName, cost * ISNULL(qty, 0)
FROM tblInventory;

/*Doing addition with isnull if we tried to return a null value the system would
produce an error so instead we add a zero this sums totals and replaces null
values with 0 */
SELECT q1.payCode, q2.payCode
  ISNULL(q1.waeAmount, 0) +
  ISNULL(q2.wageAMount, 0)
FROM tblQuarterlyWage;

--Using ISNULL with AVG sets values to 50 where value is currently null
SELECT AVG(ISNULL(rating, 50))
FROM tblAlbum;

--We can use update to set a value where a item ISNULL
UPDATE tblAlbum
  SET rating = 50
  WHERE ISNULL(rating);

-- WORKING WITH TRUNCATE
