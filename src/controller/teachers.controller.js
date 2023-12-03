const ModelTeachers = require("../model/teacher.model");

//Muestra la cantidad de alumnos que tiene  el profesor en la asignatura seleccionada
const getMyClassTeachers = async (req, res) => {
  try {
    //
    const { idSubject } = req.params;
    const { idusers } = req.user[0];
    console.log(idSubject);
    const [amountStudents] = await ModelTeachers.selectStudetnsBySubjects(
      idusers,
      parseInt(idSubject)
    );
    res.status(200).json(amountStudents[0]);
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }
};

const getSubjects = async (req, res) => {
  try {
    const { idusers } = req.user[0];
    const [subjects] = await ModelTeachers.selectSubjetsOfTeachers(
      parseInt(idusers)
    );
    res.status(200).json(subjects);
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }
};

module.exports = { getMyClassTeachers, getSubjects };
