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

module.exports = { selectStudetnsBySubjects, selectSubjetsOfTeachers };
