const router = require("express").Router();

const TeacherController = require("../../controller/teachers.controller");

//Returns all the teachers table info
router.get("/admin", TeacherController.getNoValidate);
router.get("/", TeacherController.getAllTeachers);
router.get(
  "/teacher_info/:teacherId",
  TeacherController.getUsersInfoByTeacherId
);
router.get("/", TeacherController.getAllTeachers);
router.get("/:teacherId", TeacherController.getTeacherById);
//Returns all the teacher table info, by teacherId
router.get("/:teacherId", TeacherController.getTeacherById);
router.get(
  "/teachers_has_users/:teacherId",
  TeacherController.getUsersByTeacherId
);
router.post("/admin/profesores/:idTeacher", TeacherController.updateState);
/*router.get('/teachers_has_users/:teacherId', teachersController.getUsersByTeacherId);*/
router.use("/menu", require("./Teachers/teachers.myClass"));

module.exports = router;
