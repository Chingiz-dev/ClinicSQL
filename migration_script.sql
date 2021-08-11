-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: Clinic2
-- Source Schemata: Clinic2
-- Created: Wed Aug 11 13:53:53 2021
-- Workbench Version: 8.0.20
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema Clinic2
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `Clinic2` ;
CREATE SCHEMA IF NOT EXISTS `Clinic2` ;

-- ----------------------------------------------------------------------------
-- Table Clinic2.TreatmentHistory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`TreatmentHistory` (
  `TreatmentHistoryId` BIGINT NOT NULL,
  `ClientApplyId` BIGINT NOT NULL,
  `EmployeeId` BIGINT NOT NULL,
  `ServiceId` INT NOT NULL,
  `StatusId` INT NOT NULL,
  `DischargeDate` DATE NULL,
  `CommentId` INT NOT NULL,
  PRIMARY KEY (`TreatmentHistoryId`),
  CONSTRAINT `FK_TreatmentHistory_ClientApply`
    FOREIGN KEY (`ClientApplyId`)
    REFERENCES `Clinic2`.`ClientApply` (`ClientApplyId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TreatmentHistory_Statuses`
    FOREIGN KEY (`StatusId`)
    REFERENCES `Clinic2`.`Statuses` (`StatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TreatmentHistory_Employees`
    FOREIGN KEY (`EmployeeId`)
    REFERENCES `Clinic2`.`Employees` (`EmployeeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TreatmentHistory_Services`
    FOREIGN KEY (`ServiceId`)
    REFERENCES `Clinic2`.`Services` (`ServiceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_TreatmentHistory_Comments`
    FOREIGN KEY (`CommentId`)
    REFERENCES `Clinic2`.`Comments` (`CommentId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table Clinic2.Genders
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`Genders` (
  `GenderId` INT NOT NULL,
  `Gender` LONGTEXT NOT NULL,
  PRIMARY KEY (`GenderId`));

-- ----------------------------------------------------------------------------
-- Table Clinic2.Services
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`Services` (
  `ServiceId` INT NOT NULL,
  `ServiceTypeId` INT NOT NULL,
  `ServiceNameId` INT NOT NULL,
  `PriceId` INT NOT NULL,
  PRIMARY KEY (`ServiceId`),
  CONSTRAINT `FK_Services_ServiceTypes`
    FOREIGN KEY (`ServiceTypeId`)
    REFERENCES `Clinic2`.`ServiceTypes` (`ServiceTypeId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Services_ServiceNames`
    FOREIGN KEY (`ServiceTypeId`)
    REFERENCES `Clinic2`.`ServiceNames` (`ServiceNameId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Services_Prices`
    FOREIGN KEY (`PriceId`)
    REFERENCES `Clinic2`.`Prices` (`PriceId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table Clinic2.sysdiagrams
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`sysdiagrams` (
  `name` VARCHAR(160) NOT NULL,
  `principal_id` INT NOT NULL,
  `diagram_id` INT NOT NULL,
  `version` INT NULL,
  `definition` LONGBLOB NULL,
  PRIMARY KEY (`diagram_id`),
  UNIQUE INDEX `UK_principal_name` (`principal_id` ASC, `name` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table Clinic2.Comments
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`Comments` (
  `CommentId` INT NOT NULL,
  `CommentData` DATE NOT NULL,
  `CommentText` LONGTEXT NOT NULL,
  PRIMARY KEY (`CommentId`));

-- ----------------------------------------------------------------------------
-- Table Clinic2.Clients
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`Clients` (
  `ClientId` BIGINT NOT NULL,
  `Name` LONGTEXT NOT NULL,
  `Surname` LONGTEXT NOT NULL,
  `Lastname` LONGTEXT NULL,
  `Fin` VARCHAR(20) CHARACTER SET 'utf8mb4' NOT NULL,
  `Number` BIGINT NOT NULL,
  `GenderId` INT NOT NULL,
  `Email` VARCHAR(50) CHARACTER SET 'utf8mb4' NULL,
  `Birthday` DATE NOT NULL,
  PRIMARY KEY (`ClientId`),
  CONSTRAINT `FK_Clients_Genders`
    FOREIGN KEY (`GenderId`)
    REFERENCES `Clinic2`.`Genders` (`GenderId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table Clinic2.Departments
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`Departments` (
  `DepartmentId` INT NOT NULL,
  `DepartmentText` LONGTEXT NOT NULL,
  PRIMARY KEY (`DepartmentId`));

-- ----------------------------------------------------------------------------
-- Table Clinic2.Specializations
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`Specializations` (
  `SpecializationId` INT NOT NULL,
  `Specialization` LONGTEXT NOT NULL,
  PRIMARY KEY (`SpecializationId`));

-- ----------------------------------------------------------------------------
-- Table Clinic2.Statuses
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`Statuses` (
  `StatusId` INT NOT NULL,
  `StatusText` LONGTEXT NOT NULL,
  PRIMARY KEY (`StatusId`));

-- ----------------------------------------------------------------------------
-- Table Clinic2.ServiceNames
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`ServiceNames` (
  `ServiceNameId` INT NOT NULL,
  `NamesText` LONGTEXT NOT NULL,
  PRIMARY KEY (`ServiceNameId`));

-- ----------------------------------------------------------------------------
-- Table Clinic2.ServiceTypes
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`ServiceTypes` (
  `ServiceTypeId` INT NOT NULL,
  `TypeText` LONGTEXT NOT NULL,
  PRIMARY KEY (`ServiceTypeId`));

-- ----------------------------------------------------------------------------
-- Table Clinic2.Prices
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`Prices` (
  `PriceId` INT NOT NULL,
  `Value` DECIMAL(19,4) NOT NULL,
  PRIMARY KEY (`PriceId`));

-- ----------------------------------------------------------------------------
-- Table Clinic2.ClientApply
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`ClientApply` (
  `ClientApplyId` BIGINT NOT NULL,
  `ClientId` BIGINT NOT NULL,
  `ApplyDate` DATE NOT NULL,
  `Symptoms` LONGTEXT NOT NULL,
  PRIMARY KEY (`ClientApplyId`),
  CONSTRAINT `FK_ClientApply_Clients`
    FOREIGN KEY (`ClientId`)
    REFERENCES `Clinic2`.`Clients` (`ClientId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- ----------------------------------------------------------------------------
-- Table Clinic2.Employees
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `Clinic2`.`Employees` (
  `EmployeeId` BIGINT NOT NULL,
  `Name` LONGTEXT NOT NULL,
  `Surname` LONGTEXT NOT NULL,
  `Lastname` LONGTEXT NULL,
  `Fin` VARCHAR(20) CHARACTER SET 'utf8mb4' NOT NULL,
  `Birthday` DATE NOT NULL,
  `GenderId` INT NOT NULL,
  `Email` VARCHAR(25) CHARACTER SET 'utf8mb4' NOT NULL,
  `DepartmentId` INT NOT NULL,
  `Number` BIGINT NOT NULL,
  `SpecializationId` INT NOT NULL,
  PRIMARY KEY (`EmployeeId`),
  CONSTRAINT `FK_Employees_Genders`
    FOREIGN KEY (`GenderId`)
    REFERENCES `Clinic2`.`Genders` (`GenderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Employees_Departments`
    FOREIGN KEY (`DepartmentId`)
    REFERENCES `Clinic2`.`Departments` (`DepartmentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Employees_Specializations`
    FOREIGN KEY (`SpecializationId`)
    REFERENCES `Clinic2`.`Specializations` (`SpecializationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
SET FOREIGN_KEY_CHECKS = 1;
