const express = require("express");
const router = express.Router();

// La ruta para obtener todos los profesores
router.get("/getTeachers", async (req, res) => {
  try {
    // Realizar la consulta a la base de datos
    const [teachers, fields] = await global.db.query("SELECT * FROM teachers");

    // Enviar la lista de profesores como respuesta
    res.json({ teachers });
  } catch (error) {
    // Manejar cualquier error que pueda ocurrir durante la consulta
    console.error("Error al recuperar profesores:", error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
});

module.exports = router;