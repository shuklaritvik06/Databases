## Some Advanced MySQL features

```sql
mysqldump -u root sample > sample.sql
```

```sql
LOAD DATA INFILE 'file.txt' INTO TABLE table_name FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 ROWS;
```

```sql
SELECT UUID()
```

- There are some cool functions like DATE_SUB and DATE_ADD,DATEDIFF() and DATE_FORMAT().

```sql
SELECT DATE_ADD('2020-02-01', INTERVAL 3 MONTH) AS MONTH_LATER,   
DATE_SUB('2020-02-01',INTERVAL 3 MONTH) AS MONTH_BEFORE;  
```

```sql
SELECT TIMESTAMPADD(unit, interval, expression)
```

```sql
SELECT EXTRACT(unit FROM expression)
```

```sql
SELECT * FROM table_name ORDER BY RAND() LIMIT 1;
```

### Delete Duplicate Records

```sql
DELETE FROM table_1 INNER JOIN table_2 USING (id) WHERE table_1.id < table_2.id AND table_1.name = table_2.name;
```

### JSON

```sql
CREATE TABLE HELLO (ID INT,JSON json_);
```

```sql
INSERT INTO HELLO VALUES (1,'{"name":"John","age":30,"city":"New York"}');
```

```sql
SELECT json_->'$.name' FROM HELLO;
```

Without Inverted Commas

```sql
SELECT json_->>$.name FROM HELLO;
```

### Prepare

```sql
PREPARE stmt1 FROM   
'SELECT Name, Designation FROM employee   
WHERE Emp_id = ?';
```

```sql
SET @emp_id = 1;
```

```sql
EXECUTE stmt1 USING @emp_id;
```

```sql
SELECT CURDATE();
```

```sql
CREATE FUNCTION hello (ID INT) RETURNS VARCHAR(20)
DECLARE de_name VARCHAR( 20 ) DEFAULT "";  
SELECT name INTO de_name FROM designation WHERE id=ID;  
RETURN de_name;
```

### COALESCE

return first non null value

```sql
SELECT COALESCE(NULL,'A','B',1);
```

### CONVERT

```sql
SELECT CONVERT('2020-02-01',DATE);
```

### CAST

```sql
SELECT CAST('2020-02-01' AS DATE);
```

### SET

```sql
SET("","","")
```

### UNION AND UNION ALL

```sql
SELECT * FROM table_1 UNION SELECT * FROM table_2;
```

```sql
SELECT * FROM table_1 UNION ALL SELECT * FROM table_2;
```

### Partition

```sql
CREATE TABLE table_name (
    id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
) PARTITION BY RANGE (id) (
    PARTITION p0 VALUES LESS THAN (6),
    PARTITION p1 VALUES LESS THAN (11),
    PARTITION p2 VALUES LESS THAN (16),
    PARTITION p3 VALUES LESS THAN MAXVALUE
);
```

### Transaction

```sql
START TRANSACTION;  
  
SELECT * FROM Orders;  
  
INSERT INTO Orders(order_id, prod_name, order_num, order_date)   
VALUES (6, 'Printer', 5654, '2020-01-10');  
  
SAVEPOINT my_savepoint;  
  
INSERT INTO Orders(order_id, prod_name, order_num, order_date)   
VALUES (7, 'Ink', 5894, '2020-03-10');  
  
ROLLBACK TO SAVEPOINT my_savepoint;  
  
INSERT INTO Orders(order_id, prod_name, order_num, order_date)   
VALUES (8, 'Speaker', 6065, '2020-02-18');  
  
COMMIT;
```

### CTE

```sql
WITH cte_name AS (
    SELECT * FROM table_name
)
SELECT * FROM cte_name;
```

