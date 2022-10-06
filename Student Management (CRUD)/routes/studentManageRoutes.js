const express = require("express");
const methodOverride = require("method-override");
const { getHomePage,handlePostRequest,deleteStudent,updateStudent } = require("../controllers/studentManageController");
const router = express.Router();
router.use(methodOverride("_method"));
router.get("/",getHomePage);
router.post("/",handlePostRequest);
router.delete("/:id",deleteStudent);
router.patch("/",updateStudent);

module.exports = router;