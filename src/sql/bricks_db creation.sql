-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema bricks_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `bricks_db` ;

-- -----------------------------------------------------
-- Schema bricks_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bricks_db` DEFAULT CHARACTER SET utf8 ;
USE `bricks_db` ;

-- -----------------------------------------------------
-- Table `bricks_db`.`dataset`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bricks_db`.`dataset` ;

CREATE TABLE IF NOT EXISTS `bricks_db`.`dataset` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bricks_db`.`concepts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bricks_db`.`concepts` ;

CREATE TABLE IF NOT EXISTS `bricks_db`.`concepts` (
  `id` INT NOT NULL,
  `concept` VARCHAR(30) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `type` VARCHAR(20) NULL,
  `unit` VARCHAR(20) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bricks_db`.`dataset_concept_link`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bricks_db`.`dataset_concept_link` ;

CREATE TABLE IF NOT EXISTS `bricks_db`.`dataset_concept_link` (
  `dataset_id` INT NOT NULL,
  `concept_id` INT NOT NULL,
  INDEX `fk_dataset_concept_link_concepts1_idx` (`concept_id` ASC) VISIBLE,
  CONSTRAINT `fk_dataset_concept_link_dataset1`
    FOREIGN KEY (`dataset_id`)
    REFERENCES `bricks_db`.`dataset` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dataset_concept_link_concepts1`
    FOREIGN KEY (`concept_id`)
    REFERENCES `bricks_db`.`concepts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bricks_db`.`entities`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bricks_db`.`entities` ;

CREATE TABLE IF NOT EXISTS `bricks_db`.`entities` (
  `id` INT NOT NULL,
  `dataset_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_entities_dataset1_idx` (`dataset_id` ASC) VISIBLE,
  CONSTRAINT `fk_entities_dataset1`
    FOREIGN KEY (`dataset_id`)
    REFERENCES `bricks_db`.`dataset` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bricks_db`.`datapoints`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bricks_db`.`datapoints` ;

CREATE TABLE IF NOT EXISTS `bricks_db`.`datapoints` (
  `id` INT NOT NULL,
  `dataset_id` INT NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_datapoints_dataset1_idx` (`dataset_id` ASC) VISIBLE,
  CONSTRAINT `fk_datapoints_dataset1`
    FOREIGN KEY (`dataset_id`)
    REFERENCES `bricks_db`.`dataset` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bricks_db`.`metadata`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bricks_db`.`metadata` ;

CREATE TABLE IF NOT EXISTS `bricks_db`.`metadata` (
  `id` INT NOT NULL,
  `dataset_id` INT NOT NULL,
  `key` VARCHAR(30) NOT NULL,
  `value` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_metadata_dataset1_idx` (`dataset_id` ASC) VISIBLE,
  CONSTRAINT `fk_metadata_dataset1`
    FOREIGN KEY (`dataset_id`)
    REFERENCES `bricks_db`.`dataset` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bricks_db`.`synonyms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bricks_db`.`synonyms` ;

CREATE TABLE IF NOT EXISTS `bricks_db`.`synonyms` (
  `concept_id` INT NOT NULL,
  `synonym` VARCHAR(50) NOT NULL,
  CONSTRAINT `fk_synonyms_concepts1`
    FOREIGN KEY (`concept_id`)
    REFERENCES `bricks_db`.`concepts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
