const SubjectsModel = require('../model/subject.model');

const getAllSubjects = async (req, res) => {
  try {
    const [subjects] = await SubjectsModel.getAllSubjects();
    res.json(subjects)
  } catch (error) {
    res.status(500).json({ message: 'Error al obtener las asignaturas' })
  }
}
const getSubjectsByTeacherId = async (req, res) => {
  const { teacherId } = req.params;

  try {
    const [subjects] = await SubjectsModel.getSubjectsByTeacherId(teacherId);
    res.json(subjects);
  } catch (error) {
    res.status(500).json({ message: 'Error al obtener las asignaturas del profesor.' });
  }
};

const postSubject = async (req, res) => {
  try {
    const [subject] = await SubjectsModel.insertSubjectByTeacher(req.body)
    res.json(subject)
    console.log(subject)
  }
  catch (error) {
    res.status(500).json({ message: error.message });
  }
}

module.exports = {
  getSubjectsByTeacherId,
  getAllSubjects,
  postSubject
};
