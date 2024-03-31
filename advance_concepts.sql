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

-- Pivot

