const ModelUser = require("../model/user.model");
const bcrypt = require("bcryptjs");
const SchemaUser = require("../Schemas/users.schema");
const { createToken } = require("../helpers/util");
const UsersModel = require("../model/user.model");

const jsonWebToken = require("jsonwebtoken");
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

    //Comprobación si existe el téfono en la tabla
    const id = await ModelUser.selectPhone(req.body.telefono);
    //Comprobación de si existe el correo en la tabla
    const [idUsers] = await ModelUser.selectEmailToIdUsers(req.body.email);

    //Si el télfono se encuentra en la tabla contacts lanza el siguiente error
    if (id[0].length !== 0) {
      return res.status(400).json({ fatal: "Telefono repetido" });
    }
    //Si el email existe en la tabla email lanzará el siguiente error
    if (idUsers.length !== 0) {
      return res.status(400).json({ fatal: "Email repetido" });
    }
    //Se inserta el teléfono en la tabla contactos
    const [phone] = await ModelUser.insertPhoneOfRegister(req.body.telefono);

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
    // Manejar cualquier error durante el proceso y devolver un mensaje de error al cliente
  } catch (error) {
    res.status(500).json({ error: error.message });
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
    res.status(500).json({
      message:
        "Error al obtener la información del profesor asociado al usuario.",
    });
  }
};

const getUserById = async (req, res) => {
  const { userId } = req.params;

  try {
    const [user] = await UsersModel.getUserById(userId);
    res.json(user);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error retrieving user data." });
  }
};

//Comprueba si el token recibido es válido
const validateTokenFront = async (req, res) => {
  try {
    const { token } = req.body;

    const result = jsonWebToken.verify(token, process.env.SECRET_KEY);
    res.status(200).json(result);
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }
};

const getBasicProfileInfo = async (req, res) => {
  try {
    const { userId } = req.params
    const [user] = await ModelUser.selectBasicProfileInfo(userId)
    res.json(user[0])
  } catch (error) {
    res.json({ fatal: error.message })
  }
}

const updateUser = async (req, res) => {
  try {
    const { userId } = req.params
    const [updatedUser] = await ModelUser.updateUserById(userId, req.body)
    res.json(updatedUser);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

const getAboutMeInfo = async (req, res) => {
  try {
    const { userId } = req.params
    const [info] = await ModelUser.selectAboutMeInfoById(userId)

    if (info[0] === undefined) {
      res.json({ "error": "no se encuentra ningun profesor validado con este id" })
    }
    res.json(info[0])
  } catch (error) {
    res.status(500).json({ fatal_error: error.message })
  }
}

const getStudentAboutMe = async (req, res) => {
  try {
    const { userId } = req.params
    const [info] = await ModelUser.selectStudentInfoById(userId)

    if (info[0] === undefined) {
      res.json({ "error": "no se encuentra ningun estudiante con este id" })
    }
    res.json(info[0])
  } catch (error) {
    res.status(500).json({ fatal_error: error.message })
  }
}
const updateAboutMeInfo = async (req, res) => {
  try {
    const { userId } = req.params;
    const [updateAboutMe] = await ModelUser.updateAboutMe(userId, req.body)
    res.json(updateAboutMe)
  } catch (error) {
    res.status(500).json({ fatal_error: error.message })
  }
}
const updateAboutMeStudent = async (req, res) => {
  try {
    const { userId } = req.params;
    const [updateAboutMe] = await ModelUser.updateAboutMeStudent(userId, req.body)
    res.json(updateAboutMe)
  } catch (error) {
    res.status(500).json({ fatal_error: error.message })
  }
}
module.exports = {
  register,
  login,
  getAllProvinces,
  getTeacherByUserId,
  getUserById,
  validateTokenFront,
  getBasicProfileInfo,
  updateUser,
  getAboutMeInfo,
  getStudentAboutMe,
  updateAboutMeInfo,
  updateAboutMeStudent
};
