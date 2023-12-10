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

const getStudentsDescriptions = async (req, res) => {
  try {
    const { idUsers } = req.params;
    const [students] = await ModelStudents.selectStudentsDescriptions(idUsers);
    res.status(200).json(students);
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }
};

const getNameStudents = async (req, res) => {
  try {
    const { idUser } = req.params;

    const [students] = await ModelStudents.selectStudentsById(parseInt(idUser));
    res.status(200).json(students);
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }
};
module.exports = {
  getSubjectOfStudent,
  getStudentsDescriptions,
  getNameStudents,
};
