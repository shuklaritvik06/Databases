const express = require("express");
const methodOverride = require("method-override");
const { addUser,searchUser, getHomePage,getSearchPage,delUser } = require("../Controllers/userController");
const router = express.Router();

router.use(methodOverride("_method"));

router.get("/search",getSearchPage);
router.post("/",addUser);
router.post("/search",searchUser);
router.delete("/del/:id",delUser);
router.get("/",getHomePage);

module.exports = router;