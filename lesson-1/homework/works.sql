1. Define the following terms: data, database, relational database, and table.

Data- is defined as a collection of individual facts or statistics. Data can come in the form of text, observations, figures, images, numbers, graphs, or symbols. For example, data might include individual prices, weights, addresses, ages, names, temperatures, dates, or distances.

Data is a raw form of knowledge and, on its own, doesn’t carry any significance or purpose. In other words, you have to interpret data for it to have meaning. Data can be simple—and may even seem useless until it is analyzed, organized, and interpreted.

Database-A database is an organized collection of data that can be easily accessed, managed, and updated.
In simple words:
A database is like a digital storage where data is kept in a structured way for easy use

relational database-A relational database stores data in multiple tables that are related to each other using keys.
In simple words:
It’s a type of database where data is split into tables and connected by common fields

table-A table is a structure in a database consisting of rows and columns where data is stored.
In simple words:
A table is like a spreadsheet where each row is a record and each column is a data field

2.Data Storage & Management

SQL Server efficiently stores, organizes, and retrieves large amounts of data using relational tables.

Security Features

Includes authentication (Windows/SQL), encryption, and role-based access control to protect your data.

Backup & Restore

Offers reliable backup and restore options to protect data from loss or corruption.

High Availability & Disaster Recovery

Supports features like Always On Availability Groups, failover clustering, and replication for uptime and resilience.

Integration & BI Tools

Comes with tools like SSIS (Integration Services), SSRS (Reporting Services), and SSAS (Analysis Services) for data integration, reporting, and analysis

3-What are the different authentication modes available when connecting to SQL Server? (Give at least 2)

There are two main authentication modes available when connecting to SQL Server:

Windows Authentication – In this mode, the user connects to SQL Server using their Windows login credentials. It is considered more secure because it relies on the Windows operating system for authentication.

SQL Server Authentication – In this mode, the user connects using a separate SQL Server username and password. It does not depend on the Windows system. For example: connecting using the sa (system administrator) account.


MEDIUM
4-Create a new database in SSMS named SchoolDB

create database schoolIDB
USE schoolIDB

5-create table Students ([student id] int,[name] varchar (50), age int) 
select*from students
  

6- SQL (Structured Query Language)
What it is: A language used to communicate with and manage databases.

Purpose: You use SQL to write queries like SELECT, INSERT, UPDATE, and DELETE to interact with data


 SQL Server
What it is: A relational database management system (RDBMS) developed by Microsoft.

Purpose: It stores and manages data in databases, and it executes SQL queries.

Think of it as: The engine or platform where your data lives and gets processed
 SSMS (SQL Server Management Studio)
What it is: A graphical user interface (GUI) tool for managing SQL Server.

Purpose: It helps you visually manage databases, write and run SQL queries, create tables, back up data, etc.

Think of it as: The tool or workspace that helps you interact with SQL Server more easily.

7-DQL (DATA QUERY LANGUAGE) 

DML (Data Manipulation Language) – ma’lumotlar bilan ishlash:

SELECT, INSERT, UPDATE, DELETE

DDL (Data Definition Language) – ma’lumotlar bazasining strukturasini boshqarish:

CREATE, ALTER, DROP

DCL (Data Control Language) – ruxsatlarni boshqarish:

GRANT, REVOKE

TCL (Transaction Control Language) – tranzaksiyalarni boshqarish:

COMMIT, ROLLBACK, SAVEPOINT

8-Write a query to insert three records into the Students table

insert into students  (ID int,[students name] varchar(50),age int)
values (1,John,25),
(2,jack,26),
(3,Allan,27)

9-Create a backup of your SchoolDB database and restore it. (write its steps to submit)

Open SQL Server Management Studio (SSMS).

Connect to the database server.

In Object Explorer, right-click on SchoolDB.

Select:
Tasks → Back Up...

In the Backup window:

Backup type: Full

Destination: Choose location (e.g., C:\Backups\SchoolDB.bak)

Click OK to create the backup

In SSMS, right-click on Databases → Restore Database...

Select:

Source: Device

Click ... → Add your .bak file.

Set Database name (same or new).

Go to Options tab:

Check Overwrite the existing database if needed.

Click OK to restore.

