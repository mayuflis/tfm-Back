const getUsersByTeacherId = (teacherId) => {
  return db.query(
    "SELECT users_idusers FROM class WHERE teachers_id_teachers = ?",
    [teacherId]
  );
};

const selectStudetnsBySubjects = (idUsers, idSubject) => {
  return db.query(
    "select count(c.users_idusers) as NumberOfStudents  from class as c join teachers as t on t.id_teachers= c.teachers_id_teachers join users as u on u.idusers=t.users_idusers where u.idusers=? and c.subjects_idsubject=?",
    [idUsers, idSubject]
  );
};

const selectSubjetsOfTeachers = (idUsers) => {
  return db.query(
    "select s.name ,s.idsubjects from subjects as s join teachers_has_subjects as ths on ths.subjects_idsubjects=s.idsubjects join teachers as t on t.id_teachers=ths.teachers_id_teachers join users as u on u.idusers=t.users_idusers where u.idusers =? ",
    [idUsers]
  );
};

const getUsersInfoByTeacherId = (teacherId) => {
  return db.query(
    `
SELECT u.name, u.last_name, u.email, c.mobile
FROM users AS u
INNER JOIN class AS cl ON u.idusers = cl.users_idusers
INNER JOIN contacts AS c ON u.contacts_idcontacts = c.idcontacts
WHERE cl.teachers_id_teachers = ?`,
    [teacherId]
  );
};

//Consulta a la BBDD para obtener todos los profesores
const selectAllTeachers = () => {
  return db.query("select * from teachers");
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
  return db.query("select * from teachers where id_teachers= ?", [teacherId]);
};

module.exports = {
  selectAllTeachers,
  selectTeacherById,
  getUsersInfoByTeacherId,
  getUsersByTeacherId,
  selectStudetnsBySubjects,
  selectSubjetsOfTeachers,
  selectInfoTeachersFromUsers, 
  selectInfoTeacherById
};
