SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema entradas_web
-- -----------------------------------------------------

CREATE SCHEMA IF NOT EXISTS `entradas_web` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `entradas_web` ;

-- -----------------------------------------------------
-- Table `entradas`.`eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entradas_web`.`eventos` (
  `eventos_id` INT NOT NULL,
  `artista` INT NOT NULL,
  `eventos` INT NOT NULL,
  `dia` INT NULL DEFAULT NULL,
  `mes` INT NULL DEFAULT NULL,
  `año` INT NULL DEFAULT NULL,
  `precios` INT NULL DEFAULT NULL,
  `enlaces` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`eventos_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entradas`.`no_residentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entradas_web`.`no_residentes` (
  `no_residentes_id` INT NOT NULL,
  `residencia` INT NULL DEFAULT NULL,
  `comunidad` INT NULL DEFAULT NULL,
  `viajeros` INT NULL DEFAULT NULL,
  `pernoctaciones` INT NULL DEFAULT NULL,
  `año` INT NULL DEFAULT NULL,
  `mes` INT NULL DEFAULT NULL,
  `total` INT NULL DEFAULT NULL,
  `eventos_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`no_residentes_id`),
  INDEX `eventos_id_idx` (`eventos_id` ASC) VISIBLE,
  CONSTRAINT `eventos_id`
    FOREIGN KEY (`eventos_id`)
    REFERENCES `entradas_web`.`eventos` (`eventos_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `entradas`.`residentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entradas_web`.`residentes` (
  `residentes_id` INT NOT NULL,
  `residencia` INT NULL DEFAULT NULL,
  `comunidad` INT NULL DEFAULT NULL,
  `viajeros` INT NULL DEFAULT NULL,
  `pernoctaciones` INT NULL DEFAULT NULL,
  `año` INT NULL DEFAULT NULL,
  `mes` INT NULL DEFAULT NULL,
  `total` INT NULL DEFAULT NULL,
  `eventos_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`residentes_id`),
  INDEX `eventos_id_idx` (`eventos_id` ASC) VISIBLE,
  CONSTRAINT `eventos_id_fk`
    FOREIGN KEY (`eventos_id`)
    REFERENCES `entradas_web`.`eventos` (`eventos_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



-- -----------------------------------------------------
-- Table `entradas`.`asistencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `entradas_web`.`asistencia` (
	`comunidad` INT NULL DEFAULT NULL,
    `asistencia(2021-2022)_id` INT NOT NULL,
    `asistencia(2021-2022)` INT NOT NULL,
    `conciertos` INT NULL DEFAULT NULL,
    `clasica` TEXT NULL DEFAULT NULL,
    `actual` TEXT NULL DEFAULT NULL,
    `residentes_id` INT NULL DEFAULT NULL,
    `no_residentes_id` INT NULL DEFAULT NULL,
    `eventos_id` INT NULL DEFAULT NULL,
	PRIMARY KEY (`asistencia(2021-2022)_id`),
	INDEX `residentes_id_idx` (`residentes_id` ASC) VISIBLE,
	INDEX `no_residentes_id_idx` (`no_residentes_id` ASC) VISIBLE,
	CONSTRAINT `residentes_id`
	  FOREIGN KEY (`residentes_id`)
	  REFERENCES `entradas_web`.`residentes` (`residentes_id`)
	  ON DELETE NO ACTION
	  ON UPDATE NO ACTION,
	CONSTRAINT `no_residentes_id`
	  FOREIGN KEY (`no_residentes_id`)
      REFERENCES `entradas_web`.`no_residentes` (`no_residentes_id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
	CONSTRAINT `eventos_id_f`
	  FOREIGN KEY (`eventos_id`)
      REFERENCES `entradas_web`.`eventos` (`eventos_id`)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;