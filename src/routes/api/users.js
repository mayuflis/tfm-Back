const router = require("express").Router();

const UserController = require("../../controller/user.controller");
const usersController = require('../../controller/user.controller');

//Ruta de registro de usuario
router.post("/register", UserController.register);
//Ruta de login de usuario
router.post("/login", UserController.login);
//Ruta para recuperar las provincias
router.get("/province", UserController.getAllProvinces);
//Ruta para obtener la información de los profesores relacionados con un usuario
router.get('/:userId/teacher-info', usersController.getTeacherByUserId);
//Ruta para obtener los datos de usuario
router.get('/:userId', usersController.getUserById);
//Ruta para obtener informacion del perfil
router.get('/myprofile/:userId', usersController.getBasicProfileInfo);
//Ruta para editar el perfil
router.put('/profile/:userId', usersController.updateUser);

//Validación del token
router.post("/validateToken", UserController.validateTokenFront);
module.exports = router;
