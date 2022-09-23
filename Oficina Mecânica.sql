-- MySQL Workbench Forward Engineering

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
-- Table `mydb`.`Peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Peças` (
  `idPeças` INT NOT NULL,
  `Preço Peça` VARCHAR(45) NULL,
  PRIMARY KEY (`idPeças`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipe de Mecânicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Equipe de Mecânicos` (
  `idEquipe de Mecânico` INT NOT NULL,
  PRIMARY KEY (`idEquipe de Mecânico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Serviço` (
  `idServiço` INT NOT NULL,
  `Peças_idPeças` INT NOT NULL,
  `Equipe de Mecânicos_idEquipe de Mecânico` INT NOT NULL,
  PRIMARY KEY (`idServiço`, `Peças_idPeças`, `Equipe de Mecânicos_idEquipe de Mecânico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ordem de Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ordem de Serviço` (
  `idOrdem de Serviço` INT NOT NULL,
  `Numero` VARCHAR(45) NULL,
  `Data de Emissão` DATE NULL,
  `Valor` VARCHAR(45) NULL,
  `Serviço_idServiço` INT NOT NULL,
  `Serviço_Peças_idPeças` INT NOT NULL,
  `Serviço_Equipe de Mecânicos_idEquipe de Mecânico` INT NOT NULL,
  `Peças_idPeças` INT NOT NULL,
  PRIMARY KEY (`idOrdem de Serviço`, `Serviço_idServiço`, `Serviço_Peças_idPeças`, `Serviço_Equipe de Mecânicos_idEquipe de Mecânico`, `Peças_idPeças`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mecânico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mecânico` (
  `idMecânico` INT NOT NULL,
  `Código` VARCHAR(45) NULL,
  `Nome` VARCHAR(45) NULL,
  `Endereço` VARCHAR(45) NULL,
  `Especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idMecânico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Veículo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Veículo` (
  `idVeículo` INT NOT NULL,
  `Serviço_idServiço` INT NOT NULL,
  `Equipe de Mecânicos_idEquipe de Mecânico` INT NOT NULL,
  PRIMARY KEY (`idVeículo`, `Serviço_idServiço`, `Equipe de Mecânicos_idEquipe de Mecânico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Escala para Equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Escala para Equipe` (
  `Mecânico_idMecânico` INT NOT NULL,
  `Equipe de Mecânicos_idEquipe de Mecânico` INT NOT NULL,
  PRIMARY KEY (`Mecânico_idMecânico`, `Equipe de Mecânicos_idEquipe de Mecânico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Valor da Ordem de Serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Valor da Ordem de Serviço` (
  `Ordem de Serviço_idOrdem de Serviço` INT NOT NULL,
  `Ordem de Serviço_Serviço_idServiço` INT NOT NULL,
  `Ordem de Serviço_Serviço_Peças_idPeças` INT NOT NULL,
  `Ordem de Serviço_Serviço_Equipe de Mecânicos_idEquipe de Mecânico` INT NOT NULL,
  `Ordem de Serviço_Peças_idPeças` INT NOT NULL,
  `Serviço_idServiço` INT NOT NULL,
  `Serviço_Peças_idPeças` INT NOT NULL,
  `Serviço_Equipe de Mecânicos_idEquipe de Mecânico` INT NOT NULL,
  PRIMARY KEY (`Ordem de Serviço_idOrdem de Serviço`, `Ordem de Serviço_Serviço_idServiço`, `Ordem de Serviço_Serviço_Peças_idPeças`, `Ordem de Serviço_Serviço_Equipe de Mecânicos_idEquipe de Mecânico`, `Ordem de Serviço_Peças_idPeças`, `Serviço_idServiço`, `Serviço_Peças_idPeças`, `Serviço_Equipe de Mecânicos_idEquipe de Mecânico`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
