#### Cassandra DB

- It is a distributed database highly scalable and fault tolerant.

- It is a NoSQL database.

- It is a key-value database.

- It is a distributed database.

- In Cassandra, one or more of the nodes in a cluster act as replicas for a given piece of data. If it detected some node is out of data cassandra would return the recent data.

- In the bg it performs a read repair to update the stale values

##### Gossip Protocol

- It is a protocol used to exchange information among the nodes in a cluster.

- Nodes maintain a heartbeat to determine if they are alive or not. 

- Heartbeat is a periodic message sent to a central monitoring server or other servers in the system to show that it is alive and functioning. When a node goes down, it stops sending out heartbeats, and everyone else finds out immediately. But then O(N^2) messages get sent to every tick (N being the number of nodes), which is an expensive operation in any sizable cluster.

- Node keep track of the info about other nodes such as which nodes are reachable and what hash ring they have. Each node initiates a gossip round by sending a message to every other node in the system each second.


- A seed node is a special node that allows the incorporation of new nodes to the network and maintains the strength of the network at all times, by allowing them to synchronize and obtain a copy of the data of the network. blockchain, replicating it and adding strength and security to it.

##### Components of Cassandra

- Node: Place where data is stored
- Data Center: Collection of related nodes
- Cluster: Collection of data centers
- Commit log: Log of all the changes made to the database
- Mem-table: In-memory table that stores the data
- SSTable: It is a disk file that stores the data when flushed
- Bloom Filter: Cassandra use it for testing whether element is a part of set

