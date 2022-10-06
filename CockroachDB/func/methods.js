const { Client } = require("pg");
const client = new Client(process.env.DATABASE_URL);
client.connect().then(()=>console.log("Connected to database"));

async function createDatabase(){
    try {
       await client.query("CREATE DATABASE IF NOT EXISTS learning");
    } catch (err) {
      console.error("error executing query:", err);
    }
}

async function createTable(){
    try {
      await client.query("CREATE TABLE IF NOT EXISTS learning.learn (id INT, name VARCHAR(255), email VARCHAR(255), password VARCHAR(255),PRIMARY KEY (id))");
    } catch (err) {
      console.error("error executing query:", err);
    }
}

async function insertUser(id,name, email, password){
    try {
      await client.query("INSERT INTO learning.users (id,name, email, password) VALUES ($1, $2, $3,$4)", [id,name, email, password]);
    } catch (err) {
      console.error("error executing query:", err);
    }
}

async function getUsers(){
    try {
      const result = await client.query("SELECT * FROM learning.users");
      return result.rows;
    } catch (err) {
      console.error("error executing query:", err);
    }
}

async function getUser(id){
    try {
      const result = await client.query("SELECT * FROM learning.users WHERE id = $1", [id]);
      return result.rows;
    } catch (err) {
      console.error("error executing query:", err);
    }
}

async function updateUser(id, name, email, password){
    try {
      await client.query("UPDATE learning.users SET name = $1, email = $2, password = $3 WHERE id = $4", [name, email, password, id]);
    } catch (err) {
      console.error("error executing query:", err);
    }
}

async function deleteUser(id){
    try {
      await client.query("DELETE FROM learning.users WHERE id = $1", [id]);
    } catch (err) {
      console.error("error executing query:", err);
    }
}

async function truncateTable(){
    try {
      await client.query("TRUNCATE TABLE learning.users");
    } catch (err) {
      console.error("error executing query:", err);
    }
}

async function runQuery(query){
    try {
        const result = await client.query(query);
        return result.rows;
    } catch (err) {
        console.error("error executing query:", err);
    }
}


module.exports = {
    createDatabase,
    createTable,
    insertUser,
    getUsers,
    getUser,
    updateUser,
    deleteUser,
    truncateTable,
    runQuery
};