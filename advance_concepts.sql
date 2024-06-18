GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA my_schema TO davide;
GRANT USAGE ON SCHEMA my_schema TO davide;

-- TRIGGER

-- Create the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    department TEXT,
    salary NUMERIC
);

-- Create the account_log table if it doesn't exist
CREATE TABLE IF NOT EXISTS account_log (
    old_data TEXT,
    new_data TEXT,
    change_date TIMESTAMP
);

-- Example of a trigger function in PL/pgSQL
CREATE OR REPLACE FUNCTION log_employee_update()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO account_log (old_data, new_data, change_date)
    VALUES (ROW(OLD.*)::TEXT, ROW(NEW.*)::TEXT, current_timestamp);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Example of creating a trigger for employees table
CREATE TRIGGER log_employee_update_trigger
AFTER UPDATE ON employees
FOR EACH ROW
WHEN (OLD.* IS DISTINCT FROM NEW.*)
EXECUTE FUNCTION log_employee_update();

-- Insert example data into employees table
INSERT INTO employees (first_name, last_name, department, salary) VALUES ('John', 'Doe', 'IT', 50000);
INSERT INTO employees (first_name, last_name, department, salary) VALUES ('Jane', 'Smith', 'HR', 60000);

-- Update an employee to trigger the log_employee_update_trigger
UPDATE employees
SET department = 'Finance'
WHERE employee_id = 1;

-- Query the account_log table to see the logged changes
SELECT * FROM account_log;



-- Create a complex function to calculate the total order amount including taxes and discounts
CREATE OR REPLACE FUNCTION calculate_order_total(p_order_id INT)
RETURNS NUMERIC AS $$
DECLARE
    total NUMERIC := 0;
    item_total NUMERIC := 0;
    order_discount NUMERIC := 0;
    tax_rate NUMERIC := 0.10;  -- 10% tax rate
BEGIN
    -- Calculate the total amount of all items in the order
    FOR item_total IN
        SELECT quantity * unit_price
        FROM order_items
        WHERE order_id = p_order_id
    LOOP
        total := total + item_total;
    END LOOP;

    -- Fetch the discount for the order
    SELECT orders.discount INTO order_discount
    FROM orders
    WHERE order_id = p_order_id;

    -- Apply discount
    total := total - (total * order_discount / 100);

    -- Apply tax
    total := total + (total * tax_rate);

    RETURN total;
END;
$$ LANGUAGE plpgsql;

-- Example tables for testing
CREATE TABLE if not exists orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    discount NUMERIC
);

CREATE TABLE if not exists order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(order_id),
    product_id INT,
    quantity INT,
    unit_price NUMERIC
);

-- Insert example data into orders table
INSERT INTO orders (customer_id, order_date, discount) VALUES (1, '2024-06-18', 10);

-- Insert example data into order_items table
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES (1, 101, 2, 50);
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES (1, 102, 1, 100);

-- Example query using the complex function
SELECT calculate_order_total(1) AS total_order_amount;

-- Create PL/pgSQL extension
CREATE EXTENSION IF NOT EXISTS plpgsql;

-- Create PL/Python extension (if required)
-- CREATE EXTENSION IF NOT EXISTS plpython3u;

-- Example of creating a function in SQL
CREATE FUNCTION add(integer, integer)
RETURNS integer
AS 'SELECT $1 + $2;'
LANGUAGE SQL;

-- Example query using the function
SELECT add(1, 3);

-- Example of creating a function in PL/pgSQL
CREATE FUNCTION increment_by_one(val integer)
RETURNS integer AS $$
BEGIN
    RETURN val + 1;
END;
$$ LANGUAGE plpgsql;

-- Example query using the PL/pgSQL function
SELECT increment_by_one(10);

-- Example of creating a function in PL/Python
CREATE FUNCTION pymax(a integer, b integer)
RETURNS integer
AS $$
if a > b:
    return a
return b
$$ LANGUAGE plpython3u;

-- Example query using the PL/Python function
SELECT pymax(3, 5);

-- Example of a function with nested dollar-quoted strings in PL/pgSQL
CREATE FUNCTION check_special_chars(text) RETURNS boolean AS $func$
BEGIN
    RETURN ($1 ~ $q$[\t\r\n\v\\]$q$);
END;
$func$ LANGUAGE plpgsql;

-- Example of creating a procedure in SQL
CREATE PROCEDURE insert_data(a integer, b integer)
LANGUAGE SQL
AS $$
INSERT INTO tbl (column1) VALUES (a);
INSERT INTO tbl (column1) VALUES (b);
$$;

-- Example call to the procedure
-- CALL insert_data(1, 2);

-- Example of a trigger function in PL/pgSQL
CREATE FUNCTION log_account_update()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO account_log (old_data, new_data, change_date)
    VALUES (OLD.*, NEW.*, current_timestamp);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Example of creating a trigger
CREATE TRIGGER log_update
AFTER UPDATE ON accounts
FOR EACH ROW
WHEN (OLD.* IS DISTINCT FROM NEW.*)
EXECUTE FUNCTION log_account_update();

-- Example of dropping a trigger
-- DROP TRIGGER IF EXISTS log_update ON accounts;

-- Creating a table to test the trigger and procedures
CREATE TABLE accounts (
    account_id serial PRIMARY KEY,
    account_name text,
    balance integer
);

CREATE TABLE account_log (
    log_id serial PRIMARY KEY,
    old_data text,
    new_data text,
    change_date timestamp
);

-- Insert initial data into accounts table
INSERT INTO accounts (account_name, balance) VALUES ('Alice', 1000);
INSERT INTO accounts (account_name, balance) VALUES ('Bob', 1500);

-- Update data to trigger the log_update trigger
UPDATE accounts SET balance = 1200 WHERE account_name = 'Alice';

-- Rank, Dense Rank, row_number

-- Rank will give same rank to the same value and the next would be +2 rank from this
SELECT RANK() OVER (ORDER BY AGE ASC) AS rank_age FROM my_table;
-- DENSE_RANK will give same rank to the same value and the next would be +1 rank from this
SELECT DENSE_RANK() OVER (ORDER BY AGE ASC) AS dense_rank_age FROM my_table;
-- ROW_NUMBER will never give same rank to the same value
SELECT ROW_NUMBER() OVER (ORDER BY AGE ASC) AS row_number_age FROM my_table;

-- Partition The Dataset
SELECT *, RANK() OVER (PARTITION BY coursework ORDER BY AGE ASC) FROM my_table;

-- Rows Between

SELECT *, SUM(age) OVER(ORDER BY AGE ASC ROWS BETWEEN 2 PRECEDING AND 3 FOLLOWING) AS age_before_after FROM my_table;
SELECT *, SUM(age) OVER(ORDER BY AGE ASC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS age_before_after FROM my_table;
SELECT *, SUM(age) OVER(ORDER BY AGE ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT_ROW) AS age_before_after FROM my_table;

 -- First Value, Last Value, Nth Value
SELECT
  FIRST_VALUE(salary) OVER (
    PARTITION BY
      coursework
    ORDER BY
      AGE ASC
  ) AS FIRST_VALUE_SALARY
FROM
  my_table;

SELECT
  LAST_VALUE(salary) OVER (
    PARTITION BY
      coursework
    ORDER BY
      AGE ASC ROWS BETWEEN UNBOUNDED PRECEDING
      AND UNBOUNDED FOLLOWING
  ) AS LAST_VALUE_SALARY
FROM
  my_table;

SELECT
  NTH_VALUE(salary,2) OVER (
    PARTITION BY
      coursework
    ORDER BY
      AGE ASC
  ) AS SECOND_SALARY
FROM
  my_table;

-- Moving Average
SELECT AVG(salary) OVER (PARTITION BY coursework ORDER BY AGE ASC ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) FROM my_table;

 -- Lead and Lag
-- Whenever we have to deal with the rows which are coming below the current row LEAD
-- Whenever we have to deal with the rows which are coming above the current row LAG

-- LEAD

SELECT
  NAME,
  COURSEWORK,
  AGE,
  LEAD(AGE) OVER (
    PARTITION BY
      coursework
    ORDER BY
      AGE ASC
  ) AS next_age,
  age - LEAD(age) OVER (
    PARTITION BY
      coursework
    ORDER BY
      AGE ASC
  ) as previous_age
FROM
  my_table;

-- LAG

SELECT
  NAME,
  COURSEWORK,
  AGE,
  LAG(AGE) OVER (
    PARTITION BY
      coursework
    ORDER BY
      AGE ASC
  ) AS prev_age,
  age - LAG(age) OVER (
    PARTITION BY
      coursework
    ORDER BY
      AGE ASC
  ) as difference
FROM
  my_table;


-- nth_value

SELECT
  NAME,
  AGE,
  NTH_VALUE(AGE, 2) OVER (
    PARTITION BY
      COURSEWORK ORDER BY AGE ASC
    ROWS BETWEEN UNBOUNDED PRECEDING
      AND UNBOUNDED FOLLOWING
  ) FOURTH_AGE
FROM
  my_table;

-- nth_tile

SELECT
  NAME,
  CASE
    WHEN NTILE(2) OVER (
      PARTITION BY
        COURSEWORK
      ORDER BY
        AGE ASC
    ) = 1 THEN 'Adult'
    ELSE 'Younger'
  END AS age
FROM
  my_table;

-- With CTEs

WITH avg_age AS (
    SELECT 
			AVG(AGE) as avg_age        
    FROM 
        my_table
    GROUP BY 
        COURSEWORK
)
SELECT  * FROM avg_age;

