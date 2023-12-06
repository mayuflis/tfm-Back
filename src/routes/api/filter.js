const express = require("express");
const router = express.Router();
const filterController = require("../../controller/filter.controller");

router.post("/home", filterController.postFilterHome);

module.exports = router;
