### User Management

```
CREATE USER username IDENTIFIED BY "passwd";
```

### User Privileges

We can give either ALL PRIVILEGES or one from SELECT,UPDATE,INSERT,DELETE

```
GRANT SELECT ON *.* TO username;
```

### Flush PRIVILEGES

```
FLUSH PRIVILEGES;
```

### Drop User

```
DROP USER username@host;
```

<!-- Get current_user -->

Select user(),select current_user()


