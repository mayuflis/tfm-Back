const router = require("express").Router();

const TeacherController = require("../../controller/teachers.controller");
/*router.get('/teachers_has_users/:teacherId', teachersController.getUsersByTeacherId);*/
router.get(
  "/teacher_info/:teacherId",
  TeacherController.getUsersInfoByTeacherId
);

router.get("/", TeacherController.getAllTeachers);
router.get("/:teacherId", TeacherController.getTeacherById);
router.use("/menu", require("./Teachers/teachers.myClass"));
module.exports = router;
