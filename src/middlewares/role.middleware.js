const checkRoleTeachers = (req, res, next) => {
  // Verifica si el usuario tiene el rol de estudiante o administrador

  if (req.user[0].role === "students" || req.user[0].role === "admin") {
    return res.status(403).json({ fatal: "No eres profesor" });
  }

  // Si el usuario tiene el rol de profesor, continúa con el siguiente middleware o ruta
  next();
};

const checkRoleStudents = (req, res, next) => {
  // Verifica si el usuario tiene el rol de profesor o administrador

  if (req.user[0].role === "teachers" || req.user[0].role === "admin") {
    return res.status(403).json({ fatal: "No eres estudiante" });
  }
  // Si el usuario tiene el rol de estudiante, continúa con el siguiente middleware o ruta

  next();
};
const checkRoleAdmin = (req, res, next) => {
  // Verifica si el usuario tiene el rol de profesor o estudiante

  if (req.user[0].role === "teachers" || req.user[0].role === "students") {
    return res.status(403).json({ fatal: "No eres admin" });
  }
  // Si el usuario tiene el rol de administrador, continúa con el siguiente middleware o ruta

  next();
};

module.exports = { checkRoleTeachers, checkRoleStudents, checkRoleAdmin };
