const filterProfessor = (
  teachers,
  selectedSubject,
  selectedProvince,
  selectedPrice,
  selectedExperience,
  minRating
) => {
  selectedSubject = parseInt(selectedSubject);
  selectedProvince = parseInt(selectedProvince);
  selectedPrice = parseInt(selectedPrice);
  selectedExperience = parseInt(selectedExperience);
  let filtrado = [];
  if (selectedProvince != 0) {
    filtrado = teachers.filter((provincias) => {
      return provincias.province_idprovince === selectedProvince;
    });
  } else {
    filtrado = teachers;
  }

  if (selectedSubject != 0) {
    filtrado = filtrado.filter(
      (subject) => subject.idsubjects === selectedSubject
    );
  }
  if (selectedPrice != 0) {
    filtrado = filtrado.filter((price) => {
      return price.hourly_rate <= selectedPrice;
    });
  }

  if (selectedExperience != 0) {
    filtrado = filtrado.filter(
      (teachers) => teachers.experience >= selectedExperience
    );
  }
  if (minRating != 0) {
    filtrado = filtrado.filter((teachers) => {
      if (teachers.rate) return teachers.rate >= minRating;
    });
  }

  return filtrado;
};

module.exports = { filterProfessor };
