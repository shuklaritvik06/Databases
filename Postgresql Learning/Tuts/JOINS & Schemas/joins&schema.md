```
Left Join === Left Outer Join
Right Join === Right Outer Join
Full Join === Full Outer Join
inner Join === Join
```

#### Inner Join

```
select
  agents.AGENT_NAME as Agent_Name,
  agents.PHONE_NO as Agent_Phone,
  customer.CUST_NAME as Cust_Name
from
  agents
 join customer on agents.AGENT_CODE = customer.AGENT_CODE order by Cust_Name;
```

#### Left Join

```
select
  agents.AGENT_NAME as Agent_Name,
  agents.PHONE_NO as Agent_Phone,
  customer.CUST_NAME as Cust_Name
from
  agents
  left join customer on agents.AGENT_CODE = customer.AGENT_CODE order by Cust_Name;
```

#### Right Join

```
select
  agents.AGENT_NAME as Agent_Name,
  agents.PHONE_NO as Agent_Phone,
  customer.CUST_NAME as Cust_Name
from
  agents
  right join customer on agents.AGENT_CODE = customer.AGENT_CODE order by Cust_Name;
```

#### Self Join

```
select
hello.name as Hello_Name,
hello.city as Hello_City
from table_one as hello join table_one as bro on hello.agent_id=bro.member_id;
```

#### Full Join

Inner Join + Right Join + left Join

```
select
  agents.AGENT_NAME as Agent_Name,
  agents.PHONE_NO as Agent_Phone,
  customer.CUST_NAME as Cust_Name
from
  agents
  full join customer on agents.AGENT_CODE = customer.AGENT_CODE order by Cust_Name;

```

#### Cross Join

Cartesian Product or Cross Product

```
select
  agents.AGENT_NAME as Agent_Name,
  agents.PHONE_NO as Agent_Phone,
  customer.CUST_NAME as Cust_Name,
  location.city
from
  agents
  inner join customer on customer.AGENT_CODE=customer.AGENT_CODE
  cross join location;
```

#### Natural Join

In this the SQL would decide on what basis the join should happen.

It matches the name of the column from both the tables and on the basis of that it joins them.

And if it fails to find that it just do the cross join

```
select * from
agents natural join customer;
```

#### Create schema

```
CREATE SCHEMA IF NOT EXISTS name;
```

#### drop schema

```
DROP SCHEMA IF EXISTS name;
```

#### alter schema

```
ALTER SCHEMA schema_name RENAME TO new_name;

ALTER SCHEMA schema_name OWNER TO new_owner;
```
