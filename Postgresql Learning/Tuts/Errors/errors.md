#### Errors

By default it is assumed to be exception raises error and stops the transaction.

Levels:

- DEBUG
- INFO
- WARNING
- EXCEPTION
- LOG
- NOTICE

`RAISE LEVEL message USING HINT = 'Hint'`


```sql
DO $$
BEGIN
    RAISE NOTICE 'This is a notice';
    RAISE WARNING 'This is a warning';
    RAISE EXCEPTION 'This is an exception';
    RAISE LOG 'This is a log';
    RAISE DEBUG 'This is a debug';
END;
```

#### OPTIONS

```
MESSAGE: set error message text
HINT: provide the hint message so that the root cause of the error is easier to be discovered.
DETAIL:  give detailed information about the error.
ERRCODE: identify the error code, which can be either by condition name or directly five-character SQLSTATE code.
```

`raise level message using hint = 'hint', detail = 'detail', errcode = 'errcode'`


#### Exception Handling


```sql
DECLARE
   temp varchar(20);
  
BEGIN
   SELECT g_id into temp from rs where g_name='Ritvik';
  
exception
   WHEN no_data_found THEN
      dbms_output.put_line('ERROR');
      dbms_output.put_line('there is no name as');
      dbms_output.put_line('Ritvik in rs table');
end;
```

Exceptions:

- NO_DATA_FOUND
- TOO_MANY_ROWS
- ZERO_DIVIDE
- INVALID_NUMBER
- VALUE_ERROR

#### Assert

```sql
assert condition, message;
```