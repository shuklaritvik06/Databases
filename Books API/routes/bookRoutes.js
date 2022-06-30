const express = require("express");
const { getHomePage,insertBook,updateBook,deleteBook,getBooks,getBook } = require("../controllers/bookController");
const router = express.Router();

router.get("/",getHomePage);
router.get("/api/all",getBooks);
router.get("/api/get/:id",getBook);
router.post("/api",insertBook);
router.put("/api/update/:id",updateBook);
router.delete("/api",deleteBook);

module.exports = router;