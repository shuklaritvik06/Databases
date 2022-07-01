const { Client } = require("pg");
const client = new Client({
  user: "postgres",
  password: "test123",
  host: "localhost",
  port: 5432,
  database: "todoapi",
});

client.connect().then(() => {
  console.log("Connected to database");
});

function getHomePage(req, res) {
  res.render("home");
}

function addTodo(req, res) {
  const { id, title, description } = req.body;
  client
    .query(
      `INSERT INTO todo (id,title, description) VALUES (${id},'${title}', '${description}')`
    )
    .then(() => {
      res.status(200).json({ message: "Todo added successfully" });
    });
}

function getAll(req, res) {
  client.query(`SELECT * FROM todo`).then((result) => {
    res.status(200).json(result.rows);
  });
}

function getATodo(req, res) {
  const { id } = req.params;
  client.query(`SELECT * FROM todo WHERE id = ${id}`).then((result) => {
    res.status(200).json(result.rows[0]);
  });
}

function updateTodo(req, res) {
  const { id } = req.params;
  Object.keys(req.body)
    .forEach((key) => {
      client.query(
        `UPDATE todo SET ${key} = '${req.body[key]}' WHERE id = ${id}`
      );
    })
    .then(() => {
      res.status(200).json({ message: "Todo updated successfully" });
    });
}

function delTodo(req, res) {
  const { id } = req.params;
  client.query(`DELETE FROM todo WHERE id = ${id}`).then(() => {
    res.status(200).json({ message: "Todo deleted successfully" });
  });
}

module.exports = {
  getHomePage,
  addTodo,
  getAll,
  getATodo,
  updateTodo,
  delTodo,
};
