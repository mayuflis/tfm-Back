const getSubjectsByTeacherId = (teacherId) => {
    return db.query(`
      SELECT subjects.name, teachers_has_subjects.hourly_rate, teachers_has_subjects.level
      FROM teachers_has_subjects
      JOIN subjects ON teachers_has_subjects.subjects_idsubjects = subjects.idsubjects
      WHERE teachers_has_subjects.teachers_id_teachers = ?`,
      [teacherId]
    );
  };
  
  module.exports = {
    getSubjectsByTeacherId
  };