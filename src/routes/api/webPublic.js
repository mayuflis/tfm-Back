const router = require("express").Router();

const ControllerWeb = require("../../controller/WebPublic.controller");
const TeacherController = require("../../controller/teachers.controller");
//Ruta para obtener todas las asignaturas
router.get("/subjects", ControllerWeb.getAllSubjects);



//Returns the necessary info for card component of all teachers 
router.get("/teacherInfo", TeacherController.getAllTeachersInfo);

//Returns the necessary info for map and details page of one teacher
router.get("/teacherInfo/:teacherId", TeacherController.getTeacherInfoById);

//Ruta que realiza el filtrado de profesores
router.post("/filter", ControllerWeb.getFilterTeachers);



module.exports = router;
