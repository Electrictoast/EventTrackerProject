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
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(100) NOT NULL,
  `state` VARCHAR(100) NOT NULL,
  `street` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `course` ;

CREATE TABLE IF NOT EXISTS `course` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(400) NOT NULL,
  `length` INT NOT NULL,
  `description` TEXT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_course_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_course_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `course_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `content` TEXT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_course_idx` (`course_id` ASC),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_comment_course`
    FOREIGN KEY (`course_id`)
    REFERENCES `course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rating` ;

CREATE TABLE IF NOT EXISTS `rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `course_id` INT NOT NULL,
  `value` DECIMAL(2,1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rating_course1_idx` (`course_id` ASC),
  CONSTRAINT `fk_rating_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ammenity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ammenity` ;

CREATE TABLE IF NOT EXISTS `ammenity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(400) NOT NULL,
  `description` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `course_ammenities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `course_ammenities` ;

CREATE TABLE IF NOT EXISTS `course_ammenities` (
  `course_id` INT NOT NULL,
  `ammenities_id` INT NOT NULL,
  PRIMARY KEY (`course_id`, `ammenities_id`),
  INDEX `fk_course_has_ammenities_ammenities1_idx` (`ammenities_id` ASC),
  INDEX `fk_course_has_ammenities_course1_idx` (`course_id` ASC),
  CONSTRAINT `fk_course_has_ammenities_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_has_ammenities_ammenities1`
    FOREIGN KEY (`ammenities_id`)
    REFERENCES `ammenity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS dgdb@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'dgdb'@'localhost' IDENTIFIED BY 'dgdb';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'dgdb'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `dgdb`;
INSERT INTO `address` (`id`, `city`, `state`, `street`) VALUES (1, 'Denver', 'Colorado', '123 Fake St.');
INSERT INTO `address` (`id`, `city`, `state`, `street`) VALUES (2, 'Aurora', 'Colorado', '777 Fake St.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `course`
-- -----------------------------------------------------
START TRANSACTION;
USE `dgdb`;
INSERT INTO `course` (`id`, `name`, `length`, `description`, `address_id`) VALUES (1, 'DG course 1', 18, 'a great course blah blah', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `dgdb`;
INSERT INTO `user` (`id`, `name`, `username`, `password`, `address_id`) VALUES (1, 'Jake Kisor', 'jkisor', 'pass', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `dgdb`;
INSERT INTO `comment` (`id`, `course_id`, `user_id`, `content`) VALUES (1, 1, 1, 'This course rules');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `dgdb`;
INSERT INTO `rating` (`id`, `course_id`, `value`) VALUES (1, 1, 9.5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `ammenity`
-- -----------------------------------------------------
START TRANSACTION;
USE `dgdb`;
INSERT INTO `ammenity` (`id`, `name`, `description`) VALUES (1, 'Bathroom', 'Course has a bathroom with running water.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `course_ammenities`
-- -----------------------------------------------------
START TRANSACTION;
USE `dgdb`;
INSERT INTO `course_ammenities` (`course_id`, `ammenities_id`) VALUES (1, 1);

COMMIT;

