## Query Table


#### SELECT examples

`select column_name from table_name`
`select column_name || '  ' || column_name from table_name`

#### ORDER_BY examples

`select column_name from table_name order by column_name asc | desc`

`select column_name from table_name order by column_name asc | desc,column_name asc|desc`

#### WHERE examples

`select column_name from table_name where column_name="something" and | or column_name="something"`

<> => Not equal Operator

#### FETCH examples

```
OFFSET start { ROW | ROWS }
FETCH { FIRST | NEXT } [ row_count ] { ROW | ROWS } ONLY
```
`select column_name from table_name offset 5 rows fetch next 10 rows only`

#### IN examples

`select column_name from table_name where column_name in ("something","something")`

#### BETWEEN examples

`select column_name from table_name where column_name between "something" and "something"`


#### LIKE examples

- % => any no. of chars
- _ => single char

`select column_name from table_name where column_name like "%something%"`

#### GROUP_BY examples

`select column_name from table_name group by column_name`

#### HAVING examples

`select column_name from table_name group by column_name having column_name="something"`

