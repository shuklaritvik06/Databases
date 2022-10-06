# Commands

```SQL
CREATE DATABASE databasename

SHOW DATABASES

DROP DATABASE databasename

CREATE TABLE tableName(
  columnName dataType,
  columnName dataType,
  columnName dataType,
)

DROP TABLE tableName


TRUNCATE TABLE table_name    #Delete data but not table

ALTER TABLE table_name
ADD column_name datatype

ALTER TABLE table_name
DROP COLUMN column_name

ALTER TABLE table_name
ALTER COLUMN column_name datatype

CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
)
```

## Constraints



## NOT NULL, UNIQUE

```sql
CREATE TABLE test(
  studentID INT,
  studentName varchar(20) NOT NULL,
  CONSTRAINT Hello UNIQUE (studentID)
 );
 
 INSERT INTO test VALUES(2,NULL);
 
  
 ALTER TABLE test
 DROP CONSTRAINT Hello
 
 
ALTER TABLE Persons
ADD CONSTRAINT HEY UNIQUE (studentID); 

SELECT * FROM test
```

### Primary Key

```sql
CREATE TABLE test(
  studentID INT NOT NULL,
  studentName varchar(20) NOT NULL,
  CONSTRAINT Hello PRIMARY KEY (studentID)
 );
 
 INSERT INTO test VALUES(1,NULL);
 
  
 ALTER TABLE test
 DROP CONSTRAINT Hello
 
 
ALTER TABLE test
ADD CONSTRAINT HEY PRIMARY KEY (studentID); 

SELECT * FROM test 
```

### Foreign Key

```sql
CREATE TABLE test (
    studentID INT NOT NULL,
  studentName varchar(20) NOT NULL,
  PRIMARY KEY (studentID),
  CONSTRAINT Hello FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
 );
 
 INSERT INTO test VALUES(1,NULL);
 
  
 ALTER TABLE test
 DROP CONSTRAINT Hello
 
 
ALTER TABLE test
ADD CONSTRAINT HEY FOREIGN KEY (studentID); 

SELECT * FROM test 
);
```

### Check

We can also limit check to a certain column using this

```sql
CREATE TABLE tableName(
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
); 
```

### Default

```sql
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
); 


ALTER TABLE Persons
ALTER columnName ADD DEFAULT "VALUE"

ALTER TABLE Persons
ALTER columnName DROP DEFAULT
```

### Auto_increment

```sql
CREATE TABLE Persons (
    Personid int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (Personid)
); 

ALTER TABLE Persons Auto_Increment=100
```

### Views

```sql
CREATE VIEW [Mera view hai ye] AS
SELECT CustomerName,CustomerAddress
FROM Customers
WHERE CustomerName LIKE 'a%'

CREATE OR REPLACE VIEW [Mera view hai ye] AS
SELECT CustomerName
FROM Customers
WHERE CustomerName LIKE 'a%'

DROP VIEW [Mera view hai ye]
```

```sql

SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE Products.SupplierID = Suppliers.supplierID AND Price = 22); 
```

```sql
CREATE PROCEDURE myProcedure AS SELECT * FROM Products;
EXEC myProcedure;
```


```sql
SHOW GRANTS;
SHOW COLUMNS;
SHOW TABLES;
SHOW DATABASES;
SHOW SCHEMAS;
SHOW FULL TABLES;
SHOW TABLES FROM dbname;
SHOW WARNINGS;
```

```
update table_name set column_name=replace(column_name,prev_value,new_value)
```

### Select and Replace


```sql
REPLACE INTO Person (id, city)  
VALUES(4,'Amsterdam');  
```

### On Duplicate key update (If there is this key present already please do the update only)

```sql
INSERT INTO Student(Stud_ID, Name, Email, City)   
VALUES (4, 'John', 'john@javatpoint.com', 'New York')  
ON DUPLICATE KEY UPDATE City = 'California';  
```

### Insert ignore

```sql
INSERT IGNORE INTO table_name values (value1, value2, value3, ...);
```

### Insert into

```sql
INSERT INTO table_name select * from table2;
```

### Drop Index

```sql
DROP INDEX ON table_name;
```

### Index

```sql
CREATE INDEX index_name ON table_name (column_name);
```

### IN 

```sql
SELECT * FROM table_name WHERE column_name IN (value1, value2, ...);
```

### EXISTS

```sql
SELECT * FROM table_name WHERE EXISTS (SELECT column_name FROM table_name WHERE condition);
```

### unique key

```sql
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE KEY (ID)
); 
```

```sql
SHOW INDEX FROM TABLE
```

```sql
ALTER TABLE Persons DROP INDEX NAME
```

```sql
SELECT name,group_concat(columns) FROM table_name group by name
```
