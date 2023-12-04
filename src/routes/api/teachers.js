
const router = require("express").Router();

const teachersController = require('../../controller/teachers.controller');



const TeacherController = require('../../controller/teachers.controller');

router.get("/", TeacherController.getAllTeachers);
router.get("/:teacherId", TeacherController.getTeacherById);
router.get('/teachers_has_users/:teacherId', teachersController.getUsersByTeacherId);
router.get('/teacher_info/:teacherId', teachersController.getUsersInfoByTeacherId);

module.exports = router


