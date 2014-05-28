SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ocelli
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ocelli` ;
CREATE SCHEMA IF NOT EXISTS `ocelli` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

USE `ocelli` ;

-- -----------------------------------------------------
-- Table `ocelli`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`user` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`user` (
  `user_id` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`));



-- -----------------------------------------------------
-- Table `ocelli`.`user_profiles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`user_profiles` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`user_profiles` (
  `profile_id` INT NOT NULL,
  `user_profilescol` VARCHAR(45) NULL,
  `user_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`profile_id`, `user_id`),
  INDEX `fk_user_profiles_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_profiles_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `ocelli`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `ocelli`.`application`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`application` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`application` (
  `app_id` INT NOT NULL,
  `app_desc` VARCHAR(45) NULL,
  `app_name` VARCHAR(45) NULL,
  PRIMARY KEY (`app_id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `ocelli`.`profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`profile` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`profile` (
  `profile_id` INT NOT NULL,
  `profile_desc` VARCHAR(45) NULL,
  `profile_name` VARCHAR(45) NULL,
  PRIMARY KEY (`profile_id`),
  INDEX `fk_profile_user_profiles1_idx` (`profile_id` ASC),
  CONSTRAINT `fk_profile_user_profiles1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `ocelli`.`user_profiles` (`profile_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `ocelli`.`profile_applications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`profile_applications` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`profile_applications` (
  `app_id` INT NOT NULL,
  `profile_id` INT NOT NULL,
  PRIMARY KEY (`profile_id`),
  INDEX `fk_application_has_profile_profile1_idx` (`profile_id` ASC),
  INDEX `fk_application_has_profile_application1_idx` (`app_id` ASC),
  CONSTRAINT `fk_application_has_profile_application1`
    FOREIGN KEY (`app_id`)
    REFERENCES `ocelli`.`application` (`app_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_application_has_profile_profile1`
    FOREIGN KEY (`profile_id`)
    REFERENCES `ocelli`.`profile` (`profile_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ocelli`.`environment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`environment` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`environment` (
  `env_id` INT NOT NULL,
  `env_type_cd` VARCHAR(8) NOT NULL,
  `env_name` VARCHAR(45) NULL,
  `env_description` VARCHAR(45) NULL,
  PRIMARY KEY (`env_id`,`env_type_cd`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ocelli`.`environment_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`environment_type` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`environment_type` (
  `env_type_cd` VARCHAR(8) NOT NULL,
  `env_type_description` VARCHAR(45) NULL,
  INDEX `fk_environment_type_environment1_idx` (`env_type_cd` ASC),
  PRIMARY KEY (`env_type_cd`),
  CONSTRAINT `fk_environment_type_environment1`
    FOREIGN KEY (`env_type_cd`)
    REFERENCES `ocelli`.`environment` (`env_type_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ocelli`.`application_environments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`application_environments` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`application_environments` (
  `env_id` INT NOT NULL,
  `app_id` INT NOT NULL,
  PRIMARY KEY (`env_id`, `app_id`),
  INDEX `fk_environment_has_application_application1_idx` (`app_id` ASC),
  INDEX `fk_environment_has_application_environment1_idx` (`env_id` ASC),
  CONSTRAINT `fk_environment_has_application_environment1`
    FOREIGN KEY (`env_id`)
    REFERENCES `ocelli`.`environment` (`env_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_environment_has_application_application1`
    FOREIGN KEY (`app_id`)
    REFERENCES `ocelli`.`application` (`app_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `ocelli`.`node`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`node` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`node` (
  `node_id` INT NOT NULL,
  `node_name` VARCHAR(45) NULL,
  `node_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`node_id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `ocelli`.`enivronment_nodes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`enivronment_nodes` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`enivronment_nodes` (
  `env_id` INT NOT NULL,
  `node_id` INT NOT NULL,
  PRIMARY KEY (`env_id`),
  INDEX `fk_node_has_environment_environment1_idx` (`env_id` ASC),
  INDEX `fk_node_has_environment_node1_idx` (`node_id` ASC),
  CONSTRAINT `fk_node_has_environment_node1`
    FOREIGN KEY (`node_id`)
    REFERENCES `ocelli`.`node` (`node_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_node_has_environment_environment1`
    FOREIGN KEY (`env_id`)
    REFERENCES `ocelli`.`environment` (`env_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `ocelli`.`access_key`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`access_key` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`access_key` (
  `access_key_id` INT NOT NULL,
  `access_key_type` VARCHAR(45) NULL,
  `access_key_data` VARCHAR(45) NULL,
  `access_key_type_cd` VARCHAR(8) NULL,
  `access_key_principal` VARCHAR(45) NULL,
  PRIMARY KEY (`access_key_id`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `ocelli`.`access_key_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`access_key_type` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`access_key_type` (
  `access_key_type_cd` VARCHAR(8) NOT NULL,
  `access_key_type_description` VARCHAR(255) NULL,
  PRIMARY KEY (`access_key_type_cd`),
  CONSTRAINT `fk_access_key_type_access_key1`
    FOREIGN KEY (`access_key_type_cd`)
    REFERENCES `ocelli`.`access_key` (`access_key_type_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `ocelli`.`node_access_keys`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`node_access_keys` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`node_access_keys` (
  `access_key_id` INT NOT NULL,
  `node_id` INT NOT NULL,
  PRIMARY KEY (`access_key_id`),
  INDEX `fk_access_key_has_node_node1_idx` (`node_id` ASC),
  INDEX `fk_access_key_has_node_access_key1_idx` (`access_key_id` ASC),
  CONSTRAINT `fk_access_key_has_node_access_key1`
    FOREIGN KEY (`access_key_id`)
    REFERENCES `ocelli`.`access_key` (`access_key_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_access_key_has_node_node1`
    FOREIGN KEY (`node_id`)
    REFERENCES `ocelli`.`node` (`node_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `ocelli`.`artifact_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`artifact_type` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`artifact_type` (
  `artifact_type_cd` VARCHAR(8) NOT NULL,
  `articfact_type_desc` VARCHAR(45) NULL,
  PRIMARY KEY (`artifact_type_cd`))
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `ocelli`.`node_artifact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`node_artifact` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`node_artifact` (
  `node_artifact_id` INT NOT NULL,
  `artifact_type_cd` VARCHAR(8) NOT NULL,
  `artifact_location` VARCHAR(255) NULL,
  PRIMARY KEY (`node_artifact_id`),
  INDEX `fk_node_artifact_artifact_type1_idx` (`artifact_type_cd` ASC),
  CONSTRAINT `fk_node_artifact_artifact_type1`
    FOREIGN KEY (`artifact_type_cd`)
    REFERENCES `ocelli`.`artifact_type` (`artifact_type_cd`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `ocelli`.`node_artifacts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ocelli`.`node_artifacts` ;


CREATE TABLE IF NOT EXISTS `ocelli`.`node_artifacts` (
  `node_node_id` INT NOT NULL,
  `node_artifact_node_artifact_id` INT NOT NULL,
  PRIMARY KEY (`node_node_id`, `node_artifact_node_artifact_id`),
  INDEX `fk_node_has_node_artifact_node_artifact1_idx` (`node_artifact_node_artifact_id` ASC),
  INDEX `fk_node_has_node_artifact_node1_idx` (`node_node_id` ASC),
  CONSTRAINT `fk_node_has_node_artifact_node1`
    FOREIGN KEY (`node_node_id`)
    REFERENCES `ocelli`.`node` (`node_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_node_has_node_artifact_node_artifact1`
    FOREIGN KEY (`node_artifact_node_artifact_id`)
    REFERENCES `ocelli`.`node_artifact` (`node_artifact_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
