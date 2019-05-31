-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema dgdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `dgdb` ;

-- -----------------------------------------------------
-- Schema dgdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dgdb` DEFAULT CHARACTER SET utf8 ;
USE `dgdb` ;

-- -----------------------------------------------------
-- Table `course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `course` ;

CREATE TABLE IF NOT EXISTS `course` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating` ;

CREATE TABLE IF NOT EXISTS `rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS dg@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'dg'@'localhost' IDENTIFIED BY 'dgdb';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'dg'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
