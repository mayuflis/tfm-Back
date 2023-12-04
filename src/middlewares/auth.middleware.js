const jsonwebtoken = require("jsonwebtoken");
const UserModel = require("../model/user.model");

//Función que comprueba que el usuario está logeado correctamente
const checkToken = async (req, res, next) => {
  // Verifica si la solicitud tiene la cabecera "authorization"
  if (!req.headers["authorization"]) {
    return res
      .status(403)
      .json({ fatal: "Necesitas cabeceras de autorización" });
  }
  // Obtiene el token de la cabecera "authorization"
  const token = req.headers["authorization"];

  let payload;
  try {
    // Verifica y decodifica el token utilizando la clave secreta
    payload = jsonwebtoken.verify(token, process.env.SECRET_KEY);
  } catch (error) {
    return res.status(403).json({ fatal: error.message });
  }
  // Obtiene el usuario asociado al ID almacenado en el token
  const [user] = await UserModel.selectuserById(payload.user_id);

  // Almacena la información del usuario en el objeto de solicitud (req)
  console.log(user);
  req.user = user;

  next();
};

module.exports = { checkToken };
