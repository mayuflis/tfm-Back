const router = require("express").Router();
const ControllerStudents = require("../../../controller/students.controller");

router.get("/subjectStudents", ControllerStudents.getSubjectOfStudent);
router.get(
  "/studentDescription/:idUsers",
  ControllerStudents.getStudentsDescriptions
);

module.exports = router;
