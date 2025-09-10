-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema review_film
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema review_film
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `review_film` DEFAULT CHARACTER SET utf8 ;
USE `review_film` ;

-- -----------------------------------------------------
-- Table `review_film`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review_film`.`user` (
  `iduser` INT NOT NULL,
  `username` VARCHAR(20) NULL,
  `email` VARCHAR(50) NULL,
  `password` VARCHAR(20) NULL,
  PRIMARY KEY (`iduser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review_film`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review_film`.`profile` (
  `idprofile` INT NOT NULL,
  `age` VARCHAR(4) NULL,
  `biodata` VARCHAR(100) NULL,
  `address` VARCHAR(200) NULL,
  `user_iduser` INT NOT NULL,
  PRIMARY KEY (`idprofile`),
  INDEX `fk_profile_user_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_profile_user`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `review_film`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review_film`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review_film`.`genre` (
  `idgenre` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idgenre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review_film`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review_film`.`movie` (
  `idmovie` INT NOT NULL,
  `title` VARCHAR(50) NULL,
  `summary` VARCHAR(200) NULL,
  `year` INT NULL,
  `poster` VARCHAR(200) NULL,
  `genre_idgenre` INT NOT NULL,
  PRIMARY KEY (`idmovie`),
  INDEX `fk_movie_genre1_idx` (`genre_idgenre` ASC) VISIBLE,
  CONSTRAINT `fk_movie_genre1`
    FOREIGN KEY (`genre_idgenre`)
    REFERENCES `review_film`.`genre` (`idgenre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review_film`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review_film`.`review` (
  `idreview` INT NOT NULL,
  `rating` VARCHAR(50) NULL,
  `critics` VARCHAR(100) NULL,
  `user_iduser` INT NOT NULL,
  `movie_idmovie` INT NOT NULL,
  PRIMARY KEY (`idreview`),
  INDEX `fk_review_user1_idx` (`user_iduser` ASC) VISIBLE,
  INDEX `fk_review_movie1_idx` (`movie_idmovie` ASC) VISIBLE,
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `review_film`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_movie1`
    FOREIGN KEY (`movie_idmovie`)
    REFERENCES `review_film`.`movie` (`idmovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review_film`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review_film`.`role` (
  `idrole` INT NOT NULL,
  `name` VARCHAR(20) NULL,
  PRIMARY KEY (`idrole`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review_film`.`cast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review_film`.`cast` (
  `idcast` INT NOT NULL,
  `name` VARCHAR(20) NULL,
  `age` VARCHAR(45) NULL,
  `biodata` VARCHAR(200) NULL,
  PRIMARY KEY (`idcast`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review_film`.`movie_cat_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `review_film`.`movie_cat_role` (
  `movie_idmovie` INT NOT NULL,
  `role_idrole` INT NOT NULL,
  `cast_idcast` INT NOT NULL,
  INDEX `fk_movie_cat_role_movie1_idx` (`movie_idmovie` ASC) VISIBLE,
  INDEX `fk_movie_cat_role_role1_idx` (`role_idrole` ASC) VISIBLE,
  INDEX `fk_movie_cat_role_cast1_idx` (`cast_idcast` ASC) VISIBLE,
  CONSTRAINT `fk_movie_cat_role_movie1`
    FOREIGN KEY (`movie_idmovie`)
    REFERENCES `review_film`.`movie` (`idmovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_cat_role_role1`
    FOREIGN KEY (`role_idrole`)
    REFERENCES `review_film`.`role` (`idrole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_cat_role_cast1`
    FOREIGN KEY (`cast_idcast`)
    REFERENCES `review_film`.`cast` (`idcast`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
