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
-- Table `mydb`.`PATIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PATIENT` (
  `PatientID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `DateOfBirth` DATE NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  PRIMARY KEY (`PatientID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DEPARTMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DEPARTMENT` (
  `DepartmentID` INT NOT NULL,
  `DepartmentName` VARCHAR(45) NULL,
  PRIMARY KEY (`DepartmentID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HEALTHCARE_PROVIDER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HEALTHCARE_PROVIDER` (
  `ProviderID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Speciality` VARCHAR(45) NULL,
  `DepartmentID` INT NOT NULL,
  PRIMARY KEY (`ProviderID`),
  INDEX `fk_provider_department_idx` (`DepartmentID` ASC) VISIBLE,
  CONSTRAINT `fk_provider_department`
    FOREIGN KEY (`DepartmentID`)
    REFERENCES `mydb`.`DEPARTMENT` (`DepartmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`APPOINTMENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`APPOINTMENT` (
  `AppointmentID` INT NOT NULL,
  `ProviderID` INT NOT NULL,
  `AppointmentDate` DATETIME NULL,
  `Status` VARCHAR(45) NULL,
  `PatientID` INT NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  INDEX `fk_appointment_patient_idx` (`PatientID` ASC) VISIBLE,
  INDEX `fk_appointment_provider_idx` (`ProviderID` ASC) VISIBLE,
  CONSTRAINT `fk_appointment_patient`
    FOREIGN KEY (`PatientID`)
    REFERENCES `mydb`.`PATIENT` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_appointment_provider`
    FOREIGN KEY (`ProviderID`)
    REFERENCES `mydb`.`HEALTHCARE_PROVIDER` (`ProviderID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
