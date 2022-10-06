const cassandra = require("cassandra-driver");
const client = new cassandra.Client({
  contactPoints: ["localhost"],
  localDataCenter: "datacenter1",
  keyspace: "practical",
});
client.execute(
  "CREATE TABLE IF NOT EXISTS practical.types (id int,name text,badaInt bigint,student boolean,dob date,marks decimal,stoptime duration,unique uuid,PRIMARY KEY (id))",
  function (err) {
    if (err) {
      console.log(err);
    }
  }
);
client.execute(
  "INSERT INTO practical.types (id, name,badaInt,student,dob,marks,stoptime,unique) VALUES (1, 'John',1232312212,false,'2020-01-01',12.3,PT89H8M53S,uuid())",
  function (err) {
    if (err) {
      console.log(err);
    }
  }
);

client.execute("SELECT * FROM practical.types", function (err, result) {
    if (err) {
        console.log(err);
    } else {
        console.log(result.rows);
    }
});

client.execute("DROP TABLE practical.types", function (err) {
    if (err) {
        console.log(err);
    }
});

