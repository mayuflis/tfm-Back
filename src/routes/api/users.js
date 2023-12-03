const router = require("express").Router();

const UserController = require("../../controller/user.controller");

//Ruta de registro de usuario
router.post("/register", UserController.register);
//Ruta de login de usuario
router.post("/login", UserController.login);
//Ruta para recuperar las provincias
router.get("/province", UserController.getAllProvinces);
//Validación edl token
router.post("/validateToken", UserController.validateTokenFront);
module.exports = router;
