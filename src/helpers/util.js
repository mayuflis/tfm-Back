const dayjs = require("dayjs");
const jsowebtoken = require("jsonwebtoken");

// Construye el payload del token con información del usuario
const createToken = (user) => {
  const payload = {
    user_id: user.idusers,
    user_role: user.role,
    exp: dayjs().add(2, "days").unix(),
  };
  // Crea y devuelve un nuevo token utilizando el payload y la clave secreta
  return jsowebtoken.sign(payload, process.env.SECRET_KEY);
};

module.exports = { createToken };
