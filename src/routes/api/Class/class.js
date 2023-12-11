const express = require("express");
const router = express.Router();
const classController = require("../../../controller/class.controller");

router.get(
  "/selectedAsignatura/:selectedAsignatura",
  classController.subject_id
);
router.post("/insertClass", classController.insertClass);

module.exports = router;
