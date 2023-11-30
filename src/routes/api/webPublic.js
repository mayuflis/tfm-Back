const router = require("express").Router();

const ControllerWeb = require("../../controller/WebPublic.controller");
//Ruta para obtener todas las asignaturas
router.get("/subjects", ControllerWeb.getAllSubjects);
//Ruta que realiza el filtrado de profesores
router.post("/filter", ControllerWeb.getFilterTeachers);

module.exports = router;
