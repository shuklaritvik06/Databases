const redis = require("redis");
const client = redis.createClient();

client
  .connect()
  .then(() => {
    console.log("Redis client connected");
  })
  .catch((err) => {
    console.log("Error:", err);
  });

function getHomePage(req, res) {
  res.render("home");
}

function addUser(req, res) {
  const { id, name, email, number } = req.body;
  const namePromise = client.hSet(id, "name", name);
  const emailPromise = client.hSet(id, "email", email);
  const numberPromise = client.hSet(id, "number", number);
  Promise.all([namePromise, emailPromise, numberPromise])
    .then(() => {
        console.log("User added");
        res.redirect("/search");
    });
}

function getSearchPage(req,res){
    res.render("search",{data:{}});
}

function searchUser(req, res) {
    const { id } = req.body;
    client.hGetAll(`${id}`).then((data) => {
        data.id = id;
        res.render("search", { data });
    });
}

function delUser(req,res){
  const id = req.params.id;
  client.del(id).then(()=>{
    res.redirect("/search");
  });
}

module.exports = {
  getHomePage,
  addUser,
  searchUser,
  getSearchPage,
  delUser
};
