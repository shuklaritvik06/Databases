#### Case

```
case expression
when condition
  then result
when condition
  then result
else
  result
end
```

#### Coalesce

```
select coalesce(column, default_value)
```
#### Nullif

if column1 = column2 then it returns null 

```
nullif(column, column2)
```

#### Cast

```
cast(column as type)
```