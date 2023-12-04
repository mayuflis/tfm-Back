const selectSubjectStudents = (idStudents) => {
  return db.query(
    "select cl.teachers_id_teachers,s.name  AS subject_name,cl.level,us.name AS teacher_name,us.email from  users as u join class as cl on u.idusers = cl.users_idusers join subjects as s on s.idsubjects=cl.subjects_idsubject join teachers as t on t.id_teachers=cl.teachers_id_teachers join users as us on us.idusers=t.users_idusers where u.idusers=?",
    [idStudents]
  );
};

module.exports = { selectSubjectStudents };
