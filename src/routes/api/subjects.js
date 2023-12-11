const express = require('express');
const router = express.Router();
const subjectsController = require('../../controller/subjects.controller');

router.get('/:teacherId/subjects', subjectsController.getSubjectsByTeacherId);
//To get all subjects
router.get('/', subjectsController.getAllSubjects)
//Add subject
router.post('/', subjectsController.postSubject)




module.exports = router;