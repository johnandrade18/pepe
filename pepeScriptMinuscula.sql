SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `pepe_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `pepe_db` ;

-- -----------------------------------------------------
-- Table `pepe_db`.`caracterizacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`caracterizacion` (
  `id_caracterizacion` INT NOT NULL AUTO_INCREMENT ,
  `acudiente` VARCHAR(45) NOT NULL ,
  `telefono` VARCHAR(45) NOT NULL ,
  `direccion` VARCHAR(45) NOT NULL ,
  `sistema_lidereazgo` VARCHAR(45) NOT NULL ,
  `apoyo_bienestar` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_caracterizacion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`estilo_aprendizaje`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`estilo_aprendizaje` (
  `id_estilo_aprendizaje` INT NOT NULL AUTO_INCREMENT ,
  `estilo_aprendizaje` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_estilo_aprendizaje`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`empresa`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`empresa` (
  `id_empresa` INT NOT NULL AUTO_INCREMENT ,
  `nombre_empresa` VARCHAR(45) NOT NULL ,
  `representante` VARCHAR(45) NOT NULL ,
  `telefono` VARCHAR(45) NOT NULL ,
  `Correo` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_empresa`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`patrocinio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`patrocinio` (
  `id_patrocinio` INT NOT NULL AUTO_INCREMENT ,
  `id_empresa` INT NOT NULL ,
  `patrocinio` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_patrocinio`) ,
  INDEX `fk_Patrocinio_Empresa1_idx` (`id_empresa` ASC) ,
  CONSTRAINT `fk_Patrocinio_Empresa1`
    FOREIGN KEY (`id_empresa` )
    REFERENCES `pepe_db`.`empresa` (`id_empresa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`estado`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`estado` (
  `id_estado` INT NOT NULL AUTO_INCREMENT ,
  `estado` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_estado`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`motivo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`motivo` (
  `id_motivo` INT NOT NULL AUTO_INCREMENT ,
  `motivo` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_motivo`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`desercion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`desercion` (
  `id_desercion` INT NOT NULL AUTO_INCREMENT ,
  `id_estado` INT NOT NULL ,
  `id_motivo` INT NOT NULL ,
  `desercion` VARCHAR(45) NOT NULL ,
  `fecha` DATE NOT NULL ,
  PRIMARY KEY (`id_desercion`) ,
  INDEX `fk_Desercion_Estado1_idx` (`id_estado` ASC) ,
  INDEX `fk_Desercion_Motivo1_idx` (`id_motivo` ASC) ,
  CONSTRAINT `fk_Desercion_Estado1`
    FOREIGN KEY (`id_estado` )
    REFERENCES `pepe_db`.`estado` (`id_estado` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Desercion_Motivo1`
    FOREIGN KEY (`id_motivo` )
    REFERENCES `pepe_db`.`motivo` (`id_motivo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`tipo_vocero`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`tipo_vocero` (
  `id_tipo_vocero` INT NOT NULL ,
  `nombre_tipo_vocero` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipo_vocero`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`tipo_documento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`tipo_documento` (
  `id_tipo_documento` INT NOT NULL AUTO_INCREMENT ,
  `nombre_tipo_documento` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipo_documento`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`genero`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`genero` (
  `id_genero` INT NOT NULL AUTO_INCREMENT ,
  `nombre_genero` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`id_genero`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`tipo_sangre`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`tipo_sangre` (
  `id_tipo_sangre` INT NOT NULL AUTO_INCREMENT ,
  `nombre_tipo_sangre` VARCHAR(5) NOT NULL ,
  PRIMARY KEY (`id_tipo_sangre`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`libreta_militar`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`libreta_militar` (
  `id_libreta_militar` INT NOT NULL AUTO_INCREMENT ,
  `nombre_libreta_militar` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_libreta_militar`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`eps`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`eps` (
  `id_eps` INT NOT NULL AUTO_INCREMENT ,
  `nombre_eps` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_eps`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`especialidad`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`especialidad` (
  `id_especialidad` INT NOT NULL AUTO_INCREMENT ,
  `nombre_especialidad` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_especialidad`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT ,
  `id_caracterizacion` INT NULL ,
  `id_estilo_aprendizaje` INT NULL ,
  `id_patrocinio` INT NULL ,
  `id_desercion` INT NULL ,
  `numero_documento` VARCHAR(15) NOT NULL ,
  `nombre_1` VARCHAR(45) NOT NULL ,
  `nombre_2` VARCHAR(45) NULL ,
  `apellido_1` VARCHAR(45) NOT NULL ,
  `apellido_2` VARCHAR(45) NULL ,
  `telefono` VARCHAR(45) NOT NULL ,
  `correo_1` VARCHAR(45) NOT NULL ,
  `correo_2` VARCHAR(45) NULL ,
  `direccion` VARCHAR(45) NOT NULL ,
  `estado` TINYINT(1) NOT NULL ,
  `id_tipo_vocero` INT NULL ,
  `password` VARCHAR(65) NOT NULL ,
  `id_tipo_documento` INT NOT NULL ,
  `id_genero` INT NOT NULL ,
  `id_tipo_sangre` INT NOT NULL ,
  `id_libreta_militar` INT NULL ,
  `id_eps` INT NOT NULL ,
  `fecha_expedicion` DATE NOT NULL ,
  `telefono_2` VARCHAR(10) NULL ,
  `telefono_3` VARCHAR(10) NULL ,
  `id_especialidad` INT NOT NULL ,
  PRIMARY KEY (`id_usuario`) ,
  INDEX `fk_Usuario_Caracterizacion1_idx` (`id_caracterizacion` ASC) ,
  INDEX `fk_Usuario_Estilo_Aprendizaje1_idx` (`id_estilo_aprendizaje` ASC) ,
  INDEX `fk_Usuario_Patrocinio1_idx` (`id_patrocinio` ASC) ,
  INDEX `fk_Usuario_Desercion1_idx` (`id_desercion` ASC) ,
  INDEX `fk_Usuario_Tipo_Vocero1_idx` (`id_tipo_vocero` ASC) ,
  INDEX `fk_Usuario_Tipo_Documento1_idx` (`id_tipo_documento` ASC) ,
  INDEX `fk_Usuario_Genero1_idx` (`id_genero` ASC) ,
  INDEX `fk_Usuario_Tipo_Sangre1_idx` (`id_tipo_sangre` ASC) ,
  INDEX `fk_Usuario_Libreta_Militar1_idx` (`id_libreta_militar` ASC) ,
  INDEX `fk_Usuario_EPS1_idx` (`id_eps` ASC) ,
  INDEX `fk_usuario_especialidad1_idx` (`id_especialidad` ASC) ,
  CONSTRAINT `fk_Usuario_Caracterizacion1`
    FOREIGN KEY (`id_caracterizacion` )
    REFERENCES `pepe_db`.`caracterizacion` (`id_caracterizacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Estilo_Aprendizaje1`
    FOREIGN KEY (`id_estilo_aprendizaje` )
    REFERENCES `pepe_db`.`estilo_aprendizaje` (`id_estilo_aprendizaje` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Patrocinio1`
    FOREIGN KEY (`id_patrocinio` )
    REFERENCES `pepe_db`.`patrocinio` (`id_patrocinio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Desercion1`
    FOREIGN KEY (`id_desercion` )
    REFERENCES `pepe_db`.`desercion` (`id_desercion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Tipo_Vocero1`
    FOREIGN KEY (`id_tipo_vocero` )
    REFERENCES `pepe_db`.`tipo_vocero` (`id_tipo_vocero` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Tipo_Documento1`
    FOREIGN KEY (`id_tipo_documento` )
    REFERENCES `pepe_db`.`tipo_documento` (`id_tipo_documento` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Genero1`
    FOREIGN KEY (`id_genero` )
    REFERENCES `pepe_db`.`genero` (`id_genero` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Tipo_Sangre1`
    FOREIGN KEY (`id_tipo_sangre` )
    REFERENCES `pepe_db`.`tipo_sangre` (`id_tipo_sangre` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Libreta_Militar1`
    FOREIGN KEY (`id_libreta_militar` )
    REFERENCES `pepe_db`.`libreta_militar` (`id_libreta_militar` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_EPS1`
    FOREIGN KEY (`id_eps` )
    REFERENCES `pepe_db`.`eps` (`id_eps` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_especialidad1`
    FOREIGN KEY (`id_especialidad` )
    REFERENCES `pepe_db`.`especialidad` (`id_especialidad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`rol`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`rol` (
  `id_rol` INT NOT NULL AUTO_INCREMENT ,
  `nombre_rol` VARCHAR(45) NOT NULL ,
  `codigo_rol` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_rol`) ,
  UNIQUE INDEX `Codigo_Rol_UNIQUE` (`codigo_rol` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`rol_has_usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`rol_has_usuario` (
  `id_rol` INT NOT NULL ,
  `id_usuario` INT NOT NULL ,
  PRIMARY KEY (`id_rol`, `id_usuario`) ,
  INDEX `fk_Rol_has_Usuario_Usuario1_idx` (`id_usuario` ASC) ,
  INDEX `fk_Rol_has_Usuario_Rol_idx` (`id_rol` ASC) ,
  CONSTRAINT `fk_Rol_has_Usuario_Rol`
    FOREIGN KEY (`id_rol` )
    REFERENCES `pepe_db`.`rol` (`id_rol` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Rol_has_Usuario_Usuario1`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `pepe_db`.`usuario` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`red_tecnologica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`red_tecnologica` (
  `id_red_tecnologica` INT NOT NULL AUTO_INCREMENT ,
  `nombre_red_tecnologica` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_red_tecnologica`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`linea_tecnologica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`linea_tecnologica` (
  `id_linea_tecnologica` INT NOT NULL AUTO_INCREMENT ,
  `id_red_tecnologica` INT NOT NULL ,
  `nombre_linea_tecnologica` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_linea_tecnologica`) ,
  INDEX `fk_Linea_Tecnologica_Red_Tecnologica1_idx` (`id_red_tecnologica` ASC) ,
  CONSTRAINT `fk_Linea_Tecnologica_Red_Tecnologica1`
    FOREIGN KEY (`id_red_tecnologica` )
    REFERENCES `pepe_db`.`red_tecnologica` (`id_red_tecnologica` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`perfil_entrada`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`perfil_entrada` (
  `id_perfil_entrada` INT NOT NULL AUTO_INCREMENT ,
  `nombre_perfil_entrada` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_perfil_entrada`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`modalidad_formacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`modalidad_formacion` (
  `id_modalidad_formacion` INT NOT NULL AUTO_INCREMENT ,
  `modalidad_formacion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_modalidad_formacion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`nivel_formacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`nivel_formacion` (
  `id_nivel_formacion` INT NOT NULL AUTO_INCREMENT ,
  `nivel_formacion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_nivel_formacion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`tipo_formacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`tipo_formacion` (
  `id_tipo_formacion` INT NOT NULL AUTO_INCREMENT ,
  `tipo_formacion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipo_formacion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`programa`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`programa` (
  `codigo` VARCHAR(6) NOT NULL ,
  `version` VARCHAR(4) NOT NULL ,
  `id_linea_tecnologica` INT NOT NULL ,
  `id_perfil_entrada` INT NOT NULL ,
  `nombre_programa` TEXT NOT NULL ,
  `duracion_trimestres` SMALLINT NOT NULL ,
  `estado` TINYINT NOT NULL ,
  `justificacion` LONGTEXT NOT NULL ,
  `id_modalidad_formacion` INT NOT NULL ,
  `id_nivel_formacion` INT NOT NULL ,
  `id_tipo_formacion` INT NOT NULL ,
  PRIMARY KEY (`codigo`, `version`) ,
  INDEX `fk_Programa_Linea_Tecnologica1_idx` (`id_linea_tecnologica` ASC) ,
  INDEX `fk_Programa_Perfil_Entrada1_idx` (`id_perfil_entrada` ASC) ,
  INDEX `fk_Programa_Modalidad_Formacion1_idx` (`id_modalidad_formacion` ASC) ,
  INDEX `fk_Programa_Nivel_Formacion1_idx` (`id_nivel_formacion` ASC) ,
  INDEX `fk_Programa_Tipo_Formacion1_idx` (`id_tipo_formacion` ASC) ,
  CONSTRAINT `fk_Programa_Linea_Tecnologica1`
    FOREIGN KEY (`id_linea_tecnologica` )
    REFERENCES `pepe_db`.`linea_tecnologica` (`id_linea_tecnologica` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Programa_Perfil_Entrada1`
    FOREIGN KEY (`id_perfil_entrada` )
    REFERENCES `pepe_db`.`perfil_entrada` (`id_perfil_entrada` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Programa_Modalidad_Formacion1`
    FOREIGN KEY (`id_modalidad_formacion` )
    REFERENCES `pepe_db`.`modalidad_formacion` (`id_modalidad_formacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Programa_Nivel_Formacion1`
    FOREIGN KEY (`id_nivel_formacion` )
    REFERENCES `pepe_db`.`nivel_formacion` (`id_nivel_formacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Programa_Tipo_Formacion1`
    FOREIGN KEY (`id_tipo_formacion` )
    REFERENCES `pepe_db`.`tipo_formacion` (`id_tipo_formacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`competencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`competencia` (
  `id_competencia` INT NOT NULL AUTO_INCREMENT ,
  `nombre_competencia` LONGTEXT NOT NULL ,
  `estado` TINYINT NOT NULL ,
  `codigo` VARCHAR(9) NOT NULL ,
  `duracion_estimada_horas` INT NOT NULL ,
  `programa_codigo` VARCHAR(6) NOT NULL ,
  `programa_version` VARCHAR(4) NOT NULL ,
  PRIMARY KEY (`id_competencia`) ,
  UNIQUE INDEX `Codigo_UNIQUE` (`codigo` ASC) ,
  INDEX `fk_Competencia_Programa1_idx` (`programa_codigo` ASC, `programa_version` ASC) ,
  CONSTRAINT `fk_Competencia_Programa1`
    FOREIGN KEY (`programa_codigo` , `programa_version` )
    REFERENCES `pepe_db`.`programa` (`codigo` , `version` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`tipo_resultado_aprendizaje`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`tipo_resultado_aprendizaje` (
  `id_tipo_resultado_aprendizaje` INT NOT NULL AUTO_INCREMENT ,
  `tipo_resultado_aprendizaje` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipo_resultado_aprendizaje`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`resultado_aprendizaje`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`resultado_aprendizaje` (
  `id_resultado_aprendizaje` INT NOT NULL AUTO_INCREMENT ,
  `id_tipo_resultado_aprendizaje` INT NOT NULL ,
  `id_competencia` INT NOT NULL ,
  `nombre_resultado_aprendizaje` LONGTEXT NOT NULL ,
  `estado` TINYINT NOT NULL ,
  PRIMARY KEY (`id_resultado_aprendizaje`) ,
  INDEX `fk_Resultado_Aprendizaje_Tipo_Resultado_Aprendizaje1_idx` (`id_tipo_resultado_aprendizaje` ASC) ,
  INDEX `fk_Resultado_Aprendizaje_Competencia1_idx` (`id_competencia` ASC) ,
  CONSTRAINT `fk_Resultado_Aprendizaje_Tipo_Resultado_Aprendizaje1`
    FOREIGN KEY (`id_tipo_resultado_aprendizaje` )
    REFERENCES `pepe_db`.`tipo_resultado_aprendizaje` (`id_tipo_resultado_aprendizaje` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Resultado_Aprendizaje_Competencia1`
    FOREIGN KEY (`id_competencia` )
    REFERENCES `pepe_db`.`competencia` (`id_competencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`conocimiento_concepto_principios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`conocimiento_concepto_principios` (
  `id_conocimiento_concepto_principios` INT NOT NULL AUTO_INCREMENT ,
  `nombre_conocimiento_concepto_principiosl` LONGTEXT NOT NULL ,
  `estado` TINYINT NOT NULL ,
  `id_competencia` INT NOT NULL ,
  PRIMARY KEY (`id_conocimiento_concepto_principios`) ,
  INDEX `fk_Conocimiento_Concepto_Principios_Competencia1_idx` (`id_competencia` ASC) ,
  CONSTRAINT `fk_Conocimiento_Concepto_Principios_Competencia1`
    FOREIGN KEY (`id_competencia` )
    REFERENCES `pepe_db`.`competencia` (`id_competencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`conocimiento_proceso`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`conocimiento_proceso` (
  `id_conocimiento_proceso` INT NOT NULL AUTO_INCREMENT ,
  `nombre_conocimiento_proceso` LONGTEXT NOT NULL ,
  `estado` TINYINT NOT NULL ,
  `id_competencia` INT NOT NULL ,
  PRIMARY KEY (`id_conocimiento_proceso`) ,
  INDEX `fk_Conocimiento_Proceso_Competencia1_idx` (`id_competencia` ASC) ,
  CONSTRAINT `fk_Conocimiento_Proceso_Competencia1`
    FOREIGN KEY (`id_competencia` )
    REFERENCES `pepe_db`.`competencia` (`id_competencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`criterios_evaluacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`criterios_evaluacion` (
  `id_criterios_evaluacion` INT NOT NULL AUTO_INCREMENT ,
  `nombre_criterios_evaluacion` LONGTEXT NOT NULL ,
  `estado` LONGTEXT NOT NULL ,
  `id_competencia` INT NOT NULL ,
  PRIMARY KEY (`id_criterios_evaluacion`) ,
  INDEX `fk_Criterios_Evaluacion_Competencia1_idx` (`id_competencia` ASC) ,
  CONSTRAINT `fk_Criterios_Evaluacion_Competencia1`
    FOREIGN KEY (`id_competencia` )
    REFERENCES `pepe_db`.`competencia` (`id_competencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`regional`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`regional` (
  `id_regional` INT NOT NULL AUTO_INCREMENT ,
  `nombre_regional` VARCHAR(45) NOT NULL ,
  `codigo_regional` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`id_regional`) ,
  UNIQUE INDEX `Codigo_Regional_UNIQUE` (`codigo_regional` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`paises`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`paises` (
  `id_paises` VARCHAR(4) NOT NULL ,
  `nombre_pais` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_paises`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`departamento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`departamento` (
  `id_departamento` INT NOT NULL ,
  `nombre_departamento` VARCHAR(45) NOT NULL ,
  `id_paises` VARCHAR(3) NOT NULL ,
  PRIMARY KEY (`id_departamento`) ,
  INDEX `fk_Departamento_Paises1_idx` (`id_paises` ASC) ,
  CONSTRAINT `fk_Departamento_Paises1`
    FOREIGN KEY (`id_paises` )
    REFERENCES `pepe_db`.`paises` (`id_paises` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`ciudad`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`ciudad` (
  `id_ciudad` INT NOT NULL AUTO_INCREMENT ,
  `nombre_ciudad` VARCHAR(45) NOT NULL ,
  `id_departamento` INT NOT NULL ,
  PRIMARY KEY (`id_ciudad`, `id_departamento`) ,
  INDEX `fk_Ciudad_Departamento1_idx` (`id_departamento` ASC) ,
  CONSTRAINT `fk_Ciudad_Departamento1`
    FOREIGN KEY (`id_departamento` )
    REFERENCES `pepe_db`.`departamento` (`id_departamento` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`centro_formacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`centro_formacion` (
  `id_centro_formacion` INT NOT NULL AUTO_INCREMENT ,
  `id_regional` INT NOT NULL ,
  `nombre_centro_formacion` VARCHAR(45) NOT NULL ,
  `codigo_centro_formacion` VARCHAR(10) NOT NULL ,
  `id_ciudad` INT NOT NULL ,
  `id_departamento` INT NOT NULL ,
  PRIMARY KEY (`id_centro_formacion`) ,
  INDEX `fk_Centro_Formacion_Regional1_idx` (`id_regional` ASC) ,
  UNIQUE INDEX `Codigo_Centro_Formacion_UNIQUE` (`codigo_centro_formacion` ASC) ,
  INDEX `fk_Centro_Formacion_Ciudad1_idx` (`id_ciudad` ASC, `id_departamento` ASC) ,
  CONSTRAINT `fk_Centro_Formacion_Regional1`
    FOREIGN KEY (`id_regional` )
    REFERENCES `pepe_db`.`regional` (`id_regional` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Centro_Formacion_Ciudad1`
    FOREIGN KEY (`id_ciudad` , `id_departamento` )
    REFERENCES `pepe_db`.`ciudad` (`id_ciudad` , `id_departamento` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`tipo_oferta`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`tipo_oferta` (
  `id_tipo_oferta` INT NOT NULL AUTO_INCREMENT ,
  `tipo_oferta` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipo_oferta`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`jornada`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`jornada` (
  `id_jornada` INT NOT NULL AUTO_INCREMENT ,
  `nombre_jornada` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_jornada`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`ficha`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`ficha` (
  `id_ficha` INT NOT NULL AUTO_INCREMENT ,
  `id_centro_formacion` INT NOT NULL ,
  `id_tipo_oferta` INT NOT NULL ,
  `id_jornada` INT NOT NULL ,
  `codigo_ficha` VARCHAR(7) NOT NULL ,
  `fecha_inicio` DATE NOT NULL ,
  `trimestres_lectiva` SMALLINT NOT NULL ,
  `estado` VARCHAR(45) NOT NULL ,
  `id_programa` INT NOT NULL ,
  `Programa_Codigo` VARCHAR(6) NOT NULL ,
  `programa_version` VARCHAR(4) NOT NULL ,
  `id_tipo_formacion` INT NOT NULL ,
  PRIMARY KEY (`id_ficha`) ,
  INDEX `fk_Ficha_Centro_Formacion1_idx` (`id_centro_formacion` ASC) ,
  INDEX `fk_Ficha_Tipo_Oferta1_idx` (`id_tipo_oferta` ASC) ,
  INDEX `fk_Ficha_Jornada1_idx` (`id_jornada` ASC) ,
  INDEX `fk_Ficha_Programa1_idx` (`Programa_Codigo` ASC, `programa_version` ASC) ,
  INDEX `fk_Ficha_Tipo_Formacion1_idx` (`id_tipo_formacion` ASC) ,
  CONSTRAINT `fk_Ficha_Centro_Formacion1`
    FOREIGN KEY (`id_centro_formacion` )
    REFERENCES `pepe_db`.`centro_formacion` (`id_centro_formacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Tipo_Oferta1`
    FOREIGN KEY (`id_tipo_oferta` )
    REFERENCES `pepe_db`.`tipo_oferta` (`id_tipo_oferta` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Jornada1`
    FOREIGN KEY (`id_jornada` )
    REFERENCES `pepe_db`.`jornada` (`id_jornada` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Programa1`
    FOREIGN KEY (`Programa_Codigo` , `programa_version` )
    REFERENCES `pepe_db`.`programa` (`codigo` , `version` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Tipo_Formacion1`
    FOREIGN KEY (`id_tipo_formacion` )
    REFERENCES `pepe_db`.`tipo_formacion` (`id_tipo_formacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`tipo_instructor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`tipo_instructor` (
  `id_tipo_instructor` INT NOT NULL AUTO_INCREMENT ,
  `nombre_tipo_instructor` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipo_instructor`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`usuario_has_ficha`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`usuario_has_ficha` (
  `id_usuario` INT NOT NULL ,
  `id_ficha` INT NOT NULL ,
  `id_tipo_instructor` INT NOT NULL ,
  PRIMARY KEY (`id_usuario`, `id_ficha`, `id_tipo_instructor`) ,
  INDEX `fk_Usuario_has_Ficha_Ficha1_idx` (`id_ficha` ASC) ,
  INDEX `fk_Usuario_has_Ficha_Usuario1_idx` (`id_usuario` ASC) ,
  INDEX `fk_Usuario_has_Ficha_tipo_instructor1_idx` (`id_tipo_instructor` ASC) ,
  CONSTRAINT `fk_Usuario_has_Ficha_Usuario1`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `pepe_db`.`usuario` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Ficha_Ficha1`
    FOREIGN KEY (`id_ficha` )
    REFERENCES `pepe_db`.`ficha` (`id_ficha` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Ficha_tipo_instructor1`
    FOREIGN KEY (`id_tipo_instructor` )
    REFERENCES `pepe_db`.`tipo_instructor` (`id_tipo_instructor` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`proyecto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`proyecto` (
  `id_proyecto` INT NOT NULL AUTO_INCREMENT ,
  `nombre_proyecto` VARCHAR(45) NOT NULL ,
  `codigo_proyecto` VARCHAR(45) NOT NULL ,
  `justificacion_2_2` TEXT NOT NULL ,
  `objetivo_general_2_3` TEXT NOT NULL ,
  `objetivo_especifico_2_4` LONGTEXT NOT NULL ,
  `palabras_clave_1_7` TEXT NOT NULL ,
  `planteamiento_2_1` TEXT NOT NULL ,
  `Impacto_2_5_2` TEXT NOT NULL ,
  `restricciones_2_5_3` TEXT NOT NULL ,
  `productos_resultados_2_5_4` TEXT NOT NULL ,
  `innovacion_2_6_1` TEXT NOT NULL ,
  `innovacion_2_6_2` TINYINT NOT NULL ,
  `innovacion_2_6_3` TINYINT NOT NULL ,
  `innovacion_2_6_4` TINYINT NOT NULL ,
  `innovacion_2_6_5` TINYINT NOT NULL ,
  `valoracion_2_7_1` TINYINT NOT NULL ,
  `Valoracion_2_7_2` SMALLINT NOT NULL ,
  `intructores_requeridos` INT NOT NULL ,
  `aprendices_sugeridos` INT NOT NULL ,
  `descripcion_ambiente` LONGTEXT NOT NULL ,
  PRIMARY KEY (`id_proyecto`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`fase`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`fase` (
  `id_fase` INT NOT NULL AUTO_INCREMENT ,
  `fase` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_fase`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`ambiente_formacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`ambiente_formacion` (
  `id_ambiente_formacion` INT NOT NULL AUTO_INCREMENT ,
  `numero_ambiente_formacion` MEDIUMINT NOT NULL ,
  PRIMARY KEY (`id_ambiente_formacion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`proyecto_has_ficha`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`proyecto_has_ficha` (
  `id_proyecto` INT NOT NULL ,
  `id_ficha` INT NOT NULL ,
  PRIMARY KEY (`id_proyecto`, `id_ficha`) ,
  INDEX `fk_Proyecto_has_Ficha_Ficha1_idx` (`id_ficha` ASC) ,
  INDEX `fk_Proyecto_has_Ficha_Proyecto1_idx` (`id_proyecto` ASC) ,
  CONSTRAINT `fk_Proyecto_has_Ficha_Proyecto1`
    FOREIGN KEY (`id_proyecto` )
    REFERENCES `pepe_db`.`proyecto` (`id_proyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proyecto_has_Ficha_Ficha1`
    FOREIGN KEY (`id_ficha` )
    REFERENCES `pepe_db`.`ficha` (`id_ficha` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`guia_aprendizaje`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`guia_aprendizaje` (
  `id_guia_aprendizaje` INT NOT NULL AUTO_INCREMENT ,
  `id_fase` INT NOT NULL ,
  `guia_aprendizaje` VARCHAR(45) NOT NULL ,
  `id_fase1` INT NOT NULL ,
  `id_proyecto` INT NOT NULL ,
  `id_ficha` INT NOT NULL ,
  PRIMARY KEY (`id_guia_aprendizaje`, `id_fase`) ,
  INDEX `fk_Guia_Aprendizaje_Fase1_idx` (`id_fase1` ASC) ,
  INDEX `fk_Guia_Aprendizaje_Proyecto1_idx` (`id_proyecto` ASC) ,
  INDEX `fk_Guia_Aprendizaje_Ficha1_idx` (`id_ficha` ASC) ,
  CONSTRAINT `fk_Guia_Aprendizaje_Fase1`
    FOREIGN KEY (`id_fase1` )
    REFERENCES `pepe_db`.`fase` (`id_fase` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Guia_Aprendizaje_Proyecto1`
    FOREIGN KEY (`id_proyecto` )
    REFERENCES `pepe_db`.`proyecto` (`id_proyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Guia_Aprendizaje_Ficha1`
    FOREIGN KEY (`id_ficha` )
    REFERENCES `pepe_db`.`ficha` (`id_ficha` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`actividad`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`actividad` (
  `id_actividad` INT NOT NULL AUTO_INCREMENT ,
  `id_guia_aprendizaje` INT NOT NULL ,
  `id_fase` INT NOT NULL ,
  `nombre_actividad` VARCHAR(45) NOT NULL ,
  `duracion` INT NOT NULL ,
  `id_proyecto` INT NOT NULL ,
  PRIMARY KEY (`id_actividad`) ,
  INDEX `fk_Actividad_Guia_Aprendizaje1_idx` (`id_guia_aprendizaje` ASC, `id_fase` ASC) ,
  CONSTRAINT `fk_Actividad_Guia_Aprendizaje1`
    FOREIGN KEY (`id_guia_aprendizaje` , `id_fase` )
    REFERENCES `pepe_db`.`guia_aprendizaje` (`id_guia_aprendizaje` , `id_fase` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`tipo_evidencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`tipo_evidencia` (
  `id_tipo_evidencia` INT NOT NULL AUTO_INCREMENT ,
  `tipo_evidencia` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipo_evidencia`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`tecnica_didactica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`tecnica_didactica` (
  `id_tecnica_didactica` INT NOT NULL AUTO_INCREMENT ,
  `tecnica_didactica` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tecnica_didactica`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`tipo_actividad_aprendizaje`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`tipo_actividad_aprendizaje` (
  `id_tipo_actividad_aprendizaje` INT NOT NULL AUTO_INCREMENT ,
  `nombre_tipo_actividad_aprendizaje` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipo_actividad_aprendizaje`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`actividad_aprendizaje`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`actividad_aprendizaje` (
  `id_actividad_aprendizaje` INT NOT NULL AUTO_INCREMENT ,
  `nombre_actividad_aprendizaje` VARCHAR(45) NOT NULL ,
  `duracion_actividad_aprendizaje` INT NOT NULL ,
  `observaciones` VARCHAR(45) NOT NULL ,
  `id_actividad` INT NOT NULL ,
  `id_tecnica_didactica` INT NOT NULL ,
  `id_tipo_actividad_aprendizaje` INT NOT NULL ,
  PRIMARY KEY (`id_actividad_aprendizaje`) ,
  INDEX `fk_Actividad_Aprendizaje_Actividad1_idx` (`id_actividad` ASC) ,
  INDEX `fk_Actividad_Aprendizaje_Tecnica_Didactica1_idx` (`id_tecnica_didactica` ASC) ,
  INDEX `fk_Actividad_Aprendizaje_Tipo_Actividad_Aprendizaje1_idx` (`id_tipo_actividad_aprendizaje` ASC) ,
  CONSTRAINT `fk_Actividad_Aprendizaje_Actividad1`
    FOREIGN KEY (`id_actividad` )
    REFERENCES `pepe_db`.`actividad` (`id_actividad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actividad_Aprendizaje_Tecnica_Didactica1`
    FOREIGN KEY (`id_tecnica_didactica` )
    REFERENCES `pepe_db`.`tecnica_didactica` (`id_tecnica_didactica` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actividad_Aprendizaje_Tipo_Actividad_Aprendizaje1`
    FOREIGN KEY (`id_tipo_actividad_aprendizaje` )
    REFERENCES `pepe_db`.`tipo_actividad_aprendizaje` (`id_tipo_actividad_aprendizaje` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`evidencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`evidencia` (
  `id_evidencia` INT NOT NULL AUTO_INCREMENT ,
  `id_tipo_evidencia` INT NOT NULL ,
  `nombre_evidencia` VARCHAR(45) NOT NULL ,
  `id_actividad_aprendizaje` INT NOT NULL ,
  `descripcion_evidencia` VARCHAR(45) NOT NULL ,
  `observacion_evidencia` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_evidencia`) ,
  INDEX `fk_Evidencia_Tipo_Evidencia1_idx` (`id_tipo_evidencia` ASC) ,
  INDEX `fk_Evidencia_Actividad_Aprendizaje1_idx` (`id_actividad_aprendizaje` ASC) ,
  CONSTRAINT `fk_Evidencia_Tipo_Evidencia1`
    FOREIGN KEY (`id_tipo_evidencia` )
    REFERENCES `pepe_db`.`tipo_evidencia` (`id_tipo_evidencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evidencia_Actividad_Aprendizaje1`
    FOREIGN KEY (`id_actividad_aprendizaje` )
    REFERENCES `pepe_db`.`actividad_aprendizaje` (`id_actividad_aprendizaje` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`evaluacion_seguimiento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`evaluacion_seguimiento` (
  `id_evaluacion_seguimiento` INT NOT NULL AUTO_INCREMENT ,
  `id_fase` INT NOT NULL ,
  PRIMARY KEY (`id_evaluacion_seguimiento`, `id_fase`) ,
  INDEX `fk_Evaluacion_Seguimiento_Fase1_idx` (`id_fase` ASC) ,
  CONSTRAINT `fk_Evaluacion_Seguimiento_Fase1`
    FOREIGN KEY (`id_fase` )
    REFERENCES `pepe_db`.`fase` (`id_fase` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`actividad_has_resultado_aprendizaje`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`actividad_has_resultado_aprendizaje` (
  `id_actividad` INT NOT NULL ,
  `id_resultado_aprendizaje` INT NOT NULL ,
  PRIMARY KEY (`id_actividad`, `id_resultado_aprendizaje`) ,
  INDEX `fk_Actividad_has_Resultado_Aprendizaje_Resultado_Aprendizaj_idx` (`id_resultado_aprendizaje` ASC) ,
  INDEX `fk_Actividad_has_Resultado_Aprendizaje_Actividad1_idx` (`id_actividad` ASC) ,
  CONSTRAINT `fk_Actividad_has_Resultado_Aprendizaje_Actividad1`
    FOREIGN KEY (`id_actividad` )
    REFERENCES `pepe_db`.`actividad` (`id_actividad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actividad_has_Resultado_Aprendizaje_Resultado_Aprendizaje1`
    FOREIGN KEY (`id_resultado_aprendizaje` )
    REFERENCES `pepe_db`.`resultado_aprendizaje` (`id_resultado_aprendizaje` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`empresa_has_proyecto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`empresa_has_proyecto` (
  `id_empresa` INT NOT NULL ,
  `id_proyecto` INT NOT NULL ,
  PRIMARY KEY (`id_empresa`, `id_proyecto`) ,
  INDEX `fk_Empresa_has_Proyecto_Proyecto1_idx` (`id_proyecto` ASC) ,
  INDEX `fk_Empresa_has_Proyecto_Empresa1_idx` (`id_empresa` ASC) ,
  CONSTRAINT `fk_Empresa_has_Proyecto_Empresa1`
    FOREIGN KEY (`id_empresa` )
    REFERENCES `pepe_db`.`empresa` (`id_empresa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empresa_has_Proyecto_Proyecto1`
    FOREIGN KEY (`id_proyecto` )
    REFERENCES `pepe_db`.`proyecto` (`id_proyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`usuario_has_centro_formacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`usuario_has_centro_formacion` (
  `id_usuario` INT NOT NULL ,
  `id_centro_formacion` INT NOT NULL ,
  PRIMARY KEY (`id_usuario`, `id_centro_formacion`) ,
  INDEX `fk_Usuario_has_Centro_Formacion_Centro_Formacion1_idx` (`id_centro_formacion` ASC) ,
  INDEX `fk_Usuario_has_Centro_Formacion_Usuario1_idx` (`id_usuario` ASC) ,
  CONSTRAINT `fk_Usuario_has_Centro_Formacion_Usuario1`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `pepe_db`.`usuario` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Centro_Formacion_Centro_Formacion1`
    FOREIGN KEY (`id_centro_formacion` )
    REFERENCES `pepe_db`.`centro_formacion` (`id_centro_formacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`trimestre`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`trimestre` (
  `id_trimestre` INT NOT NULL AUTO_INCREMENT ,
  `fecha_inicio` DATE NOT NULL ,
  `fecha_fin` DATE NOT NULL ,
  PRIMARY KEY (`id_trimestre`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`evento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`evento` (
  `id_evento` INT NOT NULL AUTO_INCREMENT ,
  `fecha_inicio` DATE NOT NULL ,
  `fecha_fin` DATE NOT NULL ,
  `id_ambiente_formacion` INT NOT NULL ,
  `id_ficha` INT NOT NULL ,
  `id_actividad_aprendizaje` INT NOT NULL ,
  PRIMARY KEY (`id_evento`) ,
  INDEX `fk_Evento_Ambiente_Formacion1_idx` (`id_ambiente_formacion` ASC) ,
  INDEX `fk_Evento_Ficha1_idx` (`id_ficha` ASC) ,
  INDEX `fk_Evento_Actividad_Aprendizaje1_idx` (`id_actividad_aprendizaje` ASC) ,
  CONSTRAINT `fk_Evento_Ambiente_Formacion1`
    FOREIGN KEY (`id_ambiente_formacion` )
    REFERENCES `pepe_db`.`ambiente_formacion` (`id_ambiente_formacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_Ficha1`
    FOREIGN KEY (`id_ficha` )
    REFERENCES `pepe_db`.`ficha` (`id_ficha` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_Actividad_Aprendizaje1`
    FOREIGN KEY (`id_actividad_aprendizaje` )
    REFERENCES `pepe_db`.`actividad_aprendizaje` (`id_actividad_aprendizaje` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`evento_has_usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`evento_has_usuario` (
  `id_evento` INT NOT NULL ,
  `id_usuario` INT NOT NULL ,
  PRIMARY KEY (`id_evento`, `id_usuario`) ,
  INDEX `fk_Evento_has_Usuario_Usuario1_idx` (`id_usuario` ASC) ,
  INDEX `fk_Evento_has_Usuario_Evento1_idx` (`id_evento` ASC) ,
  CONSTRAINT `fk_Evento_has_Usuario_Evento1`
    FOREIGN KEY (`id_evento` )
    REFERENCES `pepe_db`.`evento` (`id_evento` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_has_Usuario_Usuario1`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `pepe_db`.`usuario` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`evento_has_trimestre`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`evento_has_trimestre` (
  `id_evento` INT NOT NULL ,
  `id_trimestre` INT NOT NULL ,
  PRIMARY KEY (`id_evento`, `id_trimestre`) ,
  INDEX `fk_Evento_has_Trimestre_Trimestre1_idx` (`id_trimestre` ASC) ,
  INDEX `fk_Evento_has_Trimestre_Evento1_idx` (`id_evento` ASC) ,
  CONSTRAINT `fk_Evento_has_Trimestre_Evento1`
    FOREIGN KEY (`id_evento` )
    REFERENCES `pepe_db`.`evento` (`id_evento` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_has_Trimestre_Trimestre1`
    FOREIGN KEY (`id_trimestre` )
    REFERENCES `pepe_db`.`trimestre` (`id_trimestre` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`trimestre_has_ficha`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`trimestre_has_ficha` (
  `id_trimestre` INT NOT NULL ,
  `id_fecha` INT NOT NULL ,
  PRIMARY KEY (`id_trimestre`, `id_fecha`) ,
  INDEX `fk_Trimestre_has_Ficha_Ficha1_idx` (`id_fecha` ASC) ,
  INDEX `fk_Trimestre_has_Ficha_Trimestre1_idx` (`id_trimestre` ASC) ,
  CONSTRAINT `fk_Trimestre_has_Ficha_Trimestre1`
    FOREIGN KEY (`id_trimestre` )
    REFERENCES `pepe_db`.`trimestre` (`id_trimestre` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trimestre_has_Ficha_Ficha1`
    FOREIGN KEY (`id_fecha` )
    REFERENCES `pepe_db`.`ficha` (`id_ficha` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`actividad_aprendizaje_has_resultado_aprendizaje`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`actividad_aprendizaje_has_resultado_aprendizaje` (
  `id_actividad_aprendizaje` INT NOT NULL ,
  `id_resultado_aprendizaje` INT NOT NULL ,
  PRIMARY KEY (`id_actividad_aprendizaje`, `id_resultado_aprendizaje`) ,
  INDEX `fk_Actividad_Aprendizaje_has_Resultado_Aprendizaje_Resultad_idx` (`id_resultado_aprendizaje` ASC) ,
  INDEX `fk_Actividad_Aprendizaje_has_Resultado_Aprendizaje_Activida_idx` (`id_actividad_aprendizaje` ASC) ,
  CONSTRAINT `fk_Actividad_Aprendizaje_has_Resultado_Aprendizaje_Actividad_1`
    FOREIGN KEY (`id_actividad_aprendizaje` )
    REFERENCES `pepe_db`.`actividad_aprendizaje` (`id_actividad_aprendizaje` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actividad_Aprendizaje_has_Resultado_Aprendizaje_Resultado_1`
    FOREIGN KEY (`id_resultado_aprendizaje` )
    REFERENCES `pepe_db`.`resultado_aprendizaje` (`id_resultado_aprendizaje` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`actividad_aprendizaje_has_usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`actividad_aprendizaje_has_usuario` (
  `id_actividad_aprendizaje` INT NOT NULL ,
  `id_usuario` INT NOT NULL ,
  PRIMARY KEY (`id_actividad_aprendizaje`, `id_usuario`) ,
  INDEX `fk_Actividad_Aprendizaje_has_Usuario_Usuario1_idx` (`id_usuario` ASC) ,
  INDEX `fk_Actividad_Aprendizaje_has_Usuario_Actividad_Aprendizaje1_idx` (`id_actividad_aprendizaje` ASC) ,
  CONSTRAINT `fk_Actividad_Aprendizaje_has_Usuario_Actividad_Aprendizaje1`
    FOREIGN KEY (`id_actividad_aprendizaje` )
    REFERENCES `pepe_db`.`actividad_aprendizaje` (`id_actividad_aprendizaje` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Actividad_Aprendizaje_has_Usuario_Usuario1`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `pepe_db`.`usuario` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`visita_tecnica`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`visita_tecnica` (
  `id_visita_tecnica` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `fecha` VARCHAR(45) NOT NULL ,
  `ciudad` VARCHAR(45) NOT NULL ,
  `id_proyecto` INT NOT NULL ,
  `id_ciudad` INT NOT NULL ,
  `id_departamento` INT NOT NULL ,
  PRIMARY KEY (`id_visita_tecnica`) ,
  INDEX `fk_Visita_Tecnica_Proyecto1_idx` (`id_proyecto` ASC) ,
  INDEX `fk_Visita_Tecnica_Ciudad1_idx` (`id_ciudad` ASC, `id_departamento` ASC) ,
  CONSTRAINT `fk_Visita_Tecnica_Proyecto1`
    FOREIGN KEY (`id_proyecto` )
    REFERENCES `pepe_db`.`proyecto` (`id_proyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Visita_Tecnica_Ciudad1`
    FOREIGN KEY (`id_ciudad` , `id_departamento` )
    REFERENCES `pepe_db`.`ciudad` (`id_ciudad` , `id_departamento` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`usuario_has_ciudad`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`usuario_has_ciudad` (
  `id_usuario` INT NOT NULL ,
  `id_ciudad` INT NOT NULL ,
  `id_departamento` INT NOT NULL ,
  PRIMARY KEY (`id_usuario`, `id_ciudad`, `id_departamento`) ,
  INDEX `fk_Usuario_has_Ciudad_Ciudad1_idx` (`id_ciudad` ASC, `id_departamento` ASC) ,
  INDEX `fk_Usuario_has_Ciudad_Usuario1_idx` (`id_usuario` ASC) ,
  CONSTRAINT `fk_Usuario_has_Ciudad_Usuario1`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `pepe_db`.`usuario` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Ciudad_Ciudad1`
    FOREIGN KEY (`id_ciudad` , `id_departamento` )
    REFERENCES `pepe_db`.`ciudad` (`id_ciudad` , `id_departamento` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`area`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`area` (
  `id_area` INT NOT NULL AUTO_INCREMENT ,
  `nombre_area` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_area`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`valoracion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`valoracion` (
  `id_valoracion` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_valoracion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT ,
  `nombre_categoria` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_categoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`criterio_seguimiento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`criterio_seguimiento` (
  `id_criterio_seguimiento` INT NOT NULL AUTO_INCREMENT ,
  `descrpcion` TEXT NOT NULL ,
  `id_valoracion` INT NOT NULL ,
  `id_categoria` INT NOT NULL ,
  PRIMARY KEY (`id_criterio_seguimiento`) ,
  INDEX `fk_Criterio_Seguimiento_Valoracion1_idx` (`id_valoracion` ASC) ,
  INDEX `fk_Criterio_Seguimiento_Categoria1_idx` (`id_categoria` ASC) ,
  CONSTRAINT `fk_Criterio_Seguimiento_Valoracion1`
    FOREIGN KEY (`id_valoracion` )
    REFERENCES `pepe_db`.`valoracion` (`id_valoracion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Criterio_Seguimiento_Categoria1`
    FOREIGN KEY (`id_categoria` )
    REFERENCES `pepe_db`.`categoria` (`id_categoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`evidencia_encontrada`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`evidencia_encontrada` (
  `id_evidencia_encontrada` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` TEXT NOT NULL ,
  PRIMARY KEY (`id_evidencia_encontrada`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`acompañamiento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`acompañamiento` (
  `id_acompañamiento` INT NOT NULL AUTO_INCREMENT ,
  `fecha_inicio` DATETIME NOT NULL ,
  `facha_fin` DATETIME NOT NULL ,
  `id_ficha` INT NOT NULL ,
  `id_fase` INT NOT NULL ,
  `id_ambiente_formacion` INT NOT NULL ,
  PRIMARY KEY (`id_acompañamiento`) ,
  INDEX `fk_Acompañamiento_Ficha1_idx` (`id_ficha` ASC) ,
  INDEX `fk_Acompañamiento_Fase1_idx` (`id_fase` ASC) ,
  INDEX `fk_Acompañamiento_Ambiente_Formacion1_idx` (`id_ambiente_formacion` ASC) ,
  CONSTRAINT `fk_Acompañamiento_Ficha1`
    FOREIGN KEY (`id_ficha` )
    REFERENCES `pepe_db`.`ficha` (`id_ficha` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Acompañamiento_Fase1`
    FOREIGN KEY (`id_fase` )
    REFERENCES `pepe_db`.`fase` (`id_fase` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Acompañamiento_Ambiente_Formacion1`
    FOREIGN KEY (`id_ambiente_formacion` )
    REFERENCES `pepe_db`.`ambiente_formacion` (`id_ambiente_formacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`conclusiones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`conclusiones` (
  `id_conclusiones` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` TEXT NOT NULL ,
  PRIMARY KEY (`id_conclusiones`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`criterio_seguimiento_has_acompañamiento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`criterio_seguimiento_has_acompañamiento` (
  `id_criterio_seguimiento` INT NOT NULL ,
  `id_acompañamiento` INT NOT NULL ,
  `cumple` TINYINT NOT NULL ,
  `id_usuario` INT NOT NULL ,
  `id_evidencia_encontrada` INT NOT NULL ,
  `id_conclusiones` INT NOT NULL ,
  PRIMARY KEY (`id_criterio_seguimiento`, `id_acompañamiento`) ,
  INDEX `fk_Criterio_Seguimiento_has_Acompañamiento_Acompañamiento_idx` (`id_acompañamiento` ASC) ,
  INDEX `fk_Criterio_Seguimiento_has_Acompañamiento_Criterio_Seguim_idx` (`id_criterio_seguimiento` ASC) ,
  INDEX `fk_Criterio_Seguimiento_has_Acompañamiento_Usuario1_idx` (`id_usuario` ASC) ,
  INDEX `fk_Criterio_Seguimiento_has_Acompañamiento_Evidencia_Encon_idx` (`id_evidencia_encontrada` ASC) ,
  INDEX `fk_Criterio_Seguimiento_has_Acompañamiento_Conclusiones1_idx` (`id_conclusiones` ASC) ,
  CONSTRAINT `fk_Criterio_Seguimiento_has_Acompañamiento_Criterio_Seguimie1`
    FOREIGN KEY (`id_criterio_seguimiento` )
    REFERENCES `pepe_db`.`criterio_seguimiento` (`id_criterio_seguimiento` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Criterio_Seguimiento_has_Acompañamiento_Acompañamiento1`
    FOREIGN KEY (`id_acompañamiento` )
    REFERENCES `pepe_db`.`acompañamiento` (`id_acompañamiento` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Criterio_Seguimiento_has_Acompañamiento_Usuario1`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `pepe_db`.`usuario` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Criterio_Seguimiento_has_Acompañamiento_Evidencia_Encontr1`
    FOREIGN KEY (`id_evidencia_encontrada` )
    REFERENCES `pepe_db`.`evidencia_encontrada` (`id_evidencia_encontrada` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Criterio_Seguimiento_has_Acompañamiento_Conclusiones1`
    FOREIGN KEY (`id_conclusiones` )
    REFERENCES `pepe_db`.`conclusiones` (`id_conclusiones` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`revision`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`revision` (
  `id_revision` INT NOT NULL AUTO_INCREMENT ,
  `concepto` VARCHAR(45) NOT NULL ,
  `id_proyecto` INT NOT NULL ,
  PRIMARY KEY (`id_revision`) ,
  INDEX `fk_Revision_Proyecto1_idx` (`id_proyecto` ASC) ,
  CONSTRAINT `fk_Revision_Proyecto1`
    FOREIGN KEY (`id_proyecto` )
    REFERENCES `pepe_db`.`proyecto` (`id_proyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`variable`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`variable` (
  `id_variable` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` TEXT NOT NULL ,
  `cumple` TINYINT NOT NULL ,
  `observacion` TEXT NOT NULL ,
  `id_revision` INT NOT NULL ,
  PRIMARY KEY (`id_variable`) ,
  INDEX `fk_Variable_Revision1_idx` (`id_revision` ASC) ,
  CONSTRAINT `fk_Variable_Revision1`
    FOREIGN KEY (`id_revision` )
    REFERENCES `pepe_db`.`revision` (`id_revision` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`revision_has_usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`revision_has_usuario` (
  `id_revision` INT NOT NULL ,
  `id_usuario` INT NOT NULL ,
  PRIMARY KEY (`id_revision`, `id_usuario`) ,
  INDEX `fk_Revision_has_Usuario_Usuario1_idx` (`id_usuario` ASC) ,
  INDEX `fk_Revision_has_Usuario_Revision1_idx` (`id_revision` ASC) ,
  CONSTRAINT `fk_Revision_has_Usuario_Revision1`
    FOREIGN KEY (`id_revision` )
    REFERENCES `pepe_db`.`revision` (`id_revision` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Revision_has_Usuario_Usuario1`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `pepe_db`.`usuario` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`verificacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`verificacion` (
  `id_verificacion` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` TEXT NOT NULL ,
  `cumple` TINYINT NOT NULL ,
  `obervaciones` TEXT NOT NULL ,
  `id_usuario` INT NOT NULL ,
  `id_ambiente_formacion` INT NOT NULL ,
  `id_proyecto` INT NOT NULL ,
  PRIMARY KEY (`id_verificacion`) ,
  INDEX `fk_Verificacion_Usuario1_idx` (`id_usuario` ASC) ,
  INDEX `fk_Verificacion_Ambiente_Formacion1_idx` (`id_ambiente_formacion` ASC) ,
  INDEX `fk_Verificacion_Proyecto1_idx` (`id_proyecto` ASC) ,
  CONSTRAINT `fk_Verificacion_Usuario1`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `pepe_db`.`usuario` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Verificacion_Ambiente_Formacion1`
    FOREIGN KEY (`id_ambiente_formacion` )
    REFERENCES `pepe_db`.`ambiente_formacion` (`id_ambiente_formacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Verificacion_Proyecto1`
    FOREIGN KEY (`id_proyecto` )
    REFERENCES `pepe_db`.`proyecto` (`id_proyecto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`recurso`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`recurso` (
  `id_recurso` INT NOT NULL AUTO_INCREMENT ,
  `id_actividad` INT NOT NULL ,
  PRIMARY KEY (`id_recurso`) ,
  INDEX `fk_Recurso_Actividad1_idx` (`id_actividad` ASC) ,
  CONSTRAINT `fk_Recurso_Actividad1`
    FOREIGN KEY (`id_actividad` )
    REFERENCES `pepe_db`.`actividad` (`id_actividad` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`tipo_material`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`tipo_material` (
  `id_tipo_material` INT NOT NULL AUTO_INCREMENT ,
  `nombre_tipo_material` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipo_material`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`material`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`material` (
  `id_material` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  `cantidad` INT NOT NULL ,
  `valor_unitario` DOUBLE NULL ,
  `codigo_orions` VARCHAR(45) NULL ,
  `id_tipo_material` INT NOT NULL ,
  PRIMARY KEY (`id_material`) ,
  INDEX `fk_material_tipo_material1_idx` (`id_tipo_material` ASC) ,
  CONSTRAINT `fk_material_tipo_material1`
    FOREIGN KEY (`id_tipo_material` )
    REFERENCES `pepe_db`.`tipo_material` (`id_tipo_material` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`fuente_recursos`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`fuente_recursos` (
  `id_fuente_recursos` INT NOT NULL AUTO_INCREMENT ,
  `nombre_recursos` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_fuente_recursos`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`recurso_has_material`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`recurso_has_material` (
  `id_recurso` INT NOT NULL ,
  `id_material` INT NOT NULL ,
  `id_fuente_recursos` INT NOT NULL ,
  PRIMARY KEY (`id_recurso`, `id_material`) ,
  INDEX `fk_Recurso_has_material_material1_idx` (`id_material` ASC) ,
  INDEX `fk_Recurso_has_material_Recurso1_idx` (`id_recurso` ASC) ,
  INDEX `fk_Recurso_has_material_fuente_recursos1_idx` (`id_fuente_recursos` ASC) ,
  CONSTRAINT `fk_Recurso_has_material_Recurso1`
    FOREIGN KEY (`id_recurso` )
    REFERENCES `pepe_db`.`recurso` (`id_recurso` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recurso_has_material_material1`
    FOREIGN KEY (`id_material` )
    REFERENCES `pepe_db`.`material` (`id_material` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recurso_has_material_fuente_recursos1`
    FOREIGN KEY (`id_fuente_recursos` )
    REFERENCES `pepe_db`.`fuente_recursos` (`id_fuente_recursos` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`recurso_has_ambiente_formacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`recurso_has_ambiente_formacion` (
  `id_recurso` INT NOT NULL ,
  `id_ambiente_formacion` INT NOT NULL ,
  PRIMARY KEY (`id_recurso`, `id_ambiente_formacion`) ,
  INDEX `fk_Recurso_has_Ambiente_Formacion_Ambiente_Formacion1_idx` (`id_ambiente_formacion` ASC) ,
  INDEX `fk_Recurso_has_Ambiente_Formacion_Recurso1_idx` (`id_recurso` ASC) ,
  CONSTRAINT `fk_Recurso_has_Ambiente_Formacion_Recurso1`
    FOREIGN KEY (`id_recurso` )
    REFERENCES `pepe_db`.`recurso` (`id_recurso` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Recurso_has_Ambiente_Formacion_Ambiente_Formacion1`
    FOREIGN KEY (`id_ambiente_formacion` )
    REFERENCES `pepe_db`.`ambiente_formacion` (`id_ambiente_formacion` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`rubro_presupuestal`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`rubro_presupuestal` (
  `idrubro_presupuestal` INT NOT NULL AUTO_INCREMENT ,
  `nombre_rubro_presupuestal` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idrubro_presupuestal`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`tipo_material_has_rubro_presupuestal`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`tipo_material_has_rubro_presupuestal` (
  `id_tipo_material` INT NOT NULL ,
  `id_rubro_presupuestal` INT NOT NULL ,
  `valor_total` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id_tipo_material`, `id_rubro_presupuestal`) ,
  INDEX `fk_tipo_material_has_rubro_presupuestal_rubro_presupuestal1_idx` (`id_rubro_presupuestal` ASC) ,
  INDEX `fk_tipo_material_has_rubro_presupuestal_tipo_material1_idx` (`id_tipo_material` ASC) ,
  CONSTRAINT `fk_tipo_material_has_rubro_presupuestal_tipo_material1`
    FOREIGN KEY (`id_tipo_material` )
    REFERENCES `pepe_db`.`tipo_material` (`id_tipo_material` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_material_has_rubro_presupuestal_rubro_presupuestal1`
    FOREIGN KEY (`id_rubro_presupuestal` )
    REFERENCES `pepe_db`.`rubro_presupuestal` (`idrubro_presupuestal` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`participacion`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`participacion` (
  `id_participacion` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id_participacion`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepe_db`.`usuario_has_area`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `pepe_db`.`usuario_has_area` (
  `id_usuario` INT NOT NULL ,
  `id_area` INT NOT NULL ,
  PRIMARY KEY (`id_usuario`, `id_area`) ,
  INDEX `fk_Usuario_has_Area_Area1_idx` (`id_area` ASC) ,
  INDEX `fk_Usuario_has_Area_Usuario1_idx` (`id_usuario` ASC) ,
  CONSTRAINT `fk_Usuario_has_Area_Usuario1`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `pepe_db`.`usuario` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Area_Area1`
    FOREIGN KEY (`id_area` )
    REFERENCES `pepe_db`.`area` (`id_area` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `pepe_db` ;

-- -----------------------------------------------------
-- Placeholder table for view `pepe_db`.`usuario_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepe_db`.`usuario_roles` (`numero_documento` INT, `password` INT, `id_rol` INT);

-- -----------------------------------------------------
-- View `pepe_db`.`usuario_roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pepe_db`.`usuario_roles`;
USE `pepe_db`;
CREATE  OR REPLACE VIEW `usuario_roles` AS
select `usuario`.`numero_documento` as `numero_documento`, 
`usuario`.`password` as `password`,
`rol`.`id_rol` as `id_rol`
from ((`usuario`join`rol`)join `rol_has_usuario`)
where ((`usuario`.`id_usuario` = `rol_has_usuario`.`id_usuario`)
            and (`rol`.`id_rol` = `rol_has_usuario`.`id_rol`))
;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`tipo_vocero`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`tipo_vocero` (`id_tipo_vocero`, `nombre_tipo_vocero`) VALUES (1, 'Academico');
INSERT INTO `pepe_db`.`tipo_vocero` (`id_tipo_vocero`, `nombre_tipo_vocero`) VALUES (2, 'Cultural');
INSERT INTO `pepe_db`.`tipo_vocero` (`id_tipo_vocero`, `nombre_tipo_vocero`) VALUES (3, 'Disciplinario');
INSERT INTO `pepe_db`.`tipo_vocero` (`id_tipo_vocero`, `nombre_tipo_vocero`) VALUES (4, 'Espiritual');

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`rol`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`rol` (`id_rol`, `nombre_rol`, `codigo_rol`) VALUES (1, 'Admin', 'ADMIN');
INSERT INTO `pepe_db`.`rol` (`id_rol`, `nombre_rol`, `codigo_rol`) VALUES (2, 'User', 'User');
INSERT INTO `pepe_db`.`rol` (`id_rol`, `nombre_rol`, `codigo_rol`) VALUES (3, 'Apren', 'Apren');
INSERT INTO `pepe_db`.`rol` (`id_rol`, `nombre_rol`, `codigo_rol`) VALUES (4, 'Gest', 'Gest');
INSERT INTO `pepe_db`.`rol` (`id_rol`, `nombre_rol`, `codigo_rol`) VALUES (5, 'Pedag', 'Pedag');

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`red_tecnologica`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`red_tecnologica` (`id_red_tecnologica`, `nombre_red_tecnologica`) VALUES (1, 'Sistemas');

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`linea_tecnologica`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`linea_tecnologica` (`id_linea_tecnologica`, `id_red_tecnologica`, `nombre_linea_tecnologica`) VALUES (1, 1, 'Desarrollo de software');

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`perfil_entrada`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`perfil_entrada` (`id_perfil_entrada`, `nombre_perfil_entrada`) VALUES (1, 'Basica Secundaria');
INSERT INTO `pepe_db`.`perfil_entrada` (`id_perfil_entrada`, `nombre_perfil_entrada`) VALUES (2, 'Ninguna');
INSERT INTO `pepe_db`.`perfil_entrada` (`id_perfil_entrada`, `nombre_perfil_entrada`) VALUES (3, 'Bachiller');

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`modalidad_formacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`modalidad_formacion` (`id_modalidad_formacion`, `modalidad_formacion`) VALUES (1, 'Presencial');
INSERT INTO `pepe_db`.`modalidad_formacion` (`id_modalidad_formacion`, `modalidad_formacion`) VALUES (2, 'Virtual');

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`nivel_formacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`nivel_formacion` (`id_nivel_formacion`, `nivel_formacion`) VALUES (1, 'Tecnico');
INSERT INTO `pepe_db`.`nivel_formacion` (`id_nivel_formacion`, `nivel_formacion`) VALUES (2, 'Tecnologo');
INSERT INTO `pepe_db`.`nivel_formacion` (`id_nivel_formacion`, `nivel_formacion`) VALUES (3, 'Auxiliar');
INSERT INTO `pepe_db`.`nivel_formacion` (`id_nivel_formacion`, `nivel_formacion`) VALUES (4, 'Profundizacion Tecnica');
INSERT INTO `pepe_db`.`nivel_formacion` (`id_nivel_formacion`, `nivel_formacion`) VALUES (5, 'Especializacion Tecnologica');

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`tipo_formacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`tipo_formacion` (`id_tipo_formacion`, `tipo_formacion`) VALUES (1, 'Virtual');
INSERT INTO `pepe_db`.`tipo_formacion` (`id_tipo_formacion`, `tipo_formacion`) VALUES (2, 'Titulada');
INSERT INTO `pepe_db`.`tipo_formacion` (`id_tipo_formacion`, `tipo_formacion`) VALUES (3, 'Complementario');

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`paises`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ABW', 'ARUBA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('AFG', 'AFGHANISTAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('AGO', 'ANGOLA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('AIA', 'ANGUILLA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ALB', 'ALBANIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('AND', 'ANDORRA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ANT', 'NETHERLANDS ANTILLES');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ARE', 'UNITED ARAB EMIRATES');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ARG', 'ARGENTINA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ARM', 'ARMENIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ASM', 'AMERICAN SAMOA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ATA', 'ANTARCTICA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ATF', 'FRENCH SOUTHERN TERRITORIES');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ATG', 'ANTIGUA AND BARBUDA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('AUS', 'AUSTRALIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('AUT', 'AUSTRIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('AZE', 'AZERBAIJAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BDI', 'BURUNDI');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BEL', 'BELGIUM');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BEN', 'BENIN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BFA', 'BURKINA FASO');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BGD', 'BANGLADESH');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BGR', 'BULGARIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BHR', 'BAHRAIN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BHS', 'BAHAMAS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BIH', 'BOSNIA AND HERZEGOVINA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BLR', 'BELARUS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BLZ', 'BELIZE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BMU', 'BERMUDA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BOL', 'BOLIVIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BRA', 'BRAZIL');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BRB', 'BARBADOS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BRN', 'BRUNEI');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BTN', 'BHUTAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BVT', 'BOUVET ISLAND');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('BWA', 'BOTSWANA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CAF', 'CENTRAL AFRICAN REPUBLIC');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CAN', 'CANADA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CCK', 'COCOS (KEELING) ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CHE', 'SWITZERLAND');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CHL', 'CHILE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CHN', 'CHINA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CIV', 'CÔTE DIVOIRE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CMR', 'CAMEROON');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('COD', 'CONGO');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('COG', 'CONGO');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('COK', 'COOK ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('COL', 'COLOMBIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('COM', 'COMOROS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CPV', 'CAPE VERDE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CRI', 'COSTA RICA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CUB', 'CUBA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CXR', 'CHRISTMAS ISLAND');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CYM', 'CAYMAN ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CYP', 'CYPRUS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('CZE', 'CZECH REPUBLIC');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('DEU', 'GERMANY');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('DJI', 'DJIBOUTI');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('DMA', 'DOMINICA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('DNK', 'DENMARK');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('DOM', 'DOMINICAN REPUBLIC');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('DZA', 'ALGERIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ECU', 'ECUADOR');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('EGY', 'EGYPT');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ERI', 'ERITREA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ESH', 'WESTERN SAHARA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ESP', 'SPAIN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('EST', 'ESTONIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ETH', 'ETHIOPIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('FIN', 'FINLAND');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('FJI', 'FIJI ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('FLK', 'FALKLAND ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('FRA', 'FRANCE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('FRO', 'FAROE ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('FSM', 'MICRONESIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GAB', 'GABON');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GBR', 'UNITED KINGDOM');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GEO', 'GEORGIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GHA', 'GHANA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GIB', 'GIBRALTAR');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GIN', 'GUINEA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GLP', 'GUADELOUPE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GMB', 'GAMBIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GNB', 'GUINEA-BISSAU');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GNQ', 'EQUATORIAL GUINEA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GRC', 'GREECE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GRD', 'GRENADA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GRL', 'GREENLAND');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GTM', 'GUATEMALA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GUF', 'FRENCH GUIANA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GUM', 'GUAM');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('GUY', 'GUYANA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('HKG', 'HONG KONG');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('HMD', 'HEARD ISLAND AND MCDONALD ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('HND', 'HONDURAS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('HRV', 'CROATIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('HTI', 'HAITI');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('HUN', 'HUNGARY');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('IDN', 'INDONESIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('IND', 'INDIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('IOT', 'BRITISH INDIAN OCEAN TERRITORY');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('IRL', 'IRELAND');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('IRN', 'IRAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('IRQ', 'IRAQ');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ISL', 'ICELAND');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ISR', 'ISRAEL');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ITA', 'ITALY');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('JAM', 'JAMAICA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('JOR', 'JORDAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('JPN', 'JAPAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('KAZ', 'KAZAKSTAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('KEN', 'KENYA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('KGZ', 'KYRGYZSTAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('KHM', 'CAMBODIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('KIR', 'KIRIBATI');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('KNA', 'SAINT KITTS AND NEVIS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('KOR', 'SOUTH KOREA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('KWT', 'KUWAIT');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('LAO', 'LAOS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('LBN', 'LEBANON');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('LBR', 'LIBERIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('LBY', 'LIBYAN ARAB JAMAHIRIYA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('LCA', 'SAINT LUCIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('LIE', 'LIECHTENSTEIN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('LKA', 'SRI LANKA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('LSO', 'LESOTHO');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('LTU', 'LITHUANIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('LUX', 'LUXEMBOURG');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('LVA', 'LATVIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MAC', 'MACAO');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MAR', 'MOROCCO');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MCO', 'MONACO');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MDA', 'MOLDOVA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MDG', 'MADAGASCAR');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MDV', 'MALDIVES');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MEX', 'MEXICO');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MHL', 'MARSHALL ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MKD', 'MACEDONIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MLI', 'MALI');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MLT', 'MALTA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MMR', 'MYANMAR');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MNG', 'MONGOLIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MNP', 'NORTHERN MARIANA ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MOZ', 'MOZAMBIQUE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MRT', 'MAURITANIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MSR', 'MONTSERRAT');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MTQ', 'MARTINIQUE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MUS', 'MAURITIUS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MWI', 'MALAWI');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MYS', 'MALAYSIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('MYT', 'MAYOTTE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('NAM', 'NAMIBIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('NCL', 'NEW CALEDONIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('NER', 'NIGER');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('NFK', 'NORFOLK ISLAND');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('NGA', 'NIGERIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('NIC', 'NICARAGUA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('NIU', 'NIUE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('NLD', 'NETHERLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('NOR', 'NORWAY');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('NPL', 'NEPAL');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('NRU', 'NAURU');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('NZL', 'NEW ZEALAND');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('OMN', 'OMAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('PAK', 'PAKISTAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('PAN', 'PANAMA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('PCN', 'PITCAIRN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('PER', 'PERU');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('PHL', 'PHILIPPINES');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('PLW', 'PALAU');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('PNG', 'PAPUA NEW GUINEA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('POL', 'POLAND');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('PRI', 'PUERTO RICO');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('PRK', 'NORTH KOREA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('PRT', 'PORTUGAL');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('PRY', 'PARAGUAY');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('PSE', 'PALESTINE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('PYF', 'FRENCH POLYNESIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('QAT', 'QATAR');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('REU', 'RÉUNION');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ROM', 'ROMANIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('RUS', 'RUSSIAN FEDERATION');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('RWA', 'RWANDA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SAU', 'SAUDI ARABIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SDN', 'SUDAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SEN', 'SENEGAL');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SGP', 'SINGAPORE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SGS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SHN', 'SAINT HELENA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SJM', 'SVALBARD AND JAN MAYEN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SLB', 'SOLOMON ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SLE', 'SIERRA LEONE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SLV', 'EL SALVADOR');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SMR', 'SAN MARINO');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SOM', 'SOMALIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SPM', 'SAINT PIERRE AND MIQUELON');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('STP', 'SAO TOME AND PRINCIPE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SUR', 'SURINAME');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SVK', 'SLOVAKIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SVN', 'SLOVENIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SWE', 'SWEDEN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SWZ', 'SWAZILAND');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SYC', 'SEYCHELLES');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('SYR', 'SYRIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TCA', 'TURKS AND CAICOS ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TCD', 'CHAD');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TGO', 'TOGO');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('THA', 'THAILAND');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TJK', 'TAJIKISTAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TKL', 'TOKELAU');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TKM', 'TURKMENISTAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TMP', 'EAST TIMOR');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TON', 'TONGA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TTO', 'TRINIDAD AND TOBAGO');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TUN', 'TUNISIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TUR', 'TURKEY');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TUV', 'TUVALU');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TWN', 'TAIWAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('TZA', 'TANZANIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('UGA', 'UGANDA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('UKR', 'UKRAINE');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('UMI', 'UNITED STATES MINOR OUTLYING ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('URY', 'URUGUAY');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('USA', 'UNITED STATES');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('UZB', 'UZBEKISTAN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('VAT', 'HOLY SEE (VATICAN CITY STATE)');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('VCT', 'SAINT VINCENT AND THE GRENADINES');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('VEN', 'VENEZUELA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('VGB', 'VIRGIN ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('VIR', 'VIRGIN ISLANDS');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('VNM', 'VIETNAM');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('VUT', 'VANUATU');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('WLF', 'WALLIS AND FUTUNA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('WSM', 'SAMOA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('YEM', 'YEMEN');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('YUG', 'YUGOSLAVIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ZAF', 'SOUTH AFRICA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ZMB', 'ZAMBIA');
INSERT INTO `pepe_db`.`paises` (`id_paises`, `nombre_pais`) VALUES ('ZWE', 'ZIMBABWE');

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`departamento`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (5, 'ANTIOQUIA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (8, 'ATLANTICO', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (11, 'BOGOTA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (13, 'BOLIVAR', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (15, 'BOYACA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (17, 'CALDAS', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (18, 'CAQUETA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (19, 'CAUCA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (20, 'CESAR', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (23, 'CORDOBA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (25, 'CUNDINAMARCA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (27, 'CHOCO', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (41, 'HUILA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (44, 'LA GUAJIRA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (47, 'MAGDALENA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (50, 'META', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (52, 'NARIÑO', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (54, 'N. DE SANTANDER', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (63, 'QUINDIO', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (66, 'RISARALDA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (68, 'SANTANDER', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (70, 'SUCRE', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (73, 'TOLIMA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (76, 'VALLE DEL CAUCA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (81, 'ARAUCA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (85, 'CASANARE', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (86, 'PUTUMAYO', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (88, 'SAN ANDRES', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (91, 'AMAZONAS', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (94, 'GUAINIA', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (95, 'GUAVIARE', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (97, 'VAUPES', 'COL');
INSERT INTO `pepe_db`.`departamento` (`id_departamento`, `nombre_departamento`, `id_paises`) VALUES (99, 'VICHADA', 'COL');

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`ciudad`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'LETICIA', 91);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (263, 'EL ENCANTO', 91);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (405, 'LA CHORRERA', 91);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (407, 'LA PEDRERA', 91);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (430, 'LA VICTORIA', 91);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (460, 'MIRITI - PARANÁ', 91);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (530, 'PUERTO ALEGRÍA', 91);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (536, 'PUERTO ARICA', 91);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (540, 'PUERTO NARIÑO', 91);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (669, 'PUERTO SANTANDER', 91);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (798, 'TARAPACÁ', 91);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'MEDELLÍN', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (002, 'ABEJORRAL', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (004, 'ABRIAQUÍ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (021, 'ALEJANDRÍA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (030, 'AMAGÁ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (031, 'AMALFI', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (034, 'ANDES', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (036, 'ANGELÓPOLIS', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (038, 'ANGOSTURA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (040, 'ANORÍ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (042, 'SANTAFÉ DE ANTIOQUIA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (044, 'ANZA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (045, 'APARTADÓ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (051, 'ARBOLETES', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (055, 'ARGELIA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (059, 'ARMENIA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (079, 'BARBOSA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (086, 'BELMIRA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (088, 'BELLO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (091, 'BETANIA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (093, 'BETULIA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (101, 'CIUDAD BOLÍVAR', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (107, 'BRICEÑO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (113, 'BURITICÁ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (120, 'CÁCERES', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (125, 'CAICEDO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (129, 'CALDAS', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (134, 'CAMPAMENTO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (138, 'CAÑASGORDAS', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (142, 'CARACOLÍ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (145, 'CARAMANTA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (147, 'CAREPA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (148, 'EL CARMEN DE VIBORAL', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (150, 'CAROLINA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (154, 'CAUCASIA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (172, 'CHIGORODÓ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (190, 'CISNEROS', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (197, 'COCORNÁ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (206, 'CONCEPCIÓN', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (209, 'CONCORDIA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (212, 'COPACABANA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (234, 'DABEIBA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (237, 'DONMATÍAS', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (240, 'EBÉJICO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (250, 'EL BAGRE', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (264, 'ENTRERRIOS', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (266, 'ENVIGADO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (282, 'FREDONIA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (284, 'FRONTINO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (306, 'GIRALDO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (308, 'GIRARDOTA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (310, 'GÓMEZ PLATA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (313, 'GRANADA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (315, 'GUADALUPE', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (318, 'GUARNE', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (321, 'GUATAPE', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (347, 'HELICONIA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (353, 'HISPANIA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (360, 'ITAGUI', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (361, 'ITUANGO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (364, 'JARDÍN', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (368, 'JERICÓ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (376, 'LA CEJA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (380, 'LA ESTRELLA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (390, 'LA PINTADA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (400, 'LA UNIÓN', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (411, 'LIBORINA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (425, 'MACEO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (440, 'MARINILLA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (467, 'MONTEBELLO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (475, 'MURINDÓ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (480, 'MUTATÁ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (483, 'NARIÑO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (490, 'NECOCLÍ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (495, 'NECHÍ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (501, 'OLAYA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (541, 'PEÑOL', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (543, 'PEQUE', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (576, 'PUEBLORRICO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (579, 'PUERTO BERRÍO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (585, 'PUERTO NARE', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (591, 'PUERTO TRIUNFO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (604, 'REMEDIOS', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (607, 'RETIRO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (615, 'RIONEGRO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (628, 'SABANALARGA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (631, 'SABANETA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (642, 'SALGAR', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (647, 'SAN ANDRÉS DE CUERQUÍA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (649, 'SAN CARLOS', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (652, 'SAN FRANCISCO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (656, 'SAN JERÓNIMO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (658, 'SAN JOSÉ DE LA MONTAÑA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (659, 'SAN JUAN DE URABÁ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (660, 'SAN LUIS', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (664, 'SAN PEDRO DE LOS MILAGROS', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (665, 'SAN PEDRO DE URABA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (667, 'SAN RAFAEL', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (670, 'SAN ROQUE', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (674, 'SAN VICENTE', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (679, 'SANTA BÁRBARA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (686, 'SANTA ROSA DE OSOS', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (690, 'SANTO DOMINGO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (697, 'EL SANTUARIO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (736, 'SEGOVIA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (756, 'SONSON', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (761, 'SOPETRÁN', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (789, 'TÁMESIS', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (790, 'TARAZÁ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (792, 'TARSO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (809, 'TITIRIBÍ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (819, 'TOLEDO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (837, 'TURBO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (842, 'URAMITA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (847, 'URRAO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (854, 'VALDIVIA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (856, 'VALPARAÍSO', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (858, 'VEGACHÍ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (861, 'VENECIA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (873, 'VIGÍA DEL FUERTE', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (885, 'YALÍ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (887, 'YARUMAL', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (890, 'YOLOMBÓ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (893, 'YONDÓ', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (895, 'ZARAGOZA', 05);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'ARAUCA', 81);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (065, 'ARAUQUITA', 81);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (220, 'CRAVO NORTE', 81);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (300, 'FORTUL', 81);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (591, 'PUERTO RONDÓN', 81);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (736, 'SARAVENA', 81);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (794, 'TAME', 81);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'BARRANQUILLA', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (078, 'BARANOA', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (137, 'CAMPO DE LA CRUZ', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (141, 'CANDELARIA', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (296, 'GALAPA', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (372, 'JUAN DE ACOSTA', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (421, 'LURUACO', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (433, 'MALAMBO', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (436, 'MANATÍ', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (520, 'PALMAR DE VARELA', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (549, 'PIOJÓ', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (558, 'POLONUEVO', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (560, 'PONEDERA', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (573, 'PUERTO COLOMBIA', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (606, 'REPELÓN', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (634, 'SABANAGRANDE', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (638, 'SABANALARGA', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (675, 'SANTA LUCÍA', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (685, 'SANTO TOMÁS', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (758, 'SOLEDAD', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (770, 'SUAN', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (832, 'TUBARÁ', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (849, 'USIACURÍ', 08);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'BOGOTÁ, D.C.', 11);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'CARTAGENA', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (006, 'ACHÍ', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (030, 'ALTOS DEL ROSARIO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (042, 'ARENAL', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (052, 'ARJONA', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (062, 'ARROYOHONDO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (074, 'BARRANCO DE LOBA', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (140, 'CALAMAR', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (160, 'CANTAGALLO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (188, 'CICUCO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (212, 'CÓRDOBA', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (222, 'CLEMENCIA', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (244, 'EL CARMEN DE BOLÍVAR', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (248, 'EL GUAMO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (268, 'EL PEÑÓN', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (300, 'HATILLO DE LOBA', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (430, 'MAGANGUÉ', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (433, 'MAHATES', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (440, 'MARGARITA', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (442, 'MARÍA LA BAJA', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (458, 'MONTECRISTO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (468, 'MOMPÓS', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (473, 'MORALES', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (490, 'NOROSÍ', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (549, 'PINILLOS', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (580, 'REGIDOR', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (600, 'RÍO VIEJO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (620, 'SAN CRISTÓBAL', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (647, 'SAN ESTANISLAO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (650, 'SAN FERNANDO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (654, 'SAN JACINTO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (655, 'SAN JACINTO DEL CAUCA', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (657, 'SAN JUAN NEPOMUCENO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (667, 'SAN MARTÍN DE LOBA', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (670, 'SAN PABLO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (673, 'SANTA CATALINA', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (683, 'SANTA ROSA', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (688, 'SANTA ROSA DEL SUR', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (744, 'SIMITÍ', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (760, 'SOPLAVIENTO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (780, 'TALAIGUA NUEVO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (810, 'TIQUISIO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (836, 'TURBACO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (838, 'TURBANÁ', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (873, 'VILLANUEVA', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (894, 'ZAMBRANO', 13);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'TUNJA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (022, 'ALMEIDA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (047, 'AQUITANIA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (051, 'ARCABUCO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (087, 'BELÉN', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (090, 'BERBEO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (092, 'BETÉITIVA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (097, 'BOAVITA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (104, 'BOYACÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (106, 'BRICEÑO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (109, 'BUENAVISTA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (114, 'BUSBANZÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (131, 'CALDAS', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (135, 'CAMPOHERMOSO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (162, 'CERINZA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (172, 'CHINAVITA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (176, 'CHIQUINQUIRÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (180, 'CHISCAS', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (183, 'CHITA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (185, 'CHITARAQUE', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (187, 'CHIVATÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (189, 'CIÉNEGA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (204, 'CÓMBITA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (212, 'COPER', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (215, 'CORRALES', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (218, 'COVARACHÍA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (223, 'CUBARÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (224, 'CUCAITA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (226, 'CUÍTIVA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (232, 'CHÍQUIZA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (236, 'CHIVOR', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (238, 'DUITAMA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (244, 'EL COCUY', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (248, 'EL ESPINO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (272, 'FIRAVITOBA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (276, 'FLORESTA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (293, 'GACHANTIVÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (296, 'GAMEZA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (299, 'GARAGOA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (317, 'GUACAMAYAS', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (322, 'GUATEQUE', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (325, 'GUAYATÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (332, 'GÜICÁN', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (362, 'IZA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (367, 'JENESANO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (368, 'JERICÓ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (377, 'LABRANZAGRANDE', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (380, 'LA CAPILLA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (401, 'LA VICTORIA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (403, 'LA UVITA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (407, 'VILLA DE LEYVA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (425, 'MACANAL', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (442, 'MARIPÍ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (455, 'MIRAFLORES', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (464, 'MONGUA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (466, 'MONGUÍ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (469, 'MONIQUIRÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (476, 'MOTAVITA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (480, 'MUZO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (491, 'NOBSA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (494, 'NUEVO COLÓN', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (500, 'OICATÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (507, 'OTANCHE', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (511, 'PACHAVITA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (514, 'PÁEZ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (516, 'PAIPA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (518, 'PAJARITO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (522, 'PANQUEBA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (531, 'PAUNA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (533, 'PAYA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (537, 'PAZ DE RÍO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (542, 'PESCA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (550, 'PISBA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (572, 'PUERTO BOYACÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (580, 'QUÍPAMA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (599, 'RAMIRIQUÍ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (600, 'RÁQUIRA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (621, 'RONDÓN', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (632, 'SABOYÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (638, 'SÁCHICA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (646, 'SAMACÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (660, 'SAN EDUARDO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (664, 'SAN JOSÉ DE PARE', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (667, 'SAN LUIS DE GACENO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (673, 'SAN MATEO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (676, 'SAN MIGUEL DE SEMA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (681, 'SAN PABLO DE BORBUR', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (686, 'SANTANA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (690, 'SANTA MARÍA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (693, 'SANTA ROSA DE VITERBO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (696, 'SANTA SOFÍA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (720, 'SATIVANORTE', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (723, 'SATIVASUR', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (740, 'SIACHOQUE', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (753, 'SOATÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (755, 'SOCOTÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (757, 'SOCHA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (759, 'SOGAMOSO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (761, 'SOMONDOCO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (762, 'SORA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (763, 'SOTAQUIRÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (764, 'SORACÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (774, 'SUSACÓN', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (776, 'SUTAMARCHÁN', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (778, 'SUTATENZA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (790, 'TASCO', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (798, 'TENZA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (804, 'TIBANÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (806, 'TIBASOSA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (808, 'TINJACÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (810, 'TIPACOQUE', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (814, 'TOCA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (816, 'TOGÜÍ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (820, 'TÓPAGA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (822, 'TOTA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (832, 'TUNUNGUÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (835, 'TURMEQUÉ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (837, 'TUTA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (839, 'TUTAZÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (842, 'UMBITA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (861, 'VENTAQUEMADA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (879, 'VIRACACHÁ', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (897, 'ZETAQUIRA', 15);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'MANIZALES', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (013, 'AGUADAS', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (042, 'ANSERMA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (050, 'ARANZAZU', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (088, 'BELALCÁZAR', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (174, 'CHINCHINÁ', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (272, 'FILADELFIA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (380, 'LA DORADA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (388, 'LA MERCED', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (433, 'MANZANARES', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (442, 'MARMATO', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (444, 'MARQUETALIA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (446, 'MARULANDA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (486, 'NEIRA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (495, 'NORCASIA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (513, 'PÁCORA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (524, 'PALESTINA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (541, 'PENSILVANIA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (614, 'RIOSUCIO', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (616, 'RISARALDA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (653, 'SALAMINA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (662, 'SAMANÁ', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (665, 'SAN JOSÉ', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (777, 'SUPÍA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (867, 'VICTORIA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (873, 'VILLAMARÍA', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (877, 'VITERBO', 17);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'FLORENCIA', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (029, 'ALBANIA', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (094, 'BELÉN DE LOS ANDAQUÍES', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (150, 'CARTAGENA DEL CHAIRÁ', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (205, 'CURILLO', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (247, 'EL DONCELLO', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (256, 'EL PAUJIL', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (410, 'LA MONTAÑITA', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (460, 'MILÁN', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (479, 'MORELIA', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (592, 'PUERTO RICO', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (610, 'SAN JOSÉ DEL FRAGUA', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (753, 'SAN VICENTE DEL CAGUÁN', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (756, 'SOLANO', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (785, 'SOLITA', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (860, 'VALPARAÍSO', 18);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'YOPAL', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (010, 'AGUAZUL', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (015, 'CHAMEZA', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (125, 'HATO COROZAL', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (136, 'LA SALINA', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (139, 'MANÍ', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (162, 'MONTERREY', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (225, 'NUNCHÍA', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (230, 'OROCUÉ', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (250, 'PAZ DE ARIPORO', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (263, 'PORE', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (279, 'RECETOR', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (300, 'SABANALARGA', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (315, 'SÁCAMA', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (325, 'SAN LUIS DE PALENQUE', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (400, 'TÁMARA', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (410, 'TAURAMENA', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (430, 'TRINIDAD', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (440, 'VILLANUEVA', 85);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'POPAYÁN', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (022, 'ALMAGUER', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (050, 'ARGELIA', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (075, 'BALBOA', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (100, 'BOLÍVAR', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (110, 'BUENOS AIRES', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (130, 'CAJIBÍO', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (137, 'CALDONO', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (142, 'CALOTO', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (212, 'CORINTO', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (256, 'EL TAMBO', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (290, 'FLORENCIA', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (300, 'GUACHENÉ', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (318, 'GUAPI', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (355, 'INZÁ', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (364, 'JAMBALÓ', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (392, 'LA SIERRA', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (397, 'LA VEGA', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (418, 'LÓPEZ', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (450, 'MERCADERES', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (455, 'MIRANDA', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (473, 'MORALES', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (513, 'PADILLA', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (517, 'PAEZ', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (532, 'PATÍA', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (533, 'PIAMONTE', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (548, 'PIENDAMÓ', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (573, 'PUERTO TEJADA', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (585, 'PURACÉ', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (622, 'ROSAS', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (693, 'SAN SEBASTIÁN', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (698, 'SANTANDER DE QUILICHAO', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (701, 'SANTA ROSA', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (743, 'SILVIA', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (760, 'SOTARA', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (780, 'SUÁREZ', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (785, 'SUCRE', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (807, 'TIMBÍO', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (809, 'TIMBIQUÍ', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (821, 'TORIBIO', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (824, 'TOTORÓ', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (845, 'VILLA RICA', 19);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'VALLEDUPAR', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (011, 'AGUACHICA', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (013, 'AGUSTÍN CODAZZI', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (032, 'ASTREA', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (045, 'BECERRIL', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (060, 'BOSCONIA', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (175, 'CHIMICHAGUA', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (178, 'CHIRIGUANÁ', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (228, 'CURUMANÍ', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (238, 'EL COPEY', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (250, 'EL PASO', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (295, 'GAMARRA', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (310, 'GONZÁLEZ', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (383, 'LA GLORIA', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (400, 'LA JAGUA DE IBIRICO', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (443, 'MANAURE', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (517, 'PAILITAS', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (550, 'PELAYA', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (570, 'PUEBLO BELLO', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (614, 'RÍO DE ORO', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (621, 'LA PAZ', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (710, 'SAN ALBERTO', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (750, 'SAN DIEGO', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (770, 'SAN MARTÍN', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (787, 'TAMALAMEQUE', 20);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'QUIBDÓ', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (006, 'ACANDÍ', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (025, 'ALTO BAUDÓ', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (050, 'ATRATO', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (073, 'BAGADÓ', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (075, 'BAHÍA SOLANO', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (077, 'BAJO BAUDÓ', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (099, 'BOJAYA', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (135, 'EL CANTÓN DEL SAN PABLO', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (150, 'CARMEN DEL DARIÉN', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (160, 'CÉRTEGUI', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (205, 'CONDOTO', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (245, 'EL CARMEN DE ATRATO', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (250, 'EL LITORAL DEL SAN JUAN', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (361, 'ISTMINA', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (372, 'JURADÓ', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (413, 'LLORÓ', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (425, 'MEDIO ATRATO', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (430, 'MEDIO BAUDÓ', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (450, 'MEDIO SAN JUAN', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (491, 'NÓVITA', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (495, 'NUQUÍ', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (580, 'RÍO IRÓ', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (600, 'RÍO QUITO', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (615, 'RIOSUCIO', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (660, 'SAN JOSÉ DEL PALMAR', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (745, 'SIPÍ', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (787, 'TADÓ', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (800, 'UNGUÍA', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (810, 'UNIÓN PANAMERICANA', 27);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'MONTERÍA', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (068, 'AYAPEL', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (079, 'BUENAVISTA', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (090, 'CANALETE', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (162, 'CERETÉ', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (168, 'CHIMÁ', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (182, 'CHINÚ', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (189, 'CIÉNAGA DE ORO', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (300, 'COTORRA', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (350, 'LA APARTADA', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (417, 'LORICA', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (419, 'LOS CÓRDOBAS', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (464, 'MOMIL', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (466, 'MONTELÍBANO', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (500, 'MOÑITOS', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (555, 'PLANETA RICA', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (570, 'PUEBLO NUEVO', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (574, 'PUERTO ESCONDIDO', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (580, 'PUERTO LIBERTADOR', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (586, 'PURÍSIMA', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (660, 'SAHAGÚN', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (670, 'SAN ANDRÉS SOTAVENTO', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (672, 'SAN ANTERO', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (675, 'SAN BERNARDO DEL VIENTO', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (678, 'SAN CARLOS', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (682, 'SAN JOSÉ DE URÉ', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (686, 'SAN PELAYO', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (807, 'TIERRALTA', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (815, 'TUCHÍN', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (855, 'VALENCIA', 23);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'AGUA DE DIOS', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (019, 'ALBÁN', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (035, 'ANAPOIMA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (040, 'ANOLAIMA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (053, 'ARBELÁEZ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (086, 'BELTRÁN', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (095, 'BITUIMA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (099, 'BOJACÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (120, 'CABRERA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (123, 'CACHIPAY', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (126, 'CAJICÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (148, 'CAPARRAPÍ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (151, 'CAQUEZA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (154, 'CARMEN DE CARUPA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (168, 'CHAGUANÍ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (175, 'CHÍA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (178, 'CHIPAQUE', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (181, 'CHOACHÍ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (183, 'CHOCONTÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (200, 'COGUA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (214, 'COTA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (224, 'CUCUNUBÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (245, 'EL COLEGIO', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (258, 'EL PEÑÓN', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (260, 'EL ROSAL', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (269, 'FACATATIVÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (279, 'FOMEQUE', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (281, 'FOSCA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (286, 'FUNZA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (288, 'FÚQUENE', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (290, 'FUSAGASUGÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (293, 'GACHALA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (295, 'GACHANCIPÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (297, 'GACHETÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (299, 'GAMA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (307, 'GIRARDOT', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (312, 'GRANADA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (317, 'GUACHETÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (320, 'GUADUAS', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (322, 'GUASCA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (324, 'GUATAQUÍ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (326, 'GUATAVITA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (328, 'GUAYABAL DE SIQUIMA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (335, 'GUAYABETAL', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (339, 'GUTIÉRREZ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (368, 'JERUSALÉN', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (372, 'JUNÍN', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (377, 'LA CALERA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (386, 'LA MESA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (394, 'LA PALMA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (398, 'LA PEÑA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (402, 'LA VEGA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (407, 'LENGUAZAQUE', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (426, 'MACHETA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (430, 'MADRID', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (436, 'MANTA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (438, 'MEDINA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (473, 'MOSQUERA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (483, 'NARIÑO', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (486, 'NEMOCÓN', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (488, 'NILO', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (489, 'NIMAIMA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (491, 'NOCAIMA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (506, 'VENECIA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (513, 'PACHO', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (518, 'PAIME', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (524, 'PANDI', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (530, 'PARATEBUENO', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (535, 'PASCA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (572, 'PUERTO SALGAR', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (580, 'PULÍ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (592, 'QUEBRADANEGRA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (594, 'QUETAME', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (596, 'QUIPILE', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (599, 'APULO', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (612, 'RICAURTE', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (645, 'SAN ANTONIO DEL TEQUENDAMA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (649, 'SAN BERNARDO', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (653, 'SAN CAYETANO', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (658, 'SAN FRANCISCO', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (662, 'SAN JUAN DE RÍO SECO', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (718, 'SASAIMA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (736, 'SESQUILÉ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (740, 'SIBATÉ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (743, 'SILVANIA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (745, 'SIMIJACA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (754, 'SOACHA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (758, 'SOPÓ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (769, 'SUBACHOQUE', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (772, 'SUESCA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (777, 'SUPATÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (779, 'SUSA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (781, 'SUTATAUSA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (785, 'TABIO', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (793, 'TAUSA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (797, 'TENA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (799, 'TENJO', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (805, 'TIBACUY', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (807, 'TIBIRITA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (815, 'TOCAIMA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (817, 'TOCANCIPÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (823, 'TOPAIPÍ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (839, 'UBALÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (841, 'UBAQUE', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (843, 'VILLA DE SAN DIEGO DE UBATE', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (845, 'UNE', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (851, 'ÚTICA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (862, 'VERGARA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (867, 'VIANÍ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (871, 'VILLAGÓMEZ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (873, 'VILLAPINZÓN', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (875, 'VILLETA', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (878, 'VIOTÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (885, 'YACOPÍ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (898, 'ZIPACÓN', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (899, 'ZIPAQUIRÁ', 25);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'INÍRIDA', 94);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (343, 'BARRANCO MINAS', 94);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (663, 'MAPIRIPANA', 94);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (883, 'SAN FELIPE', 94);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (884, 'PUERTO COLOMBIA', 94);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (885, 'LA GUADALUPE', 94);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (886, 'CACAHUAL', 94);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (887, 'PANA PANA', 94);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (888, 'MORICHAL', 94);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'SAN JOSÉ DEL GUAVIARE', 95);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (015, 'CALAMAR', 95);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (025, 'EL RETORNO', 95);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (200, 'MIRAFLORES', 95);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'NEIVA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (006, 'ACEVEDO', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (013, 'AGRADO', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (016, 'AIPE', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (020, 'ALGECIRAS', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (026, 'ALTAMIRA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (078, 'BARAYA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (132, 'CAMPOALEGRE', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (206, 'COLOMBIA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (244, 'ELÍAS', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (298, 'GARZÓN', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (306, 'GIGANTE', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (319, 'GUADALUPE', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (349, 'HOBO', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (357, 'IQUIRA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (359, 'ISNOS', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (378, 'LA ARGENTINA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (396, 'LA PLATA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (483, 'NÁTAGA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (503, 'OPORAPA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (518, 'PAICOL', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (524, 'PALERMO', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (530, 'PALESTINA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (548, 'PITAL', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (551, 'PITALITO', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (615, 'RIVERA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (660, 'SALADOBLANCO', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (668, 'SAN AGUSTÍN', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (676, 'SANTA MARÍA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (770, 'SUAZA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (791, 'TARQUI', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (797, 'TESALIA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (799, 'TELLO', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (801, 'TERUEL', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (807, 'TIMANÁ', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (872, 'VILLAVIEJA', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (885, 'YAGUARÁ', 41);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'RIOHACHA', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (035, 'ALBANIA', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (078, 'BARRANCAS', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (090, 'DIBULLA', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (098, 'DISTRACCIÓN', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (110, 'EL MOLINO', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (279, 'FONSECA', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (378, 'HATONUEVO', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (420, 'LA JAGUA DEL PILAR', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (430, 'MAICAO', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (560, 'MANAURE', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (650, 'SAN JUAN DEL CESAR', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (847, 'URIBIA', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (855, 'URUMITA', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (874, 'VILLANUEVA', 44);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'SANTA MARTA', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (030, 'ALGARROBO', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (053, 'ARACATACA', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (058, 'ARIGUANÍ', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (161, 'CERRO SAN ANTONIO', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (170, 'CHIVOLO', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (189, 'CIÉNAGA', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (205, 'CONCORDIA', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (245, 'EL BANCO', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (258, 'EL PIÑON', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (268, 'EL RETÉN', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (288, 'FUNDACIÓN', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (318, 'GUAMAL', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (460, 'NUEVA GRANADA', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (541, 'PEDRAZA', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (545, 'PIJIÑO DEL CARMEN', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (551, 'PIVIJAY', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (555, 'PLATO', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (570, 'PUEBLOVIEJO', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (605, 'REMOLINO', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (660, 'SABANAS DE SAN ANGEL', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (675, 'SALAMINA', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (692, 'SAN SEBASTIÁN DE BUENAVISTA', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (703, 'SAN ZENÓN', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (707, 'SANTA ANA', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (720, 'SANTA BÁRBARA DE PINTO', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (745, 'SITIONUEVO', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (798, 'TENERIFE', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (960, 'ZAPAYÁN', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (980, 'ZONA BANANERA', 47);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'VILLAVICENCIO', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (006, 'ACACÍAS', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (110, 'BARRANCA DE UPÍA', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (124, 'CABUYARO', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (150, 'CASTILLA LA NUEVA', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (223, 'CUBARRAL', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (226, 'CUMARAL', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (245, 'EL CALVARIO', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (251, 'EL CASTILLO', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (270, 'EL DORADO', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (287, 'FUENTE DE ORO', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (313, 'GRANADA', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (318, 'GUAMAL', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (325, 'MAPIRIPÁN', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (330, 'MESETAS', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (350, 'LA MACARENA', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (370, 'URIBE', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (400, 'LEJANÍAS', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (450, 'PUERTO CONCORDIA', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (568, 'PUERTO GAITÁN', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (573, 'PUERTO LÓPEZ', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (577, 'PUERTO LLERAS', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (590, 'PUERTO RICO', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (606, 'RESTREPO', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (680, 'SAN CARLOS DE GUAROA', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (683, 'SAN JUAN DE ARAMA', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (686, 'SAN JUANITO', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (689, 'SAN MARTÍN', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (711, 'VISTAHERMOSA', 50);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'PASTO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (019, 'ALBÁN', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (022, 'ALDANA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (036, 'ANCUYÁ', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (051, 'ARBOLEDA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (079, 'BARBACOAS', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (083, 'BELÉN', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (110, 'BUESACO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (203, 'COLÓN', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (207, 'CONSACA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (210, 'CONTADERO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (215, 'CÓRDOBA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (224, 'CUASPUD', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (227, 'CUMBAL', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (233, 'CUMBITARA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (240, 'CHACHAGÜÍ', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (250, 'EL CHARCO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (254, 'EL PEÑOL', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (256, 'EL ROSARIO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (258, 'EL TABLÓN DE GÓMEZ', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (260, 'EL TAMBO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (287, 'FUNES', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (317, 'GUACHUCAL', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (320, 'GUAITARILLA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (323, 'GUALMATÁN', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (352, 'ILES', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (354, 'IMUÉS', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (356, 'IPIALES', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (378, 'LA CRUZ', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (381, 'LA FLORIDA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (385, 'LA LLANADA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (390, 'LA TOLA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (399, 'LA UNIÓN', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (405, 'LEIVA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (411, 'LINARES', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (418, 'LOS ANDES', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (427, 'MAGÜI', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (435, 'MALLAMA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (473, 'MOSQUERA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (480, 'NARIÑO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (490, 'OLAYA HERRERA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (506, 'OSPINA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (520, 'FRANCISCO PIZARRO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (540, 'POLICARPA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (560, 'POTOSÍ', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (565, 'PROVIDENCIA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (573, 'PUERRES', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (585, 'PUPIALES', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (612, 'RICAURTE', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (621, 'ROBERTO PAYÁN', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (678, 'SAMANIEGO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (683, 'SANDONÁ', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (685, 'SAN BERNARDO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (687, 'SAN LORENZO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (693, 'SAN PABLO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (694, 'SAN PEDRO DE CARTAGO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (696, 'SANTA BÁRBARA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (699, 'SANTACRUZ', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (720, 'SAPUYES', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (786, 'TAMINANGO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (788, 'TANGUA', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (835, 'SAN ANDRES DE TUMACO', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (838, 'TÚQUERRES', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (885, 'YACUANQUER', 52);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'CÚCUTA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (003, 'ABREGO', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (051, 'ARBOLEDAS', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (099, 'BOCHALEMA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (109, 'BUCARASICA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (125, 'CÁCOTA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (128, 'CACHIRÁ', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (172, 'CHINÁCOTA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (174, 'CHITAGÁ', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (206, 'CONVENCIÓN', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (223, 'CUCUTILLA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (239, 'DURANIA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (245, 'EL CARMEN', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (250, 'EL TARRA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (261, 'EL ZULIA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (313, 'GRAMALOTE', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (344, 'HACARÍ', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (347, 'HERRÁN', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (377, 'LABATECA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (385, 'LA ESPERANZA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (398, 'LA PLAYA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (405, 'LOS PATIOS', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (418, 'LOURDES', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (480, 'MUTISCUA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (498, 'OCAÑA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (518, 'PAMPLONA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (520, 'PAMPLONITA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (553, 'PUERTO SANTANDER', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (599, 'RAGONVALIA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (660, 'SALAZAR', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (670, 'SAN CALIXTO', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (673, 'SAN CAYETANO', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (680, 'SANTIAGO', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (720, 'SARDINATA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (743, 'SILOS', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (800, 'TEORAMA', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (810, 'TIBÚ', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (820, 'TOLEDO', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (871, 'VILLA CARO', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (874, 'VILLA DEL ROSARIO', 54);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'MOCOA', 86);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (219, 'COLÓN', 86);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (320, 'ORITO', 86);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (568, 'PUERTO ASÍS', 86);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (569, 'PUERTO CAICEDO', 86);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (571, 'PUERTO GUZMÁN', 86);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (573, 'PUERTO LEGUÍZAMO', 86);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (749, 'SIBUNDOY', 86);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (755, 'SAN FRANCISCO', 86);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (757, 'SAN MIGUEL', 86);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (760, 'SANTIAGO', 86);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (865, 'VALLE DEL GUAMUEZ', 86);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (885, 'VILLAGARZÓN', 86);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'ARMENIA', 63);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (111, 'BUENAVISTA', 63);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (130, 'CALARCA', 63);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (190, 'CIRCASIA', 63);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (212, 'CÓRDOBA', 63);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (272, 'FILANDIA', 63);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (302, 'GÉNOVA', 63);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (401, 'LA TEBAIDA', 63);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (470, 'MONTENEGRO', 63);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (548, 'PIJAO', 63);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (594, 'QUIMBAYA', 63);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (690, 'SALENTO', 63);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'PEREIRA', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (045, 'APÍA', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (075, 'BALBOA', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (088, 'BELÉN DE UMBRÍA', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (170, 'DOSQUEBRADAS', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (318, 'GUÁTICA', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (383, 'LA CELIA', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (400, 'LA VIRGINIA', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (440, 'MARSELLA', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (456, 'MISTRATÓ', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (572, 'PUEBLO RICO', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (594, 'QUINCHÍA', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (682, 'SANTA ROSA DE CABAL', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (687, 'SANTUARIO', 66);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'SAN ANDRÉS', 88);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (564, 'PROVIDENCIA', 88);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'BUCARAMANGA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (013, 'AGUADA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (020, 'ALBANIA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (051, 'ARATOCA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (077, 'BARBOSA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (079, 'BARICHARA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (081, 'BARRANCABERMEJA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (092, 'BETULIA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (101, 'BOLÍVAR', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (121, 'CABRERA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (132, 'CALIFORNIA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (147, 'CAPITANEJO', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (152, 'CARCASÍ', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (160, 'CEPITÁ', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (162, 'CERRITO', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (167, 'CHARALÁ', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (169, 'CHARTA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (176, 'CHIMA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (179, 'CHIPATÁ', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (190, 'CIMITARRA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (207, 'CONCEPCIÓN', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (209, 'CONFINES', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (211, 'CONTRATACIÓN', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (217, 'COROMORO', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (229, 'CURITÍ', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (235, 'EL CARMEN DE CHUCURÍ', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (245, 'EL GUACAMAYO', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (250, 'EL PEÑÓN', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (255, 'EL PLAYÓN', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (264, 'ENCINO', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (266, 'ENCISO', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (271, 'FLORIÁN', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (276, 'FLORIDABLANCA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (296, 'GALÁN', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (298, 'GAMBITA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (307, 'GIRÓN', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (318, 'GUACA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (320, 'GUADALUPE', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (322, 'GUAPOTÁ', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (324, 'GUAVATÁ', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (327, 'GÜEPSA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (344, 'HATO', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (368, 'JESÚS MARÍA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (370, 'JORDÁN', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (377, 'LA BELLEZA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (385, 'LANDÁZURI', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (397, 'LA PAZ', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (406, 'LEBRIJA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (418, 'LOS SANTOS', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (425, 'MACARAVITA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (432, 'MÁLAGA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (444, 'MATANZA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (464, 'MOGOTES', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (468, 'MOLAGAVITA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (498, 'OCAMONTE', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (500, 'OIBA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (502, 'ONZAGA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (522, 'PALMAR', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (524, 'PALMAS DEL SOCORRO', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (533, 'PÁRAMO', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (547, 'PIEDECUESTA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (549, 'PINCHOTE', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (572, 'PUENTE NACIONAL', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (573, 'PUERTO PARRA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (575, 'PUERTO WILCHES', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (615, 'RIONEGRO', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (655, 'SABANA DE TORRES', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (669, 'SAN ANDRÉS', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (673, 'SAN BENITO', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (679, 'SAN GIL', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (682, 'SAN JOAQUÍN', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (684, 'SAN JOSÉ DE MIRANDA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (686, 'SAN MIGUEL', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (689, 'SAN VICENTE DE CHUCURÍ', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (705, 'SANTA BÁRBARA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (720, 'SANTA HELENA DEL OPÓN', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (745, 'SIMACOTA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (755, 'SOCORRO', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (770, 'SUAITA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (773, 'SUCRE', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (780, 'SURATÁ', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (820, 'TONA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (855, 'VALLE DE SAN JOSÉ', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (861, 'VÉLEZ', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (867, 'VETAS', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (872, 'VILLANUEVA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (895, 'ZAPATOCA', 68);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'SINCELEJO', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (110, 'BUENAVISTA', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (124, 'CAIMITO', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (204, 'COLOSO', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (215, 'COROZAL', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (221, 'COVEÑAS', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (230, 'CHALÁN', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (233, 'EL ROBLE', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (235, 'GALERAS', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (265, 'GUARANDA', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (400, 'LA UNIÓN', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (418, 'LOS PALMITOS', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (429, 'MAJAGUAL', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (473, 'MORROA', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (508, 'OVEJAS', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (523, 'PALMITO', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (670, 'SAMPUÉS', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (678, 'SAN BENITO ABAD', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (702, 'SAN JUAN DE BETULIA', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (708, 'SAN MARCOS', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (713, 'SAN ONOFRE', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (717, 'SAN PEDRO', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (742, 'SAN LUIS DE SINCÉ', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (771, 'SUCRE', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (820, 'SANTIAGO DE TOLÚ', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (823, 'TOLÚ VIEJO', 70);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'IBAGUÉ', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (024, 'ALPUJARRA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (026, 'ALVARADO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (030, 'AMBALEMA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (043, 'ANZOÁTEGUI', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (055, 'ARMERO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (067, 'ATACO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (124, 'CAJAMARCA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (148, 'CARMEN DE APICALÁ', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (152, 'CASABIANCA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (168, 'CHAPARRAL', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (200, 'COELLO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (217, 'COYAIMA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (226, 'CUNDAY', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (236, 'DOLORES', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (268, 'ESPINAL', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (270, 'FALAN', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (275, 'FLANDES', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (283, 'FRESNO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (319, 'GUAMO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (347, 'HERVEO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (349, 'HONDA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (352, 'ICONONZO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (408, 'LÉRIDA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (411, 'LÍBANO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (443, 'SAN SEBASTIÁN DE MARIQUITA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (449, 'MELGAR', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (461, 'MURILLO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (483, 'NATAGAIMA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (504, 'ORTEGA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (520, 'PALOCABILDO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (547, 'PIEDRAS', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (555, 'PLANADAS', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (563, 'PRADO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (585, 'PURIFICACIÓN', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (616, 'RIOBLANCO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (622, 'RONCESVALLES', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (624, 'ROVIRA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (671, 'SALDAÑA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (675, 'SAN ANTONIO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (678, 'SAN LUIS', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (686, 'SANTA ISABEL', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (770, 'SUÁREZ', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (854, 'VALLE DE SAN JUAN', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (861, 'VENADILLO', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (870, 'VILLAHERMOSA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (873, 'VILLARRICA', 73);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'CALI', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (020, 'ALCALÁ', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (036, 'ANDALUCÍA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (041, 'ANSERMANUEVO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (054, 'ARGELIA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (100, 'BOLÍVAR', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (109, 'BUENAVENTURA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (111, 'GUADALAJARA DE BUGA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (113, 'BUGALAGRANDE', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (122, 'CAICEDONIA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (126, 'CALIMA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (130, 'CANDELARIA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (147, 'CARTAGO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (233, 'DAGUA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (243, 'EL ÁGUILA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (246, 'EL CAIRO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (248, 'EL CERRITO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (250, 'EL DOVIO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (275, 'FLORIDA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (306, 'GINEBRA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (318, 'GUACARÍ', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (364, 'JAMUNDÍ', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (377, 'LA CUMBRE', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (400, 'LA UNIÓN', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (403, 'LA VICTORIA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (497, 'OBANDO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (520, 'PALMIRA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (563, 'PRADERA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (606, 'RESTREPO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (616, 'RIOFRÍO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (622, 'ROLDANILLO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (670, 'SAN PEDRO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (736, 'SEVILLA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (823, 'TORO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (828, 'TRUJILLO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (834, 'TULUÁ', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (845, 'ULLOA', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (863, 'VERSALLES', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (869, 'VIJES', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (890, 'YOTOCO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (892, 'YUMBO', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (895, 'ZARZAL', 76);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'MITÚ', 97);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (161, 'CARURU', 97);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (511, 'PACOA', 97);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (666, 'TARAIRA', 97);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (777, 'PAPUNAUA', 97);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (889, 'YAVARATÉ', 97);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (001, 'PUERTO CARREÑO', 99);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (524, 'LA PRIMAVERA', 99);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (624, 'SANTA ROSALÍA', 99);
INSERT INTO `pepe_db`.`ciudad` (`id_ciudad`, `nombre_ciudad`, `id_departamento`) VALUES (773, 'CUMARIBO', 99);

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`tipo_oferta`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`tipo_oferta` (`id_tipo_oferta`, `tipo_oferta`) VALUES (1, 'Abierta');
INSERT INTO `pepe_db`.`tipo_oferta` (`id_tipo_oferta`, `tipo_oferta`) VALUES (2, 'Cerrada');

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`jornada`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`jornada` (`id_jornada`, `nombre_jornada`) VALUES (1, 'Mañana');
INSERT INTO `pepe_db`.`jornada` (`id_jornada`, `nombre_jornada`) VALUES (2, 'Tarde');
INSERT INTO `pepe_db`.`jornada` (`id_jornada`, `nombre_jornada`) VALUES (3, 'Noche');

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`tipo_evidencia`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`tipo_evidencia` (`id_tipo_evidencia`, `tipo_evidencia`) VALUES (1, 'Conocimiento');
INSERT INTO `pepe_db`.`tipo_evidencia` (`id_tipo_evidencia`, `tipo_evidencia`) VALUES (2, 'Producto');
INSERT INTO `pepe_db`.`tipo_evidencia` (`id_tipo_evidencia`, `tipo_evidencia`) VALUES (3, 'Desempeño');

COMMIT;

-- -----------------------------------------------------
-- Data for table `pepe_db`.`tecnica_didactica`
-- -----------------------------------------------------
START TRANSACTION;
USE `pepe_db`;
INSERT INTO `pepe_db`.`tecnica_didactica` (`id_tecnica_didactica`, `tecnica_didactica`) VALUES (1, 'Foro de Discucion');
INSERT INTO `pepe_db`.`tecnica_didactica` (`id_tecnica_didactica`, `tecnica_didactica`) VALUES (2, 'Exposicion');

COMMIT;
