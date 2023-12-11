const router = require("express").Router();

const ControllerReviews = require("../../controller/reviews.controller");
//Ruta para insertar reviews
router.post("/insertreview", ControllerReviews.postReview);
router.get("/selectallreviewsfromtutor/:id", ControllerReviews.getAllReviewsFromTutor);
router.get("/getuserfromid/:id", ControllerReviews.getUserFromId);
router.get("/isThereAReviewFromUserOfTutor/:idUser/:idTutor", ControllerReviews.checkReviewFromUserOfTutor);
router.get("/isThereAtLeastOneClassInCommon/:idUser/:idTutor", ControllerReviews.checkIfStudentHasReceivedAtLeastOneClassWithTutor);
router.get("/getTutorIdFromUserId/:idUser", ControllerReviews.getTutorIdFromUserId);

module.exports = router;
