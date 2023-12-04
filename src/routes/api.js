const router = require("express").Router();
const middlewaresAuth = require("../middlewares/auth.middleware");
const { checkRoleTeachers } = require("../middlewares/role.middleware");

router.use("/subjects", require("./api/subjects"));
router.use("/users", require("./api/users"));

router.use("/teachers", require("./api/teachers"));
router.use("/tutor-control-panel", require("./api/tutor-control-panel"));

router.use("/webPublic", require("./api/webPublic"));
router.use("/teachers", require("./api/teachers"));

router.use(
  "/teachers",
  middlewaresAuth.checkToken,
  checkRoleTeachers,
  require("./api/teachers")
);

router.use("/reviews", require("./api/reviews"));

module.exports = router;
