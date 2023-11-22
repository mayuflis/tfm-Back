//REGISTRO DE USUARIOS

const selectSubjects = () => {
  return db.query("select name form subjects");
};

const insertUser = (
  {
    nombre,
    apellidos,
    fechaNacimiento,
    province,
    email,
    password,
    role,
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
      province,
      email,
      password,
      role,
      longitude,
      latitude,
      contactsId,
    ]
  );
};

const selectuserById = (idUser) => {
  return db.query("select * from users where idusers= ?", [idUser]);
};

const insertPhoneOfRegister = ({ phone }) => {
  return db.query("insert into contacts (mobile) values (?)", [phone]);
};

module.exports = {
  insertUser,
  selectSubjects,
  selectuserById,
  insertPhoneOfRegister,
};
