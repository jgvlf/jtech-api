-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema jtech
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema jtech
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `jtech` ;
USE `jtech` ;

-- -----------------------------------------------------
-- Table `jtech`.`Contato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtech`.`Contato` ;

CREATE TABLE IF NOT EXISTS `jtech`.`Contato` (
  `email` VARCHAR(255) NOT NULL,
  `DDI_telefone` INT NULL,
  `DDD_telefone` INT NULL,
  `telefone` INT NULL,
  `DDI_celular` INT NOT NULL,
  `DDD_celular` INT NOT NULL,
  `celular` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE INDEX `telefone_UNIQUE` (`telefone` ASC) VISIBLE,
  UNIQUE INDEX `celular_UNIQUE` (`celular` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtech`.`Conta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtech`.`Conta` ;

CREATE TABLE IF NOT EXISTS `jtech`.`Conta` (
  `nome_usuario` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`nome_usuario`),
  UNIQUE INDEX `nome_usuário_UNIQUE` (`nome_usuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtech`.`Endereco`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtech`.`Endereco` ;

CREATE TABLE IF NOT EXISTS `jtech`.`Endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Rua` VARCHAR(255) NOT NULL,
  `Bairro` VARCHAR(255) NOT NULL,
  `numero_casa` INT NOT NULL,
  `complemento` VARCHAR(255) NULL,
  `CEP` INT NOT NULL,
  `Cidade` VARCHAR(255) NOT NULL,
  `Estado` VARCHAR(255) NOT NULL,
  `Pais` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `complemento_UNIQUE` (`complemento` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtech`.`Pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtech`.`Pedido` ;

CREATE TABLE IF NOT EXISTS `jtech`.`Pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `data_entrega` DATE NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`idPedido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtech`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtech`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `jtech`.`Cliente` (
  `CPF` INT NOT NULL,
  `CNPJ` INT NULL,
  `primeiro_nome` VARCHAR(255) NOT NULL,
  `ultimo_nome` VARCHAR(255) NOT NULL,
  `nascimento` DATE NOT NULL,
  `fk_idContato` VARCHAR(255) NOT NULL,
  `fk_idConta` VARCHAR(255) NOT NULL,
  `fk_idEndereco` INT NOT NULL,
  `fk_idPedido` INT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE,
  INDEX `fk_Cliente_Contato1_idx` (`fk_idContato` ASC) VISIBLE,
  UNIQUE INDEX `fk_idContato_UNIQUE` (`fk_idContato` ASC) VISIBLE,
  INDEX `fk_Cliente_Conta1_idx` (`fk_idConta` ASC) VISIBLE,
  INDEX `fk_Cliente_Endereco1_idx` (`fk_idEndereco` ASC) VISIBLE,
  UNIQUE INDEX `Conta_nome_usuario_UNIQUE` (`fk_idConta` ASC) VISIBLE,
  UNIQUE INDEX `Endereco_id_UNIQUE` (`fk_idEndereco` ASC) VISIBLE,
  INDEX `fk_Cliente_Pedido1_idx` (`fk_idPedido` ASC) VISIBLE,
  UNIQUE INDEX `fk_idPedido_UNIQUE` (`fk_idPedido` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_Contato`
    FOREIGN KEY (`fk_idContato`)
    REFERENCES `jtech`.`Contato` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Conta`
    FOREIGN KEY (`fk_idConta`)
    REFERENCES `jtech`.`Conta` (`nome_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Endereco`
    FOREIGN KEY (`fk_idEndereco`)
    REFERENCES `jtech`.`Endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Pedido`
    FOREIGN KEY (`fk_idPedido`)
    REFERENCES `jtech`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtech`.`Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtech`.`Produto` ;

CREATE TABLE IF NOT EXISTS `jtech`.`Produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `marca` VARCHAR(255) NOT NULL,
  `modelo` VARCHAR(255) NOT NULL,
  `preco` DECIMAL(8,2) NOT NULL,
  `qtd_disponivel` INT NOT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE INDEX `idProduto_UNIQUE` (`idProduto` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtech`.`Compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtech`.`Compra` ;

CREATE TABLE IF NOT EXISTS `jtech`.`Compra` (
  `Produto_idProduto` INT NOT NULL,
  `Cliente_CPF` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Cliente_CPF`),
  INDEX `fk_Produto_has_Cliente_Cliente1_idx` (`Cliente_CPF` ASC) VISIBLE,
  INDEX `fk_Produto_has_Cliente_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Cliente_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `jtech`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Cliente_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `jtech`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtech`.`Contem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtech`.`Contem` ;

CREATE TABLE IF NOT EXISTS `jtech`.`Contem` (
  `Produto_idProduto` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`Produto_idProduto`, `Pedido_idPedido`),
  INDEX `fk_Produto_has_Pedido_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  INDEX `fk_Produto_has_Pedido_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Pedido_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `jtech`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `jtech`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtech`.`Administrador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtech`.`Administrador` ;

CREATE TABLE IF NOT EXISTS `jtech`.`Administrador` (
  `idAdministrador` INT NOT NULL AUTO_INCREMENT,
  `primiero_nome` VARCHAR(255) NOT NULL,
  `ultimo_nome` VARCHAR(255) NOT NULL,
  `idConta` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idAdministrador`),
  UNIQUE INDEX `idAdministrador_UNIQUE` (`idAdministrador` ASC) VISIBLE,
  UNIQUE INDEX `idConta_UNIQUE` (`idConta` ASC) VISIBLE,
  CONSTRAINT `nome_usuario_a`
    FOREIGN KEY (`idConta`)
    REFERENCES `jtech`.`Conta` (`nome_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtech`.`Gerencia_C`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtech`.`Gerencia_C` ;

CREATE TABLE IF NOT EXISTS `jtech`.`Gerencia_C` (
  `Cliente_CPF` INT NOT NULL,
  `Administrador_idAdministrador` INT NOT NULL,
  PRIMARY KEY (`Cliente_CPF`, `Administrador_idAdministrador`),
  INDEX `fk_Cliente_has_Administrador_Administrador1_idx` (`Administrador_idAdministrador` ASC) VISIBLE,
  INDEX `fk_Cliente_has_Administrador_Cliente1_idx` (`Cliente_CPF` ASC) VISIBLE,
  CONSTRAINT `fk_Cliente_has_Administrador_Cliente1`
    FOREIGN KEY (`Cliente_CPF`)
    REFERENCES `jtech`.`Cliente` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Administrador_Administrador1`
    FOREIGN KEY (`Administrador_idAdministrador`)
    REFERENCES `jtech`.`Administrador` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtech`.`Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtech`.`Funcionario` ;

CREATE TABLE IF NOT EXISTS `jtech`.`Funcionario` (
  `idFuncionario` INT NOT NULL,
  `primeiro_nome` VARCHAR(255) NOT NULL,
  `ultimo_nome` VARCHAR(255) NOT NULL,
  `idConta` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE INDEX `idFuncionario_UNIQUE` (`idFuncionario` ASC) VISIBLE,
  UNIQUE INDEX `idConta_UNIQUE` (`idConta` ASC) VISIBLE,
  CONSTRAINT `nome_usuario_f`
    FOREIGN KEY (`idConta`)
    REFERENCES `jtech`.`Conta` (`nome_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtech`.`Gerencia_F`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtech`.`Gerencia_F` ;

CREATE TABLE IF NOT EXISTS `jtech`.`Gerencia_F` (
  `Administrador_idAdministrador` INT NOT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  PRIMARY KEY (`Administrador_idAdministrador`, `Funcionario_idFuncionario`),
  INDEX `fk_Administrador_has_Funcionario_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  INDEX `fk_Administrador_has_Funcionario_Administrador1_idx` (`Administrador_idAdministrador` ASC) VISIBLE,
  CONSTRAINT `fk_Administrador_has_Funcionario_Administrador1`
    FOREIGN KEY (`Administrador_idAdministrador`)
    REFERENCES `jtech`.`Administrador` (`idAdministrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administrador_has_Funcionario_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `jtech`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `jtech`.`Atualiza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `jtech`.`Atualiza` ;

CREATE TABLE IF NOT EXISTS `jtech`.`Atualiza` (
  `Funcionario_idFuncionario` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Funcionario_idFuncionario`, `Produto_idProduto`),
  INDEX `fk_Funcionario_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Funcionario_has_Produto_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_has_Produto_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `jtech`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `jtech`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
