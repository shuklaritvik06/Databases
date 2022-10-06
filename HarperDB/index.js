const express = require("express");
const request = require("request");
const app = express();
const port = process.env.PORT || 5000;
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.get("/createschema", (req, res) => {
  const { schema } = req.body;
  const options = {
    method: "POST",
    url: "https://heheh-learndb.harperdbcloud.com",
    headers: {
      "Content-Type": "application/json",
      Authorization: "Basic cml0dmlrOkhlbGxvVXNlcjEyMyFAIw==",
    },
    body: JSON.stringify({
      operation: "create_schema",
      schema: schema,
    }),
  };
  request(options, function (error, response) {
    if (error) throw new Error(error);
    res.json(JSON.parse(response.body));
  });
});
app.get("/createtable", (req, res) => {
  const { schema, table, hash } = req.body;
  const options = {
    method: "POST",
    url: "https://heheh-learndb.harperdbcloud.com",
    headers: {
      "Content-Type": "application/json",
      Authorization: "Basic cml0dmlrOkhlbGxvVXNlcjEyMyFAIw==",
    },
    body: JSON.stringify({
      operation: "create_table",
      schema: schema,
      table: table,
      hash_attribute: hash,
    }),
  };
  request(options, function (error, response) {
    if (error) throw new Error(error);
    res.json(JSON.parse(response.body));
  });
});
app.get("/getall", (req, res) => {
  const { schema, table } = req.body;
  const options = {
    method: "POST",
    url: "https://heheh-learndb.harperdbcloud.com",
    headers: {
      "Content-Type": "application/json",
      Authorization: "Basic cml0dmlrOkhlbGxvVXNlcjEyMyFAIw==",
    },
    body: JSON.stringify({
      operation: "sql",
      sql: `SELECT * FROM ${schema}.${table}`,
    }),
  };
  request(options, function (error, response) {
    if (error) throw new Error(error);
    res.json(JSON.parse(response.body));
  });
});
app.get("/getone/:id", function (req, res) {
  const { schema, table } = req.body;

  const options = {
    method: "POST",
    url: "https://heheh-learndb.harperdbcloud.com",
    headers: {
      "Content-Type": "application/json",
      Authorization: "Basic cml0dmlrOkhlbGxvVXNlcjEyMyFAIw==",
    },
    body: JSON.stringify({
      operation: "sql",
      sql: `SELECT * FROM ${schema}.${table} where id = ${req.params.id}`,
    }),
  };
  request(options, function (error, response) {
    if (error) throw new Error(error);
    res.json(JSON.parse(response.body));
  });
});
app.get("/insert", function (req, res) {
  const { schema, table, ...data } = req.body;
  const options = {
    method: "POST",
    url: "https://heheh-learndb.harperdbcloud.com",
    headers: {
      "Content-Type": "application/json",
      Authorization: "Basic cml0dmlrOkhlbGxvVXNlcjEyMyFAIw==",
    },
    body: JSON.stringify({
      operation: "insert",
      schema: schema,
      table: table,
      records: [data],
    }),
  };
  request(options, function (error, response) {
    if (error) throw new Error(error);
    res.json(JSON.parse(response.body));
  });
});
app.get("/update/:id", function (req, res) {
  const { schema, table, ...data } = req.body;
  const options = {
    method: "POST",
    url: "https://heheh-learndb.harperdbcloud.com",
    headers: {
      "Content-Type": "application/json",
      Authorization: "Basic cml0dmlrOkhlbGxvVXNlcjEyMyFAIw==",
    },
    body: JSON.stringify({
      operation: "update",
      schema: schema,
      table: table,
      records: [
        {
          ...data,
          id: req.params.id,
        },
      ],
    }),
  };
  request(options, function (error, response) {
    if (error) throw new Error(error);
    res.json(JSON.parse(response.body));
  });
});
app.get("/delete/:id", function (req, res) {
  const { schema, table } = req.body;

  const options = {
    method: "POST",
    url: "https://heheh-learndb.harperdbcloud.com",
    headers: {
      "Content-Type": "application/json",
      Authorization: "Basic cml0dmlrOkhlbGxvVXNlcjEyMyFAIw==",
    },
    body: JSON.stringify({
      operation: "sql",
      sql: `DELETE FROM ${schema}.${table} where id = ${req.params.id}`,
    }),
  };
  request(options, function (error, response) {
    if (error) throw new Error(error);
    res.json(JSON.parse(response.body));
  });
});
app.listen(port);
