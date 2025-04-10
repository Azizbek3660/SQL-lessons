1-Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2))
drop table employees

create table employees ([EmpID] int, [name] varchar (50), salary decimal (20,2))
select * from employees
 
 2-Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert)

insert into employees values (1,'jack',12.3)
insert into employees select 5,'jim',12.3
insert into employees values (4,'black',12.2),(5,'jimi',14.5)

3-Update the Salary of an employee where EmpID = 1.

update employees
set salary = 15
where empID = 1

4-Delete a record from the Employees table where EmpID = 2

delete from Employees 
where empID = 2

5-Demonstrate the difference between DELETE, TRUNCATE, and DROP commands on a test table.

DELETE Command Purpose:
Removes specific rows from a table using a WHERE clause.

Key Points:
Can delete some or all rows.

Keeps the table structure and schema.

Supports WHERE clause.

Can be rolled back in a transaction.

Triggers are fired.

 TRUNCATE Command
 Purpose:
Removes all rows from a table quickly and efficiently

DROP Command
 Purpose:
Completely deletes the table from the database.

6-Modify the Name column in the Employees table to VARCHAR(100)

alter table employees
alter column name varchar (100)

7-Add a new column Department (VARCHAR(50)) to the Employees table.

alter table employees
add Department varchar(50)
select * from employees

8-Change the data type of the Salary column to FLOAT.
alter table employees 
alter column salary  float

9-Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50))

create table Departments ([Department ID] int primary key , [Department Name]varchar(50))
drop table Departments

select * from departments

10-Remove all records from the Employees table without deleting its structure.
delete from employees
truncate table employees 

11-Insert five records into the Departments table using INSERT INTO SELECT from an existing table.

insert into Departments select 2, 'jimm'
insert into Departments select 3, 'Ann'
insert into Departments select 4, 'Sarah'
insert into Departments select 5, 'Bill'
insert into Departments select 6, 'Tom'
select * from departments

12-Update the Department of all employees where Salary > 5000 to 'Management'.

update employees
set department = 'Management'
where salary > 5000

13-Write a query that removes all employees but keeps the table structure intact.
delete from employees
truncate table employees

14-Drop the Department column from the Employees table

alter table employees
drop column departments 

15-Rename the Employees table to StaffMembers using SQL commands

RENAME TABLE Employees TO StaffMembers;

16-Write a query to completely remove the Departments table from the database

drop table departments

17-Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)

create table Products ([product ID] int primary key , [product name] varchar(20), category varchar(20) , price decimal)

18-Add a CHECK constraint to ensure Price is always greater than 0

ALTER TABLE CountryList
NOCHECK CONSTRAINT 
CK__CountryLi__Count__62AFA012

19-Modify the table to add a StockQuantity column with a DEFAULT value of 50.

alter table products
add Stock_Quantity int default 50

20-Rename Category to ProductCategory
alter table products
exec sp_rename 'dbo,products,category','ProductCategory','column'

21-insert 5 records into the Products table using standard INSERT INTO queries
insert into products values(1,'apple','fruit',12)
insert into products values(2,'banan','fruit',11)
insert into products values(3,'carrot','vegeteble',10)
insert into products values(4,'vatermelon','fruit',9)
insert into products values(5,'cherry','fruit',16)

22-Use SELECT INTO to create a backup table called Products_Backup containing all Products data

select * into Products_Backup from Products

23-Rename the Products table to Inventory.

EXEC sp_rename 'Products', 'Inventory'

24-Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT

alter table inventory
alter column price  float

25-Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5

alter table inventory 
add  ProductCode int identity (1000,5)
 
