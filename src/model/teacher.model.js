const getUsersByTeacherId = (teacherId) => {
  return db.query(
    "SELECT users_idusers FROM teachers_has_users WHERE teachers_id_teachers = ?",
    [teacherId]
  );
};

const getUsersInfoByTeacherId = (teacherId) => {
  return db.query(
    `
    SELECT name, last_name, email
    FROM users
    INNER JOIN teachers_has_users ON users.idusers = teachers_has_users.users_idusers
    WHERE teachers_has_users.teachers_id_teachers = ?`,
    [teacherId]
  );
};

//Consulta a la BBDD para obtener todos los profesores
const selectAllTeachers = () => {
  return db.query("select * from teachers");
};

//Consulta a la BBDD para obtener un profesor por ID
const selectTeacherById = (teacherId) => {
  return db.query("select * from teachers where id_teachers= ?", [teacherId]);
};

module.exports = {
  selectAllTeachers,
  selectTeacherById,
  getUsersInfoByTeacherId,
  getUsersByTeacherId,
};
