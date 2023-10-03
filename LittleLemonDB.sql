-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema LittleLemon
-- -----------------------------------------------------
-- 		
USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Bookings` (
  `BookingID` INT UNIQUE NOT NULL,
  `Date` DATE NULL,
  `TableNumber` INT NULL,
  `StaffInformation_StaffID` INT UNIQUE NOT NULL,
  PRIMARY KEY (`BookingID`, `StaffInformation_StaffID`));


-- -----------------------------------------------------
-- Table `littlelemondb`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`OrderDeliveryStatus` (
  `OrderDeliveryStatusID` INT UNIQUE NOT NULL,
  `DeliveryDate` DATE NULL,
  `Status` VARCHAR(45) NULL,
  PRIMARY KEY (`OrderDeliveryStatusID`));


-- -----------------------------------------------------
-- Table `littlelemondb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Orders` (
  `OrderID` INT UNIQUE NOT NULL,
  `OrderDate` DATE NULL,
  `Quantity` INT NULL,
  `TotalCost` DECIMAL NULL,
  `Bookings_BookingID` INT UNIQUE NOT NULL,
  `Bookings_StaffInformation_StaffID` INT UNIQUE NOT NULL,
  `OrderDeliveryStatus_OrderDeliveryStatusID` INT UNIQUE NOT NULL,
  PRIMARY KEY (`OrderID`, `Bookings_BookingID`, `Bookings_StaffInformation_StaffID`, `OrderDeliveryStatus_OrderDeliveryStatusID`),
  INDEX `fk_Orders_Bookings1_idx` (`Bookings_BookingID` ASC, `Bookings_StaffInformation_StaffID` ASC) VISIBLE,
  INDEX `fk_Orders_OrderDeliveryStatus1_idx` (`OrderDeliveryStatus_OrderDeliveryStatusID` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Bookings1`
    FOREIGN KEY (`Bookings_BookingID` , `Bookings_StaffInformation_StaffID`)
    REFERENCES `littlelemondb`.`Bookings` (`BookingID` , `StaffInformation_StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_OrderDeliveryStatus1`
    FOREIGN KEY (`OrderDeliveryStatus_OrderDeliveryStatusID`)
    REFERENCES `littlelemondb`.`OrderDeliveryStatus` (`OrderDeliveryStatusID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `littlelemondb`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`Menu` (
  `MenuID` INT UNIQUE NOT NULL,
  `Cuisines` VARCHAR(45) NULL,
  `Starters` VARCHAR(45) NULL,
  `Drinks` VARCHAR(45) NULL,
  `Desserts` VARCHAR(45) NULL,
  `Bookings_BookingID` INT UNIQUE NOT NULL,
  `Bookings_StaffInformation_StaffID` INT UNIQUE NOT NULL,
  PRIMARY KEY (`MenuID`, `Bookings_BookingID`, `Bookings_StaffInformation_StaffID`),
  INDEX `fk_Menu_Bookings1_idx` (`Bookings_BookingID` ASC, `Bookings_StaffInformation_StaffID` ASC) VISIBLE,
  CONSTRAINT `fk_Menu_Bookings1`
    FOREIGN KEY (`Bookings_BookingID` , `Bookings_StaffInformation_StaffID`)
    REFERENCES `littlelemondb`.`Bookings` (`BookingID` , `StaffInformation_StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `littlelemondb`.`CustomerDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`CustomerDetails` (
  `CustomerID` INT UNIQUE NOT NULL,
  `FullName` VARCHAR(255) NULL,
  `ContactNumber` INT NULL,
  `Email` VARCHAR(255) NULL,
  `Bookings_BookingID` INT UNIQUE NOT NULL,
  `Bookings_StaffInformation_StaffID` INT UNIQUE NOT NULL,
  PRIMARY KEY (`CustomerID`, `Bookings_BookingID`, `Bookings_StaffInformation_StaffID`),
  INDEX `fk_CustomerDetails_Bookings1_idx` (`Bookings_BookingID` ASC, `Bookings_StaffInformation_StaffID` ASC) VISIBLE,
  CONSTRAINT `fk_CustomerDetails_Bookings1`
    FOREIGN KEY (`Bookings_BookingID` , `Bookings_StaffInformation_StaffID`)
    REFERENCES `littlelemondb`.`Bookings` (`BookingID` , `StaffInformation_StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `littlelemondb`.`StaffInformation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`StaffInformation` (
  `StaffID` INT UNIQUE NOT NULL,
  `FullName` VARCHAR(255) NULL,
  `Role` VARCHAR(255) NULL,
  `Salary` DECIMAL NULL,
  `Bookings_BookingID` INT UNIQUE NOT NULL,
  `Bookings_StaffInformation_StaffID` INT UNIQUE NOT NULL,
  PRIMARY KEY (`StaffID`, `Bookings_BookingID`, `Bookings_StaffInformation_StaffID`),
  INDEX `fk_StaffInformation_Bookings1_idx` (`Bookings_BookingID` ASC, `Bookings_StaffInformation_StaffID` ASC) VISIBLE,
  CONSTRAINT `fk_StaffInformation_Bookings1`
    FOREIGN KEY (`Bookings_BookingID` , `Bookings_StaffInformation_StaffID`)
    REFERENCES `littlelemondb`.`Bookings` (`BookingID` , `StaffInformation_StaffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
