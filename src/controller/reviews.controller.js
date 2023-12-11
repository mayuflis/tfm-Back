const ModelReview = require("../model/reviews.model");

//Registra una review
const postReview = async (req, res) => {
    try {
        const [resutl] = await ModelReview.insertReview(req.body);
        res.status(200).json(resutl);
    } catch (error) {
        res.status(400).json({ fatal: error.message });
    }
};

const getAllReviewsFromTutor = async (req, res) => {
    try {
        const [resutl] = await ModelReview.selectAllReviewsFromTutor(req.params.id);
        res.status(200).json(resutl);
    } catch (error) {
        res.status(400).json({ fatal: error.message });
    }
};

const getUserFromId = async (req, res) => {
    try {
        const [resutl] = await ModelReview.selectUserFromId(req.params.id);
        res.status(200).json(resutl);
    } catch (error) {
        res.status(400).json({ fatal: error.message });
    }
};

const checkReviewFromUserOfTutor = async (req, res) => {
    try {
        const [resutl] = await ModelReview.isThereAReviewFromUserOfTutor(req.params.idUser,req.params.idTutor);
        res.status(200).json(resutl);
    } catch (error) {
        res.status(400).json({ fatal: error.message });
    }
};

const checkIfStudentHasReceivedAtLeastOneClassWithTutor = async (req, res) => {
    try {
        const [resutl] = await ModelReview.isThereAtLeastOneClassInCommon(req.params.idUser,req.params.idTutor);
        res.status(200).json(resutl);
    } catch (error) {
        res.status(400).json({ fatal: error.message });
    }
}

const getTutorIdFromUserId = async (req, res) => {
    try {
        const [resutl] = await ModelReview.getTutorIdFromUserId(req.params.idUser);
        console.log("result getTutorIdFromUserId: ",resutl);
        res.status(200).json(resutl[0].id_teachers);
    } catch (error) {
        res.status(400).json({ fatal: error.message });
    }
}



module.exports = { postReview, getAllReviewsFromTutor, getUserFromId, checkReviewFromUserOfTutor, checkIfStudentHasReceivedAtLeastOneClassWithTutor,getTutorIdFromUserId };