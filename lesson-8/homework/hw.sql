1-Using Products table, find the total number of products available in each category.
select count(productID)as[count] from products
group by category
2-Using Products table, get the average price of products in the 'Electronics' category.
select avg(price) as [avg price] from products
group by category
having category='electronics'

3-Using Customers table, list all customers from cities that start with 'L'.
SELECT*FROM Customers
WHERE CITY LIKE 'L%'

4-Using Products table, get all product names that end with 'er'.
select*from products
where productname like '%er'

5-Using Customers table, list all customers from countries ending in 'A'.
select*from Customers
where city like '%a'

6-Using Products table, show the highest price among all products.
select top (1)Price from productss
order by price desc

7-Using Products table, use IIF to label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.

select  IiF (StockQuantity<30 , 'low stock','sufficient') as [LOw stock]
from productss

8-Using Customers table, find the total number of customers in each country.
select count(customerID) as [count cutomers]from customers
group by city



9-Using Orders table, find the minimum and maximum quantity ordered.
select min(quantity)as[min],
       max(quantity)as [max]
	   from orders

10-Using Orders and Invoices tables, list customer IDs who placed orders in 2023 (using EXCEPT) to find those who did not have invoices.

  SELECT DISTINCT CustomerID
FROM Orders
WHERE YEAR(OrderDate) = 2023

EXCEPT

SELECT DISTINCT CustomerID
FROM Invoices
WHERE YEAR(InvoiceDate) = 2023

11-Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted

12-Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
SELECT ProductName FROM Products
UNION 
SELECT ProductName FROM Products_Discounted
13-Using Orders table, find the average order amount by year.
  select year(orderdate)as[year], avg (quantity) as[quantity]from Orders
  group by year(orderdate)


14-Using Products table, use CASE to group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
 select productname ,
 case
 when price <100 then 'low'
 when price>100 and price <500 then 'mid'
 when price > 500 then 'high'
 end as [pricegroup]
 from products


15-Using Customers table, list all unique cities where customers live, sorted alphabetically.

select distinct city from customers
  order by  city asc

16-Using Sales table, find total sales per product Id.

select productid,sum (SaleAmount) as [sum]from sales
group by productid

17-Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
select productname from Products
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
select productid,productname from  Products
except
select productid,productname from Products_Discounted


21-Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)

select productname as [name],count(SaleID)as[sale] from Products
join sales
on products.productid=sales.productid
group by productname 

22-Using Orders table, find top 5 products (by ProductID) with the highest order quantities.
SELECT top (5) ProductID, SUM(Quantity) as newquantity
FROM Orders
GROUP BY ProductID
ORDER BY newquantity DESC
