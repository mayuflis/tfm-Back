const express = require('express');
const router = express.Router();
const tutorControlPanelController = require('../../controller/tutor-control-panel.controller');

router.get('/:teacherId/info', tutorControlPanelController.getTeacherInfo);

module.exports = router;
