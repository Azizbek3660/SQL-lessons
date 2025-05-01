1-Show all orders placed after 2022 along with the names of the customers who placed them.

select Orders.orderid,customers.firstname,orders.orderdate from orders
join customers
on orders.customerid=customers.customerid
where year(orderdate) > 2022

2-Display the names of employees who work in either the Sales or Marketing department.

select employees.name, departments.departmentname from employees
join departments
on employees.departmentid= departments.departmentid
where departments.DepartmentName in ('sales','marketing')

3-For each department, show the name of the employee who earns the highest salary.

select distinct(DepartmentName)as [top employed name],max(salary)as[Maxsalary]  from Departments
join Employees
on Departments.DepartmentID=Employees.DepartmentID
group by  DepartmentName


4- List all customers from the USA who placed orders in the year 2023

select customers.FirstName,Orders.OrderID,Orders.OrderDate from  Customers
join Orders
on Customers.CustomerID=Orders.CustomerID
where Country='USA' and year(OrderDate)=2023

5-Return: CustomerName, TotalOrders
Task: Show how many orders each customer has placed.
Tables Used: Orders (as a derived table), Customers

select Customers.FirstName, count(*)as [totalorders] from Orders
 left join Customers
on Orders.CustomerID=Customers.CustomerID
group by Customers.FirstName

6-Return: ProductName, SupplierName
Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
Tables Used: Products, Suppliers

select ProductName,SupplierName from Products
left join Suppliers
on Products.SupplierID=Suppliers.SupplierID
where SupplierName='Gadget Supplies' or SupplierName='Clothing Mart'

7-Return: CustomerName, MostRecentOrderDate, OrderID
Task: For each customer, show their most recent order. Include customers who haven''t placed any orders.
Tables Used: Customers, Orders (as a derived table)

select Orders.OrderID, max (Orders.OrderDate) as [MostRecentOrderDate] from Customers
 join Orders
on Customers.CustomerID=Orders.CustomerID
group by Orders.OrderID


8-Return: CustomerName, OrderID, OrderTotal
Task: Show the customers who have placed an order where the total amount is greater than 500.
Tables Used: Orders, Customers
select Customers.FirstName, OrderID, TotalAmount from Customers
 join Orders
on Customers.CustomerID=Orders.CustomerID
where TotalAmount>500

9-Return: ProductName, SaleDate, SaleAmount
Task: List product sales where the sale was made in 2022 or the sale amount exceeded 400.
Tables Used: Products, Sales

select ProductName,SaleDate,SaleAmount from Products
left join Sales
on Products.ProductID=Sales.ProductID
where year(SaleDate)='2022' or SaleAmount>400


10-Return: ProductName, TotalSalesAmount
Task: Display each product along with the total amount it has been sold for.
Tables Used: Sales (as a derived table), Products

select ProductName,sum(SaleAmount)as[TotalSalesAmount]  from Products
left join Sales 
on Products.ProductID=Sales.ProductID
group by ProductName

11-Return: EmployeeName, DepartmentName, Salary
Task: Show the employees who work in the HR department and earn a salary greater than 50000.
Tables Used: Employees, Departments

select Name,DepartmentName,Salary from Employees
left join Departments
on Employees.DepartmentID=Departments.DepartmentID
where DepartmentName='HR' and  Salary>50000




12-Return: ProductName, SaleDate, StockQuantity
Task: List the products that were sold in 2023 and had more than 50 units in stock at the time.
Tables Used: Products, Sales

select ProductName,SaleDate,StockQuantity from Products
join Sales
on Products.ProductID=Sales.ProductID
where year(SaleDate)=2023 and StockQuantity>50

13-Return: EmployeeName, DepartmentName, HireDate
Task: Show employees who either work in the Sales department or were hired after 2020.
Tables Used: Employees, Departments

select  name,DepartmentName,HireDate from Employees
join Departments
on Employees.DepartmentID=Departments.DepartmentID
where DepartmentName='sales' or year(HireDate)>2020


14-Return: CustomerName, OrderID, Address, OrderDate
Task: List all orders made by customers in the USA whose address starts with 4 digits.
Tables Used: Customers, Orders

select Customers.FirstName, OrderID, Address,OrderDate from Customers
 left join Orders
on Customers.CustomerID=Orders.CustomerID
where Country='USA' and Address like '4%%'

15-Return: ProductName, Category, SaleAmount
Task: Display product sales for items in the Electronics category or where the sale amount exceeded 350.
Tables Used: Products, Sales

select ProductName,Category,SaleAmount from Products
join Sales
on Products.ProductID=Sales.ProductID
where Category='electronics' or SaleAmount>350

16-Return: CategoryName, ProductCount
Task: Show the number of products available in each category.
Tables Used: Products (as a derived table), Categories


SELECT 
    C.CategoryName,
    COALESCE(P.ProductCount, 0) AS ProductCount
FROM 
    Categories C
LEFT JOIN (
    SELECT 
        CategoryID,
        COUNT(*) AS ProductCount
    FROM 
        Products
    GROUP BY 
        CategoryID
) P ON C.CategoryID = P.CategoryID;

17-Return: CustomerName, City, OrderID, Amount
Task: List orders where the customer is from Los Angeles and the order amount is greater than 300.
Tables Used: Customers, Orders

select Customers.FirstName, OrderID,City ,TotalAmount as amount from Customers
 left join Orders
on Customers.CustomerID=Orders.CustomerID
where city = 'Los Angeles' and TotalAmount>300


18-Return: EmployeeName, DepartmentName
Task: Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.
Tables Used: Employees, Departments

select  name,DepartmentName from Employees
join Departments
on Employees.DepartmentID=Departments.DepartmentID
where DepartmentName='hr' and DepartmentName='finance' or  name like '____'

19-Return: ProductName, QuantitySold, Price
Task: List products that had a sales quantity above 100 and a price above 500.
Tables Used: Sales, Products

select ProductName,StockQuantity as quantitysold,Price from Products
join Sales
on Products.ProductID=Sales.ProductID
where StockQuantity>100 and Price>500

20-Return: EmployeeName, DepartmentName, Salary
Task: Show employees who are in the Sales or Marketing department and have a salary above 60000.
Tables Used: Employees, Departments

select  name,DepartmentName,Salary from Employees
join Departments
on Employees.DepartmentID=Departments.DepartmentID
where DepartmentName in('sales','marketing') and Salary>60000
