const router = require('express').Router()
const TeacherController = require('../../controller/teachers.controller')

//Returns all the teachers table info
router.get('/', TeacherController.getAllTeachers)

//Returns the necessary info for card component of all teachers 
router.get("/teacherInfo", TeacherController.getAllTeachersInfo);

//Returns the necessary info for map and details page of one teacher
router.get("/teacherInfo/:teacherId", TeacherController.getTeacherInfoById);

//Returns all the teacher table info, by teacherId
router.get("/:teacherId", TeacherController.getTeacherById)

module.exports = router

