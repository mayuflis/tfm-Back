const router = require("express").Router();
const middlewaresAuth = require("../middlewares/auth.middleware");
const { checkRoleTeachers } = require("../middlewares/role.middleware");

<<<<<<< HEAD
=======
router.use("/subjects", require("./api/subjects"));
>>>>>>> 2be0fd5b9236d27489914b9340e673e4690e7893
router.use("/users", require("./api/users"));

router.use("/teachers", require("./api/teachers"));
router.use("/tutor-control-panel", require("./api/tutor-control-panel"));

router.use("/webPublic", require("./api/webPublic"));
router.use('/teachers', require('./api/teachers'));


router.use(
  "/teachers",
  middlewaresAuth.checkToken,
  checkRoleTeachers,
  require("./api/teachers")
);

module.exports = router;
