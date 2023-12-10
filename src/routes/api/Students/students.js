const router = require("express").Router();
const ControllerStudents = require("../../../controller/students.controller");

router.get("/subjectStudents", ControllerStudents.getSubjectOfStudent);
router.get(
  "/studentDescription/:idUsers",
  ControllerStudents.getStudentsDescriptions
);
router.get("/getName/:idUser", ControllerStudents.getNameStudents);

module.exports = router;
