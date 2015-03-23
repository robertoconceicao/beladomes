CREATE DATABASE  IF NOT EXISTS `belames` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `belames`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: belames
-- ------------------------------------------------------
-- Server version	5.1.67-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `concurso`
--

DROP TABLE IF EXISTS `concurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concurso` (
  `cdConcurso` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nmConcurso` varchar(50) NOT NULL,
  `mesDoConcurso` int(10) unsigned DEFAULT NULL,
  `ano` int(10) unsigned DEFAULT NULL,
  `situacao` int(10) unsigned NOT NULL DEFAULT '1',
  `tipoConcurto` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`cdConcurso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `cdPerfil` bigint(20) unsigned NOT NULL,
  `urlPerfil` varchar(250) NOT NULL,
  `nmUsuario` varchar(200) NOT NULL,
  `urlFoto` varchar(250) NOT NULL,
  `cidade` varchar(250) NOT NULL,
  `idade` int(20) unsigned NOT NULL,
  PRIMARY KEY (`cdPerfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `voto`
--

DROP TABLE IF EXISTS `voto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voto` (
  `cdConcurso` int(10) unsigned NOT NULL,
  `cdPerfil` bigint(20) unsigned NOT NULL,
  `qtVoto` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cdConcurso`,`cdPerfil`),
  KEY `cdPerfil_fk` (`cdPerfil`),
  KEY `cdConcurso_fk_idx` (`cdConcurso`),
  CONSTRAINT `cdPerfil_fk` FOREIGN KEY (`cdPerfil`) REFERENCES `perfil` (`cdPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `cdConcurso_fk` FOREIGN KEY (`cdConcurso`) REFERENCES `concurso` (`cdConcurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'belames'
--

--
-- Dumping routines for database 'belames'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-11  9:54:48

ALTER TABLE PERFIL ADD genero VARCHAR(50) not null;
ALTER TABLE PERFIL ADD foto LONGBLOB null;

INSERT INTO `perfil` VALUES (1,'1','1','1','1',1,'1',NULL),(2,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(3,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(4,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(5,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(6,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(7,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(8,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(9,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(10,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(11,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(12,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(13,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(14,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(15,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(16,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(17,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(18,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(19,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(20,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(21,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(22,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(23,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(24,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(28,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(30,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(50,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(51,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(52,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(53,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(54,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(55,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(56,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(57,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(58,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(59,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(60,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(61,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(62,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(63,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(64,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(65,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(66,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(67,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(68,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(69,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(70,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(71,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(72,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL),(73,'Teste do bob','Teste do bob','Teste do bob','teste',20,'teste',NULL);


INSERT INTO `concurso`(`cdConcurso`, `nmConcurso`, `mesDoConcurso`, `ano`, `situacao`, `tipoConcurto`) VALUES (1,'concurso de teste',0,2015,1,1);