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

module.exports = {
    insertReview
};