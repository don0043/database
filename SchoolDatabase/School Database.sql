CREATE SCHEMA IF NOT EXISTS `Final` ;
USE `Final` ;


CREATE TABLE IF NOT EXISTS `Final`.`College` (
  `CollegeName` VARCHAR(50) NOT NULL,
  `CollegeTotalStudents` INT NULL,
  PRIMARY KEY (`CollegeName`))
ENGINE = InnoDB;
CREATE UNIQUE INDEX `CollegeName_UNIQUE` ON `Final`.`College` (`CollegeName` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Buildings` (
  `BuildingID` INT NOT NULL,
  `BuildingName` VARCHAR(45) NULL,
  `CollegeName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BuildingID`),
  CONSTRAINT `FK_Buildings_CollegeName`
    FOREIGN KEY (`CollegeName`)
    REFERENCES `Final`.`College` (`CollegeName`)
    )
ENGINE = InnoDB;
CREATE UNIQUE INDEX `BuildingID_UNIQUE` ON `Final`.`Buildings` (`BuildingID` ASC);
CREATE INDEX `CollegeName_idx` ON `Final`.`Buildings` (`CollegeName` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Classrooms` (
  `RoomNumber` INT NOT NULL,
  `HasProjector` VARCHAR(3) NULL,
  `BuildingID` INT NULL,
  PRIMARY KEY (`RoomNumber`),
  CONSTRAINT `FK_Classrooms_BuildingID`
    FOREIGN KEY (`BuildingID`)
    REFERENCES `Final`.`Buildings` (`BuildingID`)
    )
ENGINE = InnoDB;
CREATE UNIQUE INDEX `RoomNumber_UNIQUE` ON `Final`.`Classrooms` (`RoomNumber` ASC);
CREATE INDEX `BuildingID_idx` ON `Final`.`Classrooms` (`BuildingID` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Textbook` (
  `TextbookISBN` INT NOT NULL,
  `TextbookTitle` VARCHAR(45) NULL,
  `TextbookAuthor` VARCHAR(45) NULL,
  PRIMARY KEY (`TextbookISBN`))
ENGINE = InnoDB;
CREATE UNIQUE INDEX `TextbookISBN_UNIQUE` ON `Final`.`Textbook` (`TextbookISBN` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Course` (
  `CourseID` INT NOT NULL,
  `CourseName` VARCHAR(45) NULL,
  `TextbookISBN` INT NULL,
  PRIMARY KEY (`CourseID`),
  CONSTRAINT `FK_Course_TextbookISBN`
    FOREIGN KEY (`TextbookISBN`)
    REFERENCES `Final`.`Textbook` (`TextbookISBN`)
	)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `CourseID_UNIQUE` ON `Final`.`Course` (`CourseID` ASC);
CREATE INDEX `TextbookISBN_idx` ON `Final`.`Course` (`TextbookISBN` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Person` (
  `PersonID` INT NOT NULL,
  `PersonPhoneNumber` VARCHAR(45) NULL,
  `PersonName` VARCHAR(45) NULL,
  PRIMARY KEY (`PersonID`))
ENGINE = InnoDB;
CREATE UNIQUE INDEX `PersonID_UNIQUE` ON `Final`.`Person` (`PersonID` ASC);





CREATE TABLE IF NOT EXISTS `Final`.`Faculty` (
  `FacultyID` INT NOT NULL,
  `FacultyTitle` VARCHAR(45) NULL,
  `FacultySalary` INT NULL,
  `FacultyName` VARCHAR(45) NULL,
  `PersonID` INT NULL,
  PRIMARY KEY (`FacultyID`),
  CONSTRAINT `FK_Faculty_PersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `Final`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `FacultyID_UNIQUE` ON `Final`.`Faculty` (`FacultyID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Faculty` (`PersonID` ASC);




CREATE TABLE IF NOT EXISTS `Final`.`Interns` (
  `InternID` INT NOT NULL,
  `PersonID` INT NULL,
  `InternHourlyWage` INT NULL,
  PRIMARY KEY (`InternID`),
  CONSTRAINT `FK_Interns_PersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `Final`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `Level_UNIQUE` ON `Final`.`Interns` (`InternID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Interns` (`PersonID` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Section` (
  `SectionID` INT NOT NULL,
  `SectionDate` DATE NULL,
  `RoomNumber` INT NULL,
  `CourseID` INT NULL,
  `BuildingID` INT NULL,
  `PersonID` INT NULL,
  PRIMARY KEY (`SectionID`),
  CONSTRAINT `FK_Section_CourseID`
    FOREIGN KEY (`CourseID`)
    REFERENCES `Final`.`Course` (`CourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Section_BuildingID`
    FOREIGN KEY (`BuildingID`)
    REFERENCES `Final`.`Buildings` (`BuildingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Section_PersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `Final`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Section_RoomNumber`
    FOREIGN KEY (`RoomNumber`)
    REFERENCES `Final`.`Classrooms` (`RoomNumber`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `SectionID_UNIQUE` ON `Final`.`Section` (`SectionID` ASC);
CREATE INDEX `RoomNumber_idx` ON `Final`.`Section` (`RoomNumber` ASC);
CREATE INDEX `CourseID_idx` ON `Final`.`Section` (`CourseID` ASC);
CREATE INDEX `BuildingID_idx` ON `Final`.`Section` (`BuildingID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Section` (`PersonID` ASC);



CREATE TABLE IF NOT EXISTS `Final`.`Student` (
  `StudentID` INT NOT NULL,
  `StudentGPA` DOUBLE(10, 2) NULL,
  `StudentName` VARCHAR(45) NULL,
  `PersonID` INT NULL,
  PRIMARY KEY (`StudentID`),
  CONSTRAINT `FK_Student_PersonID`
    FOREIGN KEY (`PersonID`)
    REFERENCES `Final`.`Person` (`PersonID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
CREATE UNIQUE INDEX `StudentID_UNIQUE` ON `Final`.`Student` (`StudentID` ASC);
CREATE INDEX `PersonID_idx` ON `Final`.`Student` (`PersonID` ASC);








