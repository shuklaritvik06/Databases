#### CREATE ROLE

```
CREATE ROLE role_name attribute password Password;
```

Attributes:

- LOGIN
- CREATEDB
- SUPERUSER
- CREATEROLE

VALID UNTIL 'YYYY-MM-DD';

#### ALTER ROLE

```
ALTER ROLE role_name attribute;
```

#### DROP ROLE

```
REASSIGN OWNED BY target_role TO another_role;
DROP OWNED BY target_role;
DROP ROLE role_name;
```

#### GRANT

```
GRANT privilege | ALL on table_name to role_name;
```

#### REVOKE

```
REVOKE privilege | ALL on table_name from role_name;
```