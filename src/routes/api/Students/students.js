const router = require("express").Router();
const ControllerStudents = require("../../../controller/students.controller");

router.get("/subjectStudents", ControllerStudents.getSubjectOfStudent);

module.exports = router;
