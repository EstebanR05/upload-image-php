SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`persons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`persons` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rol` VARCHAR(45) NULL,
  `Genero` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`movie` (
  `idmovie` INT NOT NULL AUTO_INCREMENT,
  `nombre de la pelicula` VARCHAR(45) NULL,
  `Año de publicación` VARCHAR(45) NULL,
  `Director` VARCHAR(45) NULL,
  `Actor` VARCHAR(45) NULL,
  `Productor` VARCHAR(45) NULL,
  `Duración` VARCHAR(45) NULL,
  `Genero` VARCHAR(45) NULL,
  PRIMARY KEY (`idmovie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`persons_has_movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`persons_has_movie` (
  `persons_id` INT NOT NULL,
  `movie_idmovie` INT NOT NULL,
  PRIMARY KEY (`persons_id`, `movie_idmovie`),
  INDEX `fk_persons_has_movie_movie1_idx` (`movie_idmovie` ASC),
  INDEX `fk_persons_has_movie_persons_idx` (`persons_id` ASC),
  CONSTRAINT `fk_persons_has_movie_persons`
    FOREIGN KEY (`persons_id`)
    REFERENCES `mydb`.`persons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_persons_has_movie_movie1`
    FOREIGN KEY (`movie_idmovie`)
    REFERENCES `mydb`.`movie` (`idmovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
