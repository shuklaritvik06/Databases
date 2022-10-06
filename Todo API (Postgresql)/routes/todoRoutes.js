const express = require("express");
const { getHomePage,addTodo,getAll,getATodo,updateTodo,delTodo } = require("../controllers/todoController");
const router = express.Router();

router.get("/", getHomePage);
router.post("/add", addTodo);
router.get("/all", getAll);
router.get("/todos/:id", getATodo);
router.delete("/todos/:id", delTodo);
router.put("/todos/:id", updateTodo);

module.exports = router;
