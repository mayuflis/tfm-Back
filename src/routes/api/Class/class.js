const express = require('express');
const router = express.Router();
const classController = require('../../../controller/class.controller');

router.post('/insertClass', classController.insertClass);
router.get('/selectedAsignatura/:selectedAsignatura', classController.subject_id);


module.exports = router;