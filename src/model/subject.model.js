const getSubjectsByTeacherId = (teacherId) => {
  return db.query(
    `
       SELECT s.name,ths.hourly_rate, ths.level
       from subjects as s
       join teachers_has_subjects as ths on ths.subjects_idsubjects=s.idsubjects
       join teachers as t on t.id_teachers=ths.teachers_id_teachers
       join users as u on u.idusers=t.users_idusers
        WHERE u.idusers =  ?`,
    [teacherId]
  );
};

module.exports = {
  getSubjectsByTeacherId,
};
