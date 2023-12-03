const SubjectsModel = require('../model/subject.model');

const getSubjectsByTeacherId = async (req, res) => {
  const { teacherId } = req.params;

  try {
    const [subjects] = await SubjectsModel.getSubjectsByTeacherId(teacherId);
    res.json(subjects);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error al obtener las asignaturas del profesor.' });
  }
};

module.exports = {
  getSubjectsByTeacherId,
};
