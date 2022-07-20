/*Write a query to display the following table:

Select each table name as a string.
Select the number of attributes as an integer (count the number of attributes per table).
Select the number of rows using the COUNT(*) function.
Use the compound-operator UNION ALL to bind these rows together.*/

-- Solution

SELECT name AS table_name, (SELECT COUNT(*)
  FROM pragma_table_info('customers')) AS number_of_attributes, (SELECT count(*)
  FROM customers) AS number_of_rows
  FROM sqlite_schema
 WHERE type ='table' AND name ='customers'

UNION ALL

SELECT name AS table_name, (SELECT COUNT(*)
  FROM pragma_table_info('employees')) AS number_of_attributes, (SELECT count(*)
  FROM employees) AS number_of_rows
  FROM sqlite_schema
 WHERE type ='table' AND name ='employees'

 UNION ALL
 
SELECT name AS table_name, (SELECT COUNT(*)
  FROM pragma_table_info('offices')) AS number_of_attributes, (SELECT count(*)
  FROM offices) AS number_of_rows
  FROM sqlite_schema
 WHERE type ='table' AND name LIKE '%office%'
 
 UNION ALL
 
 SELECT name AS table_name, (SELECT COUNT(*)
  FROM pragma_table_info('orderdetails')) AS number_of_attributes, (SELECT count(*)
  FROM orderdetails) AS number_of_rows
  FROM sqlite_schema
 WHERE type ='table' AND name ='orderdetails'

 UNION ALL

SELECT name AS table_name, (SELECT COUNT(*)
  FROM pragma_table_info('orders')) AS number_of_attributes, (SELECT count(*)
  FROM orders) AS number_of_rows
  FROM sqlite_schema
 WHERE type ='table' AND name ='orders'

 UNION ALL
 
SELECT name AS table_name, (SELECT COUNT(*)
  FROM pragma_table_info('payments')) AS number_of_attributes, (SELECT count(*)
  FROM payments) AS number_of_rows
  FROM sqlite_schema
 WHERE type ='table' AND name LIKE '%payments%'
 
 UNION ALL
  SELECT name AS table_name, (SELECT COUNT(*)
  FROM pragma_table_info('productlines')) AS number_of_attributes, (SELECT count(*)
  FROM productlines) AS number_of_rows
  FROM sqlite_schema
 WHERE type ='table' AND name ='productlines'

 UNION ALL

SELECT name AS table_name, (SELECT COUNT(*)
  FROM pragma_table_info('products')) AS number_of_attributes, (SELECT count(*)
  FROM products) AS number_of_rows
  FROM sqlite_schema
 WHERE type ='table' AND name ='products';
