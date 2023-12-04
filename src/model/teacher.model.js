
const getUsersByTeacherId = (teacherId) => {
  return db.query('SELECT users_idusers FROM class WHERE teachers_id_teachers = ?', [teacherId]);
};



////////////////////////Obtener usuarios del profesor/////////////////////////


const getUsersInfoByTeacherId = (teacherId) => {
return db.query(`
SELECT u.name, u.last_name, u.email, c.mobile
FROM users AS u
INNER JOIN class AS cl ON u.idusers = cl.users_idusers
INNER JOIN contacts AS c ON u.contacts_idcontacts = c.idcontacts
WHERE cl.teachers_id_teachers = ?`,
[teacherId]
);
};


/////////////////////////////////////77

//Consulta a la BBDD para obtener todos los profesores
const selectAllTeachers = () => {
    return db.query("select * from teachers")
};

//Consulta a la BBDD para obtener un profesor por ID
const selectTeacherById = (teacherId) => {
    return db.query("select * from teachers where id_teachers= ?", [teacherId])
};

module.exports = { selectAllTeachers, selectTeacherById, getUsersByTeacherId,  getUsersInfoByTeacherId } 
