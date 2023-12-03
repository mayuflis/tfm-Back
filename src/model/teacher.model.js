

const getUsersByTeacherId = (teacherId) => {
  return db.query('SELECT users_idusers FROM teachers_has_users WHERE teachers_id_teachers = ?', [teacherId]);
};

module.exports = {
  getUsersByTeacherId
};

////////////////////////Obtener usuarios del profesor/////////////////////////


const getUsersInfoByTeacherId = (teacherId) => {
 return db.query(`
    SELECT name, last_name, email
    FROM users
    INNER JOIN teachers_has_users ON users.idusers = teachers_has_users.users_idusers
    WHERE teachers_has_users.teachers_id_teachers = ?`,
    [teacherId]
  );
};

module.exports = {
  getUsersInfoByTeacherId
};

/////////////////////////////////////77
