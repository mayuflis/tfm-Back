const selectSubjectStudents = (idStudents) => {
  return db.query(
    `select us.idusers, cl.teachers_id_teachers,s.name  AS subject_name,cl.level,us.name AS teacher_name,us.last_name,us.email from  users as u 
    join class as cl on u.idusers = cl.users_idusers
    join subjects as s on s.idsubjects=cl.subjects_idsubject
    join teachers as t on t.id_teachers=cl.teachers_id_teachers
    join users as us on us.idusers=t.users_idusers where u.idusers=?`,
    [idStudents]
  );
};

const selectStudentsDescriptions = (idUsers) => {
  return db.query(
    `SELECT sd.idStudentsDecriptions,sd.aboutMe,sd.myInterests,sd.users_idusers,u.name
    FROM studentsdecriptions as sd
    join users as u on u.idusers=sd.users_idusers
    where u.idusers`,
    [idUsers]
  );
};

module.exports = { selectSubjectStudents, selectStudentsDescriptions };
