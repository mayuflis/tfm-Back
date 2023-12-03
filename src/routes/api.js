const router = require("express").Router();

router.use("/subjects", require("./api/subjects"));
router.use("/users", require("./api/users"));
router.use("/teachers", require("./api/teachers"));
router.use("/tutor-control-panel", require("./api/tutor-control-panel"));

module.exports = router;
