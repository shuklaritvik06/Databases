### LIST

INSERT INTO test.list (key int,seq list<type>) VALUES (1, [1, 2, 3]);

UPDATE test.list SET seq = seq + [4, 5, 6] WHERE key = 1;

### SET

INSERT INTO test.list (key int,seq set<type>) VALUES (1, {1, 2, 3});

UPDATE test.list SET seq = seq + {4, 5, 6} WHERE key = 1;

### MAP


INSERT INTO test.list (key int,seq map<type>) VALUES (1, {0: "1", 1: "2",2: "3"});

UPDATE test.list SET seq = seq + {3: "5", 4: "7"} WHERE key = 1;