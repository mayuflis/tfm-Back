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
            u.image, p.name_province, t.description_prof,
            t.title_prof, t.description_class, t.experience,
            JSON_ARRAYAGG(JSON_OBJECT(
                "subject_name", s.name,
                "level", ths.level,
                "free_class", ths.free_classl
            )) AS arraySubjects,
            JSON_OBJECT(
                "rate", ROUND(AVG(reviews.rate), 1),
                "num_reviews", SUM(reviews.num_reviews)
            ) AS reviews
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
        LEFT JOIN (
            SELECT
                teachers_id_teachers,
                rate,
                COUNT(id_reviews) AS num_reviews
            FROM
                reviews
            GROUP BY
                teachers_id_teachers, rate
        ) AS reviews ON t.id_teachers = reviews.teachers_id_teachers
        WHERE
            u.role = "teacher"
            and
            t.validate = 1
        GROUP BY
            u.idusers, u.name, u.email, u.role,
            u.latitude, u.longitude, u.birthday, u.image,
            p.name_province, t.description_prof,
            t.title_prof, t.description_class, t.experience
        ORDER BY
            ROUND(AVG(reviews.rate), 1) DESC;  
    `);
};

const selectInfoTeacherById = (teacherId) => {
  return db.query(
    `SELECT
    u.idusers, u.name, u.last_name, u.email, u.role,
    u.latitude, u.longitude, u.birthday,
    u.image, p.name_province, t.description_prof,
    t.title_prof, t.description_class, t.experience,
    JSON_ARRAYAGG(JSON_OBJECT(
        "subject_name", s.name,
        "level", ths.level,
        "free_class", ths.free_classl
    )) AS arraySubjects,
    JSON_OBJECT(
        "rate", ROUND(AVG(reviews.rate), 1),
        "num_reviews", SUM(reviews.num_reviews)
    ) AS reviews
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
LEFT JOIN (
    SELECT
        teachers_id_teachers,
        rate,
        COUNT(id_reviews) AS num_reviews
    FROM
        reviews
    GROUP BY
        teachers_id_teachers, rate
) AS reviews ON t.id_teachers = reviews.teachers_id_teachers
WHERE
    u.role = "teacher" AND u.idusers=?
GROUP BY
    u.idusers, u.name, u.email, u.role,
    u.latitude, u.longitude, u.birthday, u.image,
    p.name_province, t.description_prof,
    t.title_prof, t.description_class, t.experience;
`,
    [teacherId]
  );
};

//Consulta a la BBDD para obtener un profesor por ID
const selectTeacherById = (teacherId) => {
  return db.query("select * from teachers where id_teachers= ?", [teacherId]);
};

const selectListOfClass = (idUser) => {
  return db.query(
    `
select  us.idusers,us.name,us.last_name,s.name as subject,us.email,c.mobile,cl.class_date,cl.start_time from users as u
join teachers as t on t.users_idusers=u.idusers
join class as cl on cl.teachers_id_teachers=t.id_teachers
join users as us on us.idusers=cl.users_idusers
join contacts as c on c.idcontacts=us.contacts_idcontacts
join subjects as s on s.idsubjects=cl.subjects_idsubject
where u.idusers=?`,
    [idUser]
  );
};

module.exports = {
  selectAllTeachers,
  selectTeacherById,
  getUsersInfoByTeacherId,
  getUsersByTeacherId,
  selectStudetnsBySubjects,
  selectSubjetsOfTeachers,
  selectInfoTeachersFromUsers,
  selectInfoTeacherById,
  selectListOfClass,
};
