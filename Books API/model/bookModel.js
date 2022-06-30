const sqlite3 = require('sqlite3');
const db = new sqlite3.Database('./books.db',sqlite3.OPEN_READWRITE,(error)=>{
    if(error){
        console.log(error);
        return;
    }
    console.log("Connected to the database");
});

module.exports = db;