const getAllSubjects = () => {
  return db.query(
    `
       SELECT DISTINCT s.name
FROM subjects AS s
JOIN teachers_has_subjects AS ths ON ths.subjects_idsubjects = s.idsubjects;

      `
  );
};
const getSubjectsByTeacherId = (teacherId) => {
  return db.query(
    `
       SELECT s.name,ths.hourly_rate, ths.level, ths.free_classl
       from subjects as s
       join teachers_has_subjects as ths on ths.subjects_idsubjects=s.idsubjects
       join teachers as t on t.id_teachers=ths.teachers_id_teachers
       join users as u on u.idusers=t.users_idusers
        WHERE u.idusers =  ?`,
    [teacherId]
  );
};

const insertSubjectByTeacher = (teacherId, { hourly_rate, level, free_classl, name }) => {
  return db.query(`
    INSERT INTO teachers_has_subjects (subjects_idsubjects, teachers_id_teachers, hourly_rate, level, free_classl)
    SELECT s.idsubjects, t.id_teachers, ?, ?, ?
    FROM subjects AS s
    JOIN teachers AS t ON t.users_idusers = ?
    WHERE s.name = ?;
  `, [hourly_rate, level, free_classl, teacherId, name]);
}

module.exports = {
  getSubjectsByTeacherId,
  getAllSubjects,
  insertSubjectByTeacher
};
