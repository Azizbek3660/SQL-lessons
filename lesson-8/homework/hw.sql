select*from orders

select count(productID)as[count] from productss
group by category

select avg(price) as [avg price] from productss
group by category
having category='electronics'
CREATE TABLE Customers ( CustomerID INT PRIMARY KEY, FirstName VARCHAR(100), LastName VARCHAR(100), Email VARCHAR(100), Phone VARCHAR(50), Address VARCHAR(255), City VARCHAR(100), State VARCHAR(100), PostalCode VARCHAR(20), Country VARCHAR(100) );sele

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, PostalCode, Country) VALUES (1, 'John', 'Doe', 'johndoe@gmail.com', '555-1234', '123 Elm St', 'New York', 'NY', '10001', 'USA'), (2, 'Jane', 'Smith', 'janesmith@yahoo.com', '555-2345', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA'), (3, 'Alice', 'Johnson', 'alicej@outlook.com', '555-3456', '789 Pine St', 'Toronto', 'ON', 'M4B1B3', 'Canada'), (4, 'Bob', 'Brown', 'bobbrown@hotmail.com', '555-4567', '101 Maple St', 'Vancouver', 'BC', 'V5K0A1', 'Canada'), (5, 'Charlie', 'Davis', 'charliedavis@gmail.com', '555-5678', '202 Birch St', 'Sydney', 'NSW', '2000', 'Australia'), (6, 'David', 'Martinez', 'davidm@live.com', '555-6789', '303 Cedar St', 'Melbourne', 'VIC', '3000', 'Australia'), (7, 'Emily', 'Garcia', 'emilyg@yahoo.com', '555-7890', '404 Redwood St', 'London', 'England', 'SW1A 1AA', 'UK'), (8, 'Frank', 'Hernandez', 'frankh@outlook.com', '555-8901', '505 Willow St', 'Manchester', 'England', 'M1 1AE', 'UK'), (9, 'Grace', 'Lopez', 'gracel@gmail.com', '555-9012', '606 Aspen St', 'Birmingham', 'England', 'B1 1AA', 'UK'), (10, 'Helen', 'Gonzalez', 'heleng@yahoo.com', '555-0123', '707 Fir St', 'Berlin', 'BE', '10117', 'Germany'), (11, 'Irene', 'Perez', 'irenep@hotmail.com', '555-1234', '808 Maple Ave', 'Munich', 'BY', '80331', 'Germany'), (12, 'Jack', 'Wilson', 'jackw@live.com', '555-2345', '909 Oak Ave', 'Hamburg', 'HH', '20095', 'Germany'), (13, 'Kim', 'Anderson', 'kima@gmail.com', '555-3456', '111 Pine Ave', 'Paris', '�le-de-France', '75001', 'France'), (14, 'Liam', 'Thomas', 'liamt@yahoo.com', '555-4567', '222 Cedar Ave', 'Lyon', 'Auvergne-Rh�ne-Alpes', '69001', 'France'), (15, 'Megan', 'Taylor', 'megant@outlook.com', '555-5678', '333 Redwood Ave', 'Marseille', 'Provence-Alpes-C�te Azur', '13001', 'France'), (16, 'Nathan', 'Moore', 'nathanm@hotmail.com', '555-6789', '444 Willow Ave', 'Tokyo', 'TK', '100-0001', 'Japan'), (17, 'Olivia', 'Jackson', 'oliviaj@gmail.com', '555-7890', '555 Birch Ave', 'Osaka', 'OS', '530-0001', 'Japan'), (18, 'Paul', 'White', 'paulw@yahoo.com', '555-8901', '666 Maple Blvd', 'Kyoto', 'KY', '600-8001', 'Japan'), (19, 'Quincy', 'Lee', 'quincyl@outlook.com', '555-9012', '777 Oak Blvd', 'Seoul', 'SO', '04547', 'South Korea'), (20, 'Rachel', 'Harris', 'rachelh@hotmail.com', '555-0123', '888 Pine Blvd', 'Busan', 'BU', '48058', 'South Korea'), (21, 'Sam', 'Clark', 'samc@gmail.com', '555-1234', '999 Cedar Blvd', 'Incheon', 'IC', '22382', 'South Korea'), (22, 'Tina', 'Allen', 'tinaallen@yahoo.com', '555-2345', '1010 Redwood Blvd', 'Mexico City', 'CMX', '01000', 'Mexico'), (23, 'Ursula', 'Scott', 'ursulas@outlook.com', '555-3456', '1111 Willow Blvd', 'Guadalajara', 'JAL', '44100', 'Mexico'), (24, 'Victor', 'Adams', 'victora@hotmail.com', '555-4567', '1212 Birch Blvd', 'Monterrey', 'NLE', '64000', 'Mexico'), (25, 'Walter', 'Baker', 'walterb@live.com', '555-5678', '1313 Oak Blvd', 'New York', 'NY', '10001', 'USA'), (26, 'Xander', 'Nelson', 'xandern@gmail.com', '555-6789', '1414 Cedar Blvd', 'Los Angeles', 'CA', '90001', 'USA'), (27, 'Yvonne', 'Carter', 'yvonnec@yahoo.com', '555-7890', '1515 Maple Dr', 'Chicago', 'IL', '60601', 'USA'), (28, 'Zane', 'Mitchell', 'zanem@outlook.com', '555-8901', '1616 Redwood Dr', 'Houston', 'TX', '77001', 'USA'), (29, 'Anna', 'Roberts', 'annar@hotmail.com', '555-9012', '1717 Willow Dr', 'Sydney', 'NSW', '2000', 'Australia'), (30, 'Ben', 'King', 'benk@live.com', '555-0123', '1818 Birch Dr', 'Melbourne', 'VIC', '3000', 'Australia'), (31, 'Chloe', 'Green', 'chloeg@gmail.com', '555-1234', '1919 Oak Dr', 'Toronto', 'ON', 'M4B1B3', 'Canada'), (32, 'Daniel', 'Evans', 'daniele@yahoo.com', '555-2345', '2020 Cedar Dr', 'Vancouver', 'BC', 'V5K0A1', 'Canada'), (33, 'Ella', 'Collins', 'ellac@outlook.com', '555-3456', '2121 Redwood Dr', 'London', 'England', 'SW1A 1AA', 'UK'), (34, 'Finn', 'Morris', 'finnm@hotmail.com', '555-4567', '2222 Willow St', 'Manchester', 'England', 'M1 1AE', 'UK'), (35, 'Grace', 'Lee', 'gracel@live.com', '555-5678', '2323 Birch St', 'Berlin', 'BE', '10117', 'Germany'), (36, 'Holly', 'Martinez', 'hollym@gmail.com', '555-6789', '2424 Oak St', 'Munich', 'BY', '80331', 'Germany'), (37, 'Ian', 'Robinson', 'ianr@yahoo.com', '555-7890', '2525 Cedar St', 'Warsaw', 'WA', '00-001', 'Poland'), (38, 'Jasmine', 'Walker', 'jasminew@outlook.com', '555-8901', '2626 Redwood St', 'Lisbon', 'LI', '1100-148', 'Portugal'), (39, 'Kyle', 'Young', 'kyley@hotmail.com', '555-9012', '2727 Willow St', 'Pittsburgh', 'PA', '15201','USA'), (40, 'Liam', 'Harris', 'liamh@live.com', '555-0123', '2828 Birch St', 'Richmond', 'VA', '23220','USA');
select top (1)Price from productss
order by price desc

7-Using Products table, use IIF to label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.

select  IiF (StockQuantity<30 , 'low stock','sufficient') as [LOw stock]
from productss

select count(customerID) as [count cutomers]from customers
group by city

select distinct customerID from orders
where year (Orderdate)=2023
except
select distinct customerID from Invoices
where year (Invoicedate)=2023
select customerID from Invoices
drop table orders
CREATE TABLE Orders ( OrderID INT PRIMARY KEY, CustomerID INT, ProductID INT, OrderDate DATE, Quantity INT, TotalAmount DECIMAL(10, 2))
 INSERT INTO Orders VALUES (1, 1, 2, '2023-05-14', 1, 800.00), (2, 2, 3, '2024-09-07', 2, 800.00), (3, 3, 4, '2022-11-22', 1, 250.00), (4, 4, 5, '2021-03-30', 3, 150.00), (5, 5, 6, '2025-07-19', 1, 30.00), (6, 6, 7, '2022-08-25', 2, 300.00), (7, 7, 8, '2024-06-10', 1, 200.00), (8, 8, 9, '2021-12-04', 4, 40.00), (9, 9, 10, '2023-02-18', 1, 10.00), (10, 10, 11, '2025-09-27', 2, 360.00), (11, 11, 12, '2023-10-11', 1, 500.00), (12, 12, 13, '2024-04-03', 1, 25.00), (13, 13, 14, '2022-07-29', 2, 60.00), (14, 14, 15, '2021-01-22', 3, 135.00), (15, 15, 16, '2025-11-15', 1, 80.00), (16, 16, 17, '2022-10-08', 1, 60.00), (17, 17, 18, '2023-06-21', 2, 40.00), (18, 18, 19, '2021-09-13', 5, 50.00), (19, 19, 20, '2025-03-05', 2, 50.00), (20, 20, 21, '2024-08-14', 1, 60.00), (21, 21, 22, '2022-12-01', 1, 100.00), (22, 22, 23, '2023-09-09', 1, 15.00), (23, 23, 24, '2021-07-18', 2, 180.00), (24, 24, 25, '2025-06-23', 3, 15.00), (25, 25, 26, '2023-03-12', 4, 100.00), (26, 26, 27, '2022-04-07', 1, 450.00), (27, 27, 28, '2024-11-30', 1, 600.00), (28, 28, 29, '2021-02-25', 1, 500.00), (29, 29, 30, '2025-05-28', 2, 240.00), (30, 30, 31, '2023-08-20', 1, 350.00), (31, 31, 32, '2022-01-17', 1, 450.00), (32, 32, 33, '2025-09-10', 1, 40.00), (33, 33, 34, '2021-04-04', 2, 100.00), (34, 34, 35, '2024-07-15', 3, 120.00), (35, 35, 36, '2022-10-31', 1, 60.00), (36, 36, 37, '2023-12-22', 1, 35.00), (37, 37, 38, '2021-06-06', 2, 110.00), (38, 38, 39, '2025-02-01', 1, 40.00), (39, 39, 40, '2023-11-26', 3, 120.00), (40, 40, 1, '2024-03-09', 1, 1200.00);
 select*from productss
  select*from Products_Discounted
  select orderdate, avg (quantity) as[quantity]from Orders
  group by orderdate
 14-Using Products table, use CASE to group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.

 select*from Productss

 select productname ,
 case
 when price <100 then 'low'
 when price>100 and price <500 then 'mid'
 when price > 500 then 'high'
 end as [pricegroup]
 from productss
  
  15-Using Customers table, list all unique cities where customers live, sorted alphabetically.

  select distinct city from customers
  order by  city desc

16-Using Sales table, find total sales per product Id.

select productid,sum (SaleAmount) as [sum]from sales
group by productid
select*from sales
17-Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.

select productname from Productss
where productname like  '%oo%'


18-Using Products and Products_Discounted tables, compare product IDs using INTERSECT.

select productid from Productss
intersect
select productid from Products_Discounted

19-Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.
select top (3) customerid ,sum(TotalAmount)as[totalspent] from Invoices
group by customerid
order by totalspent desc
20-Find product ID and productname that are present in Products but not in Products_Discounted.

select productid,productname from  Productss
except
select productid,productname from Products_Discounted

select * from t1
left join t2
on t1.number = t2.numbe

select customerName, sum(orderAmount) from orders
join customers
on orders.customerID = customers.CustomerID
group by CustomerName
select productid,productname from  Productss
left join Products_Discounted
on Products=Products_Discounted
group by productid,productname
21-Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)

select*from productss
select*from sales
select productname as [name],count(SaleID)as[sale] from Productss
join sales
on productss.productid=sales.productid
group by productname 
use new

CREATE TABLE Orders ( OrderID INT PRIMARY KEY, CustomerID INT, ProductID INT, OrderDate DATE, Quantity INT, TotalAmount DECIMAL(10, 2))
drop table Orders
INSERT INTO Orders VALUES (1, 1, 2, '2023-05-14', 1, 800.00), (2, 2, 3, '2024-09-07', 2, 800.00), (3, 3, 4, '2022-11-22', 1, 250.00), (4, 4, 5, '2021-03-30', 3, 150.00), (5, 5, 6, '2025-07-19', 1, 30.00), (6, 6, 7, '2022-08-25', 2, 300.00), (7, 7, 8, '2024-06-10', 1, 200.00), (8, 8, 9, '2021-12-04', 4, 40.00), (9, 9, 10, '2023-02-18', 1, 10.00), (10, 10, 11, '2025-09-27', 2, 360.00), (11, 11, 12, '2023-10-11', 1, 500.00), (12, 12, 13, '2024-04-03', 1, 25.00), (13, 13, 14, '2022-07-29', 2, 60.00), (14, 14, 15, '2021-01-22', 3, 135.00), (15, 15, 16, '2025-11-15', 1, 80.00), (16, 16, 17, '2022-10-08', 1, 60.00), (17, 17, 18, '2023-06-21', 2, 40.00), (18, 18, 19, '2021-09-13', 5, 50.00), (19, 19, 20, '2025-03-05', 2, 50.00), (20, 20, 21, '2024-08-14', 1, 60.00), (21, 21, 22, '2022-12-01', 1, 100.00), (22, 22, 23, '2023-09-09', 1, 15.00), (23, 23, 24, '2021-07-18', 2, 180.00), (24, 24, 25, '2025-06-23', 3, 15.00), (25, 25, 26, '2023-03-12', 4, 100.00), (26, 26, 27, '2022-04-07', 1, 450.00), (27, 27, 28, '2024-11-30', 1, 600.00), (28, 28, 29, '2021-02-25', 1, 500.00), (29, 29, 30, '2025-05-28', 2, 240.00), (30, 30, 31, '2023-08-20', 1, 350.00), (31, 31, 32, '2022-01-17', 1, 450.00), (32, 32, 33, '2025-09-10', 1, 40.00), (33, 33, 34, '2021-04-04', 2, 100.00), (34, 34, 35, '2024-07-15', 3, 120.00), (35, 35, 36, '2022-10-31', 1, 60.00), (36, 36, 37, '2023-12-22', 1, 35.00), (37, 37, 38, '2021-06-06', 2, 110.00), (38, 38, 39, '2025-02-01', 1, 40.00), (39, 39, 40, '2023-11-26', 3, 120.00), (40, 40, 1, '2024-03-09', 1, 1200.00);
22-Using Orders table, find top 5 products (by ProductID) with the highest order quantities.
select*from orders

SELECT top (5) ProductID, SUM(Quantity) as newquantity
FROM Orders
GROUP BY ProductID
ORDER BY newquantity DESC

