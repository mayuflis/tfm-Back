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
//Esta función realiza la inserción de un nuevo número de teléfono en la tabla de contactos durante el proceso de registro.
const insertPhoneOfRegister = ({ phone }) => {
  return db.query("insert into contacts (mobile) values (?)", [phone]);
};
//Esta función realiza una consulta para seleccionar un usuario basado en su dirección de correo electrónico.
const selectEmailOfUser = (email) => {
  return db.query("select * from users where email = ?", email);
};
//Función que realiza una consulta para obtener las provincias
const selectAllProvince = () => {
  return db.query("select * from province");
};
module.exports = {
  insertUser,
  selectuserById,
  insertPhoneOfRegister,
  selectEmailOfUser,
  selectAllProvince,
};
