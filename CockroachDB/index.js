if(process.env.NODE_ENV !== 'production'){
    require("dotenv").config();
}

const { createDatabase,createTable,getUsers,getUser,insertUser,updateUser,deleteUser,truncateTable,runQuery } = require("./func/methods.js");

createDatabase();
createTable();
truncateTable();
insertUser(1,"Ramesh","ramesh@gmail.com","HelloRamesh")
insertUser(2,"Suresh","suresh@gmail.com","HelloSuresh")
insertUser(3,"Mahesh","mahesh@gmail.com","HelloMahesh")
insertUser(4,"Rajesh","rajesh@gmail.com","HelloRajesh")
getUser(1).then((data)=>{console.log(data)});
deleteUser(4);
updateUser(3,"Mahesh","maheshbabu@gmail.com","HelloMahesh");
getUsers().then((data)=>{console.log(data)});
runQuery("SELECT * FROM learning.users").then((data)=>{console.log(data)});
