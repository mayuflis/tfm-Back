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
  userId = parseInt(userId);
  console.log(userId);
  return db.query(
    `
    SELECT
  t.id_teachers,
  u.idusers,
  u.name AS teacher_name,
  u.last_name AS teacher_last_name,
  u.email AS teacher_email,
  c.mobile AS teacher_mobile,
  s.name AS subject_name
FROM users AS u
JOIN teachers AS t ON u.idusers = t.users_idusers
JOIN class AS cl ON t.id_teachers = cl.teachers_id_teachers
JOIN subjects AS s ON cl.subjects_idsubject = s.idsubjects
JOIN users AS student ON cl.users_idusers = student.idusers
JOIN contacts AS c ON u.contacts_idcontacts = c.idcontacts
WHERE student.idusers =?
  `,
    [userId]
  );
};

const getUserById = (userId) => {
  return db.query(
    `SELECT * FROM users as u
    join province as p on p.idprovince =u.province_idprovince
    WHERE idusers  = ?`,
    [userId]
  );
};

const selectBasicProfileInfo = (userId) => {
  return db.query(
    `SELECT users.name, users.last_name, users.birthday, users.image, province.name_province, contacts.mobile, gender.gender
  FROM users
  JOIN province ON users.province_idprovince = province.idprovince
  JOIN contacts ON users.contacts_idcontacts = contacts.idcontacts
  JOIN gender ON users.Gender_idGender = gender.idGender
  WHERE idusers = ?`,
    [userId]
  );
};

const updateUserById = (
  userId,
  { name, last_name, birthday, image, name_province, mobile, gender }
) => {
  `UPDATE users
  SET
  users.name = ?,
    users.last_name = ?,
    users.birthday = ?,
    users.image = ?,
    province_idprovince = (
      SELECT idprovince
    FROM province
    WHERE name_province = ?
  ),
contacts_idcontacts = (
  SELECT idcontacts
    FROM contacts
    WHERE mobile = ?
  ),
gender_idgender = (
  SELECT idgender
    FROM gender
    WHERE gender = ?
  )
WHERE idusers = ?;`,
    [name, last_name, birthday, image, name_province, mobile, gender, userId];
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
  selectBasicProfileInfo,
  updateUserById,
};
