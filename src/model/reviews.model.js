//Esta función realiza la inserción de una nueva review en la tabla de reviews
const insertReview = (
    {
        opinions,
        recommendations,
        teachers_id_teachers,
        rate,
        users_idusers,
    }
) => {
    return db.query(
        "insert into reviews (opinions,recommendations,teachers_id_teachers,rate,users_idusers) values(?,?,?,?,?)",
        [
            opinions,
            recommendations,
            teachers_id_teachers,
            rate,
            users_idusers,
        ]
    );
};

//Esta función realiza una consulta para seleccionar todas las reviews de un tutor.
const selectAllReviewsFromTutor = (tutorId) => {
    return db.query(`
    SELECT reviews.*, users.*
    FROM reviews
    JOIN users ON reviews.users_idusers = users.idusers
    WHERE reviews.teachers_id_teachers = ?;
`, [tutorId]);
};

const selectUserFromId = (userId) => {
    return db.query("select * from users where idusers = ?", [userId]);
};

module.exports = {
    insertReview,
    selectAllReviewsFromTutor,
    selectUserFromId
};