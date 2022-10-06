#### create table

```
    create table table_name (
        column_name data_type,
        column_name data_type,
        column_name data_type
    );
```

#### select into

```
SELECT
    film_id,
    title,
INTO TABLE film_db
FROM
    film
WHERE
    rating = 'R'
```

#### Create sequence

#### alter table

```
ALTER TABLE table_name ADD COLUMN new_column_name TYPE;

ALTER TABLE table_name DROP COLUMN column_name;

ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name;

ALTER TABLE table_name ALTER COLUMN column_name [SET NOT NULL| DROP NOT NULL];

ALTER TABLE table_name ADD CONSTRAINT constraint_name constraint_definition;

ALTER TABLE table_name RENAME to new_table_name;
```

#### drop table

```
DROP TABLE IF EXISTS table_name;
```
#### truncate table

```
TRUNCATE TABLE table_name;
```

#### copy a table

```
create table table_name as new_table with no data;
```

#### compare tables

```
select column_name from table except select column_name from table2
```