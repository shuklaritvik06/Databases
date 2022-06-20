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


