#### Trigger

```sql
CREATE OR REPLACE FUNCTION trigger_func()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.g_name = 'Ritvik' THEN
        RAISE EXCEPTION 'Name cannot be Ritvik';
    END IF;
    RETURN NEW;
END;
$$
```

```sql
CREATE TRIGGER trigger_name
BEFORE | AFTER INSERT OR UPDATE ON table_name
FOR EACH ROW
EXECUTE PROCEDURE trigger_func();
```