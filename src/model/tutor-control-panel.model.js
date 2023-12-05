const getTeacherInfo = (teacherId) => {
    return db.query('SELECT description_prof, title_prof, description_class FROM teachers WHERE id_teachers = ?', [teacherId]);
  };
  
  module.exports = {
    getTeacherInfo
  };
