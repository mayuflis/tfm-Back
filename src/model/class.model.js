const insertClass = ({
  idTutor,
  idUser,
  idSubject,
  fecha,
  hora,
  horaSumada,
  nivel,
}) => {
  return db.query(
    `Insert into class (teachers_id_teachers, users_idusers, subjects_idsubject, class_date, start_time, start_end, level)
    Values ((SELECT id_teachers FROM teachers WHERE teachers.users_idusers = ?),?,?,?,?,?,?) ;`,
    [idTutor, idUser, idSubject, fecha, hora, horaSumada, nivel]
  );
};

const subjectId = (selectedAsignatura) => {
  return db.query(`SELECT idsubjects FROM subjects WHERE name= ?`, [
    selectedAsignatura,
  ]);
};

module.exports = { insertClass, subjectId };
