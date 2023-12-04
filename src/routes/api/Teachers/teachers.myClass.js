const router = require("express").Router();
const ControllerTeachers = require("../../../controller/teachers.controller");

router.get("/countStudents/:idSubject", ControllerTeachers.getMyClassTeachers);
router.get("/subjects", ControllerTeachers.getSubjects);

module.exports = router;
