const filterHome = (
  selectedSubject,
  selectedProvince,
  selectedPrice,
  selectedExperience,
  minRating
) => {
  console.log(selectedProvince);
  return db.query(
    `
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
            AND (s.name = ? OR ? IS NULL OR ? = '')
            AND (p.name_province = ? OR ? IS NULL OR ? = '')
            AND (t.experience >= ? OR ? IS NULL OR ? = '')
            AND (ths.hourly_rate <= ? OR ? IS NULL OR ? = '')
            AND (rate >= ? OR ? IS NULL OR ? = '')
        GROUP BY
            u.idusers, u.name, u.email, u.role,
            u.latitude, u.longitude, u.birthday, u.image,
            p.name_province, t.description_prof,
            t.title_prof, t.description_class, t.experience
        ORDER BY
            ROUND(AVG(reviews.rate), 1) DESC; `,
    [
      selectedSubject,
      selectedSubject,
      selectedSubject,
      selectedProvince,
      selectedProvince,
      selectedProvince,
      selectedExperience,
      selectedExperience,
      selectedExperience,
      selectedPrice,
      selectedPrice,
      selectedPrice,
      minRating,
      minRating,
      minRating,
    ]
  );
};

module.exports = {
  filterHome,
};
