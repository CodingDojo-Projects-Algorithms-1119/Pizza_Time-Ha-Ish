-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizza_time
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizza_time
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizza_time` DEFAULT CHARACTER SET utf8 ;
USE `pizza_time` ;

-- -----------------------------------------------------
-- Table `pizza_time`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_time`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `state` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `pizza_time`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_time`.`orders` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `qty` INT(11) NULL DEFAULT NULL,
  `method` VARCHAR(255) NULL DEFAULT NULL,
  `size` VARCHAR(45) NULL DEFAULT NULL,
  `crust` VARCHAR(255) NULL DEFAULT NULL,
  `price` DECIMAL(38,2) NULL DEFAULT NULL,
  `topping` VARCHAR(255) NULL DEFAULT NULL,
  `fave` BIT(1) NULL DEFAULT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_users_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `pizza_time`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
