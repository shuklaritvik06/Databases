#### UNION

```
select * from table1 union select * from table2;
```

#### INTERSECT

```
select * from table1 intersect select * from table2;
```

#### EXCEPT

```
select * from table1 except select * from table2;
```

#### ANY

```
select * from table1 where any(id in (1,2,3));
```

#### ALL


```
select * from table1 where all(id in (1,2,3));
```

#### EXISTS


```
select * from table1 where exists(select * from table2 where table1.id = table2.id);
```