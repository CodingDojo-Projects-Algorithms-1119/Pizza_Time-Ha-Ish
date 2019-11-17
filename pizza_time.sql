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
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(255) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  `email` VARCHAR(255) NULL,
  `address` VARCHAR(255) NULL,
  `city` VARCHAR(255) NULL,
  `state` VARCHAR(45) NULL,
  `password` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_time`.`pizzas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_time`.`pizzas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `size` VARCHAR(45) NULL,
  `crust` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_time`.`toppings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_time`.`toppings` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `topping` VARCHAR(255) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_time`.`methods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_time`.`methods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `method` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_time`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_time`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `qty` INT NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  `price` INT NULL,
  `user_id` INT NOT NULL,
  `method_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_users_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_orders_methods1_idx` (`method_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `pizza_time`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_methods1`
    FOREIGN KEY (`method_id`)
    REFERENCES `pizza_time`.`methods` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_time`.`orders_has_pizzas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_time`.`orders_has_pizzas` (
  `order_id` INT NOT NULL,
  `pizza_id` INT NOT NULL,
  PRIMARY KEY (`order_id`, `pizza_id`),
  INDEX `fk_orders_has_pizzas_pizzas1_idx` (`pizza_id` ASC) VISIBLE,
  INDEX `fk_orders_has_pizzas_orders1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_has_pizzas_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `pizza_time`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_pizzas_pizzas1`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `pizza_time`.`pizzas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizza_time`.`pizzas_has_toppings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizza_time`.`pizzas_has_toppings` (
  `pizza_id` INT NOT NULL,
  `topping_id` INT NOT NULL,
  PRIMARY KEY (`pizza_id`, `topping_id`),
  INDEX `fk_pizzas_has_toppings_toppings1_idx` (`topping_id` ASC) VISIBLE,
  INDEX `fk_pizzas_has_toppings_pizzas1_idx` (`pizza_id` ASC) VISIBLE,
  CONSTRAINT `fk_pizzas_has_toppings_pizzas1`
    FOREIGN KEY (`pizza_id`)
    REFERENCES `pizza_time`.`pizzas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pizzas_has_toppings_toppings1`
    FOREIGN KEY (`topping_id`)
    REFERENCES `pizza_time`.`toppings` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
