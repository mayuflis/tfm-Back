const router = require("express").Router();

const TeacherController = require("../../controller/teachers.controller");

router.get("/", TeacherController.getAllTeachers);
router.get("/:teacherId", TeacherController.getTeacherById);
router.get(
  "/teachers_has_users/:teacherId",
  TeacherController.getUsersByTeacherId
);

/*router.get('/teachers_has_users/:teacherId', teachersController.getUsersByTeacherId);*/
router.use("/menu", require("./Teachers/teachers.myClass"));
router.get(
  "/teacher_info/:teacherId",
  TeacherController.getUsersInfoByTeacherId
);

router.get("/", TeacherController.getAllTeachers);
router.get("/:teacherId", TeacherController.getTeacherById);

module.exports = router;
