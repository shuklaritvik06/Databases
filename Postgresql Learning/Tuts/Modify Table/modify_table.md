#### Insert

```
insert into table_name (column_name, column_name, ...) values (value, value, ...);
```

```
insert into table_name (column_name, column_name, ...) values (value, value, ...), (value, value, ...);
```

#### Update

```
update table_name set column_name = value, column_name = value, ... where condition;
```

#### Delete

```
delete from table_name where condition;
```
#### Upsert

```
INSERT INTO table (col1, col2, col3) 
VALUES (val1, val2, val3)
ON CONFLICT conflict_target DO update;
```
