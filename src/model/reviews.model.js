//Esta función realiza la inserción de una nueva review en la tabla de reviews
const insertReview = (
    {
        title_opinion,
        opinions,
        recommendations,
        teachers_id_teachers,
        rate,
        users_idusers,
    }
) => {
    return db.query(
        "insert into reviews (title_opinion,opinions,recommendations,teachers_id_teachers,rate,users_idusers) values(?,?,?,?,?,?)",
        [
            title_opinion,
            opinions,
            recommendations,
            teachers_id_teachers,
            rate,
            users_idusers,
        ]
    );
};

//Esta función realiza una consulta para seleccionar todas las reviews de un tutor.
//Tambien da el registro del ususario que hace la review
const selectAllReviewsFromTutor = (tutorId) => {
    return db.query(`
    SELECT *
    FROM reviews
    JOIN users ON reviews.users_idusers = users.idusers
    WHERE reviews.teachers_id_teachers = ?;
`, [tutorId]);
};

const selectUserFromId = (userId) => {
    return db.query("select * from users where idusers = ?", [userId]);
};

//sirve para revisar si un usuario no ha escrito una review a un tutor hasta el momento
const isThereAReviewFromUserOfTutor = (userId, tutorId) => {
    console.log(userId,tutorId);
    const sql = 'SELECT * FROM reviews WHERE teachers_id_teachers = ? AND users_idusers = ?';
    return db.query(sql, [userId, tutorId])
};


module.exports = {
    insertReview,
    selectAllReviewsFromTutor,
    selectUserFromId,
    isThereAReviewFromUserOfTutor
};