-- -----------------------------------------------------
-- Table `instituicao`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `instituicao` (
  `CO_IES` INT NOT NULL,
  `CO_CATEGAD` INT NULL,
  `CO_ORGACAD` INT NULL,
  `CO_CURSO` INT NULL,
  PRIMARY KEY (`CO_IES`));


-- -----------------------------------------------------
-- Table `info_estudante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `info_estudante` (
  `CPF` INT NOT NULL,
  `NU_IDADE` INT NULL,
  `TP_SEXO` VARCHAR(45) NULL,
  `ANO_IN_GRAD` INT NULL,
  `ANO_FIM_EM` INT NULL,
  `CO_TURNO_GRADUCAO` INT NULL,
  `TP_INSCRICAO_ADM` INT NULL,
  `TP_INSCRICAO` INT NULL,
  PRIMARY KEY (`CPF`));


-- -----------------------------------------------------
-- Table `localidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `localidade` (
  `CO_MUNIC_CURSO` INT NOT NULL,
  `CO_UF_CURSO` INT NULL,
  `CO_REGIÃO_CURSO` INT NULL,
  `nome_munic` VARCHAR(45) NULL,
  `UF_munic` VARCHAR(45) NULL,
  PRIMARY KEY (`CO_MUNIC_CURSO`));


-- -----------------------------------------------------
-- Table `curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `curso` (
  `CO_CURSO` INT NOT NULL,
  `CO_GRUPO` INT NULL,
  `CO_MODALIDADE` INT NULL,
  PRIMARY KEY (`CO_CURSO`));


-- -----------------------------------------------------
-- Table `tipo_presenca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tipo_presenca` (
  `TP_PRES` INT NULL,
  `TP_PR_GER` INT NULL,
  `TP_PR_OB_FG` INT NULL,
  `TP_PR_DI_FG` INT NULL,
  `TP_PR_OB_CE` INT NULL,
  `TP_PR_DI_CE` INT NULL,
  PRIMARY KEY (`TP_PRES`));


-- -----------------------------------------------------
-- Table `avaliacão_FG`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avaliacão_FG` (
  `id_av_fg` INT NOT NULL,
  `NU_ITEM_OFG` INT NULL,
  `NU_ITEM_OFG_Z` INT NULL,
  `NU_ITEM_OFG_X` INT NULL,
  `NU_ITEM_OFG_N` INT NULL,
  `DS_VT_GAB_OFG_ORIG` VARCHAR(45) NULL,
  `DS_VT_GAB_OFG_FIN` VARCHAR(45) NULL,
  `DS_VT_ESC_OFG` VARCHAR(45) NULL,
  `DS_VT_ACE_OFG` VARCHAR(45) NULL,
  PRIMARY KEY (`id_av_fg`));


-- -----------------------------------------------------
-- Table `avaliacao_CE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `avaliacao_CE` (
  `id_av_ce` INT NOT NULL,
  `NU_ITEM_OCE` INT NULL,
  `NU_ITEM_OCE_Z` INT NULL,
  `NU_ITEM_OCE_X` INT NULL,
  `NU_ITEM_OCE_N` INT NULL,
  `DS_VT_GAB_OCE_ORIG` VARCHAR(45) NULL,
  `DS_VT_GAB_OCE_FIN` VARCHAR(45) NULL,
  `DS_VT_ESC_OCE` VARCHAR(45) NULL,
  `DS_VT_ACE_OCE` VARCHAR(45) NULL,
  PRIMARY KEY (`id_av_ce`));


-- -----------------------------------------------------
-- Table `questionarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `questionarios` (
  `id_questionario` INT NOT NULL,
  `percepcao_prova` VARCHAR(45) NULL,
  `estudante` VARCHAR(45) NULL,
  `grau_concordancia` VARCHAR(45) NULL,
  `estudante_licienciatura` VARCHAR(45) NULL,
  PRIMARY KEY (`id_questionario`));


-- -----------------------------------------------------
-- Table `notas_fg`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_fg` (
  `NT_FG` INT NOT NULL,
  `NT_OBJ_FG` INT NULL,
  `NT_DIS_FG` INT NULL,
  `NT_FG_D1` INT NULL,
  `NT_FG_D1_PT` INT NULL,
  `NT_FG_D1_CT` INT NULL,
  `NT_FG_D2` INT NULL,
  `NT_FG_D2_PT` INT NULL,
  `NT_FG_D2_CT` INT NULL,
  PRIMARY KEY (`NT_FG`));


-- -----------------------------------------------------
-- Table `notas_CE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_CE` (
  `NT_CE` INT NOT NULL,
  `NT_OBJ_CE` INT NULL,
  `NT_DIS_CE` INT NULL,
  `NT_CE_D1` INT NULL,
  `NT_CE_D2` INT NULL,
  `NT_CE_D3` INT NULL,
  PRIMARY KEY (`NT_CE`));


-- -----------------------------------------------------
-- Table `tabela_fatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tabela_fatos` (
  `NU_ANO` INT NOT NULL,
  `NOTA_GERAL` INT NULL,
  `info_estudante_CPF` INT NOT NULL,
  `instituicao_CO_IES` INT NOT NULL,
  `curso_CO_CURSO` INT NOT NULL,
  `localidade_CO_MUNIC_CURSO` INT NOT NULL,
  `tipo_presenca_TP_PRES` INT NOT NULL,
  `avaliacao_CE_id_av_ce` INT NOT NULL,
  `avaliacão_FG_id_av_fg` INT NOT NULL,
  `notas_fg_NT_FG` INT NOT NULL,
  `notas_CE_NT_CE` INT NOT NULL,
  `questionarios_id_questionario` INT NOT NULL,
  PRIMARY KEY (`NU_ANO`, `info_estudante_CPF`, `instituicao_CO_IES`, `curso_CO_CURSO`, `localidade_CO_MUNIC_CURSO`, `tipo_presenca_TP_PRES`, `avaliacao_CE_id_av_ce`, `avaliacão_FG_id_av_fg`, `notas_fg_NT_FG`, `notas_CE_NT_CE`, `questionarios_id_questionario`),
  FOREIGN KEY (`info_estudante_CPF`)
    REFERENCES `info_estudante` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`instituicao_CO_IES`)
    REFERENCES `instituicao` (`CO_IES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`curso_CO_CURSO`)
    REFERENCES `curso` (`CO_CURSO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`localidade_CO_MUNIC_CURSO`)
    REFERENCES `localidade` (`CO_MUNIC_CURSO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`tipo_presenca_TP_PRES`)
    REFERENCES `tipo_presenca` (`TP_PRES`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`avaliacao_CE_id_av_ce`)
    REFERENCES `avaliacao_CE` (`id_av_ce`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`avaliacão_FG_id_av_fg`)
    REFERENCES `avaliacão_FG` (`id_av_fg`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`notas_fg_NT_FG`)
    REFERENCES `notas_fg` (`NT_FG`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`notas_CE_NT_CE`)
    REFERENCES `notas_CE` (`NT_CE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  FOREIGN KEY (`questionarios_id_questionario`)
    REFERENCES `questionarios` (`id_questionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);