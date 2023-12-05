const express = require("express");
const cors = require("cors");
const teachersRoutes = require("./routes/api"); // Ajusta la ruta correcta

const app = express();

app.use(cors());
app.use(express.json());
// Montar las rutas de profesores
app.use("/api", teachersRoutes);

app.use("/api", require("./routes/api"));

app.use((req, res) => {
  res.status(404).json({ error: "Not fount" });
});

module.exports = app;
