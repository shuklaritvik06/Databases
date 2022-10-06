### Describe

```cql
DESCRIBE KEYSPACES
DESCRIBE TABLES
``` 

### CREATE KEYSPACE

CREATE KEYSPACE ritvik WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 3};

### ALTER KEYSPACE

ALTER KEYSPACE ritvik WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 5};

### DROP KEYSPACE

DROP KEYSPACE ritvik;

### CREATE TABLE

CREATE TABLE ritvik.student (id int, name text, age int, PRIMARY KEY (id));

### ALTER TABLE

ALTER TABLE ritvik.student ADD column_name data_type;

ALTER TABLE ritvik.student DROP column_name;

### TRUNCATE TABLE

TRUNCATE TABLE ritvik.student;

### DROP TABLE

DROP TABLE ritvik.student;

### CREATE INDEX

CREATE INDEX student_age_index ON ritvik.student (age);

### DROP INDEX

DROP INDEX student_age_index;

### BATCH

BEGIN BATCH
INSERT INTO ritvik.student (id, name, age) VALUES (1, 'ritvik', 20);
INSERT INTO ritvik.student (id, name, age) VALUES (2, 'ritvik', 20);
APPLY BATCH;

### SELECT

SELECT * FROM ritvik.student;

### SELECT WITH WHERE

SELECT * FROM ritvik.student WHERE id = 1;

### UPDATE

UPDATE ritvik.student SET age = 30 WHERE id = 1;

### DELETE

DELETE FROM ritvik.student WHERE id = 1;

### Type

```
CREATE TYPE student.basic_info (
  birthday timestamp,
  race text,
  weight text,
  height text
);
```

### Tuple

```
-- create a tuple
CREATE TABLE subjects (
  k int PRIMARY KEY,
  v tuple<int, text, float>
);
```