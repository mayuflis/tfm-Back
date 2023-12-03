const ModelReview = require("../model/reviews.model");

//Registra una review
const postReview = async (req, res) => {
    try {
        const [resutl] = await ModelReview.insertReview(req.body);
        res.status(200).json(provinces);
    } catch (error) {
        res.status(400).json({ fatal: error.message });
    }
};

module.exports = { postReview };
