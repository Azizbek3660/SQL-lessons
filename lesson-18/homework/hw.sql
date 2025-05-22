create database homework_18
use homework_18

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES
(1, 'Samsung Galaxy S23', 'Electronics', 899.99),
(2, 'Apple iPhone 14', 'Electronics', 999.99),
(3, 'Sony WH-1000XM5 Headphones', 'Electronics', 349.99),
(4, 'Dell XPS 13 Laptop', 'Electronics', 1249.99),
(5, 'Organic Eggs (12 pack)', 'Groceries', 3.49),
(6, 'Whole Milk (1 gallon)', 'Groceries', 2.99),
(7, 'Alpen Cereal (500g)', 'Groceries', 4.75),
(8, 'Extra Virgin Olive Oil (1L)', 'Groceries', 8.99),
(9, 'Mens Cotton T-Shirt', 'Clothing', 12.99),
(10, 'Womens Jeans - Blue', 'Clothing', 39.99),
(11, 'Unisex Hoodie - Grey', 'Clothing', 29.99),
(12, 'Running Shoes - Black', 'Clothing', 59.95),
(13, 'Ceramic Dinner Plate Set (6 pcs)', 'Home & Kitchen', 24.99),
(14, 'Electric Kettle - 1.7L', 'Home & Kitchen', 34.90),
(15, 'Non-stick Frying Pan - 28cm', 'Home & Kitchen', 18.50),
(16, 'Atomic Habits - James Clear', 'Books', 15.20),
(17, 'Deep Work - Cal Newport', 'Books', 14.35),
(18, 'Rich Dad Poor Dad - Robert Kiyosaki', 'Books', 11.99),
(19, 'LEGO City Police Set', 'Toys', 49.99),
(20, 'Rubiks Cube 3x3', 'Toys', 7.99);

INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate)
VALUES
(1, 1, 2, '2025-04-01'),
(2, 1, 1, '2025-04-05'),
(3, 2, 1, '2025-04-10'),
(4, 2, 2, '2025-04-15'),
(5, 3, 3, '2025-04-18'),
(6, 3, 1, '2025-04-20'),
(7, 4, 2, '2025-04-21'),
(8, 5, 10, '2025-04-22'),
(9, 6, 5, '2025-04-01'),
(10, 6, 3, '2025-04-11'),
(11, 10, 2, '2025-04-08'),
(12, 12, 1, '2025-04-12'),
(13, 12, 3, '2025-04-14'),
(14, 19, 2, '2025-04-05'),
(15, 20, 4, '2025-04-19'),
(16, 1, 1, '2025-03-15'),
(17, 2, 1, '2025-03-10'),
(18, 5, 5, '2025-02-20'),
(19, 6, 6, '2025-01-18'),
(20, 10, 1, '2024-12-25'
),
(21, 1, 1, '2024-04-20');

1. Create a temporary table named MonthlySales to store the total quantity sold and total revenue for each product in the current month.
Return: ProductID, TotalQuantity, TotalRevenue
create table #MonthlySales(    ProductID INT,
    TotalQuantity INT,
    TotalRevenue DECIMAL(20,2)) 
select a.ProductID,sum(a.Quantity)as totalquantity,sum(a.Quantity*b.Price)as totalrevenue  from Sales a
join products b
on a.ProductID=b.ProductID
where year (SaleDate)=year(getdate())
month (SaleDate)=month (getdate())
group by a.ProductID 



2.Create a view named vw_ProductSalesSummary that returns product info along with total sales quantity across all time.
create view vw_ProductSalesSummary as
select b.ProductName,b.Category,sum(Quantity)as totalsales from Sales a
join Products b
on a.ProductID=b.ProductID

group by b.ProductName,b.Category

select*from vw_ProductSalesSummary

3. Create a function named fn_GetTotalRevenueForProduct(@ProductID INT)
Return: total revenue for the given product ID
go
create function fn_GetTotalRevenueForProduct (@ProductID int)
returns table
as
return(
  select a.ProductID,b.ProductName,sum(a.Quantity*b.Price) as total_revenue from Sales a
   join products b
   on a.ProductID=b.ProductID

   where a.ProductID  = @ProductID
   group by  a.ProductID,b.ProductName 
  )

select*from fn_GetTotalRevenueForProduct (5)


4-Create an function fn_GetSalesByCategory(@Category VARCHAR(50))
Return: ProductName, TotalQuantity, TotalRevenue for all products in that category.




create function fn_GetSalesByCategory(@Category VARCHAR(50))
returns table
as
return(
  select b.ProductName,
  sum(a.Quantity)as totalquantity,
  sum(a.Quantity*b.Price)as total_revenue,
  b.Category
  from Sales a
   join products b
   on a.ProductID=b.ProductID

   where b.Category=@Category
   group by b.ProductName,b.Category
  )

select*from fn_GetSalesByCategory ('electronics')

5. You have to create a function that get one argument as input from user and the function should return 'Yes' if the input number is a prime number and 'No' otherwise. You can start it like this:
go
Create function dbo.fn_IsPrime (@Number INT)
returns int
as
begin
	return case when @number / 2 = 0 then 'yes'
	else 'no'
	end
 end 
 select dbo.fn_isprime(15)


6-

CREATE FUNCTION fn_GetNumbersBetween (@Start INT, @End INT)
RETURNS @Numbers TABLE (Number INT)
AS
BEGIN
    DECLARE @Current INT = @Start;

    WHILE @Current <= @End
    BEGIN
        INSERT INTO @Numbers (Number)
        VALUES (@Current);

        SET @Current = @Current + 1;
    END

    RETURN;
END


7-Write a SQL query to return the Nth highest distinct salary from the Employee table. If there are fewer than N distinct salaries, return NULL.

CREATE FUNCTION getNthHighestSalary(@N INT)
RETURNS TABLE
AS
RETURN (
    SELECT 
        (
            SELECT DISTINCT Salary
            FROM Employee
            ORDER BY Salary DESC
            OFFSET @N - 1 ROWS FETCH NEXT 1 ROWS ONLY
        ) AS HighestNSalary
)


9-
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES Customers(customer_id),
    order_date DATE,
    amount DECIMAL(10,2)
);

-- Customers
INSERT INTO Customers (customer_id, name, city)
VALUES
(1, 'Alice Smith', 'New York'),
(2, 'Bob Jones', 'Chicago'),
(3, 'Carol White', 'Los Angeles');

-- Orders
INSERT INTO Orders (order_id, customer_id, order_date, amount)
VALUES
(101, 1, '2024-12-10', 120.00),
(102, 1, '2024-12-20', 200.00),
(103, 1, '2024-12-30', 220.00),
(104, 2, '2025-01-12', 120.00),
(105, 2, '2025-01-20', 180.00);
CREATE VIEW vw_CustomerOrderSummary AS
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.amount), 0) AS total_amount,
    MAX(o.order_date) AS last_order_date
FROM
    Customers c
LEFT JOIN
    Orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.name;


10-
DROP TABLE IF EXISTS Gaps;

CREATE TABLE Gaps
(
RowNumber   INTEGER PRIMARY KEY,
TestCase    VARCHAR(100) NULL
);

INSERT INTO Gaps (RowNumber, TestCase) VALUES
(1,'Alpha'),(2,NULL),(3,NULL),(4,NULL),
(5,'Bravo'),(6,NULL),(7,'Charlie'),(8,NULL),(9,NULL);

select*from Gaps


SELECT 
    RowNumber,
    MAX(TestCase) OVER (ORDER BY RowNumber ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Workflow
FROM 
    Gaps;
