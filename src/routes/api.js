const router = require("express").Router();
const middlewaresAuth = require("../middlewares/auth.middleware");
const {
  checkRoleTeachers,
  checkRoleStudents,
} = require("../middlewares/role.middleware");

router.use("/subjects", require("./api/subjects"));
router.use("/users", require("./api/users"));

router.use("/tutor-control-panel", require("./api/tutor-control-panel"));

router.use("/webPublic", require("./api/webPublic"));

router.use(
  "/students",
  middlewaresAuth.checkToken,
  checkRoleStudents,
  require("./api/Students/students")
);

router.use(
  "/teachers",
  middlewaresAuth.checkToken,
  checkRoleTeachers,
  require("./api/teachers")
);

module.exports = router;
