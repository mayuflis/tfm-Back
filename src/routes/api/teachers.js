const router = require("express").Router();

const teachersController = require('../../controller/teachers.controller');

/*router.get('/teachers_has_users/:teacherId', teachersController.getUsersByTeacherId);*/
router.get('/teacher_info/:teacherId', teachersController.getUsersInfoByTeacherId);


module.exports = router;

