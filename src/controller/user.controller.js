const ModelUser = require("../model/user.model");
const bcript = require("bcryptjs");
const SchemaUser = require("../Schemas/users.schema");

//TODO:Terminar de crear los controladores para probar el registro y el login
const register = async (req, res) => {
  try {
    try {
      await SchemaUser.registerValidate(req.body);
    } catch (error) {
      res.status(400).json({ fatal: JSON.parse(error.message) });
    }

    req.body.password = bcript.hashSync(req.body.password, 8);
    const [phone] = await ModelUser.insertPhoneOfRegister(req.body);
    const [result] = await ModelUser.insertUser(req.body, phone.insertId);
    const [user] = await ModelUser.selectuserById(result.insertId);
    console.log(phone);
    res.status(201).json(user);
  } catch (error) {
    res.status(400).json({ fatal: error.message });
  }
};

const login = async (req, res) => {
  try {
    try {
    } catch (error) {
      res.status(400).json({ fatal: JSON.parse(error.message) });
    }
  } catch (error) {}
};

module.exports = { register, login };
