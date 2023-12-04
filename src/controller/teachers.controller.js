const ModelTeachers = require("../model/teacher.model");

//Muestra la cantidad de alumnos que tiene  el profesor en la asignatura seleccionada
const getMyClassTeachers = async (req, res) => {
  try {
    //
    const { idSubject } = req.params;
    const { idusers } = req.user[0];

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

const TeacherModel = require("../model/teacher.model");

const getUsersByTeacherId = async (req, res) => {
  const { teacherId } = req.params;
  const id = parseInt(teacherId);

  try {
    const [users] = await TeacherModel.getUsersByTeacherId(id);

    res.json(users);
  } catch (error) {
    console.error(error);
    res.status(500).json({
      message: "Error al obtener los usuarios asociados al profesor.",
    });
  }
};

const getUsersInfoByTeacherId = async (req, res) => {
  const { teacherId } = req.params;

  try {
    const [usersInfo] = await TeacherModel.getUsersInfoByTeacherId(teacherId); // Utiliza la nueva función del modelo

    res.json(usersInfo);
  } catch (error) {
    console.error(error);
    res.status(500).json({
      message:
        "Error al obtener la información de usuarios asociados al profesor.",
    });
  }
};

const getAllTeachers = async (req, res) => {
  try {
    const [teachers] = await TeacherModel.selectAllTeachers();
    res.send(teachers);
  } catch (error) {
    res.json({ fatal: error.message });
  }
};

const getTeacherById = async (req, res) => {
  try {
    const { teacherId } = req.params;
    const [teacher] = await TeacherModel.selectTeacherById(teacherId);
    res.json(teacher);
  } catch (error) {
    res.json({ fatal: error.message });
  }
};

module.exports = {
  getAllTeachers,
  getTeacherById,
  getUsersByTeacherId,
  getUsersInfoByTeacherId,
  getMyClassTeachers,
  getSubjects,
};
