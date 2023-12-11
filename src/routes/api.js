
const router = require("express").Router();
const middlewaresAuth = require("../middlewares/auth.middleware");
const {
  checkRoleTeachers,
  checkRoleStudents,
} = require("../middlewares/role.middleware");

router.use("/subjects", require("./api/subjects"));
router.use("/filter", require("./api/filter"));
router.use("/users", require("./api/users"));
router.use("/class", require("./api/Class/class"))
router.use("/tutor-control-panel", require("./api/tutor-control-panel"));

router.use("/webPublic", require("./api/webPublic"));

router.use("/students", middlewaresAuth.checkToken, checkRoleStudents, require("./api/Students/students") );

router.use("/reviews", require("./api/reviews"));

router.use(
  "/teachers",
  middlewaresAuth.checkToken,
  checkRoleTeachers,
  require("./api/teachers")
);

module.exports = router;
