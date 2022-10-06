### List all connections to a db

```
SELECT * FROM pg_stat_activity WHERE datname="name";
```

### Remove connections

```
SELECT pg_terminate_backend (pid) FROM pg_stat_activity WHERE datname = 'name';
```

