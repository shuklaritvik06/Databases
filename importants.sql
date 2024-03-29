-- Create Table

CREATE TABLE IF NOT EXISTS MY_TABLE(
  ID SERIAL PRIMARY KEY,
  NAME TEXT NOT NULL UNIQUE,
  AGE INTEGER NOT NULL CHECK (AGE<=20),
  SALARY DECIMAL(10,2) NOT NULL,
  COURSEWORK VARCHAR(266) NOT NULL,
  COLLEGE TEXT NOT NULL,
  PASSED BOOLEAN DEFAULT TRUE
);

-- INSERT

INSERT INTO MY_TABLE (NAME, AGE, SALARY, COURSEWORK, COLLEGE, PASSED) 
VALUES ('John D', 18, 2500.00, 'Computer Science', 'ABC University', TRUE);

-- SELECT

SELECT * FROM my_table;

-- ALTER
ALTER TABLE my_table DROP COLUMN NEW_COLUMN;
ALTER TABLE my_table ADD COLUMN NEW_COLUMN VARCHAR(200);
ALTER TABLE my_table ADD CONSTRAINT my_table_pk PRIMARY KEY (NEW_COLUMN);
ALTER TABLE my_table RENAME COLUMN NEW_COLUMN TO NEW_COLUMN_TWO;
ALTER TABLE my_table DROP CONSTRAINT my_table_pk;
ALTER TABLE my_table ADD CONSTRAINT my_table_fk FOREIGN KEY (column_name) REFERENCES other_table(other_column);
ALTER TABLE my_table DROP CONSTRAINT my_table_fk;
ALTER TABLE my_table ALTER COLUMN NAME SET DEFAULT 'RAMESH';
ALTER TABLE my_table ALTER COLUMN NAME DROP DEFAULT;

-- Distinct
SELECT DISTINCT name FROM my_table;

-- Order by
SELECT age FROM my_table ORDER BY age ASC;

-- AND OR NOT
SELECT * FROM my_table WHERE AGE=10 OR AGE=12;
SELECT * FROM my_table WHERE AGE BETWEEN 10 AND 12;
SELECT * FROM my_table WHERE AGE IS NOT NULL;
SELECT * FROM my_table WHERE AGE IS NULL;
SELECT * FROM my_table WHERE AGE NOT BETWEEN 10 AND 12;
SELECT * FROM my_table WHERE NOT AGE>12;
SELECT * FROM my_table WHERE NOT AGE IN (10,12,3);

-- Update
UPDATE my_table SET AGE=13 WHERE id=1;
UPDATE my_table SET AGE=1;  --(set for all)

-- Delete
DELETE FROM my_table WHERE AGE=10;
DELETE FROM my_table; --(delete all)

-- Limit Offset and TOP ETC
SELECT * FROM my_table LIMIT 2 OFFSET 1;
SELECT * FROM my_table FETCH FIRST 3 ROWS ONLY;

-- AGGREGATION

SELECT COUNT(*) FROM my_table;
SELECT SUM(age) FROM my_table;
SELECT MIN(age) FROM my_table;
SELECT MAX(age) FROM my_table;

-- LIKE, WILDCARDS

SELECT * FROM my_table WHERE name LIKE '%a___b__[a-z]%';
SELECT AVG(age) FROM my_table;
SELECT COUNT(DISTINCT age) FROM my_table;

-- SELECT 
SELECT NAME, AGE || ' YEARS' AS AGE_DESCRIPTION FROM my_table;
SELECT NAME, CONCAT(AGE,' YEARS') AS AGE_DESCRIPTION FROM my_table;
SELECT * FROM my_table WHERE AGE > SOME (SELECT AGE FROM my_table WHERE AGE > 10);
SELECT * FROM my_table WHERE AGE > ANY (SELECT AGE FROM my_table WHERE AGE > 10);

-- PROCEDURES

CREATE TEMP TABLE temp_output (
    new_salary DECIMAL(10,2),
    passed BOOLEAN
);

CREATE OR REPLACE PROCEDURE hello_bro (
    IN match_age INT,
    IN new_student_age INT,
    IN new_salary DECIMAL(10,2),
    IN new_passed BOOLEAN,
    OUT student_new_salary DECIMAL(10,2),
    OUT student_passed BOOLEAN
) LANGUAGE plpgsql AS $$
DECLARE
    stud_age INT;
    stud_salary DECIMAL(10,2);
    stud_passed BOOLEAN;
    stud_match_age INT;
BEGIN
    stud_age := new_student_age;
    stud_salary := new_salary;
    stud_passed := new_passed;
    stud_match_age := match_age;
    
    UPDATE my_table 
    SET age = stud_age, 
        salary = stud_salary, 
        passed = stud_passed 
    WHERE age = stud_match_age;
    
    student_passed := stud_passed;
    student_new_salary := stud_salary;
    COMMIT;
END $$;

DO $$
DECLARE
    stud_new_sal DECIMAL(10,2);
    stud_new_pass BOOLEAN;
BEGIN
    CALL hello_bro(20, 12, 10000, false, stud_new_sal, stud_new_pass);
    INSERT INTO temp_output(new_salary, passed) VALUES (stud_new_sal, stud_new_pass);
    RAISE NOTICE 'New salary: %, Passed: %', stud_new_sal, stud_new_pass;
END $$;

SELECT * FROM temp_output;


-- CASE
SELECT
    name,
    CASE
        WHEN age <= 10 THEN 'Child'
        WHEN age <= 20 THEN 'Teenager'
        ELSE 'Adult'
    END AS age_group
FROM my_table;

-- INSERT INTO SELECT
INSERT INTO my_table (name, age, salary, coursework, college) SELECT name, age, salary, coursework, college FROM other_table WHERE some_condition;

-- SELECT INTO
SELECT name, age, salary INTO new_table FROM my_table WHERE age > 11;
CREATE TABLE new_table AS SELECT name, age, salary FROM my_table WHERE age > 11;

-- GROUP BY
SELECT college, COUNT(*) AS student_count FROM my_table GROUP BY college;
SELECT college, SUM(SALARY) AS student_salary FROM my_table GROUP BY college;
SELECT college, AVG(SALARY) AS student_salary FROM my_table GROUP BY college;
SELECT college, AVG(age) AS average_age FROM my_table GROUP BY college HAVING AVG(age) > 25;

-- JOIN

-- 1. INNER JOIN: Returns rows when there is a match in both tables.
SELECT my_table.*, other_table.*
FROM my_table
INNER JOIN other_table ON my_table.column_name = other_table.column_name;

-- 2. LEFT JOIN: Returns all rows from the left table, and the matched rows from the right table.
SELECT my_table.*, other_table.*
FROM my_table
LEFT JOIN other_table ON my_table.column_name = other_table.column_name;

-- 3. RIGHT JOIN: Returns all rows from the right table, and the matched rows from the left table.
SELECT my_table.*, other_table.*
FROM my_table
RIGHT JOIN other_table ON my_table.column_name = other_table.column_name;

-- 4. FULL OUTER JOIN: Returns all rows when there is a match in either table.
SELECT my_table.*, other_table.*
FROM my_table
FULL OUTER JOIN other_table ON my_table.column_name = other_table.column_name;

-- 5. CROSS JOIN: Returns the Cartesian product of the two tables.
SELECT my_table.*, other_table.*
FROM my_table
CROSS JOIN other_table;

-- 6. SELF JOIN: Joins a table to itself, useful for comparing rows within the same table.
SELECT a.*, b.*
FROM my_table a
JOIN my_table b ON a.column_name = b.column_name;

-- UNION
SELECT * FROM my_table UNION ALL SELECT * FROM my_table;
SELECT * FROM my_table UNION SELECT * FROM my_table;
