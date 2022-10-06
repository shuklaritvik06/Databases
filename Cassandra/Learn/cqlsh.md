#### cqlsh

cqlsh is a command line shell for Cassandra. It is a simple, powerful.

- cqlsh --help
- cqlsh --version
- cqlsh --execute cql_statement
- cqlsh --file="cql_file_name"
- cqlsh --debug
- cqlsh --color
- cqlsh -u username
- cqlsh -p password

## Shell Commands

- HELP
- DESCRIBE | DESC (keyspaces,tables,index etc)
- EXIT
- SHOW HOST
- SHOW VERSION
- SOURCE 'file location'
- TRACING ON | OFF
- LOGIN username
- COPY keyspace.table FROM STDIN
- COPY keyspace.table (columns) TO 'file location' WITH HEADER=TRUE
- COPY keyspace.table (columns) FROM 'file location' WITH HEADER=TRUE
- CAPTURE 'file location'
- PAGING ON | OFF