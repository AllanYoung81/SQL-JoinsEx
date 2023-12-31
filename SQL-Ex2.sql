
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */

-- SELECT P.Name, C.Name  /* can add AS ProductName, AS CategoryName to change column titles */
-- FROM products as P
-- INNER JOIN categories as C
-- ON C.CategoryID = P.CategoryID
-- WHERE C.Name = 'Computers';

SELECT products.Name, categories.Name
FROM products
INNER JOIN categories on categories.CategoryID = products.CategoryID
WHERE categories.Name = "Computers";


/* joins: find all product names, product prices, and products ratings that have a rating of 5 */

SELECT products.Name, products.Price, reviews.Rating
FROM products
INNER JOIN reviews ON reviews.ProductID = products.ProductID
WHERE reviews.Rating  = 5;

 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.EmployeeID, FirstName, employees.LastName, SUM(sales.Quantity) as Total
FROM employees 
INNER JOIN sales 
ON sales.EmployeeID = employees.EmployeeID 
GROUP BY employees.EmployeeID
ORDER BY Total DESC
LIMIT 5;


/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.name as "Department Name", categories.name as "Category Name"
FROM departments
INNER JOIN categories
ON departments.DepartmentID = categories.DepartmentID
WHERE categories.name = 'Appliances' OR categories.name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, sum(sales.Quantity), sum(sales.Quantity * sales.PricePerUnit)
FROM products
INNER JOIN sales
ON products.ProductID = sales.ProductID
WHERE products.Name = 'Eagles: Hotel California';
/* 
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.name, reviews.Reviewer, reviews.Rating, reviews.Comment
FROM products
INNER JOIN reviews
ON reviews.ProductID = products.ProductID
WHERE products.name = 'Visio TV' AND reviews.Rating = '1';



-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name, SUM(sales.Quantity) AS totalSold
FROM employees
INNER JOIN sales
ON sales.EmployeeID = employees.EmployeeID
INNER JOIN products
ON products.ProductID = sales.ProductID
GROUP BY employees.EmployeeID, products.ProductID
ORDER BY employees.EmployeeID;