-- Checking for columns contained in each table
SELECT * FROM products
SELECT * FROM productline
SELECT * FROM customers
SELECT * FROM employees
SELECT * FROM offices
SELECT * FROM orderdetails
SELECT * FROM orders
SELECT * FROM payments


/* Questions for Analysis
Question 1: Which products should we order more of or less of?

This question refers to inventory reports, including low stock and product performance. 
This will optimize the supply and the user experience by preventing the best-selling products 
from going out-of-stock.

The low stock represents the quantity of each product sold divided by the quantity of product in stock. 
We can consider the ten lowest rates. These will be the top ten products that are (almost) out-of-stock.*/


SELECT o.productCode,p.productName,p.quantityInStock,
   SUM (o.quantityOrdered) AS total_ordered, (SELECT 
   SUM (o.quantityOrdered))/ p.quantityInStock AS lowstock
  FROM orderdetails As o
  JOIN products AS p
    ON o.productCode = p.productCode
 GROUP BY p.productCode
 ORDER BY lowstock DESC
 LIMIT 10;
 
 -- We can see here that "1960 BSA Gold Star DBD34" with code S24_2000 is the highest one here runnning out of stock.
-- We should order more of it
 
 --We are also interested in the product that has generated more revenue for us
SELECT o.productCode, p.productName, SUM(quantityOrdered * priceEach) AS total_amount
  FROM orderdetails AS o
  JOIN products AS p
    ON o.productCode = p.productCode
 GROUP BY p.productCode
 ORDER BY total_amount DESC
 
/* To ensure we priorities products for restocking are those with high product performance that are on the brink of being out of stock.
we need to combine both code above. I have also set a filter of 100,000 for the total amount*/
SELECT o.productCode,p.productName,p.quantityInStock,
   SUM (o.quantityOrdered) AS total_ordered, (SELECT 
   SUM (o.quantityOrdered))/ p.quantityInStock AS lowstock, SUM(o.quantityOrdered * o.priceEach) AS total_amount
  FROM orderdetails As o
  JOIN products AS p
    ON o.productCode = p.productCode
 GROUP BY p.productCode
 HAVING total_amount > 100000
 ORDER BY lowstock DESC,total_amount DESC
 LIMIT 10;
 