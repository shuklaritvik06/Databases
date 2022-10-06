### Useful

```SQL
SELECT * FROM TABLE

SELECT columns FROM TABLE

SELECT DISTINCT columns FROM TABLE

SELECT COUNT(DISTINCT column) FROM TABLE

SELECT * FROM TABLE WHERE condition

SELECT * FROM TABLE WHERE NOT condition

SELECT column FROM TABLE WHERE condition1 AND condition 

SELECT column FROM TABLE WHERE condition1 OR condition 

SELECT column FROM TABLE WHERE condition1 AND (condition OR condition)

SELECT * FROM TABLE ORDER BY column ASC, column DESC (ASC is default)

INSERT INTO Customers (column names) VALUES (values);

SELECT column FROM TABLE WHERE column IS NULL

SELECT column FROM TABLE WHERE column IS NOT NULL

UPDATE TABLE SET column=Value,column=value.. WHERE condition

DELETE FROM TABLE WHERE condition

SELECT * FROM TABLE
WHERE column IN (values);

SELECT * FROM TABLE
WHERE column NOT IN (values);


SELECT * FROM Products
WHERE column BETWEEN start AND end;
```

### SQL Functions

```SQL
SELECT MAX(column) AS alias
FROM TABLE; 

SELECT MIN(column) AS alias
FROM TABLE; 


SELECT AVG(column) AS alias
FROM TABLE; 


SELECT COUNT(column) AS alias
FROM TABLE; 


SELECT SUM(column) AS alias
FROM TABLE; 

```

### Filtering Pattern

```SQL
SELECT column
FROM TABLE
WHERE columnN LIKE pattern;
```

Pattern includes wildcards:    

- `%` 	Represents zero or more characters
- `_` 	Represents a single character
- `[]` 	Represents any single character within the brackets
- `^` 	Represents any character not in the bracket
- `-` 	Represents any single character within the specified range

### Inner Join/Join

Joins the table on the basis of the match found in both table based on the condition 

```SQL

SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID; 
```
### Left Join & Right Join

- Left Join => Inner Join+Extra records from the left table which do not found a match
- Right Join => Inner Join+Extra records from the right table which do not found a match

```SQL
SELECT column
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;
```

```SQL
SELECT column
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
```

### Full Join

- Full Join => Inner Join+Extra records from the right table which do not found a match+Extra records from the left table which do not found a match

```SQL
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;
```

### Self Join

```SQL
SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;
```

### Natural Join

```SQL
SELECT Customers.CustomerName,Customers.CustomerAddress,Orders.Order
FROM Customers
NATURAL JOIN Orders;
```

### Cross Join

Cartesian Product

```SQL
SELECT Customers.CustomerName,Customers.CustomerAddress,Orders.Order
FROM Customers
CROSS JOIN Orders;
```

### Union

```SQL
SELECT CustomerName
FROM Customers
UNION
SELECT CustomerName
FROM Orders
```

Also show duplicate entries

```SQL
SELECT CustomerName
FROM Customers
UNION ALL
SELECT CustomerName
FROM Orders
```
