#### Cassandra Data Model

##### Keyspace

KeySpace is outermost container for data in Cassandra. 

- Replication factor: Number of replicas for each data.
- Column Family: Innermost container for data in Cassandra. It is a collection of rows.
- Replication placement strategy: Strategy for choosing the replicas for each data.

Column Family attributes:


- keys_cached: Number of keys cached in memory.
- rows_cached: Number of rows cached in memory.
- preload_row_cache: Whether to preload the row cache.

Column is the basic data structure of Cassandra with three values, namely key or column name, value, and a time stamp. Given below is the structure of a column.

Super column is a column which stores a map of sub columns.