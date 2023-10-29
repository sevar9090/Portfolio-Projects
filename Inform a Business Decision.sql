-- Exploring and understanding the Data

SELECT * FROM Customers;
SELECT * FROM Categories;
SELECT * FROM Employees;
SELECT * FROM OrderDetails;
SELECT * FROM Orders;
SELECT * FROM Products;
SELECT * FROM Shippers;
SELECT * FROM Suppliers;

-- Joining Multiple Tables Together to Obtain Data for Analysis

SELECT Lastname, Firstname, Orders.OrderID, Products.ProductID, Quantity, Price
from employees
inner join orders
on employees.employeeID = orders.employeeid
inner join orderDetails
on orders.orderid = orderdetails.orderid
inner join products
on orderdetails.productid = products.productid
order by lastname, firstname;

-- Calculate and Summarize Sales for each Order

SELECT Lastname, Firstname, Orders.OrderID, Products.ProductID, Quantity, Price, sum(quantity * price) as SalesAmt
from employees
inner join orders
on employees.employeeID = orders.employeeid
inner join orderDetails
on orders.orderid = orderdetails.orderid
inner join products
on orderdetails.productid = products.productid
group by orders.orderid;

-- Answering to 2 different questions

-- First we find the names of employees responsible for the top five orders

SELECT Lastname, Firstname, Orders.OrderID, Products.ProductID, Quantity, Price, sum(quantity * price) as SalesAmt
from employees
inner join orders
on employees.employeeID = orders.employeeid
inner join orderDetails
on orders.orderid = orderdetails.orderid
inner join products
on orderdetails.productid = products.productid
group by orders.orderid
order by salesamt desc
limit 5;

-- or 
-- the names of the five employees who had the orders with the highest sales amounts

select Lastname, Firstname, Orders.OrderID, Products.ProductID, Quantity, Price, sum(quantity * price) as SalesAmt
from employees
inner join orders
on employees.employeeID = orders.employeeid
inner join orderDetails
on orders.orderid = orderdetails.orderid
inner join products
on orderdetails.productid = products.productid
group by orders.orderid
having orders.orderid in (10372, 10424, 10417, 10324, 10351)
order by salesamt desc
limit 5;
