const router = require("express").Router();

const ControllerReviews = require("../../controller/reviews.controller");
//Ruta para insertar reviews
router.post("/insertreview", ControllerReviews.postReview);

module.exports = router;
