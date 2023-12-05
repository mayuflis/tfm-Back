//Consulta a la BBDD para obtener todos los profesores
const selectAllTeachers = () => {
    return db.query("select * from teachers")
};

//Necessary info for card component and ubication
const selectInfoTeachersFromUsers = () => {
    return db.query(`
        SELECT
            u.idusers, u.name, u.last_name, u.email, u.role,
            u.latitude, u.longitude, u.birthday,
            u.image, p.name_province,  t.description_prof,
            t.title_prof, t.description_class,
            JSON_ARRAYAGG(JSON_OBJECT(
                "subject_name", s.name,
                "level", ths.level,
                "free_class", ths.free_classl
            )) AS arraySubjects
        FROM
            users u
        JOIN
            province p ON u.province_idprovince = p.idprovince
        JOIN
            teachers t ON u.idusers = t.users_idusers
        JOIN
            teachers_has_subjects ths ON t.id_teachers = ths.teachers_id_teachers
        JOIN
            subjects s ON ths.subjects_idsubjects = s.idsubjects
        WHERE
            u.role = "teacher"
        GROUP BY
            u.idusers, u.name, u.email, u.role,
            u.latitude, u.longitude, u.birthday, u.image,
            p.name_province, t.description_prof,
            t.title_prof, t.description_class
    `);
};


const selectInfoTeacherById = (teacherId) => {
    return db.query('SELECT u.idusers, u.name, u.last_name, u.email, u.role, u.latitude, u.longitude, u.birthday, p.name_province, u.image, t.description_prof, t.title_prof, t.description_class, JSON_ARRAYAGG(JSON_OBJECT("subject_name", s.name, "level", ths.level, "free_class", ths.free_classl)) AS arraySubjects FROM users u JOIN province p ON u.province_idprovince = p.idprovince JOIN teachers t ON u.idusers = t.users_idusers JOIN teachers_has_subjects ths ON t.id_teachers = ths.teachers_id_teachers JOIN subjects s ON ths.subjects_idsubjects = s.idsubjects WHERE u.role = "teacher" AND u.idusers=? GROUP BY u.idusers, u.name, u.email, u.role, u.latitude, u.longitude, u.birthday, p.name_province, u.image, t.description_prof, t.title_prof, t.description_class', [teacherId])
}

//Consulta a la BBDD para obtener un profesor por ID
const selectTeacherById = (teacherId) => {
    return db.query("select * from teachers where id_teachers= ?", [teacherId])
};

module.exports = { selectAllTeachers, selectInfoTeachersFromUsers, selectInfoTeacherById, selectTeacherById } 