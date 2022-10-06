## Boolean

t,f,null are the values that can be given to the bool data type

## CHAR

used to store character of the limited length. If the string is small here the extra space would be padded with spaces.

## VARCHAR

Same as char,if the string is small here the extra space would not be padded with spaces.

## NUMERIC

Stores the numeric values. 

`NUMERIC(precision.scale)`

## DATE

stores the date values. it is in the `yyy-mm-dd` format.

AGE() function is used to calculate the age of the person.

## TIME

Handle time values. Common formats are 

- HH:MM:SS
- HH:MM
- HHMMSS

## JSON

Stores the json values. Pass the json as the string in the database. 

```
INSERT INTO table_name VALUES ('{"name":"Ritvik"}');
```

## CREATE DOMAIN

User defined data types.

CREATE DOMAIN:It creates a user-defined data type that can have optional constraints. 


CREATE DOMAIN name AS data_type [CONSTRAINT constraint_name]

```
create domain hello_my_data as integer not null default 0;
```
