
  const TutorControlPanelModel = require('../model/tutor-control-panel.model');

const getTeacherInfo = async (req, res) => {
  const { teacherId } = req.params;

  try {
    const [teacherInfo] = await TutorControlPanelModel.getTeacherInfo(teacherId);
    res.json(teacherInfo);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error al obtener la información del profesor.' });
  }
};

module.exports = {
  getTeacherInfo
};
