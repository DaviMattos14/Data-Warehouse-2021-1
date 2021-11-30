-- -----------------------------------------------------
-- Table Localidade
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Localidade (
  MUNIC_RESIDENCIA VARCHAR(45) NOT NULL,
  COD_IBGE INT NULL,
  URS VARCHAR(45) NULL,
  MICRO VARCHAR(45) NULL,
  MACRO VARCHAR(45) NULL,
  PRIMARY KEY (MUNIC_RESIDENCIA));


-- -----------------------------------------------------
-- Table tabela_fatos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tabela_fatos (
  idtabela_fatos INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  NUM_CASOS INT NULL,
  NUM_INTERNADOS INT NULL,
  NUM_OBITOS INT NULL,
  NUM_RECUPERADOS INT NULL,
  DATA_ VARCHAR(45) NULL,
  Localidade_MUNIC_RESIDENCIA VARCHAR(45) NOT NULL,
 FOREIGN KEY (Localidade_MUNIC_RESIDENCIA)
    REFERENCES Localidade (MUNIC_RESIDENCIA)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
