const selectStudetnsBySubjects = (idUsers, idSubject) => {
  return db.query(
    "select count(c.users_idusers) as NumberOfStudents  from class as c join teachers as t on t.id_teachers= c.teachers_id_teachers join users as u on u.idusers=t.users_idusers where u.idusers=? and c.idsubject=?",
    [idUsers, idSubject]
  );
};

const selectSubjetsOfTeachers = (idUsers) => {
  return db.query(
    "select s.name ,s.idsubjects from subjects as s join teachers_has_subjects as ths on ths.subjects_idsubjects=s.idsubjects join teachers as t on t.id_teachers=ths.teachers_id_teachers join users as u on u.idusers=t.users_idusers where u.idusers =? ",
    [idUsers]
  );
};

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
  selectStudetnsBySubjects,
  selectSubjetsOfTeachers,
};
