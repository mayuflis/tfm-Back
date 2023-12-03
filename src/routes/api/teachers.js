const router = require("express").Router();
const ControllerTeachers = require("../../controller/teachers.controller");

router.use("/misclases", require("./myClassTeachers/teachers.myClass"));

module.exports = router;
