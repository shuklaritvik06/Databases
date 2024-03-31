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
