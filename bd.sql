-- MySQL Script generated by MySQL Workbench
-- Thu Sep 26 14:53:06 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BASETESTESRV_Murilim_e_Biffe
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BASETESTESRV_Murilim_e_Biffe
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BASETESTESRV_Murilim_e_Biffe` DEFAULT CHARACTER SET utf8 ;
USE `BASETESTESRV_Murilim_e_Biffe` ;

-- -----------------------------------------------------
-- Table `BASETESTESRV_Murilim_e_Biffe`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BASETESTESRV_Murilim_e_Biffe`.`Clientes` (
  `idClientes` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(255) NOT NULL,
  `Numero de telefone` INT NOT NULL,
  `CPF` VARCHAR(14) NOT NULL,
  `Residencia` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idClientes`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `Número de telefone_UNIQUE` (`Numero de telefone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BASETESTESRV_Murilim_e_Biffe`.`Carros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BASETESTESRV_Murilim_e_Biffe`.`Carros` (
  `idcarros` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(255) NOT NULL,
  `placa` VARCHAR(45) NOT NULL,
  `renavan` VARCHAR(11) NOT NULL,
  `porte_do_caro` VARCHAR(255) NOT NULL,
  `modelo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idcarros`),
  UNIQUE INDEX `id_UNIQUE` (`idcarros` ASC) VISIBLE,
  UNIQUE INDEX `placa_UNIQUE` (`placa` ASC) VISIBLE,
  UNIQUE INDEX `renavan_UNIQUE` (`renavan` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BASETESTESRV_Murilim_e_Biffe`.`Vagas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BASETESTESRV_Murilim_e_Biffe`.`Vagas` (
  `idVagas` INT NOT NULL AUTO_INCREMENT,
  `Localizacao` VARCHAR(2) NOT NULL,
  `valor` FLOAT NOT NULL,
  PRIMARY KEY (`idVagas`),
  UNIQUE INDEX `Localização_UNIQUE` (`Localizacao` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BASETESTESRV_Murilim_e_Biffe`.`Estacionamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BASETESTESRV_Murilim_e_Biffe`.`Estacionamento` (
  `idEstacionamento` INT NOT NULL AUTO_INCREMENT,
  `Horario_de_entrada` TIMESTAMP NOT NULL,
  `Horario_de_saida` TIMESTAMP NOT NULL,
  `Pagamento` VARCHAR(3) NOT NULL,
  `Vagas_idVagas` INT NOT NULL,
  `Clientes_idClientes` INT NOT NULL,
  `Carros_idcarros` INT NOT NULL,
  PRIMARY KEY (`idEstacionamento`, `Vagas_idVagas`, `Clientes_idClientes`, `Carros_idcarros`),
  INDEX `fk_Estacionamento_Vagas1_idx` (`Vagas_idVagas` ASC) VISIBLE,
  INDEX `fk_Estacionamento_Clientes1_idx` (`Clientes_idClientes` ASC) VISIBLE,
  INDEX `fk_Estacionamento_Carros1_idx` (`Carros_idcarros` ASC) VISIBLE,
  CONSTRAINT `fk_Estacionamento_Vagas1`
    FOREIGN KEY (`Vagas_idVagas`)
    REFERENCES `BASETESTESRV_Murilim_e_Biffe`.`Vagas` (`idVagas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estacionamento_Clientes1`
    FOREIGN KEY (`Clientes_idClientes`)
    REFERENCES `BASETESTESRV_Murilim_e_Biffe`.`Clientes` (`idClientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estacionamento_Carros1`
    FOREIGN KEY (`Carros_idcarros`)
    REFERENCES `BASETESTESRV_Murilim_e_Biffe`.`Carros` (`idcarros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
