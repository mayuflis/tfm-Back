
const selectAllTeachers = () => {
    return db.query("select * from teachers")
};

const selectTeacherById = (teacherId) => {
    return db.query("select * from teachers", [teacherId])
};

module.exports = { selectAllTeachers, selectTeacherById } 