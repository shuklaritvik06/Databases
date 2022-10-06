## Functions

### Creating a function

```sql
create function function_name (parameter1 datatype, parameter2 datatype)
returns datatype
language plpgsql
as
$$
declare
    variable1 datatype;
begin
   select count(*) 
   into variable1
   from film
   where h between parameter1 and parameter2;
   return variable1;
end;
$$;
```

### Calling a function

```sql
select function_name(parameter1, parameter2);
```

Postgresql also supports function overloading.

### Dropping a function

```sql
drop function function_name(parameter1, parameter2);
```

MAX()
MIN()
SUM()
COUNT()
AVG()


#### EXTRACT

```sql
select extract(year from date);
```

#### Replace Func

It search and replace all occurrences of a string with a new one.

source can be either a string or a column name.


```sql
SELECT
    REPLACE (
        'hello',
        'll',
        'tt'
    );
```