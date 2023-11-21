const express = require("express");
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

//Descomentar una vez se empiece a realizar la rutas.
//app.use("/api", require("./routes/api"));

app.use((req, res) => {
  res.status(404).json({ error: "Not fount" });
});

module.exports = app;
