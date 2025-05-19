create database lesson_16
use lesson_16

# Lesson-16: CTEs and Derived Tables

> **Notes before doing the tasks:**
> - Tasks should be solved using **SQL Server**.
> - Case insensitivity applies.
> - Alias names do not affect the score.
> - Scoring is based on the **correct output**.
> - One correct solution is sufficient.


CREATE TABLE Numbers1(Number INT)

INSERT INTO Numbers1 VALUES (5),(9),(8),(6),(7)

CREATE TABLE FindSameCharacters
(
     Id INT
    ,Vals VARCHAR(10)
)
 
INSERT INTO FindSameCharacters VALUES
(1,'aa'),
(2,'cccc'),
(3,'abc'),
(4,'aabc'),
(5,NULL),
(6,'a'),
(7,'zzz'),
(8,'abc')



CREATE TABLE RemoveDuplicateIntsFromNames
(
      PawanName INT
    , Pawan_slug_name VARCHAR(1000)
)
 
 
INSERT INTO RemoveDuplicateIntsFromNames VALUES
(1,  'PawanA-111'  ),
(2, 'PawanB-123'   ),
(3, 'PawanB-32'    ),
(4, 'PawanC-4444' ),
(5, 'PawanD-3'  )





CREATE TABLE Example
(
Id       INTEGER IDENTITY(1,1) PRIMARY KEY,
String VARCHAR(30) NOT NULL
);


INSERT INTO Example VALUES('123456789'),('abcdefghi');


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Sales'),
(3, 'Marketing'),
(4, 'Finance'),
(5, 'IT'),
(6, 'Operations'),
(7, 'Customer Service'),
(8, 'R&D'),
(9, 'Legal'),
(10, 'Logistics');

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sales (SalesID, EmployeeID, ProductID, SalesAmount, SaleDate) VALUES
-- January 2025
(1, 1, 1, 1550.00, '2025-01-02'),
(2, 2, 2, 2050.00, '2025-01-04'),
(3, 3, 3, 1250.00, '2025-01-06'),
(4, 4, 4, 1850.00, '2025-01-08'),
(5, 5, 5, 2250.00, '2025-01-10'),
(6, 6, 6, 1450.00, '2025-01-12'),
(7, 7, 1, 2550.00, '2025-01-14'),
(8, 8, 2, 1750.00, '2025-01-16'),
(9, 9, 3, 1650.00, '2025-01-18'),
(10, 10, 4, 1950.00, '2025-01-20'),
(11, 1, 5, 2150.00, '2025-02-01'),
(12, 2, 6, 1350.00, '2025-02-03'),
(13, 3, 1, 2050.00, '2025-02-05'),
(14, 4, 2, 1850.00, '2025-02-07'),
(15, 5, 3, 1550.00, '2025-02-09'),
(16, 6, 4, 2250.00, '2025-02-11'),
(17, 7, 5, 1750.00, '2025-02-13'),
(18, 8, 6, 1650.00, '2025-02-15'),
(19, 9, 1, 2550.00, '2025-02-17'),
(20, 10, 2, 1850.00, '2025-02-19'),
(21, 1, 3, 1450.00, '2025-03-02'),
(22, 2, 4, 1950.00, '2025-03-05'),
(23, 3, 5, 2150.00, '2025-03-08'),
(24, 4, 6, 1700.00, '2025-03-11'),
(25, 5, 1, 1600.00, '2025-03-14'),
(26, 6, 2, 2050.00, '2025-03-17'),
(27, 7, 3, 2250.00, '2025-03-20'),
(28, 8, 4, 1350.00, '2025-03-23'),
(29, 9, 5, 2550.00, '2025-03-26'),
(30, 10, 6, 1850.00, '2025-03-29'),
(31, 1, 1, 2150.00, '2025-04-02'),
(32, 2, 2, 1750.00, '2025-04-05'),
(33, 3, 3, 1650.00, '2025-04-08'),
(34, 4, 4, 1950.00, '2025-04-11'),
(35, 5, 5, 2050.00, '2025-04-14'),
(36, 6, 6, 2250.00, '2025-04-17'),
(37, 7, 1, 2350.00, '2025-04-20'),
(38, 8, 2, 1800.00, '2025-04-23'),
(39, 9, 3, 1700.00, '2025-04-26'),
(40, 10, 4, 2000.00, '2025-04-29'),
(41, 1, 5, 2200.00, '2025-05-03'),
(42, 2, 6, 1650.00, '2025-05-07'),
(43, 3, 1, 2250.00, '2025-05-11'),
(44, 4, 2, 1800.00, '2025-05-15'),
(45, 5, 3, 1900.00, '2025-05-19'),
(46, 6, 4, 2000.00, '2025-05-23'),
(47, 7, 5, 2400.00, '2025-05-27'),
(48, 8, 6, 2450.00, '2025-05-31'),
(49, 9, 1, 2600.00, '2025-06-04'),
(50, 10, 2, 2050.00, '2025-06-08'),
(51, 1, 3, 1550.00, '2025-06-12'),
(52, 2, 4, 1850.00, '2025-06-16'),
(53, 3, 5, 1950.00, '2025-06-20'),
(54, 4, 6, 1900.00, '2025-06-24'),
(55, 5, 1, 2000.00, '2025-07-01'),
(56, 6, 2, 2100.00, '2025-07-05'),
(57, 7, 3, 2200.00, '2025-07-09'),
(58, 8, 4, 2300.00, '2025-07-13'),
(59, 9, 5, 2350.00, '2025-07-17'),
(60, 10, 6, 2450.00, '2025-08-01');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    CategoryID INT,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, CategoryID, ProductName, Price) VALUES
(1, 1, 'Laptop', 1000.00),
(2, 1, 'Smartphone', 800.00),
(3, 2, 'Tablet', 500.00),
(4, 2, 'Monitor', 300.00),
(5, 3, 'Headphones', 150.00),
(6, 3, 'Mouse', 25.00),
(7, 4, 'Keyboard', 50.00),
(8, 4, 'Speaker', 200.00),
(9, 5, 'Smartwatch', 250.00),
(10, 5, 'Camera', 700.00);



# Easy Tasks

1. Create a numbers table using a recursive query from 1 to 1000.

;with numbers as
(
select 1 as n
union all
select n+1 from  numbers where n < 1000
)
select *from  numbers
option (MAXRECURSION 1000)

2. Write a query to find the total sales per employee using a derived table.(Sales, Employees)
select a.employeeid,a.firstname,a.lastname,b.[total sales] from employees a
join 
(
select employeeid,sum(salesamount)as[total sales] from sales group by employeeid
)as b
on a.employeeid=b.employeeid

3. Create a CTE to find the average salary of employees.(Employees)

;with cte as 
(
select avg(salary) as [avgsalary]from employees 
)
select avgsalary from cte


4. Write a query using a derived table to find the highest sales for each product.(Sales, Products)

select a.productid,a.productname,b.high_sales from products A
join 
(select productid, max(salesamount)as high_sales  from sales group by productid
) as b 
on a.productid=b.productid

5. Beginning at 1, write a statement to double the number for each record, the max value you get should be less than 1000000.
;with cte as
(
select 1 as n
union all
select n+2 from cte where n<1000000
)
select *from cte



6. Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)


with count_sales as
(select employeeid,count(*)as total_sales 
from sales 
group by employeeid
)
select *from count_sales as a
join employees  as b
on a.employeeid=b.employeeid
where total_sales>5


7. Write a query using a CTE to find all products with sales greater than $500.(Sales, Products)

with cte as 
(
select productid,sum(salesamount)as sum_sales from sales
group by productid
)
select a.productid,b.productname,a.sum_sales  from cte as a
join products as b
on a.productid=b.productid
where sum_sales>500

8. Create a CTE to find employees with salaries above the average salary.(Employees)

with cte as 
(
select avg( salary)as avg_salary from employees
)
select *from employees as a
join cte as b
on a.salary>b.avg_salary


# Medium Tasks
1. Write a query using a derived table to find the top 5 employees by the number of orders made.(Employees, Sales)

select*from 
(
select top 5
employeeid,
count(*)as total_orders from sales
group by employeeid
)as a
join employees as b
on a.employeeid=b.employeeid
order by a.total_orders desc


2. Write a query using a derived table to find the sales per product category.(Sales, Products)
select*from (select productid,sum(salesamount)as sum_sales
from sales
group by productid
)as a
join products as b
on a.productid=b.productid
order by sum_sales desc



3. Write a script to return the factorial of each value next to it.(Numbers1)
select a.number,sum(b.number) as sum_number from numbers1 as a
join numbers1 as b
on a.number>=b.number
group by a.number


4. This script uses recursion to split a string into rows of substrings for each character in the string.(Example)
select*from example
WITH StringSplitCTE AS (
    -- Boshlang'ich qism: 1-pozitsiyadagi harfni olamiz
    SELECT 
        Id,
        CAST(SUBSTRING(String, 1, 1) AS VARCHAR(1)) AS Character,
        1 AS Position,
        String
    FROM Example

    UNION ALL

    -- Rekursiv qism: har safar keyingi pozitsiyadagi harfni olamiz
    SELECT 
        Id,
        CAST(SUBSTRING(String, Position + 1, 1) AS VARCHAR(1)) AS Character,
        Position + 1,
        String
    FROM StringSplitCTE
    WHERE Position + 1 <= LEN(String)
)

SELECT Id, Character, Position
FROM StringSplitCTE
ORDER BY Id, Position
OPTION (MAXRECURSION 1000);

5. Use a CTE to calculate the sales
WITH MonthlySales AS (
    SELECT
        FORMAT(SaleDate, 'yyyy-MM') AS SaleMonth,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY FORMAT(SaleDate, 'yyyy-MM')
),
SalesDiff AS (
    SELECT
        m1.SaleMonth,
        m1.TotalSales,
        LAG(m1.TotalSales) OVER (ORDER BY m1.SaleMonth) AS PreviousMonthSales,
        m1.TotalSales - LAG(m1.TotalSales) OVER (ORDER BY m1.SaleMonth) AS Difference
    FROM MonthlySales m1
)
SELECT *
FROM SalesDiff;




6. Create a derived table to find employees with sales over $45000 in each quarter.(Sales, Employees)
SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    qtr.Quarter,
    qtr.TotalSales
FROM Employees e
JOIN (
    SELECT
        s.EmployeeID,
        CONCAT('Q', DATEPART(QUARTER, s.SaleDate)) AS Quarter,
        SUM(s.SalesAmount) AS TotalSales
    FROM Sales s
    GROUP BY s.EmployeeID, DATEPART(QUARTER, s.SaleDate)
) AS qtr
    ON e.EmployeeID = qtr.EmployeeID
WHERE qtr.TotalSales > 45000
ORDER BY e.EmployeeID, qtr.Quarter;




# Difficult Tasks
1. This script uses recursion to calculate Fibonacci numbers
WITH FibonacciCTE (n, FibValue) AS (
    -- Boshlang‘ich qiymatlar: F(0) = 0, F(1) = 1
    SELECT 0 AS n, 0 AS FibValue
    UNION ALL
    SELECT 1, 1
    UNION ALL
    -- Rekursiv qism: F(n) = F(n-1) + F(n-2)
    SELECT 
        f1.n + 1,
        f1.FibValue + f2.FibValue
    FROM FibonacciCTE f1
    JOIN FibonacciCTE f2 ON f1.n = f2.n + 1
    WHERE f1.n < 20  -- Bu yerda nechta element chiqishini belgilaysiz (masalan, 20 ta)
)
SELECT * FROM FibonacciCTE
ORDER BY n;



2. Find a string where all characters are the same and the length is greater than 1.(FindSameCharacters)
select*from findsamecharacters

SELECT *
FROM FindSameCharacters
WHERE Vals IS NOT NULL
  AND LEN(Vals) > 1
  AND LEN(REPLACE(Vals, LEFT(Vals, 1), '')) = 0;


3. Create a numbers table that shows all numbers 1 through n and their order gradually increasing by the next number in the sequence.(Example:n=5 | 1, 12, 123, 1234, 12345)

DECLARE @n INT = 5;

-- Rekursiv CTE yordamida 1 dan n gacha ketma-ket raqamlar
WITH Numbers AS (
    SELECT 1 AS Num, CAST('1' AS VARCHAR(MAX)) AS Sequence
    UNION ALL
    SELECT Num + 1, Sequence + CAST(Num + 1 AS VARCHAR)
    FROM Numbers
    WHERE Num + 1 <= @n
)
SELECT Sequence
FROM Numbers
OPTION (MAXRECURSION 0);

4. Write a query using a derived table to find the employees who have made the most sales in the last 6 months.(Employees,Sales)
select*from employees
select*from sales

with cte as
(
select employeeid,sum(salesamount)as sum_amount from sales group by employeeid,saledate


)
select * from employees as a
join cte as b
on a.employeeid=b.employeeid





5. Write a T-SQL query to remove the duplicate integer values present in the string column. Additionally, remove the single integer character that appears in the string.(RemoveDuplicateIntsFromNames)

select*from RemoveDuplicateIntsFromNames
SELECT 
    PawanName,
    Pawan_slug_name,
    LEFT(Pawan_slug_name, CHARINDEX('-', Pawan_slug_name)) AS Cleaned_Name
FROM RemoveDuplicateIntsFromNames;
