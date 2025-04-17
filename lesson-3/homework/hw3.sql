1-Define and explain the purpose of BULK INSERT in SQL Server

BULK INSERT is a Transact-SQL (T-SQL) command that loads data from a data file into a table using a minimal logging process, which makes it much faster than inserting rows one-by-one
The main goal of BULK INSERT is:

High-speed data import – it’s ideal for importing big datasets.

Efficient performance – compared to using INSERT INTO in a loop.

Automation – commonly used in ETL (Extract, Transform, Load) processes.


2-List four file formats that can be imported into SQL Server

Here are four file formats that can be imported into SQL Server:

CSV (Comma-Separated Values)

Most common format for tabular data.

Each row is a new line, and columns are separated by commas.

TXT (Plain Text Files)

Often used with custom delimiters like tabs (\t) or pipes (|).

Useful for flexible, raw data imports.

XML (eXtensible Markup Language)

Hierarchical format, used for structured data.

SQL Server can parse and import XML using OPENXML or XML data type.

JSON (JavaScript Object Notation)

Lightweight format for structured data, especially from APIs.

SQL Server supports JSON import using OPENJSON and JSON_VALUE

3-Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2))

create table products (ProductID int primary key,Productname varchar(50),Price decimal (10,2) )

4-Insert three records into the Products table using INSERT INTO

insert into Products values (1,'ball',12.1)
insert into Products values (2,'toy',11)
insert into Products values (3,'car',13.33)

5-Explain the difference between NULL and NOT NULL with examples

NULL
Means no value or unknown value.

It’s not the same as 0 or an empty string.

Used when a value is optional.

🔸 NOT NULL
Means a column must have a value.

You can’t insert or leave a blank (NULL) value in this column.

6-Add a UNIQUE constraint to the ProductName column in the Products table

alter table products
add constraint UNique_PRODUCT_name   UNIQUE (ProductName)

7-Write a comment in a SQL query explaining its purpose

-- This query retrieves the names and prices of all products that cost more than $50
SELECT ProductName, Price
FROM Products
WHERE Price > 50;

8-Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE

create table Categories (CategoryID int PRIMARY KEY,CategoryName varchar(50)UNIQUE )

9-Explain the purpose of the IDENTITY column in SQL Server.

In SQL Server, the IDENTITY column is used to automatically generate unique numeric values for a column, often used as a primary key.

 Purpose of the IDENTITY column:
Automatically assigns a number to each new row inserted into the table.

Removes the need to manually insert or manage unique IDs.

Ensures each row has a unique identifier.

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

10-Use BULK INSERT to import data from a text file into the Products table.

bulk insert Customers
from 'C:\Users\User\Desktop\Class_3.txt'
with
(
firstrow=2,
Fieldterminator = ',',
rowterminator = '\n'
)

Select * from Customers
where id =


11-Create a FOREIGN KEY in the Products table that references the Categories table.

select*from Categories

select*from products

alter table Categories
add constraint FK_category_ID foreign key (categoryID) references products(ProductID)

12-Explain the differences between PRIMARY KEY and UNIQUE KEY with examples.

A PRIMARY KEY uniquely identifies each row in a table.

Key Points:
Only one PRIMARY KEY allowed per table.

Cannot contain NULL values.

Automatically creates a unique index.
 Example:
sql
Копировать код
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);
A UNIQUE constraint also ensures all values in a column are unique.

Key Points:
You can have multiple UNIQUE keys in a table.

Allows one NULL value per column (behavior may vary slightly by database).

Enforces uniqueness, but not as strictly as a PRIMARY KEY.
 Example:
sql
Копировать код
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);


13-Add a CHECK constraint to the Products table ensuring Price > 0.

alter table products
add constraint chk_price_1 
check (price>0)

14-Modify the Products table to add a column Stock (INT, NOT NULL)

ALTER TABLE Products
ADD Stock INT NULL

15-Use the ISNULL function to replace NULL values in a column with a default value

select*from products

ISNULL(column_name, default_value)

16-Describe the purpose and usage of FOREIGN KEY constraints in SQL Server

Purpose of FOREIGN KEY:
To link two tables together.

To ensure that a record in the child table references a valid record in the parent table.

To prevent invalid data from being inserted into the child table.

Usage Example:
Suppose you have two tables:
Customers (parent) and Orders (child)

sql
Копировать код
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


17-Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.

create table customers (CustomersID int identity,firstname varchar (50),lastname varchar(50), Age int check (age>= 18))

18-Create a table with an IDENTITY column starting at 100 and incrementing by 10.

create table check_identity (ID int identity(100,10),[name]varchar(50) )

19-Write a query to create a composite PRIMARY KEY in a new table OrderDetails.

create table OrderDetails (ID int primary key,firstname varchar(50),lastname varchar (50))

20-Explain with examples the use of COALESCE and ISNULL functions for handling NULL values.
ISNULL(expression, replacement_value)
SELECT ISNULL(NULL, 'No Value') AS Result; 

SELECT ProductName, ISNULL(Discount, 0) AS Discount
FROM Products;

21-Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email

create table Employees (EmpID int primary key,Email varchar(50) unique )

22-Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name NVARCHAR(100)
);

-- Child Table with FOREIGN KEY and CASCADE options
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
