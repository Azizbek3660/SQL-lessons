1. You must provide a report of all distributors and their sales by region. If a distributor did not have any sales for a region, rovide a zero-dollar value for that day. Assume there is at least one sale for each region
SQL Setup:

DROP TABLE IF EXISTS #RegionSales;
GO
CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
GO
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);
Input:

|Region       |Distributor    | Sales |
|-------------|---------------|--------
|North        |ACE            |   10  |
|South        |ACE            |   67  |
|East         |ACE            |   54  |
|North        |Direct Parts   |   8   |
|South        |Direct Parts   |   7   |
|West         |Direct Parts   |   12  |
|North        |ACME           |   65  |
|South        |ACME           |   9   |
|East         |ACME           |   1   |
|West         |ACME           |   7   |
Expected Output:

|Region |Distributor   | Sales |
|-------|--------------|-------|
|North  |ACE           | 10    |
|South  |ACE           | 67    |
|East   |ACE           | 54    |
|West   |ACE           | 0     |
|North  |Direct Parts  | 8     |
|South  |Direct Parts  | 7     |
|East   |Direct Parts  | 0     |
|West   |Direct Parts  | 12    |
|North  |ACME          | 65    |
|South  |ACME          | 9     |
|East   |ACME          | 1     |
|West   |ACME          | 7     |


select*from #RegionSales

SELECT 
    r.Region,
    d.Distributor,
    ISNULL(rs.Sales, 0) AS Sales
FROM 
    (SELECT DISTINCT Region FROM #RegionSales) r
CROSS JOIN 
    (SELECT DISTINCT Distributor FROM #RegionSales) d
LEFT JOIN 
    #RegionSales rs 
    ON rs.Region = r.Region AND rs.Distributor = d.Distributor
ORDER BY 
    r.Region, d.Distributor;

2- Find managers with at least five direct reports

CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);

select*from employee

SELECT e.name
FROM Employee e
WHERE e.id IN (
    SELECT managerId
    FROM Employee
    WHERE managerId IS NOT NULL
    GROUP BY managerId
    HAVING COUNT(*) >= 5
);

3-
CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);

select product_name ,sum(unit) as amount from products as a
join orders as b
on a.product_id=b.product_id
where order_date >= '2020-02-01' and order_date < '2020-03-01'
group by  product_name
having sum(unit)>=100



4-
DROP TABLE  Orders;
CREATE TABLE Orders (
  OrderID    INTEGER PRIMARY KEY,
  CustomerID INTEGER NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');
select*from orders


WITH VendorOrderCounts AS (
    SELECT 
        CustomerID,
        Vendor,
        COUNT(*) AS OrderCount,
        RANK() OVER (PARTITION BY CustomerID ORDER BY COUNT(*) DESC) AS rnk
    FROM Orders
    GROUP BY CustomerID, Vendor
)
SELECT 
    CustomerID,
    Vendor
FROM 
    VendorOrderCounts
WHERE 
    rnk = 1;

5. You will be given a number as a variable called @Check_Prime check if this number is prime then return 'This number is prime' else eturn 'This number is not prime'



DECLARE @Check_Prime INT = 91
select case  when @check_prime % 2 = 0 then 'This number is not prime'
else 'This number is not prime'
end 



6-6. Write an SQL query to return the number of locations,in which location most signals sent, and total number of signal for each device from the given table.
CREATE TABLE Device(
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');

select*from device

| Device_id | no_of_location | max_signal_location | no_of_signals |
|-----------|----------------|---------------------|---------------|
| 12        | 2              | Bangalore           | 6             |
| 13        | 2              | Secunderabad        | 5             |


WITH SignalCounts AS (
    SELECT 
        Device_id,
        Locations,
        COUNT(*) AS SignalCount
    FROM Device
    GROUP BY Device_id, Locations
),
RankedLocations AS (
    SELECT 
        Device_id,
        Locations,
        SignalCount,
        RANK() OVER (PARTITION BY Device_id ORDER BY SignalCount DESC) AS rnk
    FROM SignalCounts
)
SELECT 
    d.Device_id,
    COUNT(DISTINCT d.Locations) AS Number_of_Locations,
    MAX(CASE WHEN rl.rnk = 1 THEN rl.Locations END) AS Most_Signals_Location,
    COUNT(*) AS Total_Signals
FROM Device d
JOIN RankedLocations rl
    ON d.Device_id = rl.Device_id AND d.Locations = rl.Locations
GROUP BY d.Device_id;


7- Write a SQL to find all Employees who earn more than the average salary in their corresponding department. Return EmpID, EmpName,Salary in your output
CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
(1004,'Peter',35000,1), (1005,'John',55000,1), (1006,'Albert',25000,3), (1007,'Donald',35000,3);
select*from employee

| EmpID | EmpName | Salary |
|-------|---------|--------|
| 1001  | Mark    | 60000  |
| 1004  | Peter   | 35000  |
| 1005  | John    | 55000  |
| 1007  | Donald  | 35000  |
SELECT 
    e.EmpID,
    e.EmpName,
    e.Salary
FROM 
    Employee e
JOIN (
    SELECT 
        DeptID,
        AVG(Salary) AS AvgSalary
    FROM 
        Employee
    GROUP BY 
        DeptID
) avg_dept
ON e.DeptID = avg_dept.DeptID
WHERE 
    e.Salary > avg_dept.AvgSalary;


8-
-- Winning numbers
CREATE TABLE WinningNumbers (Number INT);
INSERT INTO WinningNumbers VALUES (25), (45), (78);

-- Tickets
CREATE TABLE Tickets (TicketID VARCHAR(20), Number INT);
INSERT INTO Tickets VALUES
('A23423', 25), ('A23423', 45), ('A23423', 78),
('B35643', 25), ('B35643', 45), ('B35643', 98),
('C98787', 67), ('C98787', 86), ('C98787', 91);

WITH MatchCounts AS (
    SELECT 
        t.TicketID,
        COUNT(*) AS MatchCount
    FROM 
        Tickets t
    JOIN 
        WinningNumbers w ON t.Number = w.Number
    GROUP BY 
        t.TicketID
),
Winnings AS (
    SELECT 
        TicketID,
        CASE 
            WHEN MatchCount = 3 THEN 100
            WHEN MatchCount IN (1, 2) THEN 10
            ELSE 0
        END AS Prize
    FROM MatchCounts
)
SELECT SUM(Prize) AS TotalWinnings FROM Winnings;

------------9-

CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);

| Row | Spend_date | Platform | Total_Amount | Total_users |
|-----|------------|----------|--------------|-------------|
| 1   | 2019-07-01 | Mobile   | 100          | 1           |
| 2   | 2019-07-01 | Desktop  | 100          | 1           |
| 3   | 2019-07-01 | Both     | 200          | 1           |
| 4   | 2019-07-02 | Mobile   | 100          | 1           |
| 5   | 2019-07-02 | Desktop  | 100          | 1           |
| 6   | 2019-07-02 | Both     | 0            | 0           |

select*from spending

------10-
DROP TABLE IF EXISTS Grouped;
CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil', 3), ('Eraser', 4), ('Notebook', 2);

select*from grouped
