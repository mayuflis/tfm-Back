const router = require("express").Router();
const middlewaresAuth = require("../middlewares/auth.middleware");
const { checkRoleTeachers } = require("../middlewares/role.middleware");

router.use("/users", require("./api/users"));
router.use("/webPublic", require("./api/webPublic"));
router.use('/teachers', require('./api/teachers'));

module.exports = router;
