1-Using Products, Suppliers table List all combinations of product names and supplier names.

select products.ProductName,Suppliers.SupplierName from Products
cross join Suppliers


2-Using Departments, Employees table Get all combinations of departments and employees.
select *
from Departments
cross join Employees


3-Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name

select Suppliers.SupplierName,Products.ProductName from Products
join Suppliers
on  Products.ProductID=Suppliers.SupplierID


4-Using Orders, Customers table List customer names and their orders ID.

select Customers.FirstName,Customers.LastName,Orders.OrderID from Customers
join Orders
on Customers.CustomerID=Orders.CustomerID


5-Using Courses, Students table Get all combinations of students and courses.

select students.StudentID,students.name,Age,Courses.CourseName,Instructor,Major from students
join  Enrollments
on students.StudentID=Enrollments.StudentID
join  Courses
on Courses.CourseID=Enrollments.CourseID

6-Using Products, Orders table Get product names and orders where product IDs match.

select products.ProductName  from products
join orders
on Products.ProductID=orders.ProductID

7-Using Departments, Employees table List employees whose DepartmentID matches the department.

select  employees.DepartmentID,Departments.DepartmentID from Departments
join Employees
on Departments.DepartmentID=Employees.DepartmentID

8-Using Students, Enrollments table List student names and their enrolled course IDs.

select students.name,Courses.CourseName from students
join  Enrollments
on students.StudentID=Enrollments.StudentID
join  Courses
on Courses.CourseID=Enrollments.CourseID


9-Using Payments, Orders table List all orders that have matching payments.

select payments.OrderID from Payments
join Orders
on Payments.OrderID=Orders.OrderID

10-Using Orders, Products table Show orders where product price is more than 100.

select *from Orders
join Products
on Orders.ProductID=Products.ProductID
where Price > 100

11-Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.

select  Employees.Name, Departments.DepartmentName  from Employees
 join Departments
on Employees.DepartmentID<>Departments.DepartmentID

12-Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.

select Orders.OrderID, Products.ProductName, Orders.Quantity, Products.StockQuantity from Orders
join Products
on orders.ProductID=Products.ProductID
where  Orders.Quantity>Products.StockQuantity

13-Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.

select Customers.FirstName,Customers.LastName, Sales.ProductID from Customers
join Sales
on Customers.CustomerID=Sales.CustomerID
where SaleAmount>=500

14-Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.

select students.name,Courses.CourseName from students
join  Enrollments
on students.StudentID=Enrollments.StudentID
join  Courses
on Courses.CourseID=Enrollments.CourseID

15-Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.

select Suppliers.SupplierName,Products.ProductName from Products
join Suppliers
on  Products.ProductID=Suppliers.SupplierID
where SupplierName like 'tech%%'

16-Using Orders, Payments table Show orders where payment amount is less than total amount.


select Orders.OrderID, Payments.PaymentID, Payments.Amount, Orders.TotalAmount from Orders
join Payments
on Orders.OrderID=Payments.PaymentID
where Amount<TotalAmount

17-Using Employees table List employee names with salaries greater than their manager’s salary.
select a.Name from Employees as A
join Employees as B
on A.EmployeeID=B.EmployeeID
where a.Salary>55000

18-Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.
 select productname from Products
join Categories
on Products.Category=Categories.CategoryName
where CategoryName=('Electronics') or CategoryName='Furniture'


19-Using Sales, Customers table Show all sales from customers who are from 'USA'.

select  sales.SaleID,Customers.FirstName,Customers.LastName from Customers
join sales
on Customers.CustomerID=sales.CustomerID
where Country='USA'

20-Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.

select Orders.OrderID,Customers.FirstName,Customers.LastName from Orders
join Customers
on Orders.CustomerID=Customers.CustomerID
where Country='Germany'and TotalAmount>100

21-Using Employees table List all pairs of employees from different departments.
select A.Name,B.Name from Employees as A
join Employees as B
on A.DepartmentID<B.DepartmentID
where A.DepartmentID<>B.DepartmentID


22-Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).
select Products.ProductName from Payments
join Orders
on Payments.OrderID=Orders.OrderID
join Products
on Products.ProductID=Orders.ProductID
where Payments.Amount <> (Orders.Quantity * Products.Price)


23-Using Students, Enrollments, Courses table Find students who are not enrolled in any course.

select students.name from students
join  Enrollments
on students.StudentID=Enrollments.StudentID
join  Courses
on Courses.CourseID=Enrollments.CourseID
where  Enrollments.CourseID is null

24-Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.

select A.Name,B.Name from Employees as A
join Employees as B
on A.DepartmentID=B.DepartmentID
where  A.Salary>=B.Salary

25-Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.

SELECT Customers.FirstName, Orders.OrderID
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN Payments
ON Orders.OrderID = Payments.OrderID
WHERE Payments.PaymentID IS NULL;
