//Consulta para obtener a todos los profesores con los datos necesarios
const getAllTeachers = () => {
  return db.query(
    "select u.name,u.last_name,u.image,t.description_prof,t.description_class,t.title_prof,ths.hourly_rate,ths.free_classl,ths.level,t.experience,r.rate,u.role,u.province_idprovince,s.idsubjects from  users as u left join province as p on p.idprovince=u.province_idprovince left join teachers as t on t.users_idusers=u.idusers left join teachers_has_subjects as ths on ths.teachers_id_teachers=t.id_teachers left join subjects as s on s.idsubjects=ths.subjects_idsubjects left join reviews as r on r.teachers_id_teachers=t.id_teachers where u.role='Profesor'  and t.validate=1;"
  );
};

//Función que devuelve todas las asignaturas
const selectAllSubjects = () => {
  return db.query("select * from subjects");
};

module.exports = {
  selectAllSubjects,
  getAllTeachers,
};
