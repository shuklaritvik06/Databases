- keys pattern (*,[a-z] etc)
- flushall
- lpush key value
- lrange key start end
- rpush key value (bottom)
- rrange key value 
- llen key
- lpop key
- rpop key
- lset key index value
- linsert key before|after pivot value
- lindex key index
- lpushx key value (If exists will return length)
- rpushx key value (If exists will return length)
- sort key
- blpop key timeout
- brpop key timeout