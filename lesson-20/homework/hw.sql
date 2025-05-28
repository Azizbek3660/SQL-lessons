create database homework_20
use homework_20
CREATE TABLE #Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);


INSERT INTO #Sales (CustomerName, Product, Quantity, Price, SaleDate) VALUES
('Alice', 'Laptop', 1, 1200.00, '2024-01-15'),
('Bob', 'Smartphone', 2, 800.00, '2024-02-10'),
('Charlie', 'Tablet', 1, 500.00, '2024-02-20'),
('David', 'Laptop', 1, 1300.00, '2024-03-05'),
('Eve', 'Smartphone', 3, 750.00, '2024-03-12'),
('Frank', 'Headphones', 2, 100.00, '2024-04-08'),
('Grace', 'Smartwatch', 1, 300.00, '2024-04-25'),
('Hannah', 'Tablet', 2, 480.00, '2024-05-05'),
('Isaac', 'Laptop', 1, 1250.00, '2024-05-15'),
('Jack', 'Smartphone', 1, 820.00, '2024-06-01');

1. Find customers who purchased at least one item in March 2024 using EXISTS
select* from #Sales

select CustomerName from #Sales as a
where exists(select *from #Sales as b
where a.CustomerName=b.CustomerName
and b.SaleDate>='2024-03-05'
and b.SaleDate<='2024-03-12');

2. Find the product with the highest total sales revenue using a subquery.

select Product from #Sales 
where price= (select max(Price)from #Sales)


3. Find the second highest sale amount using a subquery
SELECT MAX(SaleAmount) AS SecondHighestSale
FROM (
    SELECT Quantity * Price AS SaleAmount
    FROM #Sales
) AS SaleAmounts
WHERE SaleAmount < (
    SELECT MAX(Quantity * Price)
    FROM #Sales
);

4. Find the total quantity of products sold per month using a subquery



select salemonth,sum(totalquantity)as TotalQuantityPerMonth 
from(
select  format(saledate,'yyyy-MM') as salemonth,
Quantity as TotalQuantity  from #Sales)as MonthlySales
group by salemonth
order by salemonth;

5. Find customers who bought same products as another customer using EXISTS
select*from #Sales
select CustomerName from #Sales a
where exists (select *from #Sales b
where a.CustomerName<>b.CustomerName
and a.Product=b.Product)

6. Return how many fruits does each person have in individual fruit level
create table Fruits(Name varchar(50), Fruit varchar(50))
insert into Fruits values ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
							('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
							('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
							('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
							('Mario', 'Orange')

SELECT Name,  COUNT(Fruit) AS FruitCount
FROM Fruits
GROUP BY Name
ORDER BY Name

7-Return older people in the family with younger ones
create table Family(ParentId int, ChildID int)
insert into Family values (1, 2), (2, 3), (3, 4)
select*from Family
;with cte as
(
select ParentId,ChildID from family 
union all
select a.ParentId,b.ChildID from Family a
join Family b
on a.ParentId=b.ChildID
)
select*from cte 
order by parentid,childid 


8. Write an SQL statement given the following requirements. For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas
CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);


INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);

select*from #Orders


SELECT *
FROM #Orders AS TXOrders
WHERE TXOrders.DeliveryState = 'TX'
  AND EXISTS (
      SELECT*
      FROM #Orders AS CAOrders
      WHERE CAOrders.CustomerID = TXOrders.CustomerID
        AND CAOrders.DeliveryState = 'CA'
  );

9. Insert the names of residents if they are missing
create table #residents(resid int identity, fullname varchar(50), address varchar(100))

insert into #residents values 
('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
('Diogo', 'city=Lisboa country=Portugal age=26'),
('Celine', 'city=Marseille country=France name=Celine age=21'),
('Theo', 'city=Milan country=Italy age=28'),
('Rajabboy', 'city=Tashkent country=Uzbekistan age=22')

select*from #residents


UPDATE #residents
SET address = address + ' name=' + fullname
WHERE address NOT LIKE '%name=%';

10. Write a query to return the route to reach from Tashkent to Khorezm. The result should include the cheapest and the most expensive routes
CREATE TABLE #Routes
(
RouteID        INTEGER NOT NULL,
DepartureCity  VARCHAR(30) NOT NULL,
ArrivalCity    VARCHAR(30) NOT NULL,
Cost           MONEY NOT NULL,
PRIMARY KEY (DepartureCity, ArrivalCity)
);

INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1,'Tashkent','Samarkand',100),
(2,'Samarkand','Bukhoro',200),
(3,'Bukhoro','Khorezm',300),
(4,'Samarkand','Khorezm',400),
(5,'Tashkent','Jizzakh',100),
(6,'Jizzakh','Samarkand',50);

select*from #Routes

|             Route                                 |Cost |
|Tashkent - Samarkand - Khorezm                     | 500 |
|Tashkent - Jizzakh - Samarkand - Bukhoro - Khorezm | 650 |


WITH RoutePaths AS (
    -- Boshlang‘ich nuqta: Tashkentdan yo‘l boshlanadi
    SELECT 
        CAST(DepartureCity + ' - ' + ArrivalCity AS VARCHAR(MAX)) AS Route,
        ArrivalCity,
        Cost
    FROM #Routes
    WHERE DepartureCity = 'Tashkent'

    UNION ALL

    -- Rekursiv qadam: oldingi manzilga bog‘langan keyingi shaharlar
    SELECT 
        CAST(rp.Route + ' - ' + r.ArrivalCity AS VARCHAR(MAX)),
        r.ArrivalCity,
        rp.Cost + r.Cost
    FROM RoutePaths rp
    JOIN #Routes r ON rp.ArrivalCity = r.DepartureCity
    WHERE rp.Route NOT LIKE '%' + r.ArrivalCity + '%'
)

-- Xorazmga yetgan yo‘llarni tanlaymiz
SELECT Route, Cost
FROM RoutePaths
WHERE ArrivalCity = 'Khorezm'
ORDER BY Cost;

11. Rank products based on their order of insertion.
CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
)

 
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c')

select*from #RankingPuzzle

;WITH ProductGroups AS (
    SELECT *,
           SUM(CASE WHEN Vals = 'Product' THEN 1 ELSE 0 END) 
               OVER (ORDER BY ID ROWS UNBOUNDED PRECEDING) AS GroupNum
    FROM #RankingPuzzle
),
Ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY GroupNum ORDER BY ID) AS RankInGroup
    FROM ProductGroups
    WHERE Vals <> 'Product'
)
SELECT *
FROM Ranked


Question 12
Find employees whose sales were higher than the average sales in their department
CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);

INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);

select a.EmployeeID,a.EmployeeName,a.Department,a.SalesAmount,a.SalesMonth,a.SalesYear from #EmployeeSales a
join (select Department,SalesMonth, salesyear,avg(SalesAmount) as [avg sales] from #EmployeeSales
group by Department,SalesMonth, salesyear) as b
on a.Department=b.Department
and a.SalesMonth=b.SalesMonth
and a.SalesYear=b.SalesYear
where a.SalesAmount>b.[avg sales]


13. Find employees who had the highest sales in any given month using EXISTS

select*from #EmployeeSales a
Where not exists (select * from #EmployeeSales b
where a.SalesMonth=b.SalesMonth and a.SalesYear=b.SalesYear
and a.SalesAmount<b.SalesAmount)

14. Find employees who made sales in every month using NOT EXISTS

select*from #EmployeeSales


select*from #EmployeeSales a
Where not exists (select * from #EmployeeSales b
where a.SalesMonth=b.SalesMonth and a.SalesYear=b.SalesYear
and a.SalesAmount=b.SalesAmount)

CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);

INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);

15. Retrieve the names of products that are more expensive than the average price of all products.

select Name from Products
where price>(select avg(price)from Products)


16. Find the products that have a stock count lower than the highest stock count.
select Name from Products
where Stock<(select max(Stock) from Products)


17. Get the names of products that belong to the same category as 'Laptop'.

select Name from Products
where Category=(select Category from Products where name='laptop')

18. Retrieve products whose price is greater than the lowest price in the Electronics category.
select Name from Products
where Price>(select min(price) from Products where Category = 'electronics')

19. Find the products that have a higher price than the average price of their respective category.


select a.Name,a.Category,a.Price from Products a

where Price>(select avg(price) from Products b
where a.Category=b.Category)


CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    ProductID  INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 2, '2024-03-01'),
(2, 3, 5, '2024-03-05'),
(3, 2, 3, '2024-03-07'),
(4, 5, 4, '2024-03-10'),
(5, 8, 1, '2024-03-12'),
(6, 10, 2, '2024-03-15'),
(7, 12, 10, '2024-03-18'),
(8, 7, 6, '2024-03-20'),
(9, 6, 2, '2024-03-22'),
(10, 4, 3, '2024-03-25'),
(11, 9, 2, '2024-03-28'),
(12, 11, 1, '2024-03-30'),
(13, 14, 4, '2024-04-02'),
(14, 15, 5, '2024-04-05'),
(15, 13, 20, '2024-04-08');


20. Find the products that have been ordered at least once.




SELECT DISTINCT p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID;

21. Retrieve the names of products that have been ordered more than the average quantity ordered.

select a.Name from Products a
join Orders b
on a.ProductID=b.ProductID
where Quantity>(select avg(Quantity)from Orders)

22. Find the products that have never been ordered.


SELECT DISTINCT p.Name
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
where p.ProductID is null

23. Retrieve the product with the highest total quantity ordered.
select*from Products
select*from Orders

SELECT TOP 1 p.Name, SUM(o.Quantity) AS TotalQuantity
FROM Products p
JOIN Orders o ON p.ProductID = o.ProductID
GROUP BY p.Name
ORDER BY TotalQuantity DESC;
