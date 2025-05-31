create database homework_22
use homework_22

CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East')
Easy Questions
1-Compute Running Total Sales per Customer
select sale_id,
customer_id,
customer_name,
product_category,
product_name,
order_date,
region,
sum(total_amount)over( partition by customer_id order by order_date  rows between unbounded preceding and current row) as total_amount 
from sales_data 
ORDER BY 
    customer_id, order_date;




2-Count the Number of Orders per Product Category
select
product_category,

count(*) as count_orders
from sales_data 
group  BY 
    product_category
	order by  count_orders asc

3-Find the Maximum Total Amount per Product Category
select
product_category,

max(total_amount) as max_total_amount
from sales_data 
group  BY 
    product_category
	order by  max_total_amount asc

4-Find the Minimum Price of Products per Product Category
select
product_category,

min(unit_price ) as min_unit_price
from sales_data 
group  BY 
    product_category
	order by   min_unit_price asc


5-Compute the Moving Average of Sales of 3 days (prev day, curr day, next day)

select sale_id,
customer_id,
customer_name,
product_category,
product_name,
order_date,
region,
avg(total_amount)over(  order by order_date  rows between 1  preceding and 1 following) as  moving_avg_3_days
from sales_data 
ORDER BY 
    order_date 
6-Find the Total Sales per Region
select
region,

sum(total_amount) as sum_amount
from sales_data 
group  BY 
region
	order by  sum_amount asc

7-Compute the Rank of Customers Based on Their Total Purchase Amount


select 
customer_id,

customer_name,

sum(total_amount)as sum_amount,
 rank()over(order by sum(total_amount )desc ) as rank_amonut
from sales_data 
group  by
  customer_id,

customer_name
order by 
rank_amonut



8-Calculate the Difference Between Current and Previous Sale Amount per Customer
SELECT 
    sale_id,
    customer_id,
    customer_name,
    order_date,
    total_amount,
    LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_amount,
    total_amount - LAG(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS amount_difference
FROM 
    sales_data
ORDER BY 
    customer_id, order_date;

9-Find the Top 3 Most Expensive Products in Each Category

SELECT *
FROM (
    SELECT 
        product_category,
        product_name,
        unit_price,
        RANK() OVER (
            PARTITION BY product_category
            ORDER BY unit_price DESC
        ) AS price_rank
    FROM 
        sales_data
) ranked_products
WHERE price_rank <= 3
ORDER BY 
    product_category, price_rank;


10-Compute the Cumulative Sum of Sales Per Region by Order Date

SELECT 
    sale_id,
    region,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY region
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_sales
FROM 
    sales_data
ORDER BY 
    region, order_date;

11-Compute Cumulative Revenue per Product Category

SELECT 
    sale_id,
    product_category,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY product_category
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
FROM 
    sales_data
ORDER BY 
    product_category, order_date;



12-Here you need to find out the sum of previous values. Please go through the sample input and expected output.
create table id (id int)
insert into id (id) values (1)
insert into id (id) values (2)
insert into id (id) values (3)
insert into id (id) values (4)
insert into id (id) values (5)
select*, sum(id)over(order by id) as sumprevalues from id

13-Sum of Previous Values to Current Value
CREATE TABLE OneColumn (
    Value SMALLINT
);
INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);

select*,sum(value)over(order by value rows between 1 preceding and current row) as [sum of previous ]from OneColumn


14-Generate row numbers for the given data. The condition is that the first row number for every partition should be odd number.For more details please check the sample input and expected output.
CREATE TABLE Row_Nums (
    Id INT,
    Vals VARCHAR(10)
);
INSERT INTO Row_Nums VALUES
(101,'a'), (102,'b'), (102,'c'), (103,'f'), (103,'e'), (103,'q'), (104,'r'), (105,'p');





WITH PartitionedData AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Id ORDER BY Vals) AS rn
    FROM Row_Nums
),
Grouped AS (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY Id) AS grp
    FROM PartitionedData
),
FinalResult AS (
    SELECT *,
           ((grp - 1) * 2 + 1) + (rn - 1) AS RowNumber
    FROM Grouped
)
SELECT Id, Vals, RowNumber
FROM FinalResult
ORDER BY RowNumber;


15-Find customers who have purchased items from more than one product_category
select customer_id,customer_name from sales_data
group by customer_id,customer_name
having count(distinct product_category)>1


16-Find Customers with Above-Average Spending in Their Region

select*from sales_data
go
with cte as 
(select customer_id,customer_name,region,
sum(total_amount)over (partition by customer_id)as sum_amount, 
avg (total_amount)over (partition by region)as avg_amount from sales_data)
select DISTINCT customer_id, customer_name, region, sum_amount,avg_amount from cte 
where sum_amount>avg_amount

17-Rank customers based on their total spending (total_amount) within each region. If multiple customers have the same spending, they should receive the same rank.
with cte as(
select customer_id,customer_name,region,sum(total_amount) as sum_amount from sales_data   GROUP BY customer_id, customer_name, region)
select  customer_id,customer_name,region,DENSE_RANK()over(partition by region order by sum_amount desc)as spending_rank from cte
order by region,spending_rank

18-Calculate the running total (cumulative_sales) of total_amount for each customer_id, ordered by order_date.

select sale_id,
    customer_id,
    customer_name,
    order_date,
    total_amount, sum(total_amount)over(partition by customer_id order by order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) from sales_data 
	order by customer_id,order_date

19-Calculate the sales growth rate (growth_rate) for each month compared to the previous month.

select*from sales_data



select sale_id,
    customer_id,
    customer_name,
    order_date,
    total_amount, 
	sum(total_amount)over(partition by customer_id order by order_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) from sales_data 
	order by customer_id,order_date


20-Identify customers whose total_amount is higher than their last order''s total_amount.(Table sales_data)
with cte as(
SELECT 
    customer_id,
    customer_name,
    order_date,
    total_amount,
    LAG(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS last_order_amount
FROM sales_data)select  customer_id,
    customer_name,
    order_date,
    total_amount from cte 
WHERE total_amount > last_order_amount

21-Identify Products that prices are above the average product price
select*from sales_data
;with cte as(select product_name,total_amount,order_date,avg(total_amount)over(order by order_date) as avg_amount from sales_data)
select product_name,total_amount,order_date from cte 
where total_amount>avg_amount


22-In this puzzle you have to find the sum of val1 and val2 for each group and put that value at the beginning of the group in the new column. The challenge here is to do this in a single select. For more details please see the sample input and expected output.

CREATE TABLE MyData (
    Id INT, Grp INT, Val1 INT, Val2 INT
);
INSERT INTO MyData VALUES
(1,1,30,29), (2,1,19,0), (3,1,11,45), (4,2,0,0), (5,2,100,17);


select id,Grp,Val1,Val2,
case
when row_number()over(partition by grp order by id)=1
then sum(val1+val2)over(partition by grp)
else null
end as tot
from mydata



23-Here you have to sum up the value of the cost column based on the values of Id. For Quantity if values are different then we have to add those values.Please go through the sample input and expected output for details.
CREATE TABLE TheSumPuzzle (
    ID INT, Cost INT, Quantity INT
);
INSERT INTO TheSumPuzzle VALUES
(1234,12,164), (1234,13,164), (1235,100,130), (1235,100,135), (1236,12,136);
select*from TheSumPuzzle
select id,sum(cost) as cost,
sum(distinct Quantity) as quantity from TheSumPuzzle
group by id


24-From following set of integers, write an SQL statement to determine the expected outputs
CREATE TABLE Seats 
( 
SeatNumber INTEGER 
); 

INSERT INTO Seats VALUES 
(7),(13),(14),(15),(27),(28),(29),(30), 
(31),(32),(33),(34),(35),(52),(53),(54); 

select*from Seats



WITH Numbered AS (
    SELECT 
        SeatNumber,
        ROW_NUMBER() OVER (ORDER BY SeatNumber) AS RowNum
    FROM Seats
),
Groups AS (
    SELECT 
        SeatNumber,
        SeatNumber - RowNum AS grp
    FROM Numbered
),
Ranges AS (
    SELECT 
        MIN(SeatNumber) AS StartSeat,
        MAX(SeatNumber) AS EndSeat
    FROM Groups
    GROUP BY grp
),
Gaps AS (
    SELECT 
        LAG(EndSeat) OVER (ORDER BY StartSeat) + 1 AS GapStart,
        StartSeat - 1 AS GapEnd
    FROM Ranges
)
SELECT GapStart, GapEnd
FROM Gaps
WHERE GapStart <= GapEnd;
25-
create table my_table(id int,vals char)
insert into my_table values(101,'a')
insert into my_table values(102,'b')
insert into my_table values(102,'c')
insert into my_table values(103,'f')
insert into my_table values(103,'p')
insert into my_table values(103,'e')
insert into my_table values(104,'q')
insert into my_table values(105,'r')

WITH Numbered AS (
    SELECT 
        Id,
        Vals,
        ROW_NUMBER() OVER (PARTITION BY Id ORDER BY Vals) AS rn
    FROM my_table
)
SELECT 
    Id,
    Vals,
    2 * DENSE_RANK() OVER (ORDER BY Id) -1 + rn AS Changed
FROM Numbered
ORDER BY Changed;
