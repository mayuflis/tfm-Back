const ModelStudents = require("../model/students.model");

const getSubjectOfStudent = async (req, res) => {
  try {
    const { idusers } = req.user[0];
    const [infoClass] = await ModelStudents.selectSubjectStudents(idusers);
    res.status(200).json(infoClass);
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }
};

module.exports = { getSubjectOfStudent };
