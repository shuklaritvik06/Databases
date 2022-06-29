const connection = require("../model/studentModel");
connection.connect((err)=>{
    if(!err){
        console.log("Connection Successful");
    }
});

function getHomePage(req,res){
    const query = `SELECT * FROM stud`;
    connection.query(query,(err,result)=>{
        if(!err){
            res.render("home",{data:result});
        }
        else{
            console.log(err);
        }
    });
}

function handlePostRequest(req,res){
    const { roleNum,name,email,phone,address,birthday } = req.body;
    const query = `INSERT INTO stud VALUES(${roleNum},'${name}','${email}','${phone}','${address}','${birthday}')`;
    connection.query(query,(err)=>{
        if(!err){
            res.redirect("/");
        }
        else{
            console.log(err);
        }
    })
}

function deleteStudent(req,res){
    const roleNum = req.params.id;
    const query = `DELETE FROM stud WHERE roll = ${roleNum}`;
    connection.query(query,(err)=>{
        if(!err){
            res.redirect("/");
        }
        else{
            console.log(err);
        }
    });
}

function updateStudent(req,res){
    const { current,roleNum,name,email,phone,address,birthday } = req.body;
    const query = `UPDATE stud SET name = "${name}", email = "${email}", phone = ${phone}, address = "${address}", birthday = "${birthday}", roll = ${roleNum} WHERE roll = ${current}`;
    connection.query(query,(err)=>{
        if(!err){
            res.redirect("/");
        }
        else{
            console.log(err);
        }
    });
}

module.exports = {
    getHomePage,
    handlePostRequest,
    deleteStudent,
    updateStudent
}