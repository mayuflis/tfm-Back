const router = require("express").Router();

const TeacherController = require("../../controller/teachers.controller");

//Returns all the teachers table info
router.get('/', TeacherController.getAllTeachers)

//Returns the necessary info for card component of all teachers 
router.get("/teacherInfo", TeacherController.getAllTeachersInfo);

//Returns the necessary info for map and details page of one teacher
router.get("/teacherInfo/:teacherId", TeacherController.getTeacherInfoById);

//Returns all the teacher table info, by teacherId
router.get("/:teacherId", TeacherController.getTeacherById)

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
