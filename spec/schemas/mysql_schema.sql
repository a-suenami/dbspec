CREATE SCHEMA IF NOT EXISTS `dbspec_schema` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

USE `dbspec_schema` ;

CREATE TABLE IF NOT EXISTS `dbspec_schema`.`table_name` (
  `column_name` INT NULL
) ENGINE = InnoDB;
