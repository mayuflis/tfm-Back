const router = require('express').Router()
const TeacherController = require('../../controller/teachers.controller')

router.get("/", TeacherController.getAllTeachers);
router.get("/:teacherId", TeacherController.getTeacherById)

module.exports = router

