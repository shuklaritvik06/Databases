#### IF

```
DO $$
DECLARE

    a int := 10;
    b int := 20;
BEGIN
    IF a > b THEN
        RAISE NOTICE 'a is greater than b';
    END IF;
END $$;
```

#### LOOP

```
do $$
declare
  n integer:= 10;
  cnt integer := 1 ;
begin
loop
 exit when cnt = n ;
 raise notice '%', cnt;
 cnt := cnt + 1 ;
end loop;
end $$;
```

#### WHILE

```
do $$
declare
 a integer := 10;
begin
while a<100 loop
  raise notice '%', a;
  a := a + 1;
end loop;
end $$;
```

#### CONTINUE

```
do $$
declare
  n integer:= 9;
  cnt integer := 0 ;
begin
loop
  cnt = cnt + 1;
  if cnt = 5 then
   continue;
  end if;
  raise notice '%', cnt;
  exit when cnt = n ;
end loop;
end $$;
```

### For Loop

```
for a in hello
loop
end loop;
```