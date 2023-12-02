//Consulta a la BBDD para obtener todos los profesores
const selectAllTeachers = () => {
    return db.query("select * from teachers")
};

//Consulta a la BBDD para obtener un profesor por ID
const selectTeacherById = (teacherId) => {
    return db.query("select * from teachers where id_teachers= ?", [teacherId])
};

module.exports = { selectAllTeachers, selectTeacherById } 