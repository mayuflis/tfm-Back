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


module.exports = { postReview, getAllReviewsFromTutor, getUserFromId, checkReviewFromUserOfTutor };