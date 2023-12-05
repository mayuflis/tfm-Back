const TeacherModel = require('../model/teacher.model');


const getAllTeachers = async (req, res) => {

    try {
        const [teachers] = await TeacherModel.selectAllTeachers()
        res.send(teachers)
    } catch (error) {
        res.json({ fatal: error.message })
    }
}

const getTeacherById = async (req, res) => {
    try {
        const { teacherId } = req.params
        const [teacher] = await TeacherModel.selectTeacherById(teacherId)
        res.json(teacher)
    } catch (error) {
        res.json({ fatal: error.message })
    }
}

const getAllTeachersInfo = async (req, res) => {

    try {
        const [teachers] = await TeacherModel.selectInfoTeachersFromUsers()
        res.json(teachers)
    } catch (error) {
        res.json({ fatal: error.message })
    }
}

const getTeacherInfoById = async (req, res) => {
    try {
        const { teacherId } = req.params;
        const [teacher] = await TeacherModel.selectInfoTeacherById(teacherId)
        res.json(teacher)

    } catch (error) {
        res.json({ fatal: error.message })
    }
}

module.exports = { getAllTeachers, getTeacherById, getAllTeachersInfo, getTeacherInfoById }