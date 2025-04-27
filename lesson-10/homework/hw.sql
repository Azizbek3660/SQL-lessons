1-Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.

select name,salary,departmentname from Employees
left join Departments
on Employees.DepartmentID=Departments.DepartmentID
where Salary>50000

2-Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.

select Customers.FirstName,Customers.LastName,  Orders.OrderDate from Orders
join Customers
on Orders.CustomerID=Customers.CustomerID
where year(OrderDate) = 2023

3-Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.

select name,departmentname from Employees
left join Departments
on Employees.DepartmentID=Departments.DepartmentID
where Departments.DepartmentID=Employees.DepartmentID

4-Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product.

select Products.ProductName,Suppliers. from  Products
left join Suppliers
on Products.SupplierID=Suppliers.SupplierID

5-Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.

select Orders.OrderID, OrderDate,PaymentDate,Amount from Orders
full outer join Payments
on Orders.OrderID=Payments.OrderID

6-Using the Employees table, write a query to show each employee''s name along with the name of their manager.

select A.name,B.name 
 from Employees as A
left join Employees as B
on A.DepartmentID=B.DepartmentID

7-Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.

select students.Name,Courses.CourseName from Students
join Enrollments
on Students.StudentID=Enrollments.StudentID
join Courses
on Courses.CourseID=Enrollments.CourseID
where Courses.CourseName='Math 101'


8-Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.

select Customers.FirstName,Customers.LastName,Quantity from Customers
join Orders
on Customers.CustomerID=Orders.CustomerID
where Quantity>3

9-Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.

select Employees.Name,Departments.DepartmentName from Employees
join Departments
on Employees.DepartmentID=Departments.DepartmentID
where DepartmentName='Human Resources'

10-Using the Employees and Departments tables, write a query to return department names that have more than 10 employees.

select Employees.Name,count(Employees.DepartmentID) from Employees
 join Departments
on Employees.DepartmentID=Departments.DepartmentID
group by Employees.Name
having count(Employees.DepartmentID)>10

11-Using the Products and Sales tables, write a query to find products that have never been sold.

select products.ProductName from Products
left join sales
on Products.ProductID=Sales.ProductID
where SaleID=is null

12-Using the Customers and Orders tables, write a query to return customer names who have placed at least one order

select Customers.FirstName,Customers.LastName from Customers
join Orders
on Customers.CustomerID=Orders.OrderID
where Quantity >=1

13-Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).

select*from Employees
 inner join Departments
on Employees.DepartmentID=Departments.DepartmentID

14-Using the Employees table, write a query to find pairs of employees who report to the same manager

select*from Employees as A
join Employees as B
on A.EmployeeID=B.EmployeeID
AND  A.EmployeeID<B.EmployeeID
WHERE B.ManagerID IS NOT NULL

15-Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.

select customers.FirstName,Customers.LastName,Orders.OrderDate from Orders
join Customers
on Orders.CustomerID=Customers.CustomerID
where year(OrderDate)=2022

16-Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.

select Employees.Name from Employees
join Departments
on Employees.DepartmentID=Departments.DepartmentID
where DepartmentName='sales' and Salary> 60000

17-Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.

SELECT Orders.OrderID, Payments.PaymentID, Payments.Amount
FROM Orders
INNER JOIN Payments
ON Orders.OrderID = Payments.OrderID;

18-Using the Products and Orders tables, write a query to find products that were never ordered.

select   products.ProductName from  Products
left join Orders
on Products.ProductID=Orders.ProductID
where Orders.Quantity =  null

19-Using the Employees table, write a query to find employees whose salary is greater than the average salary of all employees.
 
 select Employees.FirstName, Salary from Employees
where salary>(select avg(salary)from Employees)


20-Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.

select orders.OrderID,Payments.PaymentDate from Orders
join payments
on Orders.OrderID=Payments.OrderID
where year(PaymentDate)<2020

21-Using the Products and Categories tables, write a query to return products that do not have a matching category.
SELECT p.*
FROM Products p
LEFT JOIN Categories c ON p.category_id = c.category_id
WHERE c.category_id IS NULL

22-Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.

select Employee1.Name, Employee2.name, employee1.ManagerID, employee1.Salary from Employees as Employee1
join Employees as employee2
on Employee1.EmployeeID<employee2.EmployeeID
and Employee1.ManagerID is not  null
and Employee1.salary >60000

23-Using the Employees and Departments tables, write a query to return employees who work in departments whose name starts with the letter 'M'.

select Employees.Name,Departments.DepartmentName from Employees
join Departments
on Employees.DepartmentID=Departments.DepartmentID
where name like 'M%%'


24-Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.

select products.productname,Sales.SaleAmount from products
join sales
on products.productid=Sales.ProductID
where SaleAmount>500

25-Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.

select students.Name,Courses.CourseName from Students
join Enrollments
on Students.StudentID=Enrollments.StudentID
join Courses
on Courses.CourseID=Enrollments.CourseID
where Courses.CourseName<>'Math 101'

26-Using the Orders and Payments tables, write a query to return orders that are missing payment details.

select Orders.OrderID,OrderDate,PaymentID from Orders
 left join Payments
on Orders.OrderID=Payments.OrderID
where  Payments.OrderID is null


27-Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.

SELECT p.*
FROM Products p
JOIN Categories c ON p.category_id = c.category_id
WHERE c.category_name IN ('Electronics', 'Furniture')
