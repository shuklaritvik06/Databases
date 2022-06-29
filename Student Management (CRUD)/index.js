const express = require("express");
const router = require("./routes/studentManageRoutes");
const cors = require("cors");
const port = process.env.PORT || 8000;
const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use("/",router)
app.use(cors());
app.set("view engine", "ejs");

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
