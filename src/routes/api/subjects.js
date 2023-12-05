const express = require('express');
const router = express.Router();
const subjectsController = require('../../controller/subjects.controller');

router.get('/:teacherId/subjects', subjectsController.getSubjectsByTeacherId);



module.exports = router;