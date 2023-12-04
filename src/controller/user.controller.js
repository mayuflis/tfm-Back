const ModelUser = require("../model/user.model");
const bcrypt = require("bcryptjs");
const SchemaUser = require("../Schemas/users.schema");
const { createToken } = require("../helpers/util");
const UsersModel = require('../model/user.model');

//Realiza el registro de usuarios
const register = async (req, res) => {
  try {
    req.body.provincia = parseInt(req.body.provincia);
    try {
      //Validación de los datos entrantes
      await SchemaUser.registerValidate(req.body);
    } catch (error) {
      return res
        .status(400)
        .json({ fatal: "Error de validación", details: error.errors });
    }

    try {
      // Hash de la contraseña antes de almacenarla en la base de datos
      req.body.password = bcrypt.hashSync(req.body.password, 8);
    } catch (error) {
      return res.status(500).json({
        error: "Error al encriptar la contraseña",
        details: error.message,
      });
    }

    //Se inserta el teléfono en la tabla contactos
    const [phone] = await ModelUser.insertPhoneOfRegister(req.body);
    //Inserción del usuario en la tabla usuario
    const [result] = await ModelUser.insertUser(req.body, phone.insertId);
    //Devuelve los datos del usuario
    const [user] = await ModelUser.selectuserById(result.insertId);

    res.status(201).json(user);
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }
};

//Realiza el login de usuario
const login = async (req, res) => {
  try {
    const { email, password } = req.body;

    //Seleción del usuario a través del email
    const [user] = await ModelUser.selectEmailOfUser(email);

    // Si el usuario no existe, retorna un mensaje de error
    if (!user[0]) {
      return res.status(403).json({ fatal: "Error en el email y/o password" });
    }

    // Comparación de la contraseña introducida con la contraseña almacenada

    const equals = bcrypt.compareSync(password, user[0].password);

    // Si las contraseñas no coinciden, retorna un mensaje de error
    if (!equals) {
      return res.status(403).json({ fatal: "Error en el email y/o password" });
    }

    // Si todo está bien, devuelve un token de autenticación
    res.status(200).json({
      succes: true,
      token: createToken(user[0]),
    });
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }
};
//Obtiene las provincias
const getAllProvinces = async (req, res) => {
try {
    const [provinces] = await ModelUser.selectAllProvince();
    res.status(200).json(provinces);
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }

};

const getTeacherByUserId = async (req, res) => {
  const { userId } = req.params;

  try {
    const [teacherInfo] = await UsersModel.getTeacherByUserId(userId);

    res.json(teacherInfo);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error al obtener la información del profesor asociado al usuario.' });
  }
};

const getUserById = async (req, res) => {
  const { userId } = req.params;

  try {
    const [user] = await UsersModel.getUserById(userId);
    res.json(user);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error retrieving user data.' });
  }
};


module.exports = { register, login, getAllProvinces, getTeacherByUserId, getUserById };





