### Control Flow

- IF()

```sql
SELECT IF(CONDITION,TRUE_VALUE,FALSE_VALUE)
```

```sql
SELECT IFNULL(first,second)
```

#### check if both are equal then return NULL else first

```sql
SELECT NULLIF();
```

#### CASE

```sql
CASE EXPRESSION
WHEN CONDITION THEN
    RESULT
WHEN CONDITION THEN
    RESULT
ELSE
    RESULT
END
```

### IF-ELSE

```sql
IF condition THEN  
   statements;  
ELSEIF elseif-condition THEN  
   elseif-statements;  
...  
ELSE  
   else-statements;  
END IF;  
```