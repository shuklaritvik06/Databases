const express = require("express");
const cors = require("cors");
const router = require("./routes/userRoutes");
const PORT = 3001 || process.env.PORT;
const app = express();

app.use(cors());
app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use("/", router);
app.set("view engine", "ejs");

app.listen(PORT, () => {
  console.log("Server is UP on port", PORT);
});
