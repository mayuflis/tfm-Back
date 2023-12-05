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
  let idUnico = {};
  if (selectedProvince != 0) {
    filtrado = teachers.filter((teacher) => {
      return teacher.province_idprovince === selectedProvince;
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
  filtrado = filtrado.filter((teacher) => {
    if (!idUnico[teacher.idusers]) {
      idUnico[teacher.idusers] = true;

      return true;
    }
    return false;
  });

  return filtrado;
};

module.exports = { filterProfessor };
