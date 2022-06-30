const db = require("../model/bookModel");
db.run(
  "CREATE TABLE IF NOT EXISTS books (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, author TEXT, year INTEGER)"
);
function getHomePage(req, res) {
  res.render("home");
}

function getBooks(req, res) {
  db.all("SELECT * FROM books", [], (err, rows) => {
    if (err) {
      console.log(err);
    } else {
        res.status(200).json(rows);
    }
  });
}

function getBook(req,res){
    const id = req.params.id;
    console.log(id);
    const sql = `SELECT * FROM books WHERE id = ${id}`;
    db.get(sql,function(err,row){
        if(err){
            console.log(err);
        }else{
            console.log(row);
            res.status(200).json(row);
        }
    })
}

function insertBook(req, res) {
  const { title, author, year } = req.body;
  const sql = "INSERT INTO books (title, author, year) VALUES (?,?,?)";
  const values = [title, author, year];
  db.run(sql, values, function (err) {
    if (err) {
      console.log(err);
    } else {
        res.status(200).json({ message: "Book inserted successfully" });
    }
  });
}

function updateBook(req, res) {
  const id =  req.params.id;
  const updateKey = req.body;
  Object.keys(updateKey).forEach((key) => {
    const sql = `UPDATE books SET ${key} = ? WHERE id = ?`;
    const values = [updateKey[key], id];
    db.run(sql, values, function (err) {
      if (err) {
        console.log(err);
      } else {
        res.status(200).json({ message: "Book updated successfully" });
      }
    });
  });
}

function deleteBook(req, res) {
  const id = req.body.id;
  const sql = `DELETE FROM books WHERE id = ?`;
  db.run(sql, id, function (err) {
    if (err) {
      console.log(err);
    } else {
      res.json({ message: "Book deleted successfully" });
    }
  });
}

module.exports = {
  getHomePage,
  insertBook,
  updateBook,
  deleteBook,
  getBooks,
  getBook
};
