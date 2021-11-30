
-- -----------------------------------------------------
-- Table `Obitos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Obitos` (
  `id_Obitos` INT NOT NULL,
  `NUM_OBITOS` INT NULL,
  PRIMARY KEY (`id_Obitos`));


-- -----------------------------------------------------
-- Table `Casos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Casos` (
  `idCasos` INT NOT NULL,
  `NUM_CASOS` INT NULL,
  PRIMARY KEY (`idCasos`));


-- -----------------------------------------------------
-- Table `Recuperados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Recuperados` (
  `idRecuperados` INT NOT NULL,
  `NUM_RECUPERADOS` INT NULL,
  PRIMARY KEY (`idRecuperados`));


-- -----------------------------------------------------
-- Table `Internados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Internados` (
  `idInternados` INT NOT NULL,
  `NUM_INTERNADOS` INT NULL,
  PRIMARY KEY (`idInternados`));


-- -----------------------------------------------------
-- Table `Localidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Localidade` (
  `idLocalidade` INT NOT NULL,
  `MUNIC_RESIDENCIA` VARCHAR(45) NULL,
  `COD_IBGE` INT NULL,
  `MICRO` VARCHAR(45) NULL,
  `MACRO` VARCHAR(45) NULL,
  PRIMARY KEY (`idLocalidade`));


-- -----------------------------------------------------
-- Table `tabela_fatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabela_fatos` (
  `idtabela_fatos` INT NOT NULL,
  `DATA` VARCHAR(45) NULL,
  `URS` VARCHAR(45) NULL,
  `Casos_idCasos` INT NOT NULL,
  `Localidade_idLocalidade` INT NOT NULL,
  `Recuperados_idRecuperados` INT NOT NULL,
  `Obitos_id_Obitos` INT NOT NULL,
  `Internados_idInternados` INT NOT NULL,
  PRIMARY KEY (`idtabela_fatos`, `Casos_idCasos`, `Localidade_idLocalidade`, `Recuperados_idRecuperados`, `Obitos_id_Obitos`, `Internados_idInternados`),
  FOREIGN KEY (`Casos_idCasos`)
    REFERENCES `Casos` (`idCasos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`Localidade_idLocalidade`)
    REFERENCES `Localidade` (`idLocalidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`Recuperados_idRecuperados`)
    REFERENCES `Recuperados` (`idRecuperados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`Obitos_id_Obitos`)
    REFERENCES `Obitos` (`id_Obitos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`Internados_idInternados`)
    REFERENCES `Internados` (`idInternados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

