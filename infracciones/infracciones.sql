-- MySQL dump 10.13  Distrib 5.6.15, for osx10.7 (x86_64)
--
-- Host: localhost    Database: systra
-- ------------------------------------------------------
-- Server version	5.6.15

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
-- Table structure for table `ACC_ID`
--

DROP TABLE IF EXISTS `ACC_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ACC_ID` (
  `id` int(11) NOT NULL,
  `Folio` int(11) DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `id_unico` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACC_ID`
--

LOCK TABLES `ACC_ID` WRITE;
/*!40000 ALTER TABLE `ACC_ID` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACC_ID` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Ali_Camino`
--

DROP TABLE IF EXISTS `Acc_Ali_Camino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Ali_Camino` (
  `id` int(11) NOT NULL,
  `AliCamino` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Ali_Camino`
--

LOCK TABLES `Acc_Ali_Camino` WRITE;
/*!40000 ALTER TABLE `Acc_Ali_Camino` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Ali_Camino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Cabina2`
--

DROP TABLE IF EXISTS `Acc_Cabina2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Cabina2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folio_evento` int(11) DEFAULT NULL,
  `tipo_evento` varchar(150) NOT NULL,
  `delegacion` varchar(150) NOT NULL,
  `comandancia` varchar(150) NOT NULL,
  `turno` varchar(150) NOT NULL,
  `hora_evento` time DEFAULT NULL,
  `fecha_evento` date DEFAULT NULL,
  `calle1` varchar(300) NOT NULL,
  `calle2` varchar(300) NOT NULL,
  `ref` varchar(300) NOT NULL,
  `observaciones_evento` varchar(600) NOT NULL,
  `reg_inicio` datetime DEFAULT NULL,
  `reg_final` datetime DEFAULT NULL,
  `cabina_completo` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  `id_unico` varchar(150) NOT NULL,
  `nombre_agente_intervino` varchar(255) NOT NULL,
  `gafete_agente_intervino` varchar(255) NOT NULL,
  `unidad_intervino` varchar(255) NOT NULL,
  `sector_intervino` varchar(150) NOT NULL,
  `id_tipo_accidente` varchar(150) NOT NULL,
  `id_clasificacion` varchar(150) NOT NULL,
  `no_veh_participantes` int(11) DEFAULT NULL,
  `no_muertos` int(11) DEFAULT NULL,
  `no_heridos` int(11) DEFAULT NULL,
  `no_detenidos` int(11) DEFAULT NULL,
  `id_pension` int(11) DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `por_llenar` int(11) NOT NULL,
  `colonia` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Cabina2`
--

LOCK TABLES `Acc_Cabina2` WRITE;
/*!40000 ALTER TABLE `Acc_Cabina2` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Cabina2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Cabina_Historial`
--

DROP TABLE IF EXISTS `Acc_Cabina_Historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Cabina_Historial` (
  `id` int(11) NOT NULL,
  `folio_evento` int(11) DEFAULT NULL,
  `tipo_evento` int(11) DEFAULT NULL,
  `delegacion` int(11) DEFAULT NULL,
  `comandancia` int(11) DEFAULT NULL,
  `turno` int(11) DEFAULT NULL,
  `hora_evento` time NOT NULL,
  `fecha_evento` date NOT NULL,
  `localizacion_evento` varchar(300) NOT NULL,
  `observaciones_evento` varchar(600) NOT NULL,
  `reg_inicio` datetime DEFAULT NULL,
  `reg_final` datetime DEFAULT NULL,
  `cabina_completo` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  `id_unico` varchar(150) NOT NULL,
  `tipo_operativo` int(11) DEFAULT NULL,
  `agente_intervino` varchar(150) NOT NULL,
  `unidad_intervino` varchar(150) NOT NULL,
  `sector_intervino` varchar(150) NOT NULL,
  `id_tipo_accidente` int(11) DEFAULT NULL,
  `id_clasificacion` int(11) DEFAULT NULL,
  `no_veh_participantes` int(11) DEFAULT NULL,
  `no_detenidos` int(11) DEFAULT NULL,
  `no_heridos` int(11) DEFAULT NULL,
  `no_muertos` int(11) DEFAULT NULL,
  `id_pension` int(11) DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Cabina_Historial`
--

LOCK TABLES `Acc_Cabina_Historial` WRITE;
/*!40000 ALTER TABLE `Acc_Cabina_Historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Cabina_Historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Clas_Accidente`
--

DROP TABLE IF EXISTS `Acc_Clas_Accidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Clas_Accidente` (
  `id` int(11) NOT NULL,
  `clas` varchar(150) NOT NULL,
  `Activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Clas_Accidente`
--

LOCK TABLES `Acc_Clas_Accidente` WRITE;
/*!40000 ALTER TABLE `Acc_Clas_Accidente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Clas_Accidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Clas_vehiculo`
--

DROP TABLE IF EXISTS `Acc_Clas_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Clas_vehiculo` (
  `id` int(11) NOT NULL,
  `ClasVehic` varchar(150) NOT NULL,
  `Activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Clas_vehiculo`
--

LOCK TABLES `Acc_Clas_vehiculo` WRITE;
/*!40000 ALTER TABLE `Acc_Clas_vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Clas_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Clima`
--

DROP TABLE IF EXISTS `Acc_Clima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Clima` (
  `id` int(11) NOT NULL,
  `clima` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Clima`
--

LOCK TABLES `Acc_Clima` WRITE;
/*!40000 ALTER TABLE `Acc_Clima` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Clima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Convenio`
--

DROP TABLE IF EXISTS `Acc_Convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Convenio` (
  `id` int(11) NOT NULL,
  `id_unico` varchar(300) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `clasificacion` int(11) DEFAULT NULL,
  `tipo_choque` int(11) DEFAULT NULL,
  `intervino` varchar(150) NOT NULL,
  `Unidad_Intervino` varchar(150) NOT NULL,
  `Sector_Intervino` varchar(300) NOT NULL,
  `Delegacion_Intervino` int(11) DEFAULT NULL,
  `superviso` varchar(150) NOT NULL,
  `Unidad_Superviso` varchar(150) NOT NULL,
  `Sector_Superviso` varchar(300) NOT NULL,
  `Delegacion_Superviso` int(11) DEFAULT NULL,
  `calle1` varchar(900) NOT NULL,
  `calle2` varchar(900) NOT NULL,
  `calle3` varchar(900) NOT NULL,
  `frentenumero` varchar(150) NOT NULL,
  `colonia` int(11) DEFAULT NULL,
  `ciudad` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `convenio_tipo` int(11) DEFAULT NULL,
  `convenio_delegacion` int(11) DEFAULT NULL,
  `convenio_comandancia` int(11) DEFAULT NULL,
  `convenio_turno` int(11) DEFAULT NULL,
  `convenio_fecha` datetime DEFAULT NULL,
  `convenio_hora` datetime DEFAULT NULL,
  `Observaciones` longtext NOT NULL,
  `longitud` double DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `NacionalidadC` varchar(150) NOT NULL,
  `pre_parte` int(11) DEFAULT NULL,
  `tipo_evento` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  `id_agente_intervino` int(11) NOT NULL,
  `id_agente_superviso` int(11) NOT NULL,
  `especificar_nose_tipifica` varchar(750) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Convenio`
--

LOCK TABLES `Acc_Convenio` WRITE;
/*!40000 ALTER TABLE `Acc_Convenio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Convenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Convenio_Historial`
--

DROP TABLE IF EXISTS `Acc_Convenio_Historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Convenio_Historial` (
  `id` int(11) NOT NULL,
  `id_unico` varchar(300) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `clasificacion` int(11) DEFAULT NULL,
  `tipo_choque` int(11) DEFAULT NULL,
  `intervino` varchar(150) NOT NULL,
  `Unidad_Intervino` varchar(150) NOT NULL,
  `Sector_Intervino` varchar(300) NOT NULL,
  `Delegacion_Intervino` int(11) DEFAULT NULL,
  `superviso` varchar(150) NOT NULL,
  `Unidad_Superviso` varchar(150) NOT NULL,
  `Sector_Superviso` varchar(300) NOT NULL,
  `Delegacion_Superviso` int(11) DEFAULT NULL,
  `calle1` varchar(900) NOT NULL,
  `calle2` varchar(900) NOT NULL,
  `calle3` varchar(900) NOT NULL,
  `frentenumero` varchar(150) NOT NULL,
  `colonia` int(11) DEFAULT NULL,
  `ciudad` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `convenio_tipo` int(11) DEFAULT NULL,
  `convenio_delegacion` int(11) DEFAULT NULL,
  `convenio_comandancia` int(11) DEFAULT NULL,
  `convenio_turno` int(11) DEFAULT NULL,
  `convenio_fecha` datetime DEFAULT NULL,
  `convenio_hora` datetime DEFAULT NULL,
  `Observaciones` longtext NOT NULL,
  `longitud` double DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `NacionalidadC` varchar(150) NOT NULL,
  `pre_parte` int(11) DEFAULT NULL,
  `tipo_evento` int(11) NOT NULL,
  `activo` int(11) NOT NULL,
  `id_agente_intervino` int(11) NOT NULL,
  `id_agente_superviso` int(11) NOT NULL,
  `especificar_nose_tipifica` varchar(750) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Convenio_Historial`
--

LOCK TABLES `Acc_Convenio_Historial` WRITE;
/*!40000 ALTER TABLE `Acc_Convenio_Historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Convenio_Historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Custodia`
--

DROP TABLE IF EXISTS `Acc_Custodia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Custodia` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Custodia`
--

LOCK TABLES `Acc_Custodia` WRITE;
/*!40000 ALTER TABLE `Acc_Custodia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Custodia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Danos`
--

DROP TABLE IF EXISTS `Acc_Danos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Danos` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Danos`
--

LOCK TABLES `Acc_Danos` WRITE;
/*!40000 ALTER TABLE `Acc_Danos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Danos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Dia_Noche`
--

DROP TABLE IF EXISTS `Acc_Dia_Noche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Dia_Noche` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Dia_Noche`
--

LOCK TABLES `Acc_Dia_Noche` WRITE;
/*!40000 ALTER TABLE `Acc_Dia_Noche` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Dia_Noche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Edo_Conductor`
--

DROP TABLE IF EXISTS `Acc_Edo_Conductor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Edo_Conductor` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Edo_Conductor`
--

LOCK TABLES `Acc_Edo_Conductor` WRITE;
/*!40000 ALTER TABLE `Acc_Edo_Conductor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Edo_Conductor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Edo_Pavimento`
--

DROP TABLE IF EXISTS `Acc_Edo_Pavimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Edo_Pavimento` (
  `id` int(11) NOT NULL,
  `Estado` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Edo_Pavimento`
--

LOCK TABLES `Acc_Edo_Pavimento` WRITE;
/*!40000 ALTER TABLE `Acc_Edo_Pavimento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Edo_Pavimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Edo_ebriedad`
--

DROP TABLE IF EXISTS `Acc_Edo_ebriedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Edo_ebriedad` (
  `id` int(11) NOT NULL,
  `estado` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Edo_ebriedad`
--

LOCK TABLES `Acc_Edo_ebriedad` WRITE;
/*!40000 ALTER TABLE `Acc_Edo_ebriedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Edo_ebriedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Edo_fisico`
--

DROP TABLE IF EXISTS `Acc_Edo_fisico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Edo_fisico` (
  `id` int(11) NOT NULL,
  `estado` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Edo_fisico`
--

LOCK TABLES `Acc_Edo_fisico` WRITE;
/*!40000 ALTER TABLE `Acc_Edo_fisico` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Edo_fisico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Inve_detalles1`
--

DROP TABLE IF EXISTS `Acc_Inve_detalles1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Inve_detalles1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_infraccion` int(11) DEFAULT NULL,
  `folio` int(11) DEFAULT NULL,
  `id_articulo` int(11) DEFAULT NULL,
  `articulo` varchar(750) NOT NULL,
  `parrafo` varchar(750) NOT NULL,
  `concepto` varchar(765) NOT NULL,
  `id_unico` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Inve_detalles1`
--

LOCK TABLES `Acc_Inve_detalles1` WRITE;
/*!40000 ALTER TABLE `Acc_Inve_detalles1` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Inve_detalles1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Inventario`
--

DROP TABLE IF EXISTS `Acc_Inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Inventario` (
  `id` int(11) NOT NULL,
  `id_unico` varchar(150) NOT NULL,
  `id_inventario` varchar(150) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Inventario`
--

LOCK TABLES `Acc_Inventario` WRITE;
/*!40000 ALTER TABLE `Acc_Inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Objetos1`
--

DROP TABLE IF EXISTS `Acc_Objetos1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Objetos1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_unico` varchar(150) NOT NULL,
  `id_objeto` varchar(50) NOT NULL,
  `tipo_objeto` varchar(900) NOT NULL,
  `dueno_objeto` varchar(900) NOT NULL,
  `monto_dano` varchar(900) NOT NULL,
  `tipo_evento` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Objetos1`
--

LOCK TABLES `Acc_Objetos1` WRITE;
/*!40000 ALTER TABLE `Acc_Objetos1` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Objetos1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Regulacion_crucero`
--

DROP TABLE IF EXISTS `Acc_Regulacion_crucero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Regulacion_crucero` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Regulacion_crucero`
--

LOCK TABLES `Acc_Regulacion_crucero` WRITE;
/*!40000 ALTER TABLE `Acc_Regulacion_crucero` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Regulacion_crucero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Responsabilidad`
--

DROP TABLE IF EXISTS `Acc_Responsabilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Responsabilidad` (
  `id` int(11) NOT NULL,
  `responsabilidad` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Responsabilidad`
--

LOCK TABLES `Acc_Responsabilidad` WRITE;
/*!40000 ALTER TABLE `Acc_Responsabilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Responsabilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Restricciones_licencia`
--

DROP TABLE IF EXISTS `Acc_Restricciones_licencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Restricciones_licencia` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Restricciones_licencia`
--

LOCK TABLES `Acc_Restricciones_licencia` WRITE;
/*!40000 ALTER TABLE `Acc_Restricciones_licencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Restricciones_licencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Simbologia`
--

DROP TABLE IF EXISTS `Acc_Simbologia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Simbologia` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Simbologia`
--

LOCK TABLES `Acc_Simbologia` WRITE;
/*!40000 ALTER TABLE `Acc_Simbologia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Simbologia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Tipo_Accidente`
--

DROP TABLE IF EXISTS `Acc_Tipo_Accidente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Tipo_Accidente` (
  `id` int(11) NOT NULL,
  `Tipo` varchar(150) NOT NULL,
  `Activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Tipo_Accidente`
--

LOCK TABLES `Acc_Tipo_Accidente` WRITE;
/*!40000 ALTER TABLE `Acc_Tipo_Accidente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Tipo_Accidente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Vehiculo_Tipo`
--

DROP TABLE IF EXISTS `Acc_Vehiculo_Tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Vehiculo_Tipo` (
  `id` int(11) NOT NULL,
  `Tipo` varchar(150) NOT NULL,
  `status` varchar(3) NOT NULL,
  `Orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Vehiculo_Tipo`
--

LOCK TABLES `Acc_Vehiculo_Tipo` WRITE;
/*!40000 ALTER TABLE `Acc_Vehiculo_Tipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Vehiculo_Tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Vehiculo_Uso`
--

DROP TABLE IF EXISTS `Acc_Vehiculo_Uso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Vehiculo_Uso` (
  `Id` int(11) NOT NULL,
  `Tipo` varchar(150) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Vehiculo_Uso`
--

LOCK TABLES `Acc_Vehiculo_Uso` WRITE;
/*!40000 ALTER TABLE `Acc_Vehiculo_Uso` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Vehiculo_Uso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Vehiculos1`
--

DROP TABLE IF EXISTS `Acc_Vehiculos1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Vehiculos1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_accidente` int(11) DEFAULT NULL,
  `id_preliminar` int(11) DEFAULT NULL,
  `id_unico` varchar(300) NOT NULL,
  `intervino_como` varchar(50) NOT NULL,
  `Clas_vehiculo` varchar(150) NOT NULL,
  `color` varchar(50) NOT NULL,
  `color_detalle` varchar(50) NOT NULL,
  `placa` varchar(50) NOT NULL,
  `modelo` varchar(150) NOT NULL,
  `Marca` varchar(150) NOT NULL,
  `SubMarca` varchar(50) NOT NULL,
  `capacidad` varchar(50) NOT NULL,
  `estadov` varchar(50) NOT NULL,
  `ciudadv` varchar(50) NOT NULL,
  `serie` varchar(150) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `serviciopp` varchar(50) NOT NULL,
  `num_economico` varchar(150) NOT NULL,
  `num_grua` varchar(150) NOT NULL,
  `pension` varchar(50) NOT NULL,
  `conductor_nombre` varchar(250) NOT NULL,
  `conductor_apepaterno` varchar(250) NOT NULL,
  `conductor_apematerno` varchar(250) NOT NULL,
  `conductor_calle` varchar(250) NOT NULL,
  `conductor_colonia` varchar(250) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `conductor_edad` varchar(20) NOT NULL,
  `conductor_edo_licencia` varchar(50) NOT NULL,
  `conductor_pais_licencia` varchar(150) NOT NULL,
  `conductor_num_licencia` varchar(150) NOT NULL,
  `conductor_tipo_licencia` varchar(50) NOT NULL,
  `conductor_rest_licencia` varchar(50) NOT NULL,
  `conductor_fecha_expedida` datetime DEFAULT NULL,
  `conductor_fecha_vigencia` datetime DEFAULT NULL,
  `conductor_sexo` varchar(50) NOT NULL,
  `conductor_detenido_en` varchar(50) NOT NULL,
  `conductor_disposicion` varchar(50) NOT NULL,
  `tipo_dueno` varchar(50) NOT NULL,
  `dueno_nombre` varchar(50) NOT NULL,
  `dueno_calle` varchar(250) NOT NULL,
  `dueno_colonia` varchar(250) NOT NULL,
  `dueno_tel` varchar(150) NOT NULL,
  `dueno_estadop` varchar(50) NOT NULL,
  `dueno_ciudadp` varchar(150) NOT NULL,
  `dueno_cp` varchar(150) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `Especificaciones` varchar(300) NOT NULL,
  `Nacionalidad3` varchar(150) NOT NULL,
  `Nacionalidad2` varchar(150) NOT NULL,
  `Estado_herido` varchar(150) NOT NULL,
  `Especificar_Vehiculo` varchar(150) NOT NULL,
  `Uso_Vehiculo` varchar(150) NOT NULL,
  `dv_num_inventario` varchar(150) NOT NULL,
  `dueno_apepaterno` varchar(150) NOT NULL,
  `dueno_apematerno` varchar(150) NOT NULL,
  `folio_infraccion` int(11) DEFAULT NULL,
  `folio_certificado_medico` int(11) DEFAULT NULL,
  `servicio_publico` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Vehiculos1`
--

LOCK TABLES `Acc_Vehiculos1` WRITE;
/*!40000 ALTER TABLE `Acc_Vehiculos1` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Vehiculos1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_Visibilidad`
--

DROP TABLE IF EXISTS `Acc_Visibilidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_Visibilidad` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_Visibilidad`
--

LOCK TABLES `Acc_Visibilidad` WRITE;
/*!40000 ALTER TABLE `Acc_Visibilidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_Visibilidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_croquis_historial`
--

DROP TABLE IF EXISTS `Acc_croquis_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_croquis_historial` (
  `id` int(11) NOT NULL,
  `id_preliminar` int(11) DEFAULT NULL,
  `id_unico` varchar(300) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `parte_o_convenio` varchar(15) NOT NULL,
  `croquis` varchar(150) NOT NULL,
  `simbologia` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_croquis_historial`
--

LOCK TABLES `Acc_croquis_historial` WRITE;
/*!40000 ALTER TABLE `Acc_croquis_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_croquis_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_involucrados1`
--

DROP TABLE IF EXISTS `Acc_involucrados1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_involucrados1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_accidente` int(11) DEFAULT NULL,
  `id_preliminar` int(11) DEFAULT NULL,
  `id_vehiculo` int(11) DEFAULT NULL,
  `id_unico` varchar(300) NOT NULL,
  `participa_como` int(11) DEFAULT NULL,
  `nombre` varchar(600) NOT NULL,
  `Conductor_ApePaterno` varchar(600) NOT NULL,
  `Conductor_ApeMaterno` varchar(600) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `calle` varchar(600) NOT NULL,
  `colonia` varchar(150) NOT NULL,
  `ciudad` varchar(150) NOT NULL,
  `estado` varchar(150) NOT NULL,
  `nacionalidad` varchar(150) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `edo_ebriedad` int(11) NOT NULL,
  `edo_fisico` int(11) DEFAULT NULL,
  `edo_trasladado_por` varchar(600) NOT NULL,
  `edo_levantado_por` varchar(600) NOT NULL,
  `Estado_herido` varchar(300) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `Nacionalidad4` varchar(150) NOT NULL,
  `conductor_detenido_en` varchar(50) NOT NULL,
  `Conductor_disposicion` varchar(600) NOT NULL,
  `Custodia_de` varchar(300) NOT NULL,
  `intervino_como` varchar(150) NOT NULL,
  `tipo_edad` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_involucrados1`
--

LOCK TABLES `Acc_involucrados1` WRITE;
/*!40000 ALTER TABLE `Acc_involucrados1` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_involucrados1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_preliminar`
--

DROP TABLE IF EXISTS `Acc_preliminar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_preliminar` (
  `id` int(11) NOT NULL,
  `id_unico` varchar(300) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `clasificacion` int(11) DEFAULT NULL,
  `tipo_choque` int(11) DEFAULT NULL,
  `intervino` varchar(150) NOT NULL,
  `Unidad_Intervino` varchar(150) NOT NULL,
  `Sector_Intervino` varchar(300) NOT NULL,
  `Delegacion_Intervino` int(11) DEFAULT NULL,
  `superviso` varchar(150) NOT NULL,
  `Unidad_Superviso` varchar(150) NOT NULL,
  `Sector_Superviso` varchar(300) NOT NULL,
  `Delegacion_Superviso` int(11) DEFAULT NULL,
  `calle1` varchar(900) NOT NULL,
  `calle2` varchar(900) NOT NULL,
  `calle3` varchar(900) NOT NULL,
  `frentenumero` varchar(150) NOT NULL,
  `colonia` int(11) DEFAULT NULL,
  `ciudad` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `convenio_tipo` int(11) DEFAULT NULL,
  `convenio_delegacion` int(11) DEFAULT NULL,
  `convenio_comandancia` int(11) DEFAULT NULL,
  `convenio_turno` int(11) DEFAULT NULL,
  `convenio_fecha` datetime DEFAULT NULL,
  `convenio_hora` datetime DEFAULT NULL,
  `Observaciones` longtext NOT NULL,
  `longitud` double DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `NacionalidadP` varchar(150) NOT NULL,
  `pre_parte` int(11) NOT NULL,
  `tipo_evento` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  `id_agente_intervino` int(11) NOT NULL,
  `id_agente_superviso` int(11) NOT NULL,
  `especificar_nose_tipifica` varchar(750) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_preliminar`
--

LOCK TABLES `Acc_preliminar` WRITE;
/*!40000 ALTER TABLE `Acc_preliminar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_preliminar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_preliminar_historico`
--

DROP TABLE IF EXISTS `Acc_preliminar_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_preliminar_historico` (
  `id` int(11) NOT NULL,
  `id_unico` varchar(300) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `clasificacion` int(11) DEFAULT NULL,
  `tipo_choque` int(11) DEFAULT NULL,
  `intervino` varchar(150) NOT NULL,
  `Unidad_Intervino` varchar(150) NOT NULL,
  `Sector_Intervino` varchar(300) NOT NULL,
  `Delegacion_Intervino` int(11) DEFAULT NULL,
  `superviso` varchar(150) NOT NULL,
  `Unidad_Superviso` varchar(150) NOT NULL,
  `Sector_Superviso` varchar(300) NOT NULL,
  `Delegacion_Superviso` int(11) DEFAULT NULL,
  `calle1` varchar(900) NOT NULL,
  `calle2` varchar(900) NOT NULL,
  `calle3` varchar(900) NOT NULL,
  `frentenumero` varchar(150) NOT NULL,
  `colonia` int(11) DEFAULT NULL,
  `ciudad` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `convenio_tipo` int(11) DEFAULT NULL,
  `convenio_delegacion` int(11) DEFAULT NULL,
  `convenio_comandancia` int(11) DEFAULT NULL,
  `convenio_turno` int(11) DEFAULT NULL,
  `convenio_fecha` datetime DEFAULT NULL,
  `convenio_hora` datetime DEFAULT NULL,
  `Observaciones` longtext NOT NULL,
  `longitud` double DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `NacionalidadP` varchar(150) NOT NULL,
  `id_agente_intervino` int(11) NOT NULL,
  `id_agente_superviso` int(11) NOT NULL,
  `especificar_nose_tipifica` varchar(750) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_preliminar_historico`
--

LOCK TABLES `Acc_preliminar_historico` WRITE;
/*!40000 ALTER TABLE `Acc_preliminar_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_preliminar_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Acc_tipo_evento_historial`
--

DROP TABLE IF EXISTS `Acc_tipo_evento_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acc_tipo_evento_historial` (
  `id` int(11) NOT NULL,
  `id_unico` varchar(300) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `convenio_hora` datetime DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_modifica` datetime DEFAULT NULL,
  `tipo_evento` int(11) DEFAULT NULL,
  `tipo_evento_nvo` int(11) DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `usuario_nvo` varchar(150) NOT NULL,
  `motivo` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acc_tipo_evento_historial`
--

LOCK TABLES `Acc_tipo_evento_historial` WRITE;
/*!40000 ALTER TABLE `Acc_tipo_evento_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acc_tipo_evento_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Accidentes_historico`
--

DROP TABLE IF EXISTS `Accidentes_historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accidentes_historico` (
  `id` int(11) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `id_preliminar` int(11) DEFAULT NULL,
  `id_unico` varchar(300) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `clasificacion` int(11) DEFAULT NULL,
  `causa_primaria` int(11) DEFAULT NULL,
  `causa_secundaria` int(11) DEFAULT NULL,
  `tipo_choque` int(11) DEFAULT NULL,
  `intervino` int(11) DEFAULT NULL,
  `superviso` int(11) DEFAULT NULL,
  `unidad` varchar(150) NOT NULL,
  `calle1` varchar(900) NOT NULL,
  `calle2` varchar(900) NOT NULL,
  `calle3` varchar(900) NOT NULL,
  `colonia` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `ciudad` int(11) DEFAULT NULL,
  `edo_alineacion` int(11) DEFAULT NULL,
  `edo_piso` int(11) DEFAULT NULL,
  `edo_clima` int(11) DEFAULT NULL,
  `edo_regularizacion` int(11) DEFAULT NULL,
  `danos_objetos` int(11) DEFAULT NULL,
  `danos_tipo` varchar(150) NOT NULL,
  `danos_dueno` varchar(150) NOT NULL,
  `danos_monto` varchar(150) NOT NULL,
  `convenio_tipo` int(11) DEFAULT NULL,
  `convenio_numero` int(11) DEFAULT NULL,
  `convenio_delegacion` int(11) DEFAULT NULL,
  `convenio_comandancia` int(11) DEFAULT NULL,
  `convenio_turno` int(11) DEFAULT NULL,
  `convenio_fecha` datetime DEFAULT NULL,
  `convenio_hora` datetime DEFAULT NULL,
  `Observaciones` longtext NOT NULL,
  `usuario` varchar(150) NOT NULL,
  `latitud` double DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `parte_o_convenio` varchar(15) NOT NULL,
  `croquis` varchar(150) NOT NULL,
  `simbologia` longtext NOT NULL,
  `investigacion` longtext NOT NULL,
  `id_agente_intervino` int(11) NOT NULL,
  `id_agente_superviso` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accidentes_historico`
--

LOCK TABLES `Accidentes_historico` WRITE;
/*!40000 ALTER TABLE `Accidentes_historico` DISABLE KEYS */;
/*!40000 ALTER TABLE `Accidentes_historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Asigna_Folios`
--

DROP TABLE IF EXISTS `Asigna_Folios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Asigna_Folios` (
  `folio` int(11) DEFAULT NULL,
  `tipo_evento` int(11) DEFAULT NULL,
  `id_unico` varchar(150) NOT NULL,
  `year_actual` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `maximo` int(11) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Asigna_Folios`
--

LOCK TABLES `Asigna_Folios` WRITE;
/*!40000 ALTER TABLE `Asigna_Folios` DISABLE KEYS */;
/*!40000 ALTER TABLE `Asigna_Folios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AutCompInv`
--

DROP TABLE IF EXISTS `AutCompInv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AutCompInv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `autoridad` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AutCompInv`
--

LOCK TABLES `AutCompInv` WRITE;
/*!40000 ALTER TABLE `AutCompInv` DISABLE KEYS */;
/*!40000 ALTER TABLE `AutCompInv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAT_AGENTES_NEW`
--

DROP TABLE IF EXISTS `CAT_AGENTES_NEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAT_AGENTES_NEW` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_cobro` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `puesto` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAT_AGENTES_NEW`
--

LOCK TABLES `CAT_AGENTES_NEW` WRITE;
/*!40000 ALTER TABLE `CAT_AGENTES_NEW` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAT_AGENTES_NEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAT_Agentes_BORRAR`
--

DROP TABLE IF EXISTS `CAT_Agentes_BORRAR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAT_Agentes_BORRAR` (
  `id` int(11) NOT NULL,
  `no_gafete` int(11) DEFAULT NULL,
  `Nombre` varchar(300) NOT NULL,
  `ApePaterno` varchar(300) NOT NULL,
  `ApeMaterno` varchar(300) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `num_cobro` int(11) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `status` varchar(3) NOT NULL,
  `fecha_elim` datetime DEFAULT NULL,
  `id_delegacion` int(11) DEFAULT NULL,
  `id_comandancia` int(11) DEFAULT NULL,
  `id_turno` int(11) DEFAULT NULL,
  `id_usuario` varchar(60) NOT NULL,
  `Activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAT_Agentes_BORRAR`
--

LOCK TABLES `CAT_Agentes_BORRAR` WRITE;
/*!40000 ALTER TABLE `CAT_Agentes_BORRAR` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAT_Agentes_BORRAR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAT_GPS`
--

DROP TABLE IF EXISTS `CAT_GPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAT_GPS` (
  `id` int(11) NOT NULL,
  `ALIAS` varchar(765) NOT NULL,
  `SIM` varchar(765) NOT NULL,
  `ID_GPS` varchar(765) NOT NULL,
  `TELEFONO` varchar(150) NOT NULL,
  `NO_UNIDAD` varchar(150) NOT NULL,
  `PLACAS` varchar(765) NOT NULL,
  `CONTROL` varchar(765) NOT NULL,
  `ID_DELEGACION` int(11) DEFAULT NULL,
  `DELEGACION` varchar(150) NOT NULL,
  `MARCA` varchar(150) NOT NULL,
  `VEHICULO_TIPO` varchar(30) NOT NULL,
  `ACTIVO` int(11) DEFAULT NULL,
  `ESTATUS` varchar(30) NOT NULL,
  `DEPENDENCIA` varchar(150) NOT NULL,
  `SERIAL` varchar(765) NOT NULL,
  `IMEI` varchar(765) NOT NULL,
  `FECHA_MOVI` datetime DEFAULT NULL,
  `OBSERVACIONES` varchar(765) NOT NULL,
  `REVISION` varchar(765) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAT_GPS`
--

LOCK TABLES `CAT_GPS` WRITE;
/*!40000 ALTER TABLE `CAT_GPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAT_GPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAT_GPS_2008`
--

DROP TABLE IF EXISTS `CAT_GPS_2008`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAT_GPS_2008` (
  `id` int(11) NOT NULL,
  `ALIAS` varchar(450) NOT NULL,
  `SIM` varchar(765) NOT NULL,
  `Id_GPS` varchar(765) NOT NULL,
  `Telefono` varchar(150) NOT NULL,
  `No_Unidad` varchar(159) NOT NULL,
  `Placas` varchar(159) NOT NULL,
  `Control` varchar(150) NOT NULL,
  `Id_Delegacion` int(11) DEFAULT NULL,
  `Delegacion` varchar(765) NOT NULL,
  `Marca` varchar(150) NOT NULL,
  `Vehiculo_Tipo` varchar(765) NOT NULL,
  `activo` int(11) NOT NULL,
  `Estatus` int(11) DEFAULT NULL,
  `Dependencia` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAT_GPS_2008`
--

LOCK TABLES `CAT_GPS_2008` WRITE;
/*!40000 ALTER TABLE `CAT_GPS_2008` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAT_GPS_2008` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAT_GPS_OLD`
--

DROP TABLE IF EXISTS `CAT_GPS_OLD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAT_GPS_OLD` (
  `id` int(11) NOT NULL,
  `ALIAS` varchar(450) NOT NULL,
  `SIM` varchar(765) NOT NULL,
  `Id_GPS` varchar(765) NOT NULL,
  `Telefono` varchar(150) NOT NULL,
  `No_Unidad` varchar(159) NOT NULL,
  `Placas` varchar(159) NOT NULL,
  `Control` varchar(150) NOT NULL,
  `Id_Delegacion` int(11) DEFAULT NULL,
  `Delegacion` varchar(765) NOT NULL,
  `Marca` varchar(150) NOT NULL,
  `Vehiculo_Tipo` varchar(765) NOT NULL,
  `activo` int(11) NOT NULL,
  `Estatus` int(11) DEFAULT NULL,
  `Dependencia` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAT_GPS_OLD`
--

LOCK TABLES `CAT_GPS_OLD` WRITE;
/*!40000 ALTER TABLE `CAT_GPS_OLD` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAT_GPS_OLD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAT_TABULADOR_PRESIDENCIA`
--

DROP TABLE IF EXISTS `CAT_TABULADOR_PRESIDENCIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAT_TABULADOR_PRESIDENCIA` (
  `id` int(11) NOT NULL,
  `ID_TABULADOR` int(11) DEFAULT NULL,
  `TIPCON` varchar(15) NOT NULL,
  `NUMCON` int(11) DEFAULT NULL,
  `ARTFRA` varchar(765) NOT NULL,
  `FECCON` int(11) DEFAULT NULL,
  `DESCON` varchar(765) NOT NULL,
  `SALMIN` int(11) DEFAULT NULL,
  `DIAS` int(11) DEFAULT NULL,
  `IMPORT` double DEFAULT NULL,
  `DCTO` int(11) DEFAULT NULL,
  `ACTIVO` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAT_TABULADOR_PRESIDENCIA`
--

LOCK TABLES `CAT_TABULADOR_PRESIDENCIA` WRITE;
/*!40000 ALTER TABLE `CAT_TABULADOR_PRESIDENCIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAT_TABULADOR_PRESIDENCIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CAT_TABULADOR_PRESIDENCIA_OLD`
--

DROP TABLE IF EXISTS `CAT_TABULADOR_PRESIDENCIA_OLD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CAT_TABULADOR_PRESIDENCIA_OLD` (
  `id` int(11) NOT NULL,
  `ID_TABULADOR` int(11) DEFAULT NULL,
  `TIPCON` varchar(15) NOT NULL,
  `NUMCON` int(11) DEFAULT NULL,
  `ARTFRA` varchar(765) NOT NULL,
  `FECCON` int(11) DEFAULT NULL,
  `DESCON` varchar(765) NOT NULL,
  `SALMIN` int(11) DEFAULT NULL,
  `DIAS` int(11) DEFAULT NULL,
  `IMPORT` double DEFAULT NULL,
  `ACTIVO` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CAT_TABULADOR_PRESIDENCIA_OLD`
--

LOCK TABLES `CAT_TABULADOR_PRESIDENCIA_OLD` WRITE;
/*!40000 ALTER TABLE `CAT_TABULADOR_PRESIDENCIA_OLD` DISABLE KEYS */;
/*!40000 ALTER TABLE `CAT_TABULADOR_PRESIDENCIA_OLD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONTROL_LLAMADAS`
--

DROP TABLE IF EXISTS `CONTROL_LLAMADAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CONTROL_LLAMADAS` (
  `id` int(11) NOT NULL,
  `STATUS` int(11) NOT NULL,
  `QUIEN_LLAMA` varchar(300) NOT NULL,
  `USUARIO` varchar(150) NOT NULL,
  `FECHA_INI` datetime DEFAULT NULL,
  `FECHA_FIN` datetime DEFAULT NULL,
  `ASUNTO` varchar(600) NOT NULL,
  `COMENTARIOS` longtext NOT NULL,
  `ACTIVO` int(11) DEFAULT NULL,
  `PRIORIDAD` int(11) DEFAULT NULL,
  `RESULTADO_OBS` longtext NOT NULL,
  `CON_COPIA` int(11) DEFAULT NULL,
  `ID_ASUNTO` int(11) DEFAULT NULL,
  `DESTINO` int(11) DEFAULT NULL,
  `ID_ORIGEN` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONTROL_LLAMADAS`
--

LOCK TABLES `CONTROL_LLAMADAS` WRITE;
/*!40000 ALTER TABLE `CONTROL_LLAMADAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONTROL_LLAMADAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_Calles`
--

DROP TABLE IF EXISTS `C_Calles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_Calles` (
  `id` int(11) NOT NULL,
  `calle` varchar(150) NOT NULL,
  `id_colonia` int(11) DEFAULT NULL,
  `abreviado` varchar(30) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_Calles`
--

LOCK TABLES `C_Calles` WRITE;
/*!40000 ALTER TABLE `C_Calles` DISABLE KEYS */;
/*!40000 ALTER TABLE `C_Calles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_Comandancias`
--

DROP TABLE IF EXISTS `C_Comandancias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_Comandancias` (
  `id` int(11) NOT NULL,
  `comandancia` varchar(150) NOT NULL,
  `delegacion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_Comandancias`
--

LOCK TABLES `C_Comandancias` WRITE;
/*!40000 ALTER TABLE `C_Comandancias` DISABLE KEYS */;
/*!40000 ALTER TABLE `C_Comandancias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_Delegaciones`
--

DROP TABLE IF EXISTS `C_Delegaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_Delegaciones` (
  `id` int(11) NOT NULL,
  `delegacion` varchar(150) NOT NULL,
  `del_corto` varchar(60) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_Delegaciones`
--

LOCK TABLES `C_Delegaciones` WRITE;
/*!40000 ALTER TABLE `C_Delegaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `C_Delegaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_Delegados`
--

DROP TABLE IF EXISTS `C_Delegados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_Delegados` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `ApePaterno` varchar(150) NOT NULL,
  `ApeMaterno` varchar(150) NOT NULL,
  `Delegacion` int(11) DEFAULT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_Delegados`
--

LOCK TABLES `C_Delegados` WRITE;
/*!40000 ALTER TABLE `C_Delegados` DISABLE KEYS */;
/*!40000 ALTER TABLE `C_Delegados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_Tipo_Vehiculo`
--

DROP TABLE IF EXISTS `C_Tipo_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_Tipo_Vehiculo` (
  `ID` int(11) NOT NULL,
  `Tipo` varchar(150) NOT NULL,
  `Activo` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_Tipo_Vehiculo`
--

LOCK TABLES `C_Tipo_Vehiculo` WRITE;
/*!40000 ALTER TABLE `C_Tipo_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `C_Tipo_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `C_Turnos`
--

DROP TABLE IF EXISTS `C_Turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `C_Turnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `turno` varchar(150) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `C_Turnos`
--

LOCK TABLES `C_Turnos` WRITE;
/*!40000 ALTER TABLE `C_Turnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `C_Turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CapVeh`
--

DROP TABLE IF EXISTS `CapVeh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CapVeh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CapVeh`
--

LOCK TABLES `CapVeh` WRITE;
/*!40000 ALTER TABLE `CapVeh` DISABLE KEYS */;
/*!40000 ALTER TABLE `CapVeh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cat_Hora`
--

DROP TABLE IF EXISTS `Cat_Hora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cat_Hora` (
  `id` int(11) NOT NULL,
  `hora_text` varchar(150) NOT NULL,
  `hora` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cat_Hora`
--

LOCK TABLES `Cat_Hora` WRITE;
/*!40000 ALTER TABLE `Cat_Hora` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cat_Hora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Circulaciones`
--

DROP TABLE IF EXISTS `Circulaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Circulaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `circulacion` varchar(150) NOT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Circulaciones`
--

LOCK TABLES `Circulaciones` WRITE;
/*!40000 ALTER TABLE `Circulaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Circulaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Clasificacion_Incidentes`
--

DROP TABLE IF EXISTS `Clasificacion_Incidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clasificacion_Incidentes` (
  `id` int(11) NOT NULL,
  `Clas_orga` varchar(765) NOT NULL,
  `Clas_predecesor` int(11) DEFAULT NULL,
  `Clas_titulo` varchar(765) NOT NULL,
  `Clas_desc` varchar(3000) NOT NULL,
  `Clas_fecha` datetime DEFAULT NULL,
  `Clas_Ruta` varchar(765) NOT NULL,
  `Otro_ID` int(11) DEFAULT NULL,
  `Tipo` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clasificacion_Incidentes`
--

LOCK TABLES `Clasificacion_Incidentes` WRITE;
/*!40000 ALTER TABLE `Clasificacion_Incidentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Clasificacion_Incidentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Competentes`
--

DROP TABLE IF EXISTS `Competentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Competentes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Competentes`
--

LOCK TABLES `Competentes` WRITE;
/*!40000 ALTER TABLE `Competentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Competentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Corporaciones`
--

DROP TABLE IF EXISTS `Corporaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Corporaciones` (
  `id` int(11) NOT NULL,
  `corporacion` varchar(150) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Corporaciones`
--

LOCK TABLES `Corporaciones` WRITE;
/*!40000 ALTER TABLE `Corporaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Corporaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cubo_Accidentes2010`
--

DROP TABLE IF EXISTS `Cubo_Accidentes2010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cubo_Accidentes2010` (
  `id` int(11) NOT NULL,
  `fecha_registro_real` datetime DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `convenio_hora` datetime DEFAULT NULL,
  `horas` int(11) DEFAULT NULL,
  `delegacion` varchar(150) NOT NULL,
  `comandancia` varchar(150) NOT NULL,
  `turno` varchar(150) NOT NULL,
  `clasificacion` varchar(150) NOT NULL,
  `Tipo` varchar(150) NOT NULL,
  `visibilidad` varchar(150) NOT NULL,
  `dia_noche` varchar(150) NOT NULL,
  `colonia` varchar(765) NOT NULL,
  `Id_calle1` varchar(900) NOT NULL,
  `calle1` varchar(765) NOT NULL,
  `Id_calle2` varchar(900) NOT NULL,
  `calle2` varchar(765) NOT NULL,
  `parte_o_convenio` varchar(15) NOT NULL,
  `AliCamino` varchar(150) NOT NULL,
  `edo_pavimento` varchar(150) NOT NULL,
  `clima` varchar(150) NOT NULL,
  `regulacion` varchar(150) NOT NULL,
  `tipo_calle` varchar(150) NOT NULL,
  `num_carriles` int(11) DEFAULT NULL,
  `sentido_calles` varchar(60) NOT NULL,
  `tipo_regla` varchar(45) NOT NULL,
  `articulo` varchar(750) NOT NULL,
  `parrafo` varchar(750) NOT NULL,
  `concepto` varchar(765) NOT NULL,
  `id_unico` varchar(300) NOT NULL,
  `id_preliminar` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cubo_Accidentes2010`
--

LOCK TABLES `Cubo_Accidentes2010` WRITE;
/*!40000 ALTER TABLE `Cubo_Accidentes2010` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cubo_Accidentes2010` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cubo_AccidentesSinFalta2010`
--

DROP TABLE IF EXISTS `Cubo_AccidentesSinFalta2010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cubo_AccidentesSinFalta2010` (
  `id` int(11) NOT NULL,
  `folio` int(11) DEFAULT NULL,
  `servicio` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `horas` int(11) DEFAULT NULL,
  `delegacion` varchar(150) NOT NULL,
  `comandancia` varchar(150) NOT NULL,
  `turno` varchar(150) NOT NULL,
  `num_cobro_agente` int(11) DEFAULT NULL,
  `infractor_edad` int(11) DEFAULT NULL,
  `infractor_sexo` int(11) DEFAULT NULL,
  `estado` varchar(150) NOT NULL,
  `Clas_vehiculo` int(11) DEFAULT NULL,
  `calle1` varchar(765) NOT NULL,
  `calle2` varchar(765) NOT NULL,
  `colonia` varchar(765) NOT NULL,
  `sp_tipo` varchar(150) NOT NULL,
  `infractor_presente` varchar(3) NOT NULL,
  `se_recogio` varchar(90) NOT NULL,
  `conductor_estado` varchar(150) NOT NULL,
  `tipo_operativo` varchar(150) NOT NULL,
  `tipo_regla` varchar(45) NOT NULL,
  `articulo` varchar(450) NOT NULL,
  `parrafo` varchar(450) NOT NULL,
  `concepto` varchar(900) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cubo_AccidentesSinFalta2010`
--

LOCK TABLES `Cubo_AccidentesSinFalta2010` WRITE;
/*!40000 ALTER TABLE `Cubo_AccidentesSinFalta2010` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cubo_AccidentesSinFalta2010` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cubo_Infracciones2010`
--

DROP TABLE IF EXISTS `Cubo_Infracciones2010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cubo_Infracciones2010` (
  `id` int(11) NOT NULL,
  `folio` int(11) DEFAULT NULL,
  `servicio` int(11) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `horas` int(11) DEFAULT NULL,
  `delegacion` varchar(150) NOT NULL,
  `comandancia` varchar(150) NOT NULL,
  `turno` varchar(150) NOT NULL,
  `num_cobro_agente` int(11) DEFAULT NULL,
  `infractor_edad` int(11) DEFAULT NULL,
  `infractor_sexo` int(11) DEFAULT NULL,
  `estado` varchar(150) NOT NULL,
  `Clas_vehiculo` int(11) DEFAULT NULL,
  `calle1` varchar(765) NOT NULL,
  `calle2` varchar(765) NOT NULL,
  `colonia` varchar(765) NOT NULL,
  `sp_tipo` varchar(150) NOT NULL,
  `infractor_presente` varchar(3) NOT NULL,
  `se_recogio` varchar(90) NOT NULL,
  `conductor_estado` varchar(150) NOT NULL,
  `tipo_operativo` varchar(150) NOT NULL,
  `tipo_regla` varchar(45) NOT NULL,
  `articulo` varchar(450) NOT NULL,
  `parrafo` varchar(450) NOT NULL,
  `concepto` varchar(900) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cubo_Infracciones2010`
--

LOCK TABLES `Cubo_Infracciones2010` WRITE;
/*!40000 ALTER TABLE `Cubo_Infracciones2010` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cubo_Infracciones2010` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cubo_Involucrados2010`
--

DROP TABLE IF EXISTS `Cubo_Involucrados2010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cubo_Involucrados2010` (
  `id` int(11) NOT NULL,
  `id_unico` varchar(300) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_registro_real` datetime DEFAULT NULL,
  `convenio_hora` datetime DEFAULT NULL,
  `horas` int(11) DEFAULT NULL,
  `minutos` int(11) DEFAULT NULL,
  `delegacion` varchar(150) NOT NULL,
  `comandancia` varchar(150) NOT NULL,
  `turno` varchar(150) NOT NULL,
  `clasificacion` varchar(150) NOT NULL,
  `Tipo` varchar(150) NOT NULL,
  `colonia` varchar(765) NOT NULL,
  `calle1` varchar(765) NOT NULL,
  `calle2` varchar(765) NOT NULL,
  `participa` varchar(150) NOT NULL,
  `Estado_herido` varchar(300) NOT NULL,
  `parte_o_convenio` varchar(15) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `estado` varchar(150) NOT NULL,
  `nacionalidad` varchar(150) NOT NULL,
  `sexo` int(11) DEFAULT NULL,
  `Clas_vehiculo` int(11) DEFAULT NULL,
  `serviciopp` int(11) DEFAULT NULL,
  `edo_ebriedad` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cubo_Involucrados2010`
--

LOCK TABLES `Cubo_Involucrados2010` WRITE;
/*!40000 ALTER TABLE `Cubo_Involucrados2010` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cubo_Involucrados2010` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DescVeh`
--

DROP TABLE IF EXISTS `DescVeh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DescVeh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DescVeh`
--

LOCK TABLES `DescVeh` WRITE;
/*!40000 ALTER TABLE `DescVeh` DISABLE KEYS */;
/*!40000 ALTER TABLE `DescVeh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DocumentosInv`
--

DROP TABLE IF EXISTS `DocumentosInv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DocumentosInv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DocumentosInv`
--

LOCK TABLES `DocumentosInv` WRITE;
/*!40000 ALTER TABLE `DocumentosInv` DISABLE KEYS */;
/*!40000 ALTER TABLE `DocumentosInv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DocumentosLiberacion`
--

DROP TABLE IF EXISTS `DocumentosLiberacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DocumentosLiberacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DocumentosLiberacion`
--

LOCK TABLES `DocumentosLiberacion` WRITE;
/*!40000 ALTER TABLE `DocumentosLiberacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `DocumentosLiberacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EnCustodia`
--

DROP TABLE IF EXISTS `EnCustodia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EnCustodia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custodia` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EnCustodia`
--

LOCK TABLES `EnCustodia` WRITE;
/*!40000 ALTER TABLE `EnCustodia` DISABLE KEYS */;
/*!40000 ALTER TABLE `EnCustodia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FolioInfraccion`
--

DROP TABLE IF EXISTS `FolioInfraccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FolioInfraccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block` int(11) DEFAULT NULL,
  `folio` int(11) DEFAULT NULL,
  `comandancia` varchar(50) NOT NULL,
  `delegacion` varchar(50) NOT NULL,
  `turno` varchar(50) NOT NULL,
  `fecha_liberacion` datetime DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `usuario` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FolioInfraccion`
--

LOCK TABLES `FolioInfraccion` WRITE;
/*!40000 ALTER TABLE `FolioInfraccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `FolioInfraccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Bicicleta`
--

DROP TABLE IF EXISTS `Inv_Bicicleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Bicicleta` (
  `id` int(11) NOT NULL,
  `Id_Inventario` int(11) NOT NULL,
  `Folio_inf_acc` int(11) DEFAULT NULL,
  `Id_temp` varchar(150) NOT NULL,
  `Espejo` int(11) DEFAULT NULL,
  `Freno_Tras` int(11) DEFAULT NULL,
  `Parrilla` int(11) DEFAULT NULL,
  `Frenos_Del` int(11) DEFAULT NULL,
  `Salpicadera` int(11) DEFAULT NULL,
  `Cables` int(11) DEFAULT NULL,
  `Rin_Del` int(11) DEFAULT NULL,
  `Tapones` int(11) DEFAULT NULL,
  `Llanta_Del` int(11) DEFAULT NULL,
  `Gomas` int(11) DEFAULT NULL,
  `Suspencion` int(11) DEFAULT NULL,
  `Rayos` int(11) DEFAULT NULL,
  `Amortiguadores` int(11) DEFAULT NULL,
  `Rueda` int(11) DEFAULT NULL,
  `Manubrios` int(11) DEFAULT NULL,
  `T_Asiento` int(11) DEFAULT NULL,
  `Punios` int(11) DEFAULT NULL,
  `Asiento` int(11) DEFAULT NULL,
  `Salpicadera_Tras` int(11) DEFAULT NULL,
  `Claxon` int(11) DEFAULT NULL,
  `Llanta_Tras` int(11) DEFAULT NULL,
  `Dinamo` int(11) DEFAULT NULL,
  `Rin_Tras` int(11) DEFAULT NULL,
  `Cuernos` int(11) DEFAULT NULL,
  `Cambio_Tras` int(11) DEFAULT NULL,
  `Rotor` int(11) DEFAULT NULL,
  `Ejes` int(11) DEFAULT NULL,
  `Candado` int(11) DEFAULT NULL,
  `Masas` int(11) DEFAULT NULL,
  `Estrella` int(11) DEFAULT NULL,
  `Diablos_Del` int(11) DEFAULT NULL,
  `Cambio_Cent` int(11) DEFAULT NULL,
  `Diablos_Tras` int(11) DEFAULT NULL,
  `Palancas` int(11) DEFAULT NULL,
  `Pedales` int(11) DEFAULT NULL,
  `Poste` int(11) DEFAULT NULL,
  `Cuadro` int(11) DEFAULT NULL,
  `Zeta` int(11) DEFAULT NULL,
  `Orquilla` int(11) DEFAULT NULL,
  `Descripcion` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Bicicleta`
--

LOCK TABLES `Inv_Bicicleta` WRITE;
/*!40000 ALTER TABLE `Inv_Bicicleta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Bicicleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cajuela`
--

DROP TABLE IF EXISTS `Inv_Cajuela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cajuela` (
  `Id_Inventario` int(11) NOT NULL,
  `Folio_inf_acc` int(11) DEFAULT NULL,
  `Id_temp` varchar(150) NOT NULL,
  `Cajuela` longtext NOT NULL,
  `Gato` int(11) DEFAULT NULL,
  `Llaves` int(11) DEFAULT NULL,
  `Desarmadores` int(11) DEFAULT NULL,
  `Pinzas` int(11) DEFAULT NULL,
  `Cruzeta` int(11) DEFAULT NULL,
  `Banderas` int(11) DEFAULT NULL,
  `Palancas` int(11) DEFAULT NULL,
  `Extintor` int(11) DEFAULT NULL,
  `Llantas_Ref` int(11) DEFAULT NULL,
  `Otros` longtext NOT NULL,
  `Gasolina` longtext NOT NULL,
  PRIMARY KEY (`Id_Inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cajuela`
--

LOCK TABLES `Inv_Cajuela` WRITE;
/*!40000 ALTER TABLE `Inv_Cajuela` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cajuela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cat_Agencias_MP`
--

DROP TABLE IF EXISTS `Inv_Cat_Agencias_MP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cat_Agencias_MP` (
  `id` int(11) NOT NULL,
  `ID_UBICACION` int(11) DEFAULT NULL,
  `AGENCIA` varchar(150) NOT NULL,
  `ACTIVO` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cat_Agencias_MP`
--

LOCK TABLES `Inv_Cat_Agencias_MP` WRITE;
/*!40000 ALTER TABLE `Inv_Cat_Agencias_MP` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cat_Agencias_MP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cat_Agencias_Ubicacion`
--

DROP TABLE IF EXISTS `Inv_Cat_Agencias_Ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cat_Agencias_Ubicacion` (
  `id` int(11) NOT NULL,
  `Ubicacion` varchar(150) NOT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cat_Agencias_Ubicacion`
--

LOCK TABLES `Inv_Cat_Agencias_Ubicacion` WRITE;
/*!40000 ALTER TABLE `Inv_Cat_Agencias_Ubicacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cat_Agencias_Ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cat_Dependencias`
--

DROP TABLE IF EXISTS `Inv_Cat_Dependencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cat_Dependencias` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cat_Dependencias`
--

LOCK TABLES `Inv_Cat_Dependencias` WRITE;
/*!40000 ALTER TABLE `Inv_Cat_Dependencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cat_Dependencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cat_Deposito`
--

DROP TABLE IF EXISTS `Inv_Cat_Deposito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cat_Deposito` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cat_Deposito`
--

LOCK TABLES `Inv_Cat_Deposito` WRITE;
/*!40000 ALTER TABLE `Inv_Cat_Deposito` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cat_Deposito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cat_Documentos`
--

DROP TABLE IF EXISTS `Inv_Cat_Documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cat_Documentos` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(300) NOT NULL,
  `Descripcion` varchar(300) NOT NULL,
  `Activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cat_Documentos`
--

LOCK TABLES `Inv_Cat_Documentos` WRITE;
/*!40000 ALTER TABLE `Inv_Cat_Documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cat_Documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cat_Estatus`
--

DROP TABLE IF EXISTS `Inv_Cat_Estatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cat_Estatus` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(30) NOT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cat_Estatus`
--

LOCK TABLES `Inv_Cat_Estatus` WRITE;
/*!40000 ALTER TABLE `Inv_Cat_Estatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cat_Estatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cat_Liberacion_Cajas`
--

DROP TABLE IF EXISTS `Inv_Cat_Liberacion_Cajas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cat_Liberacion_Cajas` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cat_Liberacion_Cajas`
--

LOCK TABLES `Inv_Cat_Liberacion_Cajas` WRITE;
/*!40000 ALTER TABLE `Inv_Cat_Liberacion_Cajas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cat_Liberacion_Cajas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cat_Liberacion_Vehiculo`
--

DROP TABLE IF EXISTS `Inv_Cat_Liberacion_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cat_Liberacion_Vehiculo` (
  `id` int(11) NOT NULL,
  `tipo_persona` varchar(150) NOT NULL,
  `tipo_vehiculo` varchar(150) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cat_Liberacion_Vehiculo`
--

LOCK TABLES `Inv_Cat_Liberacion_Vehiculo` WRITE;
/*!40000 ALTER TABLE `Inv_Cat_Liberacion_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cat_Liberacion_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cat_Liberacion_Vehiculo_Doctos`
--

DROP TABLE IF EXISTS `Inv_Cat_Liberacion_Vehiculo_Doctos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cat_Liberacion_Vehiculo_Doctos` (
  `id` int(11) NOT NULL,
  `id_tipo_vehiculo` int(11) DEFAULT NULL,
  `inciso` varchar(3) NOT NULL,
  `Descripcion` varchar(750) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cat_Liberacion_Vehiculo_Doctos`
--

LOCK TABLES `Inv_Cat_Liberacion_Vehiculo_Doctos` WRITE;
/*!40000 ALTER TABLE `Inv_Cat_Liberacion_Vehiculo_Doctos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cat_Liberacion_Vehiculo_Doctos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cat_Lugar`
--

DROP TABLE IF EXISTS `Inv_Cat_Lugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cat_Lugar` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cat_Lugar`
--

LOCK TABLES `Inv_Cat_Lugar` WRITE;
/*!40000 ALTER TABLE `Inv_Cat_Lugar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cat_Lugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cat_Lugar_Pago`
--

DROP TABLE IF EXISTS `Inv_Cat_Lugar_Pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cat_Lugar_Pago` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(300) NOT NULL,
  `Descripcion` varchar(300) NOT NULL,
  `Activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cat_Lugar_Pago`
--

LOCK TABLES `Inv_Cat_Lugar_Pago` WRITE;
/*!40000 ALTER TABLE `Inv_Cat_Lugar_Pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cat_Lugar_Pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cat_Resguardo`
--

DROP TABLE IF EXISTS `Inv_Cat_Resguardo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cat_Resguardo` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Id_Dependencia` int(11) DEFAULT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cat_Resguardo`
--

LOCK TABLES `Inv_Cat_Resguardo` WRITE;
/*!40000 ALTER TABLE `Inv_Cat_Resguardo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cat_Resguardo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Cat_Tipo_Vehiculo`
--

DROP TABLE IF EXISTS `Inv_Cat_Tipo_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Cat_Tipo_Vehiculo` (
  `id` int(11) NOT NULL,
  `Tipo` varchar(150) NOT NULL,
  `Orden` int(11) DEFAULT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Cat_Tipo_Vehiculo`
--

LOCK TABLES `Inv_Cat_Tipo_Vehiculo` WRITE;
/*!40000 ALTER TABLE `Inv_Cat_Tipo_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Cat_Tipo_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Costado_Derecho`
--

DROP TABLE IF EXISTS `Inv_Costado_Derecho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Costado_Derecho` (
  `Id_Inventario` int(11) NOT NULL,
  `Folio_inf_acc` int(11) DEFAULT NULL,
  `Id_temp` varchar(150) NOT NULL,
  `Costado_Derecho` longtext NOT NULL,
  `Salpicadera_Del_D` int(11) DEFAULT NULL,
  `Puerta_Del_D` int(11) DEFAULT NULL,
  `Puerta_Tras_D` int(11) DEFAULT NULL,
  `Espejo_Lateral_D` int(11) DEFAULT NULL,
  `Cristales_Puertas_D` int(11) DEFAULT NULL,
  `Aletas_D` int(11) DEFAULT NULL,
  `Salpicadera_Tras_D` int(11) DEFAULT NULL,
  `Manijas_D` int(11) DEFAULT NULL,
  `Llantas_D` int(11) DEFAULT NULL,
  `Rines_D` int(11) DEFAULT NULL,
  `Polveras_D` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Costado_Derecho`
--

LOCK TABLES `Inv_Costado_Derecho` WRITE;
/*!40000 ALTER TABLE `Inv_Costado_Derecho` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Costado_Derecho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Costado_Izquierdo`
--

DROP TABLE IF EXISTS `Inv_Costado_Izquierdo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Costado_Izquierdo` (
  `Id_Inventario` int(11) NOT NULL,
  `Folio_inf_acc` int(11) DEFAULT NULL,
  `Id_temp` varchar(150) NOT NULL,
  `Costado_Izquierdo` longtext NOT NULL,
  `Salpicadera_Del_I` int(11) DEFAULT NULL,
  `Puerta_Del_I` int(11) DEFAULT NULL,
  `Puerta_Tras_I` int(11) DEFAULT NULL,
  `Espejo_Lateral_I` int(11) DEFAULT NULL,
  `Cristales_Puertas_I` int(11) DEFAULT NULL,
  `Aletas_I` int(11) DEFAULT NULL,
  `Salpicadera_Tras_I` int(11) DEFAULT NULL,
  `Manijas_I` int(11) DEFAULT NULL,
  `Llantas_I` int(11) DEFAULT NULL,
  `Rines_I` int(11) DEFAULT NULL,
  `Polveras_I` int(11) DEFAULT NULL,
  `Molduras_I` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Costado_Izquierdo`
--

LOCK TABLES `Inv_Costado_Izquierdo` WRITE;
/*!40000 ALTER TABLE `Inv_Costado_Izquierdo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Costado_Izquierdo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Interior`
--

DROP TABLE IF EXISTS `Inv_Interior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Interior` (
  `Id_Inventario` int(11) NOT NULL,
  `Folio_inf_acc` int(11) DEFAULT NULL,
  `Id_temp` varchar(150) NOT NULL,
  `Interior` longtext NOT NULL,
  `Guantera` int(11) DEFAULT NULL,
  `Chapa` int(11) DEFAULT NULL,
  `Perilla_Vel` int(11) DEFAULT NULL,
  `Direccion` int(11) DEFAULT NULL,
  `Freno_Mano` int(11) DEFAULT NULL,
  `Encendedor` int(11) DEFAULT NULL,
  `Tapiceria` int(11) DEFAULT NULL,
  `Cabeceras` int(11) DEFAULT NULL,
  `Coderas` int(11) DEFAULT NULL,
  `Direccionales` int(11) DEFAULT NULL,
  `Tablero` int(11) DEFAULT NULL,
  `Retrovisor` int(11) DEFAULT NULL,
  `Tapetes` int(11) DEFAULT NULL,
  `Perilla_Luces` int(11) DEFAULT NULL,
  `Cenicero` int(11) DEFAULT NULL,
  `Manijas_Manivelas` int(11) DEFAULT NULL,
  `Radio_Int` int(11) DEFAULT NULL,
  `Estereo` int(11) DEFAULT NULL,
  `Ecualizador` int(11) DEFAULT NULL,
  `Fuente_Poder` int(11) DEFAULT NULL,
  `Biceras` int(11) DEFAULT NULL,
  `Bocinas` int(11) DEFAULT NULL,
  `Bafles` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Interior`
--

LOCK TABLES `Inv_Interior` WRITE;
/*!40000 ALTER TABLE `Inv_Interior` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Interior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Motocicleta`
--

DROP TABLE IF EXISTS `Inv_Motocicleta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Motocicleta` (
  `id` int(11) NOT NULL,
  `Id_Inventario` int(11) NOT NULL,
  `Folio_inf_acc` int(11) DEFAULT NULL,
  `Id_temp` varchar(150) NOT NULL,
  `Tanque` int(11) DEFAULT NULL,
  `Rin_Tras` int(11) DEFAULT NULL,
  `Tapon_gas` int(11) DEFAULT NULL,
  `Llanta_Tras` int(11) DEFAULT NULL,
  `Parabrisas` int(11) DEFAULT NULL,
  `Freno_Tras` int(11) DEFAULT NULL,
  `Espejo` int(11) DEFAULT NULL,
  `Luces_Tras` int(11) DEFAULT NULL,
  `Faro_Del` int(11) DEFAULT NULL,
  `Calavera` int(11) DEFAULT NULL,
  `Parrilla` int(11) DEFAULT NULL,
  `Motor` int(11) DEFAULT NULL,
  `Salpicadera` int(11) DEFAULT NULL,
  `Cabezas` int(11) DEFAULT NULL,
  `Rin_Del` int(11) DEFAULT NULL,
  `Tapas` int(11) DEFAULT NULL,
  `Llanta_Del` int(11) DEFAULT NULL,
  `Pastillas` int(11) DEFAULT NULL,
  `Frenos_Del` int(11) DEFAULT NULL,
  `Encendido` int(11) DEFAULT NULL,
  `Luces_Del` int(11) DEFAULT NULL,
  `Carburador` int(11) DEFAULT NULL,
  `Suspencion` int(11) DEFAULT NULL,
  `Cables` int(11) DEFAULT NULL,
  `Amortiguadores` int(11) DEFAULT NULL,
  `Marcha` int(11) DEFAULT NULL,
  `Manubrios` int(11) DEFAULT NULL,
  `Palanca` int(11) DEFAULT NULL,
  `Punios` int(11) DEFAULT NULL,
  `Bobina` int(11) DEFAULT NULL,
  `Radiador` int(11) DEFAULT NULL,
  `Bateria` int(11) DEFAULT NULL,
  `Filtro` int(11) DEFAULT NULL,
  `T_Aceite` int(11) DEFAULT NULL,
  `Asiento` int(11) DEFAULT NULL,
  `Salpicadera_Tras` int(11) DEFAULT NULL,
  `Tapas_costado` int(11) DEFAULT NULL,
  `Periquete` int(11) DEFAULT NULL,
  `Spoiler` int(11) DEFAULT NULL,
  `Colilla` int(11) DEFAULT NULL,
  `Tablillas` int(11) DEFAULT NULL,
  `Claxon` longtext NOT NULL,
  `Tapiceria` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Motocicleta`
--

LOCK TABLES `Inv_Motocicleta` WRITE;
/*!40000 ALTER TABLE `Inv_Motocicleta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Motocicleta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Motor`
--

DROP TABLE IF EXISTS `Inv_Motor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Motor` (
  `Id_Inventario` int(11) NOT NULL,
  `Folio_inf_acc` int(11) DEFAULT NULL,
  `Id_temp` varchar(150) NOT NULL,
  `Acc_Motor` varchar(150) NOT NULL,
  `Carburador` varchar(150) NOT NULL,
  `Claxon` varchar(150) NOT NULL,
  `Bujias` varchar(150) NOT NULL,
  `Tapa_dist` varchar(150) NOT NULL,
  `Compresora` varchar(150) NOT NULL,
  `Tapon_aceite` varchar(150) NOT NULL,
  `Marca` varchar(150) NOT NULL,
  `Bobina` varchar(150) NOT NULL,
  `Radiador` varchar(150) NOT NULL,
  `Adicionales` varchar(150) NOT NULL,
  `Filtro_aire` varchar(150) NOT NULL,
  `Bayoneta` varchar(150) NOT NULL,
  `Alternador` varchar(150) NOT NULL,
  `Marcha` varchar(150) NOT NULL,
  `Bateria` varchar(150) NOT NULL,
  `Bandas` varchar(150) NOT NULL,
  `Calefaccion` varchar(150) NOT NULL,
  `Mangueras` varchar(150) NOT NULL,
  PRIMARY KEY (`Id_Inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Motor`
--

LOCK TABLES `Inv_Motor` WRITE;
/*!40000 ALTER TABLE `Inv_Motor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Motor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Parte_Frente`
--

DROP TABLE IF EXISTS `Inv_Parte_Frente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Parte_Frente` (
  `Id_Inventario` int(11) NOT NULL,
  `Folio_inf_acc` int(11) DEFAULT NULL,
  `Id_temp` varchar(150) NOT NULL,
  `Parte_Frente` longtext NOT NULL,
  `Cofre` int(11) DEFAULT NULL,
  `Toldo` int(11) DEFAULT NULL,
  `Parabrisas` int(11) DEFAULT NULL,
  `Luz_Izq` int(11) DEFAULT NULL,
  `Luz_Der` int(11) DEFAULT NULL,
  `Parrilla` int(11) DEFAULT NULL,
  `Defensa_Del` int(11) DEFAULT NULL,
  `Facia_Del` int(11) DEFAULT NULL,
  `Tablillas_Del` int(11) DEFAULT NULL,
  `Cuarto_Izq_Del` int(11) DEFAULT NULL,
  `Cuarto_Der_Del` int(11) DEFAULT NULL,
  `Limpiadores_Del` int(11) DEFAULT NULL,
  `Emblemas` int(11) DEFAULT NULL,
  `Spoilers` int(11) DEFAULT NULL,
  `Faros_Niebla` int(11) DEFAULT NULL,
  `Burrera` int(11) DEFAULT NULL,
  `Accesorios_Del` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Parte_Frente`
--

LOCK TABLES `Inv_Parte_Frente` WRITE;
/*!40000 ALTER TABLE `Inv_Parte_Frente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Parte_Frente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Parte_Posterior`
--

DROP TABLE IF EXISTS `Inv_Parte_Posterior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Parte_Posterior` (
  `Id_Inventario` int(11) NOT NULL,
  `Folio_inf_acc` int(11) DEFAULT NULL,
  `Id_temp` varchar(150) NOT NULL,
  `Parte_Posterior` longtext NOT NULL,
  `Cajuela_Tras` int(11) DEFAULT NULL,
  `Medallon` int(11) DEFAULT NULL,
  `Calavera_Der` int(11) DEFAULT NULL,
  `Calavera_Izq` int(11) DEFAULT NULL,
  `Cuarto_Der` int(11) DEFAULT NULL,
  `Cuarto_Izq` int(11) DEFAULT NULL,
  `Defensa_Tras` int(11) DEFAULT NULL,
  `Facia_Tras` int(11) DEFAULT NULL,
  `Tablillas_Tras` int(11) DEFAULT NULL,
  `Limpiadores_Tras` int(11) DEFAULT NULL,
  `Emblema` int(11) DEFAULT NULL,
  `Spoiler` int(11) DEFAULT NULL,
  `Colilla_Escape` int(11) DEFAULT NULL,
  `Accesorios_Tras` int(11) DEFAULT NULL,
  `Stop_Tras` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_Inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Parte_Posterior`
--

LOCK TABLES `Inv_Parte_Posterior` WRITE;
/*!40000 ALTER TABLE `Inv_Parte_Posterior` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Parte_Posterior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inv_Salida_Vehiculo`
--

DROP TABLE IF EXISTS `Inv_Salida_Vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inv_Salida_Vehiculo` (
  `id` int(11) NOT NULL,
  `Id_temp` varchar(150) NOT NULL,
  `Id_Inventario` int(11) DEFAULT NULL,
  `Id_tipo_vehiculo` int(11) DEFAULT NULL,
  `Id_documento` int(11) DEFAULT NULL,
  `Docto_nombre` varchar(240) NOT NULL,
  `Docto_apepaterno` varchar(150) NOT NULL,
  `Docto_apematerno` varchar(150) NOT NULL,
  `Docto_escaneado` varchar(600) NOT NULL,
  `Observaciones` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inv_Salida_Vehiculo`
--

LOCK TABLES `Inv_Salida_Vehiculo` WRITE;
/*!40000 ALTER TABLE `Inv_Salida_Vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inv_Salida_Vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventario_Vehiculo1`
--

DROP TABLE IF EXISTS `Inventario_Vehiculo1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventario_Vehiculo1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folio_inventario` int(11) DEFAULT NULL,
  `folio_infraccion` int(11) DEFAULT NULL,
  `folio_accidente` int(11) DEFAULT NULL,
  `delegacion` varchar(50) NOT NULL,
  `comandancia` varchar(50) NOT NULL,
  `turno` varchar(50) NOT NULL,
  `motivo_de_recojimiento` varchar(50) NOT NULL,
  `tipo_servicio` varchar(50) NOT NULL,
  `fecha_incid` date DEFAULT NULL,
  `fecha_captura` date DEFAULT NULL,
  `fecha_modifica` date DEFAULT NULL,
  `pension_hora` time DEFAULT NULL,
  `pension_fecha` varchar(150) NOT NULL,
  `calle1` varchar(250) NOT NULL,
  `calle2` varchar(250) NOT NULL,
  `colonia` varchar(250) NOT NULL,
  `interior` varchar(250) NOT NULL,
  `exterior` varchar(250) NOT NULL,
  `depositado_en` varchar(250) NOT NULL,
  `clas_vehiculo` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `marca` varchar(300) NOT NULL,
  `submarca` varchar(300) NOT NULL,
  `veh_modelo` varchar(300) NOT NULL,
  `veh_color` varchar(50) NOT NULL,
  `veh_color_detalle` varchar(750) NOT NULL,
  `veh_placas` varchar(300) NOT NULL,
  `veh_serie` varchar(750) NOT NULL,
  `infractor_nombre` varchar(750) NOT NULL,
  `infractor_apepaterno` varchar(750) NOT NULL,
  `infractor_apematerno` varchar(750) NOT NULL,
  `pension_lugar` varchar(50) NOT NULL,
  `pension_recibido_por` varchar(750) NOT NULL,
  `pension_transportado_por` varchar(750) NOT NULL,
  `pension_transportado_pension` varchar(50) NOT NULL,
  `pension_transportado_unidad_transito` varchar(50) NOT NULL,
  `usuario` varchar(150) NOT NULL,
  `salida_nombre` varchar(750) NOT NULL,
  `salida_apepaterno` varchar(150) NOT NULL,
  `salida_apematerno` varchar(150) NOT NULL,
  `liberacion_fecha` date DEFAULT NULL,
  `liberacion_hora` time NOT NULL,
  `liberacion_entrega` varchar(750) NOT NULL,
  `liberacion_recibe` varchar(750) NOT NULL,
  `liberacion_lugar` varchar(750) NOT NULL,
  `agencia_mp` int(11) DEFAULT NULL,
  `folio_consignacion` varchar(150) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  `corporacion` varchar(50) NOT NULL,
  `folio_agente` varchar(250) NOT NULL,
  `nombre_agente` varchar(250) NOT NULL,
  `persona_fisica` varchar(50) NOT NULL,
  `persona_moral` varchar(50) NOT NULL,
  `recibo_pago` varchar(50) NOT NULL,
  `autoridad_competente` varchar(50) NOT NULL,
  `numero_economico` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventario_Vehiculo1`
--

LOCK TABLES `Inventario_Vehiculo1` WRITE;
/*!40000 ALTER TABLE `Inventario_Vehiculo1` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inventario_Vehiculo1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventario_Vehiculo_Cancelado`
--

DROP TABLE IF EXISTS `Inventario_Vehiculo_Cancelado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventario_Vehiculo_Cancelado` (
  `id` int(11) NOT NULL,
  `Id_temp` varchar(300) NOT NULL,
  `Id_Inventario` int(11) NOT NULL,
  `Folio_inf_acc` int(11) DEFAULT NULL,
  `Folio_accidente` int(11) DEFAULT NULL,
  `delegacion` int(11) DEFAULT NULL,
  `comandancia` int(11) DEFAULT NULL,
  `turno` int(11) DEFAULT NULL,
  `tipo_servicio` int(11) DEFAULT NULL,
  `Tipo_Agentes` int(11) DEFAULT NULL,
  `Folio_Agentes` varchar(750) NOT NULL,
  `Infrac_Accid` varchar(750) NOT NULL,
  `Id_Resguardo` int(11) DEFAULT NULL,
  `Fecha_Incid` datetime DEFAULT NULL,
  `Fecha_captura` datetime DEFAULT NULL,
  `Fecha_modifica` datetime DEFAULT NULL,
  `Fecha_salida` datetime DEFAULT NULL,
  `Pension_Hora` varchar(150) NOT NULL,
  `ID_CALLE` int(11) DEFAULT NULL,
  `ID_CALLE2` int(11) DEFAULT NULL,
  `ID_COLONIA` int(11) DEFAULT NULL,
  `Interior` varchar(750) NOT NULL,
  `Exterior` varchar(750) NOT NULL,
  `Depositado_en` int(11) DEFAULT NULL,
  `Observaciones` longtext NOT NULL,
  `Vehiculo_Llaves` int(11) DEFAULT NULL,
  `Clas_vehiculo` int(11) DEFAULT NULL,
  `Marca` varchar(300) NOT NULL,
  `Submarca` varchar(300) NOT NULL,
  `veh_modelo` varchar(300) NOT NULL,
  `veh_color` int(11) DEFAULT NULL,
  `veh_color_detalle` varchar(750) NOT NULL,
  `Vehiculo_Motor` varchar(750) NOT NULL,
  `veh_placas` varchar(300) NOT NULL,
  `sin_placa` int(11) DEFAULT NULL,
  `sp_num_tarjeton` varchar(750) NOT NULL,
  `veh_serie` varchar(750) NOT NULL,
  `no_visible` int(11) DEFAULT NULL,
  `sp_tipo` varchar(750) NOT NULL,
  `infractor_nombre` varchar(750) NOT NULL,
  `infractor_apepaterno` varchar(750) NOT NULL,
  `infractor_apematerno` varchar(750) NOT NULL,
  `Pension_Lugar` int(11) DEFAULT NULL,
  `Pension_Recibido_por` varchar(750) NOT NULL,
  `Pension_Llevado_por` varchar(750) NOT NULL,
  `Pension_grua` int(11) DEFAULT NULL,
  `Pension_transito` int(11) DEFAULT NULL,
  `Pension_Particular` int(11) DEFAULT NULL,
  `Pension_PropiosM` int(11) DEFAULT NULL,
  `Usuario` varchar(150) NOT NULL,
  `Pago` double DEFAULT NULL,
  `Pago_numero` varchar(150) NOT NULL,
  `Pago_caja` int(11) DEFAULT NULL,
  `Pago_fecha` datetime DEFAULT NULL,
  `Pago_Lugar` int(11) DEFAULT NULL,
  `Pension_Pago` double DEFAULT NULL,
  `Pension_Pago_maniobra` double DEFAULT NULL,
  `Pension_Pago_numero` varchar(150) NOT NULL,
  `Pension_Pago_caja` int(11) DEFAULT NULL,
  `Pension_Pago_fecha` datetime DEFAULT NULL,
  `Pension_Pago_Lugar` int(11) DEFAULT NULL,
  `salida_nombre` varchar(750) NOT NULL,
  `salida_apepaterno` varchar(150) NOT NULL,
  `salida_apematerno` varchar(150) NOT NULL,
  `salida_direccion` varchar(750) NOT NULL,
  `Tipo_docto` int(11) DEFAULT NULL,
  `Tipo_docto_detalle` varchar(150) NOT NULL,
  `Tipo_docto_vigencia` datetime DEFAULT NULL,
  `Liberacion_fecha` datetime DEFAULT NULL,
  `Liberacion_entrega` varchar(750) NOT NULL,
  `Liberacion_recibe` varchar(750) NOT NULL,
  `Agencia_MP` int(11) DEFAULT NULL,
  `Folio_Consignacion` varchar(150) NOT NULL,
  `Activo` int(11) DEFAULT NULL,
  `Fecha_Cancelado` datetime DEFAULT NULL,
  `Motivo_Cancelado` longtext NOT NULL,
  `Usuario_Cancelado` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventario_Vehiculo_Cancelado`
--

LOCK TABLES `Inventario_Vehiculo_Cancelado` WRITE;
/*!40000 ALTER TABLE `Inventario_Vehiculo_Cancelado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inventario_Vehiculo_Cancelado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventario_Vehiculo_Extemporaneo`
--

DROP TABLE IF EXISTS `Inventario_Vehiculo_Extemporaneo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventario_Vehiculo_Extemporaneo` (
  `id` int(11) NOT NULL,
  `Id_temp` varchar(300) NOT NULL,
  `Id_Inventario` int(11) DEFAULT NULL,
  `Fecha_extemporanea` datetime DEFAULT NULL,
  `Usuario` varchar(150) NOT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventario_Vehiculo_Extemporaneo`
--

LOCK TABLES `Inventario_Vehiculo_Extemporaneo` WRITE;
/*!40000 ALTER TABLE `Inventario_Vehiculo_Extemporaneo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inventario_Vehiculo_Extemporaneo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LugarLiberacion`
--

DROP TABLE IF EXISTS `LugarLiberacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LugarLiberacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LugarLiberacion`
--

LOCK TABLES `LugarLiberacion` WRITE;
/*!40000 ALTER TABLE `LugarLiberacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `LugarLiberacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mps`
--

DROP TABLE IF EXISTS `Mps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mps` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mps`
--

LOCK TABLES `Mps` WRITE;
/*!40000 ALTER TABLE `Mps` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NoCarriles`
--

DROP TABLE IF EXISTS `NoCarriles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NoCarriles` (
  `id` int(11) NOT NULL,
  `carriles` varchar(150) NOT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NoCarriles`
--

LOCK TABLES `NoCarriles` WRITE;
/*!40000 ALTER TABLE `NoCarriles` DISABLE KEYS */;
/*!40000 ALTER TABLE `NoCarriles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Noticias`
--

DROP TABLE IF EXISTS `Noticias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(300) NOT NULL,
  `noticia` varchar(300) NOT NULL,
  `capturado_por` varchar(300) NOT NULL,
  `tags` varchar(300) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `archivos` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Noticias`
--

LOCK TABLES `Noticias` WRITE;
/*!40000 ALTER TABLE `Noticias` DISABLE KEYS */;
/*!40000 ALTER TABLE `Noticias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLACAS_PRESIDENCIA`
--

DROP TABLE IF EXISTS `PLACAS_PRESIDENCIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PLACAS_PRESIDENCIA` (
  `TIPPPLACA` varchar(30) NOT NULL,
  `PLACA` varchar(30) NOT NULL,
  `NOMBRE` varchar(150) NOT NULL,
  `DOMICI` varchar(120) NOT NULL,
  `COLONIA` varchar(90) NOT NULL,
  `SUBMAR` varchar(90) NOT NULL,
  `MODELO` varchar(30) NOT NULL,
  `NUMSER` varchar(60) NOT NULL,
  `NUMCIL` varchar(30) NOT NULL,
  `NUMCAL` varchar(30) NOT NULL,
  `FECVER` int(11) DEFAULT NULL,
  `STATU` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLACAS_PRESIDENCIA`
--

LOCK TABLES `PLACAS_PRESIDENCIA` WRITE;
/*!40000 ALTER TABLE `PLACAS_PRESIDENCIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLACAS_PRESIDENCIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REMISION_EVENTOS`
--

DROP TABLE IF EXISTS `REMISION_EVENTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REMISION_EVENTOS` (
  `id` int(11) NOT NULL,
  `ID_UNICO` varchar(150) NOT NULL,
  `ID_TIPO_INCIDENTE` int(11) DEFAULT NULL,
  `FOLIO_CABINA` int(11) DEFAULT NULL,
  `LONGITUD` double DEFAULT NULL,
  `LATITUD` double DEFAULT NULL,
  `ID_ESTADO` int(11) DEFAULT NULL,
  `ID_MUNICIPIO` int(11) DEFAULT NULL,
  `ID_COLONIA` int(11) DEFAULT NULL,
  `COLONIA` varchar(450) NOT NULL,
  `ID_CALLE` int(11) DEFAULT NULL,
  `CALLE` varchar(450) NOT NULL,
  `ID_CALLE2` int(11) DEFAULT NULL,
  `CALLE2` varchar(450) NOT NULL,
  `DESCRIPCION` longtext NOT NULL,
  `ID_CLASIFICACION` int(11) DEFAULT NULL,
  `UNIDAD` varchar(150) NOT NULL,
  `FECHA_HORA` datetime DEFAULT NULL,
  `IDS` varchar(750) NOT NULL,
  `TOTAL` double DEFAULT NULL,
  `TARJETA` varchar(750) NOT NULL,
  `PLACAS` varchar(150) NOT NULL,
  `PLACAS_ESTATALES` int(11) DEFAULT NULL,
  `NO_LICENCIA` varchar(150) NOT NULL,
  `FECHA_REG` datetime NOT NULL,
  `USUARIO` varchar(150) NOT NULL,
  `ACTIVO` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REMISION_EVENTOS`
--

LOCK TABLES `REMISION_EVENTOS` WRITE;
/*!40000 ALTER TABLE `REMISION_EVENTOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REMISION_EVENTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REMISION_PERSONAS`
--

DROP TABLE IF EXISTS `REMISION_PERSONAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REMISION_PERSONAS` (
  `id` int(11) NOT NULL,
  `ID_UNICO_PERSONA` varchar(150) NOT NULL,
  `ID_UNICO` varchar(150) NOT NULL,
  `ID_MM` int(11) NOT NULL,
  `FOLIO_CABINA` int(11) DEFAULT NULL,
  `APEPATERNO` varchar(450) NOT NULL,
  `APEMATERNO` varchar(450) NOT NULL,
  `NOMBRE` varchar(450) NOT NULL,
  `ESTATURA` double DEFAULT NULL,
  `ID_NACIONALIDAD` int(11) DEFAULT NULL,
  `NACIONALIDAD` varchar(150) NOT NULL,
  `ID_ESTADO` int(11) DEFAULT NULL,
  `ESTADO` varchar(450) NOT NULL,
  `ID_CIUDAD` int(11) DEFAULT NULL,
  `CIUDAD` varchar(450) NOT NULL,
  `ID_COLONIA` int(11) DEFAULT NULL,
  `COLONIA` varchar(600) NOT NULL,
  `ID_CALLE` int(11) DEFAULT NULL,
  `CALLE` varchar(600) NOT NULL,
  `ID_CALLE2` int(11) DEFAULT NULL,
  `CALLE2` varchar(600) NOT NULL,
  `EXTERIOR` varchar(150) NOT NULL,
  `INTERIOR` varchar(150) NOT NULL,
  `REFERENCIA` varchar(750) NOT NULL,
  `SEXO` varchar(30) NOT NULL,
  `ID_ESCOLARIDAD` int(11) DEFAULT NULL,
  `ESCOLARIDAD` varchar(300) NOT NULL,
  `TEL1` varchar(150) NOT NULL,
  `TEL2` varchar(150) NOT NULL,
  `ID_OCUPACION` int(11) DEFAULT NULL,
  `OCUPACION` varchar(150) NOT NULL,
  `EDAD` int(11) DEFAULT NULL,
  `ID_IDENTIFICACION` int(11) DEFAULT NULL,
  `IDENTIFICACION` varchar(150) NOT NULL,
  `ALIAS` varchar(300) NOT NULL,
  `FECHA_NACIMIENTO` datetime DEFAULT NULL,
  `ID_EDO_CIVIL` int(11) DEFAULT NULL,
  `SUELDO` double DEFAULT NULL,
  `NOMBRE_PADRE` varchar(900) NOT NULL,
  `NOMBRE_MADRE` varchar(900) NOT NULL,
  `S_PARTICULARES` longtext NOT NULL,
  `VESTIMENTA` longtext NOT NULL,
  `FOTO` varchar(150) NOT NULL,
  `FECHA_REG` datetime NOT NULL,
  `USUARIO` varchar(150) NOT NULL,
  `ACTIVO` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REMISION_PERSONAS`
--

LOCK TABLES `REMISION_PERSONAS` WRITE;
/*!40000 ALTER TABLE `REMISION_PERSONAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REMISION_PERSONAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESPALDO_TEMPORAL`
--

DROP TABLE IF EXISTS `RESPALDO_TEMPORAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RESPALDO_TEMPORAL` (
  `id` int(11) NOT NULL,
  `id_accidente` int(11) DEFAULT NULL,
  `id_unico_accidente` varchar(150) NOT NULL,
  `parte_o_convenio` varchar(9) NOT NULL,
  `colonia_calle` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESPALDO_TEMPORAL`
--

LOCK TABLES `RESPALDO_TEMPORAL` WRITE;
/*!40000 ALTER TABLE `RESPALDO_TEMPORAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESPALDO_TEMPORAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReciboInv`
--

DROP TABLE IF EXISTS `ReciboInv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReciboInv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventario` int(11) NOT NULL,
  `recibo` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReciboInv`
--

LOCK TABLES `ReciboInv` WRITE;
/*!40000 ALTER TABLE `ReciboInv` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReciboInv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reporte_Vehiculos`
--

DROP TABLE IF EXISTS `Reporte_Vehiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reporte_Vehiculos` (
  `id` int(11) NOT NULL,
  `fecha_captura` datetime DEFAULT NULL,
  `falta_placa` int(11) DEFAULT NULL,
  `ser_publico` int(11) DEFAULT NULL,
  `Motocicleta` int(11) DEFAULT NULL,
  `Bicicletas` int(11) DEFAULT NULL,
  `Resguardo` int(11) DEFAULT NULL,
  `Salidas` int(11) DEFAULT NULL,
  `reporte_robo` int(11) DEFAULT NULL,
  `veh_recuperados` int(11) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `activo` int(11) NOT NULL,
  `relevancias_operativo` longtext NOT NULL,
  `direccion_ingenieria` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reporte_Vehiculos`
--

LOCK TABLES `Reporte_Vehiculos` WRITE;
/*!40000 ALTER TABLE `Reporte_Vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reporte_Vehiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Resultados`
--

DROP TABLE IF EXISTS `Resultados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Resultados` (
  `id` int(11) NOT NULL,
  `Articulo` varchar(765) NOT NULL,
  `Concepto_de_la_Infraccion` varchar(765) NOT NULL,
  `CONVERSION_maximo` varchar(765) NOT NULL,
  `CONVERSION_minimo` varchar(765) NOT NULL,
  `max` double DEFAULT NULL,
  `min` double DEFAULT NULL,
  `Monto_de_la_sancion_en_salarios_minimos` varchar(765) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Resultados`
--

LOCK TABLES `Resultados` WRITE;
/*!40000 ALTER TABLE `Resultados` DISABLE KEYS */;
/*!40000 ALTER TABLE `Resultados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SOLICITUDES`
--

DROP TABLE IF EXISTS `SOLICITUDES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SOLICITUDES` (
  `FOLIO` int(11) DEFAULT NULL,
  `ASUNTO` varchar(600) NOT NULL,
  `COMENTARIOS` longtext NOT NULL,
  `DESTINO_ID` int(11) DEFAULT NULL,
  `ORIGEN_ID` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `FECHA_INI` datetime DEFAULT NULL,
  `FECHA_LECTURA` datetime DEFAULT NULL,
  `USUARIO_LECTURA` varchar(150) NOT NULL,
  `CON_COPIA` int(11) DEFAULT NULL,
  `DEPARTAMENTO` varchar(600) NOT NULL,
  `QUIEN_LLAMA` varchar(600) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SOLICITUDES`
--

LOCK TABLES `SOLICITUDES` WRITE;
/*!40000 ALTER TABLE `SOLICITUDES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SOLICITUDES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sentidos`
--

DROP TABLE IF EXISTS `Sentidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sentidos` (
  `id` int(11) NOT NULL,
  `sentido` varchar(150) NOT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sentidos`
--

LOCK TABLES `Sentidos` WRITE;
/*!40000 ALTER TABLE `Sentidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sentidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TABULADOR`
--

DROP TABLE IF EXISTS `TABULADOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TABULADOR` (
  `id` int(11) NOT NULL,
  `Id_Predecesor` int(11) DEFAULT NULL,
  `CLAVE` varchar(30) NOT NULL,
  `ARTICULO` varchar(150) NOT NULL,
  `FRACC` varchar(150) NOT NULL,
  `DESCRIPCION` varchar(750) NOT NULL,
  `DIAS` int(11) DEFAULT NULL,
  `DIAS_MAX` int(11) DEFAULT NULL,
  `SAL_MIN` int(11) DEFAULT NULL,
  `IMPORTE` double DEFAULT NULL,
  `TIPO` varchar(45) NOT NULL,
  `TABULADO` int(11) DEFAULT NULL,
  `REGLAMENTO` int(11) DEFAULT NULL,
  `TIPO_REGLAMENTO` varchar(150) NOT NULL,
  `MOSTRAR` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TABULADOR`
--

LOCK TABLES `TABULADOR` WRITE;
/*!40000 ALTER TABLE `TABULADOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `TABULADOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TABULADOR_DESC`
--

DROP TABLE IF EXISTS `TABULADOR_DESC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TABULADOR_DESC` (
  `id` int(11) NOT NULL,
  `ART` int(11) DEFAULT NULL,
  `FRACC` varchar(150) NOT NULL,
  `DESCC` varchar(6000) NOT NULL,
  `reglamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TABULADOR_DESC`
--

LOCK TABLES `TABULADOR_DESC` WRITE;
/*!40000 ALTER TABLE `TABULADOR_DESC` DISABLE KEYS */;
/*!40000 ALTER TABLE `TABULADOR_DESC` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TABULADOR_NEW_BACKUP`
--

DROP TABLE IF EXISTS `TABULADOR_NEW_BACKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TABULADOR_NEW_BACKUP` (
  `id` int(11) NOT NULL,
  `Id_Predecesor` int(11) DEFAULT NULL,
  `CLAVE` varchar(30) NOT NULL,
  `ARTICULO` varchar(150) NOT NULL,
  `FRACC` varchar(150) NOT NULL,
  `DESCRIPCION` longtext NOT NULL,
  `DIAS` int(11) DEFAULT NULL,
  `DIAS_MAX` int(11) DEFAULT NULL,
  `SAL_MIN` int(11) DEFAULT NULL,
  `IMPORTE` double DEFAULT NULL,
  `TIPO` varchar(45) NOT NULL,
  `TABULADO` int(11) DEFAULT NULL,
  `REGLAMENTO` int(11) DEFAULT NULL,
  `TIPO_REGLAMENTO` varchar(150) NOT NULL,
  `MOSTRAR` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TABULADOR_NEW_BACKUP`
--

LOCK TABLES `TABULADOR_NEW_BACKUP` WRITE;
/*!40000 ALTER TABLE `TABULADOR_NEW_BACKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `TABULADOR_NEW_BACKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TABULADOR_OLD`
--

DROP TABLE IF EXISTS `TABULADOR_OLD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TABULADOR_OLD` (
  `id` int(11) NOT NULL,
  `Id_Predecesor` int(11) DEFAULT NULL,
  `CLAVE` varchar(30) NOT NULL,
  `ARTICULO` varchar(150) NOT NULL,
  `FRACC` varchar(150) NOT NULL,
  `DESCRIPCION` varchar(600) NOT NULL,
  `DIAS` int(11) DEFAULT NULL,
  `SAL_MIN` int(11) DEFAULT NULL,
  `IMPORTE` double DEFAULT NULL,
  `TIPO` varchar(45) NOT NULL,
  `TABULADO` int(11) DEFAULT NULL,
  `REGLAMENTO` int(11) DEFAULT NULL,
  `TIPO_REGLAMENTO` varchar(150) NOT NULL,
  `MOSTRAR` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TABULADOR_OLD`
--

LOCK TABLES `TABULADOR_OLD` WRITE;
/*!40000 ALTER TABLE `TABULADOR_OLD` DISABLE KEYS */;
/*!40000 ALTER TABLE `TABULADOR_OLD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TBMunicipios`
--

DROP TABLE IF EXISTS `TBMunicipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TBMunicipios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `municipio` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TBMunicipios`
--

LOCK TABLES `TBMunicipios` WRITE;
/*!40000 ALTER TABLE `TBMunicipios` DISABLE KEYS */;
/*!40000 ALTER TABLE `TBMunicipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_COLORES`
--

DROP TABLE IF EXISTS `TB_COLORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_COLORES` (
  `id` int(11) NOT NULL,
  `Color` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_COLORES`
--

LOCK TABLES `TB_COLORES` WRITE;
/*!40000 ALTER TABLE `TB_COLORES` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_COLORES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_Colonias_OLD`
--

DROP TABLE IF EXISTS `TB_Colonias_OLD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_Colonias_OLD` (
  `id` int(11) NOT NULL,
  `NOMBRE` varchar(765) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_Colonias_OLD`
--

LOCK TABLES `TB_Colonias_OLD` WRITE;
/*!40000 ALTER TABLE `TB_Colonias_OLD` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_Colonias_OLD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_Cortesias`
--

DROP TABLE IF EXISTS `TB_Cortesias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_Cortesias` (
  `id` int(11) NOT NULL,
  `folio` int(11) DEFAULT NULL,
  `servicio` int(11) DEFAULT NULL,
  `hora_infrac` datetime DEFAULT NULL,
  `fecha_infrac` datetime DEFAULT NULL,
  `delegacion` int(11) DEFAULT NULL,
  `comandancia` int(11) DEFAULT NULL,
  `turno` int(11) DEFAULT NULL,
  `num_cobro_agente` int(11) DEFAULT NULL,
  `infractor_nombre` varchar(150) NOT NULL,
  `infractor_apepaterno` varchar(150) NOT NULL,
  `infractor_apematerno` varchar(150) NOT NULL,
  `infractor_domicilio` varchar(600) NOT NULL,
  `infractor_sexo` int(11) DEFAULT NULL,
  `infractor_edad` int(11) DEFAULT NULL,
  `colonia` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `Ciudad` int(11) DEFAULT NULL,
  `infractor_num_licencia` varchar(150) NOT NULL,
  `Clas_vehiculo` int(11) DEFAULT NULL,
  `Marca` varchar(150) NOT NULL,
  `Submarca` int(11) DEFAULT NULL,
  `veh_modelo` varchar(150) NOT NULL,
  `veh_color` varchar(150) NOT NULL,
  `veh_color_detalle` varchar(150) NOT NULL,
  `veh_empresa` varchar(150) NOT NULL,
  `veh_placas` varchar(150) NOT NULL,
  `sp_num_economico` varchar(150) NOT NULL,
  `veh_serie` varchar(150) NOT NULL,
  `no_visible` int(11) DEFAULT NULL,
  `sp_num_ruta` varchar(150) NOT NULL,
  `sp_tipo` varchar(150) NOT NULL,
  `sp_num_tarjeton` varchar(150) NOT NULL,
  `infractor_presente` varchar(3) NOT NULL,
  `articulos` varchar(150) NOT NULL,
  `Calle1` int(11) DEFAULT NULL,
  `Calle2` int(11) DEFAULT NULL,
  `frente_num` varchar(150) NOT NULL,
  `Colonia2` int(11) DEFAULT NULL,
  `se_recogio` int(11) DEFAULT NULL,
  `certificado_medico` varchar(60) NOT NULL,
  `conductor_estado` varchar(150) NOT NULL,
  `firma_conductor` varchar(9) NOT NULL,
  `fecha_captura` datetime DEFAULT NULL,
  `fecha_final_captura` datetime DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `Motivo` varchar(300) NOT NULL,
  `longitud` double DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `tipo_operativo` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  `id_Agente` int(11) DEFAULT NULL,
  `infractor_numero` varchar(150) NOT NULL,
  `nombre_colonia_infraccion` varchar(150) NOT NULL,
  `nombre_calle1` varchar(150) NOT NULL,
  `nombre_calle2` varchar(150) NOT NULL,
  `propietario_nombre` varchar(150) NOT NULL,
  `propietario_domicilio` varchar(300) NOT NULL,
  `propietario_colonia` varchar(150) NOT NULL,
  `observaciones_infraccion` longtext NOT NULL,
  `tipo_placa` varchar(30) NOT NULL,
  `estado_placa` int(11) DEFAULT NULL,
  `estatus_presidencia` int(11) NOT NULL,
  `vigencia_licencia` datetime DEFAULT NULL,
  `servicio_publico` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_Cortesias`
--

LOCK TABLES `TB_Cortesias` WRITE;
/*!40000 ALTER TABLE `TB_Cortesias` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_Cortesias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_Detenido`
--

DROP TABLE IF EXISTS `TB_Detenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_Detenido` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Edo_Conductor` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_Detenido`
--

LOCK TABLES `TB_Detenido` WRITE;
/*!40000 ALTER TABLE `TB_Detenido` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_Detenido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_EMPRESAS_PRESIDENCIA`
--

DROP TABLE IF EXISTS `TB_EMPRESAS_PRESIDENCIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_EMPRESAS_PRESIDENCIA` (
  `id` int(11) NOT NULL,
  `CLAVE` double DEFAULT NULL,
  `LINEA` varchar(765) NOT NULL,
  `USUMOD` varchar(765) NOT NULL,
  `FECMOD` double DEFAULT NULL,
  `STSREG` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_EMPRESAS_PRESIDENCIA`
--

LOCK TABLES `TB_EMPRESAS_PRESIDENCIA` WRITE;
/*!40000 ALTER TABLE `TB_EMPRESAS_PRESIDENCIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_EMPRESAS_PRESIDENCIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_EMPRESAS_PRESIDENCIA_NEW`
--

DROP TABLE IF EXISTS `TB_EMPRESAS_PRESIDENCIA_NEW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_EMPRESAS_PRESIDENCIA_NEW` (
  `id` int(11) NOT NULL,
  `CLAVE` double DEFAULT NULL,
  `LINEA` varchar(765) NOT NULL,
  `USUMOD` varchar(765) NOT NULL,
  `FECMOD` double DEFAULT NULL,
  `STSREG` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_EMPRESAS_PRESIDENCIA_NEW`
--

LOCK TABLES `TB_EMPRESAS_PRESIDENCIA_NEW` WRITE;
/*!40000 ALTER TABLE `TB_EMPRESAS_PRESIDENCIA_NEW` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_EMPRESAS_PRESIDENCIA_NEW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_EMPRESAS_RUTAS_PRESIDENCIA`
--

DROP TABLE IF EXISTS `TB_EMPRESAS_RUTAS_PRESIDENCIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_EMPRESAS_RUTAS_PRESIDENCIA` (
  `id` int(11) NOT NULL,
  `ID_EMPRESA` int(11) NOT NULL,
  `RUTA` varchar(150) NOT NULL,
  `DESCRIPCION` varchar(150) NOT NULL,
  `ACTIVO` int(11) DEFAULT NULL,
  `NO_ECONOMICO` varchar(150) NOT NULL,
  `NO_TARJETON` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_EMPRESAS_RUTAS_PRESIDENCIA`
--

LOCK TABLES `TB_EMPRESAS_RUTAS_PRESIDENCIA` WRITE;
/*!40000 ALTER TABLE `TB_EMPRESAS_RUTAS_PRESIDENCIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_EMPRESAS_RUTAS_PRESIDENCIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_Estado_TipoLicencia`
--

DROP TABLE IF EXISTS `TB_Estado_TipoLicencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_Estado_TipoLicencia` (
  `id` int(11) NOT NULL,
  `tipo_licencia` varchar(60) NOT NULL,
  `idtipolicencia` varchar(150) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_Estado_TipoLicencia`
--

LOCK TABLES `TB_Estado_TipoLicencia` WRITE;
/*!40000 ALTER TABLE `TB_Estado_TipoLicencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_Estado_TipoLicencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_LICENCIAS`
--

DROP TABLE IF EXISTS `TB_LICENCIAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_LICENCIAS` (
  `id` int(11) NOT NULL,
  `NO_LICENCIA` varchar(765) NOT NULL,
  `NOMBRE` varchar(765) NOT NULL,
  `APELLIDO_P` varchar(765) NOT NULL,
  `APELLIDO_M` varchar(765) NOT NULL,
  `ID_TIPO_LICENCIA` int(11) DEFAULT NULL,
  `TIPO_LICENCIA` varchar(765) NOT NULL,
  `ID_ESTADO` int(11) DEFAULT NULL,
  `ESTADO` varchar(765) NOT NULL,
  `ID_CIUDAD` int(11) DEFAULT NULL,
  `CIUDAD` varchar(765) NOT NULL,
  `ID_COLONIA` int(11) DEFAULT NULL,
  `COLONIA` varchar(765) NOT NULL,
  `ID_CALLE` int(11) DEFAULT NULL,
  `CALLE` varchar(765) NOT NULL,
  `NUMERO` varchar(765) NOT NULL,
  `DOMICILIO` varchar(765) NOT NULL,
  `FECHA_EXPIRA` datetime DEFAULT NULL,
  `RESTRICCIONES_LICENCIA` int(11) DEFAULT NULL,
  `TIPO_SANGRE` varchar(765) NOT NULL,
  `DONADOR` varchar(765) NOT NULL,
  `FECHA_REGISTRO` datetime DEFAULT NULL,
  `ACTIVO` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_LICENCIAS`
--

LOCK TABLES `TB_LICENCIAS` WRITE;
/*!40000 ALTER TABLE `TB_LICENCIAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_LICENCIAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_MARCAS`
--

DROP TABLE IF EXISTS `TB_MARCAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_MARCAS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `MARCA` varchar(765) NOT NULL,
  `SUBMARCA` varchar(765) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_MARCAS`
--

LOCK TABLES `TB_MARCAS` WRITE;
/*!40000 ALTER TABLE `TB_MARCAS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_MARCAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_MOTOS`
--

DROP TABLE IF EXISTS `TB_MOTOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_MOTOS` (
  `id` int(11) NOT NULL,
  `MARCA` varchar(765) NOT NULL,
  `SUBMARCA` varchar(765) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `tipo` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_MOTOS`
--

LOCK TABLES `TB_MOTOS` WRITE;
/*!40000 ALTER TABLE `TB_MOTOS` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_MOTOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_Placas`
--

DROP TABLE IF EXISTS `TB_Placas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_Placas` (
  `id` int(11) NOT NULL,
  `PLACA` varchar(90) NOT NULL,
  `ESTADO` varchar(150) NOT NULL,
  `MARCA` varchar(150) NOT NULL,
  `SUB_MARCA` varchar(150) NOT NULL,
  `TIPO` varchar(150) NOT NULL,
  `MODELO` varchar(150) NOT NULL,
  `COLOR` varchar(150) NOT NULL,
  `REPORTE_ROBO` datetime DEFAULT NULL,
  `PROPIETARIO_NOMBRE` varchar(150) NOT NULL,
  `PROPIETARIO_APELLIDO_p` varchar(150) NOT NULL,
  `PROPIETARIO_APELLIDO_M` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_Placas`
--

LOCK TABLES `TB_Placas` WRITE;
/*!40000 ALTER TABLE `TB_Placas` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_Placas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TB_Verificaciones`
--

DROP TABLE IF EXISTS `TB_Verificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TB_Verificaciones` (
  `id` int(11) NOT NULL,
  `folio` int(11) DEFAULT NULL,
  `servicio` int(11) DEFAULT NULL,
  `hora_infrac` datetime DEFAULT NULL,
  `fecha_infrac` datetime DEFAULT NULL,
  `delegacion` int(11) DEFAULT NULL,
  `comandancia` int(11) DEFAULT NULL,
  `turno` int(11) DEFAULT NULL,
  `num_cobro_agente` int(11) DEFAULT NULL,
  `infractor_nombre` varchar(150) NOT NULL,
  `infractor_apepaterno` varchar(150) NOT NULL,
  `infractor_apematerno` varchar(150) NOT NULL,
  `infractor_domicilio` varchar(600) NOT NULL,
  `infractor_sexo` int(11) DEFAULT NULL,
  `infractor_edad` int(11) DEFAULT NULL,
  `colonia` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `Ciudad` int(11) DEFAULT NULL,
  `infractor_num_licencia` varchar(150) NOT NULL,
  `Clas_vehiculo` int(11) DEFAULT NULL,
  `Marca` varchar(150) NOT NULL,
  `Submarca` int(11) DEFAULT NULL,
  `veh_modelo` varchar(150) NOT NULL,
  `veh_color` varchar(150) NOT NULL,
  `veh_color_detalle` varchar(150) NOT NULL,
  `veh_empresa` varchar(150) NOT NULL,
  `veh_placas` varchar(150) NOT NULL,
  `sp_num_economico` varchar(150) NOT NULL,
  `veh_serie` varchar(150) NOT NULL,
  `no_visible` int(11) DEFAULT NULL,
  `sp_num_ruta` varchar(150) NOT NULL,
  `sp_tipo` varchar(150) NOT NULL,
  `sp_num_tarjeton` varchar(150) NOT NULL,
  `infractor_presente` varchar(3) NOT NULL,
  `articulos` varchar(150) NOT NULL,
  `Calle1` int(11) DEFAULT NULL,
  `Calle2` int(11) DEFAULT NULL,
  `frente_num` varchar(150) NOT NULL,
  `Colonia2` int(11) DEFAULT NULL,
  `se_recogio` int(11) DEFAULT NULL,
  `dv_pension` int(11) DEFAULT NULL,
  `dv_num_inventario` varchar(150) NOT NULL,
  `certificado_medico` varchar(60) NOT NULL,
  `conductor_estado` varchar(150) NOT NULL,
  `firma_conductor` varchar(9) NOT NULL,
  `fecha_captura` datetime DEFAULT NULL,
  `fecha_final_captura` datetime DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `Motivo` varchar(300) NOT NULL,
  `longitud` double DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `tipo_operativo` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  `id_Agente` int(11) DEFAULT NULL,
  `infractor_numero` varchar(150) NOT NULL,
  `nombre_colonia_infraccion` varchar(150) NOT NULL,
  `nombre_calle1` varchar(150) NOT NULL,
  `nombre_calle2` varchar(150) NOT NULL,
  `propietario_nombre` varchar(150) NOT NULL,
  `propietario_domicilio` varchar(300) NOT NULL,
  `propietario_colonia` varchar(150) NOT NULL,
  `observaciones_infraccion` longtext NOT NULL,
  `tipo_placa` varchar(30) NOT NULL,
  `estado_placa` int(11) DEFAULT NULL,
  `estatus_presidencia` int(11) NOT NULL,
  `vigencia_licencia` datetime DEFAULT NULL,
  `servicio_publico` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TB_Verificaciones`
--

LOCK TABLES `TB_Verificaciones` WRITE;
/*!40000 ALTER TABLE `TB_Verificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `TB_Verificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Agentes`
--

DROP TABLE IF EXISTS `Tb_Agentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Agentes` (
  `ID` int(11) NOT NULL,
  `No_Anterior` int(11) DEFAULT NULL,
  `Num_Cobro` int(11) DEFAULT NULL,
  `No_Gafete` int(11) DEFAULT NULL,
  `NOMBRE` varchar(150) NOT NULL,
  `DESCRIPCION` varchar(150) NOT NULL,
  `DEPARTAMENTO` varchar(150) NOT NULL,
  `RFC` varchar(150) NOT NULL,
  `ID_DELEGACION` int(11) DEFAULT NULL,
  `FECHA_REG` datetime DEFAULT NULL,
  `FECHA_INGRESO` datetime DEFAULT NULL,
  `FECHA_ELIM` datetime DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Agentes`
--

LOCK TABLES `Tb_Agentes` WRITE;
/*!40000 ALTER TABLE `Tb_Agentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Agentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Agentes_2008`
--

DROP TABLE IF EXISTS `Tb_Agentes_2008`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Agentes_2008` (
  `id` int(11) NOT NULL,
  `no_gafete` int(11) DEFAULT NULL,
  `nombre` varchar(180) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `num_cobro` int(11) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `status` varchar(3) NOT NULL,
  `fecha_elim` datetime DEFAULT NULL,
  `id_delegacion` int(11) DEFAULT NULL,
  `id_comandancia` int(11) DEFAULT NULL,
  `id_turno` int(11) DEFAULT NULL,
  `id_usuario` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Agentes_2008`
--

LOCK TABLES `Tb_Agentes_2008` WRITE;
/*!40000 ALTER TABLE `Tb_Agentes_2008` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Agentes_2008` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Agentes_BACKUP`
--

DROP TABLE IF EXISTS `Tb_Agentes_BACKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Agentes_BACKUP` (
  `id` int(11) NOT NULL,
  `no_gafete` int(11) DEFAULT NULL,
  `nombre` varchar(180) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `num_cobro` int(11) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `status` varchar(3) NOT NULL,
  `fecha_elim` datetime DEFAULT NULL,
  `id_delegacion` int(11) DEFAULT NULL,
  `id_comandancia` int(11) DEFAULT NULL,
  `id_turno` int(11) DEFAULT NULL,
  `id_usuario` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Agentes_BACKUP`
--

LOCK TABLES `Tb_Agentes_BACKUP` WRITE;
/*!40000 ALTER TABLE `Tb_Agentes_BACKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Agentes_BACKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Asuntos`
--

DROP TABLE IF EXISTS `Tb_Asuntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Asuntos` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Asuntos`
--

LOCK TABLES `Tb_Asuntos` WRITE;
/*!40000 ALTER TABLE `Tb_Asuntos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Asuntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Colonias_Nuevas`
--

DROP TABLE IF EXISTS `Tb_Colonias_Nuevas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Colonias_Nuevas` (
  `id` int(11) NOT NULL,
  `id_folio` int(11) DEFAULT NULL,
  `colonia_infraccion` int(11) NOT NULL,
  `nombre_colonia` varchar(150) NOT NULL,
  `colonia_conductor` int(11) NOT NULL,
  `nombre_colonia2` varchar(150) NOT NULL,
  `usuario` varchar(150) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Colonias_Nuevas`
--

LOCK TABLES `Tb_Colonias_Nuevas` WRITE;
/*!40000 ALTER TABLE `Tb_Colonias_Nuevas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Colonias_Nuevas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Constancias`
--

DROP TABLE IF EXISTS `Tb_Constancias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Constancias` (
  `id` int(11) NOT NULL,
  `folio_constancia` int(11) DEFAULT NULL,
  `id_temp` varchar(150) NOT NULL,
  `descripcion_vehiculo` varchar(150) NOT NULL,
  `tipo_documento` int(11) DEFAULT NULL,
  `tipo_licencia` varchar(150) NOT NULL,
  `no_licencia` varchar(150) NOT NULL,
  `no_tarjeta_circulacion` varchar(150) NOT NULL,
  `no_placas` varchar(150) NOT NULL,
  `marca` varchar(150) NOT NULL,
  `tipo_transporte` int(11) DEFAULT NULL,
  `submarca` int(11) DEFAULT NULL,
  `modelo` int(11) DEFAULT NULL,
  `rfv` varchar(150) NOT NULL,
  `no_motor` varchar(150) NOT NULL,
  `no_serie` varchar(150) NOT NULL,
  `nombre_propietario` varchar(150) NOT NULL,
  `apepaterno_propietario` varchar(150) NOT NULL,
  `apematerno_propietario` varchar(150) NOT NULL,
  `domicilio_propietario` varchar(150) NOT NULL,
  `localidad` varchar(150) NOT NULL,
  `fecha_expedicion` datetime DEFAULT NULL,
  `usuario_captura` varchar(150) NOT NULL,
  `tipo_identificacion` int(11) DEFAULT NULL,
  `no_identificacion` varchar(150) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Constancias`
--

LOCK TABLES `Tb_Constancias` WRITE;
/*!40000 ALTER TABLE `Tb_Constancias` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Constancias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Control_Blocks`
--

DROP TABLE IF EXISTS `Tb_Control_Blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Control_Blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_cobro_agente` int(11) DEFAULT NULL,
  `folio_inicial` int(11) DEFAULT NULL,
  `folio_final` int(11) DEFAULT NULL,
  `fecha_recibido` datetime DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Control_Blocks`
--

LOCK TABLES `Tb_Control_Blocks` WRITE;
/*!40000 ALTER TABLE `Tb_Control_Blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Control_Blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Control_de_block_de_Infracciones`
--

DROP TABLE IF EXISTS `Tb_Control_de_block_de_Infracciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Control_de_block_de_Infracciones` (
  `id` int(11) NOT NULL,
  `num_cobro_agente` int(11) DEFAULT NULL,
  `folio_inicial` int(11) DEFAULT NULL,
  `folio_final` int(11) DEFAULT NULL,
  `fecha_recibido` datetime DEFAULT NULL,
  `hora_recibido` datetime DEFAULT NULL,
  `folios_faltantes` int(11) NOT NULL,
  `folios_entregados` int(11) NOT NULL,
  `fecha_entregado` datetime DEFAULT NULL,
  `hora_entregado` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `id_usuario` varchar(150) NOT NULL,
  `No_blocks` int(11) NOT NULL,
  `Activo` int(11) NOT NULL,
  `id_agente` int(11) DEFAULT NULL,
  `tipo_block` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Control_de_block_de_Infracciones`
--

LOCK TABLES `Tb_Control_de_block_de_Infracciones` WRITE;
/*!40000 ALTER TABLE `Tb_Control_de_block_de_Infracciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Control_de_block_de_Infracciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Control_de_block_de_Infracciones_BACKUP`
--

DROP TABLE IF EXISTS `Tb_Control_de_block_de_Infracciones_BACKUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Control_de_block_de_Infracciones_BACKUP` (
  `id` int(11) NOT NULL,
  `num_cobro_agente` int(11) DEFAULT NULL,
  `folio_inicial` int(11) DEFAULT NULL,
  `folio_final` int(11) DEFAULT NULL,
  `fecha_recibido` datetime DEFAULT NULL,
  `hora_recibido` datetime DEFAULT NULL,
  `folios_faltantes` int(11) NOT NULL,
  `folios_entregados` int(11) NOT NULL,
  `fecha_entregado` datetime DEFAULT NULL,
  `hora_entregado` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `id_usuario` varchar(150) NOT NULL,
  `No_blocks` int(11) NOT NULL,
  `Activo` int(11) NOT NULL,
  `id_agente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Control_de_block_de_Infracciones_BACKUP`
--

LOCK TABLES `Tb_Control_de_block_de_Infracciones_BACKUP` WRITE;
/*!40000 ALTER TABLE `Tb_Control_de_block_de_Infracciones_BACKUP` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Control_de_block_de_Infracciones_BACKUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Cortesias_detalles`
--

DROP TABLE IF EXISTS `Tb_Cortesias_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Cortesias_detalles` (
  `id` int(11) NOT NULL,
  `folio` int(11) DEFAULT NULL,
  `id_articulo` int(11) DEFAULT NULL,
  `articulo` varchar(450) NOT NULL,
  `parrafo` varchar(450) NOT NULL,
  `concepto` varchar(900) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Cortesias_detalles`
--

LOCK TABLES `Tb_Cortesias_detalles` WRITE;
/*!40000 ALTER TABLE `Tb_Cortesias_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Cortesias_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Docto_Recogio`
--

DROP TABLE IF EXISTS `Tb_Docto_Recogio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Docto_Recogio` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(90) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Docto_Recogio`
--

LOCK TABLES `Tb_Docto_Recogio` WRITE;
/*!40000 ALTER TABLE `Tb_Docto_Recogio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Docto_Recogio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Estatus_Presidencia`
--

DROP TABLE IF EXISTS `Tb_Estatus_Presidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Estatus_Presidencia` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Estatus_Presidencia`
--

LOCK TABLES `Tb_Estatus_Presidencia` WRITE;
/*!40000 ALTER TABLE `Tb_Estatus_Presidencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Estatus_Presidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Identificaciones`
--

DROP TABLE IF EXISTS `Tb_Identificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Identificaciones` (
  `id` int(11) NOT NULL,
  `nombre_documento` varchar(150) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Identificaciones`
--

LOCK TABLES `Tb_Identificaciones` WRITE;
/*!40000 ALTER TABLE `Tb_Identificaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Identificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_LevantadoPor`
--

DROP TABLE IF EXISTS `Tb_LevantadoPor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_LevantadoPor` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_LevantadoPor`
--

LOCK TABLES `Tb_LevantadoPor` WRITE;
/*!40000 ALTER TABLE `Tb_LevantadoPor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_LevantadoPor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Otros_Veh`
--

DROP TABLE IF EXISTS `Tb_Otros_Veh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Otros_Veh` (
  `id` int(11) NOT NULL,
  `marca` varchar(150) NOT NULL,
  `submarca` varchar(150) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Otros_Veh`
--

LOCK TABLES `Tb_Otros_Veh` WRITE;
/*!40000 ALTER TABLE `Tb_Otros_Veh` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Otros_Veh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Pensiones`
--

DROP TABLE IF EXISTS `Tb_Pensiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Pensiones` (
  `id` int(11) NOT NULL,
  `nombre_pension` varchar(150) NOT NULL,
  `domicilio_pension` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Pensiones`
--

LOCK TABLES `Tb_Pensiones` WRITE;
/*!40000 ALTER TABLE `Tb_Pensiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Pensiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Placas_Temp`
--

DROP TABLE IF EXISTS `Tb_Placas_Temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Placas_Temp` (
  `id` int(11) NOT NULL,
  `no_placas` varchar(30) NOT NULL,
  `no_serie` varchar(60) NOT NULL,
  `tipo_placa` varchar(3) NOT NULL,
  `modelo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Placas_Temp`
--

LOCK TABLES `Tb_Placas_Temp` WRITE;
/*!40000 ALTER TABLE `Tb_Placas_Temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Placas_Temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Recibos`
--

DROP TABLE IF EXISTS `Tb_Recibos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Recibos` (
  `id` int(11) NOT NULL,
  `folio_infraccion` int(11) DEFAULT NULL,
  `folio_pago` varchar(150) NOT NULL,
  `fecha_pago` datetime DEFAULT NULL,
  `usuario_pago` varchar(150) NOT NULL,
  `fecha_registro_entrega` datetime DEFAULT NULL,
  `usuario_entregado` varchar(150) NOT NULL,
  `entregado` int(11) NOT NULL,
  `tipo_documento` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Recibos`
--

LOCK TABLES `Tb_Recibos` WRITE;
/*!40000 ALTER TABLE `Tb_Recibos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Recibos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Tabulador_transito`
--

DROP TABLE IF EXISTS `Tb_Tabulador_transito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Tabulador_transito` (
  `ID` int(11) NOT NULL,
  `ARTICULO` int(11) DEFAULT NULL,
  `PARRAFO` varchar(300) NOT NULL,
  `CONCEPTO_INFRACCION` varchar(900) NOT NULL,
  `DIAS_MAXIMO` int(11) DEFAULT NULL,
  `DIAS_MINIMO` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Tabulador_transito`
--

LOCK TABLES `Tb_Tabulador_transito` WRITE;
/*!40000 ALTER TABLE `Tb_Tabulador_transito` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Tabulador_transito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Tarjetas_Circulacion`
--

DROP TABLE IF EXISTS `Tb_Tarjetas_Circulacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Tarjetas_Circulacion` (
  `id` int(11) NOT NULL,
  `folio_tarjeta` varchar(150) NOT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `propietario_nombre` varchar(150) NOT NULL,
  `propietario_apepaterno` varchar(150) NOT NULL,
  `propietario_apematerno` varchar(150) NOT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `marca` varchar(150) NOT NULL,
  `id_submarca` int(11) DEFAULT NULL,
  `submarca` varchar(150) NOT NULL,
  `clas_vehiculo` int(11) DEFAULT NULL,
  `clase` varchar(150) NOT NULL,
  `descripcion_tipo` varchar(150) NOT NULL,
  `modelo` varchar(150) NOT NULL,
  `no_serie` varchar(150) NOT NULL,
  `no_motor` varchar(150) NOT NULL,
  `no_placas` varchar(150) NOT NULL,
  `fecha_expedicion` datetime DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `tipo_combustible` varchar(150) NOT NULL,
  `uso` varchar(150) NOT NULL,
  `capacidad` varchar(150) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `activo` int(11) NOT NULL,
  `tipo_placa` varchar(30) NOT NULL,
  `edo_placa` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Tarjetas_Circulacion`
--

LOCK TABLES `Tb_Tarjetas_Circulacion` WRITE;
/*!40000 ALTER TABLE `Tb_Tarjetas_Circulacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Tarjetas_Circulacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Tipo_Accidentes`
--

DROP TABLE IF EXISTS `Tb_Tipo_Accidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Tipo_Accidentes` (
  `id` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Tipo_Accidentes`
--

LOCK TABLES `Tb_Tipo_Accidentes` WRITE;
/*!40000 ALTER TABLE `Tb_Tipo_Accidentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Tipo_Accidentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Tipo_Calle`
--

DROP TABLE IF EXISTS `Tb_Tipo_Calle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Tipo_Calle` (
  `id` int(11) NOT NULL,
  `descripcion_tipo` varchar(150) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Tipo_Calle`
--

LOCK TABLES `Tb_Tipo_Calle` WRITE;
/*!40000 ALTER TABLE `Tb_Tipo_Calle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Tipo_Calle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Tipo_Evento`
--

DROP TABLE IF EXISTS `Tb_Tipo_Evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Tipo_Evento` (
  `id` int(11) NOT NULL,
  `tipo_evento` varchar(150) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Tipo_Evento`
--

LOCK TABLES `Tb_Tipo_Evento` WRITE;
/*!40000 ALTER TABLE `Tb_Tipo_Evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Tipo_Evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Tipo_Operativo`
--

DROP TABLE IF EXISTS `Tb_Tipo_Operativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Tipo_Operativo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `Clasificacion` varchar(150) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Tipo_Operativo`
--

LOCK TABLES `Tb_Tipo_Operativo` WRITE;
/*!40000 ALTER TABLE `Tb_Tipo_Operativo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Tipo_Operativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Tipo_Placas`
--

DROP TABLE IF EXISTS `Tb_Tipo_Placas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Tipo_Placas` (
  `id` int(11) NOT NULL,
  `tipo_placa` varchar(30) NOT NULL,
  `vigencia_inicial` int(11) DEFAULT NULL,
  `vigencia_final` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Tipo_Placas`
--

LOCK TABLES `Tb_Tipo_Placas` WRITE;
/*!40000 ALTER TABLE `Tb_Tipo_Placas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Tipo_Placas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Tipo_licencia`
--

DROP TABLE IF EXISTS `Tb_Tipo_licencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Tipo_licencia` (
  `id` int(11) NOT NULL,
  `tipo_licencia` varchar(60) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Tipo_licencia`
--

LOCK TABLES `Tb_Tipo_licencia` WRITE;
/*!40000 ALTER TABLE `Tb_Tipo_licencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Tipo_licencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_TrasladadoA`
--

DROP TABLE IF EXISTS `Tb_TrasladadoA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_TrasladadoA` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_TrasladadoA`
--

LOCK TABLES `Tb_TrasladadoA` WRITE;
/*!40000 ALTER TABLE `Tb_TrasladadoA` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_TrasladadoA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tb_Unidades_2008`
--

DROP TABLE IF EXISTS `Tb_Unidades_2008`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tb_Unidades_2008` (
  `Id` int(11) NOT NULL,
  `No_Unidad` varchar(300) NOT NULL,
  `Sector` varchar(300) NOT NULL,
  `id_Sector` int(11) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tb_Unidades_2008`
--

LOCK TABLES `Tb_Unidades_2008` WRITE;
/*!40000 ALTER TABLE `Tb_Unidades_2008` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tb_Unidades_2008` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UsuariosAD`
--

DROP TABLE IF EXISTS `UsuariosAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UsuariosAD` (
  `id` int(11) NOT NULL,
  `Login` varchar(765) NOT NULL,
  `Password` varchar(765) NOT NULL,
  `Nombre` varchar(765) NOT NULL,
  `ApePaterno` varchar(765) NOT NULL,
  `ApeMaterno` varchar(765) NOT NULL,
  `GRUPO_ID` int(11) DEFAULT NULL,
  `TEMPLATE_ID` int(11) DEFAULT NULL,
  `PERFIL_ID` int(11) DEFAULT NULL,
  `ACTIVO` int(11) NOT NULL,
  `PROCESADO` int(11) NOT NULL,
  `AGREGADO` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UsuariosAD`
--

LOCK TABLES `UsuariosAD` WRITE;
/*!40000 ALTER TABLE `UsuariosAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `UsuariosAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UsuariosAgregar`
--

DROP TABLE IF EXISTS `UsuariosAgregar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UsuariosAgregar` (
  `id` int(11) NOT NULL,
  `LOGIN` varchar(765) NOT NULL,
  `PASSWORD` varchar(765) NOT NULL,
  `NOMBRE` varchar(765) NOT NULL,
  `APEPATERNO` varchar(765) NOT NULL,
  `APEMATERNO` varchar(765) NOT NULL,
  `NOMBRE_COMPLETO` varchar(765) NOT NULL,
  `PRUESTO` varchar(765) NOT NULL,
  `DELEGACION` varchar(765) NOT NULL,
  `GRUPO_ID` int(11) DEFAULT NULL,
  `TEMPLATE_ID` int(11) DEFAULT NULL,
  `PERFIL_ID` int(11) DEFAULT NULL,
  `ACTIVO` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UsuariosAgregar`
--

LOCK TABLES `UsuariosAgregar` WRITE;
/*!40000 ALTER TABLE `UsuariosAgregar` DISABLE KEYS */;
/*!40000 ALTER TABLE `UsuariosAgregar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_6ba0f519` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$o3K3GN0PPa2a$dOYvC5vV08fcKhMSMK42hdjCaTWrKgnfKxzEIrEVMI0=','2014-01-12 20:55:48',1,'mmejia','','','mmejia3m@hotmail.com',1,1,'2014-01-12 20:55:48');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_274b862c` (`group_id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_35d9ac25` (`permission_id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_cobro_agente` int(11) DEFAULT NULL,
  `folio_inicial` int(11) DEFAULT NULL,
  `folio_final` int(11) DEFAULT NULL,
  `fecha_recibido` datetime DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block`
--

LOCK TABLES `block` WRITE;
/*!40000 ALTER TABLE `block` DISABLE KEYS */;
/*!40000 ALTER TABLE `block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo_Accidentes1`
--

DROP TABLE IF EXISTS `dbo_Accidentes1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbo_Accidentes1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo` int(11) DEFAULT NULL,
  `id_preliminar` int(11) DEFAULT NULL,
  `id_unico` varchar(300) NOT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `clasificacion` varchar(50) NOT NULL,
  `causa_primaria` int(11) DEFAULT NULL,
  `causa_secundaria` int(11) DEFAULT NULL,
  `tipo_choque` varchar(255) NOT NULL,
  `calle1` varchar(900) NOT NULL,
  `calle2` varchar(900) NOT NULL,
  `frente_num` varchar(900) NOT NULL,
  `colonia` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `edo_alineacion` varchar(50) NOT NULL,
  `edo_piso` varchar(50) NOT NULL,
  `edo_clima` varchar(50) NOT NULL,
  `edo_regularizacion` varchar(50) NOT NULL,
  `convenio_tipo` int(11) DEFAULT NULL,
  `convenio_numero` int(11) DEFAULT NULL,
  `convenio_delegacion` varchar(50) NOT NULL,
  `convenio_comandancia` varchar(50) NOT NULL,
  `convenio_turno` varchar(50) NOT NULL,
  `convenio_fecha` date DEFAULT NULL,
  `convenio_hora` varchar(50) NOT NULL,
  `Observaciones` longtext NOT NULL,
  `usuario` varchar(150) NOT NULL,
  `latitud` varchar(50) NOT NULL,
  `longitud` varchar(50) NOT NULL,
  `parte_o_convenio` varchar(15) NOT NULL,
  `croquis` varchar(150) NOT NULL,
  `simbologia` longtext NOT NULL,
  `investigacion` longtext NOT NULL,
  `tipo_calle` varchar(50) NOT NULL,
  `num_carriles` varchar(50) NOT NULL,
  `sentido_calles` varchar(60) NOT NULL,
  `dv_num_inventario` varchar(150) NOT NULL,
  `Activo` int(11) NOT NULL,
  `No_Infracciones` int(11) DEFAULT NULL,
  `Folios_Infracciones` varchar(450) NOT NULL,
  `nombre_intervino` varchar(150) NOT NULL,
  `gafete_intervino` varchar(150) NOT NULL,
  `unidad_intervino` varchar(150) NOT NULL,
  `sector_intervino` varchar(150) NOT NULL,
  `nombre_superviso` varchar(150) NOT NULL,
  `gafete_superviso` varchar(150) NOT NULL,
  `unidad_superviso` varchar(150) NOT NULL,
  `sector_superviso` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo_Accidentes1`
--

LOCK TABLES `dbo_Accidentes1` WRITE;
/*!40000 ALTER TABLE `dbo_Accidentes1` DISABLE KEYS */;
/*!40000 ALTER TABLE `dbo_Accidentes1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_c0d12874` (`user_id`),
  KEY `content_type_id_refs_id_93d2d1f8` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'acc id','accidentes','accid'),(8,'profile','accidentes','profile'),(9,'acc ali camino','accidentes','accalicamino'),(10,'aut comp inv','accidentes','autcompinv'),(11,'acc cabina','accidentes','acccabina'),(12,'acc cabina historial','accidentes','acccabinahistorial'),(13,'acc clas vehiculo','accidentes','accclasvehiculo'),(14,'acc clima','accidentes','accclima'),(15,'acc convenio','accidentes','accconvenio'),(16,'acc convenio historial','accidentes','accconveniohistorial'),(17,'acc custodia','accidentes','acccustodia'),(18,'acc danos','accidentes','accdanos'),(19,'acc dia noche','accidentes','accdianoche'),(20,'circulaciones','accidentes','circulaciones'),(21,'no carriles','accidentes','nocarriles'),(22,'sentidos','accidentes','sentidos'),(23,'acc edo conductor','accidentes','accedoconductor'),(24,'acc edo pavimento','accidentes','accedopavimento'),(25,'acc edo ebriedad','accidentes','accedoebriedad'),(26,'acc edo fisico','accidentes','accedofisico'),(27,'acc inve detalles','accidentes','accinvedetalles'),(28,'cap veh','accidentes','capveh'),(29,'en custodia','accidentes','encustodia'),(30,'acc inventario','accidentes','accinventario'),(31,'acc objetos','accidentes','accobjetos'),(32,'acc regulacion crucero','accidentes','accregulacioncrucero'),(33,'acc responsabilidad','accidentes','accresponsabilidad'),(34,'acc restricciones licencia','accidentes','accrestriccioneslicencia'),(35,'acc simbologia','accidentes','accsimbologia'),(36,'acc tipo accidente','accidentes','acctipoaccidente'),(37,'acc clas accidente','accidentes','accclasaccidente'),(38,'acc vehiculo tipo','accidentes','accvehiculotipo'),(39,'puntos accidentes','accidentes','puntosaccidentes'),(40,'acc vehiculo uso','accidentes','accvehiculouso'),(41,'acc visibilidad','accidentes','accvisibilidad'),(42,'acc croquis historial','accidentes','acccroquishistorial'),(43,'acc involucrados','accidentes','accinvolucrados'),(44,'acc preliminar','accidentes','accpreliminar'),(45,'acc preliminar historico','accidentes','accpreliminarhistorico'),(46,'acc tipo evento historial','accidentes','acctipoeventohistorial'),(47,'acc vehiculos','accidentes','accvehiculos'),(48,'noticias','accidentes','noticias'),(49,'accidentes','accidentes','accidentes'),(50,'accidentes historico','accidentes','accidenteshistorico'),(51,'asigna folios','accidentes','asignafolios'),(52,'cat agentes new','accidentes','catagentesnew'),(53,'cat agentes borrar','accidentes','catagentesborrar'),(54,'cat gps','accidentes','catgps'),(55,'cat gps2008','accidentes','catgps2008'),(56,'cat gps old','accidentes','catgpsold'),(57,'cat tabulador presidencia','accidentes','cattabuladorpresidencia'),(58,'cat tabulador presidencia old','accidentes','cattabuladorpresidenciaold'),(59,'control llamadas','accidentes','controlllamadas'),(60,'c comandancias','accidentes','ccomandancias'),(61,'c calles','accidentes','ccalles'),(62,'c delegaciones','accidentes','cdelegaciones'),(63,'c delegados','accidentes','cdelegados'),(64,'c tipo vehiculo','accidentes','ctipovehiculo'),(65,'c turnos','accidentes','cturnos'),(66,'corporaciones','accidentes','corporaciones'),(67,'competentes','accidentes','competentes'),(68,'mps','accidentes','mps'),(69,'cat hora','accidentes','cathora'),(70,'clasificacion incidentes','accidentes','clasificacionincidentes'),(71,'cubo accidentes2010','accidentes','cuboaccidentes2010'),(72,'cubo accidentessinfalta2010','accidentes','cuboaccidentessinfalta2010'),(73,'cubo infracciones2010','accidentes','cuboinfracciones2010'),(74,'cubo involucrados2010','accidentes','cuboinvolucrados2010'),(75,'inv bicicleta','accidentes','invbicicleta'),(76,'inv cajuela','accidentes','invcajuela'),(77,'inv cat agencias mp','accidentes','invcatagenciasmp'),(78,'inv cat agencias ubicacion','accidentes','invcatagenciasubicacion'),(79,'inv cat dependencias','accidentes','invcatdependencias'),(80,'inv cat deposito','accidentes','invcatdeposito'),(81,'inv cat documentos','accidentes','invcatdocumentos'),(82,'inv cat estatus','accidentes','invcatestatus'),(83,'inv cat liberacion cajas','accidentes','invcatliberacioncajas'),(84,'inv cat liberacion vehiculo','accidentes','invcatliberacionvehiculo'),(85,'inv cat liberacion vehiculo doctos','accidentes','invcatliberacionvehiculodoctos'),(86,'inv cat lugar','accidentes','invcatlugar'),(87,'inv cat lugar pago','accidentes','invcatlugarpago'),(88,'inv cat resguardo','accidentes','invcatresguardo'),(89,'inv cat tipo vehiculo','accidentes','invcattipovehiculo'),(90,'inv costado derecho','accidentes','invcostadoderecho'),(91,'inv costado izquierdo','accidentes','invcostadoizquierdo'),(92,'inv interior','accidentes','invinterior'),(93,'inv motocicleta','accidentes','invmotocicleta'),(94,'inv motor','accidentes','invmotor'),(95,'inv parte frente','accidentes','invpartefrente'),(96,'inv parte posterior','accidentes','invparteposterior'),(97,'inv salida vehiculo','accidentes','invsalidavehiculo'),(98,'documentos inv','accidentes','documentosinv'),(99,'recibo inv','accidentes','reciboinv'),(100,'inventario vehiculo','accidentes','inventariovehiculo'),(101,'inventario vehiculo cancelado','accidentes','inventariovehiculocancelado'),(102,'inventario vehiculo extemporaneo','accidentes','inventariovehiculoextemporaneo'),(103,'placas presidencia','accidentes','placaspresidencia'),(104,'remision eventos','accidentes','remisioneventos'),(105,'remision personas','accidentes','remisionpersonas'),(106,'respaldo temporal','accidentes','respaldotemporal'),(107,'reporte vehiculos','accidentes','reportevehiculos'),(108,'resultados','accidentes','resultados'),(109,'solicitudes','accidentes','solicitudes'),(110,'tabulador','accidentes','tabulador'),(111,'tabulador desc','accidentes','tabuladordesc'),(112,'resource','accidentes','resource'),(113,'desc veh','accidentes','descveh'),(114,'lugar liberacion','accidentes','lugarliberacion'),(115,'documentos liberacion','accidentes','documentosliberacion'),(116,'tabulador new backup','accidentes','tabuladornewbackup'),(117,'tabulador old','accidentes','tabuladorold'),(118,'tb colores','accidentes','tbcolores'),(119,'tb colonias old','accidentes','tbcoloniasold'),(120,'tb cortesias','accidentes','tbcortesias'),(121,'tb detenido','accidentes','tbdetenido'),(122,'tb empresas presidencia','accidentes','tbempresaspresidencia'),(123,'tb empresas presidencia new','accidentes','tbempresaspresidencianew'),(124,'tb empresas rutas presidencia','accidentes','tbempresasrutaspresidencia'),(125,'tb estado tipolicencia','accidentes','tbestadotipolicencia'),(126,'tb licencias','accidentes','tblicencias'),(127,'tb marcas','accidentes','tbmarcas'),(128,'tb motos','accidentes','tbmotos'),(129,'tb municipios','accidentes','tbmunicipios'),(130,'tb placas','accidentes','tbplacas'),(131,'tb tipo licencia','accidentes','tbtipolicencia'),(132,'tb verificaciones','accidentes','tbverificaciones'),(133,'tb agentes','accidentes','tbagentes'),(134,'tb agentes2008','accidentes','tbagentes2008'),(135,'tb agentes backup','accidentes','tbagentesbackup'),(136,'tb asuntos','accidentes','tbasuntos'),(137,'tb colonias nuevas','accidentes','tbcoloniasnuevas'),(138,'tb constancias','accidentes','tbconstancias'),(139,'tb control blocks','accidentes','tbcontrolblocks'),(140,'folio infraccion','accidentes','folioinfraccion'),(141,'tb control de block de infracciones','accidentes','tbcontroldeblockdeinfracciones'),(142,'tb control de block de infracciones backup','accidentes','tbcontroldeblockdeinfraccionesbackup'),(143,'tb cortesias detalles','accidentes','tbcortesiasdetalles'),(144,'tb docto recogio','accidentes','tbdoctorecogio'),(145,'tb estatus presidencia','accidentes','tbestatuspresidencia'),(146,'tb identificaciones','accidentes','tbidentificaciones'),(147,'tb levantadopor','accidentes','tblevantadopor'),(148,'tb otros veh','accidentes','tbotrosveh'),(149,'tb pensiones','accidentes','tbpensiones'),(150,'tb placas temp','accidentes','tbplacastemp'),(151,'tb recibos','accidentes','tbrecibos'),(152,'tb tabulador transito','accidentes','tbtabuladortransito'),(153,'tb tarjetas circulacion','accidentes','tbtarjetascirculacion'),(154,'tb tipo accidentes','accidentes','tbtipoaccidentes'),(155,'tb tipo calle','accidentes','tbtipocalle'),(156,'tb tipo evento','accidentes','tbtipoevento'),(157,'tb tipo operativo','accidentes','tbtipooperativo'),(158,'tb tipo placas','accidentes','tbtipoplacas'),(159,'tb trasladadoa','accidentes','tbtrasladadoa'),(160,'tb unidades2008','accidentes','tbunidades2008'),(161,'usuariosad','accidentes','usuariosad'),(162,'usuariosagregar','accidentes','usuariosagregar'),(163,'tb estados','accidentes','tbestados');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infracciones_detalle`
--

DROP TABLE IF EXISTS `infracciones_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infracciones_detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folio` int(11) DEFAULT NULL,
  `id_articulo` int(11) DEFAULT NULL,
  `articulo` varchar(450) NOT NULL,
  `parrafo` varchar(450) NOT NULL,
  `concepto` varchar(900) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infracciones_detalle`
--

LOCK TABLES `infracciones_detalle` WRITE;
/*!40000 ALTER TABLE `infracciones_detalle` DISABLE KEYS */;
INSERT INTO `infracciones_detalle` VALUES (1,124,0,'12','II',' En los cruceros regulados mediante semÃ¡foros, cuando la luz estÃ© en color rojo, debe detener su vehÃ­culo en la lÃ­nea de â€œaltoâ€, sin invadir la zona para el cruce de los peatones;'),(2,124,0,'12','II',' En los cruceros regulados mediante semÃ¡foros, cuando la luz estÃ© en color rojo, debe detener su vehÃ­culo en la lÃ­nea de â€œaltoâ€, sin invadir la zona para el cruce de los peatones;'),(3,124,0,'12','I',' En los cruceros controlados por los agentes o por promotores voluntarios de seguridad vial, las indicaciones de estos prevalecen sobre la de los semÃ¡foros y seÃ±ales oficiales;'),(4,124,0,'12','II',' En los cruceros regulados mediante semÃ¡foros, cuando la luz estÃ© en color rojo, debe detener su vehÃ­culo en la lÃ­nea de â€œaltoâ€, sin invadir la zona para el cruce de los peatones;'),(5,124,0,'12','II',' En los cruceros regulados mediante semÃ¡foros, cuando la luz estÃ© en color rojo, debe detener su vehÃ­culo en la lÃ­nea de â€œaltoâ€, sin invadir la zona para el cruce de los peatones;'),(6,124,0,'12','I',' En los cruceros controlados por los agentes o por promotores voluntarios de seguridad vial, las indicaciones de estos prevalecen sobre la de los semÃ¡foros y seÃ±ales oficiales;'),(7,124,0,'12','II',' En los cruceros regulados mediante semÃ¡foros, cuando la luz estÃ© en color rojo, debe detener su vehÃ­culo en la lÃ­nea de â€œaltoâ€, sin invadir la zona para el cruce de los peatones;'),(8,124,0,'12','II',' En los cruceros regulados mediante semÃ¡foros, cuando la luz estÃ© en color rojo, debe detener su vehÃ­culo en la lÃ­nea de â€œaltoâ€, sin invadir la zona para el cruce de los peatones;'),(9,124,0,'12','I',' En los cruceros controlados por los agentes o por promotores voluntarios de seguridad vial, las indicaciones de estos prevalecen sobre la de los semÃ¡foros y seÃ±ales oficiales;'),(10,124,0,'12','II',' En los cruceros regulados mediante semÃ¡foros, cuando la luz estÃ© en color rojo, debe detener su vehÃ­culo en la lÃ­nea de â€œaltoâ€, sin invadir la zona para el cruce de los peatones;'),(11,124,0,'12','II',' En los cruceros regulados mediante semÃ¡foros, cuando la luz estÃ© en color rojo, debe detener su vehÃ­culo en la lÃ­nea de â€œaltoâ€, sin invadir la zona para el cruce de los peatones;'),(12,124,0,'12','I',' En los cruceros controlados por los agentes o por promotores voluntarios de seguridad vial, las indicaciones de estos prevalecen sobre la de los semÃ¡foros y seÃ±ales oficiales;'),(13,124,0,'12','II',' En los cruceros regulados mediante semÃ¡foros, cuando la luz estÃ© en color rojo, debe detener su vehÃ­culo en la lÃ­nea de â€œaltoâ€, sin invadir la zona para el cruce de los peatones;'),(14,124,0,'12','II',' En los cruceros regulados mediante semÃ¡foros, cuando la luz estÃ© en color rojo, debe detener su vehÃ­culo en la lÃ­nea de â€œaltoâ€, sin invadir la zona para el cruce de los peatones;'),(15,124,0,'12','I',' En los cruceros controlados por los agentes o por promotores voluntarios de seguridad vial, las indicaciones de estos prevalecen sobre la de los semÃ¡foros y seÃ±ales oficiales;'),(16,124,0,'12','II',' En los cruceros regulados mediante semÃ¡foros, cuando la luz estÃ© en color rojo, debe detener su vehÃ­culo en la lÃ­nea de â€œaltoâ€, sin invadir la zona para el cruce de los peatones;'),(17,124,0,'12','II',' En los cruceros regulados mediante semÃ¡foros, cuando la luz estÃ© en color rojo, debe detener su vehÃ­culo en la lÃ­nea de â€œaltoâ€, sin invadir la zona para el cruce de los peatones;'),(18,124,0,'12','I',' En los cruceros controlados por los agentes o por promotores voluntarios de seguridad vial, las indicaciones de estos prevalecen sobre la de los semÃ¡foros y seÃ±ales oficiales;');
/*!40000 ALTER TABLE `infracciones_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infracciones_folioinfraccion`
--

DROP TABLE IF EXISTS `infracciones_folioinfraccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infracciones_folioinfraccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `block` int(11) DEFAULT NULL,
  `folio` int(11) DEFAULT NULL,
  `comandancia` varchar(50) NOT NULL,
  `delegacion` varchar(50) NOT NULL,
  `turno` varchar(50) NOT NULL,
  `fecha_liberacion` datetime DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `usuario` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infracciones_folioinfraccion`
--

LOCK TABLES `infracciones_folioinfraccion` WRITE;
/*!40000 ALTER TABLE `infracciones_folioinfraccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `infracciones_folioinfraccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infracciones_infraccion`
--

DROP TABLE IF EXISTS `infracciones_infraccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infracciones_infraccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folio` int(11) DEFAULT NULL,
  `servicio` varchar(150) NOT NULL,
  `hora_infrac` time DEFAULT NULL,
  `fecha_infrac` date DEFAULT NULL,
  `delegacion` varchar(150) NOT NULL,
  `comandancia` varchar(150) NOT NULL,
  `turno` varchar(150) NOT NULL,
  `num_cobro_agente` int(11) DEFAULT NULL,
  `infractor_presente` varchar(150) NOT NULL,
  `Calle1` varchar(255) NOT NULL,
  `Calle2` varchar(255) NOT NULL,
  `frente_num` varchar(150) NOT NULL,
  `Colonia2` varchar(255) NOT NULL,
  `se_recogio` varchar(255) NOT NULL,
  `certificado_medico` varchar(150) NOT NULL,
  `firma_conductor` varchar(150) NOT NULL,
  `fecha_captura` datetime DEFAULT NULL,
  `fecha_final_captura` datetime DEFAULT NULL,
  `usuario` varchar(150) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `longitud` varchar(150) NOT NULL,
  `latitud` varchar(150) NOT NULL,
  `circulacion` varchar(50) NOT NULL,
  `tipo_operativo` varchar(255) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  `nombre_colonia_infraccion` varchar(150) NOT NULL,
  `nombre_calle1` varchar(150) NOT NULL,
  `nombre_calle2` varchar(150) NOT NULL,
  `observaciones_infraccion` varchar(255) NOT NULL,
  `servicio_publico` varchar(150) NOT NULL,
  `nombreAgente` varchar(255) NOT NULL,
  `recoje_licencia_estado` varchar(50) NOT NULL,
  `recoje_licencia_no_conducir` varchar(50) NOT NULL,
  `recoje_licencia_fecha_vencimiento` varchar(50) NOT NULL,
  `recoje_licencia_tipo` varchar(50) NOT NULL,
  `recoje_licencia_restricciones` varchar(50) NOT NULL,
  `recoje_vehiculo_no_inventario` varchar(50) NOT NULL,
  `recoje_vehiculo_pension` varchar(50) NOT NULL,
  `infractor_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `infractor_id_refs_id_376746fc` (`infractor_id`),
  KEY `vehiculo_id_refs_id_8228cca1` (`vehiculo_id`),
  CONSTRAINT `vehiculo_id_refs_id_8228cca1` FOREIGN KEY (`vehiculo_id`) REFERENCES `infracciones_vehiculo` (`id`),
  CONSTRAINT `infractor_id_refs_id_376746fc` FOREIGN KEY (`infractor_id`) REFERENCES `infracciones_infractor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infracciones_infraccion`
--

LOCK TABLES `infracciones_infraccion` WRITE;
/*!40000 ALTER TABLE `infracciones_infraccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `infracciones_infraccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infracciones_infraccion_detalles`
--

DROP TABLE IF EXISTS `infracciones_infraccion_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infracciones_infraccion_detalles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `infraccion_id` int(11) NOT NULL,
  `detalle_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `infraccion_id` (`infraccion_id`,`detalle_id`),
  KEY `detalle_id_refs_id_7328e0f8` (`detalle_id`),
  CONSTRAINT `infraccion_id_refs_id_6b6d8892` FOREIGN KEY (`infraccion_id`) REFERENCES `infracciones_infraccion` (`id`),
  CONSTRAINT `detalle_id_refs_id_7328e0f8` FOREIGN KEY (`detalle_id`) REFERENCES `infracciones_detalle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infracciones_infraccion_detalles`
--

LOCK TABLES `infracciones_infraccion_detalles` WRITE;
/*!40000 ALTER TABLE `infracciones_infraccion_detalles` DISABLE KEYS */;
/*!40000 ALTER TABLE `infracciones_infraccion_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infracciones_infractor`
--

DROP TABLE IF EXISTS `infracciones_infractor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infracciones_infractor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) NOT NULL,
  `appPat` varchar(250) NOT NULL,
  `appMat` varchar(250) NOT NULL,
  `sexo` varchar(50) NOT NULL,
  `edad` varchar(50) NOT NULL,
  `domicilio` varchar(250) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `colonia` varchar(250) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `no_licencia` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infracciones_infractor`
--

LOCK TABLES `infracciones_infractor` WRITE;
/*!40000 ALTER TABLE `infracciones_infractor` DISABLE KEYS */;
/*!40000 ALTER TABLE `infracciones_infractor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `infracciones_vehiculo`
--

DROP TABLE IF EXISTS `infracciones_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `infracciones_vehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clas_vehiculo` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `submarca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `color` varchar(50) NOT NULL,
  `detalle_color` varchar(50) NOT NULL,
  `tipo_placa` varchar(50) NOT NULL,
  `placas` varchar(50) NOT NULL,
  `estado_placa` varchar(50) NOT NULL,
  `serie` varchar(250) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `empresa` varchar(50) NOT NULL,
  `ruta` varchar(50) NOT NULL,
  `no_economico` varchar(50) NOT NULL,
  `no_tarjeton` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `infracciones_vehiculo`
--

LOCK TABLES `infracciones_vehiculo` WRITE;
/*!40000 ALTER TABLE `infracciones_vehiculo` DISABLE KEYS */;
/*!40000 ALTER TABLE `infracciones_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cobro` int(11) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `comandancia` varchar(50) NOT NULL,
  `turno` varchar(5) NOT NULL,
  `delegacion` varchar(30) NOT NULL,
  `comision` varchar(150) NOT NULL,
  `color` varchar(150) NOT NULL,
  `tam_tabla` varchar(150) NOT NULL,
  `superusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntos_accidentes`
--

DROP TABLE IF EXISTS `puntos_accidentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puntos_accidentes` (
  `id` int(11) NOT NULL,
  `dia` varchar(150) NOT NULL,
  `anio` varchar(3) NOT NULL,
  `fecha` varchar(150) NOT NULL,
  `accidentes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntos_accidentes`
--

LOCK TABLES `puntos_accidentes` WRITE;
/*!40000 ALTER TABLE `puntos_accidentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntos_accidentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_bak`
--

DROP TABLE IF EXISTS `resource_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_bak` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_unico` varchar(150) NOT NULL,
  `tipo` varchar(150) NOT NULL,
  `modulo` varchar(150) NOT NULL,
  `ruta` varchar(150) NOT NULL,
  `nombre_archivo` varchar(6000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_bak`
--

LOCK TABLES `resource_bak` WRITE;
/*!40000 ALTER TABLE `resource_bak` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_bak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estados`
--

DROP TABLE IF EXISTS `tb_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_estados` (
  `id` int(11) NOT NULL,
  `estado` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estados`
--

LOCK TABLES `tb_estados` WRITE;
/*!40000 ALTER TABLE `tb_estados` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_estados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-01-12 15:00:41
