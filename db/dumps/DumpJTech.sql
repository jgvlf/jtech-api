CREATE DATABASE  IF NOT EXISTS `jtech` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jtech`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: jtech
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('34f1f981-11db-4ef5-97b2-d01e82a935c8','cd8673ba8ff67a2547da9dd0f01d7b9e303573cfe853bf98748b799918f71b4e','2023-04-01 18:41:11.859','20230401165833_initialize_database',NULL,NULL,'2023-04-01 18:41:11.263',1),('4de0a40c-3496-476b-a507-afb04993de42','00f5786f7979729775388cdce5f8c27a606f593d736ec05920eb6f17b5862d5f','2023-04-01 18:41:39.480','20230401184139_002_change_columns',NULL,NULL,'2023-04-01 18:41:39.243',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrador`
--

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrador` (
  `idAdministrador` int NOT NULL AUTO_INCREMENT,
  `primiero_nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ultimo_nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idConta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idAdministrador`),
  UNIQUE KEY `idAdministrador_UNIQUE` (`idAdministrador`),
  UNIQUE KEY `idConta_UNIQUE` (`idConta`),
  CONSTRAINT `nome_usuario_a` FOREIGN KEY (`idConta`) REFERENCES `conta` (`nome_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atualiza`
--

DROP TABLE IF EXISTS `atualiza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atualiza` (
  `Funcionario_idFuncionario` int NOT NULL,
  `Produto_idProduto` int NOT NULL,
  PRIMARY KEY (`Funcionario_idFuncionario`,`Produto_idProduto`),
  KEY `fk_Funcionario_has_Produto_Funcionario1_idx` (`Funcionario_idFuncionario`),
  KEY `fk_Funcionario_has_Produto_Produto1_idx` (`Produto_idProduto`),
  CONSTRAINT `fk_Funcionario_has_Produto_Funcionario1` FOREIGN KEY (`Funcionario_idFuncionario`) REFERENCES `funcionario` (`idFuncionario`),
  CONSTRAINT `fk_Funcionario_has_Produto_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atualiza`
--

LOCK TABLES `atualiza` WRITE;
/*!40000 ALTER TABLE `atualiza` DISABLE KEYS */;
/*!40000 ALTER TABLE `atualiza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `CPF` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CNPJ` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `primeiro_nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ultimo_nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fk_idPedido` int DEFAULT NULL,
  `fk_idConta` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_idContato` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fk_idEndereco` int DEFAULT NULL,
  `ano_nascimento` int NOT NULL,
  `dia_nascimento` int NOT NULL,
  `mes_nascimento` int NOT NULL,
  PRIMARY KEY (`CPF`),
  UNIQUE KEY `CPF_UNIQUE` (`CPF`),
  UNIQUE KEY `fk_idContato_UNIQUE` (`fk_idContato`),
  UNIQUE KEY `Conta_nome_usuario_UNIQUE` (`fk_idConta`),
  UNIQUE KEY `Endereco_id_UNIQUE` (`fk_idEndereco`),
  UNIQUE KEY `fk_idPedido_UNIQUE` (`fk_idPedido`),
  UNIQUE KEY `CNPJ_UNIQUE` (`CNPJ`),
  KEY `fk_Cliente_Conta1_idx` (`fk_idConta`),
  KEY `fk_Cliente_Contato1_idx` (`fk_idContato`),
  KEY `fk_Cliente_Endereco1_idx` (`fk_idEndereco`),
  KEY `fk_Cliente_Pedido1_idx` (`fk_idPedido`),
  CONSTRAINT `fk_Cliente_Conta` FOREIGN KEY (`fk_idConta`) REFERENCES `conta` (`nome_usuario`),
  CONSTRAINT `fk_Cliente_Contato` FOREIGN KEY (`fk_idContato`) REFERENCES `contato` (`email`),
  CONSTRAINT `fk_Cliente_Endereco` FOREIGN KEY (`fk_idEndereco`) REFERENCES `endereco` (`id`),
  CONSTRAINT `idPedido` FOREIGN KEY (`fk_idPedido`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('09876543211','34151673682','Ludwig','Koopa',NULL,NULL,NULL,NULL,1997,9,2),('12345678900',NULL,'Lary','Koppa',NULL,NULL,NULL,NULL,1991,10,5),('76844563299','01920739270','Bowser','Koopa',NULL,NULL,NULL,NULL,1979,27,10);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `Produto_idProduto` int NOT NULL,
  `Cliente_CPF` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`Produto_idProduto`,`Cliente_CPF`),
  KEY `fk_Produto_has_Cliente_Cliente1_idx` (`Cliente_CPF`),
  KEY `fk_Produto_has_Cliente_Produto1_idx` (`Produto_idProduto`),
  CONSTRAINT `fk_Produto_has_Cliente_Cliente1` FOREIGN KEY (`Cliente_CPF`) REFERENCES `cliente` (`CPF`),
  CONSTRAINT `fk_Produto_has_Cliente_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta`
--

DROP TABLE IF EXISTS `conta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta` (
  `nome_usuario` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`nome_usuario`),
  UNIQUE KEY `nome_usuário_UNIQUE` (`nome_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta`
--

LOCK TABLES `conta` WRITE;
/*!40000 ALTER TABLE `conta` DISABLE KEYS */;
/*!40000 ALTER TABLE `conta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato`
--

DROP TABLE IF EXISTS `contato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DDI_telefone` int DEFAULT NULL,
  `DDD_telefone` int DEFAULT NULL,
  `telefone` int DEFAULT NULL,
  `DDI_celular` int NOT NULL,
  `DDD_celular` int NOT NULL,
  `celular` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `celular_UNIQUE` (`celular`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato`
--

LOCK TABLES `contato` WRITE;
/*!40000 ALTER TABLE `contato` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contem`
--

DROP TABLE IF EXISTS `contem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contem` (
  `Produto_idProduto` int NOT NULL,
  `Pedido_idPedido` int NOT NULL,
  PRIMARY KEY (`Produto_idProduto`,`Pedido_idPedido`),
  KEY `fk_Produto_has_Pedido_Pedido1_idx` (`Pedido_idPedido`),
  KEY `fk_Produto_has_Pedido_Produto1_idx` (`Produto_idProduto`),
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1` FOREIGN KEY (`Pedido_idPedido`) REFERENCES `pedido` (`idPedido`),
  CONSTRAINT `fk_Produto_has_Pedido_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contem`
--

LOCK TABLES `contem` WRITE;
/*!40000 ALTER TABLE `contem` DISABLE KEYS */;
/*!40000 ALTER TABLE `contem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Rua` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Bairro` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_casa` int NOT NULL,
  `complemento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CEP` int NOT NULL,
  `Cidade` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Estado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Pais` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `complemento_UNIQUE` (`complemento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `idFuncionario` int NOT NULL,
  `primeiro_nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ultimo_nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idConta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE KEY `idFuncionario_UNIQUE` (`idFuncionario`),
  UNIQUE KEY `idConta_UNIQUE` (`idConta`),
  CONSTRAINT `nome_usuario_f` FOREIGN KEY (`idConta`) REFERENCES `conta` (`nome_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerencia_c`
--

DROP TABLE IF EXISTS `gerencia_c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerencia_c` (
  `Cliente_CPF` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Administrador_idAdministrador` int NOT NULL,
  PRIMARY KEY (`Cliente_CPF`,`Administrador_idAdministrador`),
  KEY `fk_Cliente_has_Administrador_Administrador1_idx` (`Administrador_idAdministrador`),
  KEY `fk_Cliente_has_Administrador_Cliente1_idx` (`Cliente_CPF`),
  CONSTRAINT `fk_Cliente_has_Administrador_Administrador1` FOREIGN KEY (`Administrador_idAdministrador`) REFERENCES `administrador` (`idAdministrador`),
  CONSTRAINT `fk_Cliente_has_Administrador_Cliente1` FOREIGN KEY (`Cliente_CPF`) REFERENCES `cliente` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerencia_c`
--

LOCK TABLES `gerencia_c` WRITE;
/*!40000 ALTER TABLE `gerencia_c` DISABLE KEYS */;
/*!40000 ALTER TABLE `gerencia_c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gerencia_f`
--

DROP TABLE IF EXISTS `gerencia_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerencia_f` (
  `Administrador_idAdministrador` int NOT NULL,
  `Funcionario_idFuncionario` int NOT NULL,
  PRIMARY KEY (`Administrador_idAdministrador`,`Funcionario_idFuncionario`),
  KEY `fk_Administrador_has_Funcionario_Administrador1_idx` (`Administrador_idAdministrador`),
  KEY `fk_Administrador_has_Funcionario_Funcionario1_idx` (`Funcionario_idFuncionario`),
  CONSTRAINT `fk_Administrador_has_Funcionario_Administrador1` FOREIGN KEY (`Administrador_idAdministrador`) REFERENCES `administrador` (`idAdministrador`),
  CONSTRAINT `fk_Administrador_has_Funcionario_Funcionario1` FOREIGN KEY (`Funcionario_idFuncionario`) REFERENCES `funcionario` (`idFuncionario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerencia_f`
--

LOCK TABLES `gerencia_f` WRITE;
/*!40000 ALTER TABLE `gerencia_f` DISABLE KEYS */;
/*!40000 ALTER TABLE `gerencia_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `data_entrega` date NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marca` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modelo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `preco` decimal(8,2) NOT NULL,
  `qtd_disponivel` int NOT NULL,
  PRIMARY KEY (`idProduto`),
  UNIQUE KEY `idProduto_UNIQUE` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'jtech'
--

--
-- Dumping routines for database 'jtech'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-13 18:45:12
