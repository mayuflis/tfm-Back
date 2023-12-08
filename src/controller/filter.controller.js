const FilterModel = require("../model/filter.model");

const postFilterHome = async (req, res) => {
  let {
    selectedSubject,
    selectedProvince,
    selectedPrice,
    selectedExperience,
    minRating,
  } = req.body;

  selectedPrice = parseInt(selectedPrice);
  selectedExperience = parseInt(selectedExperience);
  minRating = parseInt(minRating);

  console.log(
    selectedSubject,
    selectedProvince,
    selectedPrice,
    selectedExperience,
    minRating
  );

  try {
    const [filter] = await FilterModel.filterHome(
      selectedSubject,
      selectedProvince,
      selectedPrice,
      selectedExperience,
      minRating
    );
    res.status(200).json(filter);
  } catch (error) {
    res.status(400).json({ fatal: error });
  }
};

module.exports = {
  postFilterHome,
};
