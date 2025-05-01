use lesson_11

5-Return: CustomerName, TotalOrders
Task: Show how many orders each customer has placed.
Tables Used: Orders (as a derived table), Customers

select*from Orders
select*from Customers

select Customers.FirstName, count(*)as [totalorders] from Orders
 join Customers
on Orders.CustomerID=Customers.CustomerID
group by Customers.FirstName

Return: ProductName, SupplierName
Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
Tables Used: Products, Suppliers

select*from Products
select*from Suppliers

select ProductName,SupplierName from Products
left join Suppliers
on Products.SupplierID=Suppliers.SupplierID
where SupplierName='Gadget Supplies' or SupplierName='Clothing Mart'


Return: CustomerName, MostRecentOrderDate, OrderID
Task: For each customer, show their most recent order. Include customers who haven''*t placed any orders.
Tables Used: Customers, Orders (as a derived table)


select * from Customers
select *from Orders

select Orders.OrderID, max (Orders.OrderDate) as [MostRecentOrderDate] from Customers
 join Orders
on Customers.CustomerID=Orders.CustomerID
group by Orders.OrderID


Return: CustomerName, OrderID, OrderTotal
Task: Show the customers who have placed an order where the total amount is greater than 500.
Tables Used: Orders, Customers
select * from Customers
select *from Orders

select Customers.FirstName, OrderID, TotalAmount from Customers
 join Orders
on Customers.CustomerID=Orders.CustomerID
where TotalAmount>500


Return: ProductName, SaleDate, SaleAmount
Task: List product sales where the sale was made in 2022 or the sale amount exceeded 400.
Tables Used: Products, Sales

select*from Products
select*from Sales

10-Return: ProductName, TotalSalesAmount
Task: Display each product along with the total amount it has been sold for.
Tables Used: Sales (as a derived table), Products
   
select ProductName,sum(SaleAmount)as[TotalSalesAmount]  from Products
left join Sales 
on Products.ProductID=Sales.ProductID
group by ProductName

Return: EmployeeName, DepartmentName, Salary
Task: Show the employees who work in the HR department and earn a salary greater than 50000.
Tables Used: Employees, Departments

select*from Employees
select* from Departments

select Name,DepartmentName,Salary from Employees
left join Departments
on Employees.DepartmentID=Departments.DepartmentID
where DepartmentName='HR' and  Salary>50000


Return: ProductName, SaleDate, StockQuantity
Task: List the products that were sold in 2023 and had more than 50 units in stock at the time.
Tables Used: Products, Sales

select*from Products
select*from Sales

select ProductName,SaleDate,StockQuantity from Products
join Sales
on Products.ProductID=Sales.ProductID
where year(SaleDate)=2023 and StockQuantity>50



Return: EmployeeName, DepartmentName, HireDate
Task: Show employees who either work in the Sales department or were hired after 2020.
Tables Used: Employees, Departments

select*from Employees
select*from Departm,ents
select  name,DepartmentName,HireDate from Employees
join Departments
on Employees.DepartmentID=Departments.DepartmentID
where DepartmentName='sales' or year(HireDate)>2020



Return: CustomerName, OrderID, Address, OrderDate
Task: List all orders made by customers in the USA whose address starts with 4 digits.
Tables Used: Customers, Orders

select*from Customers
select*from Orders


select Customers.FirstName, OrderID, Address,OrderDate from Customers
 left join Orders
on Customers.CustomerID=Orders.CustomerID
where Country='USA' and Address like '4%%'

Return: ProductName, Category, SaleAmount
Task: Display product sales for items in the Electronics category or where the sale amount exceeded 350.
Tables Used: Products, Sales
select*from Products
select*from Sales


select ProductName,Category,SaleAmount from Products
join Sales
on Products.ProductID=Sales.ProductID
where Category='electronics' or SaleAmount>350


Return: CategoryName, ProductCount
Task: Show the number of products available in each category.
Tables Used: Products (as a derived table), Categories

select* from Products
select *from Categories
select 
33Return: CustomerName, City, OrderID, Amount
Task: List orders where the customer is from Los Angeles and the order amount is greater than 300.
Tables Used: Customers, Orders


select*from Customers
select*from Orders
select Customers.FirstName, OrderID,City ,TotalAmount as amount from Customers
 left join Orders
on Customers.CustomerID=Orders.CustomerID
where city = 'Los Angeles' and TotalAmount>300


Return: EmployeeName, DepartmentName
Task: Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.
Tables Used: Employees, Departments
select*from Employees
select*from Departments

select  name,DepartmentName from Employees
join Departments
on Employees.DepartmentID=Departments.DepartmentID
where DepartmentName='hr' and DepartmentName='finance' or  name like '____'

Return: ProductName, QuantitySold, Price
Task: List products that had a sales quantity above 100 and a price above 500.
Tables Used: Sales, Products

select ProductName,StockQuantity as quantitysold,Price from Products
join Sales
on Products.ProductID=Sales.ProductID
where StockQuantity>100 and Price>500

select*from Products
select*from Sales

Return: EmployeeName, DepartmentName, Salary
Task: Show employees who are in the Sales or Marketing department and have a salary above 60000.
Tables Used: Employees, Departments

select*from Employees
select*from Departments

select  name,DepartmentName,Salary from Employees
join Departments
on Employees.DepartmentID=Departments.DepartmentID
where DepartmentName in('sales','marketing') and Salary>60000

Create table Person (personId int, firstName varchar(255), lastName varchar(255))
Create table Address (addressId int, personId int, city varchar(255), state varchar(255))
Truncate table Person
insert into Person (personId, lastName, firstName) values ('1', 'Wang', 'Allen')
insert into Person (personId, lastName, firstName) values ('2', 'Alice', 'Bob')
Truncate table Address
insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York')
insert into Address (addressId, personId, city, state) values ('2', '3', 'Leetcode', 'California')
select*from Person
select*from Address

select 
p.firstName,
p.lastName,
a.city,
a.state
from 
Person p
left join 
Address a
on p.personId=a.personId


SELECT 
    P.firstName,
    P.lastName,
    A.city,
    A.state
FROM 
    Person P
 left JOIN 
    Address A ON P.personId = A.personId;


	Create table Employee (id int, name varchar(255), salary int, managerId int)
Truncate table Employee
insert into Employee (id, name, salary, managerId) values ('1', 'Joe', '70000', '3')
insert into Employee (id, name, salary, managerId) values ('2', 'Henry', '80000', '4')
insert into Employee (id, name, salary, managerId) values ('3', 'Sam', '60000', NULL)
insert into Employee (id, name, salary, managerId) values ('4', 'Max', '90000', NULL)

select*from Employee

select a.name from Employee as a
join Employee as b
on a.managerId=b.id
where a.salary>b.salary


SELECT 
    e.Name AS EmployeeName
FROM 
    Employee e
JOIN 
    Employee m ON e.ManagerId = m.Id
WHERE 
    e.Salary > m.Salary;
	Create table Person (id int, email varchar(255)) Truncate table Person insert into Person (id, email) values ('1', 'a@b.com') 
	insert into Person (id, email) values ('2', 'c@d.com') insert into Person (id, email) values ('3', 'a@b.com')

5-CREATE TABLE boys (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

CREATE TABLE girls (
    Id INT PRIMARY KEY,
    name VARCHAR(100),
    ParentName VARCHAR(100)
);

INSERT INTO boys (Id, name, ParentName) 
VALUES 
(1, 'John', 'Michael'),  
(2, 'David', 'James'),   
(3, 'Alex', 'Robert'),   
(4, 'Luke', 'Michael'),  
(5, 'Ethan', 'David'),    
(6, 'Mason', 'George');  


INSERT INTO girls (Id, name, ParentName) 
VALUES 
(1, 'Emma', 'Mike'),  
(2, 'Olivia', 'James'),  
(3, 'Ava', 'Robert'),    
(4, 'Sophia', 'Mike'),  
(5, 'Mia', 'John'),      
(6, 'Isabella', 'Emily'),
(7, 'Charlotte', 'George');

select*from boys
select*from  girls

select distinct(girls.ParentName) from girls
where girls.ParentName not in (select distinct ParentName from boys)




SELECT DISTINCT g.ParentName
FROM girls g
WHERE g.ParentName NOT IN (
    SELECT DISTINCT ParentName FROM boys
);
select*from Orders
select*from Sales

CREATE TABLE Sales.Orders
(
  orderid        INT          NOT NULL IDENTITY,
  custid         INT          NULL,
  empid          INT          NOT NULL,
  orderdate      DATETIME     NOT NULL,
  requireddate   DATETIME     NOT NULL,
  shippeddate    DATETIME     NULL,
  shipperid      INT          NOT NULL,
  freight        MONEY        NOT NULL
    CONSTRAINT DFT_Orders_freight DEFAULT(0),
  shipname       NVARCHAR(40) NOT NULL,
  shipaddress    NVARCHAR(60) NOT NULL,
  shipcity       NVARCHAR(15) NOT NULL,
  shipregion     NVARCHAR(15) NULL,
  shippostalcode NVARCHAR(10) NULL,
  shipcountry    NVARCHAR(15) NOT NULL,
  CONSTRAINT PK_Orders PRIMARY KEY(orderid),
  CONSTRAINT FK_Orders_Customers FOREIGN KEY(custid)
    REFERENCES Sales.Customers(custid),
  CONSTRAINT FK_Orders_Employees FOREIGN KEY(empid)
    REFERENCES HR.Employees(empid),
  CONSTRAINT FK_Orders_Shippers FOREIGN KEY(shipperid)
    REFERENCES Sales.Shippers(shipperid)
);

CREATE TABLE Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

select*from Cart1
select*from Cart2

SELECT 
    c1.Item AS [Item Cart 1],
    c2.Item AS [Item Cart 2]
FROM 
    Cart1 c1
FULL OUTER JOIN 
    Cart2 c2 ON c1.Item = c2.Item;

	create table match1 (MatchID int, Match varchar(30), Score varchar(5))
insert into match1 values 
		      (1,'Italy-Spain','2:0'),
              (2,'Spain-France','2:1'),
              (3,'France-Belgium','0:0'),
              (4,'Belgium-Spain','2:2'),
              (5,'Belgium-Italy','0:3'),
              (6,'Italy-France','2:0');
			  select*from match1

SELECT 
    MatchID,
    Match,
    Score,
    CASE 
        WHEN TRY_CAST(LEFT(Score, CHARINDEX(':', Score)-1) AS INT) 
           > TRY_CAST(RIGHT(Score, LEN(Score) - CHARINDEX(':', Score)) AS INT)
            THEN LEFT(Match, CHARINDEX('-', Match)-1)

        WHEN TRY_CAST(LEFT(Score, CHARINDEX(':', Score)-1) AS INT) 
           < TRY_CAST(RIGHT(Score, LEN(Score) - CHARINDEX(':', Score)) AS INT)
            THEN RIGHT(Match, LEN(Match) - CHARINDEX('-', Match))

        ELSE 'Draw'
    END AS Result
FROM match1;

9-SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
  ON c.id = o.customerId
WHERE o.id IS NULL;

10-SELECT 
    s.student_id,
    s.student_name,
    subj.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects subj
LEFT JOIN Examinations e 
    ON s.student_id = e.student_id AND subj.subject_name = e.subject_name
GROUP BY 
    s.student_id, s.student_name, subj.subject_name
ORDER BY 
    s.student_id, subj.subject_name;
