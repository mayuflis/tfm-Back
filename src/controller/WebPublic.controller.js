const ModelWebPublic = require("../model/webPublic.model");
const { filterProfessor } = require("../helpers/functionFilterProfessor");

//Método que obtiene todas las asignaturas
const getAllSubjects = async (req, res) => {
  try {
    const [result] = await ModelWebPublic.selectAllSubjects();
    res.status(200).json(result);
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }
};
//Método que realiza el filtrado de profesores en función de la provincia, asignatura, precio,experiencia y puntuación
const getFilterTeachers = async (req, res) => {
  try {
    let filtrado = [];
    let {
      selectedSubject,
      selectedProvince,
      selectedPrice,
      selectedExperience,
      minRating,
    } = req.body;

    //Obtención ed todos lo profesores validados
    const [teachers] = await ModelWebPublic.getAllTeachers();
    //Método que realiza el filtrado y devuelve  aquellos profesores en función de los parámetros aplicados en el filtro
    filtrado = filterProfessor(
      teachers,
      selectedSubject,
      selectedProvince,
      selectedPrice,
      selectedExperience,
      minRating
    );
    res.status(200).json(filtrado);
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }
};
module.exports = {
  getAllSubjects,
  getFilterTeachers,
};
