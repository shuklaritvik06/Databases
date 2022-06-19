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
