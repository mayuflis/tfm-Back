//REGISTRO DE USUARIOS
//Esta función realiza la inserción de un nuevo usuario en la tabla de usuarios.
const insertUser = (
  {
    nombre,
    apellidos,
    fechaNacimiento,
    provincia,
    email,
    password,
    rol,
    longitude,
    latitude,
  },
  contactsId
) => {
  return db.query(
    "insert into users (name,last_name,birthday,province_idprovince,email,password,role,longitude,latitude,contacts_idcontacts) values(?,?,?,?,?,?,?,?,?,?)",
    [
      nombre,
      apellidos,
      fechaNacimiento,
      provincia,
      email,
      password,
      rol,
      longitude,
      latitude,
      contactsId,
    ]
  );
};

//Esta función realiza una consulta para seleccionar un usuario basado en su ID.
const selectuserById = (idUser) => {
  return db.query("select * from users where idusers= ?", [idUser]);
};

const selectPhone = (telefono) => {
  return db.query(
    "SELECT idcontacts FROM appteacher3.contacts where mobile=? ",
    [telefono]
  );
};

//Esta función realiza la inserción de un nuevo número de teléfono en la tabla de contactos durante el proceso de registro.
const insertPhoneOfRegister = (phone) => {
  return db.query("insert into contacts (mobile) values (?)", [phone]);
};
//Esta función realiza una consulta para seleccionar un usuario basado en su dirección de correo electrónico.
const selectEmailOfUser = (email) => {
  return db.query("select * from users where email = ?", email);
};
const selectEmailToIdUsers = (email) => {
  return db.query("select idusers from users where email = ?", email);
};
//Función que realiza una consulta para obtener las provincias
const selectAllProvince = () => {
  return db.query("select * from province");
};

/*const getTeacherByUserId = (userId) => {
  return db.query(`SELECT name, last_name, email
  FROM users
  WHERE idusers = (SELECT users_idusers
  FROM teachers
  WHERE id_teachers = (
      SELECT teachers_id_teachers
      FROM class
      WHERE users_idusers = ?)
  )`, [userId]
 
  );
};*/

const getTeacherByUserId = (userId) => {
  return db.query(
    `
    SELECT u.name, u.last_name, u.email, c.mobile
    FROM users AS u
    INNER JOIN contacts AS c ON u.contacts_idcontacts = c.idcontacts
    WHERE u.idusers = (
      SELECT users_idusers
      FROM teachers
      WHERE id_teachers = (
        SELECT teachers_id_teachers
        FROM class
        WHERE users_idusers = ?
      )
    )
  `,
    [userId]
  );
};

const getUserById = (userId) => {
  return db.query("SELECT * FROM users WHERE idusers = ?", [userId]);
};

module.exports = {
  getTeacherByUserId,
  insertUser,
  selectuserById,
  insertPhoneOfRegister,
  selectEmailOfUser,
  selectAllProvince,
  getUserById,
  selectPhone,
  selectEmailToIdUsers,
};
