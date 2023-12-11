const modelClass = require("../model/class.model");
let id = 0;
const insertClass = async (req, res) => {
  try {
    const [result] = await modelClass.insertClass(req.body);
    console.log("el res:", result);
    res.status(200).json(result.insertId);
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }
};
const subject_id = async (req, res) => {
  try {
    const { selectedAsignatura } = req.params;
    const [result] = await modelClass.subjectId(selectedAsignatura);
    res.status(200).json(result);
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }
};

module.exports = { insertClass, subject_id };
