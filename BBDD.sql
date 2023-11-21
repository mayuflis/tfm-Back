-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema appTeacher3
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema appTeacher3
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `appTeacher3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `appTeacher3` ;

-- -----------------------------------------------------
-- Table `appTeacher3`.`province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appTeacher3`.`province` (
  `idprovince` INT NOT NULL AUTO_INCREMENT,
  `name_province` VARCHAR(45) NULL,
  PRIMARY KEY (`idprovince`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `appTeacher3`.`Gender`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appTeacher3`.`Gender` (
  `idGender` INT NOT NULL AUTO_INCREMENT,
  `gender` VARCHAR(12) NULL,
  PRIMARY KEY (`idGender`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `appTeacher3`.`contacts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appTeacher3`.`contacts` (
  `idcontacts` INT NOT NULL AUTO_INCREMENT,
  `mobile` VARCHAR(12) NULL,
  `landline` VARCHAR(10) NULL,
  PRIMARY KEY (`idcontacts`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `appTeacher3`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appTeacher3`.`users` (
  `idusers` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(30) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  `role` VARCHAR(8) NOT NULL,
  `latitude` FLOAT NOT NULL,
  `longitude` FLOAT NOT NULL,
  `birthday` DATE NOT NULL,
  `province_idprovince` INT NULL,
  `delete_users` TINYINT NULL DEFAULT 0,
  `Gender_idGender` INT NULL,
  `contacts_idcontacts` INT NULL,
  PRIMARY KEY (`idusers`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  INDEX `fk_users_province1_idx` (`province_idprovince` ASC) VISIBLE,
  INDEX `fk_users_Gender1_idx` (`Gender_idGender` ASC) VISIBLE,
  INDEX `fk_users_contacts1_idx` (`contacts_idcontacts` ASC) VISIBLE,
  CONSTRAINT `fk_users_province1`
    FOREIGN KEY (`province_idprovince`)
    REFERENCES `appTeacher3`.`province` (`idprovince`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_Gender1`
    FOREIGN KEY (`Gender_idGender`)
    REFERENCES `appTeacher3`.`Gender` (`idGender`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_contacts1`
    FOREIGN KEY (`contacts_idcontacts`)
    REFERENCES `appTeacher3`.`contacts` (`idcontacts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `appTeacher3`.`teachers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appTeacher3`.`teachers` (
  `id_teachers` INT NOT NULL AUTO_INCREMENT,
  `validate` TINYINT(1) NULL DEFAULT 0,
  `image` VARCHAR(80) NULL,
  `users_idusers` INT NOT NULL,
  `description_prof` TINYTEXT NULL,
  `title_prof` VARCHAR(200) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci' NULL,
  `description_class` TINYTEXT NULL,
  PRIMARY KEY (`id_teachers`),
  INDEX `fk_teachers_users1_idx` (`users_idusers` ASC) VISIBLE,
  CONSTRAINT `fk_teachers_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `appTeacher3`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `appTeacher3`.`subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appTeacher3`.`subjects` (
  `idsubjects` INT NOT NULL AUTO_INCREMENT,
  `name` ENUM('Matemáticas', 'Lenguaje', 'Inglés', 'Programación', 'Física', 'Biología', 'Química') NULL,
  PRIMARY KEY (`idsubjects`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `appTeacher3`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appTeacher3`.`reviews` (
  `id_reviews` INT NOT NULL AUTO_INCREMENT,
  `opinions` TEXT NULL,
  `recommendations` TEXT NULL,
  `teachers_id_teachers` INT NOT NULL,
  `rate` TINYINT(1) NULL,
  `users_idusers` INT NOT NULL,
  PRIMARY KEY (`id_reviews`),
  INDEX `fk_reviews_teachers1_idx` (`teachers_id_teachers` ASC) VISIBLE,
  INDEX `fk_reviews_users1_idx` (`users_idusers` ASC) VISIBLE,
  CONSTRAINT `fk_reviews_teachers1`
    FOREIGN KEY (`teachers_id_teachers`)
    REFERENCES `appTeacher3`.`teachers` (`id_teachers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviews_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `appTeacher3`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `appTeacher3`.`teachers_has_subjects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appTeacher3`.`teachers_has_subjects` (
  `teachers_id_teachers` INT NOT NULL,
  `subjects_idsubjects` INT NOT NULL,
  `hourly_rate` TINYINT(2) NULL,
  `free_classl` TINYINT(2) NULL,
  `level` TINYINT(1) NULL,
  INDEX `fk_teachers_has_subjects_subjects1_idx` (`subjects_idsubjects` ASC) VISIBLE,
  INDEX `fk_teachers_has_subjects_teachers1_idx` (`teachers_id_teachers` ASC) VISIBLE,
  CONSTRAINT `fk_teachers_has_subjects_teachers1`
    FOREIGN KEY (`teachers_id_teachers`)
    REFERENCES `appTeacher3`.`teachers` (`id_teachers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teachers_has_subjects_subjects1`
    FOREIGN KEY (`subjects_idsubjects`)
    REFERENCES `appTeacher3`.`subjects` (`idsubjects`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `appTeacher3`.`teachers_has_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `appTeacher3`.`teachers_has_users` (
  `teachers_id_teachers` INT NOT NULL,
  `users_idusers` INT NOT NULL,
  INDEX `fk_teachers_has_users_users1_idx` (`users_idusers` ASC) VISIBLE,
  INDEX `fk_teachers_has_users_teachers1_idx` (`teachers_id_teachers` ASC) VISIBLE,
  CONSTRAINT `fk_teachers_has_users_teachers1`
    FOREIGN KEY (`teachers_id_teachers`)
    REFERENCES `appTeacher3`.`teachers` (`id_teachers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_teachers_has_users_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `appTeacher3`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

#Modificar tabla para agregar fechas de actualización y creaación
ALTER TABLE students
ADD COLUMN created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;