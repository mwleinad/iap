-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 28, 2019 at 07:41 PM
-- Server version: 5.7.27
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ihjaimes_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `abreviacion`
--

CREATE TABLE `abreviacion` (
  `abreviacionId` int(11) NOT NULL,
  `abreviacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `abreviacion`
--

INSERT INTO `abreviacion` (`abreviacionId`, `abreviacion`) VALUES
(1, 'Lic.'),
(2, 'CP');

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activityId` int(11) NOT NULL,
  `activityConfigId` int(11) NOT NULL,
  `courseModuleId` int(11) NOT NULL,
  `activityType` enum('Lectura','Tarea','Examen','Otro','Foro') CHARACTER SET latin1 NOT NULL,
  `initialDate` date NOT NULL,
  `horaInicial` time NOT NULL,
  `finalDate` datetime NOT NULL,
  `modality` enum('Individual','Por Equipo') CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `resumen` varchar(30) CHARACTER SET latin1 NOT NULL,
  `requiredActivity` int(11) NOT NULL,
  `ponderation` int(3) NOT NULL DEFAULT '0',
  `timeLimit` int(3) NOT NULL,
  `noQuestions` int(2) NOT NULL,
  `tries` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `activity_config`
--

CREATE TABLE `activity_config` (
  `activityConfigId` int(11) NOT NULL,
  `courseModuleId` int(11) NOT NULL,
  `subject_moduleId` int(11) NOT NULL,
  `activityType` enum('Lectura','Tarea','Examen','Otro','Foro') CHARACTER SET latin1 NOT NULL,
  `initialDate` date NOT NULL,
  `horaInicial` time NOT NULL,
  `finalDate` datetime NOT NULL,
  `modality` enum('Individual','Por Equipo') CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
  `resumen` varchar(30) CHARACTER SET latin1 NOT NULL,
  `requiredActivity` int(11) NOT NULL,
  `ponderation` int(3) NOT NULL DEFAULT '0',
  `timeLimit` int(3) NOT NULL,
  `noQuestions` int(2) NOT NULL,
  `tries` int(11) NOT NULL DEFAULT '1',
  `diaInicial` varchar(255) COLLATE utf8_bin NOT NULL,
  `diaFinal` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `activity_score`
--

CREATE TABLE `activity_score` (
  `activityScoreId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `activityId` int(11) NOT NULL,
  `ponderation` float(5,2) NOT NULL,
  `try` int(11) NOT NULL DEFAULT '0',
  `retro` text NOT NULL,
  `rutaArchivoRetro` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `activity_test`
--

CREATE TABLE `activity_test` (
  `testId` int(11) NOT NULL,
  `activityId` int(11) NOT NULL,
  `question` text NOT NULL,
  `opcionA` text NOT NULL,
  `opcionB` text NOT NULL,
  `opcionC` text NOT NULL,
  `opcionD` text NOT NULL,
  `opcionE` text NOT NULL,
  `answer` enum('opcionA','opcionB','opcionC','opcionD','opcionE') NOT NULL DEFAULT 'opcionA'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `alumnoshistorial`
--

CREATE TABLE `alumnoshistorial` (
  `id` int(11) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `clavenivel` varchar(100) NOT NULL,
  `nombrenivel` varchar(255) NOT NULL,
  `gradogrupo` varchar(100) NOT NULL,
  `ciclo` varchar(10) NOT NULL,
  `becapesos` decimal(12,2) NOT NULL,
  `becaporcentaje` decimal(12,2) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidop` varchar(50) NOT NULL,
  `apellidom` varchar(50) NOT NULL,
  `periodo` varchar(50) NOT NULL,
  `fechainiciopagos` date NOT NULL,
  `infocambio` varchar(255) DEFAULT NULL,
  `activado` smallint(6) NOT NULL,
  `idplan` int(11) NOT NULL,
  `idespecialidad` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL DEFAULT 'admin',
  `fechacreacion` date DEFAULT NULL,
  `usuariomodificacion` varchar(50) DEFAULT NULL,
  `fechamodificacion` date DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `fechastatus` date DEFAULT NULL,
  `observaciones` text,
  `numPagos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `announcementId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `courseModuleId` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `personalId` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `automovilprofesor`
--

CREATE TABLE `automovilprofesor` (
  `automovilId` int(11) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `placas` varchar(255) NOT NULL,
  `personalId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bancoprofesor`
--

CREATE TABLE `bancoprofesor` (
  `bancoprofesorId` int(11) NOT NULL,
  `nombreBanco` varchar(255) NOT NULL,
  `numCuenta` varchar(255) NOT NULL,
  `claveInterbancaria` varchar(255) NOT NULL,
  `sucursal` varchar(255) NOT NULL,
  `numeroPlaza` varchar(255) NOT NULL,
  `lugar` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `personalId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bankId` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank_account`
--

CREATE TABLE `bank_account` (
  `bank_accountId` int(11) NOT NULL,
  `numCuenta` varchar(255) NOT NULL,
  `bankId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cancel_code`
--

CREATE TABLE `cancel_code` (
  `codeId` int(11) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cancel_code`
--

INSERT INTO `cancel_code` (`codeId`, `clave`, `name`) VALUES
(1, '01', 'Reprobaci?n'),
(2, '02', 'Deserci?n'),
(3, '03', 'Solic. Inter. (T)'),
(4, '04', 'Solic. Inter. (D)'),
(5, '05', 'Cambio Adscrip.'),
(6, '06', 'Otras');

-- --------------------------------------------------------

--
-- Table structure for table `catalogodocumento`
--

CREATE TABLE `catalogodocumento` (
  `catalogodocumentoId` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `estatus` enum('activo','eliminado') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `catalogodocumento`
--

INSERT INTO `catalogodocumento` (`catalogodocumentoId`, `nombre`, `descripcion`, `estatus`) VALUES
(10, 'Carta de pago', 'Subir carta de autorización de pago (La pueden descargar en &quot;Información personal&quot; -&gt; &quot;Carta de Pago&quot;)', 'activo'),
(11, 'Currículum Vitae (Actualizado)', 'Mantener siempre Actualizado ', 'activo'),
(12, 'Semblanza Profesional', 'Breve reseña personal para que nosotros realicemos su presentación ante los alumnos', 'activo'),
(13, 'Acta de nacimiento', 'Escaneado a color y vigente 2016 al 2019', 'activo'),
(14, 'Credencial de elector', 'Ambos lados, escaneados en un solo archivo tamaño media carta cada imagen, ambas en una pagina', 'activo'),
(15, 'Cédula Fiscal o RFC', 'Hoja que emite el Sat desde su portal con sus datos fiscales', 'activo'),
(16, 'CURP', 'Actualizado de la página de internet', 'activo'),
(17, 'Comprobante de domicilio', 'Actualizado imagen a color escaneada', 'activo'),
(18, 'Cédula de Grado de Doctor', 'Escaneado ambos lados en una sola pagina a color ', 'activo'),
(19, 'Grado de Doctor', 'Documento escaneado a color ambas caras una por página en una sola hoja', 'activo'),
(20, 'Opinión de Obligaciones Fiscales Positiva', 'Cada vez que sea contratado, tomando en cuenta que tiene una vigencia de 90 días', 'eliminado'),
(21, 'Opinión de Cumplimiento de Obligaciones Fiscales Positiva', 'Cada vez que sea contratado, tomando en cuenta su vigencia de 90 días', 'eliminado'),
(22, 'Título de Licenciatura', '', 'eliminado'),
(23, 'Cédula de Licenciatura', '', 'eliminado'),
(24, 'Cédula de Grado de Maestro', 'Escaneado ambos lados en una sola pagina a color', 'activo'),
(25, 'Grado de Maestro', 'Documento escaneado a color ambas caras una por página en una sola hoja', 'activo'),
(26, 'Cédula de Licenciatura', 'Escaneado ambos lados en una sola pagina a color', 'activo'),
(27, 'Título de Licenciatura', 'Documento escaneado a color ambas caras una por página en una sola hoja', 'activo'),
(28, 'Opinión de Cumplimiento de Obligaciones Fiscales Positiva	', 'Cada vez que sea contratado, tomando en cuenta su vigencia de 90 días', 'activo');

-- --------------------------------------------------------

--
-- Table structure for table `categoria_pregunta`
--

CREATE TABLE `categoria_pregunta` (
  `categoriapreguntaId` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `encuestaId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categoria_pregunta`
--

INSERT INTO `categoria_pregunta` (`categoriapreguntaId`, `nombre`, `encuestaId`) VALUES
(1, 'Planeacion', 1),
(2, 'Estrategias Didácticas', 1),
(3, 'Comunicación', 1),
(4, 'Evaluación del aprendizaje', 1),
(5, 'Elemento ético o de valores', 1),
(6, 'Material de apoyo', 1),
(7, 'Satisfacción General', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `chatId` int(11) NOT NULL,
  `yoId` int(11) NOT NULL,
  `quienEnvia` enum('alumno','personal') NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `asunto` text NOT NULL,
  `mensaje` text NOT NULL,
  `fechaEnvio` date NOT NULL,
  `courseModuleId` int(11) NOT NULL,
  `estatus` enum('activo','eliminado','borrador') NOT NULL,
  `rutaAdjunto` varchar(255) NOT NULL,
  `favorito` enum('no','si') NOT NULL,
  `leido` enum('no','si') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classroom`
--

CREATE TABLE `classroom` (
  `classroomId` int(11) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat`
--

CREATE TABLE `cometchat` (
  `id` int(10) UNSIGNED NOT NULL,
  `from` int(10) UNSIGNED NOT NULL,
  `to` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `sent` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `read` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `direction` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_announcements`
--

CREATE TABLE `cometchat_announcements` (
  `id` int(10) UNSIGNED NOT NULL,
  `announcement` text CHARACTER SET latin1 NOT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `to` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_chatroommessages`
--

CREATE TABLE `cometchat_chatroommessages` (
  `id` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `chatroomid` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `sent` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cometchat_chatroommessages`
--

INSERT INTO `cometchat_chatroommessages` (`id`, `userid`, `chatroomid`, `message`, `sent`) VALUES
(1, 681, 8, 'HOLA', 1414118599);

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_chatrooms`
--

CREATE TABLE `cometchat_chatrooms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastactivity` int(10) UNSIGNED NOT NULL,
  `createdby` int(10) UNSIGNED NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cometchat_chatrooms`
--

INSERT INTO `cometchat_chatrooms` (`id`, `name`, `lastactivity`, `createdby`, `password`, `type`) VALUES
(1, 'Curso Responsabilidades', 1358530098, 116, 'b2542aa262dee45364891b6a77611c99bd037ead', 1),
(2, 'lucia guadalupe alfonso ontiveros', 1373071558, 402, '64ad79b4cafc554a8ec7ff8eba7ba39810234437', 1),
(3, 'Docente Dra Hilda', 1373935276, 107, '', 0),
(4, 'Docente Dra Hilda', 1373935302, 107, '', 0),
(5, 'prueba', 1374183600, 1, 'bcb65f788ce84cd29e458d3c1b31955cb0506332', 2),
(6, 'maestria', 1412568275, 659, '', 0),
(7, 'Lasdislao Guadalupe Ortiz Solis', 1412573924, 656, '', 0),
(8, 'MAestria', 1414118599, 681, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_chatrooms_users`
--

CREATE TABLE `cometchat_chatrooms_users` (
  `userid` int(10) UNSIGNED NOT NULL,
  `chatroomid` int(10) UNSIGNED NOT NULL,
  `lastactivity` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cometchat_chatrooms_users`
--

INSERT INTO `cometchat_chatrooms_users` (`userid`, `chatroomid`, `lastactivity`) VALUES
(107, 4, 1373946096),
(116, 1, 1358530164),
(402, 2, 1373071577),
(656, 7, 1412573986),
(681, 8, 1414128062);

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_status`
--

CREATE TABLE `cometchat_status` (
  `userid` int(10) UNSIGNED NOT NULL,
  `message` text,
  `status` enum('available','away','busy','invisible','offline') DEFAULT NULL,
  `typingto` int(10) UNSIGNED DEFAULT NULL,
  `typingtime` int(10) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cometchat_videochatsessions`
--

CREATE TABLE `cometchat_videochatsessions` (
  `username` varchar(255) NOT NULL,
  `identity` varchar(255) NOT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `complementoConcepto`
--

CREATE TABLE `complementoConcepto` (
  `complementoConceptoId` int(11) NOT NULL,
  `conceptoId` int(11) NOT NULL,
  `any` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `complementoConceptoParte`
--

CREATE TABLE `complementoConceptoParte` (
  `complementoConceptoParteId` int(11) NOT NULL,
  `conceptoId` int(11) NOT NULL,
  `any` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comprobante`
--

CREATE TABLE `comprobante` (
  `comprobanteId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `formaDePago` varchar(255) NOT NULL DEFAULT 'Pago En Una Sola Exhibicion',
  `condicionesDePago` varchar(255) NOT NULL,
  `metodoDePago` varchar(255) NOT NULL,
  `tasaIva` enum('16','11','0','1') NOT NULL DEFAULT '16',
  `tipoDeMoneda` enum('peso','dolar','euro') NOT NULL DEFAULT 'peso',
  `tipoDeCambio` float(20,2) NOT NULL DEFAULT '1.00',
  `porcentajeRetIva` enum('0','4','10','10.666666') NOT NULL DEFAULT '0',
  `porcentajeRetIsr` enum('0','10','10.666666') NOT NULL DEFAULT '0',
  `tiposComprobanteId` int(11) NOT NULL DEFAULT '1',
  `porcentajeIEPS` int(3) NOT NULL DEFAULT '0',
  `porcentajeDescuento` int(3) NOT NULL DEFAULT '0',
  `empresaId` int(11) NOT NULL,
  `sucursalId` int(11) NOT NULL,
  `observaciones` text,
  `version` varchar(10) NOT NULL DEFAULT '2.0',
  `serie` varchar(10) NOT NULL,
  `folio` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `sello` text NOT NULL,
  `noAprobacion` int(11) NOT NULL,
  `anoAprobacion` int(4) NOT NULL,
  `noCertificado` varchar(20) NOT NULL,
  `certificado` text,
  `subTotal` float(20,6) NOT NULL,
  `descuento` float(20,6) DEFAULT NULL,
  `motivoDescuento` text,
  `total` float(20,6) NOT NULL,
  `tipoDeComprobante` enum('ingreso','egreso','traslado') NOT NULL,
  `cadenaOriginal` text NOT NULL,
  `xml` text,
  `rfcId` int(11) NOT NULL DEFAULT '1',
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `ivaTotal` float(20,6) NOT NULL,
  `efectoComprobante` enum('I','E','T') NOT NULL DEFAULT 'I',
  `pedimento` varchar(300) DEFAULT NULL,
  `fechaPedimento` date DEFAULT NULL,
  `aduana` varchar(600) DEFAULT NULL,
  `data` text,
  `motivoCancelacion` text,
  `motivoNotaCredito` text,
  `conceptos` text,
  `impuestos` text,
  `timbreFiscal` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comprobante`
--

INSERT INTO `comprobante` (`comprobanteId`, `userId`, `formaDePago`, `condicionesDePago`, `metodoDePago`, `tasaIva`, `tipoDeMoneda`, `tipoDeCambio`, `porcentajeRetIva`, `porcentajeRetIsr`, `tiposComprobanteId`, `porcentajeIEPS`, `porcentajeDescuento`, `empresaId`, `sucursalId`, `observaciones`, `version`, `serie`, `folio`, `fecha`, `sello`, `noAprobacion`, `anoAprobacion`, `noCertificado`, `certificado`, `subTotal`, `descuento`, `motivoDescuento`, `total`, `tipoDeComprobante`, `cadenaOriginal`, `xml`, `rfcId`, `status`, `ivaTotal`, `efectoComprobante`, `pedimento`, `fechaPedimento`, `aduana`, `data`, `motivoCancelacion`, `motivoNotaCredito`, `conceptos`, `impuestos`, `timbreFiscal`) VALUES
(1, 1, 'PAGO EN UNA SOLA EXHIBICION', '', 'No Identificado', '16', 'peso', 1.00, '0', '0', 1, 0, 0, 15, 0, '', '2.0', 'A', 1, '2013-02-06 13:26:17', 'iGnm734sSQCvyubqU4Ph5n4yjSuAnjssPLl87AhgoWBxxusmepGApaZC2EFgQX1zOdfhIHQlkesCWr05ohtdBk52OzVjOr4QYGhpeZFYcpri2YITKCGV7urCL49gWMcFTRPEVKIVBLg+sTUrHYUUElAurFJi4oQ9SPQCqhL/GuU=', 0, 0, '00001000000200751201', 'MIIEZTCCA02gAwIBAgIUMDAwMDEwMDAwMDAyMDA3NTEyMDEwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDQxMDIwNTg1MFoXDTE2MDQxMDIwNTg1MFowgaYxGDAWBgNVBAMTD0JSQVVOIEhVRVJJTiBTQzEYMBYGA1UEKRMPQlJBVU4gSFVFUklOIFNDMRgwFgYDVQQKEw9CUkFVTiBIVUVSSU4gU0MxJTAjBgNVBC0THEJIVTEyMDMyMENRMSAvIEhFQUY3MTExMDJRVjUxHjAcBgNVBAUTFSAvIEhFQUY3MTExMDJIQ1NSUlIwOTEPMA0GA1UECxMGVU5JREFEMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDzAysAe8MCguM2dNpiuLJVBQ+l09epMs+bPKrDpl7fdkWDwjdS8HATOkg6Be9c+oRM+ULN3idq6QZJQSaIKfZYS4zZOvqE3+zpIpYB7n+C3QryrmkakSMBIlnDwZojJnIG+7BZqxbF0FF7Iu9XTG0LmnRYDrbA4HQvHiR3dYDBbwIDAQABox0wGzAMBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BAQUFAAOCAQEAMUl0MFQnEZJu+BhwEJgAKIF16f2z2OA6UcDtA7yHlzwU6gsaRQ2QhNRUEiONdRccT+YqU28kJGt86/UVTfxD3aon33qc9I2H4M/T40EbkYSxV3OOAffCsH3NA2b/xMcsLcFny0u7bS/DnAkLi9SIJQ+FZmbRKLYKbechhrG3wpAY8qQWEtIbs82kX6/X4J0mahXHuazwB4ZP4VwaJ3lZE11+3xsLvRDhXRtZMkrZIZwQ4pRo6EpVmq5dPtHUv9z6WbzkbYbrPgHWiWt/GU6DeTQn/2S3VGaG/e7mV5Ac2vF+72GYSsYHyixkI8Jpt1IgihAwfYBIcSbHXsD3v9kfRw==', 1000.000000, 0.000000, '', 1160.000000, 'ingreso', '||3.2|2013-02-06T13:26:17|ingreso|PAGO EN UNA SOLA EXHIBICION|1000.00|0.00|1.00|MXN|1160.00|No Identificado|Matriz|LSF100610LS2|DEMO FACTURASE|DEMO|13|45|DEMO|DEMO|DEMO|DEMO|DEMO|DEMO|11111|RÃ?Â©gimen de las Personas FÃ?Â­sicas con Actividades Empresariales y Profesionales|POKV650926UBA|VICTOR POLITIS KAMKHAJI|AV DE LA INDUSTRIA|10|NO APLICA|FRACC IND TREBOL|TEPOTZOTLAN|TEPOTZOTLAN|ESTADO DE MEXICO|Mexico|12345|1.00|No Aplica|CONTABILIDAD MENSUAL Correspondiente al mes de Ene del 2013|1000.00|1000.00|IVA|0.00|ISR|0.00|0.00|IVA|16.00|160.00|IEPS|0.00|0.00|160.00||', '15_A_1', 1, '1', 160.000000, 'I', NULL, NULL, NULL, '', NULL, NULL, 'a%3A1%3A%7Bi%3A1%3Ba%3A8%3A%7Bs%3A16%3A%22noIdentificacion%22%3Bs%3A0%3A%22%22%3Bs%3A8%3A%22cantidad%22%3Bi%3A1%3Bs%3A6%3A%22unidad%22%3Bs%3A9%3A%22No+Aplica%22%3Bs%3A13%3A%22valorUnitario%22%3Bs%3A7%3A%221000.00%22%3Bs%3A7%3A%22importe%22%3Bs%3A7%3A%221000.00%22%3Bs%3A10%3A%22excentoIva%22%3Bs%3A2%3A%22no%22%3Bs%3A11%3A%22descripcion%22%3Bs%3A59%3A%22CONTABILIDAD+MENSUAL+Correspondiente+al+mes+de+Ene+del+2013%22%3Bs%3A7%3A%22tasaIva%22%3Bs%3A2%3A%2216%22%3B%7D%7D', '', 'a:9:{s:14:\"schemaLocation\";s:122:\"http://www.sat.gob.mx/TimbreFiscalDigital http://www.sat.gob.mx/sitio_internet/TimbreFiscalDigital/TimbreFiscalDigital.xsd\";s:7:\"version\";s:3:\"1.0\";s:4:\"UUID\";s:36:\"FFDFFDCC-7E57-41B5-9AA8-DAFFC6E89C73\";s:13:\"FechaTimbrado\";s:19:\"2013-02-06T13:26:19\";s:8:\"selloCFD\";s:172:\"iGnm734sSQCvyubqU4Ph5n4yjSuAnjssPLl87AhgoWBxxusmepGApaZC2EFgQX1zOdfhIHQlkesCWr05ohtdBk52OzVjOr4QYGhpeZFYcpri2YITKCGV7urCL49gWMcFTRPEVKIVBLg+sTUrHYUUElAurFJi4oQ9SPQCqhL/GuU=\";s:16:\"noCertificadoSAT\";s:20:\"20001000000100005867\";s:8:\"selloSAT\";s:172:\"C8nwPlsHm5C3FJUWEariyN8nzO3Z6qx7kbkajo9wKQAZGOD+dKnk3nbOY/x/xrtnRigR6JaC8EdzpEeyh+NGmVPrlKedSDQJ3FUzIjIzbg44UllIxJvLEOMS+yF3OANBgM4l8v5O7TnRWYG8gH6mBvpgNv6UUddx11kfXlTEVic=\";s:8:\"original\";s:258:\"||1.0|FFDFFDCC-7E57-41B5-9AA8-DAFFC6E89C73|2013-02-06T13:26:19|iGnm734sSQCvyubqU4Ph5n4yjSuAnjssPLl87AhgoWBxxusmepGApaZC2EFgQX1zOdfhIHQlkesCWr05ohtdBk52OzVjOr4QYGhpeZFYcpri2YITKCGV7urCL49gWMcFTRPEVKIVBLg sTUrHYUUElAurFJi4oQ9SPQCqhL/GuU=|20001000000100005867||\";s:4:\"sha1\";s:40:\"4538fbcf8cab888f4782ac5f7f37a7642916b444\";}'),
(15, 618, 'Pago%20en%20Una%20Sola%20Exhibicion', '', 'dad', '16', 'peso', 1.00, '0', '0', 1, 0, 0, 15, 1, '', '2.0', 'A', 15, '2013-03-04 10:09:41', 'z+DUoBp5OdJITiDgGDQLRduouoCe4ElSlEhEcv3lLOKDksQEXYHRLS+u6NjqFGWLXs2ITXh/Qq0egVgLCFAQ8rmioQpVLN/XVtDxxo8l90Loqg0aUlDiUS9oiLCs6uC9zeTwhTd0jKeO8JqqLrryeXGaplq75NHcOoxMF4EZMUk=', 0, 0, '00001000000200751201', 'MIIEZTCCA02gAwIBAgIUMDAwMDEwMDAwMDAyMDA3NTEyMDEwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDQxMDIwNTg1MFoXDTE2MDQxMDIwNTg1MFowgaYxGDAWBgNVBAMTD0JSQVVOIEhVRVJJTiBTQzEYMBYGA1UEKRMPQlJBVU4gSFVFUklOIFNDMRgwFgYDVQQKEw9CUkFVTiBIVUVSSU4gU0MxJTAjBgNVBC0THEJIVTEyMDMyMENRMSAvIEhFQUY3MTExMDJRVjUxHjAcBgNVBAUTFSAvIEhFQUY3MTExMDJIQ1NSUlIwOTEPMA0GA1UECxMGVU5JREFEMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDzAysAe8MCguM2dNpiuLJVBQ+l09epMs+bPKrDpl7fdkWDwjdS8HATOkg6Be9c+oRM+ULN3idq6QZJQSaIKfZYS4zZOvqE3+zpIpYB7n+C3QryrmkakSMBIlnDwZojJnIG+7BZqxbF0FF7Iu9XTG0LmnRYDrbA4HQvHiR3dYDBbwIDAQABox0wGzAMBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BAQUFAAOCAQEAMUl0MFQnEZJu+BhwEJgAKIF16f2z2OA6UcDtA7yHlzwU6gsaRQ2QhNRUEiONdRccT+YqU28kJGt86/UVTfxD3aon33qc9I2H4M/T40EbkYSxV3OOAffCsH3NA2b/xMcsLcFny0u7bS/DnAkLi9SIJQ+FZmbRKLYKbechhrG3wpAY8qQWEtIbs82kX6/X4J0mahXHuazwB4ZP4VwaJ3lZE11+3xsLvRDhXRtZMkrZIZwQ4pRo6EpVmq5dPtHUv9z6WbzkbYbrPgHWiWt/GU6DeTQn/2S3VGaG/e7mV5Ac2vF+72GYSsYHyixkI8Jpt1IgihAwfYBIcSbHXsD3v9kfRw==', 1.000000, 0.000000, '', 1.160000, 'ingreso', '||3.2|2013-03-04T10:09:41|ingreso|Pago en Una Sola Exhibicion|1.00|0.00|1.00|peso|1.16|dad|matriz|LSF100610LS2|DEMO FACTURASE|DEMO|13|45|DEMO|DEMO|DEMO|DEMO|DEMO|DEMO|11111|R??©gimen de las Personas F??­sicas con Actividades Empresariales y Profesionales|LOAD850511SX3|daniel l??³pez|calle ac??©ntos|123|321|col|num|est|Mexico|00123|1.00|da|dada|1.00|1.00|IVA|0.00|ISR|0.00|0.00|IVA|16.00|0.16|IEPS|0.00|0.00|0.16||', '15_A_15', 1, '1', 0.160000, 'I', NULL, NULL, NULL, 'a%3A9%3A%7Bs%3A16%3A%22datosFacturacion%22%3Bs%3A557%3A%22userId%3D618%26rfc%3DLOAD850511SX3%26razonSocial%3Ddaniel%2520l%25C3%25B3pez%26calle%3Dcalle%2520ac%25C3%25A9ntos%26noExt%3D123%26noInt%3D321%26colonia%3Dcol%26municipio%3Dnum%26estado%3Dest%26localidad%3D%26cp%3D00123%26pais%3DMexico%26referencia%3D%26email%3Dd%2540ta.com%26formaDePago%3DPago%2520en%2520Una%2520Sola%2520Exhibicion%26condicionesDePago%3D%26metodoDePago%3Ddad%26NumCtaPago%3D%26tasaIva%3D16%26tiposDeMoneda%3Dpeso%26porcentajeRetIva%3D0%26porcentajeIEPS%3D%26porcentajeDescuento%3D%26tipoDeCambio%3D%26porcentajeRetIsr%3D0%26tiposComprobanteId%3D1-5%26sucursalId%3D1%26cantidad%3D1%26noIdentificacion%3D%26unidad%3Dda%26valorUnitario%3D1%26excentoIva%3Dno%26descripcion%3Ddada%26observaciones%3D%22%3Bs%3A13%3A%22observaciones%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22reviso%22%3Bs%3A0%3A%22%22%3Bs%3A8%3A%22autorizo%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22recibio%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22vobo%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22pago%22%3Bs%3A0%3A%22%22%3Bs%3A3%3A%22spf%22%3BN%3Bs%3A3%3A%22isn%22%3BN%3B%7D', NULL, NULL, 'a%3A1%3A%7Bi%3A1%3Ba%3A9%3A%7Bs%3A16%3A%22noIdentificacion%22%3Bs%3A0%3A%22%22%3Bs%3A8%3A%22cantidad%22%3Bd%3A1%3Bs%3A6%3A%22unidad%22%3Bs%3A2%3A%22da%22%3Bs%3A13%3A%22valorUnitario%22%3Bd%3A1%3Bs%3A7%3A%22importe%22%3Bd%3A1%3Bs%3A10%3A%22excentoIva%22%3Bs%3A2%3A%22no%22%3Bs%3A11%3A%22descripcion%22%3Bs%3A4%3A%22dada%22%3Bs%3A17%3A%22categoriaConcepto%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22tasaIva%22%3Bd%3A16%3B%7D%7D', 'N%3B', 'a:9:{s:14:\"schemaLocation\";s:122:\"http://www.sat.gob.mx/TimbreFiscalDigital http://www.sat.gob.mx/sitio_internet/TimbreFiscalDigital/TimbreFiscalDigital.xsd\";s:7:\"version\";s:3:\"1.0\";s:4:\"UUID\";s:36:\"867594CC-7E57-47FC-B277-27FD334798B9\";s:13:\"FechaTimbrado\";s:19:\"2013-03-04T10:09:43\";s:8:\"selloCFD\";s:172:\"z+DUoBp5OdJITiDgGDQLRduouoCe4ElSlEhEcv3lLOKDksQEXYHRLS+u6NjqFGWLXs2ITXh/Qq0egVgLCFAQ8rmioQpVLN/XVtDxxo8l90Loqg0aUlDiUS9oiLCs6uC9zeTwhTd0jKeO8JqqLrryeXGaplq75NHcOoxMF4EZMUk=\";s:16:\"noCertificadoSAT\";s:20:\"20001000000100005867\";s:8:\"selloSAT\";s:172:\"r0yAwt7+a/Msy7J7uRNebvxhg+dHX2F2q0OHuCLpWdakd8JUiLsCxfW6Q1NrdngNiEafcMLXW4xDsGldkrdH58QK+CVE0XtzEiFkX+ZweymCHPd7sEEbgJHAJKZhggGFdLnrxpXbQXmt5U/lokZlqlwt1dJ+C8DEU2sB/iWsS2Q=\";s:8:\"original\";s:258:\"||1.0|867594CC-7E57-47FC-B277-27FD334798B9|2013-03-04T10:09:43|z DUoBp5OdJITiDgGDQLRduouoCe4ElSlEhEcv3lLOKDksQEXYHRLS u6NjqFGWLXs2ITXh/Qq0egVgLCFAQ8rmioQpVLN/XVtDxxo8l90Loqg0aUlDiUS9oiLCs6uC9zeTwhTd0jKeO8JqqLrryeXGaplq75NHcOoxMF4EZMUk=|20001000000100005867||\";s:4:\"sha1\";s:40:\"56695ff28238f6700816148db83df6e2d594075d\";}'),
(16, 618, 'Pago%20en%20Una%20Sola%20Exhibicion', '', 'dasda', '16', 'peso', 1.00, '0', '0', 1, 0, 0, 15, 1, '', '2.0', 'A', 16, '2013-03-04 10:32:17', 'ELcJF7ORinTlIHXZOV6NLAAPQIgyVynAlj0M26rdehNWR4Yr+UP2KQA7D6QBzPKSlO0SvocBuWaaBnxRVjydTWIRo36af1c5YHT03ZFUw6N6NPOBbiHoXzcnP0Fz3V7rY2F434kbFkF+Zb1OkunVJ/Rw4uDTyBLYpOz4KP3I7TU=', 0, 0, '00001000000200751201', 'MIIEZTCCA02gAwIBAgIUMDAwMDEwMDAwMDAyMDA3NTEyMDEwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDQxMDIwNTg1MFoXDTE2MDQxMDIwNTg1MFowgaYxGDAWBgNVBAMTD0JSQVVOIEhVRVJJTiBTQzEYMBYGA1UEKRMPQlJBVU4gSFVFUklOIFNDMRgwFgYDVQQKEw9CUkFVTiBIVUVSSU4gU0MxJTAjBgNVBC0THEJIVTEyMDMyMENRMSAvIEhFQUY3MTExMDJRVjUxHjAcBgNVBAUTFSAvIEhFQUY3MTExMDJIQ1NSUlIwOTEPMA0GA1UECxMGVU5JREFEMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDzAysAe8MCguM2dNpiuLJVBQ+l09epMs+bPKrDpl7fdkWDwjdS8HATOkg6Be9c+oRM+ULN3idq6QZJQSaIKfZYS4zZOvqE3+zpIpYB7n+C3QryrmkakSMBIlnDwZojJnIG+7BZqxbF0FF7Iu9XTG0LmnRYDrbA4HQvHiR3dYDBbwIDAQABox0wGzAMBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BAQUFAAOCAQEAMUl0MFQnEZJu+BhwEJgAKIF16f2z2OA6UcDtA7yHlzwU6gsaRQ2QhNRUEiONdRccT+YqU28kJGt86/UVTfxD3aon33qc9I2H4M/T40EbkYSxV3OOAffCsH3NA2b/xMcsLcFny0u7bS/DnAkLi9SIJQ+FZmbRKLYKbechhrG3wpAY8qQWEtIbs82kX6/X4J0mahXHuazwB4ZP4VwaJ3lZE11+3xsLvRDhXRtZMkrZIZwQ4pRo6EpVmq5dPtHUv9z6WbzkbYbrPgHWiWt/GU6DeTQn/2S3VGaG/e7mV5Ac2vF+72GYSsYHyixkI8Jpt1IgihAwfYBIcSbHXsD3v9kfRw==', 1.000000, 0.000000, '', 1.160000, 'ingreso', '||3.2|2013-03-04T10:32:17|ingreso|Pago en Una Sola Exhibicion|1.00|0.00|1.00|peso|1.16|dasda|matriz|LSF100610LS2|DEMO FACTURASE|DEMO|13|45|DEMO|DEMO|DEMO|DEMO|DEMO|DEMO|11111|R??©gimen de las Personas F??­sicas con Actividades Empresariales y Profesionales|LOAD850511SX3|daniel l??³pez|calle ac??©ntos|123|321|col|num|est|Mexico|00123|1.00|da|dasdasd|1.00|1.00|IVA|0.00|ISR|0.00|0.00|IVA|16.00|0.16|IEPS|0.00|0.00|0.16||', '15_A_16', 1, '1', 0.160000, 'I', NULL, NULL, NULL, 'a%3A9%3A%7Bs%3A16%3A%22datosFacturacion%22%3Bs%3A562%3A%22userId%3D618%26rfc%3DLOAD850511SX3%26razonSocial%3Ddaniel%2520l%25C3%25B3pez%26calle%3Dcalle%2520ac%25C3%25A9ntos%26noExt%3D123%26noInt%3D321%26colonia%3Dcol%26municipio%3Dnum%26estado%3Dest%26localidad%3D%26cp%3D00123%26pais%3DMexico%26referencia%3D%26email%3Dd%2540ta.com%26formaDePago%3DPago%2520en%2520Una%2520Sola%2520Exhibicion%26condicionesDePago%3D%26metodoDePago%3Ddasda%26NumCtaPago%3D%26tasaIva%3D16%26tiposDeMoneda%3Dpeso%26porcentajeRetIva%3D0%26porcentajeIEPS%3D%26porcentajeDescuento%3D%26tipoDeCambio%3D%26porcentajeRetIsr%3D0%26tiposComprobanteId%3D1-5%26sucursalId%3D1%26cantidad%3D1%26noIdentificacion%3D%26unidad%3Dda%26valorUnitario%3D1%26excentoIva%3Dno%26descripcion%3Ddasdasd%26observaciones%3D%22%3Bs%3A13%3A%22observaciones%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22reviso%22%3Bs%3A0%3A%22%22%3Bs%3A8%3A%22autorizo%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22recibio%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22vobo%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22pago%22%3Bs%3A0%3A%22%22%3Bs%3A3%3A%22spf%22%3BN%3Bs%3A3%3A%22isn%22%3BN%3B%7D', NULL, NULL, 'a%3A1%3A%7Bi%3A1%3Ba%3A9%3A%7Bs%3A16%3A%22noIdentificacion%22%3Bs%3A0%3A%22%22%3Bs%3A8%3A%22cantidad%22%3Bd%3A1%3Bs%3A6%3A%22unidad%22%3Bs%3A2%3A%22da%22%3Bs%3A13%3A%22valorUnitario%22%3Bd%3A1%3Bs%3A7%3A%22importe%22%3Bd%3A1%3Bs%3A10%3A%22excentoIva%22%3Bs%3A2%3A%22no%22%3Bs%3A11%3A%22descripcion%22%3Bs%3A7%3A%22dasdasd%22%3Bs%3A17%3A%22categoriaConcepto%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22tasaIva%22%3Bd%3A16%3B%7D%7D', 'N%3B', 'a:9:{s:14:\"schemaLocation\";s:122:\"http://www.sat.gob.mx/TimbreFiscalDigital http://www.sat.gob.mx/sitio_internet/TimbreFiscalDigital/TimbreFiscalDigital.xsd\";s:7:\"version\";s:3:\"1.0\";s:4:\"UUID\";s:36:\"7E8041D8-7E57-48B1-BD56-2C760CEC4A0B\";s:13:\"FechaTimbrado\";s:19:\"2013-03-04T10:32:19\";s:8:\"selloCFD\";s:172:\"ELcJF7ORinTlIHXZOV6NLAAPQIgyVynAlj0M26rdehNWR4Yr+UP2KQA7D6QBzPKSlO0SvocBuWaaBnxRVjydTWIRo36af1c5YHT03ZFUw6N6NPOBbiHoXzcnP0Fz3V7rY2F434kbFkF+Zb1OkunVJ/Rw4uDTyBLYpOz4KP3I7TU=\";s:16:\"noCertificadoSAT\";s:20:\"20001000000100005867\";s:8:\"selloSAT\";s:172:\"MIITfl4Q4veJDpWDZsCO2LCBWnoFmiShGBCiXZ33tz4akiDhAd+eoUz7QbxNI+B8eAV1v0TR3XIU3yxqIUC8hbAtvSRadpBhSqSMechhuwIsz8t1cMRfesXfz2XyaRq2EzSS+yLYE2vzUJ6ORm5a2VxpGpHG33uXJh4OkvbEhIY=\";s:8:\"original\";s:258:\"||1.0|7E8041D8-7E57-48B1-BD56-2C760CEC4A0B|2013-03-04T10:32:19|ELcJF7ORinTlIHXZOV6NLAAPQIgyVynAlj0M26rdehNWR4Yr UP2KQA7D6QBzPKSlO0SvocBuWaaBnxRVjydTWIRo36af1c5YHT03ZFUw6N6NPOBbiHoXzcnP0Fz3V7rY2F434kbFkF Zb1OkunVJ/Rw4uDTyBLYpOz4KP3I7TU=|20001000000100005867||\";s:4:\"sha1\";s:40:\"9a6fbcedb213d859007cc085c25397eaadb9ba1c\";}'),
(17, 618, 'Pago%20en%20Una%20Sola%20Exhibicion', '', 'dasda', '16', 'peso', 1.00, '0', '0', 1, 0, 0, 15, 1, '', '2.0', 'A', 17, '2013-03-04 10:32:26', 'QcyN1N5Ev2fr/FjDQL1GDouoo2YDiX0MEXS1bPVJi42ZB7U1jX7/imKQ3hrVENrnDwe9q4dbYnv0kLeA26GMTy2xxikmeYQiUpDmFeFhS/9eCZxPU0Qi9Y5dJpOQlv8zmfH4pYIxqDXy2oZ2rDjLL9/MVbz8NXg/b4omoR9W+UU=', 0, 0, '00001000000200751201', 'MIIEZTCCA02gAwIBAgIUMDAwMDEwMDAwMDAyMDA3NTEyMDEwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDQxMDIwNTg1MFoXDTE2MDQxMDIwNTg1MFowgaYxGDAWBgNVBAMTD0JSQVVOIEhVRVJJTiBTQzEYMBYGA1UEKRMPQlJBVU4gSFVFUklOIFNDMRgwFgYDVQQKEw9CUkFVTiBIVUVSSU4gU0MxJTAjBgNVBC0THEJIVTEyMDMyMENRMSAvIEhFQUY3MTExMDJRVjUxHjAcBgNVBAUTFSAvIEhFQUY3MTExMDJIQ1NSUlIwOTEPMA0GA1UECxMGVU5JREFEMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDzAysAe8MCguM2dNpiuLJVBQ+l09epMs+bPKrDpl7fdkWDwjdS8HATOkg6Be9c+oRM+ULN3idq6QZJQSaIKfZYS4zZOvqE3+zpIpYB7n+C3QryrmkakSMBIlnDwZojJnIG+7BZqxbF0FF7Iu9XTG0LmnRYDrbA4HQvHiR3dYDBbwIDAQABox0wGzAMBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BAQUFAAOCAQEAMUl0MFQnEZJu+BhwEJgAKIF16f2z2OA6UcDtA7yHlzwU6gsaRQ2QhNRUEiONdRccT+YqU28kJGt86/UVTfxD3aon33qc9I2H4M/T40EbkYSxV3OOAffCsH3NA2b/xMcsLcFny0u7bS/DnAkLi9SIJQ+FZmbRKLYKbechhrG3wpAY8qQWEtIbs82kX6/X4J0mahXHuazwB4ZP4VwaJ3lZE11+3xsLvRDhXRtZMkrZIZwQ4pRo6EpVmq5dPtHUv9z6WbzkbYbrPgHWiWt/GU6DeTQn/2S3VGaG/e7mV5Ac2vF+72GYSsYHyixkI8Jpt1IgihAwfYBIcSbHXsD3v9kfRw==', 1.000000, 0.000000, '', 1.160000, 'ingreso', '||3.2|2013-03-04T10:32:26|ingreso|Pago en Una Sola Exhibicion|1.00|0.00|1.00|peso|1.16|dasda|matriz|LSF100610LS2|DEMO FACTURASE|DEMO|13|45|DEMO|DEMO|DEMO|DEMO|DEMO|DEMO|11111|R??©gimen de las Personas F??­sicas con Actividades Empresariales y Profesionales|LOAD850511SX3|daniel l??³pez|calle ac??©ntos|123|321|col|num|est|Mexico|00123|1.00|da|dasdasd|1.00|1.00|IVA|0.00|ISR|0.00|0.00|IVA|16.00|0.16|IEPS|0.00|0.00|0.16||', '15_A_17', 1, '1', 0.160000, 'I', NULL, NULL, NULL, 'a%3A9%3A%7Bs%3A16%3A%22datosFacturacion%22%3Bs%3A562%3A%22userId%3D618%26rfc%3DLOAD850511SX3%26razonSocial%3Ddaniel%2520l%25C3%25B3pez%26calle%3Dcalle%2520ac%25C3%25A9ntos%26noExt%3D123%26noInt%3D321%26colonia%3Dcol%26municipio%3Dnum%26estado%3Dest%26localidad%3D%26cp%3D00123%26pais%3DMexico%26referencia%3D%26email%3Dd%2540ta.com%26formaDePago%3DPago%2520en%2520Una%2520Sola%2520Exhibicion%26condicionesDePago%3D%26metodoDePago%3Ddasda%26NumCtaPago%3D%26tasaIva%3D16%26tiposDeMoneda%3Dpeso%26porcentajeRetIva%3D0%26porcentajeIEPS%3D%26porcentajeDescuento%3D%26tipoDeCambio%3D%26porcentajeRetIsr%3D0%26tiposComprobanteId%3D1-5%26sucursalId%3D1%26cantidad%3D1%26noIdentificacion%3D%26unidad%3Dda%26valorUnitario%3D1%26excentoIva%3Dno%26descripcion%3Ddasdasd%26observaciones%3D%22%3Bs%3A13%3A%22observaciones%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22reviso%22%3Bs%3A0%3A%22%22%3Bs%3A8%3A%22autorizo%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22recibio%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22vobo%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22pago%22%3Bs%3A0%3A%22%22%3Bs%3A3%3A%22spf%22%3BN%3Bs%3A3%3A%22isn%22%3BN%3B%7D', NULL, NULL, 'a%3A1%3A%7Bi%3A1%3Ba%3A9%3A%7Bs%3A16%3A%22noIdentificacion%22%3Bs%3A0%3A%22%22%3Bs%3A8%3A%22cantidad%22%3Bd%3A1%3Bs%3A6%3A%22unidad%22%3Bs%3A2%3A%22da%22%3Bs%3A13%3A%22valorUnitario%22%3Bd%3A1%3Bs%3A7%3A%22importe%22%3Bd%3A1%3Bs%3A10%3A%22excentoIva%22%3Bs%3A2%3A%22no%22%3Bs%3A11%3A%22descripcion%22%3Bs%3A7%3A%22dasdasd%22%3Bs%3A17%3A%22categoriaConcepto%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22tasaIva%22%3Bd%3A16%3B%7D%7D', 'N%3B', 'a:9:{s:14:\"schemaLocation\";s:122:\"http://www.sat.gob.mx/TimbreFiscalDigital http://www.sat.gob.mx/sitio_internet/TimbreFiscalDigital/TimbreFiscalDigital.xsd\";s:7:\"version\";s:3:\"1.0\";s:4:\"UUID\";s:36:\"F8FF83A7-7E57-4300-A46C-216F33BE4666\";s:13:\"FechaTimbrado\";s:19:\"2013-03-04T10:32:28\";s:8:\"selloCFD\";s:172:\"QcyN1N5Ev2fr/FjDQL1GDouoo2YDiX0MEXS1bPVJi42ZB7U1jX7/imKQ3hrVENrnDwe9q4dbYnv0kLeA26GMTy2xxikmeYQiUpDmFeFhS/9eCZxPU0Qi9Y5dJpOQlv8zmfH4pYIxqDXy2oZ2rDjLL9/MVbz8NXg/b4omoR9W+UU=\";s:16:\"noCertificadoSAT\";s:20:\"20001000000100005867\";s:8:\"selloSAT\";s:172:\"aRATyuDod6uL//lfXOI8KP2FUGGSeYPY6TNmgIjReGtJQZ3BDnkHePaqdjv8juxdwB8i+YDUMjAXIrEGzUYRL5ELox9RWwRXKgZs0fZl9eVWqmF7aqFRyOgsNpmO9JbLmnSBNh8xZeNO1gZ7JO0D2T0byYhK2IEPPyQnmNSpfxU=\";s:8:\"original\";s:258:\"||1.0|F8FF83A7-7E57-4300-A46C-216F33BE4666|2013-03-04T10:32:28|QcyN1N5Ev2fr/FjDQL1GDouoo2YDiX0MEXS1bPVJi42ZB7U1jX7/imKQ3hrVENrnDwe9q4dbYnv0kLeA26GMTy2xxikmeYQiUpDmFeFhS/9eCZxPU0Qi9Y5dJpOQlv8zmfH4pYIxqDXy2oZ2rDjLL9/MVbz8NXg/b4omoR9W UU=|20001000000100005867||\";s:4:\"sha1\";s:40:\"2b6b0d82638f686718406abb2dff18f46c77d39c\";}'),
(18, 618, 'Pago%20en%20Una%20Sola%20Exhibicion', '', 'dasda', '16', 'peso', 1.00, '0', '0', 1, 0, 0, 15, 1, '', '2.0', 'A', 18, '2013-03-04 10:32:40', 'amKWYxNRTIeZZxYyklV5rjVQZ/GRmXb8Fs6RZQxCAEYX/x2wv+2tqj1xNncfwVh+SlscTi2NEr/UJosnZUGg56tdKKb1cRc6/BNFzB2j89bJixndYuYeqqIkr4Va/aqff31O0oslPgP+dWfDoLSnFNVThztdOaGGtRL3ESeo+Lw=', 0, 0, '00001000000200751201', 'MIIEZTCCA02gAwIBAgIUMDAwMDEwMDAwMDAyMDA3NTEyMDEwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDQxMDIwNTg1MFoXDTE2MDQxMDIwNTg1MFowgaYxGDAWBgNVBAMTD0JSQVVOIEhVRVJJTiBTQzEYMBYGA1UEKRMPQlJBVU4gSFVFUklOIFNDMRgwFgYDVQQKEw9CUkFVTiBIVUVSSU4gU0MxJTAjBgNVBC0THEJIVTEyMDMyMENRMSAvIEhFQUY3MTExMDJRVjUxHjAcBgNVBAUTFSAvIEhFQUY3MTExMDJIQ1NSUlIwOTEPMA0GA1UECxMGVU5JREFEMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDzAysAe8MCguM2dNpiuLJVBQ+l09epMs+bPKrDpl7fdkWDwjdS8HATOkg6Be9c+oRM+ULN3idq6QZJQSaIKfZYS4zZOvqE3+zpIpYB7n+C3QryrmkakSMBIlnDwZojJnIG+7BZqxbF0FF7Iu9XTG0LmnRYDrbA4HQvHiR3dYDBbwIDAQABox0wGzAMBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BAQUFAAOCAQEAMUl0MFQnEZJu+BhwEJgAKIF16f2z2OA6UcDtA7yHlzwU6gsaRQ2QhNRUEiONdRccT+YqU28kJGt86/UVTfxD3aon33qc9I2H4M/T40EbkYSxV3OOAffCsH3NA2b/xMcsLcFny0u7bS/DnAkLi9SIJQ+FZmbRKLYKbechhrG3wpAY8qQWEtIbs82kX6/X4J0mahXHuazwB4ZP4VwaJ3lZE11+3xsLvRDhXRtZMkrZIZwQ4pRo6EpVmq5dPtHUv9z6WbzkbYbrPgHWiWt/GU6DeTQn/2S3VGaG/e7mV5Ac2vF+72GYSsYHyixkI8Jpt1IgihAwfYBIcSbHXsD3v9kfRw==', 1.000000, 0.000000, '', 1.160000, 'ingreso', '||3.2|2013-03-04T10:32:40|ingreso|Pago en Una Sola Exhibicion|1.00|0.00|1.00|peso|1.16|dasda|matriz|LSF100610LS2|DEMO FACTURASE|DEMO|13|45|DEMO|DEMO|DEMO|DEMO|DEMO|DEMO|11111|R??©gimen de las Personas F??­sicas con Actividades Empresariales y Profesionales|LOAD850511SX3|daniel l??³pez|calle ac??©ntos|123|321|col|num|est|Mexico|00123|1.00|da|dasdasd|1.00|1.00|IVA|0.00|ISR|0.00|0.00|IVA|16.00|0.16|IEPS|0.00|0.00|0.16||', '15_A_18', 1, '0', 0.160000, 'I', NULL, '2013-03-04', NULL, 'a%3A9%3A%7Bs%3A16%3A%22datosFacturacion%22%3Bs%3A562%3A%22userId%3D618%26rfc%3DLOAD850511SX3%26razonSocial%3Ddaniel%2520l%25C3%25B3pez%26calle%3Dcalle%2520ac%25C3%25A9ntos%26noExt%3D123%26noInt%3D321%26colonia%3Dcol%26municipio%3Dnum%26estado%3Dest%26localidad%3D%26cp%3D00123%26pais%3DMexico%26referencia%3D%26email%3Dd%2540ta.com%26formaDePago%3DPago%2520en%2520Una%2520Sola%2520Exhibicion%26condicionesDePago%3D%26metodoDePago%3Ddasda%26NumCtaPago%3D%26tasaIva%3D16%26tiposDeMoneda%3Dpeso%26porcentajeRetIva%3D0%26porcentajeIEPS%3D%26porcentajeDescuento%3D%26tipoDeCambio%3D%26porcentajeRetIsr%3D0%26tiposComprobanteId%3D1-5%26sucursalId%3D1%26cantidad%3D1%26noIdentificacion%3D%26unidad%3Dda%26valorUnitario%3D1%26excentoIva%3Dno%26descripcion%3Ddasdasd%26observaciones%3D%22%3Bs%3A13%3A%22observaciones%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22reviso%22%3Bs%3A0%3A%22%22%3Bs%3A8%3A%22autorizo%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22recibio%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22vobo%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22pago%22%3Bs%3A0%3A%22%22%3Bs%3A3%3A%22spf%22%3BN%3Bs%3A3%3A%22isn%22%3BN%3B%7D', 'test', NULL, 'a%3A1%3A%7Bi%3A1%3Ba%3A9%3A%7Bs%3A16%3A%22noIdentificacion%22%3Bs%3A0%3A%22%22%3Bs%3A8%3A%22cantidad%22%3Bd%3A1%3Bs%3A6%3A%22unidad%22%3Bs%3A2%3A%22da%22%3Bs%3A13%3A%22valorUnitario%22%3Bd%3A1%3Bs%3A7%3A%22importe%22%3Bd%3A1%3Bs%3A10%3A%22excentoIva%22%3Bs%3A2%3A%22no%22%3Bs%3A11%3A%22descripcion%22%3Bs%3A7%3A%22dasdasd%22%3Bs%3A17%3A%22categoriaConcepto%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22tasaIva%22%3Bd%3A16%3B%7D%7D', 'N%3B', 'a:9:{s:14:\"schemaLocation\";s:122:\"http://www.sat.gob.mx/TimbreFiscalDigital http://www.sat.gob.mx/sitio_internet/TimbreFiscalDigital/TimbreFiscalDigital.xsd\";s:7:\"version\";s:3:\"1.0\";s:4:\"UUID\";s:36:\"3AFE44B3-7E57-4820-9882-6D323EF32323\";s:13:\"FechaTimbrado\";s:19:\"2013-03-04T10:32:42\";s:8:\"selloCFD\";s:172:\"amKWYxNRTIeZZxYyklV5rjVQZ/GRmXb8Fs6RZQxCAEYX/x2wv+2tqj1xNncfwVh+SlscTi2NEr/UJosnZUGg56tdKKb1cRc6/BNFzB2j89bJixndYuYeqqIkr4Va/aqff31O0oslPgP+dWfDoLSnFNVThztdOaGGtRL3ESeo+Lw=\";s:16:\"noCertificadoSAT\";s:20:\"20001000000100005867\";s:8:\"selloSAT\";s:172:\"CIYh+XrLFeIPkY1vcIrz3r8Ytj8++VIfU4IDU8TGDNcawpr/W8eibPcU0ePhQuygyLH0Vhi4ooVtg7xyAotMG69hBXEaZLergDBcFCy0mLHokFPaTmSVj3Uz7kGfyLxysVBTJUDJ1xywU5uGUvr783KxpJ+ZyI5O8e1HEqbrZIk=\";s:8:\"original\";s:258:\"||1.0|3AFE44B3-7E57-4820-9882-6D323EF32323|2013-03-04T10:32:42|amKWYxNRTIeZZxYyklV5rjVQZ/GRmXb8Fs6RZQxCAEYX/x2wv 2tqj1xNncfwVh SlscTi2NEr/UJosnZUGg56tdKKb1cRc6/BNFzB2j89bJixndYuYeqqIkr4Va/aqff31O0oslPgP dWfDoLSnFNVThztdOaGGtRL3ESeo Lw=|20001000000100005867||\";s:4:\"sha1\";s:40:\"0629464b1af7bd3b4fe9745ea786016a144c7113\";}'),
(19, 618, 'Pago%20en%20Una%20Sola%20Exhibicion', '', 'dasda', '16', 'peso', 1.00, '0', '0', 1, 0, 0, 15, 1, '', '2.0', 'A', 19, '2013-03-04 10:32:48', 'lC4eksYQxXkmxhapDzPy/drAk3SuehOqb9MvB2vXcjsrc/eN8TEhe7e6w6LBmLUNn8ZuAWXYXCR5rUfot6DBPmoGhT9ENrntbIZT5oK+3l1Asvs1bTyY+dgv5h1KDdwA/I9ARs3HiRDOS22INxnd/njVMHKyd0APfj+whJa+d6U=', 0, 0, '00001000000200751201', 'MIIEZTCCA02gAwIBAgIUMDAwMDEwMDAwMDAyMDA3NTEyMDEwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDQxMDIwNTg1MFoXDTE2MDQxMDIwNTg1MFowgaYxGDAWBgNVBAMTD0JSQVVOIEhVRVJJTiBTQzEYMBYGA1UEKRMPQlJBVU4gSFVFUklOIFNDMRgwFgYDVQQKEw9CUkFVTiBIVUVSSU4gU0MxJTAjBgNVBC0THEJIVTEyMDMyMENRMSAvIEhFQUY3MTExMDJRVjUxHjAcBgNVBAUTFSAvIEhFQUY3MTExMDJIQ1NSUlIwOTEPMA0GA1UECxMGVU5JREFEMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDzAysAe8MCguM2dNpiuLJVBQ+l09epMs+bPKrDpl7fdkWDwjdS8HATOkg6Be9c+oRM+ULN3idq6QZJQSaIKfZYS4zZOvqE3+zpIpYB7n+C3QryrmkakSMBIlnDwZojJnIG+7BZqxbF0FF7Iu9XTG0LmnRYDrbA4HQvHiR3dYDBbwIDAQABox0wGzAMBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BAQUFAAOCAQEAMUl0MFQnEZJu+BhwEJgAKIF16f2z2OA6UcDtA7yHlzwU6gsaRQ2QhNRUEiONdRccT+YqU28kJGt86/UVTfxD3aon33qc9I2H4M/T40EbkYSxV3OOAffCsH3NA2b/xMcsLcFny0u7bS/DnAkLi9SIJQ+FZmbRKLYKbechhrG3wpAY8qQWEtIbs82kX6/X4J0mahXHuazwB4ZP4VwaJ3lZE11+3xsLvRDhXRtZMkrZIZwQ4pRo6EpVmq5dPtHUv9z6WbzkbYbrPgHWiWt/GU6DeTQn/2S3VGaG/e7mV5Ac2vF+72GYSsYHyixkI8Jpt1IgihAwfYBIcSbHXsD3v9kfRw==', 1.000000, 0.000000, '', 1.160000, 'ingreso', '||3.2|2013-03-04T10:32:48|ingreso|Pago en Una Sola Exhibicion|1.00|0.00|1.00|peso|1.16|dasda|matriz|LSF100610LS2|DEMO FACTURASE|DEMO|13|45|DEMO|DEMO|DEMO|DEMO|DEMO|DEMO|11111|R??©gimen de las Personas F??­sicas con Actividades Empresariales y Profesionales|LOAD850511SX3|daniel l??³pez|calle ac??©ntos|123|321|col|num|est|Mexico|00123|1.00|da|dasdasd|1.00|1.00|IVA|0.00|ISR|0.00|0.00|IVA|16.00|0.16|IEPS|0.00|0.00|0.16||', '15_A_19', 1, '0', 0.160000, 'I', NULL, '2013-03-04', NULL, 'a%3A9%3A%7Bs%3A16%3A%22datosFacturacion%22%3Bs%3A562%3A%22userId%3D618%26rfc%3DLOAD850511SX3%26razonSocial%3Ddaniel%2520l%25C3%25B3pez%26calle%3Dcalle%2520ac%25C3%25A9ntos%26noExt%3D123%26noInt%3D321%26colonia%3Dcol%26municipio%3Dnum%26estado%3Dest%26localidad%3D%26cp%3D00123%26pais%3DMexico%26referencia%3D%26email%3Dd%2540ta.com%26formaDePago%3DPago%2520en%2520Una%2520Sola%2520Exhibicion%26condicionesDePago%3D%26metodoDePago%3Ddasda%26NumCtaPago%3D%26tasaIva%3D16%26tiposDeMoneda%3Dpeso%26porcentajeRetIva%3D0%26porcentajeIEPS%3D%26porcentajeDescuento%3D%26tipoDeCambio%3D%26porcentajeRetIsr%3D0%26tiposComprobanteId%3D1-5%26sucursalId%3D1%26cantidad%3D1%26noIdentificacion%3D%26unidad%3Dda%26valorUnitario%3D1%26excentoIva%3Dno%26descripcion%3Ddasdasd%26observaciones%3D%22%3Bs%3A13%3A%22observaciones%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22reviso%22%3Bs%3A0%3A%22%22%3Bs%3A8%3A%22autorizo%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22recibio%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22vobo%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22pago%22%3Bs%3A0%3A%22%22%3Bs%3A3%3A%22spf%22%3BN%3Bs%3A3%3A%22isn%22%3BN%3B%7D', 'test', NULL, 'a%3A1%3A%7Bi%3A1%3Ba%3A9%3A%7Bs%3A16%3A%22noIdentificacion%22%3Bs%3A0%3A%22%22%3Bs%3A8%3A%22cantidad%22%3Bd%3A1%3Bs%3A6%3A%22unidad%22%3Bs%3A2%3A%22da%22%3Bs%3A13%3A%22valorUnitario%22%3Bd%3A1%3Bs%3A7%3A%22importe%22%3Bd%3A1%3Bs%3A10%3A%22excentoIva%22%3Bs%3A2%3A%22no%22%3Bs%3A11%3A%22descripcion%22%3Bs%3A7%3A%22dasdasd%22%3Bs%3A17%3A%22categoriaConcepto%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22tasaIva%22%3Bd%3A16%3B%7D%7D', 'N%3B', 'a:9:{s:14:\"schemaLocation\";s:122:\"http://www.sat.gob.mx/TimbreFiscalDigital http://www.sat.gob.mx/sitio_internet/TimbreFiscalDigital/TimbreFiscalDigital.xsd\";s:7:\"version\";s:3:\"1.0\";s:4:\"UUID\";s:36:\"97A3B78E-7E57-4820-843A-A5CC8EFC48CE\";s:13:\"FechaTimbrado\";s:19:\"2013-03-04T10:32:50\";s:8:\"selloCFD\";s:172:\"lC4eksYQxXkmxhapDzPy/drAk3SuehOqb9MvB2vXcjsrc/eN8TEhe7e6w6LBmLUNn8ZuAWXYXCR5rUfot6DBPmoGhT9ENrntbIZT5oK+3l1Asvs1bTyY+dgv5h1KDdwA/I9ARs3HiRDOS22INxnd/njVMHKyd0APfj+whJa+d6U=\";s:16:\"noCertificadoSAT\";s:20:\"20001000000100005867\";s:8:\"selloSAT\";s:172:\"HYJ2XczKMaM4glxfSRGrSuLA9WI57xCm4RjGXbTlrFNZN8fqtT/Lo2rwaZm9zg6k97rwNyJQLNinDmoVFR1ZSa5lvD3P3pPka6/XtAq8DTYQptEOMMKOGGzno8owQSW6uaoRPqLMWoLRVWBGkkmHUtg93VbBJAb+3POOK4YTlds=\";s:8:\"original\";s:258:\"||1.0|97A3B78E-7E57-4820-843A-A5CC8EFC48CE|2013-03-04T10:32:50|lC4eksYQxXkmxhapDzPy/drAk3SuehOqb9MvB2vXcjsrc/eN8TEhe7e6w6LBmLUNn8ZuAWXYXCR5rUfot6DBPmoGhT9ENrntbIZT5oK 3l1Asvs1bTyY dgv5h1KDdwA/I9ARs3HiRDOS22INxnd/njVMHKyd0APfj whJa d6U=|20001000000100005867||\";s:4:\"sha1\";s:40:\"49785991609c7e0129040a9657c19eaa2f41dcf3\";}'),
(20, 626, 'Pago%20en%20Una%20Sola%20Exhibicion', 'kj', 'Efectivo', '16', 'peso', 1.00, '0', '0', 1, 3, 0, 15, 1, '', '2.0', 'A', 20, '2013-03-05 17:41:53', 'Or67iyPL0ZgR6anDMoybNvqr/RFqxc1YvbNj0CaAv20J+BmbJq/DHGmWkddeMQxoEEYx5tnmubZOx9vkYkJQCyGrr/wn4YYJJmL7Hjhuee5aepIy78eDc25AiEa0iiA6aPtxiXcncZS2kyJvE5a6Q+n0QIMT/Q2hthb/dl3I9MU=', 0, 0, '00001000000200751201', 'MIIEZTCCA02gAwIBAgIUMDAwMDEwMDAwMDAyMDA3NTEyMDEwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDQxMDIwNTg1MFoXDTE2MDQxMDIwNTg1MFowgaYxGDAWBgNVBAMTD0JSQVVOIEhVRVJJTiBTQzEYMBYGA1UEKRMPQlJBVU4gSFVFUklOIFNDMRgwFgYDVQQKEw9CUkFVTiBIVUVSSU4gU0MxJTAjBgNVBC0THEJIVTEyMDMyMENRMSAvIEhFQUY3MTExMDJRVjUxHjAcBgNVBAUTFSAvIEhFQUY3MTExMDJIQ1NSUlIwOTEPMA0GA1UECxMGVU5JREFEMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDzAysAe8MCguM2dNpiuLJVBQ+l09epMs+bPKrDpl7fdkWDwjdS8HATOkg6Be9c+oRM+ULN3idq6QZJQSaIKfZYS4zZOvqE3+zpIpYB7n+C3QryrmkakSMBIlnDwZojJnIG+7BZqxbF0FF7Iu9XTG0LmnRYDrbA4HQvHiR3dYDBbwIDAQABox0wGzAMBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BAQUFAAOCAQEAMUl0MFQnEZJu+BhwEJgAKIF16f2z2OA6UcDtA7yHlzwU6gsaRQ2QhNRUEiONdRccT+YqU28kJGt86/UVTfxD3aon33qc9I2H4M/T40EbkYSxV3OOAffCsH3NA2b/xMcsLcFny0u7bS/DnAkLi9SIJQ+FZmbRKLYKbechhrG3wpAY8qQWEtIbs82kX6/X4J0mahXHuazwB4ZP4VwaJ3lZE11+3xsLvRDhXRtZMkrZIZwQ4pRo6EpVmq5dPtHUv9z6WbzkbYbrPgHWiWt/GU6DeTQn/2S3VGaG/e7mV5Ac2vF+72GYSsYHyixkI8Jpt1IgihAwfYBIcSbHXsD3v9kfRw==', 663.000000, 0.000000, '', 743.210022, 'ingreso', '||3.2|2013-03-05T17:41:53|ingreso|Pago en Una Sola Exhibicion|kj|663.00|0.00|1.00|peso|743.21|Efectivo|matriz|0304|LSF100610LS2|DEMO FACTURASE|DEMO|13|45|DEMO|DEMO|DEMO|DEMO|DEMO|DEMO|11111|R??©gimen de las Personas F??­sicas con Actividades Empresariales y Profesionales|XAXX010101000|Jesus Velazquez Diaz|Av. Lomas del oriente|456|Chiapa de corzo|tuxtla gutierrez|Chiapas|M??©xico|29000|1.00|12|767|Libreta de notas marca office depot|143.00|143.00|1.00|12|767|Libreta de notas marca office depot0|143.00|143.00|1.00|12|767|Libretaa de nootas marca office depot0|143.00|143.00|1.00|23|767|Libretaa de nootas marca office depot0|234.00|234.00|IVA|0.00|ISR|0.00|0.00|IVA|16.00|60.32|IEPS|3.00|19.89|80.21||', '15_A_20', 1, '0', 60.320000, 'I', NULL, '2013-03-05', NULL, 'a%3A9%3A%7Bs%3A16%3A%22datosFacturacion%22%3Bs%3A676%3A%22userId%3D626%26rfc%3DXAXX010101000%26razonSocial%3DJesus%2520Velazquez%2520Diaz%26calle%3DAv.%2520Lomas%2520del%2520oriente%26noExt%3D456%26noInt%3D%26colonia%3DChiapa%2520de%2520corzo%26municipio%3Dtuxtla%2520gutierrez%26estado%3DChiapas%26localidad%3D%26cp%3D29000%26pais%3DM%25C3%25A9xico%26referencia%3D%26email%3Ddarchus%2540gmail.com%26formaDePago%3DPago%2520en%2520Una%2520Sola%2520Exhibicion%26condicionesDePago%3Dkj%26metodoDePago%3DEfectivo%26NumCtaPago%3D0304%26tasaIva%3D16%26tiposDeMoneda%3Dpeso%26porcentajeRetIva%3D0%26porcentajeIEPS%3D3%26porcentajeDescuento%3D%26tipoDeCambio%3D%26porcentajeRetIsr%3D0%26tiposComprobanteId%3D1-5%26sucursalId%3D1%26cantidad%3D1%26noIdentificacion%3D767%26unidad%3D23%26valorUnitario%3D234%26excentoIva%3Dno%26descripcion%3DLibretaa%2520de%2520nootas%2520marca%2520office%2520depot0%26observaciones%3D%22%3Bs%3A13%3A%22observaciones%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22reviso%22%3Bs%3A0%3A%22%22%3Bs%3A8%3A%22autorizo%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22recibio%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22vobo%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22pago%22%3Bs%3A0%3A%22%22%3Bs%3A3%3A%22spf%22%3BN%3Bs%3A3%3A%22isn%22%3BN%3B%7D', 'No nos realizo el pago', NULL, 'a%3A4%3A%7Bi%3A3%3Ba%3A9%3A%7Bs%3A16%3A%22noIdentificacion%22%3Bs%3A3%3A%22767%22%3Bs%3A8%3A%22cantidad%22%3Bd%3A1%3Bs%3A6%3A%22unidad%22%3Bs%3A2%3A%2212%22%3Bs%3A13%3A%22valorUnitario%22%3Bd%3A143%3Bs%3A7%3A%22importe%22%3Bd%3A143%3Bs%3A10%3A%22excentoIva%22%3Bs%3A2%3A%22si%22%3Bs%3A11%3A%22descripcion%22%3Bs%3A35%3A%22Libreta+de+notas+marca+office+depot%22%3Bs%3A17%3A%22categoriaConcepto%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22tasaIva%22%3Bi%3A0%3B%7Di%3A4%3Ba%3A9%3A%7Bs%3A16%3A%22noIdentificacion%22%3Bs%3A3%3A%22767%22%3Bs%3A8%3A%22cantidad%22%3Bd%3A1%3Bs%3A6%3A%22unidad%22%3Bs%3A2%3A%2212%22%3Bs%3A13%3A%22valorUnitario%22%3Bd%3A143%3Bs%3A7%3A%22importe%22%3Bd%3A143%3Bs%3A10%3A%22excentoIva%22%3Bs%3A2%3A%22si%22%3Bs%3A11%3A%22descripcion%22%3Bs%3A36%3A%22Libreta+de+notas+marca+office+depot0%22%3Bs%3A17%3A%22categoriaConcepto%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22tasaIva%22%3Bi%3A0%3B%7Di%3A5%3Ba%3A9%3A%7Bs%3A16%3A%22noIdentificacion%22%3Bs%3A3%3A%22767%22%3Bs%3A8%3A%22cantidad%22%3Bd%3A1%3Bs%3A6%3A%22unidad%22%3Bs%3A2%3A%2212%22%3Bs%3A13%3A%22valorUnitario%22%3Bd%3A143%3Bs%3A7%3A%22importe%22%3Bd%3A143%3Bs%3A10%3A%22excentoIva%22%3Bs%3A2%3A%22no%22%3Bs%3A11%3A%22descripcion%22%3Bs%3A38%3A%22Libretaa+de+nootas+marca+office+depot0%22%3Bs%3A17%3A%22categoriaConcepto%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22tasaIva%22%3Bd%3A16%3B%7Di%3A6%3Ba%3A9%3A%7Bs%3A16%3A%22noIdentificacion%22%3Bs%3A3%3A%22767%22%3Bs%3A8%3A%22cantidad%22%3Bd%3A1%3Bs%3A6%3A%22unidad%22%3Bs%3A2%3A%2223%22%3Bs%3A13%3A%22valorUnitario%22%3Bd%3A234%3Bs%3A7%3A%22importe%22%3Bd%3A234%3Bs%3A10%3A%22excentoIva%22%3Bs%3A2%3A%22no%22%3Bs%3A11%3A%22descripcion%22%3Bs%3A38%3A%22Libretaa+de+nootas+marca+office+depot0%22%3Bs%3A17%3A%22categoriaConcepto%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22tasaIva%22%3Bd%3A16%3B%7D%7D', 'N%3B', 'a:9:{s:14:\"schemaLocation\";s:122:\"http://www.sat.gob.mx/TimbreFiscalDigital http://www.sat.gob.mx/sitio_internet/TimbreFiscalDigital/TimbreFiscalDigital.xsd\";s:7:\"version\";s:3:\"1.0\";s:4:\"UUID\";s:36:\"09BF3F06-7E57-49D1-A1B7-DAF191B7B6FD\";s:13:\"FechaTimbrado\";s:19:\"2013-03-05T17:41:55\";s:8:\"selloCFD\";s:172:\"Or67iyPL0ZgR6anDMoybNvqr/RFqxc1YvbNj0CaAv20J+BmbJq/DHGmWkddeMQxoEEYx5tnmubZOx9vkYkJQCyGrr/wn4YYJJmL7Hjhuee5aepIy78eDc25AiEa0iiA6aPtxiXcncZS2kyJvE5a6Q+n0QIMT/Q2hthb/dl3I9MU=\";s:16:\"noCertificadoSAT\";s:20:\"20001000000100005867\";s:8:\"selloSAT\";s:172:\"TEv1StDHXowi1WUe2eqXLpAnO+iutYLPxIVGuggjsf2L6XkhnSCuX7MF7mLX7D5eCCvmB1GccF6utdWKnPPL6lqxU1XESm6bDBRJLR1vyXRc8Ds0zsZxjYSL+B0KKKjo8KowQGMpPLqUsFkmGg06OY3fpzrJH7KQt/fPF1jrWYI=\";s:8:\"original\";s:258:\"||1.0|09BF3F06-7E57-49D1-A1B7-DAF191B7B6FD|2013-03-05T17:41:55|Or67iyPL0ZgR6anDMoybNvqr/RFqxc1YvbNj0CaAv20J BmbJq/DHGmWkddeMQxoEEYx5tnmubZOx9vkYkJQCyGrr/wn4YYJJmL7Hjhuee5aepIy78eDc25AiEa0iiA6aPtxiXcncZS2kyJvE5a6Q n0QIMT/Q2hthb/dl3I9MU=|20001000000100005867||\";s:4:\"sha1\";s:40:\"4d9d572d8435adc14c097a1d62fd0174155f8237\";}'),
(21, 636, 'Pago%20en%20Una%20Sola%20Exhibicion', '', 'Efectivo', '16', 'peso', 1.00, '0', '0', 1, 0, 0, 15, 1, '', '2.0', 'A', 1, '2013-03-06 14:40:24', 'pvUrKTCFx7XD5XDd0txvUFQLHp21K0TIdrXRv0ad7qkaoEf/vTRlX6PGXfZLh4w4oz+rFWcXkTdoQtNQYKUrZsJCGBl1PpeQrt1tTOJN5IhmfaWq7TqOHGjIfnOR7AlzW8bDSJlba/wNvtDb6IJNYtoxy6jfagnJPbG+j+PGkhI=', 0, 0, '00001000000201889852', 'MIIEdDCCA1ygAwIBAgIUMDAwMDEwMDAwMDAyMDE4ODk4NTIwDQYJKoZIhvcNAQEFBQAwggGVMTgwNgYDVQQDDC9BLkMuIGRlbCBTZXJ2aWNpbyBkZSBBZG1pbmlzdHJhY2nDs24gVHJpYnV0YXJpYTEvMC0GA1UECgwmU2VydmljaW8gZGUgQWRtaW5pc3RyYWNpw7NuIFRyaWJ1dGFyaWExODA2BgNVBAsML0FkbWluaXN0cmFjacOzbiBkZSBTZWd1cmlkYWQgZGUgbGEgSW5mb3JtYWNpw7NuMSEwHwYJKoZIhvcNAQkBFhJhc2lzbmV0QHNhdC5nb2IubXgxJjAkBgNVBAkMHUF2LiBIaWRhbGdvIDc3LCBDb2wuIEd1ZXJyZXJvMQ4wDAYDVQQRDAUwNjMwMDELMAkGA1UEBhMCTVgxGTAXBgNVBAgMEERpc3RyaXRvIEZlZGVyYWwxFDASBgNVBAcMC0N1YXVodMOpbW9jMRUwEwYDVQQtEwxTQVQ5NzA3MDFOTjMxPjA8BgkqhkiG9w0BCQIML1Jlc3BvbnNhYmxlOiBDZWNpbGlhIEd1aWxsZXJtaW5hIEdhcmPDrWEgR3VlcnJhMB4XDTEyMDkwNTE1MDQyNloXDTE2MDkwNTE1MDQyNlowgbUxIzAhBgNVBAMTGkRBTklFTCBBTEZPTlNPIExPUEVaIEFOR0VMMSMwIQYDVQQpExpEQU5JRUwgQUxGT05TTyBMT1BFWiBBTkdFTDEjMCEGA1UEChMaREFOSUVMIEFMRk9OU08gTE9QRVogQU5HRUwxFjAUBgNVBC0TDUxPQUQ4NTA1MTFTWDMxGzAZBgNVBAUTEkxPQUQ4NTA1MTFIQ1NQTk4wNjEPMA0GA1UECxMGbWF0cml6MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDCQ2peNeLvW2O0DTXeqwLrR+fKIT/Q1wsNMZUSh4Jbaj6lJWnBJxb7iR0hZbRB5ANAW5yQHNd+lEQQJPgNPd7eaRbS+7nCuI7KOYTEWWeFhLpqWEL2pMxOxnvGDdc1qI54SXUDarAq/SXrRtfuYqZw3+fEDt/f0A4xttAfrnF8rwIDAQABox0wGzAMBgNVHRMBAf8EAjAAMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BAQUFAAOCAQEAoBzuCpmK5Q1/Cvjlv4yL1/7iQHtB5XNyGR+LXQkX2/t/DjazyiAQgQFlIGHysrHCvxGKtpoUn8cFqEHcUydDJBDcsGNyaBGlfVmsRvv0MCCST9mYq1DCslHRo7cuf4C+6sN11TDTGI5J3oD9ev2zTo8SCup71bGbdPO0TH/H/6oQhoJIaw/CaMAuOIS0dFn2sbva/dstVPPHk6jg/nM6Pc5hKe9joGaf0zZfgylyneWU+Djfk5Arf7qBsmo2fNk+RWFGEFkiFQJdQElRMlg3xGmXuOmcbV+PAMJcNwPOqdFJho8fw5fG8j/tBjeB1gzlr8w6N4ckMyD74xvjJ06h1g==', 21.000000, 0.000000, '', 24.360001, 'ingreso', '||3.2|2013-03-06T14:40:24|ingreso|Pago en Una Sola Exhibicion|21.00|0.00|1.00|peso|24.36|Efectivo|matriz|0704|LSF100610LS2|DEMO FACTURASE|DEMO|13|45|DEMO|DEMO|DEMO|DEMO|DEMO|DEMO|11111|R??©gimen de las Personas F??­sicas con Actividades Empresariales y Profesionales|PEHM8003214EA|Miguel Angel perez Hernandez|Calle central norte|345|Potinaspack|tuxtla gutierrez|Chiapas|Mexico|34553|1.00|kg|01|Botana para el cliente|12.00|12.00|1.00|pieza|02|Refresco de cola|9.00|9.00|IVA|0.00|ISR|0.00|0.00|IVA|16.00|3.36|IEPS|0.00|0.00|3.36||', '15_A_1', 1, '0', 3.360000, 'I', NULL, '2013-03-06', NULL, 'a%3A9%3A%7Bs%3A16%3A%22datosFacturacion%22%3Bs%3A644%3A%22userId%3D636%26rfc%3DPEHM8003214EA%26razonSocial%3DMiguel%2520Angel%2520perez%2520Hernandez%26calle%3DCalle%2520central%2520norte%26noExt%3D345%26noInt%3D%26colonia%3DPotinaspack%26municipio%3Dtuxtla%2520gutierrez%26estado%3DChiapas%26localidad%3D%26cp%3D34553%26pais%3DMexico%26referencia%3D%26email%3Djvelazquez%2540trazzos.com%26formaDePago%3DPago%2520en%2520Una%2520Sola%2520Exhibicion%26condicionesDePago%3D%26metodoDePago%3DEfectivo%26NumCtaPago%3D0704%26tasaIva%3D16%26tiposDeMoneda%3Dpeso%26porcentajeRetIva%3D0%26porcentajeIEPS%3D%26porcentajeDescuento%3D%26tipoDeCambio%3D%26porcentajeRetIsr%3D0%26tiposComprobanteId%3D1-51%26sucursalId%3D1%26cantidad%3D1%26noIdentificacion%3D02%26unidad%3Dpieza%26valorUnitario%3D9%26excentoIva%3Dno%26descripcion%3DRefresco%2520de%2520cola%26observaciones%3D%22%3Bs%3A13%3A%22observaciones%22%3Bs%3A0%3A%22%22%3Bs%3A6%3A%22reviso%22%3Bs%3A0%3A%22%22%3Bs%3A8%3A%22autorizo%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22recibio%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22vobo%22%3Bs%3A0%3A%22%22%3Bs%3A4%3A%22pago%22%3Bs%3A0%3A%22%22%3Bs%3A3%3A%22spf%22%3BN%3Bs%3A3%3A%22isn%22%3BN%3B%7D', 'No nos ha realizado los pagos', NULL, 'a%3A2%3A%7Bi%3A1%3Ba%3A9%3A%7Bs%3A16%3A%22noIdentificacion%22%3Bs%3A2%3A%2201%22%3Bs%3A8%3A%22cantidad%22%3Bd%3A1%3Bs%3A6%3A%22unidad%22%3Bs%3A2%3A%22kg%22%3Bs%3A13%3A%22valorUnitario%22%3Bd%3A12%3Bs%3A7%3A%22importe%22%3Bd%3A12%3Bs%3A10%3A%22excentoIva%22%3Bs%3A2%3A%22no%22%3Bs%3A11%3A%22descripcion%22%3Bs%3A22%3A%22Botana+para+el+cliente%22%3Bs%3A17%3A%22categoriaConcepto%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22tasaIva%22%3Bd%3A16%3B%7Di%3A2%3Ba%3A9%3A%7Bs%3A16%3A%22noIdentificacion%22%3Bs%3A2%3A%2202%22%3Bs%3A8%3A%22cantidad%22%3Bd%3A1%3Bs%3A6%3A%22unidad%22%3Bs%3A5%3A%22pieza%22%3Bs%3A13%3A%22valorUnitario%22%3Bd%3A9%3Bs%3A7%3A%22importe%22%3Bd%3A9%3Bs%3A10%3A%22excentoIva%22%3Bs%3A2%3A%22no%22%3Bs%3A11%3A%22descripcion%22%3Bs%3A16%3A%22Refresco+de+cola%22%3Bs%3A17%3A%22categoriaConcepto%22%3Bs%3A0%3A%22%22%3Bs%3A7%3A%22tasaIva%22%3Bd%3A16%3B%7D%7D', 'N%3B', 'a:9:{s:14:\"schemaLocation\";s:122:\"http://www.sat.gob.mx/TimbreFiscalDigital http://www.sat.gob.mx/sitio_internet/TimbreFiscalDigital/TimbreFiscalDigital.xsd\";s:7:\"version\";s:3:\"1.0\";s:4:\"UUID\";s:36:\"8872510C-7E57-4A12-B307-C78DA1B1FAA0\";s:13:\"FechaTimbrado\";s:19:\"2013-03-06T14:40:26\";s:8:\"selloCFD\";s:172:\"pvUrKTCFx7XD5XDd0txvUFQLHp21K0TIdrXRv0ad7qkaoEf/vTRlX6PGXfZLh4w4oz+rFWcXkTdoQtNQYKUrZsJCGBl1PpeQrt1tTOJN5IhmfaWq7TqOHGjIfnOR7AlzW8bDSJlba/wNvtDb6IJNYtoxy6jfagnJPbG+j+PGkhI=\";s:16:\"noCertificadoSAT\";s:20:\"20001000000100005867\";s:8:\"selloSAT\";s:172:\"q/HsdiSZCmRMzzbGFvtnltLKaaDmBtBPmOSbneb4e/he7Sw48qKAExvvwxBkzDtLRHCqTdXbPIyJfAqlY7y89sFW8e8CKQMo+NHTaSnha+0EObVh7R2o/YoRNT3NCLAPrxd9fyVajXnPUpfKteS+uOszw0YRV4CX3BzV7aKThec=\";s:8:\"original\";s:258:\"||1.0|8872510C-7E57-4A12-B307-C78DA1B1FAA0|2013-03-06T14:40:26|pvUrKTCFx7XD5XDd0txvUFQLHp21K0TIdrXRv0ad7qkaoEf/vTRlX6PGXfZLh4w4oz rFWcXkTdoQtNQYKUrZsJCGBl1PpeQrt1tTOJN5IhmfaWq7TqOHGjIfnOR7AlzW8bDSJlba/wNvtDb6IJNYtoxy6jfagnJPbG j PGkhI=|20001000000100005867||\";s:4:\"sha1\";s:40:\"b33c522c460fd4423b31bf6bd142c689db8bb429\";}');

-- --------------------------------------------------------

--
-- Table structure for table `concepto`
--

CREATE TABLE `concepto` (
  `comprobanteId` int(11) NOT NULL,
  `cantidad` float(10,2) NOT NULL,
  `unidad` varchar(255) DEFAULT NULL,
  `noIdentificacion` varchar(255) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `valorUnitario` float(10,2) NOT NULL,
  `excentoIva` enum('no','si') NOT NULL DEFAULT 'no',
  `importe` float(10,2) NOT NULL,
  `userId` int(11) NOT NULL,
  `empresaId` int(11) NOT NULL,
  `conceptoId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `escuela` varchar(255) NOT NULL DEFAULT 'INSTITUTO DE ADMINISTRACION PUBLICA DEL ESTADO DE CHIAPAS',
  `localidad` varchar(255) NOT NULL DEFAULT 'TUXTLA GUTIERREZ',
  `clave` varchar(255) NOT NULL DEFAULT 'TUXTLA GUTIERREZ',
  `municipio` varchar(255) NOT NULL DEFAULT 'TUXTLA GUTIERREZ',
  `respServiciosEscolares` varchar(255) NOT NULL DEFAULT 'LIC. EMELINA ALVAREZ TORRES',
  `jefeOficina` varchar(255) NOT NULL DEFAULT 'ARQ. CARLOS VAZQUEZ LOZADA',
  `presidente` varchar(255) NOT NULL DEFAULT 'LIC. ADRIANA CAMACHO PIMIENTA',
  `directorAcademico` varchar(255) NOT NULL DEFAULT 'LIC. HELENA JIMENEZ MARTINEZ'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`escuela`, `localidad`, `clave`, `municipio`, `respServiciosEscolares`, `jefeOficina`, `presidente`, `directorAcademico`) VALUES
('INSTITUTO DE ADMINISTRACION PUBLICA DEL ESTADO DE CHIAPAS', 'TUXTLA GUTIERREZ', '07PBT0381E', 'TUXTLA GUTIERREZ', 'LIC. EMELINA ALVAREZ TORRES', 'ARQ. CARLOS VAZQUEZ LOZADA', 'LIC. ADRIANA CAMACHO PIMIENTA', 'LUIS ENRIQUE ALVARADO GORDILLO');

-- --------------------------------------------------------

--
-- Table structure for table `configuracion`
--

CREATE TABLE `configuracion` (
  `configId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `valor` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `confirma_inscripcion`
--

CREATE TABLE `confirma_inscripcion` (
  `confirmaInscripcionId` int(11) NOT NULL,
  `courseModuleId` int(11) NOT NULL,
  `reinscrito` enum('no','si') NOT NULL,
  `nivel` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `courseId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `initialDate` date NOT NULL,
  `finalDate` date NOT NULL,
  `daysToFinish` int(4) NOT NULL,
  `active` enum('si','no') NOT NULL DEFAULT 'si',
  `modality` enum('Local','Online') NOT NULL DEFAULT 'Local',
  `access` text NOT NULL,
  `group` varchar(5) NOT NULL DEFAULT 'A',
  `turn` varchar(255) NOT NULL DEFAULT 'Matutino',
  `scholarCicle` varchar(255) NOT NULL,
  `libro` varchar(255) NOT NULL DEFAULT '03',
  `folio` varchar(255) NOT NULL DEFAULT '3',
  `backDiploma` varchar(255) NOT NULL DEFAULT 'DIRECTOR ACADEMICO',
  `ponenteText` varchar(255) NOT NULL DEFAULT 'PONENTE',
  `fechaDiploma` varchar(255) NOT NULL,
  `horario` varchar(255) NOT NULL,
  `dias` varchar(255) NOT NULL,
  `apareceTabla` enum('no','si') NOT NULL,
  `tarifaMtro` varchar(255) NOT NULL,
  `tarifaDr` varchar(255) NOT NULL,
  `hora` varchar(255) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `tipo` enum('Cuatrimestre','Semestre') NOT NULL,
  `listar` enum('no','si') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course_module`
--

CREATE TABLE `course_module` (
  `courseModuleId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `subjectModuleId` int(11) NOT NULL,
  `initialDate` date NOT NULL,
  `finalDate` date NOT NULL,
  `fechaContrato` date NOT NULL,
  `inicioContrato` date NOT NULL,
  `finContrato` date NOT NULL,
  `fechaMateria` date NOT NULL,
  `noContrato` varchar(255) NOT NULL,
  `habilitarDescargaContrato` enum('no','si') NOT NULL,
  `daysToFinish` int(11) NOT NULL,
  `active` enum('no','si') NOT NULL,
  `access` varchar(255) NOT NULL,
  `calificacionValida` enum('no','si') NOT NULL,
  `evalDocenteCompleta` varchar(255) NOT NULL,
  `creditos` varchar(255) NOT NULL,
  `habilitarCalificar` enum('si','no') NOT NULL,
  `rutaActa` varchar(255) NOT NULL,
  `perfilParticipante` text NOT NULL,
  `duracion` varchar(255) NOT NULL,
  `numParticipantes` varchar(255) NOT NULL,
  `horario` varchar(255) NOT NULL,
  `objetivoParticular` text NOT NULL,
  `estructutaTematica` text NOT NULL,
  `estructuraTematica` text NOT NULL,
  `criteriosEvaluacion` text NOT NULL,
  `tecnicas` text NOT NULL,
  `bibliografias` text NOT NULL,
  `rutaCedula` varchar(255) NOT NULL,
  `rutaContrato` varchar(255) NOT NULL,
  `rutaContratoFirmado` varchar(255) NOT NULL,
  `rutaPlan` varchar(255) NOT NULL,
  `rutaCarta` varchar(255) NOT NULL,
  `periodo` text NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `rutaEncuadre` varchar(255) NOT NULL,
  `rutaRubrica` varchar(255) NOT NULL,
  `rutaInforme` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course_module_personal`
--

CREATE TABLE `course_module_personal` (
  `personalId` int(11) NOT NULL,
  `courseModPId` int(11) NOT NULL,
  `courseModuleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course_module_score`
--

CREATE TABLE `course_module_score` (
  `courseModuleScoreId` int(11) NOT NULL,
  `courseModuleId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cuentaPredialConcepto`
--

CREATE TABLE `cuentaPredialConcepto` (
  `conceptoId` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `cuentaPredialConceptoId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cuentaPredialParte`
--

CREATE TABLE `cuentaPredialParte` (
  `conceptoId` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `cuentaPredialParteId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `documentosprofesor`
--

CREATE TABLE `documentosprofesor` (
  `documentosprofesorId` int(11) NOT NULL,
  `documentoId` int(11) NOT NULL,
  `personalId` int(11) NOT NULL,
  `ruta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE `estado` (
  `estadoId` int(11) NOT NULL,
  `clave` varchar(2) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `abrev` varchar(16) NOT NULL,
  `paisId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tabla de Estados de la Rep??ca Mexicana';

--
-- Dumping data for table `estado`
--

INSERT INTO `estado` (`estadoId`, `clave`, `nombre`, `abrev`, `paisId`) VALUES
(1, '01', 'Aguascalientes', 'Ags.', 1),
(2, '02', 'Baja California', 'BC', 1),
(3, '03', 'Baja California Sur', 'BCS', 1),
(4, '04', 'Campeche', 'Camp.', 1),
(5, '05', 'Coahuila', 'Coah.', 1),
(6, '06', 'Colima', 'Col.', 1),
(7, '07', 'Chiapas', 'Chis.', 1),
(8, '08', 'Chihuahua', 'Chih.', 1),
(9, '09', 'Distrito Federal', 'DF', 1),
(10, '10', 'Durango', 'Dgo.', 1),
(11, '11', 'Guanajuato', 'Gto.', 1),
(12, '12', 'Guerrero', 'Gro.', 1),
(13, '13', 'Hidalgo', 'Hgo.', 1),
(14, '14', 'Jalisco', 'Jal.', 1),
(15, '15', 'Mexico', 'Mex.', 1),
(16, '16', 'Michoacan', 'Mich.', 1),
(17, '17', 'Morelos', 'Mor.', 1),
(18, '18', 'Nayarit', 'Nay.', 1),
(19, '19', 'Nuevo Leon', 'NL', 1),
(20, '20', 'Oaxaca', 'Oax.', 1),
(21, '21', 'Puebla', 'Pue.', 1),
(22, '22', 'Queretaro', 'Qro.', 1),
(23, '23', 'Quintana Roo', 'Q. Roo', 1),
(24, '24', 'San Luis Potos', 'SLP', 1),
(25, '25', 'Sinaloa', 'Sin.', 1),
(26, '26', 'Sonora', 'Son.', 1),
(27, '27', 'Tabasco', 'Tab.', 1),
(28, '28', 'Tamaulipas', 'Tamps.', 1),
(29, '29', 'Tlaxcala', 'Tlax.', 1),
(30, '30', 'Veracruz', 'Ver.', 1),
(31, '31', 'Yucatan', 'Yuc.', 1),
(32, '32', 'Zacatecas', 'Zac.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `estudioprofesor`
--

CREATE TABLE `estudioprofesor` (
  `estudioprofesorId` int(11) NOT NULL,
  `tipo` enum('lic','master','doc') NOT NULL,
  `escuela` varchar(255) NOT NULL,
  `carrera` varchar(255) NOT NULL,
  `estudio` int(11) NOT NULL,
  `titulo` enum('no','si') NOT NULL,
  `actaExamen` enum('no','si') NOT NULL,
  `cedula` enum('no','si') NOT NULL,
  `personalId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `estudioprofesor`
--

INSERT INTO `estudioprofesor` (`estudioprofesorId`, `tipo`, `escuela`, `carrera`, `estudio`, `titulo`, `actaExamen`, `cedula`, `personalId`) VALUES
(13, 'lic', 'ITTG', 'Ing. en Sistemas Computacionales', 0, 'si', 'no', 'si', 130),
(14, 'master', 'ITESM', 'Administración de Tecnologías de la Información', 0, 'si', 'no', 'si', 130),
(15, 'doc', 'SI', 'SI', 0, 'no', 'no', 'no', 130),
(16, 'lic', 'Instituto de Estudios Superiores de Chiapas', 'Licenciatura en Derecho', 0, 'si', 'si', 'si', 172),
(17, 'master', 'Instituto Nacional de Estudios Fiscales', 'Maestría en Derecho Constitucional y Amparo', 0, 'si', 'si', 'no', 172),
(18, 'doc', 'Instituto de Administración Pública, A.C.', 'Doctorado en Administración Pública', 0, 'no', 'no', 'no', 172),
(19, 'lic', 'UNIVERSIADAD AUTONOMA DE CHIAPAS', 'INGENIERO AGRONOMO', 0, 'si', 'si', 'si', 166),
(20, 'master', 'COLEGIO DE POSGRADUADOS', 'MAESTRO EN CIENCIAS', 0, 'si', 'si', 'no', 166),
(21, 'doc', 'AUBURN UNIVERSITY,  ALABAMA, USA', 'PHYLOSOPHY DOCTOR', 0, 'si', 'si', 'no', 166),
(22, 'lic', 'Universidad Iberoamericana', 'Ingeniería civil', 0, 'si', 'no', 'si', 147),
(23, 'master', 'Instituto de Administración Pública de Chiapas, A.C.', 'Administración y Políticas Públicas', 0, 'si', 'no', 'no', 147),
(24, 'doc', '', '', 0, 'no', 'no', 'no', 147),
(25, 'lic', 'Instituto de Estudios Superiores de Chiapas', 'Contador Público', 0, 'si', 'si', 'si', 154),
(26, 'master', 'Universidad de Zaragoza, España', 'Contabilidad y Finanzas', 0, 'si', 'si', 'no', 154),
(27, 'doc', 'Universidad de Zaragoza, España', 'Contabilidad y Finanzas', 0, 'si', 'si', 'no', 154),
(28, 'lic', 'Instituto de Estudios Superiores de Chiapas', 'Licenciatura en Derecho', 0, 'si', 'si', 'si', 171),
(29, 'master', 'Universidad Carlos III de Madrid', 'Master en de Derechos Fundamentales', 0, 'si', 'no', 'no', 171),
(30, 'doc', 'Instituto de Investigaciones Jurídicas UNACH', 'Doctorado en Derecho', 0, 'no', 'si', 'no', 171),
(31, 'lic', 'Facultad de Ciencias Sociales. UNACH', 'Licenciatura en economía', 0, 'si', 'si', 'si', 174),
(32, 'master', 'Centro de Estudios Superiores de México y Centroamérica. Universidad de Ciencias y Artes de Chiapas. (CESMECA-UNICACH)', 'Maestría en Ciencias Sociales y Humanísticas', 0, 'si', 'si', 'si', 174),
(33, 'doc', 'Centro de Estudios Superiores de México y Centroamérica. Universidad de Ciencias y Artes de Chiapas. (CESMECA-UNICACH)', 'Doctorado en Ciencias Sociales y Humanísticas', 0, 'si', 'si', 'si', 174),
(34, 'lic', 'Benemerita Universidad Autónoma de Puebla', 'Licenciatura en Administración Pública', 0, 'si', 'si', 'si', 127),
(35, 'master', 'Universidad Autónoma de Chiapas', 'Maestría en Administración con Formación en Organizaciones', 0, 'si', 'si', 'si', 127),
(36, 'doc', 'Instituto de Estudios Superiores de Chiapas', 'Doctorado en Administración', 0, 'si', 'si', 'si', 127),
(37, 'lic', 'MATEMÁTICAS', 'EDUCACIÓN PRIMARIA', 0, 'si', 'si', 'si', 161),
(38, 'master', 'UNIVERSIDAD PEDAGÓGICA NACIONAL-AJUSCO, CIUDAD DE MEXICO', 'PEDAGOGÍA', 0, 'si', 'si', 'si', 161),
(39, 'doc', 'ICE-UNIVERSIDAD AUTÓNOMA DE OAXACA DE JUÁREZ', 'CIENCIAS DE LA EDUCACIÓN', 0, 'si', 'si', 'si', 161),
(40, 'lic', 'Instituto Tecnológico de Comitán ', 'Ingeniería en Sistemas Computacionales', 0, 'si', 'si', 'si', 179),
(41, 'master', 'Instituto Tecnológico de Tuxtla Gutierrez', 'Maestría en Ciencias de la Ingeniería en Mecatrónica', 0, 'si', 'si', 'si', 179),
(42, 'doc', '', '', 0, 'no', 'no', 'no', 179),
(43, 'lic', 'Facultad de Derecho de la Universidad Autónoma de Chiapas', 'Licenciatura en Derecho', 0, 'no', 'no', 'si', 143),
(44, 'master', 'INEF', 'Derecho Constitucional y Amparo', 0, 'no', 'no', 'si', 143),
(45, 'doc', 'INEF', 'Derecho Público', 0, 'no', 'no', 'si', 143),
(46, 'lic', 'FACULTAD DE CIENCIAS POLÍTICAS Y SOCIALES. UNIVERSIDAD NACIONAL AUTÓNOMA DE MÉXICO', 'Ciencias Políticas y Administración Pública (AP)', 0, 'si', 'no', 'si', 131),
(47, 'master', 'INSTITUTO NACIONAL DE ADMINISTRACIÓN PÚBLICA A.C.', 'Administración Pública', 0, 'si', 'no', 'si', 131),
(48, 'doc', '', '', 0, 'no', 'no', 'no', 131),
(49, 'lic', 'Instituto Tecnológico de Tuxtla Gutiérrez', 'Ingeniería Electrónica', 0, 'si', 'no', 'si', 176),
(50, 'master', 'Instituto Tecnológico de Estudios Superiores de Monterrey', 'Administración en Instituciones Educativas con acentuación en Educación Superior', 0, 'si', 'no', 'si', 176),
(51, 'doc', 'IESCH', 'Administración', 0, 'si', 'no', 'no', 176),
(52, 'lic', 'UNAM', 'Actuaria', 0, 'si', 'si', 'si', 183),
(53, 'master', 'El Colegio de México', 'Demografía', 0, 'si', 'no', 'si', 183),
(54, 'doc', 'Universidad Autónoma de Barcelona', 'Demografía', 0, 'si', 'no', 'no', 183),
(55, 'lic', 'UNIVERSIDAD AUTÓNOMA DEL ESTADO DE MÉXICO', 'CONTADOR PÚBLICO', 0, 'no', 'no', 'si', 184),
(56, 'master', 'INSTITUTO NACIONAL DE ADMINISTRACIÓN PÚBLICA //  UNIVERSIDAD AUTÓNOMA DEL ESTADO DE MÉXICO', 'ADMINISTRACIÓN PÚBLICA //  AUDITORÍA', 0, 'no', 'no', 'si', 184),
(57, 'doc', 'INSTITUTO NACIONAL DE ADMINISTRACIÓN PÚBLICA', 'ADMINISTRACIÓN PÚBLICA', 0, 'no', 'no', 'no', 184),
(58, 'lic', 'UNIVERSIDAD DE CIENCIAS Y ARTES DE CHIAPAS', 'LICENCIATURA EN PSICOLOGÍA', 0, 'si', 'si', 'si', 139),
(59, 'master', 'UNIVERSIDAD AUTÓNOMA DE NUEVO LEÓN', 'MAESTRÍA EN PSICOLOGÍA LABORAL', 0, 'si', 'si', 'si', 139),
(60, 'doc', 'UNIVERSIDAD PABLO GUARDADO CHAVEZ', 'DOCTORADO EN ALTA DIRECCIÓN Y NEGOCIOS (Cursando)', 0, 'no', 'no', 'no', 139),
(61, 'lic', 'Benemérita Universidad Autónoma de Puebla', 'Licenciatura en Computación', 0, 'si', 'no', 'si', 145),
(62, 'master', 'Institutos de Estudios Universitarios', 'Maestría en Administración', 0, 'si', 'no', 'si', 145),
(63, 'doc', '', '', 0, 'no', 'no', 'no', 145),
(64, 'lic', 'UNIVERSIDAD VERACRUZANA', 'LICENCIATURA EN NUTRICIÓN', 0, 'si', 'no', 'no', 117),
(65, 'master', 'INEF', 'MAESTRÍA EN CALIDAD', 0, 'si', 'no', 'no', 117),
(66, 'doc', 'IAP CHIAPAS', 'ADMINISTRACIÓN PÚBLICA', 0, 'no', 'no', 'no', 117),
(67, 'lic', 'Universidad Autónoma Metropolitana. Unidad Azcapotzalco.', 'Economía', 0, 'si', 'no', 'si', 137),
(68, 'master', 'Escuela Superior de Ingeniería y Arquitectura, Unidad Zacatenco. Instituto Politécnico Nacional.', 'Maestría en Ciencias en Administración, Planeación y Economía de los Hidrocarburos.', 0, 'si', 'no', 'si', 137),
(69, 'doc', 'Facultad de Derecho, Campus III de la Universidad Autónoma de Chiapas.', 'Doctorado en Derechos Humanos', 0, 'si', 'no', 'si', 137),
(70, 'lic', 'Universidad Nacional Autónoma de México', 'Ciencias Políticas y Administración Pública', 0, 'si', 'si', 'si', 159),
(71, 'master', 'Instituto Pensamiento y Cultura de América Latina (IPECAL)', 'Formación de Sujetos y Conciencia Histórica', 0, 'si', 'si', 'si', 159),
(72, 'doc', 'Instituto de Administración Pública de Chiapas', 'Administración Pública', 0, 'si', 'si', 'si', 159),
(73, 'lic', 'Universidad Pedagógica Nacional', 'Licenciatura en Intervención Educativa', 0, 'si', 'si', 'si', 187),
(74, 'master', 'Instituto de Estudio de Posgrado', 'Maestría en Docencia', 0, 'si', 'si', 'si', 187),
(75, 'doc', 'Universidad Autónoma de Chiapas', 'Doctorado en Estudios Regionales', 0, 'si', 'si', 'si', 187),
(76, 'lic', 'FACULTAD DE HUMANIDADES, CAMPUS IV, UNIVERSIDAD AUTÓNOMA DE CHIAPAS ', 'PEDAGOGÍA', 0, 'si', 'si', 'si', 186),
(77, 'master', 'FACULTAD DE HUMANIDADES, CAMPUS IV, UNIVERSIDAD AUTÓNOMA DE CHIAPAS ', 'PSICOPEDAGOGÍA ', 0, 'si', 'si', 'si', 186),
(78, 'doc', 'Consorcio de Ciencias Sociales y Humanidades, Universidad Autónoma de Chiapas ', 'Doctorado en Estudios Regionales', 0, 'no', 'si', 'no', 186),
(79, 'lic', 'Instituto Tecnológico y de Estudios Superiores de Monterrey Campus Monterrey', 'Economía', 0, 'si', 'si', 'si', 106),
(80, 'master', 'Instituto de Administración Pública del Estado de Chiapas A.C.', 'Administración y Gestión Pública', 0, 'si', 'si', 'si', 106),
(81, 'doc', 'Universidad Autónoma de Chiapas', 'Estudios Regionales', 0, 'si', 'si', 'si', 106),
(82, 'lic', 'Universidad Autónoma de Chiapas', 'Pedagogía', 0, 'si', 'si', 'si', 175),
(83, 'master', 'Universidad Autónoma de Chiapas', 'Maestría en Educación Superior', 0, 'si', 'si', 'si', 175),
(84, 'doc', 'Universidad de Málaga', 'Política Educativa en la Sociedad Neoliberal', 0, 'si', 'si', 'si', 175),
(85, 'lic', 'INSTITUTO TECNOLÓGICO SUPERIOR DE CINTALAPA', 'INGENIERO EN SISTEMAS  COMPUTACIONALES', 0, 'si', 'si', 'si', 118),
(86, 'master', 'UNIVERSIDAD VALLE DEL GRIJALVA', 'MAESTRÍA EN CIENCIAS DE LA COMPUTACIÓN', 0, 'si', 'si', 'si', 118),
(87, 'doc', 'UNIVERSIDAD DE GUADALAJARA', 'DOCTORADO EN SISTEMAS Y AMBIENTES EDUCATIVOS', 0, 'no', 'no', 'no', 118),
(88, 'lic', 'Escuela Profesional de Contabilidad y Administración', 'Administración de la computación', 0, 'no', 'no', 'si', 181),
(89, 'master', 'Instituto Estudios Universitarios, A.C.', 'Maestria en administración', 0, 'no', 'no', 'si', 181),
(90, 'doc', 'Instituto Nacional Estudios Fiscales, A.C', 'Derecho Público/ Doctorado en Educación', 0, 'no', 'no', 'si', 181),
(91, 'lic', 'Universidad Nacional Autónoma de México', 'Licenciado en Psicología ', 0, 'si', 'no', 'si', 109),
(92, 'master', 'Universidad Nacional Autónoma de México ', 'Maestría en Administración', 0, 'si', 'no', 'si', 109),
(93, 'doc', '', '', 0, 'no', 'no', 'no', 109),
(94, 'lic', 'UNIVERSIDAD VALLE DEL GRIJALVA', 'CONTADURÍA PÚBLICA', 0, 'si', 'si', 'si', 148),
(95, 'master', 'UNIVERSIDAD VALLE DEL GRIJALVA', 'FINANZAS ESTRATÉGICAS', 0, 'si', 'si', 'si', 148),
(96, 'doc', 'INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS', 'EN ADMINISTRACIÓN PÚBLICA', 0, 'si', 'si', 'no', 148),
(97, 'lic', 'FACULTAD DE CIENCIAS AGRONOMICAS CAMPUS V UNACH', 'INGENIERO AGRONOMO EN PRODUCCIÓN ANIMAL', 0, 'si', 'si', 'si', 189),
(98, 'master', 'UNIVERSIDAD DEL SUR', 'MAESTRO EN PEDAGOGIA', 0, 'si', 'si', 'no', 189),
(99, 'doc', 'UNIVERSIDAD DEL SUR', 'DOCTOR EN EDUCACIÓN', 0, 'si', 'si', 'no', 189),
(100, 'lic', 'Instituto Tecnológico de Tuxtla Gutiérrez', 'Ingeniería en sistemas computacionales', 0, 'si', 'si', 'si', 188),
(101, 'master', 'Universidad Autónoma de Chiapas', 'Maestría en Ciencias con Especialidad en Matemática Educativa', 0, 'si', 'si', 'si', 188),
(102, 'doc', 'Universidad Autónoma de Chiapas', 'Doctorado en Estudios Regionales (línea Educación, Actores y Procesos de Enseñanza-Aprendizaje)', 0, 'si', 'si', 'si', 188),
(103, 'lic', 'UNIVERSIDADA IBEROAMERICANA, CAMPUS CIUDAD DE MÉXICO, MÉXICO', 'CIENCIAS POLÍTICAS Y ADMINISTRACIÓN PÚBLICA', 0, 'si', 'no', 'no', 129),
(104, 'master', 'UNIVERSIDAD DE MANCHESTER, INGLATERRA, REINO UNIDO', 'POLÍTCA SOCIAL Y GESTIÓN SOCIAL', 0, 'si', 'no', 'no', 129),
(105, 'doc', 'UNIVERSIDAD DE LONDRES, INGLATERRA, REINO UNIDO', 'EN FILOSOFÍA', 0, 'si', 'no', 'no', 129),
(106, 'lic', 'Universidad Autónoma de Chiapas', 'Pedagogía', 0, 'si', 'si', 'si', 190),
(107, 'master', 'Instituto de Estudios Superiores de Chiapas', 'Administración en Educación Superior', 0, 'si', 'si', 'si', 190),
(108, 'doc', 'Universidad del Sur', 'Educación', 0, 'si', 'si', 'no', 190),
(109, 'lic', 'FACULTAD DE LENGUAS, TUXTLA UNIVERSIDAD AUTÓNOMA DE CHIAPAS', 'LICENCIATURA EN LA ENSEÑANZA DEL INGLÉS', 0, 'si', 'no', 'si', 192),
(110, 'master', 'FACULTAD DE LENGUAS TUXTLA, UNIVERSIDAD AUTÓNOMA DE CHIAPAS', 'MAESTRÍA EN DIDÁCTICA DE LAS LENGUAS', 0, 'si', 'si', 'no', 192),
(111, 'doc', '', '', 0, 'no', 'no', 'no', 192),
(112, 'lic', 'UNIVERSIDAD NACIONAL AUTÓNOMA DE MÉXICO', 'LICENCIATURA EN CIENCIAS POLÍTICAS Y ADMINISTRACIÓN PÚBLICA', 0, 'si', 'si', 'si', 193),
(113, 'master', 'UNIVERSIDAD VALLE DEL GRIJALVA', 'MAESTRÍA EN DOCENCIA E INVESTIGACIÓN', 0, 'si', 'si', 'si', 193),
(114, 'doc', 'UNIVERSIDAD DEL SUR', 'DOCTORADO EN EDUCACIÓN', 0, 'si', 'si', 'si', 193),
(115, 'lic', 'Facultad de Ciencias Políticas y Sociales de la UNAM', 'Ciencias Políticas y Administración Pública', 0, 'si', 'no', 'si', 141),
(116, 'master', 'Universidad del Valle de México', 'Administración en Sistemas de Calidad', 0, 'si', 'no', 'si', 141),
(117, 'doc', 'Instituto Nacional de Administración Pública', 'Administración Pública', 0, 'no', 'no', 'no', 141),
(118, 'lic', 'UNIERSIDAD ESTUDIOS SUPERIORES DE TUXTLA', 'LICENCIATURA EN DERECHO', 0, 'si', 'si', 'si', 115),
(119, 'master', 'INSTITUO NACIONAL DE ESTUDIOS FISCALES', 'CIENCIAS JURIDICO PENALES Y CRIMINOLOGICAS', 0, 'si', 'si', 'no', 115),
(120, 'doc', 'UNIVERSIDAD DEL SUR', 'DERECHO PENAL', 0, 'si', 'si', 'si', 115),
(121, 'lic', 'INSTITUTO TECNOLÓGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY', 'LICENCIATURA EN CIENCIAS DE LA COMUNICACIÓN', 0, 'si', 'no', 'si', 196),
(122, 'master', 'INSTITUTO TECNOLÓGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY', 'MAESTRÍA EN EDUCACIÓN CON ESPECIALIDAD EN COMUNICACIÓN', 0, 'si', 'no', 'si', 196),
(123, 'doc', 'INSTITUTO DE ADMINISTRACIÓN PÚBLICA DEL ESTADO DE CHIAPAS', 'DOCTORADO EN ADMINISTRACIÓN PÚBLICA', 0, 'no', 'no', 'no', 196),
(124, 'lic', 'Universidad de Ciencias y Artes de Chiapas', 'Ingeniero Topógrafo Fotogrametrísta', 0, 'si', 'si', 'si', 195),
(125, 'master', 'Universidad Autónoma de Chiapas', 'Maestría en Desarrollo Urbano y Ordenamiento Territorial', 0, 'si', 'si', 'si', 195),
(126, 'doc', 'Universidad Mesoemricana', 'Doctorado en Educación (Área Matemática)', 0, 'no', 'si', 'no', 195),
(127, 'lic', 'Universidad Nacional Autónoma de México', 'Licenciatura en Sociología', 0, 'si', 'no', 'si', 191),
(128, 'master', 'Universidad Nacional Autónoma de Chapingo', 'Maestria en Ciencias de Sociología Rural', 0, 'si', 'no', 'si', 191),
(129, 'doc', 'Universidad Nacional Autónoma de Chapingo', 'Doctorado en Economía Agrícola', 0, 'no', 'no', 'no', 191),
(130, 'lic', 'SEP', 'Licienciatura en Educación Preescolar', 0, 'si', 'no', 'si', 198),
(131, 'master', 'INSTITUTO TECNOLOGICO Y DE ESTUDIOS SUPERIORES DE MONTERREY', 'Administración de Instituciones Educativas', 0, 'si', 'si', 'si', 198),
(132, 'doc', 'UNACH', 'Estudios Regionales', 0, 'no', 'no', 'no', 198),
(133, 'lic', 'FACULTAD DE CIENCIAS SOCIALES CAMPUS III', 'ECONOMIA', 0, 'si', 'no', 'si', 199),
(134, 'master', 'UNIVERSIDAD VALLE DEL GRIJALVA', 'CIENCIAS DE LA EDUCACIÓN CON FORMACIÓN EN DOCENCIA E INVESTIGACIÓN', 0, 'si', 'no', 'si', 199),
(135, 'doc', 'UNIVERSIDAD AUTONOMA DE CHIAPAS', 'DOCTOR EN ESTUDIOS REGIONALES', 0, 'no', 'si', 'no', 199),
(136, 'lic', 'Universidad Autónoma de Chiapas, Campus III ', 'en Derecho ', 0, 'si', 'no', 'si', 197),
(137, 'master', 'Instituto de Estudios Superiores de Chiapas \"Universidad Salazar\"', 'Derecho Constitucional y Amparo', 0, 'si', 'no', 'si', 197),
(138, 'doc', 'Universidad Autónoma de Chiapas/Universidad del Sur ', '', 0, 'si', 'no', 'si', 197),
(139, 'lic', 'Universidad Autónoma de Chiapas', 'Lic. en Informática', 0, 'si', 'no', 'si', 155),
(140, 'master', 'En Administración', 'Universidad Privada del Sur de México', 0, 'si', 'no', 'si', 155),
(141, 'doc', 'Administración Pública', 'Instituto de Administración Pública del Estado de Chiapas', 0, 'si', 'no', 'no', 155),
(142, 'lic', 'Escuela Normal Superior del Estado de Chiapas', 'Licenciatura en Educación Secundaria con especialidad en Matemáticas', 0, 'si', 'si', 'si', 182),
(143, 'master', 'Instituto de Estudios Superior de Monterrey (ITESM)', 'Maestría en Administración de Instituciones Educativas, con énfasis en educación básica', 0, 'si', 'si', 'si', 182),
(144, 'doc', '', '', 0, 'no', 'no', 'no', 182);

-- --------------------------------------------------------

--
-- Table structure for table `eval_alumno_docente`
--

CREATE TABLE `eval_alumno_docente` (
  `evalalumnodocenteId` int(11) NOT NULL,
  `courseModuleId` int(11) NOT NULL,
  `docenteId` int(11) NOT NULL,
  `alumnoId` int(11) NOT NULL,
  `fechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comentario` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ficha`
--

CREATE TABLE `ficha` (
  `idFicha` int(10) NOT NULL,
  `folioFicha` int(10) NOT NULL,
  `carrera` int(11) NOT NULL DEFAULT '1',
  `carrera2` int(11) NOT NULL DEFAULT '1',
  `carrera3` int(11) NOT NULL DEFAULT '1',
  `nombre` varchar(100) NOT NULL,
  `aPaterno` varchar(100) NOT NULL,
  `aMaterno` varchar(100) NOT NULL,
  `sexo` varchar(100) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `municipio` varchar(100) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `nacionalidad` varchar(100) NOT NULL,
  `calle` varchar(100) NOT NULL,
  `numero` varchar(100) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `domicilioEstado` varchar(100) NOT NULL,
  `codigoPostal` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `curp` varchar(100) NOT NULL,
  `nombreTutor` varchar(100) NOT NULL,
  `apellidosTutor` varchar(100) NOT NULL,
  `domicilioTutor` varchar(100) NOT NULL,
  `telefonoTutor` varchar(100) NOT NULL,
  `nombreEscuelaProcedencia` varchar(100) NOT NULL,
  `tipoEscuelaProcedencia` varchar(100) NOT NULL,
  `claveEscuelaProcedencia` varchar(100) NOT NULL,
  `periodoId` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `status` enum('pendiente','autorizada','cancelada') NOT NULL DEFAULT 'pendiente',
  `modalidad` enum('escolarizado','semiescolarizado') NOT NULL DEFAULT 'escolarizado',
  `estadoSec` varchar(255) NOT NULL,
  `municipioSec` varchar(255) NOT NULL,
  `promedio` float(10,2) NOT NULL,
  `certificado` enum('si','no') NOT NULL DEFAULT 'no',
  `modalidadSec` enum('escolarizado','semiescolarizado','otro') NOT NULL DEFAULT 'escolarizado'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `folio`
--

CREATE TABLE `folio` (
  `folioId` int(11) NOT NULL,
  `folioActual` varchar(255) NOT NULL,
  `folioSiguiente` varchar(255) NOT NULL,
  `nomenclatura` varchar(255) NOT NULL,
  `tiposolicitudId` int(11) NOT NULL,
  `anio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gradereport`
--

CREATE TABLE `gradereport` (
  `gradereportId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `generation` varchar(10) NOT NULL,
  `periodoId` int(11) NOT NULL,
  `semesterId` int(11) NOT NULL,
  `regularization` char(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gradereport_inter`
--

CREATE TABLE `gradereport_inter` (
  `gradereportInterId` int(11) NOT NULL,
  `alumnoId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `datetest` date NOT NULL,
  `scheduletestId` int(11) NOT NULL,
  `periodoId` int(11) NOT NULL,
  `semesterId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gradereport_recur`
--

CREATE TABLE `gradereport_recur` (
  `gradereportRecurId` int(11) NOT NULL COMMENT 'id del registro',
  `alumnoId` int(11) NOT NULL COMMENT 'id del alumno',
  `subjectId` int(11) NOT NULL COMMENT 'id de la materia reprobada',
  `periodoId` int(11) NOT NULL COMMENT 'id del perido en el que se reprobo la materia',
  `semesterId` int(11) NOT NULL COMMENT 'id del semestre en el que se reprobo la materia'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='registro de alumnos de recursamiento';

-- --------------------------------------------------------

--
-- Table structure for table `gradereport_user`
--

CREATE TABLE `gradereport_user` (
  `gradReportUserId` int(11) NOT NULL,
  `gradereportId` int(11) NOT NULL,
  `alumnoId` int(11) NOT NULL,
  `testIdentifier` varchar(50) NOT NULL,
  `datetest` date NOT NULL,
  `gradescore` decimal(5,2) NOT NULL,
  `scheduletestId` int(11) NOT NULL,
  `attendance` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE `group` (
  `groupId` int(11) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`groupId`, `clave`, `name`) VALUES
(1, 'AM', 'AM'),
(2, 'BM', 'BM'),
(3, 'CM', 'CM'),
(4, 'DM', 'DM'),
(5, 'EM', 'EM'),
(6, 'FM', 'FM'),
(7, 'GM', 'GM'),
(8, 'HM', 'HM'),
(9, 'IM', 'IM'),
(10, 'JM', 'JM'),
(11, 'KM', 'KM'),
(12, 'LM', 'LM'),
(13, 'MM', 'MM');

-- --------------------------------------------------------

--
-- Table structure for table `groupDEL`
--

CREATE TABLE `groupDEL` (
  `groupId` int(11) NOT NULL,
  `majorId` int(11) NOT NULL,
  `specialityId` int(11) NOT NULL,
  `semesterId` int(11) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `periodoId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `group_subject`
--

CREATE TABLE `group_subject` (
  `gposubId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `homework`
--

CREATE TABLE `homework` (
  `homeworkId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `activityId` int(11) NOT NULL,
  `nombre` varchar(255) CHARACTER SET latin1 NOT NULL,
  `path` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date` datetime NOT NULL,
  `mime` varchar(255) CHARACTER SET latin1 NOT NULL,
  `confirmacion` varchar(255) COLLATE utf8_bin NOT NULL,
  `dateUpdate` date NOT NULL,
  `countUpdate` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `informacionAduaneraConcepto`
--

CREATE TABLE `informacionAduaneraConcepto` (
  `conceptoId` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `aduana` varchar(255) NOT NULL,
  `informacionAduaneraConceptoId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `informacionAduaneraParte`
--

CREATE TABLE `informacionAduaneraParte` (
  `conceptoId` int(11) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  `aduana` varchar(255) NOT NULL,
  `informacionAduaneraParteId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `institution`
--

CREATE TABLE `institution` (
  `institutionId` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `name_long` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `identifier` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `ubication` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `ubication_long` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci DEFAULT NULL,
  `jefeOficina` varchar(255) CHARACTER SET latin1 NOT NULL,
  `presidente` varchar(255) CHARACTER SET latin1 NOT NULL,
  `respServiciosEscolares` varchar(255) CHARACTER SET latin1 NOT NULL,
  `directorAcademico` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'LIC. HELENA MARGARITA JIMENEZ JIMENEZ',
  `jefeServiciosEscolares` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT 'ING. JULIO MONTERO MEDEROS'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `institution`
--

INSERT INTO `institution` (`institutionId`, `name`, `name_long`, `identifier`, `ubication`, `ubication_long`, `phone`, `fax`, `jefeOficina`, `presidente`, `respServiciosEscolares`, `directorAcademico`, `jefeServiciosEscolares`) VALUES
(1, 'IAP', 'INSTITUTO DE ADMINISTRACION PUBLICA DEL ESTADO DE CHIAPAS, A.C.', '07PSU0129J', 'TUXTLA GUTIERREZ, CHIAPAS.', 'LIBRAMIENTO NORTE PONINETE NO. 2718, COL. LADERA DE LA LOMA.', '961-12-5-15-08', '961-12-5-15-08', 'ARQ. CARLOS VAZQUEZ LOZADA', 'M.A. HARVEY GUTIÉRREZ ÁLVAREZ', 'LIC. ANA GLORIA CARVAJAL CRUZ', 'director', 'jefe');

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoiceId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `dueDate` date NOT NULL,
  `amount` float NOT NULL,
  `status` enum('Pagado','Por Pagar','Cancelado') NOT NULL DEFAULT 'Por Pagar',
  `Facturado` enum('si','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ipn`
--

CREATE TABLE `ipn` (
  `ipnid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `user` bigint(21) NOT NULL DEFAULT '0',
  `points` int(11) NOT NULL DEFAULT '0',
  `trans` varchar(30) NOT NULL DEFAULT '0',
  `before` int(5) NOT NULL DEFAULT '0',
  `after` int(5) NOT NULL DEFAULT '0',
  `ipnstatus` tinyint(1) NOT NULL DEFAULT '0',
  `verified` varchar(15) NOT NULL DEFAULT '',
  `time` bigint(15) NOT NULL DEFAULT '0',
  `given` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ipn`
--

INSERT INTO `ipn` (`ipnid`, `name`, `user`, `points`, `trans`, `before`, `after`, `ipnstatus`, `verified`, `time`, `given`) VALUES
(1, '', 114, 0, '7ES78916RK480333A', 0, 0, 1, 'Completed', 1360109764, '0'),
(2, '140', 114, 0, '3PD70401HE312760Y', 0, 0, 1, 'Completed', 1360167346, '0'),
(3, '140', 114, 0, '65T71622L9549492T', 0, 0, 1, 'Completed', 1360168044, '0'),
(4, '140', 114, 0, '69H14816LS424182R', 0, 0, 1, 'Completed', 1360168241, '0'),
(5, '140', 114, 0, '0GP75662SN069232N', 0, 0, 1, 'Completed', 1360168770, '0'),
(6, '140', 114, 0, '72V76995CF2198803', 0, 0, 0, 'Completed', 1360547090, '0'),
(7, '140', 114, 0, '2RE95647YN4128314', 0, 0, 1, 'Completed', 1360547186, '0'),
(8, '140', 114, 0, '6VD79840RC090825D', 0, 0, 1, 'Completed', 1360547828, '0'),
(9, '140', 114, 0, '4UT40576D77716744', 0, 0, 1, 'Completed', 1360547994, '0'),
(10, '140', 114, 0, '9JT80712LS438282T', 0, 0, 1, 'Completed', 1360548081, '0'),
(11, '140', 114, 0, '2G433067FG304935P', 0, 0, 1, 'Completed', 1360548293, '0');

-- --------------------------------------------------------

--
-- Table structure for table `kardex_calificacion`
--

CREATE TABLE `kardex_calificacion` (
  `karCalId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `semesterId` int(11) NOT NULL,
  `majorId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `calif` decimal(10,2) NOT NULL,
  `typeCalifId` int(11) NOT NULL,
  `periodoId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `major`
--

CREATE TABLE `major` (
  `majorId` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `major`
--

INSERT INTO `major` (`majorId`, `name`, `description`) VALUES
(1, 'MAESTRIA', 'Maestria'),
(2, 'SEMINARIO', 'SEMINARIO'),
(3, 'DIPLOMADO', ''),
(17, 'CURSO - TALLER', ''),
(4, 'ESPECIALIDAD', ''),
(5, 'CURSO', ''),
(18, 'DOCTORADO', ''),
(34, 'LICENCIATURA', '');

-- --------------------------------------------------------

--
-- Table structure for table `mensaje`
--

CREATE TABLE `mensaje` (
  `mensajeId` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mensaje` text NOT NULL,
  `enviarId` int(11) NOT NULL,
  `ruta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mensaje_personal`
--

CREATE TABLE `mensaje_personal` (
  `personalId` int(11) NOT NULL,
  `mensajeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu_app`
--

CREATE TABLE `menu_app` (
  `menuAppId` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `menuId` int(11) NOT NULL,
  `contenido` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_app`
--

INSERT INTO `menu_app` (`menuAppId`, `nombre`, `menuId`, `contenido`) VALUES
(1, 'Nosotros', 0, ''),
(2, 'PRODIM', 0, ''),
(3, 'Red Conocer', 0, ''),
(4, 'Profesionalización', 0, ''),
(5, 'Redes Sociales', 6, '<br>\r\n<br>\r\n<center>\r\n    <table width=50% border=0 width=100% >\r\n        <tr>\r\n            <td><img src=\"http://www.iapchiapasenlinea.mx/images/face.png\" style=\"border-radius: 2%;\" /></td>\r\n            <td ><a target=\"_blank\" href=\'https://www.facebook.com/IAPChiapas/\'>Facebook</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td><img src=\"http://www.iapchiapasenlinea.mx/images/twitter.png\" style=\"border-radius: 2%;\" /></td>\r\n            <td style><a target=\"_blank\" href=\'https://twitter.com/IapChiapas\'>Twitter</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td><img src=\"http://www.iapchiapasenlinea.mx/images/insta.png\" style=\"border-radius: 2%;\" /></td>\r\n            <td><a target=\"_blank\" href=\'https://www.instagram.com/iapchiapas/\'>Instagram</a></td>\r\n        </tr>\r\n        <tr>\r\n            <td><img src=\"http://www.iapchiapasenlinea.mx/images/link.png\" style=\"border-radius: 2%;\" /></td>\r\n            <td><a target=\"_blank\" href=\'https://www.linkedin.com/in/iapchiapas/\'>LinkedIn</a></td>\r\n        </tr>\r\n    </table>\r\n</center>'),
(6, 'Contacto', 0, ''),
(7, 'Nosotros', 1, '<br>\n<br>\n<b>NOSOTROS</b>\n<br>\n<br>\nFue fundado el 22 de Junio de 1977.<br>\n\nEl IAP Chiapas coadyuva desde hace 40 años en el fortalecimiento de la gestión pública de los tres órdenes de gobierno, así como con la realización de investigación, consultoría y difusión del desarrollo de las ciencias administrativas, en beneficio de la sociedad.\n\n<br>\n<br>\n<b>MISIÓN</b></br>\nContribuir al fortalecimiento de la administración y la gestión pública en el estado de Chiapas, a través de la impartición del conocimiento de las mejores prácticas y experiencias a nivel nacional e internacional en administración pública, para la profesionalización y capacitación continua de los servidores públicos de los tres órdenes de gobierno, así como con la realización de investigación, consultoría y difusión del desarrollo de las ciencias administrativas, en beneficio de la sociedad.\n<br>\n<br>\n<b>VISIÓN</b><br>\nSer una institución académica y de investigación con reconocimiento a nivel nacional e internacional, por fomentar el compromiso social, ético y moral de sus egresados en el ejercicio del servicio público, a través de la difusión y estudio de las mejores prácticas y experiencias en el desarrollo de las ciencias administrativas, en el contexto de la profesionalización y desarrollo de capacidades y habilidades de quienes participan en la función pública.\n<br>\n<br>\n<b>OBJETIVOS</b>\n<br>\n<br>\n<li> Fomentar y realizar investigaciones sobre la teoría y práctica de la administración pública</li>\n<li>	Promover e impartir la enseñanza sobre la teoría y práctica de la administración pública</li>\n<li>	Impulsar el desarrollo de la administración pública en los tres niveles de gobierno</li>\n<li>	Prestar servicios de asesoría y consultoría a instituciones y personas de los sectores público, social y privado.</li>\n<li>	Propicias el intercambio de información y colaboración con instituciones afines.</li>\n<br>\n<br>\n<b>VALORES</b>\n<br>\n<br>\n<li>	Institucionalidad</li>\n<li>	Ética</li>\n<li>	Eficiencia</li>\n<li>	Eficacia</li>\n<li>	Economía</li>\n<li>	Calidad</li>'),
(8, 'Presidencia', 1, '<div style=\'text-align:center\'><b>M.A. Harvey Gutiérrez Álvarez</b><br>\nPresidente del Consejo Directivo del <br>\nInstituto de Administración Pública del \nEstado de Chiapas, A. C.\n</div><br><br>\n\n\nNació el 3 de junio de 1951 en Tecpatán, Chiapas.\n\n\n<br>\n<br>\n\n\n\n<b>GRADOS ACADÉMICOS</b>\n<br>\n<li>	Contador Público, Egresado de la Universidad Autonoma de Chiapas.</li>\n<li>	Maestro en Administración, por la Universidad Nacional Autónoma de México.</li>\n<li>	Maestria en Alta Dirección, por el Colegio de Graduados en Alta Dirección de la Ciudad de México.</li>\n<li>	Diplomados en Finanzas, Proyectos de Inversión y Habilidades Gerenciales por el Tecnológico de Monterrey. </li>\n<br><br>\n<b>EXPERIENCIA ACADÉMICA</b>\n<br>\n<br>\n<li>	Profesor de Tiempo Completo de la Universidad de Montemorelos, Nuevo León, una de las instituciones de educación superior más prestigiadas del país.</li>\n<li>	Ha impartido cursos de Posgrado en la Maestría de Administración de la UNACH.</li>\n<br><br>\n<b>LABOR ALTRUISTA</b>\n<br><br>\n<li>	Como ser humano se ha destacado por su labor de gestoría y altruismo que le ha permitido desde hace 20 años realizar obras de carácter social y filantrópico en todo el Estado de Chiapas, mediante la Fundación que lleva su nombre (FUNDACIÓN HARVEY GUTIÉRREZ).</li>\n<li>	Conocedor de las necesidades del campo, y por ello promotor y asesor de proyectos productivos en beneficio de Ejidatarios y Ganaderos.</li>\n<li>	La Cruz Roja Mexicana le entregó un reconocimiento por su altruismo, al apoyarla con despensas y ropa para los damnificados del huracán \"Stan\" que afectó a comunidades y municipios de la Costa de Chiapas, así como al prestarle las instalaciones adjuntas a la UVG que sirvieron como centros de acopio para sus actividades de ayuda humanitaria. </li>\n<br><br>\n<b>SU TRAYECTORIA EMPRESARIAL</b>\n<br><br>\n<li>Como ser humano se ha destacado por su labor de gestoría y altruismo que le ha permitido desde hace 20 años realizar obras de carácter social y filantrópico en todo el Estado de Chiapas, mediante la Fundación que lleva su nombre (FUNDACIÓN HARVEY GUTIÉRREZ).</li>\n<li>	Conocedor de las necesidades del campo, y por ello promotor y asesor de proyectos productivos en beneficio de Ejidatarios y Ganaderos.</li>\n<li>	La Cruz Roja Mexicana le entregó un reconocimiento por su altruismo, al apoyarla con despensas y ropa para los damnificados del huracán \"Stan\" que afectó a comunidades y municipios de la Costa de Chiapas, así como al prestarle las instalaciones adjuntas a la UVG que sirvieron como centros de acopio para sus actividades de ayuda humanitaria.</li>\n\n'),
(9, 'PRODIM', 2, '<br><b>PRODIM</b>\n<BR>\nPrograma de Desarrollo Institucional Municipal<BR>\n<BR>\n<BR>\nEl programa de Desarrollo Institucional Municipal (PRODIM), tiene por objeto promover un proceso de carácter integral, gradual y continuo, que permita elevar el nivel de desempeño del servidor público municipal, proporcionandole los conocimientos y herramientas necesarias para que realice adecuadamente las funciones del puesto que tiene asignado para que brinde un servicio útil, ágil y oportuno a la ciudadania.\n<BR>\n<BR>\nEs por esto que los funcionarios municipales que estan a cargo de la atención de los asuntos públicos tienen que actuar con mayor creatividad y eficiencia, lo que únicamente se logrará si se mantienen en una dinámica de capacitación, profesionalización y actualización acorde a los nuevos retos que plantea el desarrollo económico, la pluralidad política y la dinámica social.\n<BR>\n<BR>\nEl PRODIM es el resultado de la detección de las necesidades de capacitación de los funcionarios municipales y personal técnico-operativo de los gobiernos locales; con la finalidad de desarrollar un programa acorde a las necesidades reales para lograr administraciones municipales, política y estructuralmente sólidas, funcionales y eficientes que respondan a las necesidades y requerimientos de los tiempos actuales. \n<BR>\n<BR>\n<b>OBJETIVO:</b>\n<BR>\nCoadyuvar al fortalecimiento de la gestión pública municipal, a través de la capacitación, profesionalización, consultoría y asistencia técnica especializada a las autoridades municipales y funcionarios públicos municipales. \n<BR>\n<BR>\nDirigido a Autoridades municipales y funcionarios públicos municipales.\n<BR>\n<BR>\n\n<b>El programa se divide en:</b>\n<BR>\n<BR>\n<b>I.Cursos en sedes académicas del IAP-Chiapas.</b>\n<BR>\n<BR>\nLos cursos programados se desarrollarán en las 11 sedes académicas del IAP-Chiapas situados en municipios estratégicos del Estado.\n<BR>\n<BR>\n<b>II.Cursos denominados a la “Medida”.</b>\n<BR>\n<BR>\nImpartidos directamente en los H. Ayuntamientos Municipales a solicitud de estos contando con un catálogo de mas de 30 cursos.\n<BR>\n<BR>\n<b>III.Consultoría Municipal.</b>\n<BR>\n–Planes de Desarrollo Municipal.<BR>\n–Reglamento de la Administración Pública Municipal.<BR>\n–Manuales de Organización.<BR>\n–Reglamentos Municipales.<BR>\n–Mejora Regulatoria.<BR>\n'),
(10, 'Sedes', 2, '<b>CURSOS EN SEDES ACADÉMICAS</b>\n<BR>\n<BR>\n<li>Financiamiento Público del Ayuntamiento a Partir de los Recursos Públicos de los Programas Federales y de los Fondos de la Cámara de Diputados</li>\n<br>\n<li>	Cierre Presupuestal, Contable y Financiero del Ejercicio</li>\n<br>\n<li>	Elaboración del Presupuesto de Egresos</li>\n<br>\n<li>Elaboración del Plan de Trabajo para la Entrega-Recepción de la Administración Pública Municipal</li>\n<br>\n<li>	Ley de Contabilidad Gubernamental</li>\n<br>\n<li>	Obligaciones Fiscales del Gobierno Municipal ante El Sistema De Administración Tributaria (SAT)</li>\n<br>\n<li>	Presupuesto Basado en Resultados</li>\n<br>\n<li>	Seguridad Pública Municipal</li>\n<br>\n<li>	Administración de Recursos Humanos en la Administración Pública Municipal</li>\n<br>\n<li>	Auditoria Gubernamental a la Administración Pública Municipal</li>\n<br>\n<li>	Planeación Estratégica Municipal</li>\n<br>\n<li>	Ramo 33: Integración de Expedientes Técnicos</li>\n<br>\n<li>	Sistema de Precios Unitarios NEODATA y la Presupuestación de Obra</li>\n<br>\n<li>	La Transparencia y el Derecho a la Información Pública Estatal</li>\n<br>\n<li>	Administración y Evaluación de la Gestión Pública Municipal</li><br>\n<li>	Estrategias de Ingresos Catastrales</li>\n<br>\n<li>	Sistemas de Control y Gestión de Calidad</li>\n<br>\n<li>	Administración de los Ingresos Municipales</li>\n<br>\n<li>	Informática Básica</li>\n<br>\n<li>	Administración Financiera</li>\n<br>\n<li>	Auditoría Financiera y Técnica</li>\n'),
(11, 'A la Medida', 2, '<br>\n<b>CURSOS A LA MEDIDA</b>\n<br>\n<br>\n<li>	Relaciones Humanas y Trabajo en Equipo</li>\n<br>\n<li>	Las 9 Eses </li>\n<br>\n<li>	Administración y Gobierno Municipal </li>\n<br>\n<li>    Auditoria Interna </li>\n<br>\n<li>	Gestión Pública y Municipal</li>\n<br>\n<li>	Desarrollo de Reuniones Efectivas</li>\n<br>\n<li>	Estrategias de Ingresos Catastrales</li>\n<br>\n<li>	Taller de la Agenda desde lo Local</li>\n<br>\n<li>	Cómo lograr Objetivos a Corto Plazo</li>\n<br>\n<li>	Redacción de Documentos Oficiales</li>\n<br>\n<li>	Calidad en el Servicio Público Municipal</li>\n<br>\n<li>	Análisis del Marco Constitucional del Municipio</li>\n<br>\n<li>	Administración de Recursos Humanos</li>\n<br>\n<li>	Auditoría Financiara y Técnica</li>\n<br>\n<li>	Supervisión y Bitácora Electrónica de Obra Pública</li>\n<br>\n<li>	Presupuesto basado en Resultados</li>\n<br>\n<li>	Derecho Municipal</li>\n<br>\n<li>	Funcionamiento y Desempeño Efectivo de la Tesoreria Municipal</li>\n<br>\n<li>	Optimización de Inventarios</li>\n<br>\n<li>	Aspectos Relevantes de la Ley y de Obra Pública y Ley de Adquisiciones</li>\n<br>\n<li>	Reglamento Municipal</li>\n<li>	Transparencia y Rendición de Cuentas</li>\n<br>\n<li>	Estructura Orgánica Municipal</li>\n<br>\n<li>	Lineamientos del COPLADEM, Fondos Federales y Municipales</li>\n<br>\n<li>	Proyectos de Inversión Municipal</li>\n<br>\n<li>	Atribuciones y Obligaciones del Regidor y del Síndicos Municipal</li>\n<br>\n<li>	Responsabilidad de los Servidores Públicos Municipales</li>\n<br>\n<li>	Comunicación Efectiva</li>\n<br>\n<li>	Conflicto y Negociación</li>'),
(12, 'Red Conocer', 3, '<br><b>RED CONOCER</b>\n<br>\n<br>\nEl Sistema Nacional de Competencias, promovido por el CONOCER, es un Instrumento del Gobierno Federal que contribuye a la competitividad económica, al desarrollo educativo y al progreso social de México, con base en el fortalecimiento de las competencias de las personas.\n<br>\n<br>\nPara enfrentar con éxito los desafíos de los mercados cada vez más globalizados, México requiere de empresarios, trabajadores, docentes y servidores públicos más competentes. El Sistema Nacional de Competencias facilita los mecanismos para que las organizaciones e instituciones públicas y privadas, cuenten con personas más competentes.\n<br>\n<br>\nPara ello, surge la Los Estándares de Competencia, que son las definiciones de los conocimientos, habilidades, destrezas y actitudes requeridas, para que una persona realice cualquier actividad productiva, social o de gobierno, con un nivel de alto desempeño, definidos por los propios sectores.\n<br>\n<br>\nLas Entidades de Certificación y Evaluación (ECE) son las personas morales, organizaciones o instituciones públicas o privadas, unidades administrativas de alguna dependencia, entidad o su similar en los niveles de Gobierno Federal, Estatal o Municipal, acreditada por el CONOCER para capacitar, evaluar y/o certificar las competencias laborales de las personas, con base en Estándares de Competencia inscritos en el Registro Nacional de Estándares de Competencia, así como para acreditar, previa autorización del CONOCER, Centros de Evaluación y/o Evaluadores Independientes en uno o varios Estándares de Competencia en un periodo determinado.\n<br>\n<br>\nEl Instituto de Administración Pública del Estado de Chiapas A.C., es una Entidad de Certificación y Evaluación de Competencias Laborales (ECE213-15) en la cual podrás acreditar tus habilidades y eficiencia laboral de las actividades que desempeñas cotidianamente. \n\n'),
(13, 'Estandares de Competencia', 3, '<b>ESTÁNDARES DE COMPETENCIA</b>\n<br>\n<br>\nConsiste en la obtención de un certificado, que respalda, en términos de resultados, el conjunto de conocimientos, habilidades, destrezas y actitudes que requieres para realizar una actividad en el ámbito laboral, social, gobierno o educativo y que sirve como referente para evaluar tus competencias.\n<br>\n<br>\nEn el ECE del Instituto de Administración Pública del Estado de Chiapas A.C, te podemos capacitar, evaluar y certificar en los siguientes Estándares de Competencia:\n<br>\n<br>\n(cada uno de los elementos siguientes llevará a la página correspondiente, que se creará a continuación)\n<br>\n<br>\n<li>EC0076 Evaluación de la competencia de candidatos con base en Estándares de Competencia</li>\n<li>	EC0105 Atención al ciudadano en el sector público</li>\n<li>	EC0217 Impartición de cursos de formación del capital humano de manera presencial grupal</li>\n<li>	EC0462 Ejecución de las atribuciones de la secretaría del ayuntamiento</li>\n<li>	EC0625 Administración de la obra pública municipal</li>\n<li>	EC0689 Ejecución de las atribuciones de la hacienda pública municipal</li>\n<li>	EC0775 Administración de los servicios públicos municipales</li>\n<li>	EC0777 Ejecución de las atribuciones de la contraloría municipal</li>\n<li>	EC0778 Inscripción de actos y hechos jurídicos relativos al estado civil de las personas</li>\n<li>	EC0779 Transversalización de la perspectiva de género en la administración pública municipal</li>\n'),
(24, 'Profesionalización', 4, '<b>PROGRAMA DE PROFESIONALIZACIÓN GUBERNAMENTAL</b>\n<br>\n<br>\nEl Instituto de Administración Pública del Estado de Chiapas (IAP Chiapas), es una Asociación Civil, que tiene por objeto fortalecer el estudio y difusión de la Administración Pública en la entidad. \n<br>\n<br>\nPor lo anterior, el IAP Chiapas, ha diseñado el Programa de Profesionalización Gubernamental, como resultado de la detección de las necesidades de capacitación de las instituciones que integran la Administración Pública Estatal (APE). \n<br>\n<br>\nComo parte del Programa de Profesionalización Gubernamental, el IAP ha considerado la impartición de Posgrados, así como Diplomados, Seminarios, Talleres y otras actividades para el fortalecimiento académico, que permitan el desarrollo de capacidades y habilidades de quienes día a día hacen su labor cotidiana en la función pública.\n<br>\n<br>\n Este Programa permite la profesionalización de diversos niveles jerárquicos de la APE, ya que se consideran cursos de posgrado que requieren de un mayor grado de especialización, así como Seminarios y Cursos-Taller, que abarcan temas dirigidos a personal operativo, con lo cual la capacitación que se imparte a los servidores público del gobierno del estado es de carácter integral.\n<br>\n<br>\n<b>POSGRADOS:</b>\n<br>\n<br>\n<li>	Doctorado en Administración Pública (Presencial)</li>\n<br>\n<li>	Doctorado en Educación (Presencial y En Línea)</li>\n<br>\n<li>	Maestría en Administración y Políticas Públicas (Presencial y En Línea)</li>\n<br>\n<li>	Maestría en Educación (Presencial y En Línea)</li>\n'),
(25, 'Presencial', 4, '<b>DOCTORADO EN ADMINISTRACIÓN PÚBLICA (PRESENCIAL)</b>\n<br>\n<br>\n<b>Objetivo General</b><br>\nFormar expertos de manera sistematizada y rigurosa que contribuyan a la generación de conocimiento inédito y original para el fortalecimiento de la administración pública, tanto en los aspectos teóricos como aplicados. Que nutran a las organizaciones públicas al desarrollar proyectos y sistemas para mejorar su eficacia, así como la formulación, diseño, implementación y evaluación de políticas públicas que atiendan las demandas de la sociedad y el estado mexicano.\n<br>\n<br>\n<b>RVOE</b><br>\nPSU-185/2013.\n<br>\n<b>DURACIÓN</b><br>\nDesarrollado en 4 semestres.\n<br>\n<b>LUGAR</b><br>\nInstituto de Administración Pública del Estado de Chiapas, A.C.\n<br>\n<b>DÍAS Y HORARIOS</b><br>\nSábados de 8:00 a 16:00 hrs.><br>\n\n<b>MAPA CURRICULAR</b>\nPrimer Semestre\n<br>\n<br>\n<li>Seminario de Pensadores Administrativos Clásicos.</li>\n<li>	Epistemología y Metodología Científica.</li>\n<li>Elaboración de la Investigación I.</li>\n\nSegundo Semestre<br>\n<li>	Seminario de Pensadores Administrativos Contemporaneos.</li>\n<li>	Hermenéutica Jurídica.</li>\n<li>	Elaboración de la Investigación II.</li>\n\nTercer Semestre<br>\n<li>	Análisis y Evaluación de Políticas Públicas.</li>\n<li>	Investigación Multidisciplinaria y Transdisciplinaria.</li>\n<li>	Elaboración de la Investigación III.</li>\n\nCuarto Semestre<br>\n <li>   Análisis del Discurso.</li>\n <li>   Elaboración de la Investigación IV.</li>\n<br>\n<br>\n<b>REQUISITOS</b>\n<li> 	Llenar solicitud de registro www.iapchiapasenlinea.mx/register</li>\n<li> 	Presentar un protocolo de investigación para la tesis de grado.</li>\n<li> 	Acudir a una entrevista con el comité de ingreso y selección.</li>\n<li> 	Original y dos copias de los siguientes documentos:</li>\n<li> 	Oficio de solicitud de ingreso y beca con el porcentaje autorizado para los servidores públicos, firmada por el titular de la Dependencia.</li>\n<li> 	Acta de nacimiento (actualizada)</li>\n<li> 	Carta de exposición de motivos.</li>\n<li> 	Carta de aceptación del 80% de asistencia como requisito para tener derecho a examen.</li>\n<li> 	Cédula de grado de Maestría.</li>\n<li> 	En caso de no tener su Cédula Profesional del grado de Maestría deberá presentar: Certificado, Acta de examen y Título de grado</li>\n<li> 	Si sus documentos son de otro estado o del extranjero deberá ser validado por la institución que lo emitió.</li>'),
(26, 'En Linea', 4, '<b>DOCTORADO EN EDUCACIÓN (PRESENCIAL Y EN LÍNEA)</b><br>\n<br>\n<b>Objetivo General</b><br>\nFormar doctores específicamente en los ámbitos de gestión, planeación y evaluación de la educación, capaces de basar su toma de decisiones en conocimientos provenientes de procesos investigativos, donde entran en juego sus aptitudes, habilidades, actitudes y valores adquiridos durante su formación y necesarios para las funciones a desarrollar en alguna instancia que conforma la estructura educativa.\n<br>\n<br>\n<b>RVOE</b><br>\nPSU-107/2014.\n<br>\n<b>DURACIÓN</b><br>\n5 semestres.\n<br>\n<b>PRESENCIAL	EN LÍNEA</b><br>\n<b>LUGAR</b><br>\nInstituto de Administración Pública del Estado de Chiapas, A.C.\n<br>\n<b>DÍAS Y HORARIOS</b><br>\nSábados de 8:00 a 16:00 hrs.<br>\n	SISTEMA DE EDUCACIÓN EN LÍNEA DEL IAP-CHIAPAS\nNuestro Sistema está disponible las 24 horas durante los 7 días de la semana, por lo cual el participante puede establecer sus horarios de estudio.\n\n<b>MAPA CURRICULAR</b><br>\n<br>\n<b>Primer Semestre</b><br>\n<li>Políticas Educativas.</li>\n<li>	Historia de las Instituciones Educativas.</li>\n<li>	Introducción a la Evaluación de Instituciones y Procesos en Educación.</li>\n<li>	Introducción a la investigación educativa.</li>\n\n<b>Segundo Semestre</b><br>\n<li>	Reformas Educativas.</li>\n<li>	Administración y Organización Escolar.</li>\n<li>	Modelos de Evaluación Académica y Administrativa.</li>\n<li>	Modelos de Investigación Evaluativa.</li>\n\n<b>Tercer Semestre</b><br>\n<li>	Modelos de Planeación de la Educación.</li>\n<li>	Del Paradigma de la Administración al Paradigma de la Gestión.</li>\n<li>	Modelos de Evaluación de Procesos y Resultados Educativos.</li>\n<li>	Elaboración de Proyectos de Gestión Educativa.</li>\n\n<b>Cuarto Semestre</b><br>\n<li>	Planeación de Instituciones Educativas.</li>\n<li>	Gestión de Instituciones Educativas.</li>\n<li>	Certificación de Instituciones y Procesos Educativos.</li>\n<li>	Taller I, de Seguimiento de Proyectos de Gestión Educativa.</li>\n\n<b>Quinto Semestre</b>\n<li>		Planes y Programas de Desarrollo Institucional.</li>\n<li>		Gestión del Currículum.</li>\n<li>		Acreditación de Programas Educativos.</li>\n<li>		Taller II, de Seguimiento de Proyectos de Gestión Educativa.</li>\n\n\n<b>REQUISITOS</b><br>\n\n<li>		Llenar solicitud de registro www.iapchiapasenlinea.mx/register</li>\n<li>		Presentar un protocolo de investigación para la tesis de grado.</li>\n<li>		Acudir a una entrevista con el comité de ingreso y selección.</li>\n<li>		Original y dos copias de los siguientes documentos:</li>\n<li>		Oficio de solicitud de ingreso y beca con el porcentaje autorizado para los servidores públicos, firmada por el titular de la Dependencia.</li>\n<li>	Acta de nacimiento (actualizada)</li>\n<li>	Carta de exposición de motivos.</li>\n<li>	Carta de aceptación del 80% de asistencia como requisito para tener derecho a examen.</li>\n<li>	Cédula de grado de Maestría.</li>\n<li>	En caso de no tener su Cédula Profesional del grado de Maestría deberá presentar: Certificado, Acta de examen y Título de grado</li>\n<li>	Si sus documentos son de otro estado o del extranjero deberá ser validado por la institución que lo emitió.</li>\n'),
(28, 'Facebook', 5, ''),
(29, 'Twitter', 5, ''),
(30, 'Linkedin', 5, ''),
(31, 'Instagram', 5, ''),
(32, 'Ubicación', 6, ''),
(34, 'Formulario de Contacto', 6, ''),
(36, 'Directorio ', 1, '<br><table border=\'0\' style=\'width:100%; text-align:center; font-size:10px;\'>\n<tr>\n	<td colspan=\'2\'>\n	<b>C.P. y M.A. HARVEY GUTIÉRREZ ÁLVAREZ</b><br>\n	Presidente del Consejo Directivo<br>\n	tel.(961) 125 1508, 125 1509, 125 1510<br>\n	Ext. 102<br>\n	hgutierrez@iapchiapas.org.mx<br>\n	<br>\n	<br>\n	<br>\n	<b>C.P. ELISEO MAHEDA LÓPEZ</b><br>\n	Secretario Ejecutivo><br>\n	Tel.(961) 125 1508, 125 1509, 125 1510\n	Ext. 107\n	eliseo@iapchiapas.org.mx><br>\n	<br>\n	<br>\n	<br>\n	</td>\n</tr>\n<tr>\n	<td>\n		<b>C.P. y L.D. ORFANEL TOALÁ RAMOS</b><br>\n		Director Académico<br>\n		Tel.(961) 125 1508, 125 1509, 125 1510<br>\n		Ext. 106<br>\n		otoala@iapchiapas.org.mx<br>\n\n	</td>\n	<td>\n		<b>C.P. y L.D. JOSÉ FEDERICO GUZMÁN HERNÁNDEZ</b><br>\n		Coordinador Administrativo<br>\n		Tel.(961) 125 1508, 125 1509, 125 1510<br>\n		EXT. 113<br>\n		jguzman@iapchiapas.org.mx<br>\n\n	</td>\n</tr>\n</table>'),
(38, 'Consultoria', 2, '<br><b>CONSULTORÍAS Y DIPLOMADOS</b>\n<br>\n<br>\n\n<b>CONSULTORÍAS</b>\n<br><br>\n<li>	Reglamentos </li>\n<li>	Manuales </li>\n<li>	Planes Municipales de Desarrollo </li>\n<br>\n<br>\n<b>DIPLOMADOS</b>\n<br><br>\n<li>	Gobierno y Administración Pública Municipal</li>\n<li>	Políticas Públicas para la Cultura Física y el Deporte</li>\n<li>	Inteligencia para la Seguridad y el Desarrollo Estatal</li>\n<li>	Contabilidad Gubernamental</li>\n'),
(40, 'Instalaciones', 0, ''),
(41, 'Consejo Directivo', 0, '<br>\n<table border=\'0\' style=\'width:100%; text-align:center; font-size:10px;\'>\n	<tr>\n		<td colspan=\'2\'>\n		<b>LIC. MANUEL VELASCO COELLO </b><br>\n		Presidente Honorífico<br><br>\n		<b>MTRO. HARVEY GUTIÉRREZ ÁLVAREZ </b><br>\n		Presidente del Consejo Directivo<br><br>\n		<b>LIC. FERNANDO CASTELLANOS CAL Y MAYOR</b> <br>\n		Vicepresidente<br><br>\n		<b>LIC. HUMBERTO PEDRERO MORENO </b><br>\n		Tesorero<br>\n		</td>\n	</tr>\n	<tr>\n		<td colspan=\'2\'>\n		<br>\n		<b>CONSEJEROS</b>\n		<br>\n		<br>\n		</td>\n	</tr>\n	<tr>\n		<td style=\'width:50%; text-align:center; font-size:10px;\'>\n			<b>LIC. JUAN CARLOS GÓMEZ ARANDA </b><br><br>\n			<b>MTRO. NAVOR FRANCISCO BALLINAS MORALES</b> <br><br>\n			<b>LIC. LUIS MANUEL GARCÍA MORENO</b><br><br>\n			<b>DR. FERNANDO ÁLVAREZ SIMÁN</b><br>\n		</td>\n		<td style=\'width:50%; text-align:center; font-size:10px;\'>\n			<b>DR. CARLOS EUGENIO RUÍZ HERNÁNDEZ </b><br><br>\n			<b>ING. ROBERTO DOMÍNGUEZ CASTELLANOS </b><br><br>\n			<b>C.P. MIGUEL AGUSTÍN LÓPEZ CAMACHO</b>  <br><br>\n			<b>LIC. JORGE DE LA VEGA DOMÍNGUEZ </b> \n	\n		</td>\n	</tr>\n</table>'),
(42, 'Estándar EC0076', 13, '<center><br><b>ESTÁNDAR EC0076</b>\n<br>\n<br>\n<b>“Evaluación de la competencia de candidatos con base en Estándares de Competencia”</b>\n</center>\n<br>\n<br>\n<br>\nPropósito del Estándar de Competencia:\n<br>\n<br>\nServir como referente para la evaluación y certificación de las personas que evalúan la competencia de candidatos con base en Estándares de Competencia y aseguran la excelencia en el proceso de evaluación de competencia.\n<br>\n<br>\nEste Estándar de Competencia contempla las funciones que una persona realiza para evaluar la competencia de candidatos con base en Estándares de Competencia cumpliendo los principios de transparencia, imparcialidad y objetividad.\n'),
(43, 'Estándar EC0105', 13, '<center><br><b>ESTÁNDAR EC0105\n<br>\n<br>\n“Atención al ciudadano en el sector público”<br>\n</b>\n</center>\n<br>\n<br>\nPropósito del Estándar de Competencia:\n<br>\n<br>\nServir como referente para la evaluación y certificación de las personas que prestan un servicio de atención personalizada al ciudadano en el Sector Público, desde la detección de las necesidades del servicio, la gestión y procesamiento de la información/documentación del servicio proporcionado, siguiendo los lineamientos institucionales.\n<br>\n<br>\nEste Estándar de Competencia expresa la competencia que una persona realiza para prestar atención personalizada al ciudadano en el sector público, conforme a los lineamientos establecidos en cada institución pública. Desde que atiende al ciudadano y detecta el tipo de servicio que requiere, de acuerdo a lo que expresa y las preguntas que el candidato le realiza, solicitando, verificando y procesando la información / documentación requerida para gestionar el servicio hasta la conclusión del mismo.\n'),
(44, 'Estándar EC0217', 13, '<center><br><b>ESTÁNDAR EC0217\n<br>\n<br>\n“Impartición de cursos de formación del capital humano de manera presencial grupal”</b></center>\n<br>\n<br>\nPropósito del Estándar de Competencia:\n<br>\nServir como referente para la evaluación y certificación de las personas que imparten cursos de formación del capital humano de manera presencial y grupal.\n<br>\n<br>\nEste estándar de competencia contempla las funciones sustantivas de preparar, conducir y evaluar cursos de capacitación. Preparar la sesión mediante la planeación de la sesión y la comprobación de la existencia y el funcionamiento de los recursos requeridos para la misma. Conducir la sesión realizando el encuadre, desarrollo y cierre, empleando técnicas instruccionales y grupales que faciliten el proceso de aprendizaje. Evaluar el aprendizaje antes, durante y al final del curso, considerando la satisfacción de los participantes.\n'),
(45, 'Estándar EC0462', 13, '<center><br><b>ESTÁNDAR EC0462\n<br>\n<br>\n“Ejecuciones de las atribuciones de la Secretaría del Ayuntamiento”</b></center><br>\n<br>\nPropósito del Estándar de Competencia:\n<br>\nServir como referente para la evaluación y certificación de las personas que ejecutan las atribuciones de Secretario del Ayuntamiento y que comprende la coordinación para la celebración de las sesiones de cabildo, la administración de los documentos oficiales del Ayuntamiento y la Administración Pública Municipal, la publicación de las disposiciones de observancia general y la coordinación administrativa de los acuerdos del Gobierno Municipal\n<br>\n<br>\nEste Estándar de Competencia expresa la competencia que una persona tiene para ejercer las atribuciones de Secretario del Ayuntamiento, que va desde convocar y llevar a cabo las sesiones de cabildo con los Integrantes del Ayuntamiento, dar seguimiento a los asuntos generados, llevar el control de la correspondencia oficial del ayuntamiento, expedir copias certificadas de los documentos del archivo municipal, citar a las sesiones del cabildo, levantar las actas de las sesiones, compilar todos los documentos oficiales emanados del ayuntamiento o del presidente municipal, certificar y publicar todas las disposiciones emanadas del ayuntamiento, auxiliar a las autoridades federales y estatales, formular el inventario general de bienes muebles e inmuebles del municipio, hacer cumplir los bandos, reglamentos, circulares y disposiciones de observancia general emitidos por el ayuntamiento y coordinar administrativamente los acuerdos del Gobierno Municipal.\n'),
(46, 'Estándar EC0625', 13, '<center><br><b>ESTÁNDAR EC0625\n<br>\n<br>\n\n“Administración de la Obra Pública Municipal”<br>\n<br></b></center>\nPropósito del Estándar de Competencia:\n<br>\nEvaluación y certificación de las personas que ejercen la función de Administración de la Obra Pública Municipal y que comprende desde realizar la planeación de la obra pública municipal, revisar la integración del expediente técnico inicial/base de la obra pública municipal, supervisar la contratación y ejecución de la obra pública municipal, hasta realizar la entrega-recepción de la obra pública municipal.\n<br>\n<br>\nDirigido a: Director de Obras Públicas, Jefe de Obras Públicas, Supervisor de Obra Públicas\n<br>\n<br>\nElementos que evalúa el estándar: 4\n<br>\n<br>\n<b>Elemento 1 de 4</b><br>\nRealizar la planeación de la Obra Pública Municipal<br>\n<b>Elemento 2 de 4</b><br>\nRevisar la integración del expediente técnico inicial/base de la obra pública municipal<br>\n<b>Elemento 3 de 4</b><br>\nSupervisar la contratación y ejecución de la obra pública municipal.<br>\n<b>Elemento 4 de 4</b><br>\nRealizar la Entrega-Recepción de la Obra Pública Municipal.<br>\n<br>\nDuración estimada de la evaluación: De 2 a 3 horas\n<br>\n<b>Proceso de evaluación:</b>\n<li>	Llenar: Ficha de registro, Evaluación diagnóstica, Foto para certificado y firma de acuse de derechos</li>\n<li>	Llevar el Curso de capacitación para certificación</li>\n<li>	Presentarse el día de evaluación para entregar Productos</li>\n<li>	Presentarse para recibir el certificado en un evento público</li>\n'),
(47, 'Estándar EC0689', 13, '<center><br><b>ESTÁNDAR EC0689\n<br><br>\n\n“Ejecución de las Atribuciones de la Hacienda Pública Municipal”</b><br></center>\n<br>\n<br>\nPropósito del Estándar de Competencia:<br>\n\nEvaluación y certificación de los servidores públicos que realizan la función de la Administración de la Hacienda Pública Municipal, lo cual incluye obtener los recursos financieros para el municipio, administrar el gasto público del municipio, gestionar los pasivos y disciplina financiera municipal, y transparentar y rendir cuentas de la hacienda pública municipal.\n<br>\n<br>\nDirigido a: Presidente Municipal, Regidor, Síndico, Secretario de Finanzas, Director de Finanzas, Secretario de Administración y Finanzas, Director de Administración y Finanzas, Director de Ingresos, Director de Egresos\n<br>\n<br>\nElementos que evalúa el estándar: 4<br>\n\n<b>Elemento 1 de 4</b><br>\nObtener los recursos financieros para el municipio.<br>\n<b>Elemento 2 de 4</b><br>\nCoordinar el anteproyecto de presupuesto de egresos para la administración del gasto público del municipio.<br>\n<b>Elemento 3 de 4</b><br>\nGestionar los pasivos y disciplina financiera municipal.<br>\n<b>Elemento 4 de 4</b><br>\nTransparentar y rendir cuentas de la hacienda pública municipal.<br>\n\nDuración estimada de la evaluación: De 3 a 4 horas<br>\n<br>\n<b>Proceso de evaluación:</b>\n<li>Llenar: Ficha de registro, Evaluación diagnóstica, Foto para certificado y firma de acuse de derechos</li>\n<li>	Llevar el Curso de capacitación para certificación</li>\n<li>	Presentarse el día de evaluación para entregar Productos</li>\n<li>	Presentarse para recibir el certificado en un evento público</li>\n'),
(48, 'Estándar EC0775', 13, '<center><br><b>ESTÁNDAR EC0775\n<br>\n<br>\n\n“Administración de los Servicios Públicos Municipales”<br></b>\n</center>\n<br>\n<br>\n\nPropósito del Estándar de Competencia:\n<br>\n<br>\n\nEvaluación y certificación de las personas que se desempeñan en la administración de los servicios públicos municipales.<br>\n\nDirigido a: Síndico, Regidor, Titular de Servicios Públicos Municipales<br>\n<br>\nElementos que evalúa el estándar: 2<br>\n<br>\n<b>Elemento 1 de 2</b><br>\nPlanear la prestación de los servicios públicos municipales.<br>\n<b>Elemento 2 de 2</b><br>\nImplementar los programas para la prestación de los servicios públicos municipales.<br>\n\nDuración estimada de la evaluación: 2 horas<br>\n\n<b>Proceso de evaluación:</b><br>\n<li>	Llenar: Ficha de registro, Evaluación diagnóstica, Foto para certificado y firma de acuse de derechos</li>\n<li>	Llevar el Curso de capacitación para certificación</li>\n<li>	Presentarse el día de evaluación para entregar Productos</li>\n<li>	Presentarse para recibir el certificado en un evento público</li>'),
(49, 'Estándar EC0777', 13, '<center><b>ESTÁNDAR EC0777\n<br>\n<br>\n\n“Ejecución de las Atribuciones de la Contraloría Municipal”</b></center>\n<br>\n<br>\n\nPropósito del Estándar de Competencia:\n<br>\n<br>\nEvaluación y certificación de las personas que se desempeñan en las funciones de control interno de la administración pública municipal.\n<br>\n<br>\n\nDirigido a: Regidor, Síndico, Titular del Órgano Interno de Control Municipal, Contralor administrativo\n<br>\n<br>\n\nElementos que evalúa el estándar: \n<br>\n<br>\n\n<b>Elemento 1 de 4</b><br>\nImplementar auditorias en materia de control interno en la administración pública municipal.<br>\n<b>Elemento 2 de 4</b><br>\nAtender quejas y denuncias en la administración pública municipal<br>\n<b>Elemento 3 de 4</b><br>\nSustanciar procedimientos administrativos de responsabilidades en la administración pública municipal<br>\n<b>Elemento 4 de 4</b><br>\nImplementar acciones de control y evaluación en materia de control interno en la administración pública municipal<br>\n\nDuración estimada de la evaluación: De 3 a 4 horas<br>\n\n<b>Proceso de evaluación:</b><br>\n<li>	Llenar: Ficha de registro, Evaluación diagnóstica, Foto para certificado y firma de acuse de derechos</li>\n<li>	Llevar el Curso de capacitación para certificación</li>\n<li>	Presentarse el día de evaluación para entregar Productos</li>\n<li>Presentarse para recibir el certificado en un evento público</li>\n'),
(50, 'Estándar EC0778', 13, '<center><br><b>ESTÁNDAR EC0778\n<br>\n<br>\n\n\n“Inscripción de Actos y Hechos Jurídicos Relativos al Estado Civil de las Personas”</b></center>\n<br>\nPropósito del Estándar de Competencia:\n<br>\n<br>\n\nEvaluación y certificación de los servidores públicos que realizan la inscripción del nacimiento, matrimonio y defunción de las personas.\n<br>\n<br>\nDirigido a: Juez de Registro Civil; Oficial del Registro Civil; Coordinadores y jefes de área en servicios legales; jueces calificadores y fiscales; Personal de la Secretaría municipal que orienta a las personas en estos trámites.\n<br>\n<br>\nElementos que evalúa el estándar: 3<br>\n<b>Elemento 1 de 3</b><br>\nInscribir el nacimiento de las personas<br>\n<b>Elemento 2 de 3</b><br>\nInscribir el matrimonio de las personas<br>\n<b>Elemento 3 de 3</b><br>\nInscribir la defunción de las personas<br>\n<br>\n<br>\nDuración estimada de la evaluación: De 2 a 3 horas<br>\n<br>\n<b>Proceso de evaluación:</b><br>\n<li>	Llenar: Ficha de registro, Evaluación diagnóstica, Foto para certificado y firma de acuse de derechos</li>\n<li>	Llevar el Curso de capacitación para certificación</li>\n<li>	Presentarse el día de evaluación para entregar Productos</li>\n<li>	Presentarse para recibir el certificado en un evento público</li>\n'),
(51, 'Estándar EC0779', 13, '<center><br><b>ESTÁNDAR EC0779\n<br>\n<br>\n“Transversalización de la Perspectiva de Género en la Administración Pública Municipal”</b>\n</center>\n<br>\n<br>\nPropósito del Estándar de Competencia:\n<br>\n<br>\nEvaluación y certificación de las personas que se desarrollan como servidores/as públicos en la Instancia Municipal de las Mujeres\n<br>\n<br>\nDirigido a: Directora del Instituto Municipal de las Mujeres, Directora de la Instancia Municipal de las Mujeres, Titular de la Instancia Municipal de las Mujeres.\n<br>\n<br>\nElementos que evalúa el estándar: 2<br>\n<b>Elemento 1 de 2</b><br>\nPlanear la transversalidad de la perspectiva de género en la administración pública municipal.<br>\n<b>Elemento 2 de 2</b><br>\nGestionar la transversalidad de la perspectiva de género en la administración pública municipal<br>\n<br>\n<br>\nDuración estimada de la evaluación: De 2 a 3 horas<br>\n<br>\n<b>Proceso de evaluación:</b>\n<li>	Llenar: Ficha de registro, Evaluación diagnóstica, Foto para certificado y firma de acuse de derechos</li>\n<li>	Llevar el Curso de capacitación para certificación</li>\n<li>	Presentarse el día de evaluación para entregar Productos</li>\n<li>	Presentarse para recibir el certificado en un evento público</li>'),
(52, 'Doctorado en Administración Pública', 25, '<br><b>DOCTORADO EN ADMINISTRACIÓN PÚBLICA</b><br><br>\n<b>Objetivo General</b><br>Formar expertos de manera sistematizada y rigurosa que contribuyan a la generación de conocimiento inédito y original\n para el fortalecimiento de la administración pública, tanto en los aspectos teóricos como aplicados. Que nutran a las organizaciones públicas \n al desarrollar proyectos y sistemas para mejorar su eficacia, así como la formulación, diseño, implementación y evaluación de políticas públicas\n que atiendan las demandas de la sociedad y el estado mexicano.<br><br><b>RVOE</b><br>PSU-185/2013.\n <br>\n <br>\n <b>DURACIÓN</b><br>Desarrollado en 4 semestres.\n <br>\n <br>\n <b>LUGAR</b>\n <br>Instituto de Administración Pública del Estado de Chiapas, A.C.\n <br>\n <br>\n <b>DÍAS Y HORARIOS</b><br>Sábados de 8:00 a 16:00 hrs.\n <br>\n <br>\n <b>MAPA CURRICULAR</b>\n <br>\n <br>\n <b>Primer Semestre</b>\n <br>\n <li>Seminario de Pensadores Administrativos Clásicos.</li>\n <li>	Epistemología y Metodología Científica.</li>\n <li>Elaboración de la Investigación I.</li>\n <br>\n <br>\n <b>Segundo Semestre</b><br>\n <li>	Seminario de Pensadores Administrativos Contemporaneos.</li>\n <li>	Hermenéutica Jurídica.</li><li>	Elaboración de la Investigación II.</li>\n  <br>\n <br>\n <b>Tercer Semestre</b><br>\n <li>	Análisis y Evaluación de Políticas Públicas.</li>\n <li>	Investigación Multidisciplinaria y Transdisciplinaria.</li>\n <li>	Elaboración de la Investigación III.</li>\n  <br>\n <br>\n  <b>Cuarto Semestre</b><br> \n <li>   Análisis del Discurso.</li> \n <li>   Elaboración de la Investigación IV.</li>\n <br><br>\n <b>REQUISITOS</b><br>\n <li> 	Llenar solicitud de registro www.iapchiapasenlinea.mx/register</li>\n <br>\n <li> 	Presentar un protocolo de investigación para la tesis de grado.</li>\n  <br>\n <li> 	Acudir a una entrevista con el comité de ingreso y selección.</li>\n  <br>\n <li> 	Original y dos copias de los siguientes documentos:</li>\n  <br>\n <li> 	Oficio de solicitud de ingreso y beca con el porcentaje autorizado para los servidores públicos, firmada por el titular de la Dependencia.</li>\n  <br>\n <li> 	Acta de nacimiento (actualizada)</li>\n <br>\n <li> 	Carta de exposición de motivos.</li>\n  <br>\n <li> 	Carta de aceptación del 80% de asistencia como requisito para tener derecho a examen.</li>\n  <br>\n <li> 	Cédula de grado de Maestría.</li>\n  <br>\n <li> 	En caso de no tener su Cédula Profesional del grado de Maestría deberá presentar: Certificado, Acta de examen y Título de grado</li>\n  <br>\n <li> 	Si sus documentos son de otro estado o del extranjero deberá ser validado por la institución que lo emitió.</li>\n'),
(53, 'Doctorado en Educación', 25, '<br>\n<b>DOCTORADO EN EDUCACIÓN </b>\n<br><br>\n<b>Objetivo General</b><br>\nFormar doctores específicamente en los ámbitos de gestión, planeación y evaluación de la educación, \ncapaces de basar su toma de decisiones en conocimientos provenientes de procesos investigativos, donde \nentran en juego sus aptitudes, habilidades, actitudes y valores adquiridos durante su formación y necesarios \npara las funciones a desarrollar en alguna instancia que conforma la estructura educativa.\n<br><br>\n<b>RVOE</b>\n<br>PSU-107/2014.\n<br>\n<br>\n<b>DURACIÓN</b><br>5 semestres.\n<br>\n<br>\n<b>LUGAR</b><br>\nInstituto de Administración Pública del Estado de Chiapas, A.C\n<br>\n<br>\n<b>DIAS Y HORARIOS</b><br>\n<br>\nSábados de 8:00 a 16:00 hrs.\n<br><br>\n\n\n	<b>MAPA CURRICULAR</b>\n	<br><br>\n	<b>Primer Semestre</b><br>\n	<br><li>Políticas Educativas.</li>\n	<li>	Historia de las Instituciones Educativas.</li>\n	<li>	Introducción a la Evaluación \n	de Instituciones y Procesos en Educación.</li>\n	<li>	Introducción a la investigación educativa.</li>\n	<br>\n	<br>\n	<b>Segundo Semestre</b><br>\n	<li>	Reformas Educativas.</li>\n	<li>	Administración y Organización Escolar.</li>\n	<li>	Modelos de Evaluación Académica y Administrativa.</li>\n	<li>	Modelos de Investigación Evaluativa.</li>\n	<br>\n	<br>\n	<b>Tercer Semestre</b><br>\n	<li>	Modelos de Planeación de la Educación.</li>\n	<li>	Del Paradigma de la Administración al Paradigma de la Gestión.</li>\n	<li>	Modelos de Evaluación de Procesos y Resultados Educativos.</li>\n	<li>	Elaboración de Proyectos de Gestión Educativa.</li>\n	<br>\n	<br>\n	<b>Cuarto Semestre</b><br>\n	<li>	Planeación de Instituciones Educativas.</li><li>	\n	Gestión de Instituciones Educativas.</li>\n	<li>	Certificación de Instituciones y Procesos Educativos.</li>\n	<li>	Taller I, de Seguimiento de Proyectos de Gestión Educativa.</li>\n	<br>\n	<br>\n	<b>Quinto Semestre</b>\n	<li>		Planes y Programas de Desarrollo Institucional.</li>\n	<li> Gestión del Currículum.</li>\n	<li>		Acreditación de Programas Educativos.</li>\n	<li>Taller II, de Seguimiento de Proyectos de Gestión Educativa.</li>\n	<br><br>\n	<b>REQUISITOS</b><br>\n	<li>		Llenar solicitud de registro www.iapchiapasenlinea.mx/register</li>\n	<br>\n	<li>	\n	Presentar un protocolo de investigación para la tesis de grado.</li><br>\n	<li>		Acudir a una entrevista con el comité de ingreso y selección.</li>\n	<br>\n	<li>\n	Original y dos copias de los siguientes documentos:</li><br>\n	<li>		Oficio de solicitud de ingreso y beca con el porcentaje autorizado para los servidores públicos,\n firmada por el titular de la Dependencia.</li><li>	Acta de nacimiento (actualizada)</li><br>\n <li>	Carta de exposición de motivos.</li>\n <br>\n <li>\n Carta de aceptación del 80% de asistencia como requisito para tener derecho a examen.</li>\n <li>	Cédula de grado de Maestría.</li>\n <br>\n <li>\n En caso de no tener su Cédula Profesional del grado de Maestría deberá presentar: Certificado, Acta de examen y Título de grado</li>\n <li>Si sus documentos son de otro estado o del extranjero deberá ser validado por la institución que lo emitió.</li>\n'),
(54, 'Maestría en Administración y Políticas Públicas', 25, '<br><b>MAESTRÍA EN ADMINISTRACIÓN Y POLÍTICAS PÚBLICAS</b>\n<br><br>\n\n<b>Objetivo General</b>\n<br>Formar Maestros en Administración y Políticas Públicas, que dispongan de las herramientas teórico-metodológicas para proponer, \nimplementar, y evaluar políticas públicas innovadoras, que permitan hacer cambios organizacionales para incrementar los\n niveles de calidad en los tres órdenes de gobierno.<br>\n <br><b>RVOE</b>\n <br>PSU-45/2011.\n <br>\n <br>\n <b>DURACIÓN</b>\n <br>4 cuatrimestres.\n <br>\n <br>\n\n<b>LUGAR</b><br>\nInstituto de Administración Pública del Estado de Chiapas, A.C.\n<br>\n<br>\n<b>DIAS Y HORARIOS</b><br>\nSábados de 8:00 a 16:00 hrs.\n\n \n\n <br><br><b>MAPA CURRICULAR</b><br><br>\n <b>Primer Cuatrimestre</b><br>\n <li>	Fundamentos Jurídicos de la Administración Pública.</li>\n <li>	Política Económica.</li>\n <li>	Planeación Estratégica.</li>\n <br>\n <br>\n<b>Segundo Cuatrimestre</b><br>\n <li>	Diseño y Análisis de Políticas Públicas.</li>\n <li>	Desarrollo Organizacional.</li>\n <li>	Gestión para Resultados.</li>\n <br><br>\n <b>Tercer Cuatrimestre</b><br>\n <li>	Estadística Administrativa.</li><li>\n Metodología de la Investigación.</li>\n <li>	Tecnologías de la Información y Comunicación en Administración.</li>\n <br><br>\n <b>Cuarto Cuatrimestre</b><br>\n <li>	Proyecto de Investigación.</li>\n <li>	Evaluación e Impacto de las Políticas Públicas.</li>\n <li>	Rendición de Cuentas y Contraloría Social.</li>\n <br><br>\n <b>REQUISITOS</b><br>\n <li>	Llenar solicitud de registro www.iapchiapasenlinea.mx/register</li>\n <br>\n <li>	Presentar un protocolo de investigación para la tesis de grado.</li>\n  <br>\n <li>	Acudir a una entrevista con el comité de ingreso y selección.</li>\n <li>	Original y dos copias de los siguientes documentos:</li>\n  <br>\n <li>	Oficio de solicitud de ingreso y beca con el porcentaje autorizado para los servidores públicos,\n firmada por el titular de la Dependencia.</li>\n  <br>\n <li>	Acta de nacimiento (actualizada)</li>\n  <br>\n <li>	Carta de exposición de motivos.</li>\n <li>	Carta de aceptación del 80% de asistencia como requisito para tener derecho a examen.</li>\n  <br>\n <li>	Cédula de grado de Maestría.</li>\n <li>	En caso de no tener su Cédula Profesional del grado de Maestría deberá presentar: Certificado, Acta de examen y Título de grado</li>\n  <br>\n <li>	Si sus documentos son de otro estado o del extranjero deberá ser validado por la institución que lo emitió.\n </li>\n'),
(55, 'Maestría en Educación', 25, '<b>MAESTRÍA EN EDUCACIÓN</b>\n\n<br>\n<br>\n<b>Objetivo General</b><br>\nFormar maestros en Educación con énfasis en el ámbito de la gestión educativa, capaz de diagnosticar situaciones problemáticas en el contexto donde se desempeña; así como emprender proyectos de gestión participativa para impulsar procesos de cambio educativo.\n<br>\n<br>\n<b>RVOE</b><br>\nPSU-106/2014.\n<br>\n<br>\n<b>DURACIÓN</b><br>\n4 semestres.\n<br>\n<br>\n<b>LUGAR</b><br>\nInstituto de Administración Pública del Estado de Chiapas, A.C.\n<br>\n<br>\n<b>DIAS Y HORARIOS</b><br>\nSábados de 8:00 a 16:00 hrs.\n<br>\n<br>\n<b>MAPA CURRÍCULAR</b>\n<br>\n<br>\n<b>Primer Semestre</b>\n<li>	Filosofía de la Educación.</li>\n<li>	Cambio, Reforma e Innovación Educativa.</li>\n<li>	Política Educativa.</li>\n<li>	Taller de Gestión I.</li>\n<br>\n<br>\n<b>Segundo Semestre</b>\n<li>	Historia de la Educación.</li>\n<li>	Ámbito de la Gestión para el Cambio Educativo.</li>\n<li>	Legislación Educativa.</li>\n<li>	Taller de Gestión II.</li>\n<br>\n<br>\n<b>Tercer Semestre</b>\n<li>	Enfoques Pedagógicos Actuales.</li>\n<li>	Gestión y Agentes del Cambio Educativo.</li>\n<li>	Reformas Educativas.</li>\n<li>	Taller de Gestión III.</li>\n<br>\n<br>\n<b>Cuarto Semestre</b>\n<li>	La Educación en la Sociedad del Conocimiento y la Información.</li>\n<li>	Gestión y Procesos de Cambio Educativo.</li>\n<li>	Programas Educativos.</li>\n<li>	Taller de Gestión IV.</li>\n<br>\n<br>\n<b>REQUISITOS</b><br>\n<li>		Llenar solicitud de registro www.iapchiapasenlinea.mx/register</li>\n<br>\n<li>		Presentar un protocolo de investigación para la tesis de grado.</li>\n<br>\n<li>		Acudir a una entrevista con el comité de ingreso y selección.</li>\n<br>\n<li>	Original y dos copias de los siguientes documentos:</li>\n<br>\n<li>	Oficio de solicitud de ingreso y beca con el porcentaje autorizado para los servidores públicos, firmada por el titular de la Dependencia.</li>\n<br>\n<li>	Acta de nacimiento (actualizada)</li>\n<br>\n<li>	Carta de exposición de motivos.</li>\n<br>\n<li>	Carta de aceptación del 80% de asistencia como requisito para tener derecho a examen.</li>\n<br>\n<li>	Cédula de grado de Maestría.</li>\n<br>\n<li>	En caso de no tener su Cédula Profesional del grado de Maestría deberá presentar: Certificado, Acta de examen y Título de grado</li>\n<br>\n<li>	Si sus documentos son de otro estado o del extranjero deberá ser validado por la institución que lo emitió.</li>\n\n');
INSERT INTO `menu_app` (`menuAppId`, `nombre`, `menuId`, `contenido`) VALUES
(56, 'Doctorado en Educación', 26, '<b>DOCTORADO EN EDUCACIÓN </b><br><br><b>Objetivo General</b>\n<br>Formar doctores específicamente en los ámbitos de gestión, planeación y evaluación de la educación, \ncapaces de basar su toma de decisiones en conocimientos provenientes de procesos investigativos, \ndonde entran en juego sus aptitudes, habilidades, actitudes y valores adquiridos durante su formación y\n necesarios para las funciones a desarrollar en alguna instancia que conforma la estructura educativa.<br><br>\n <b>RVOE</b><br>PSU-107/2014.\n <br>\n <br>\n <b>DURACIÓN</b><br>5 semestres.\n <br>\n <br>\n <b>LUGAR</b>\n <br>\nSISTEMA DE EDUCACIÓN EN LÍNEA DEL IAP-CHIAPAS Nuestro Sistema está disponible las 24 horas durante los 7 días de la semana,\n por lo cual el participante puede establecer sus horarios de estudio.\n <br>\n <br>	\n <b>MAPA CURRICULAR</b><br><br>\n Primer Semestre</b><br>\n <li>Políticas Educativas.</li>\n <li>Historia de las Instituciones Educativas.</li>\n <li>Introducción a la Evaluación de Instituciones y Procesos en Educación.</li>\n <li>Introducción a la investigación educativa.</li>\n <br>\n <br>\n <b>Segundo Semestre</b>\n <br>\n <li>Reformas Educativas.</li>\n <li>Administración y Organización Escolar.</li>\n <li>Modelos de Evaluación Académica y Administrativa.</li>\n <li>Modelos de Investigación Evaluativa.</li>\n <br>\n <br>\n <b>Tercer Semestre</b><br>\n <li>Modelos de Planeación de la Educación.</li>\n <li>Del Paradigma de la Administración al Paradigma de la Gestión.</li>\n <li>Modelos de Evaluación de Procesos y Resultados Educativos.</li>\n <li>Elaboración de Proyectos de Gestión Educativa.</li>\n<br>\n<br>\n <b>Cuarto Semestre</b>\n <br>\n <li>Planeación de Instituciones Educativas.</li>\n <li>Gestión de Instituciones Educativas.</li>\n <li>Certificación de Instituciones y Procesos Educativos.</li>\n <li>Taller I, de Seguimiento de Proyectos de Gestión Educativa.</li>\n <br>\n <br>\n <b>Quinto Semestre</b>\n <li>Planes y Programas de Desarrollo Institucional.</li>\n <li>Gestión del Currículum.</li>\n <li>Acreditación de Programas Educativos.</li>\n <li>Taller II, de Seguimiento de Proyectos de Gestión Educativa.</li>\n  <br>\n <br>\n <b>REQUISITOS</b><br><li>	\n Llenar solicitud de registro www.iapchiapasenlinea.mx/register</li>\n <li>		Presentar un protocolo de investigación para la tesis de grado.</li>\n <li>	 Acudir a una entrevista con el comité de ingreso y selección.</li>\n <li>		Original y dos copias de los siguientes documentos:</li>\n <li>	 Oficio de solicitud de ingreso y beca con el porcentaje autorizado para los servidores públicos, firmada por el titular de la Dependencia.</li>\n <li> Acta de nacimiento (actualizada)</li>\n <li>	Carta de exposición de motivos.</li>\n <li> Carta de aceptación del 80% de asistencia como requisito para tener derecho a examen.</li>\n <li>	Cédula de grado de Maestría.</li>\n <li> En caso de no tener su Cédula Profesional del grado de Maestría deberá presentar: Certificado, Acta de examen y Título de grado</li>\n <li> Si sus documentos son de otro estado o del extranjero deberá ser validado por la institución que lo emitió.</li>\n'),
(57, 'Maestría en Administración y Políticas Públicas', 26, '<br><b>MAESTRÍA EN ADMINISTRACIÓN Y POLÍTICAS PÚBLICAS</b>\n<br><br>\n\n<b>Objetivo General</b>\n<br>Formar Maestros en Administración y Políticas Públicas, que dispongan de las herramientas teórico-metodológicas para proponer, \nimplementar, y evaluar políticas públicas innovadoras, que permitan hacer cambios organizacionales para incrementar los\n niveles de calidad en los tres órdenes de gobierno.<br>\n <br><b>RVOE</b>\n <br>PSU-45/2011.\n <br>\n <br>\n <b>DURACIÓN</b>\n <br>4 cuatrimestres.\n <br>\n <br>\n\n<b>LUGAR</b><br>\n\nSISTEMA DE EDUCACIÓN EN LÍNEA DEL IAP-CHIAPAS Nuestro Sistema está disponible las 24 horas durante los 7 días de la semana,\n por lo cual el participante puede establecer sus horarios de estudio.\n\n\n \n\n <br><br><b>MAPA CURRICULAR</b><br><br>\n <b>Primer Cuatrimestre</b><br>\n <li>	Fundamentos Jurídicos de la Administración Pública.</li>\n <li>	Política Económica.</li>\n <li>	Planeación Estratégica.</li>\n <br>\n <br>\n<b>Segundo Cuatrimestre</b><br>\n <li>	Diseño y Análisis de Políticas Públicas.</li>\n <li>	Desarrollo Organizacional.</li>\n <li>	Gestión para Resultados.</li>\n <br><br>\n <b>Tercer Cuatrimestre</b><br>\n <li>	Estadística Administrativa.</li><li>\n Metodología de la Investigación.</li>\n <li>	Tecnologías de la Información y Comunicación en Administración.</li>\n <br><br>\n <b>Cuarto Cuatrimestre</b><br>\n <li>	Proyecto de Investigación.</li>\n <li>	Evaluación e Impacto de las Políticas Públicas.</li>\n <li>	Rendición de Cuentas y Contraloría Social.</li>\n <br><br>\n <b>REQUISITOS</b><br>\n <li>	Llenar solicitud de registro www.iapchiapasenlinea.mx/register</li>\n <br>\n <li>	Presentar un protocolo de investigación para la tesis de grado.</li>\n  <br>\n <li>	Acudir a una entrevista con el comité de ingreso y selección.</li>\n <li>	Original y dos copias de los siguientes documentos:</li>\n  <br>\n <li>	Oficio de solicitud de ingreso y beca con el porcentaje autorizado para los servidores públicos,\n firmada por el titular de la Dependencia.</li>\n  <br>\n <li>	Acta de nacimiento (actualizada)</li>\n  <br>\n <li>	Carta de exposición de motivos.</li>\n <li>	Carta de aceptación del 80% de asistencia como requisito para tener derecho a examen.</li>\n  <br>\n <li>	Cédula de grado de Maestría.</li>\n <li>	En caso de no tener su Cédula Profesional del grado de Maestría deberá presentar: Certificado, Acta de examen y Título de grado</li>\n  <br>\n <li>	Si sus documentos son de otro estado o del extranjero deberá ser validado por la institución que lo emitió.\n </li>\n'),
(58, 'Maestría en Educación', 26, '<b>MAESTRÍA EN EDUCACIÓN</b>\n\n<br>\n<br>\n<b>Objetivo General</b><br>\nFormar maestros en Educación con énfasis en el ámbito de la gestión educativa, capaz de diagnosticar situaciones problemáticas en el contexto donde se desempeña; así como emprender proyectos de gestión participativa para impulsar procesos de cambio educativo.\n<br>\n<br>\n<b>RVOE</b><br>\nPSU-106/2014.\n<br>\n<br>\n<b>DURACIÓN</b><br>\n4 semestres.\n<br>\n<br>\n<b>LUGAR</b><br>\nSISTEMA DE EDUCACIÓN EN LÍNEA DEL IAP-CHIAPAS Nuestro Sistema está disponible las 24 horas durante los 7 días de la semana,\n por lo cual el participante puede establecer sus horarios de estudio.\n<br>\n<br>\n\n<b>MAPA CURRÍCULAR</b>\n<br>\n<br>\n<b>Primer Semestre</b>\n<li>	Filosofía de la Educación.</li>\n<li>	Cambio, Reforma e Innovación Educativa.</li>\n<li>	Política Educativa.</li>\n<li>	Taller de Gestión I.</li>\n<br>\n<br>\n<b>Segundo Semestre</b>\n<li>	Historia de la Educación.</li>\n<li>	Ámbito de la Gestión para el Cambio Educativo.</li>\n<li>	Legislación Educativa.</li>\n<li>	Taller de Gestión II.</li>\n<br>\n<br>\n<b>Tercer Semestre</b>\n<li>	Enfoques Pedagógicos Actuales.</li>\n<li>	Gestión y Agentes del Cambio Educativo.</li>\n<li>	Reformas Educativas.</li>\n<li>	Taller de Gestión III.</li>\n<br>\n<br>\n<b>Cuarto Semestre</b>\n<li>	La Educación en la Sociedad del Conocimiento y la Información.</li>\n<li>	Gestión y Procesos de Cambio Educativo.</li>\n<li>	Programas Educativos.</li>\n<li>	Taller de Gestión IV.</li>\n<br>\n<br>\n<b>REQUISITOS</b><br>\n<li>		Llenar solicitud de registro www.iapchiapasenlinea.mx/register</li>\n<br>\n<li>		Presentar un protocolo de investigación para la tesis de grado.</li>\n<br>\n<li>		Acudir a una entrevista con el comité de ingreso y selección.</li>\n<br>\n<li>	Original y dos copias de los siguientes documentos:</li>\n<br>\n<li>	Oficio de solicitud de ingreso y beca con el porcentaje autorizado para los servidores públicos, firmada por el titular de la Dependencia.</li>\n<br>\n<li>	Acta de nacimiento (actualizada)</li>\n<br>\n<li>	Carta de exposición de motivos.</li>\n<br>\n<li>	Carta de aceptación del 80% de asistencia como requisito para tener derecho a examen.</li>\n<br>\n<li>	Cédula de grado de Maestría.</li>\n<br>\n<li>	En caso de no tener su Cédula Profesional del grado de Maestría deberá presentar: Certificado, Acta de examen y Título de grado</li>\n<br>\n<li>	Si sus documentos son de otro estado o del extranjero deberá ser validado por la institución que lo emitió.</li>\n\n');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `moduleId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`moduleId`, `name`) VALUES
(1, 'Carreras'),
(3, 'Personal'),
(4, 'Alumnos'),
(5, 'Puestos'),
(8, 'Materias'),
(9, 'Roles'),
(37, 'Curriculas-Detalle'),
(11, 'Cursos'),
(13, 'Conf. Escuela'),
(36, 'videoconferencias'),
(35, 'Profesiones'),
(17, 'Salones'),
(34, 'Pagos'),
(38, 'Inf. Alumnos'),
(39, 'Grupos'),
(40, 'Solicitudes'),
(41, 'Inbox'),
(42, 'Inf. Docente'),
(43, 'Reportes');

-- --------------------------------------------------------

--
-- Table structure for table `municipio`
--

CREATE TABLE `municipio` (
  `municipioId` int(11) NOT NULL,
  `estadoId` int(11) NOT NULL COMMENT 'Relaci??on estados',
  `clave` varchar(3) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `sigla` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tabla de Municipios de la Republica Mexicana';

--
-- Dumping data for table `municipio`
--

INSERT INTO `municipio` (`municipioId`, `estadoId`, `clave`, `nombre`, `sigla`) VALUES
(1, 1, '001', 'Aguascalientes', ''),
(2, 1, '002', 'Asientos', ''),
(3, 1, '003', 'Calvillo', ''),
(4, 1, '004', 'Cos', ''),
(5, 1, '005', 'Jes', ''),
(6, 1, '006', 'Pabell', ''),
(7, 1, '007', 'Rinc', ''),
(8, 1, '008', 'San Jos', ''),
(9, 1, '009', 'Tepezal', ''),
(10, 1, '010', 'El Llano', ''),
(11, 1, '011', 'San Francisco de los Romo', ''),
(12, 2, '001', 'Ensenada', ''),
(13, 2, '002', 'Mexicali', ''),
(14, 2, '003', 'Tecate', ''),
(15, 2, '004', 'Tijuana', ''),
(16, 2, '005', 'Playas de Rosarito', ''),
(17, 3, '001', 'Comond', ''),
(18, 3, '002', 'Muleg', ''),
(19, 3, '003', 'La Paz', ''),
(20, 3, '008', 'Los Cabos', ''),
(21, 3, '009', 'Loreto', ''),
(22, 4, '001', 'Calkin', ''),
(23, 4, '002', 'Campeche', ''),
(24, 4, '003', 'Carmen', ''),
(25, 4, '004', 'Champot', ''),
(26, 4, '005', 'Hecelchak', ''),
(27, 4, '006', 'Hopelch', ''),
(28, 4, '007', 'Palizada', ''),
(29, 4, '008', 'Tenabo', ''),
(30, 4, '009', 'Esc', ''),
(31, 4, '010', 'Calakmul', ''),
(32, 4, '011', 'Candelaria', ''),
(33, 5, '001', 'Abasolo', ''),
(34, 5, '002', 'Acu', ''),
(35, 5, '003', 'Allende', ''),
(36, 5, '004', 'Arteaga', ''),
(37, 5, '005', 'Candela', ''),
(38, 5, '006', 'Casta', ''),
(39, 5, '007', 'Cuatro Ci', ''),
(40, 5, '008', 'Escobedo', ''),
(41, 5, '009', 'Francisco I. Madero', ''),
(42, 5, '010', 'Frontera', ''),
(43, 5, '011', 'General Cepeda', ''),
(44, 5, '012', 'Guerrero', ''),
(45, 5, '013', 'Hidalgo', ''),
(46, 5, '014', 'Jim', ''),
(47, 5, '015', 'Ju', ''),
(48, 5, '016', 'Lamadrid', ''),
(49, 5, '017', 'Matamoros', ''),
(50, 5, '018', 'Monclova', ''),
(51, 5, '019', 'Morelos', ''),
(52, 5, '020', 'M', ''),
(53, 5, '021', 'Nadadores', ''),
(54, 5, '022', 'Nava', ''),
(55, 5, '023', 'Ocampo', ''),
(56, 5, '024', 'Parras', ''),
(57, 5, '025', 'Piedras Negras', ''),
(58, 5, '026', 'Progreso', ''),
(59, 5, '027', 'Ramos Arizpe', ''),
(60, 5, '028', 'Sabinas', ''),
(61, 5, '029', 'Sacramento', ''),
(62, 5, '030', 'Saltillo', ''),
(63, 5, '031', 'San Buenaventura', ''),
(64, 5, '032', 'San Juan de Sabinas', ''),
(65, 5, '033', 'San Pedro', ''),
(66, 5, '034', 'Sierra Mojada', ''),
(67, 5, '035', 'Torre', ''),
(68, 5, '036', 'Viesca', ''),
(69, 5, '037', 'Villa Uni', ''),
(70, 5, '038', 'Zaragoza', ''),
(71, 6, '001', 'Armer', ''),
(72, 6, '002', 'Colima', ''),
(73, 6, '003', 'Comala', ''),
(74, 6, '004', 'Coquimatl', ''),
(75, 6, '005', 'Cuauht', ''),
(76, 6, '006', 'Ixtlahuac', ''),
(77, 6, '007', 'Manzanillo', ''),
(78, 6, '008', 'Minatitl', ''),
(79, 6, '009', 'Tecom', ''),
(80, 6, '010', 'Villa de ', ''),
(81, 7, '001', 'Acacoyagua', ''),
(82, 7, '002', 'Acala', ''),
(83, 7, '003', 'Acapetahua', ''),
(84, 7, '004', 'Altamirano', ''),
(85, 7, '005', 'Amatan', ''),
(86, 7, '006', 'Amatenango de la Frontera', ''),
(87, 7, '007', 'Amatenango del Valle', ''),
(88, 7, '008', 'Angel Albino Corzo', ''),
(89, 7, '009', 'Arriaga', ''),
(90, 7, '010', 'Bejucal de Ocampo', ''),
(91, 7, '011', 'Bella Vista', ''),
(92, 7, '012', 'Berriozabal', ''),
(93, 7, '013', 'Bochil', ''),
(94, 7, '014', 'El Bosque', ''),
(95, 7, '015', 'Cacahoatan', ''),
(96, 7, '016', 'Catazaja', ''),
(97, 7, '017', 'Cintalapa', ''),
(98, 7, '018', 'Coapilla', ''),
(99, 7, '019', 'Comitan de Dominguez', ''),
(100, 7, '020', 'La Concordia', ''),
(101, 7, '021', 'Copainala', ''),
(102, 7, '022', 'Chalchihuitan', ''),
(103, 7, '023', 'Chamula', ''),
(104, 7, '024', 'Chanal', ''),
(105, 7, '025', 'Chapultenango', ''),
(106, 7, '026', 'Chenalhó', ''),
(107, 7, '027', 'Chiapa de Corzo', ''),
(108, 7, '028', 'Chiapilla', ''),
(109, 7, '029', 'Chicoasén', ''),
(110, 7, '030', 'Chicomuselo', ''),
(111, 7, '031', 'Chilón', ''),
(112, 7, '032', 'Escuintla', ''),
(113, 7, '033', 'Francisco León', ''),
(114, 7, '034', 'Frontera Comalapa', ''),
(115, 7, '035', 'Frontera Hidalgo', ''),
(116, 7, '036', 'La Grandeza', ''),
(117, 7, '037', 'Huehuetán', ''),
(118, 7, '038', 'Huixtán', ''),
(119, 7, '039', 'Huitiupán', ''),
(120, 7, '040', 'Huixtla', ''),
(121, 7, '041', 'La Independencia', ''),
(122, 7, '042', 'Ixhuatán', ''),
(123, 7, '043', 'Ixtacomitán', ''),
(124, 7, '044', 'Ixtapa', ''),
(125, 7, '045', 'Ixtapangajoya', ''),
(126, 7, '046', 'Jiquipilas', ''),
(127, 7, '047', 'Jitotol', ''),
(128, 7, '048', 'Juárez', ''),
(129, 7, '049', 'Larrainzar', ''),
(130, 7, '050', 'La Libertad', ''),
(131, 7, '051', 'Mapastepec', ''),
(132, 7, '052', 'Las Margaritas', ''),
(133, 7, '053', 'Mazapa de Madero', ''),
(134, 7, '054', 'Mazatán', ''),
(135, 7, '055', 'Metapa', ''),
(136, 7, '056', 'Mitontic', ''),
(137, 7, '057', 'Motozintla', ''),
(138, 7, '058', 'Nicolás Ruiz', ''),
(139, 7, '059', 'Ocosingo', ''),
(140, 7, '060', 'Ocotepec', ''),
(141, 7, '061', 'Ocozocoautla de Espinosa', ''),
(142, 7, '062', 'Ostuacán', ''),
(143, 7, '063', 'Osumacinta', ''),
(144, 7, '064', 'Oxchuc', ''),
(145, 7, '065', 'Palenque', ''),
(146, 7, '066', 'Pantelhó', ''),
(147, 7, '067', 'Pantepec', ''),
(148, 7, '068', 'Pichucalco', ''),
(149, 7, '069', 'Pijijiapan', ''),
(150, 7, '070', 'El Porvenir', ''),
(151, 7, '071', 'Villa Comaltitlán', ''),
(152, 7, '072', 'Pueblo Nuevo Solistahuacán', ''),
(153, 7, '073', 'Rayón', ''),
(154, 7, '074', 'Reforma', ''),
(155, 7, '075', 'Las Rosas', ''),
(156, 7, '076', 'Sabanilla', ''),
(157, 7, '077', 'Salto de Agua', ''),
(158, 7, '078', 'San Cristóbal de las Casas', ''),
(159, 7, '079', 'San Fernando', ''),
(160, 7, '080', 'Siltepec', ''),
(161, 7, '081', 'Simojovel', ''),
(162, 7, '082', 'Sitalá', ''),
(163, 7, '083', 'Socoltenango', ''),
(164, 7, '084', 'Solosuchiapa', ''),
(165, 7, '085', 'Soyaló', ''),
(166, 7, '086', 'Suchiapa', ''),
(167, 7, '087', 'Suchiate', ''),
(168, 7, '088', 'Sunuapa', ''),
(169, 7, '089', 'Tapachula', ''),
(170, 7, '090', 'Tapalapa', ''),
(171, 7, '091', 'Tapilula', ''),
(172, 7, '092', 'Tecpatán', ''),
(173, 7, '093', 'Tenejapa', ''),
(174, 7, '094', 'Teopisca', ''),
(175, 7, '096', 'Tila', ''),
(176, 7, '097', 'Tonalá', ''),
(177, 7, '098', 'Totolapa', ''),
(178, 7, '099', 'La Trinitaria', ''),
(179, 7, '100', 'Tumbalá', ''),
(180, 7, '101', 'Tuxtla Gutiérrez', ''),
(181, 7, '102', 'Tuxtla Chico', ''),
(182, 7, '103', 'Tuzantán', ''),
(183, 7, '104', 'Tzimol', ''),
(184, 7, '105', 'Unión juarez', ''),
(185, 7, '106', 'Venustiano Carranza', ''),
(186, 7, '107', 'Villa Corzo', ''),
(187, 7, '108', 'Villaflores', ''),
(188, 7, '109', 'Yajalón', ''),
(189, 7, '110', 'San Lucas', ''),
(190, 7, '111', 'Zinacantán', ''),
(191, 7, '112', 'San Juan Cancuc', ''),
(192, 7, '113', 'Aldama', ''),
(193, 7, '114', 'Benemérito de las Américas', ''),
(194, 7, '115', 'Maravilla Tenejapa', ''),
(195, 7, '116', 'Marqués de Comillas', ''),
(196, 7, '117', 'Montecristo de Guerrero', ''),
(197, 7, '118', 'San Andres Duraznal', ''),
(198, 7, '119', 'Santiago el Pinar', ''),
(199, 8, '001', 'Ahumada', ''),
(200, 8, '002', 'Aldama', ''),
(201, 8, '003', 'Allende', ''),
(202, 8, '004', 'Aquiles Serd', ''),
(203, 8, '005', 'Ascensi', ''),
(204, 8, '006', 'Bach', ''),
(205, 8, '007', 'Balleza', ''),
(206, 8, '008', 'Batopilas', ''),
(207, 8, '009', 'Bocoyna', ''),
(208, 8, '010', 'Buenaventura', ''),
(209, 8, '011', 'Camargo', ''),
(210, 8, '012', 'Carich', ''),
(211, 8, '013', 'Casas Grandes', ''),
(212, 8, '014', 'Coronado', ''),
(213, 8, '015', 'Coyame del Sotol', ''),
(214, 8, '016', 'La Cruz', ''),
(215, 8, '017', 'Cuauht', ''),
(216, 8, '018', 'Cusihuiriachi', ''),
(217, 8, '019', 'Chihuahua', ''),
(218, 8, '020', 'Ch', ''),
(219, 8, '021', 'Delicias', ''),
(220, 8, '022', 'Dr. Belisario Dom', ''),
(221, 8, '023', 'Galeana', ''),
(222, 8, '024', 'Santa Isabel', ''),
(223, 8, '025', 'G', ''),
(224, 8, '026', 'Gran Morelos', ''),
(225, 8, '027', 'Guachochi', ''),
(226, 8, '028', 'Guadalupe', ''),
(227, 8, '029', 'Guadalupe y Calvo', ''),
(228, 8, '030', 'Guazapares', ''),
(229, 8, '031', 'Guerrero', ''),
(230, 8, '032', 'Hidalgo del Parral', ''),
(231, 8, '033', 'Huejotit', ''),
(232, 8, '034', 'Ignacio Zaragoza', ''),
(233, 8, '035', 'Janos', ''),
(234, 8, '036', 'Jim', ''),
(235, 8, '037', 'Ju', ''),
(236, 8, '038', 'Julimes', ''),
(237, 8, '039', 'L', ''),
(238, 8, '040', 'Madera', ''),
(239, 8, '041', 'Maguarichi', ''),
(240, 8, '042', 'Manuel Benavides', ''),
(241, 8, '043', 'Matach', ''),
(242, 8, '044', 'Matamoros', ''),
(243, 8, '045', 'Meoqui', ''),
(244, 8, '046', 'Morelos', ''),
(245, 8, '047', 'Moris', ''),
(246, 8, '048', 'Namiquipa', ''),
(247, 8, '049', 'Nonoava', ''),
(248, 8, '050', 'Nuevo Casas Grandes', ''),
(249, 8, '051', 'Ocampo', ''),
(250, 8, '052', 'Ojinaga', ''),
(251, 8, '053', 'Praxedis G. Guerrero', ''),
(252, 8, '054', 'Riva Palacio', ''),
(253, 8, '055', 'Rosales', ''),
(254, 8, '056', 'Rosario', ''),
(255, 8, '057', 'San Francisco de Borja', ''),
(256, 8, '058', 'San Francisco de Conchos', ''),
(257, 8, '059', 'San Francisco del Oro', ''),
(258, 8, '060', 'Santa B', ''),
(259, 8, '061', 'Satev', ''),
(260, 8, '062', 'Saucillo', ''),
(261, 8, '063', 'Tem', ''),
(262, 8, '064', 'El Tule', ''),
(263, 8, '065', 'Urique', ''),
(264, 8, '066', 'Uruachi', ''),
(265, 8, '067', 'Valle de Zaragoza', ''),
(266, 9, '002', 'Azcapotzalco', ''),
(267, 9, '003', 'Coyoac', ''),
(268, 9, '004', 'Cuajimalpa de Morelos', ''),
(269, 9, '005', 'Gustavo A. Madero', ''),
(270, 9, '006', 'Iztacalco', ''),
(271, 9, '007', 'Iztapalapa', ''),
(272, 9, '008', 'La Magdalena Contreras', ''),
(273, 9, '009', 'Milpa Alta', ''),
(274, 9, '010', '', ''),
(275, 9, '011', 'Tl', ''),
(276, 9, '012', 'Tlalpan', ''),
(277, 9, '013', 'Xochimilco', ''),
(278, 9, '014', 'Benito Ju', ''),
(279, 9, '015', 'Cuauht', ''),
(280, 9, '016', 'Miguel Hidalgo', ''),
(281, 9, '017', 'Venustiano Carranza', ''),
(282, 10, '001', 'Canatl', ''),
(283, 10, '002', 'Canelas', ''),
(284, 10, '003', 'Coneto de Comonfort', ''),
(285, 10, '004', 'Cuencam', ''),
(286, 10, '005', 'Durango', ''),
(287, 10, '006', 'General Sim', ''),
(288, 10, '007', 'G', ''),
(289, 10, '008', 'Guadalupe Victoria', ''),
(290, 10, '009', 'Guanacev', ''),
(291, 10, '010', 'Hidalgo', ''),
(292, 10, '011', 'Ind', ''),
(293, 10, '012', 'Lerdo', ''),
(294, 10, '013', 'Mapim', ''),
(295, 10, '014', 'Mezquital', ''),
(296, 10, '015', 'Nazas', ''),
(297, 10, '016', 'Nombre de Dios', ''),
(298, 10, '017', 'Ocampo', ''),
(299, 10, '018', 'El Oro', ''),
(300, 10, '019', 'Ot', ''),
(301, 10, '020', 'P', ''),
(302, 10, '021', 'Pe', ''),
(303, 10, '022', 'Poanas', ''),
(304, 10, '023', 'Pueblo Nuevo', ''),
(305, 10, '024', 'Rodeo', ''),
(306, 10, '025', 'San Bernardo', ''),
(307, 10, '026', 'San Dimas', ''),
(308, 10, '027', 'San Juan de Guadalupe', ''),
(309, 10, '028', 'San Juan del R', ''),
(310, 10, '029', 'San Luis del Cordero', ''),
(311, 10, '030', 'San Pedro del Gallo', ''),
(312, 10, '031', 'Santa Clara', ''),
(313, 10, '032', 'Santiago Papasquiaro', ''),
(314, 10, '033', 'S', ''),
(315, 10, '034', 'Tamazula', ''),
(316, 10, '035', 'Tepehuanes', ''),
(317, 10, '036', 'Tlahualilo', ''),
(318, 10, '037', 'Topia', ''),
(319, 10, '038', 'Vicente Guerrero', ''),
(320, 10, '039', 'Nuevo Ideal', ''),
(321, 11, '001', 'Abasolo', ''),
(322, 11, '002', 'Ac', ''),
(323, 11, '003', 'San Miguel de Allende', ''),
(324, 11, '004', 'Apaseo el Alto', ''),
(325, 11, '005', 'Apaseo el Grande', ''),
(326, 11, '006', 'Atarjea', ''),
(327, 11, '007', 'Celaya', ''),
(328, 11, '008', 'Manuel Doblado', ''),
(329, 11, '009', 'Comonfort', ''),
(330, 11, '010', 'Coroneo', ''),
(331, 11, '011', 'Cortazar', ''),
(332, 11, '012', 'Cuer', ''),
(333, 11, '013', 'Doctor Mora', ''),
(334, 11, '014', 'Dolores Hidalgo Cuna de la Independencia Nacional', ''),
(335, 11, '015', 'Guanajuato', ''),
(336, 11, '016', 'Huan', ''),
(337, 11, '017', 'Irapuato', ''),
(338, 11, '018', 'Jaral del Progreso', ''),
(339, 11, '019', 'Jer', ''),
(340, 11, '020', 'Le', ''),
(341, 11, '021', 'Morole', ''),
(342, 11, '022', 'Ocampo', ''),
(343, 11, '023', 'P', ''),
(344, 11, '024', 'Pueblo Nuevo', ''),
(345, 11, '025', 'Pur', ''),
(346, 11, '026', 'Romita', ''),
(347, 11, '027', 'Salamanca', ''),
(348, 11, '028', 'Salvatierra', ''),
(349, 11, '029', 'San Diego de la Uni', ''),
(350, 11, '030', 'San Felipe', ''),
(351, 11, '031', 'San Francisco del Rinc', ''),
(352, 11, '032', 'San Jos', ''),
(353, 11, '033', 'San Luis de la Paz', ''),
(354, 11, '034', 'Santa Catarina', ''),
(355, 11, '035', 'Santa Cruz de Juventino Rosas', ''),
(356, 11, '036', 'Santiago Maravat', ''),
(357, 11, '037', 'Silao', ''),
(358, 11, '038', 'Tarandacuao', ''),
(359, 11, '039', 'Tarimoro', ''),
(360, 11, '040', 'Tierra Blanca', ''),
(361, 11, '041', 'Uriangato', ''),
(362, 11, '042', 'Valle de Santiago', ''),
(363, 11, '043', 'Victoria', ''),
(364, 11, '044', 'Villagr', ''),
(365, 11, '045', 'Xich', ''),
(366, 11, '046', 'Yuriria', ''),
(367, 12, '001', 'Acapulco de Ju', ''),
(368, 12, '002', 'Ahuacuotzingo', ''),
(369, 12, '003', 'Ajuchitl', ''),
(370, 12, '004', 'Alcozauca de Guerrero', ''),
(371, 12, '005', 'Alpoyeca', ''),
(372, 12, '006', 'Apaxtla', ''),
(373, 12, '007', 'Arcelia', ''),
(374, 12, '008', 'Atenango del R', ''),
(375, 12, '009', 'Atlamajalcingo del Monte', ''),
(376, 12, '010', 'Atlixtac', ''),
(377, 12, '011', 'Atoyac de ', ''),
(378, 12, '012', 'Ayutla de los Libres', ''),
(379, 12, '013', 'Azoy', ''),
(380, 12, '014', 'Benito Ju', ''),
(381, 12, '015', 'Buenavista de Cu', ''),
(382, 12, '016', 'Coahuayutla de Jos', ''),
(383, 12, '017', 'Cocula', ''),
(384, 12, '018', 'Copala', ''),
(385, 12, '019', 'Copalillo', ''),
(386, 12, '020', 'Copanatoyac', ''),
(387, 12, '021', 'Coyuca de Ben', ''),
(388, 12, '022', 'Coyuca de Catal', ''),
(389, 12, '023', 'Cuajinicuilapa', ''),
(390, 12, '024', 'Cual', ''),
(391, 12, '025', 'Cuautepec', ''),
(392, 12, '026', 'Cuetzala del Progreso', ''),
(393, 12, '027', 'Cutzamala de Pinz', ''),
(394, 12, '028', 'Chilapa de ', ''),
(395, 12, '029', 'Chilpancingo de los Bravo', ''),
(396, 12, '030', 'Florencio Villarreal', ''),
(397, 12, '031', 'General Canuto A. Neri', ''),
(398, 12, '032', 'General Heliodoro Castillo', ''),
(399, 12, '033', 'Huamuxtitl', ''),
(400, 12, '034', 'Huitzuco de los Figueroa', ''),
(401, 12, '035', 'Iguala de la Independencia', ''),
(402, 12, '036', 'Igualapa', ''),
(403, 12, '037', 'Ixcateopan de Cuauht', ''),
(404, 12, '038', 'Zihuatanejo de Azueta', ''),
(405, 12, '039', 'Juan R. Escudero', ''),
(406, 12, '040', 'Leonardo Bravo', ''),
(407, 12, '041', 'Malinaltepec', ''),
(408, 12, '042', 'M', ''),
(409, 12, '043', 'Metlat', ''),
(410, 12, '044', 'Mochitl', ''),
(411, 12, '045', 'Olinal', ''),
(412, 12, '046', 'Ometepec', ''),
(413, 12, '047', 'Pedro Ascencio Alquisiras', ''),
(414, 12, '048', 'Petatl', ''),
(415, 12, '049', 'Pilcaya', ''),
(416, 12, '050', 'Pungarabato', ''),
(417, 12, '051', 'Quechultenango', ''),
(418, 12, '052', 'San Luis Acatl', ''),
(419, 12, '053', 'San Marcos', ''),
(420, 12, '054', 'San Miguel Totolapan', ''),
(421, 12, '055', 'Taxco de Alarc', ''),
(422, 12, '056', 'Tecoanapa', ''),
(423, 12, '057', 'T', ''),
(424, 12, '058', 'Teloloapan', ''),
(425, 12, '059', 'Tepecoacuilco de Trujano', ''),
(426, 12, '060', 'Tetipac', ''),
(427, 12, '061', 'Tixtla de Guerrero', ''),
(428, 12, '062', 'Tlacoachistlahuaca', ''),
(429, 12, '063', 'Tlacoapa', ''),
(430, 12, '064', 'Tlalchapa', ''),
(431, 12, '065', 'Tlalixtaquilla de Maldonado', ''),
(432, 12, '066', 'Tlapa de Comonfort', ''),
(433, 12, '067', 'Tlapehuala', ''),
(434, 12, '068', 'La Uni', ''),
(435, 12, '069', 'Xalpatl', ''),
(436, 12, '070', 'Xochihuehuetl', ''),
(437, 12, '071', 'Xochistlahuaca', ''),
(438, 12, '072', 'Zapotitl', ''),
(439, 12, '073', 'Zir', ''),
(440, 12, '074', 'Zitlala', ''),
(441, 12, '075', 'Eduardo Neri', ''),
(442, 12, '076', 'Acatepec', ''),
(443, 12, '077', 'Marquelia', ''),
(444, 12, '078', 'Cochoapa el Grande', ''),
(445, 12, '079', 'Jos', ''),
(446, 12, '080', 'Juchit', ''),
(447, 12, '081', 'Iliatenco', ''),
(448, 13, '001', 'Acatl', ''),
(449, 13, '002', 'Acaxochitl', ''),
(450, 13, '003', 'Actopan', ''),
(451, 13, '004', 'Agua Blanca de Iturbide', ''),
(452, 13, '005', 'Ajacuba', ''),
(453, 13, '006', 'Alfajayucan', ''),
(454, 13, '007', 'Almoloya', ''),
(455, 13, '008', 'Apan', ''),
(456, 13, '009', 'El Arenal', ''),
(457, 13, '010', 'Atitalaquia', ''),
(458, 13, '011', 'Atlapexco', ''),
(459, 13, '012', 'Atotonilco el Grande', ''),
(460, 13, '013', 'Atotonilco de Tula', ''),
(461, 13, '014', 'Calnali', ''),
(462, 13, '015', 'Cardonal', ''),
(463, 13, '016', 'Cuautepec de Hinojosa', ''),
(464, 13, '017', 'Chapantongo', ''),
(465, 13, '018', 'Chapulhuac', ''),
(466, 13, '019', 'Chilcuautla', ''),
(467, 13, '020', 'Eloxochitl', ''),
(468, 13, '021', 'Emiliano Zapata', ''),
(469, 13, '022', 'Epazoyucan', ''),
(470, 13, '023', 'Francisco I. Madero', ''),
(471, 13, '024', 'Huasca de Ocampo', ''),
(472, 13, '025', 'Huautla', ''),
(473, 13, '026', 'Huazalingo', ''),
(474, 13, '027', 'Huehuetla', ''),
(475, 13, '028', 'Huejutla de Reyes', ''),
(476, 13, '029', 'Huichapan', ''),
(477, 13, '030', 'Ixmiquilpan', ''),
(478, 13, '031', 'Jacala de Ledezma', ''),
(479, 13, '032', 'Jaltoc', ''),
(480, 13, '033', 'Ju', ''),
(481, 13, '034', 'Lolotla', ''),
(482, 13, '035', 'Metepec', ''),
(483, 13, '036', 'San Agust', ''),
(484, 13, '037', 'Metztitl', ''),
(485, 13, '038', 'Mineral del Chico', ''),
(486, 13, '039', 'Mineral del Monte', ''),
(487, 13, '040', 'La Misi', ''),
(488, 13, '041', 'Mixquiahuala de Ju', ''),
(489, 13, '042', 'Molango de Escamilla', ''),
(490, 13, '043', 'Nicol', ''),
(491, 13, '044', 'Nopala de Villagr', ''),
(492, 13, '045', 'Omitl', ''),
(493, 13, '046', 'San Felipe Orizatl', ''),
(494, 13, '047', 'Pacula', ''),
(495, 13, '048', 'Pachuca de Soto', ''),
(496, 13, '049', 'Pisaflores', ''),
(497, 13, '050', 'Progreso de Obreg', ''),
(498, 13, '051', 'Mineral de la Reforma', ''),
(499, 13, '052', 'San Agust', ''),
(500, 13, '053', 'San Bartolo Tutotepec', ''),
(501, 13, '054', 'San Salvador', ''),
(502, 13, '055', 'Santiago de Anaya', ''),
(503, 13, '056', 'Santiago Tulantepec de Lugo Guerrero', ''),
(504, 13, '057', 'Singuilucan', ''),
(505, 13, '058', 'Tasquillo', ''),
(506, 13, '059', 'Tecozautla', ''),
(507, 13, '060', 'Tenango de Doria', ''),
(508, 13, '061', 'Tepeapulco', ''),
(509, 13, '062', 'Tepehuac', ''),
(510, 13, '063', 'Tepeji del R', ''),
(511, 13, '064', 'Tepetitl', ''),
(512, 13, '065', 'Tetepango', ''),
(513, 13, '066', 'Villa de Tezontepec', ''),
(514, 13, '067', 'Tezontepec de Aldama', ''),
(515, 13, '068', 'Tianguistengo', ''),
(516, 13, '069', 'Tizayuca', ''),
(517, 13, '070', 'Tlahuelilpan', ''),
(518, 13, '071', 'Tlahuiltepa', ''),
(519, 13, '072', 'Tlanalapa', ''),
(520, 13, '073', 'Tlanchinol', ''),
(521, 13, '074', 'Tlaxcoapan', ''),
(522, 13, '075', 'Tolcayuca', ''),
(523, 13, '076', 'Tula de Allende', ''),
(524, 13, '077', 'Tulancingo de Bravo', ''),
(525, 13, '078', 'Xochiatipan', ''),
(526, 13, '079', 'Xochicoatl', ''),
(527, 13, '080', 'Yahualica', ''),
(528, 13, '081', 'Zacualtip', ''),
(529, 13, '082', 'Zapotl', ''),
(530, 13, '083', 'Zempoala', ''),
(531, 13, '084', 'Zimap', ''),
(532, 14, '001', 'Acatic', ''),
(533, 14, '002', 'Acatl', ''),
(534, 14, '003', 'Ahualulco de Mercado', ''),
(535, 14, '004', 'Amacueca', ''),
(536, 14, '005', 'Amatit', ''),
(537, 14, '006', 'Ameca', ''),
(538, 14, '007', 'San Juanito de Escobedo', ''),
(539, 14, '008', 'Arandas', ''),
(540, 14, '009', 'El Arenal', ''),
(541, 14, '010', 'Atemajac de Brizuela', ''),
(542, 14, '011', 'Atengo', ''),
(543, 14, '012', 'Atenguillo', ''),
(544, 14, '013', 'Atotonilco el Alto', ''),
(545, 14, '014', 'Atoyac', ''),
(546, 14, '015', 'Autl', ''),
(547, 14, '016', 'Ayotl', ''),
(548, 14, '017', 'Ayutla', ''),
(549, 14, '018', 'La Barca', ''),
(550, 14, '019', 'Bola', ''),
(551, 14, '020', 'Cabo Corrientes', ''),
(552, 14, '021', 'Casimiro Castillo', ''),
(553, 14, '022', 'Cihuatl', ''),
(554, 14, '023', 'Zapotl', ''),
(555, 14, '024', 'Cocula', ''),
(556, 14, '025', 'Colotl', ''),
(557, 14, '026', 'Concepci', ''),
(558, 14, '027', 'Cuautitl', ''),
(559, 14, '028', 'Cuautla', ''),
(560, 14, '029', 'Cuqu', ''),
(561, 14, '030', 'Chapala', ''),
(562, 14, '031', 'Chimaltit', ''),
(563, 14, '032', 'Chiquilistl', ''),
(564, 14, '033', 'Degollado', ''),
(565, 14, '034', 'Ejutla', ''),
(566, 14, '035', 'Encarnaci', ''),
(567, 14, '036', 'Etzatl', ''),
(568, 14, '037', 'El Grullo', ''),
(569, 14, '038', 'Guachinango', ''),
(570, 14, '039', 'Guadalajara', ''),
(571, 14, '040', 'Hostotipaquillo', ''),
(572, 14, '041', 'Huej', ''),
(573, 14, '042', 'Huejuquilla el Alto', ''),
(574, 14, '043', 'La Huerta', ''),
(575, 14, '044', 'Ixtlahuac', ''),
(576, 14, '045', 'Ixtlahuac', ''),
(577, 14, '046', 'Jalostotitl', ''),
(578, 14, '047', 'Jamay', ''),
(579, 14, '048', 'Jes', ''),
(580, 14, '049', 'Jilotl', ''),
(581, 14, '050', 'Jocotepec', ''),
(582, 14, '051', 'Juanacatl', ''),
(583, 14, '052', 'Juchitl', ''),
(584, 14, '053', 'Lagos de Moreno', ''),
(585, 14, '054', 'El Lim', ''),
(586, 14, '055', 'Magdalena', ''),
(587, 14, '056', 'Santa Mar', ''),
(588, 14, '057', 'La Manzanilla de la Paz', ''),
(589, 14, '058', 'Mascota', ''),
(590, 14, '059', 'Mazamitla', ''),
(591, 14, '060', 'Mexticac', ''),
(592, 14, '061', 'Mezquitic', ''),
(593, 14, '062', 'Mixtl', ''),
(594, 14, '063', 'Ocotl', ''),
(595, 14, '064', 'Ojuelos de Jalisco', ''),
(596, 14, '065', 'Pihuamo', ''),
(597, 14, '066', 'Poncitl', ''),
(598, 14, '067', 'Puerto Vallarta', ''),
(599, 14, '068', 'Villa Purificaci', ''),
(600, 14, '069', 'Quitupan', ''),
(601, 14, '070', 'El Salto', ''),
(602, 14, '071', 'San Crist', ''),
(603, 14, '072', 'San Diego de Alejandr', ''),
(604, 14, '073', 'San Juan de los Lagos', ''),
(605, 14, '074', 'San Juli', ''),
(606, 14, '075', 'San Marcos', ''),
(607, 14, '076', 'San Mart', ''),
(608, 14, '077', 'San Mart', ''),
(609, 14, '078', 'San Miguel el Alto', ''),
(610, 14, '079', 'G', ''),
(611, 14, '080', 'San Sebasti', ''),
(612, 14, '081', 'Santa Mar', ''),
(613, 14, '082', 'Sayula', ''),
(614, 14, '083', 'Tala', ''),
(615, 14, '084', 'Talpa de Allende', ''),
(616, 14, '085', 'Tamazula de Gordiano', ''),
(617, 14, '086', 'Tapalpa', ''),
(618, 14, '087', 'Tecalitl', ''),
(619, 14, '088', 'Tecolotl', ''),
(620, 14, '089', 'Techaluta de Montenegro', ''),
(621, 14, '090', 'Tenamaxtl', ''),
(622, 14, '091', 'Teocaltiche', ''),
(623, 14, '092', 'Teocuitatl', ''),
(624, 14, '093', 'Tepatitl', ''),
(625, 14, '094', 'Tequila', ''),
(626, 14, '095', 'Teuchitl', ''),
(627, 14, '096', 'Tizap', ''),
(628, 14, '097', 'Tlajomulco de Z', ''),
(629, 14, '098', 'San Pedro Tlaquepaque', ''),
(630, 14, '099', 'Tolim', ''),
(631, 14, '100', 'Tomatl', ''),
(632, 14, '101', 'Tonal', ''),
(633, 14, '102', 'Tonaya', ''),
(634, 14, '103', 'Tonila', ''),
(635, 14, '104', 'Totatiche', ''),
(636, 14, '105', 'Tototl', ''),
(637, 14, '106', 'Tuxcacuesco', ''),
(638, 14, '107', 'Tuxcueca', ''),
(639, 14, '108', 'Tuxpan', ''),
(640, 14, '109', 'Uni', ''),
(641, 14, '110', 'Uni', ''),
(642, 14, '111', 'Valle de Guadalupe', ''),
(643, 14, '112', 'Valle de Ju', ''),
(644, 14, '113', 'San Gabriel', ''),
(645, 14, '114', 'Villa Corona', ''),
(646, 14, '115', 'Villa Guerrero', ''),
(647, 14, '116', 'Villa Hidalgo', ''),
(648, 14, '117', 'Ca', ''),
(649, 14, '118', 'Yahualica de Gonz', ''),
(650, 14, '119', 'Zacoalco de Torres', ''),
(651, 14, '120', 'Zapopan', ''),
(652, 14, '121', 'Zapotiltic', ''),
(653, 14, '122', 'Zapotitl', ''),
(654, 14, '123', 'Zapotl', ''),
(655, 14, '124', 'Zapotlanejo', ''),
(656, 14, '125', 'San Ignacio Cerro Gordo', ''),
(657, 15, '001', 'Acambay', ''),
(658, 15, '002', 'Acolman', ''),
(659, 15, '003', 'Aculco', ''),
(660, 15, '004', 'Almoloya de Alquisiras', ''),
(661, 15, '005', 'Almoloya de Ju', ''),
(662, 15, '006', 'Almoloya del R', ''),
(663, 15, '007', 'Amanalco', ''),
(664, 15, '008', 'Amatepec', ''),
(665, 15, '009', 'Amecameca', ''),
(666, 15, '010', 'Apaxco', ''),
(667, 15, '011', 'Atenco', ''),
(668, 15, '012', 'Atizap', ''),
(669, 15, '013', 'Atizap', ''),
(670, 15, '014', 'Atlacomulco', ''),
(671, 15, '015', 'Atlautla', ''),
(672, 15, '016', 'Axapusco', ''),
(673, 15, '017', 'Ayapango', ''),
(674, 15, '018', 'Calimaya', ''),
(675, 15, '019', 'Capulhuac', ''),
(676, 15, '020', 'Coacalco de Berrioz', ''),
(677, 15, '021', 'Coatepec Harinas', ''),
(678, 15, '022', 'Cocotitl', ''),
(679, 15, '023', 'Coyotepec', ''),
(680, 15, '024', 'Cuautitl', ''),
(681, 15, '025', 'Chalco', ''),
(682, 15, '026', 'Chapa de Mota', ''),
(683, 15, '027', 'Chapultepec', ''),
(684, 15, '028', 'Chiautla', ''),
(685, 15, '029', 'Chicoloapan', ''),
(686, 15, '030', 'Chiconcuac', ''),
(687, 15, '031', 'Chimalhuac', ''),
(688, 15, '032', 'Donato Guerra', ''),
(689, 15, '033', 'Ecatepec de Morelos', ''),
(690, 15, '034', 'Ecatzingo', ''),
(691, 15, '035', 'Huehuetoca', ''),
(692, 15, '036', 'Hueypoxtla', ''),
(693, 15, '037', 'Huixquilucan', ''),
(694, 15, '038', 'Isidro Fabela', ''),
(695, 15, '039', 'Ixtapaluca', ''),
(696, 15, '040', 'Ixtapan de la Sal', ''),
(697, 15, '041', 'Ixtapan del Oro', ''),
(698, 15, '042', 'Ixtlahuaca', ''),
(699, 15, '043', 'Xalatlaco', ''),
(700, 15, '044', 'Jaltenco', ''),
(701, 15, '045', 'Jilotepec', ''),
(702, 15, '046', 'Jilotzingo', ''),
(703, 15, '047', 'Jiquipilco', ''),
(704, 15, '048', 'Jocotitl', ''),
(705, 15, '049', 'Joquicingo', ''),
(706, 15, '050', 'Juchitepec', ''),
(707, 15, '051', 'Lerma', ''),
(708, 15, '052', 'Malinalco', ''),
(709, 15, '053', 'Melchor Ocampo', ''),
(710, 15, '054', 'Metepec', ''),
(711, 15, '055', 'Mexicaltzingo', ''),
(712, 15, '056', 'Morelos', ''),
(713, 15, '057', 'Naucalpan de Ju', ''),
(714, 15, '058', 'Nezahualc', ''),
(715, 15, '059', 'Nextlalpan', ''),
(716, 15, '060', 'Nicol', ''),
(717, 15, '061', 'Nopaltepec', ''),
(718, 15, '062', 'Ocoyoacac', ''),
(719, 15, '063', 'Ocuilan', ''),
(720, 15, '064', 'El Oro', ''),
(721, 15, '065', 'Otumba', ''),
(722, 15, '066', 'Otzoloapan', ''),
(723, 15, '067', 'Otzolotepec', ''),
(724, 15, '068', 'Ozumba', ''),
(725, 15, '069', 'Papalotla', ''),
(726, 15, '070', 'La Paz', ''),
(727, 15, '071', 'Polotitl', ''),
(728, 15, '072', 'Ray', ''),
(729, 15, '073', 'San Antonio la Isla', ''),
(730, 15, '074', 'San Felipe del Progreso', ''),
(731, 15, '075', 'San Mart', ''),
(732, 15, '076', 'San Mateo Atenco', ''),
(733, 15, '077', 'San Sim', ''),
(734, 15, '078', 'Santo Tom', ''),
(735, 15, '079', 'Soyaniquilpan de Ju', ''),
(736, 15, '080', 'Sultepec', ''),
(737, 15, '081', 'Tec', ''),
(738, 15, '082', 'Tejupilco', ''),
(739, 15, '083', 'Temamatla', ''),
(740, 15, '084', 'Temascalapa', ''),
(741, 15, '085', 'Temascalcingo', ''),
(742, 15, '086', 'Temascaltepec', ''),
(743, 15, '087', 'Temoaya', ''),
(744, 15, '088', 'Tenancingo', ''),
(745, 15, '089', 'Tenango del Aire', ''),
(746, 15, '090', 'Tenango del Valle', ''),
(747, 15, '091', 'Teoloyucan', ''),
(748, 15, '092', 'Teotihuac', ''),
(749, 15, '093', 'Tepetlaoxtoc', ''),
(750, 15, '094', 'Tepetlixpa', ''),
(751, 15, '095', 'Tepotzotl', ''),
(752, 15, '096', 'Tequixquiac', ''),
(753, 15, '097', 'Texcaltitl', ''),
(754, 15, '098', 'Texcalyacac', ''),
(755, 15, '099', 'Texcoco', ''),
(756, 15, '100', 'Tezoyuca', ''),
(757, 15, '101', 'Tianguistenco', ''),
(758, 15, '102', 'Timilpan', ''),
(759, 15, '103', 'Tlalmanalco', ''),
(760, 15, '104', 'Tlalnepantla de Baz', ''),
(761, 15, '105', 'Tlatlaya', ''),
(762, 15, '106', 'Toluca', ''),
(763, 15, '107', 'Tonatico', ''),
(764, 15, '108', 'Tultepec', ''),
(765, 15, '109', 'Tultitl', ''),
(766, 15, '110', 'Valle de Bravo', ''),
(767, 15, '111', 'Villa de Allende', ''),
(768, 15, '112', 'Villa del Carb', ''),
(769, 15, '113', 'Villa Guerrero', ''),
(770, 15, '114', 'Villa Victoria', ''),
(771, 15, '115', 'Xonacatl', ''),
(772, 15, '116', 'Zacazonapan', ''),
(773, 15, '117', 'Zacualpan', ''),
(774, 15, '118', 'Zinacantepec', ''),
(775, 15, '119', 'Zumpahuac', ''),
(776, 15, '120', 'Zumpango', ''),
(777, 15, '121', 'Cuautitl', ''),
(778, 15, '122', 'Valle de Chalco Solidaridad', ''),
(779, 15, '123', 'Luvianos', ''),
(780, 15, '124', 'San Jos', ''),
(781, 15, '125', 'Tonanitla', ''),
(782, 16, '001', 'Acuitzio', ''),
(783, 16, '002', 'Aguililla', ''),
(784, 16, '003', '', ''),
(785, 16, '004', 'Angamacutiro', ''),
(786, 16, '005', 'Angangueo', ''),
(787, 16, '006', 'Apatzing', ''),
(788, 16, '007', 'Aporo', ''),
(789, 16, '008', 'Aquila', ''),
(790, 16, '009', 'Ario', ''),
(791, 16, '010', 'Arteaga', ''),
(792, 16, '011', 'Brise', ''),
(793, 16, '012', 'Buenavista', ''),
(794, 16, '013', 'Car', ''),
(795, 16, '014', 'Coahuayana', ''),
(796, 16, '015', 'Coalcom', ''),
(797, 16, '016', 'Coeneo', ''),
(798, 16, '017', 'Contepec', ''),
(799, 16, '018', 'Cop', ''),
(800, 16, '019', 'Cotija', ''),
(801, 16, '020', 'Cuitzeo', ''),
(802, 16, '021', 'Charapan', ''),
(803, 16, '022', 'Charo', ''),
(804, 16, '023', 'Chavinda', ''),
(805, 16, '024', 'Cher', ''),
(806, 16, '025', 'Chilchota', ''),
(807, 16, '026', 'Chinicuila', ''),
(808, 16, '027', 'Chuc', ''),
(809, 16, '028', 'Churintzio', ''),
(810, 16, '029', 'Churumuco', ''),
(811, 16, '030', 'Ecuandureo', ''),
(812, 16, '031', 'Epitacio Huerta', ''),
(813, 16, '032', 'Erongar', ''),
(814, 16, '033', 'Gabriel Zamora', ''),
(815, 16, '034', 'Hidalgo', ''),
(816, 16, '035', 'La Huacana', ''),
(817, 16, '036', 'Huandacareo', ''),
(818, 16, '037', 'Huaniqueo', ''),
(819, 16, '038', 'Huetamo', ''),
(820, 16, '039', 'Huiramba', ''),
(821, 16, '040', 'Indaparapeo', ''),
(822, 16, '041', 'Irimbo', ''),
(823, 16, '042', 'Ixtl', ''),
(824, 16, '043', 'Jacona', ''),
(825, 16, '044', 'Jim', ''),
(826, 16, '045', 'Jiquilpan', ''),
(827, 16, '046', 'Ju', ''),
(828, 16, '047', 'Jungapeo', ''),
(829, 16, '048', 'Lagunillas', ''),
(830, 16, '049', 'Madero', ''),
(831, 16, '050', 'Maravat', ''),
(832, 16, '051', 'Marcos Castellanos', ''),
(833, 16, '052', 'L', ''),
(834, 16, '053', 'Morelia', ''),
(835, 16, '054', 'Morelos', ''),
(836, 16, '055', 'M', ''),
(837, 16, '056', 'Nahuatzen', ''),
(838, 16, '057', 'Nocup', ''),
(839, 16, '058', 'Nuevo Parangaricutiro', ''),
(840, 16, '059', 'Nuevo Urecho', ''),
(841, 16, '060', 'Numar', ''),
(842, 16, '061', 'Ocampo', ''),
(843, 16, '062', 'Pajacuar', ''),
(844, 16, '063', 'Panind', ''),
(845, 16, '064', 'Par', ''),
(846, 16, '065', 'Paracho', ''),
(847, 16, '066', 'P', ''),
(848, 16, '067', 'Penjamillo', ''),
(849, 16, '068', 'Perib', ''),
(850, 16, '069', 'La Piedad', ''),
(851, 16, '070', 'Pur', ''),
(852, 16, '071', 'Puru', ''),
(853, 16, '072', 'Quer', ''),
(854, 16, '073', 'Quiroga', ''),
(855, 16, '074', 'Cojumatl', ''),
(856, 16, '075', 'Los Reyes', ''),
(857, 16, '076', 'Sahuayo', ''),
(858, 16, '077', 'San Lucas', ''),
(859, 16, '078', 'Santa Ana Maya', ''),
(860, 16, '079', 'Salvador Escalante', ''),
(861, 16, '080', 'Senguio', ''),
(862, 16, '081', 'Susupuato', ''),
(863, 16, '082', 'Tac', ''),
(864, 16, '083', 'Tanc', ''),
(865, 16, '084', 'Tangamandapio', ''),
(866, 16, '085', 'Tanganc', ''),
(867, 16, '086', 'Tanhuato', ''),
(868, 16, '087', 'Taretan', ''),
(869, 16, '088', 'Tar', ''),
(870, 16, '089', 'Tepalcatepec', ''),
(871, 16, '090', 'Tingambato', ''),
(872, 16, '091', 'Ting', ''),
(873, 16, '092', 'Tiquicheo de Nicol', ''),
(874, 16, '093', 'Tlalpujahua', ''),
(875, 16, '094', 'Tlazazalca', ''),
(876, 16, '095', 'Tocumbo', ''),
(877, 16, '096', 'Tumbiscat', ''),
(878, 16, '097', 'Turicato', ''),
(879, 16, '098', 'Tuxpan', ''),
(880, 16, '099', 'Tuzantla', ''),
(881, 16, '100', 'Tzintzuntzan', ''),
(882, 16, '101', 'Tzitzio', ''),
(883, 16, '102', 'Uruapan', ''),
(884, 16, '103', 'Venustiano Carranza', ''),
(885, 16, '104', 'Villamar', ''),
(886, 16, '105', 'Vista Hermosa', ''),
(887, 16, '106', 'Yur', ''),
(888, 16, '107', 'Zacapu', ''),
(889, 16, '108', 'Zamora', ''),
(890, 16, '109', 'Zin', ''),
(891, 16, '110', 'Zinap', ''),
(892, 16, '111', 'Ziracuaretiro', ''),
(893, 16, '112', 'Zit', ''),
(894, 16, '113', 'Jos', ''),
(895, 17, '001', 'Amacuzac', ''),
(896, 17, '002', 'Atlatlahucan', ''),
(897, 17, '003', 'Axochiapan', ''),
(898, 17, '004', 'Ayala', ''),
(899, 17, '005', 'Coatl', ''),
(900, 17, '006', 'Cuautla', ''),
(901, 17, '007', 'Cuernavaca', ''),
(902, 17, '008', 'Emiliano Zapata', ''),
(903, 17, '009', 'Huitzilac', ''),
(904, 17, '010', 'Jantetelco', ''),
(905, 17, '011', 'Jiutepec', ''),
(906, 17, '012', 'Jojutla', ''),
(907, 17, '013', 'Jonacatepec', ''),
(908, 17, '014', 'Mazatepec', ''),
(909, 17, '015', 'Miacatl', ''),
(910, 17, '016', 'Ocuituco', ''),
(911, 17, '017', 'Puente de Ixtla', ''),
(912, 17, '018', 'Temixco', ''),
(913, 17, '019', 'Tepalcingo', ''),
(914, 17, '020', 'Tepoztl', ''),
(915, 17, '021', 'Tetecala', ''),
(916, 17, '022', 'Tetela del Volc', ''),
(917, 17, '023', 'Tlalnepantla', ''),
(918, 17, '024', 'Tlaltizap', ''),
(919, 17, '025', 'Tlaquiltenango', ''),
(920, 17, '026', 'Tlayacapan', ''),
(921, 17, '027', 'Totolapan', ''),
(922, 17, '028', 'Xochitepec', ''),
(923, 17, '029', 'Yautepec', ''),
(924, 17, '030', 'Yecapixtla', ''),
(925, 17, '031', 'Zacatepec', ''),
(926, 17, '032', 'Zacualpan', ''),
(927, 17, '033', 'Temoac', ''),
(928, 18, '001', 'Acaponeta', ''),
(929, 18, '002', 'Ahuacatl', ''),
(930, 18, '003', 'Amatl', ''),
(931, 18, '004', 'Compostela', ''),
(932, 18, '005', 'Huajicori', ''),
(933, 18, '006', 'Ixtl', ''),
(934, 18, '007', 'Jala', ''),
(935, 18, '008', 'Xalisco', ''),
(936, 18, '009', 'Del Nayar', ''),
(937, 18, '010', 'Rosamorada', ''),
(938, 18, '011', 'Ru', ''),
(939, 18, '012', 'San Blas', ''),
(940, 18, '013', 'San Pedro Lagunillas', ''),
(941, 18, '014', 'Santa Mar', ''),
(942, 18, '015', 'Santiago Ixcuintla', ''),
(943, 18, '016', 'Tecuala', ''),
(944, 18, '017', 'Tepic', ''),
(945, 18, '018', 'Tuxpan', ''),
(946, 18, '019', 'La Yesca', ''),
(947, 18, '020', 'Bah', ''),
(948, 19, '001', 'Abasolo', ''),
(949, 19, '002', 'Agualeguas', ''),
(950, 19, '003', 'Los Aldamas', ''),
(951, 19, '004', 'Allende', ''),
(952, 19, '005', 'An', ''),
(953, 19, '006', 'Apodaca', ''),
(954, 19, '007', 'Aramberri', ''),
(955, 19, '008', 'Bustamante', ''),
(956, 19, '009', 'Cadereyta Jim', ''),
(957, 19, '010', 'El Carmen', ''),
(958, 19, '011', 'Cerralvo', ''),
(959, 19, '012', 'Ci', ''),
(960, 19, '013', 'China', ''),
(961, 19, '014', 'Doctor Arroyo', ''),
(962, 19, '015', 'Doctor Coss', ''),
(963, 19, '016', 'Doctor Gonz', ''),
(964, 19, '017', 'Galeana', ''),
(965, 19, '018', 'Garc', ''),
(966, 19, '019', 'San Pedro Garza Garc', ''),
(967, 19, '020', 'General Bravo', ''),
(968, 19, '021', 'General Escobedo', ''),
(969, 19, '022', 'General Ter', ''),
(970, 19, '023', 'General Trevi', ''),
(971, 19, '024', 'General Zaragoza', ''),
(972, 19, '025', 'General Zuazua', ''),
(973, 19, '026', 'Guadalupe', ''),
(974, 19, '027', 'Los Herreras', ''),
(975, 19, '028', 'Higueras', ''),
(976, 19, '029', 'Hualahuises', ''),
(977, 19, '030', 'Iturbide', ''),
(978, 19, '031', 'Ju', ''),
(979, 19, '032', 'Lampazos de Naranjo', ''),
(980, 19, '033', 'Linares', ''),
(981, 19, '034', 'Mar', ''),
(982, 19, '035', 'Melchor Ocampo', ''),
(983, 19, '036', 'Mier y Noriega', ''),
(984, 19, '037', 'Mina', ''),
(985, 19, '038', 'Montemorelos', ''),
(986, 19, '039', 'Monterrey', ''),
(987, 19, '040', 'Par', ''),
(988, 19, '041', 'Pesquer', ''),
(989, 19, '042', 'Los Ramones', ''),
(990, 19, '043', 'Rayones', ''),
(991, 19, '044', 'Sabinas Hidalgo', ''),
(992, 19, '045', 'Salinas Victoria', ''),
(993, 19, '046', 'San Nicol', ''),
(994, 19, '047', 'Hidalgo', ''),
(995, 19, '048', 'Santa Catarina', ''),
(996, 19, '049', 'Santiago', ''),
(997, 19, '050', 'Vallecillo', ''),
(998, 19, '051', 'Villaldama', ''),
(999, 20, '001', 'Abejones', ''),
(1000, 20, '002', 'Acatl', ''),
(1001, 20, '003', 'Asunci', ''),
(1002, 20, '004', 'Asunci', ''),
(1003, 20, '005', 'Asunci', ''),
(1004, 20, '006', 'Asunci', ''),
(1005, 20, '007', 'Asunci', ''),
(1006, 20, '008', 'Asunci', ''),
(1007, 20, '009', 'Ayotzintepec', ''),
(1008, 20, '010', 'El Barrio de la Soledad', ''),
(1009, 20, '011', 'Calihual', ''),
(1010, 20, '012', 'Candelaria Loxicha', ''),
(1011, 20, '013', 'Ci', ''),
(1012, 20, '014', 'Ciudad Ixtepec', ''),
(1013, 20, '015', 'Coatecas Altas', ''),
(1014, 20, '016', 'Coicoy', ''),
(1015, 20, '017', 'La Compa', ''),
(1016, 20, '018', 'Concepci', ''),
(1017, 20, '019', 'Concepci', ''),
(1018, 20, '020', 'Constancia del Rosario', ''),
(1019, 20, '021', 'Cosolapa', ''),
(1020, 20, '022', 'Cosoltepec', ''),
(1021, 20, '023', 'Cuil', ''),
(1022, 20, '024', 'Cuyamecalco Villa de Zaragoza', ''),
(1023, 20, '025', 'Chahuites', ''),
(1024, 20, '026', 'Chalcatongo de Hidalgo', ''),
(1025, 20, '027', 'Chiquihuitl', ''),
(1026, 20, '028', 'Heroica Ciudad de Ejutla de Crespo', ''),
(1027, 20, '029', 'Eloxochitl', ''),
(1028, 20, '030', 'El Espinal', ''),
(1029, 20, '031', 'Tamazul', ''),
(1030, 20, '032', 'Fresnillo de Trujano', ''),
(1031, 20, '033', 'Guadalupe Etla', ''),
(1032, 20, '034', 'Guadalupe de Ram', ''),
(1033, 20, '035', 'Guelatao de Ju', ''),
(1034, 20, '036', 'Guevea de Humboldt', ''),
(1035, 20, '037', 'Mesones Hidalgo', ''),
(1036, 20, '038', 'Villa Hidalgo', ''),
(1037, 20, '039', 'Heroica Ciudad de Huajuapan de Le', ''),
(1038, 20, '040', 'Huautepec', ''),
(1039, 20, '041', 'Huautla de Jim', ''),
(1040, 20, '042', 'Ixtl', ''),
(1041, 20, '043', 'Heroica Ciudad de Juchit', ''),
(1042, 20, '044', 'Loma Bonita', ''),
(1043, 20, '045', 'Magdalena Apasco', ''),
(1044, 20, '046', 'Magdalena Jaltepec', ''),
(1045, 20, '047', 'Santa Magdalena Jicotl', ''),
(1046, 20, '048', 'Magdalena Mixtepec', ''),
(1047, 20, '049', 'Magdalena Ocotl', ''),
(1048, 20, '050', 'Magdalena Pe', ''),
(1049, 20, '051', 'Magdalena Teitipac', ''),
(1050, 20, '052', 'Magdalena Tequisistl', ''),
(1051, 20, '053', 'Magdalena Tlacotepec', ''),
(1052, 20, '054', 'Magdalena Zahuatl', ''),
(1053, 20, '055', 'Mariscala de Ju', ''),
(1054, 20, '056', 'M', ''),
(1055, 20, '057', 'Mat', ''),
(1056, 20, '058', 'Mazatl', ''),
(1057, 20, '059', 'Miahuatl', ''),
(1058, 20, '060', 'Mixistl', ''),
(1059, 20, '061', 'Monjas', ''),
(1060, 20, '062', 'Natividad', ''),
(1061, 20, '063', 'Nazareno Etla', ''),
(1062, 20, '064', 'Nejapa de Madero', ''),
(1063, 20, '065', 'Ixpantepec Nieves', ''),
(1064, 20, '066', 'Santiago Niltepec', ''),
(1065, 20, '067', 'Oaxaca de Ju', ''),
(1066, 20, '068', 'Ocotl', ''),
(1067, 20, '069', 'La Pe', ''),
(1068, 20, '070', 'Pinotepa de Don Luis', ''),
(1069, 20, '071', 'Pluma Hidalgo', ''),
(1070, 20, '072', 'San Jos', ''),
(1071, 20, '073', 'Putla Villa de Guerrero', ''),
(1072, 20, '074', 'Santa Catarina Quioquitani', ''),
(1073, 20, '075', 'Reforma de Pineda', ''),
(1074, 20, '076', 'La Reforma', ''),
(1075, 20, '077', 'Reyes Etla', ''),
(1076, 20, '078', 'Rojas de Cuauht', ''),
(1077, 20, '079', 'Salina Cruz', ''),
(1078, 20, '080', 'San Agust', ''),
(1079, 20, '081', 'San Agust', ''),
(1080, 20, '082', 'San Agust', ''),
(1081, 20, '083', 'San Agust', ''),
(1082, 20, '084', 'San Agust', ''),
(1083, 20, '085', 'San Agust', ''),
(1084, 20, '086', 'San Agust', ''),
(1085, 20, '087', 'San Agust', ''),
(1086, 20, '088', 'San Andr', ''),
(1087, 20, '089', 'San Andr', ''),
(1088, 20, '090', 'San Andr', ''),
(1089, 20, '091', 'San Andr', ''),
(1090, 20, '092', 'San Andr', ''),
(1091, 20, '093', 'San Andr', ''),
(1092, 20, '094', 'San Andr', ''),
(1093, 20, '095', 'San Andr', ''),
(1094, 20, '096', 'San Andr', ''),
(1095, 20, '097', 'San Andr', ''),
(1096, 20, '098', 'San Andr', ''),
(1097, 20, '099', 'San Andr', ''),
(1098, 20, '100', 'San Andr', ''),
(1099, 20, '101', 'San Andr', ''),
(1100, 20, '102', 'San Andr', ''),
(1101, 20, '103', 'San Antonino Castillo Velasco', ''),
(1102, 20, '104', 'San Antonino el Alto', ''),
(1103, 20, '105', 'San Antonino Monte Verde', ''),
(1104, 20, '106', 'San Antonio Acutla', ''),
(1105, 20, '107', 'San Antonio de la Cal', ''),
(1106, 20, '108', 'San Antonio Huitepec', ''),
(1107, 20, '109', 'San Antonio Nanahuat', ''),
(1108, 20, '110', 'San Antonio Sinicahua', ''),
(1109, 20, '111', 'San Antonio Tepetlapa', ''),
(1110, 20, '112', 'San Baltazar Chichic', ''),
(1111, 20, '113', 'San Baltazar Loxicha', ''),
(1112, 20, '114', 'San Baltazar Yatzachi el Bajo', ''),
(1113, 20, '115', 'San Bartolo Coyotepec', ''),
(1114, 20, '116', 'San Bartolom', ''),
(1115, 20, '117', 'San Bartolom', ''),
(1116, 20, '118', 'San Bartolom', ''),
(1117, 20, '119', 'San Bartolom', ''),
(1118, 20, '120', 'San Bartolom', ''),
(1119, 20, '121', 'San Bartolo Soyaltepec', ''),
(1120, 20, '122', 'San Bartolo Yautepec', ''),
(1121, 20, '123', 'San Bernardo Mixtepec', ''),
(1122, 20, '124', 'San Blas Atempa', ''),
(1123, 20, '125', 'San Carlos Yautepec', ''),
(1124, 20, '126', 'San Crist', ''),
(1125, 20, '127', 'San Crist', ''),
(1126, 20, '128', 'San Crist', ''),
(1127, 20, '129', 'San Crist', ''),
(1128, 20, '130', 'San Dionisio del Mar', ''),
(1129, 20, '131', 'San Dionisio Ocotepec', ''),
(1130, 20, '132', 'San Dionisio Ocotl', ''),
(1131, 20, '133', 'San Esteban Atatlahuca', ''),
(1132, 20, '134', 'San Felipe Jalapa de D', ''),
(1133, 20, '135', 'San Felipe Tejal', ''),
(1134, 20, '136', 'San Felipe Usila', ''),
(1135, 20, '137', 'San Francisco Cahuacu', ''),
(1136, 20, '138', 'San Francisco Cajonos', ''),
(1137, 20, '139', 'San Francisco Chapulapa', ''),
(1138, 20, '140', 'San Francisco Chind', ''),
(1139, 20, '141', 'San Francisco del Mar', ''),
(1140, 20, '142', 'San Francisco Huehuetl', ''),
(1141, 20, '143', 'San Francisco Ixhuat', ''),
(1142, 20, '144', 'San Francisco Jaltepetongo', ''),
(1143, 20, '145', 'San Francisco Lachigol', ''),
(1144, 20, '146', 'San Francisco Logueche', ''),
(1145, 20, '147', 'San Francisco Nuxa', ''),
(1146, 20, '148', 'San Francisco Ozolotepec', ''),
(1147, 20, '149', 'San Francisco Sola', ''),
(1148, 20, '150', 'San Francisco Telixtlahuaca', ''),
(1149, 20, '151', 'San Francisco Teopan', ''),
(1150, 20, '152', 'San Francisco Tlapancingo', ''),
(1151, 20, '153', 'San Gabriel Mixtepec', ''),
(1152, 20, '154', 'San Ildefonso Amatl', ''),
(1153, 20, '155', 'San Ildefonso Sola', ''),
(1154, 20, '156', 'San Ildefonso Villa Alta', ''),
(1155, 20, '157', 'San Jacinto Amilpas', ''),
(1156, 20, '158', 'San Jacinto Tlacotepec', ''),
(1157, 20, '159', 'San Jer', ''),
(1158, 20, '160', 'San Jer', ''),
(1159, 20, '161', 'San Jer', ''),
(1160, 20, '162', 'San Jer', ''),
(1161, 20, '163', 'San Jer', ''),
(1162, 20, '164', 'San Jorge Nuchita', ''),
(1163, 20, '165', 'San Jos', ''),
(1164, 20, '166', 'San Jos', ''),
(1165, 20, '167', 'San Jos', ''),
(1166, 20, '168', 'San Jos', ''),
(1167, 20, '169', 'San Jos', ''),
(1168, 20, '170', 'San Jos', ''),
(1169, 20, '171', 'San Jos', ''),
(1170, 20, '172', 'San Juan Achiutla', ''),
(1171, 20, '173', 'San Juan Atepec', ''),
(1172, 20, '174', '', ''),
(1173, 20, '175', 'San Juan Bautista Atatlahuca', ''),
(1174, 20, '176', 'San Juan Bautista Coixtlahuaca', ''),
(1175, 20, '177', 'San Juan Bautista Cuicatl', ''),
(1176, 20, '178', 'San Juan Bautista Guelache', ''),
(1177, 20, '179', 'San Juan Bautista Jayacatl', ''),
(1178, 20, '180', 'San Juan Bautista Lo de Soto', ''),
(1179, 20, '181', 'San Juan Bautista Suchitepec', ''),
(1180, 20, '182', 'San Juan Bautista Tlacoatzintepec', ''),
(1181, 20, '183', 'San Juan Bautista Tlachichilco', ''),
(1182, 20, '184', 'San Juan Bautista Tuxtepec', ''),
(1183, 20, '185', 'San Juan Cacahuatepec', ''),
(1184, 20, '186', 'San Juan Cieneguilla', ''),
(1185, 20, '187', 'San Juan Coatz', ''),
(1186, 20, '188', 'San Juan Colorado', ''),
(1187, 20, '189', 'San Juan Comaltepec', ''),
(1188, 20, '190', 'San Juan Cotzoc', ''),
(1189, 20, '191', 'San Juan Chicomez', ''),
(1190, 20, '192', 'San Juan Chilateca', ''),
(1191, 20, '193', 'San Juan del Estado', ''),
(1192, 20, '194', 'San Juan del R', ''),
(1193, 20, '195', 'San Juan Diuxi', ''),
(1194, 20, '196', 'San Juan Evangelista Analco', ''),
(1195, 20, '197', 'San Juan Guelav', ''),
(1196, 20, '198', 'San Juan Guichicovi', ''),
(1197, 20, '199', 'San Juan Ihualtepec', ''),
(1198, 20, '200', 'San Juan Juquila Mixes', ''),
(1199, 20, '201', 'San Juan Juquila Vijanos', ''),
(1200, 20, '202', 'San Juan Lachao', ''),
(1201, 20, '203', 'San Juan Lachigalla', ''),
(1202, 20, '204', 'San Juan Lajarcia', ''),
(1203, 20, '205', 'San Juan Lalana', ''),
(1204, 20, '206', 'San Juan de los Cu', ''),
(1205, 20, '207', 'San Juan Mazatl', ''),
(1206, 20, '208', 'San Juan Mixtepec -Dto. 08 -', ''),
(1207, 20, '209', 'San Juan Mixtepec -Dto. 26 -', ''),
(1208, 20, '210', 'San Juan ', ''),
(1209, 20, '211', 'San Juan Ozolotepec', ''),
(1210, 20, '212', 'San Juan Petlapa', ''),
(1211, 20, '213', 'San Juan Quiahije', ''),
(1212, 20, '214', 'San Juan Quiotepec', ''),
(1213, 20, '215', 'San Juan Sayultepec', ''),
(1214, 20, '216', 'San Juan Taba', ''),
(1215, 20, '217', 'San Juan Tamazola', ''),
(1216, 20, '218', 'San Juan Teita', ''),
(1217, 20, '219', 'San Juan Teitipac', ''),
(1218, 20, '220', 'San Juan Tepeuxila', ''),
(1219, 20, '221', 'San Juan Teposcolula', ''),
(1220, 20, '222', 'San Juan Yae', ''),
(1221, 20, '223', 'San Juan Yatzona', ''),
(1222, 20, '224', 'San Juan Yucuita', ''),
(1223, 20, '225', 'San Lorenzo', ''),
(1224, 20, '226', 'San Lorenzo Albarradas', ''),
(1225, 20, '227', 'San Lorenzo Cacaotepec', ''),
(1226, 20, '228', 'San Lorenzo Cuaunecuiltitla', ''),
(1227, 20, '229', 'San Lorenzo Texmel', ''),
(1228, 20, '230', 'San Lorenzo Victoria', ''),
(1229, 20, '231', 'San Lucas Camotl', ''),
(1230, 20, '232', 'San Lucas Ojitl', ''),
(1231, 20, '233', 'San Lucas Quiavin', ''),
(1232, 20, '234', 'San Lucas Zoqui', ''),
(1233, 20, '235', 'San Luis Amatl', ''),
(1234, 20, '236', 'San Marcial Ozolotepec', ''),
(1235, 20, '237', 'San Marcos Arteaga', ''),
(1236, 20, '238', 'San Mart', ''),
(1237, 20, '239', 'San Mart', ''),
(1238, 20, '240', 'San Mart', ''),
(1239, 20, '241', 'San Mart', ''),
(1240, 20, '242', 'San Mart', ''),
(1241, 20, '243', 'San Mart', ''),
(1242, 20, '244', 'San Mart', ''),
(1243, 20, '245', 'San Mart', ''),
(1244, 20, '246', 'San Mateo Cajonos', ''),
(1245, 20, '247', 'Capul', ''),
(1246, 20, '248', 'San Mateo del Mar', ''),
(1247, 20, '249', 'San Mateo Yoloxochitl', ''),
(1248, 20, '250', 'San Mateo Etlatongo', ''),
(1249, 20, '251', 'San Mateo Nej', ''),
(1250, 20, '252', 'San Mateo Pe', ''),
(1251, 20, '253', 'San Mateo Pi', ''),
(1252, 20, '254', 'San Mateo R', ''),
(1253, 20, '255', 'San Mateo Sindihui', ''),
(1254, 20, '256', 'San Mateo Tlapiltepec', ''),
(1255, 20, '257', 'San Melchor Betaza', ''),
(1256, 20, '258', 'San Miguel Achiutla', ''),
(1257, 20, '259', 'San Miguel Ahuehuetitl', ''),
(1258, 20, '260', 'San Miguel Alo', ''),
(1259, 20, '261', 'San Miguel Amatitl', ''),
(1260, 20, '262', 'San Miguel Amatl', ''),
(1261, 20, '263', 'San Miguel Coatl', ''),
(1262, 20, '264', 'San Miguel Chicahua', ''),
(1263, 20, '265', 'San Miguel Chimalapa', ''),
(1264, 20, '266', 'San Miguel del Puerto', ''),
(1265, 20, '267', 'San Miguel del R', ''),
(1266, 20, '268', 'San Miguel Ejutla', ''),
(1267, 20, '269', 'San Miguel el Grande', ''),
(1268, 20, '270', 'San Miguel Huautla', ''),
(1269, 20, '271', 'San Miguel Mixtepec', ''),
(1270, 20, '272', 'San Miguel Panixtlahuaca', ''),
(1271, 20, '273', 'San Miguel Peras', ''),
(1272, 20, '274', 'San Miguel Piedras', ''),
(1273, 20, '275', 'San Miguel Quetzaltepec', ''),
(1274, 20, '276', 'San Miguel Santa Flor', ''),
(1275, 20, '277', 'Villa Sola de Vega', ''),
(1276, 20, '278', 'San Miguel Soyaltepec', ''),
(1277, 20, '279', 'San Miguel Suchixtepec', ''),
(1278, 20, '280', 'Villa Talea de Castro', ''),
(1279, 20, '281', 'San Miguel Tecomatl', ''),
(1280, 20, '282', 'San Miguel Tenango', ''),
(1281, 20, '283', 'San Miguel Tequixtepec', ''),
(1282, 20, '284', 'San Miguel Tilqui', ''),
(1283, 20, '285', 'San Miguel Tlacamama', ''),
(1284, 20, '286', 'San Miguel Tlacotepec', ''),
(1285, 20, '287', 'San Miguel Tulancingo', ''),
(1286, 20, '288', 'San Miguel Yotao', ''),
(1287, 20, '289', 'San Nicol', ''),
(1288, 20, '290', 'San Nicol', ''),
(1289, 20, '291', 'San Pablo Coatl', ''),
(1290, 20, '292', 'San Pablo Cuatro Venados', ''),
(1291, 20, '293', 'San Pablo Etla', ''),
(1292, 20, '294', 'San Pablo Huitzo', ''),
(1293, 20, '295', 'San Pablo Huixtepec', ''),
(1294, 20, '296', 'San Pablo Macuiltianguis', ''),
(1295, 20, '297', 'San Pablo Tijaltepec', ''),
(1296, 20, '298', 'San Pablo Villa de Mitla', ''),
(1297, 20, '299', 'San Pablo Yaganiza', ''),
(1298, 20, '300', 'San Pedro Amuzgos', ''),
(1299, 20, '301', 'San Pedro Ap', ''),
(1300, 20, '302', 'San Pedro Atoyac', ''),
(1301, 20, '303', 'San Pedro Cajonos', ''),
(1302, 20, '304', 'San Pedro Coxcaltepec C', ''),
(1303, 20, '305', 'San Pedro Comitancillo', ''),
(1304, 20, '306', 'San Pedro el Alto', ''),
(1305, 20, '307', 'San Pedro Huamelula', ''),
(1306, 20, '308', 'San Pedro Huilotepec', ''),
(1307, 20, '309', 'San Pedro Ixcatl', ''),
(1308, 20, '310', 'San Pedro Ixtlahuaca', ''),
(1309, 20, '311', 'San Pedro Jaltepetongo', ''),
(1310, 20, '312', 'San Pedro Jicay', ''),
(1311, 20, '313', 'San Pedro Jocotipac', ''),
(1312, 20, '314', 'San Pedro Juchatengo', ''),
(1313, 20, '315', 'San Pedro M', ''),
(1314, 20, '316', 'San Pedro M', ''),
(1315, 20, '317', 'San Pedro M', ''),
(1316, 20, '318', 'San Pedro Mixtepec -Dto. 22 -', ''),
(1317, 20, '319', 'San Pedro Mixtepec -Dto. 26 -', ''),
(1318, 20, '320', 'San Pedro Molinos', ''),
(1319, 20, '321', 'San Pedro Nopala', ''),
(1320, 20, '322', 'San Pedro Ocopetatillo', ''),
(1321, 20, '323', 'San Pedro Ocotepec', ''),
(1322, 20, '324', 'San Pedro Pochutla', ''),
(1323, 20, '325', 'San Pedro Quiatoni', ''),
(1324, 20, '326', 'San Pedro Sochi', ''),
(1325, 20, '327', 'San Pedro Tapanatepec', ''),
(1326, 20, '328', 'San Pedro Taviche', ''),
(1327, 20, '329', 'San Pedro Teozacoalco', ''),
(1328, 20, '330', 'San Pedro Teutila', ''),
(1329, 20, '331', 'San Pedro Tida', ''),
(1330, 20, '332', 'San Pedro Topiltepec', ''),
(1331, 20, '333', 'San Pedro Totol', ''),
(1332, 20, '334', 'Villa de Tututepec de Melchor Ocampo', ''),
(1333, 20, '335', 'San Pedro Yaneri', ''),
(1334, 20, '336', 'San Pedro Y', ''),
(1335, 20, '337', 'San Pedro y San Pablo Ayutla', ''),
(1336, 20, '338', 'Villa de Etla', ''),
(1337, 20, '339', 'San Pedro y San Pablo Teposcolula', ''),
(1338, 20, '340', 'San Pedro y San Pablo Tequixtepec', ''),
(1339, 20, '341', 'San Pedro Yucunama', ''),
(1340, 20, '342', 'San Raymundo Jalpan', ''),
(1341, 20, '343', 'San Sebasti', ''),
(1342, 20, '344', 'San Sebasti', ''),
(1343, 20, '345', 'San Sebasti', ''),
(1344, 20, '346', 'San Sebasti', ''),
(1345, 20, '347', 'San Sebasti', ''),
(1346, 20, '348', 'San Sebasti', ''),
(1347, 20, '349', 'San Sebasti', ''),
(1348, 20, '350', 'San Sebasti', ''),
(1349, 20, '351', 'San Sim', ''),
(1350, 20, '352', 'San Sim', ''),
(1351, 20, '353', 'Santa Ana', ''),
(1352, 20, '354', 'Santa Ana Ateixtlahuaca', ''),
(1353, 20, '355', 'Santa Ana Cuauht', ''),
(1354, 20, '356', 'Santa Ana del Valle', ''),
(1355, 20, '357', 'Santa Ana Tavela', ''),
(1356, 20, '358', 'Santa Ana Tlapacoyan', ''),
(1357, 20, '359', 'Santa Ana Yareni', ''),
(1358, 20, '360', 'Santa Ana Zegache', ''),
(1359, 20, '361', 'Santa Catalina Quier', ''),
(1360, 20, '362', 'Santa Catarina Cuixtla', ''),
(1361, 20, '363', 'Santa Catarina Ixtepeji', ''),
(1362, 20, '364', 'Santa Catarina Juquila', ''),
(1363, 20, '365', 'Santa Catarina Lachatao', ''),
(1364, 20, '366', 'Santa Catarina Loxicha', ''),
(1365, 20, '367', 'Santa Catarina Mechoac', ''),
(1366, 20, '368', 'Santa Catarina Minas', ''),
(1367, 20, '369', 'Santa Catarina Quian', ''),
(1368, 20, '370', 'Santa Catarina Tayata', ''),
(1369, 20, '371', 'Santa Catarina Ticu', ''),
(1370, 20, '372', 'Santa Catarina Yosonot', ''),
(1371, 20, '373', 'Santa Catarina Zapoquila', ''),
(1372, 20, '374', 'Santa Cruz Acatepec', ''),
(1373, 20, '375', 'Santa Cruz Amilpas', ''),
(1374, 20, '376', 'Santa Cruz de Bravo', ''),
(1375, 20, '377', 'Santa Cruz Itundujia', ''),
(1376, 20, '378', 'Santa Cruz Mixtepec', ''),
(1377, 20, '379', 'Santa Cruz Nundaco', ''),
(1378, 20, '380', 'Santa Cruz Papalutla', ''),
(1379, 20, '381', 'Santa Cruz Tacache de Mina', ''),
(1380, 20, '382', 'Santa Cruz Tacahua', ''),
(1381, 20, '383', 'Santa Cruz Tayata', ''),
(1382, 20, '384', 'Santa Cruz Xitla', ''),
(1383, 20, '385', 'Santa Cruz Xoxocotl', ''),
(1384, 20, '386', 'Santa Cruz Zenzontepec', ''),
(1385, 20, '387', 'Santa Gertrudis', ''),
(1386, 20, '388', 'Santa In', ''),
(1387, 20, '389', 'Santa In', ''),
(1388, 20, '390', 'Santa Luc', ''),
(1389, 20, '391', 'Santa Luc', ''),
(1390, 20, '392', 'Santa Luc', ''),
(1391, 20, '393', 'Santa Luc', ''),
(1392, 20, '394', 'Santa Mar', ''),
(1393, 20, '395', 'Santa Mar', ''),
(1394, 20, '396', 'Santa Mar', ''),
(1395, 20, '397', 'Heroica Ciudad de Tlaxiaco', ''),
(1396, 20, '398', 'Ayoquezco de Aldama', ''),
(1397, 20, '399', 'Santa Mar', '');
INSERT INTO `municipio` (`municipioId`, `estadoId`, `clave`, `nombre`, `sigla`) VALUES
(1398, 20, '400', 'Santa Mar', ''),
(1399, 20, '401', 'Santa Mar', ''),
(1400, 20, '402', 'Santa Mar', ''),
(1401, 20, '403', 'Santa Mar', ''),
(1402, 20, '404', 'Santa Mar', ''),
(1403, 20, '405', 'Villa de Chilapa de D', ''),
(1404, 20, '406', 'Santa Mar', ''),
(1405, 20, '407', 'Santa Mar', ''),
(1406, 20, '408', 'Santa Mar', ''),
(1407, 20, '409', 'Santa Mar', ''),
(1408, 20, '410', 'Santa Mar', ''),
(1409, 20, '411', 'Santa Mar', ''),
(1410, 20, '412', 'Santa Mar', ''),
(1411, 20, '413', 'Santa Mar', ''),
(1412, 20, '414', 'Santa Mar', ''),
(1413, 20, '415', 'Santa Mar', ''),
(1414, 20, '416', 'Santa Mar', ''),
(1415, 20, '417', 'Santa Mar', ''),
(1416, 20, '418', 'Santa Mar', ''),
(1417, 20, '419', 'Santa Mar', ''),
(1418, 20, '420', 'Santa Mar', ''),
(1419, 20, '421', 'Santa Mar', ''),
(1420, 20, '422', 'Santa Mar', ''),
(1421, 20, '423', 'Santa Mar', ''),
(1422, 20, '424', 'Santa Mar', ''),
(1423, 20, '425', 'Santa Mar', ''),
(1424, 20, '426', 'Santa Mar', ''),
(1425, 20, '427', 'Santa Mar', ''),
(1426, 20, '428', 'Santa Mar', ''),
(1427, 20, '429', 'Santa Mar', ''),
(1428, 20, '430', 'Santa Mar', ''),
(1429, 20, '431', 'Santa Mar', ''),
(1430, 20, '432', 'Santa Mar', ''),
(1431, 20, '433', 'Santa Mar', ''),
(1432, 20, '434', 'Santa Mar', ''),
(1433, 20, '435', 'Santa Mar', ''),
(1434, 20, '436', 'Santa Mar', ''),
(1435, 20, '437', 'Santa Mar', ''),
(1436, 20, '438', 'Santa Mar', ''),
(1437, 20, '439', 'Santa Mar', ''),
(1438, 20, '440', 'Santa Mar', ''),
(1439, 20, '441', 'Santa Mar', ''),
(1440, 20, '442', 'Santa Mar', ''),
(1441, 20, '443', 'Santa Mar', ''),
(1442, 20, '444', 'Santa Mar', ''),
(1443, 20, '445', 'Santa Mar', ''),
(1444, 20, '446', 'Santa Mar', ''),
(1445, 20, '447', 'Santa Mar', ''),
(1446, 20, '448', 'Santa Mar', ''),
(1447, 20, '449', 'Santa Mar', ''),
(1448, 20, '450', 'Santiago Amoltepec', ''),
(1449, 20, '451', 'Santiago Apoala', ''),
(1450, 20, '452', 'Santiago Ap', ''),
(1451, 20, '453', 'Santiago Astata', ''),
(1452, 20, '454', 'Santiago Atitl', ''),
(1453, 20, '455', 'Santiago Ayuquililla', ''),
(1454, 20, '456', 'Santiago Cacaloxtepec', ''),
(1455, 20, '457', 'Santiago Camotl', ''),
(1456, 20, '458', 'Santiago Comaltepec', ''),
(1457, 20, '459', 'Santiago Chazumba', ''),
(1458, 20, '460', 'Santiago Cho', ''),
(1459, 20, '461', 'Santiago del R', ''),
(1460, 20, '462', 'Santiago Huajolotitl', ''),
(1461, 20, '463', 'Santiago Huauclilla', ''),
(1462, 20, '464', 'Santiago Ihuitl', ''),
(1463, 20, '465', 'Santiago Ixcuintepec', ''),
(1464, 20, '466', 'Santiago Ixtayutla', ''),
(1465, 20, '467', 'Santiago Jamiltepec', ''),
(1466, 20, '468', 'Santiago Jocotepec', ''),
(1467, 20, '469', 'Santiago Juxtlahuaca', ''),
(1468, 20, '470', 'Santiago Lachiguiri', ''),
(1469, 20, '471', 'Santiago Lalopa', ''),
(1470, 20, '472', 'Santiago Laollaga', ''),
(1471, 20, '473', 'Santiago Laxopa', ''),
(1472, 20, '474', 'Santiago Llano Grande', ''),
(1473, 20, '475', 'Santiago Matatl', ''),
(1474, 20, '476', 'Santiago Miltepec', ''),
(1475, 20, '477', 'Santiago Minas', ''),
(1476, 20, '478', 'Santiago Nacaltepec', ''),
(1477, 20, '479', 'Santiago Nejapilla', ''),
(1478, 20, '480', 'Santiago Nundiche', ''),
(1479, 20, '481', 'Santiago Nuyo', ''),
(1480, 20, '482', 'Santiago Pinotepa Nacional', ''),
(1481, 20, '483', 'Santiago Suchilquitongo', ''),
(1482, 20, '484', 'Santiago Tamazola', ''),
(1483, 20, '485', 'Santiago Tapextla', ''),
(1484, 20, '486', 'Villa Tej', ''),
(1485, 20, '487', 'Santiago Tenango', ''),
(1486, 20, '488', 'Santiago Tepetlapa', ''),
(1487, 20, '489', 'Santiago Tetepec', ''),
(1488, 20, '490', 'Santiago Texcalcingo', ''),
(1489, 20, '491', 'Santiago Textitl', ''),
(1490, 20, '492', 'Santiago Tilantongo', ''),
(1491, 20, '493', 'Santiago Tillo', ''),
(1492, 20, '494', 'Santiago Tlazoyaltepec', ''),
(1493, 20, '495', 'Santiago Xanica', ''),
(1494, 20, '496', 'Santiago Xiacu', ''),
(1495, 20, '497', 'Santiago Yaitepec', ''),
(1496, 20, '498', 'Santiago Yaveo', ''),
(1497, 20, '499', 'Santiago Yolom', ''),
(1498, 20, '500', 'Santiago Yosond', ''),
(1499, 20, '501', 'Santiago Yucuyachi', ''),
(1500, 20, '502', 'Santiago Zacatepec', ''),
(1501, 20, '503', 'Santiago Zoochila', ''),
(1502, 20, '504', 'Nuevo Zoqui', ''),
(1503, 20, '505', 'Santo Domingo Ingenio', ''),
(1504, 20, '506', 'Santo Domingo Albarradas', ''),
(1505, 20, '507', 'Santo Domingo Armenta', ''),
(1506, 20, '508', 'Santo Domingo Chihuit', ''),
(1507, 20, '509', 'Santo Domingo de Morelos', ''),
(1508, 20, '510', 'Santo Domingo Ixcatl', ''),
(1509, 20, '511', 'Santo Domingo Nuxa', ''),
(1510, 20, '512', 'Santo Domingo Ozolotepec', ''),
(1511, 20, '513', 'Santo Domingo Petapa', ''),
(1512, 20, '514', 'Santo Domingo Roayaga', ''),
(1513, 20, '515', 'Santo Domingo Tehuantepec', ''),
(1514, 20, '516', 'Santo Domingo Teojomulco', ''),
(1515, 20, '517', 'Santo Domingo Tepuxtepec', ''),
(1516, 20, '518', 'Santo Domingo Tlatay', ''),
(1517, 20, '519', 'Santo Domingo Tomaltepec', ''),
(1518, 20, '520', 'Santo Domingo Tonal', ''),
(1519, 20, '521', 'Santo Domingo Tonaltepec', ''),
(1520, 20, '522', 'Santo Domingo Xagac', ''),
(1521, 20, '523', 'Santo Domingo Yanhuitl', ''),
(1522, 20, '524', 'Santo Domingo Yodohino', ''),
(1523, 20, '525', 'Santo Domingo Zanatepec', ''),
(1524, 20, '526', 'Santos Reyes Nopala', ''),
(1525, 20, '527', 'Santos Reyes P', ''),
(1526, 20, '528', 'Santos Reyes Tepejillo', ''),
(1527, 20, '529', 'Santos Reyes Yucun', ''),
(1528, 20, '530', 'Santo Tom', ''),
(1529, 20, '531', 'Santo Tom', ''),
(1530, 20, '532', 'Santo Tom', ''),
(1531, 20, '533', 'Santo Tom', ''),
(1532, 20, '534', 'San Vicente Coatl', ''),
(1533, 20, '535', 'San Vicente Lachix', ''),
(1534, 20, '536', 'San Vicente Nu', ''),
(1535, 20, '537', 'Silacayo', ''),
(1536, 20, '538', 'Sitio de Xitlapehua', ''),
(1537, 20, '539', 'Soledad Etla', ''),
(1538, 20, '540', 'Villa de Tamazul', ''),
(1539, 20, '541', 'Tanetze de Zaragoza', ''),
(1540, 20, '542', 'Taniche', ''),
(1541, 20, '543', 'Tataltepec de Vald', ''),
(1542, 20, '544', 'Teococuilco de Marcos P', ''),
(1543, 20, '545', 'Teotitl', ''),
(1544, 20, '546', 'Teotitl', ''),
(1545, 20, '547', 'Teotongo', ''),
(1546, 20, '548', 'Tepelmeme Villa de Morelos', ''),
(1547, 20, '549', 'Heroica Villa Tezoatl', ''),
(1548, 20, '549', 'Heroica Villa Tezoatl', ''),
(1549, 20, '549', 'Heroica Villa Tezoatl', ''),
(1550, 20, '549', 'Heroica Villa Tezoatl', ''),
(1551, 20, '549', 'Heroica Villa Tezoatl', ''),
(1552, 20, '549', 'Heroica Villa Tezoatl', ''),
(1553, 20, '549', 'Heroica Villa Tezoatl', ''),
(1554, 20, '549', 'Heroica Villa Tezoatl', ''),
(1555, 20, '549', 'Heroica Villa Tezoatl', ''),
(1556, 20, '549', 'Heroica Villa Tezoatl', ''),
(1557, 20, '549', 'Heroica Villa Tezoatl', ''),
(1558, 20, '549', 'Heroica Villa Tezoatl', ''),
(1559, 20, '549', 'Heroica Villa Tezoatl', ''),
(1560, 20, '549', 'Heroica Villa Tezoatl', ''),
(1561, 20, '549', 'Heroica Villa Tezoatl', ''),
(1562, 20, '549', 'Heroica Villa Tezoatl', ''),
(1563, 20, '549', 'Heroica Villa Tezoatl', ''),
(1564, 20, '549', 'Heroica Villa Tezoatl', ''),
(1565, 20, '549', 'Heroica Villa Tezoatl', ''),
(1566, 20, '549', 'Heroica Villa Tezoatl', ''),
(1567, 20, '549', 'Heroica Villa Tezoatl', ''),
(1568, 20, '549', 'Heroica Villa Tezoatl', ''),
(1569, 20, '549', 'Heroica Villa Tezoatl', ''),
(1570, 20, '549', 'Heroica Villa Tezoatl', ''),
(1571, 20, '549', 'Heroica Villa Tezoatl', ''),
(1572, 20, '549', 'Heroica Villa Tezoatl', ''),
(1573, 20, '549', 'Heroica Villa Tezoatl', ''),
(1574, 20, '549', 'Heroica Villa Tezoatl', ''),
(1575, 20, '549', 'Heroica Villa Tezoatl', ''),
(1576, 20, '549', 'Heroica Villa Tezoatl', ''),
(1577, 20, '549', 'Heroica Villa Tezoatl', ''),
(1578, 20, '549', 'Heroica Villa Tezoatl', ''),
(1579, 20, '549', 'Heroica Villa Tezoatl', ''),
(1580, 20, '549', 'Heroica Villa Tezoatl', ''),
(1581, 20, '549', 'Heroica Villa Tezoatl', ''),
(1582, 20, '549', 'Heroica Villa Tezoatl', ''),
(1583, 20, '550', 'San Jer', ''),
(1584, 20, '551', 'Tlacolula de Matamoros', ''),
(1585, 20, '552', 'Tlacotepec Plumas', ''),
(1586, 20, '553', 'Tlalixtac de Cabrera', ''),
(1587, 20, '554', 'Totontepec Villa de Morelos', ''),
(1588, 20, '555', 'Trinidad Zaachila', ''),
(1589, 20, '556', 'La Trinidad Vista Hermosa', ''),
(1590, 20, '557', 'Uni', ''),
(1591, 20, '558', 'Valerio Trujano', ''),
(1592, 20, '559', 'San Juan Bautista Valle Nacional', ''),
(1593, 20, '560', 'Villa D', ''),
(1594, 20, '561', 'Yaxe', ''),
(1595, 20, '562', 'Magdalena Yodocono de Porfirio D', ''),
(1596, 20, '563', 'Yogana', ''),
(1597, 20, '564', 'Yutanduchi de Guerrero', ''),
(1598, 20, '565', 'Villa de Zaachila', ''),
(1599, 20, '566', 'San Mateo Yucutind', ''),
(1600, 20, '567', 'Zapotitl', ''),
(1601, 20, '568', 'Zapotitl', ''),
(1602, 20, '569', 'Santa In', ''),
(1603, 20, '570', 'Zimatl', ''),
(1604, 21, '001', 'Acajete', ''),
(1605, 21, '002', 'Acateno', ''),
(1606, 21, '003', 'Acatl', ''),
(1607, 21, '004', 'Acatzingo', ''),
(1608, 21, '005', 'Acteopan', ''),
(1609, 21, '006', 'Ahuacatl', ''),
(1610, 21, '007', 'Ahuatl', ''),
(1611, 21, '008', 'Ahuazotepec', ''),
(1612, 21, '009', 'Ahuehuetitla', ''),
(1613, 21, '010', 'Ajalpan', ''),
(1614, 21, '011', 'Albino Zertuche', ''),
(1615, 21, '012', 'Aljojuca', ''),
(1616, 21, '013', 'Altepexi', ''),
(1617, 21, '014', 'Amixtl', ''),
(1618, 21, '015', 'Amozoc', ''),
(1619, 21, '016', 'Aquixtla', ''),
(1620, 21, '017', 'Atempan', ''),
(1621, 21, '018', 'Atexcal', ''),
(1622, 21, '019', 'Atlixco', ''),
(1623, 21, '020', 'Atoyatempan', ''),
(1624, 21, '021', 'Atzala', ''),
(1625, 21, '022', 'Atzitzihuac', ''),
(1626, 21, '023', 'Atzitzintla', ''),
(1627, 21, '024', 'Axutla', ''),
(1628, 21, '025', 'Ayotoxco de Guerrero', ''),
(1629, 21, '026', 'Calpan', ''),
(1630, 21, '027', 'Caltepec', ''),
(1631, 21, '028', 'Camocuautla', ''),
(1632, 21, '029', 'Caxhuacan', ''),
(1633, 21, '030', 'Coatepec', ''),
(1634, 21, '031', 'Coatzingo', ''),
(1635, 21, '032', 'Cohetzala', ''),
(1636, 21, '033', 'Cohuecan', ''),
(1637, 21, '034', 'Coronango', ''),
(1638, 21, '035', 'Coxcatl', ''),
(1639, 21, '036', 'Coyomeapan', ''),
(1640, 21, '037', 'Coyotepec', ''),
(1641, 21, '038', 'Cuapiaxtla de Madero', ''),
(1642, 21, '039', 'Cuautempan', ''),
(1643, 21, '040', 'Cuautinch', ''),
(1644, 21, '041', 'Cuautlancingo', ''),
(1645, 21, '042', 'Cuayuca de Andrade', ''),
(1646, 21, '043', 'Cuetzalan del Progreso', ''),
(1647, 21, '044', 'Cuyoaco', ''),
(1648, 21, '045', 'Chalchicomula de Sesma', ''),
(1649, 21, '046', 'Chapulco', ''),
(1650, 21, '047', 'Chiautla', ''),
(1651, 21, '048', 'Chiautzingo', ''),
(1652, 21, '049', 'Chiconcuautla', ''),
(1653, 21, '050', 'Chichiquila', ''),
(1654, 21, '051', 'Chietla', ''),
(1655, 21, '052', 'Chigmecatitl', ''),
(1656, 21, '053', 'Chignahuapan', ''),
(1657, 21, '054', 'Chignautla', ''),
(1658, 21, '055', 'Chila', ''),
(1659, 21, '056', 'Chila de la Sal', ''),
(1660, 21, '057', 'Honey', ''),
(1661, 21, '058', 'Chilchotla', ''),
(1662, 21, '059', 'Chinantla', ''),
(1663, 21, '060', 'Domingo Arenas', ''),
(1664, 21, '061', 'Eloxochitl', ''),
(1665, 21, '062', 'Epatl', ''),
(1666, 21, '063', 'Esperanza', ''),
(1667, 21, '064', 'Francisco Z. Mena', ''),
(1668, 21, '065', 'General Felipe ', ''),
(1669, 21, '066', 'Guadalupe', ''),
(1670, 21, '067', 'Guadalupe Victoria', ''),
(1671, 21, '068', 'Hermenegildo Galeana', ''),
(1672, 21, '069', 'Huaquechula', ''),
(1673, 21, '070', 'Huatlatlauca', ''),
(1674, 21, '071', 'Huauchinango', ''),
(1675, 21, '072', 'Huehuetla', ''),
(1676, 21, '073', 'Huehuetl', ''),
(1677, 21, '074', 'Huejotzingo', ''),
(1678, 21, '075', 'Hueyapan', ''),
(1679, 21, '076', 'Hueytamalco', ''),
(1680, 21, '077', 'Hueytlalpan', ''),
(1681, 21, '078', 'Huitzilan de Serd', ''),
(1682, 21, '079', 'Huitziltepec', ''),
(1683, 21, '080', 'Atlequizayan', ''),
(1684, 21, '081', 'Ixcamilpa de Guerrero', ''),
(1685, 21, '082', 'Ixcaquixtla', ''),
(1686, 21, '083', 'Ixtacamaxtitl', ''),
(1687, 21, '084', 'Ixtepec', ''),
(1688, 21, '085', 'Iz', ''),
(1689, 21, '086', 'Jalpan', ''),
(1690, 21, '087', 'Jolalpan', ''),
(1691, 21, '088', 'Jonotla', ''),
(1692, 21, '089', 'Jopala', ''),
(1693, 21, '090', 'Juan C. Bonilla', ''),
(1694, 21, '091', 'Juan Galindo', ''),
(1695, 21, '092', 'Juan N. M', ''),
(1696, 21, '093', 'Lafragua', ''),
(1697, 21, '094', 'Libres', ''),
(1698, 21, '095', 'La Magdalena Tlatlauquitepec', ''),
(1699, 21, '096', 'Mazapiltepec de Ju', ''),
(1700, 21, '097', 'Mixtla', ''),
(1701, 21, '098', 'Molcaxac', ''),
(1702, 21, '099', 'Ca', ''),
(1703, 21, '100', 'Naupan', ''),
(1704, 21, '101', 'Nauzontla', ''),
(1705, 21, '102', 'Nealtican', ''),
(1706, 21, '103', 'Nicol', ''),
(1707, 21, '104', 'Nopalucan', ''),
(1708, 21, '105', 'Ocotepec', ''),
(1709, 21, '106', 'Ocoyucan', ''),
(1710, 21, '107', 'Olintla', ''),
(1711, 21, '108', 'Oriental', ''),
(1712, 21, '109', 'Pahuatl', ''),
(1713, 21, '110', 'Palmar de Bravo', ''),
(1714, 21, '111', 'Pantepec', ''),
(1715, 21, '112', 'Petlalcingo', ''),
(1716, 21, '113', 'Piaxtla', ''),
(1717, 21, '114', 'Puebla', ''),
(1718, 21, '115', 'Quecholac', ''),
(1719, 21, '116', 'Quimixtl', ''),
(1720, 21, '117', 'Rafael Lara Grajales', ''),
(1721, 21, '118', 'Los Reyes de Ju', ''),
(1722, 21, '119', 'San Andr', ''),
(1723, 21, '120', 'San Antonio Ca', ''),
(1724, 21, '121', 'San Diego la Mesa Tochimiltzingo', ''),
(1725, 21, '122', 'San Felipe Teotlalcingo', ''),
(1726, 21, '123', 'San Felipe Tepatl', ''),
(1727, 21, '124', 'San Gabriel Chilac', ''),
(1728, 21, '125', 'San Gregorio Atzompa', ''),
(1729, 21, '126', 'San Jer', ''),
(1730, 21, '127', 'San Jer', ''),
(1731, 21, '128', 'San Jos', ''),
(1732, 21, '129', 'San Jos', ''),
(1733, 21, '130', 'San Juan Atenco', ''),
(1734, 21, '131', 'San Juan Atzompa', ''),
(1735, 21, '132', 'San Mart', ''),
(1736, 21, '133', 'San Mart', ''),
(1737, 21, '134', 'San Mat', ''),
(1738, 21, '135', 'San Miguel Ixitl', ''),
(1739, 21, '136', 'San Miguel Xoxtla', ''),
(1740, 21, '137', 'San Nicol', ''),
(1741, 21, '138', 'San Nicol', ''),
(1742, 21, '139', 'San Pablo Anicano', ''),
(1743, 21, '140', 'San Pedro Cholula', ''),
(1744, 21, '141', 'San Pedro Yeloixtlahuaca', ''),
(1745, 21, '142', 'San Salvador el Seco', ''),
(1746, 21, '143', 'San Salvador el Verde', ''),
(1747, 21, '144', 'San Salvador Huixcolotla', ''),
(1748, 21, '145', 'San Sebasti', ''),
(1749, 21, '146', 'Santa Catarina Tlaltempan', ''),
(1750, 21, '147', 'Santa In', ''),
(1751, 21, '148', 'Santa Isabel Cholula', ''),
(1752, 21, '149', 'Santiago Miahuatl', ''),
(1753, 21, '150', 'Huehuetl', ''),
(1754, 21, '151', 'Santo Tom', ''),
(1755, 21, '152', 'Soltepec', ''),
(1756, 21, '153', 'Tecali de Herrera', ''),
(1757, 21, '154', 'Tecamachalco', ''),
(1758, 21, '155', 'Tecomatl', ''),
(1759, 21, '156', 'Tehuac', ''),
(1760, 21, '157', 'Tehuitzingo', ''),
(1761, 21, '158', 'Tenampulco', ''),
(1762, 21, '159', 'Teopantl', ''),
(1763, 21, '160', 'Teotlalco', ''),
(1764, 21, '161', 'Tepanco de L', ''),
(1765, 21, '162', 'Tepango de Rodr', ''),
(1766, 21, '163', 'Tepatlaxco de Hidalgo', ''),
(1767, 21, '164', 'Tepeaca', ''),
(1768, 21, '165', 'Tepemaxalco', ''),
(1769, 21, '166', 'Tepeojuma', ''),
(1770, 21, '167', 'Tepetzintla', ''),
(1771, 21, '168', 'Tepexco', ''),
(1772, 21, '169', 'Tepexi de Rodr', ''),
(1773, 21, '170', 'Tepeyahualco', ''),
(1774, 21, '171', 'Tepeyahualco de Cuauht', ''),
(1775, 21, '172', 'Tetela de Ocampo', ''),
(1776, 21, '173', 'Teteles de Avila Castillo', ''),
(1777, 21, '174', 'Teziutl', ''),
(1778, 21, '175', 'Tianguismanalco', ''),
(1779, 21, '176', 'Tilapa', ''),
(1780, 21, '177', 'Tlacotepec de Benito Ju', ''),
(1781, 21, '178', 'Tlacuilotepec', ''),
(1782, 21, '179', 'Tlachichuca', ''),
(1783, 21, '180', 'Tlahuapan', ''),
(1784, 21, '181', 'Tlaltenango', ''),
(1785, 21, '182', 'Tlanepantla', ''),
(1786, 21, '183', 'Tlaola', ''),
(1787, 21, '184', 'Tlapacoya', ''),
(1788, 21, '185', 'Tlapanal', ''),
(1789, 21, '186', 'Tlatlauquitepec', ''),
(1790, 21, '187', 'Tlaxco', ''),
(1791, 21, '188', 'Tochimilco', ''),
(1792, 21, '189', 'Tochtepec', ''),
(1793, 21, '190', 'Totoltepec de Guerrero', ''),
(1794, 21, '191', 'Tulcingo', ''),
(1795, 21, '192', 'Tuzamapan de Galeana', ''),
(1796, 21, '193', 'Tzicatlacoyan', ''),
(1797, 21, '194', 'Venustiano Carranza', ''),
(1798, 21, '195', 'Vicente Guerrero', ''),
(1799, 21, '196', 'Xayacatl', ''),
(1800, 21, '197', 'Xicotepec', ''),
(1801, 21, '198', 'Xicotl', ''),
(1802, 21, '199', 'Xiutetelco', ''),
(1803, 21, '200', 'Xochiapulco', ''),
(1804, 21, '201', 'Xochiltepec', ''),
(1805, 21, '202', 'Xochitl', ''),
(1806, 21, '203', 'Xochitl', ''),
(1807, 21, '204', 'Yaon', ''),
(1808, 21, '205', 'Yehualtepec', ''),
(1809, 21, '206', 'Zacapala', ''),
(1810, 21, '207', 'Zacapoaxtla', ''),
(1811, 21, '208', 'Zacatl', ''),
(1812, 21, '209', 'Zapotitl', ''),
(1813, 21, '210', 'Zapotitl', ''),
(1814, 21, '211', 'Zaragoza', ''),
(1815, 21, '212', 'Zautla', ''),
(1816, 21, '213', 'Zihuateutla', ''),
(1817, 21, '214', 'Zinacatepec', ''),
(1818, 21, '215', 'Zongozotla', ''),
(1819, 21, '216', 'Zoquiapan', ''),
(1820, 21, '217', 'Zoquitl', ''),
(1821, 22, '001', 'Amealco de Bonfil', ''),
(1822, 22, '002', 'Pinal de Amoles', ''),
(1823, 22, '003', 'Arroyo Seco', ''),
(1824, 22, '004', 'Cadereyta de Montes', ''),
(1825, 22, '005', 'Col', ''),
(1826, 22, '006', 'Corregidora', ''),
(1827, 22, '007', 'Ezequiel Montes', ''),
(1828, 22, '008', 'Huimilpan', ''),
(1829, 22, '009', 'Jalpan de Serra', ''),
(1830, 22, '010', 'Landa de Matamoros', ''),
(1831, 22, '011', 'El Marqu', ''),
(1832, 22, '012', 'Pedro Escobedo', ''),
(1833, 22, '013', 'Pe', ''),
(1834, 22, '014', 'Quer', ''),
(1835, 22, '015', 'San Joaqu', ''),
(1836, 22, '016', 'San Juan del R', ''),
(1837, 22, '017', 'Tequisquiapan', ''),
(1838, 22, '018', 'Tolim', ''),
(1839, 23, '001', 'Cozumel', ''),
(1840, 23, '002', 'Felipe Carrillo Puerto', ''),
(1841, 23, '003', 'Isla Mujeres', ''),
(1842, 23, '004', 'Oth', ''),
(1843, 23, '005', 'Benito Ju', ''),
(1844, 23, '006', 'Jos', ''),
(1845, 23, '007', 'L', ''),
(1846, 23, '008', 'Solidaridad', ''),
(1847, 23, '009', 'Tulum', ''),
(1848, 23, '010', 'Bacalar', ''),
(1849, 24, '001', 'Ahualulco', ''),
(1850, 24, '002', 'Alaquines', ''),
(1851, 24, '003', 'Aquism', ''),
(1852, 24, '004', 'Armadillo de los Infante', ''),
(1853, 24, '005', 'C', ''),
(1854, 24, '006', 'Catorce', ''),
(1855, 24, '007', 'Cedral', ''),
(1856, 24, '008', 'Cerritos', ''),
(1857, 24, '009', 'Cerro de San Pedro', ''),
(1858, 24, '010', 'Ciudad del Ma', ''),
(1859, 24, '011', 'Ciudad Fern', ''),
(1860, 24, '012', 'Tancanhuitz', ''),
(1861, 24, '013', 'Ciudad Valles', ''),
(1862, 24, '014', 'Coxcatl', ''),
(1863, 24, '015', 'Charcas', ''),
(1864, 24, '016', 'Ebano', ''),
(1865, 24, '017', 'Guadalc', ''),
(1866, 24, '018', 'Huehuetl', ''),
(1867, 24, '019', 'Lagunillas', ''),
(1868, 24, '020', 'Matehuala', ''),
(1869, 24, '021', 'Mexquitic de Carmona', ''),
(1870, 24, '022', 'Moctezuma', ''),
(1871, 24, '023', 'Ray', ''),
(1872, 24, '024', 'Rioverde', ''),
(1873, 24, '025', 'Salinas', ''),
(1874, 24, '026', 'San Antonio', ''),
(1875, 24, '027', 'San Ciro de Acosta', ''),
(1876, 24, '028', 'San Luis Potos', ''),
(1877, 24, '029', 'San Mart', ''),
(1878, 24, '030', 'San Nicol', ''),
(1879, 24, '031', 'Santa Catarina', ''),
(1880, 24, '032', 'Santa Mar', ''),
(1881, 24, '033', 'Santo Domingo', ''),
(1882, 24, '034', 'San Vicente Tancuayalab', ''),
(1883, 24, '035', 'Soledad de Graciano S', ''),
(1884, 24, '036', 'Tamasopo', ''),
(1885, 24, '037', 'Tamazunchale', ''),
(1886, 24, '038', 'Tampac', ''),
(1887, 24, '039', 'Tampamol', ''),
(1888, 24, '040', 'Tamu', ''),
(1889, 24, '041', 'Tanlaj', ''),
(1890, 24, '042', 'Tanqui', ''),
(1891, 24, '043', 'Tierra Nueva', ''),
(1892, 24, '044', 'Vanegas', ''),
(1893, 24, '045', 'Venado', ''),
(1894, 24, '046', 'Villa de Arriaga', ''),
(1895, 24, '047', 'Villa de Guadalupe', ''),
(1896, 24, '048', 'Villa de la Paz', ''),
(1897, 24, '049', 'Villa de Ramos', ''),
(1898, 24, '050', 'Villa de Reyes', ''),
(1899, 24, '051', 'Villa Hidalgo', ''),
(1900, 24, '052', 'Villa Ju', ''),
(1901, 24, '053', 'Axtla de Terrazas', ''),
(1902, 24, '054', 'Xilitla', ''),
(1903, 24, '055', 'Zaragoza', ''),
(1904, 24, '056', 'Villa de Arista', ''),
(1905, 24, '057', 'Matlapa', ''),
(1906, 24, '058', 'El Naranjo', ''),
(1907, 25, '001', 'Ahome', ''),
(1908, 25, '002', 'Angostura', ''),
(1909, 25, '003', 'Badiraguato', ''),
(1910, 25, '004', 'Concordia', ''),
(1911, 25, '005', 'Cosal', ''),
(1912, 25, '006', 'Culiac', ''),
(1913, 25, '007', 'Choix', ''),
(1914, 25, '008', 'Elota', ''),
(1915, 25, '009', 'Escuinapa', ''),
(1916, 25, '010', 'El Fuerte', ''),
(1917, 25, '011', 'Guasave', ''),
(1918, 25, '012', 'Mazatl', ''),
(1919, 25, '013', 'Mocorito', ''),
(1920, 25, '014', 'Rosario', ''),
(1921, 25, '015', 'Salvador Alvarado', ''),
(1922, 25, '016', 'San Ignacio', ''),
(1923, 25, '017', 'Sinaloa', ''),
(1924, 25, '018', 'Navolato', ''),
(1925, 26, '001', 'Aconchi', ''),
(1926, 26, '002', 'Agua Prieta', ''),
(1927, 26, '003', 'Alamos', ''),
(1928, 26, '004', 'Altar', ''),
(1929, 26, '005', 'Arivechi', ''),
(1930, 26, '006', 'Arizpe', ''),
(1931, 26, '007', 'Atil', ''),
(1932, 26, '008', 'Bacad', ''),
(1933, 26, '009', 'Bacanora', ''),
(1934, 26, '010', 'Bacerac', ''),
(1935, 26, '011', 'Bacoachi', ''),
(1936, 26, '012', 'B', ''),
(1937, 26, '013', 'Ban', ''),
(1938, 26, '014', 'Bavi', ''),
(1939, 26, '015', 'Bavispe', ''),
(1940, 26, '016', 'Benjam', ''),
(1941, 26, '017', 'Caborca', ''),
(1942, 26, '018', 'Cajeme', ''),
(1943, 26, '019', 'Cananea', ''),
(1944, 26, '020', 'Carb', ''),
(1945, 26, '021', 'La Colorada', ''),
(1946, 26, '022', 'Cucurpe', ''),
(1947, 26, '023', 'Cumpas', ''),
(1948, 26, '024', 'Divisaderos', ''),
(1949, 26, '025', 'Empalme', ''),
(1950, 26, '026', 'Etchojoa', ''),
(1951, 26, '027', 'Fronteras', ''),
(1952, 26, '028', 'Granados', ''),
(1953, 26, '029', 'Guaymas', ''),
(1954, 26, '030', 'Hermosillo', ''),
(1955, 26, '031', 'Huachinera', ''),
(1956, 26, '032', 'Hu', ''),
(1957, 26, '033', 'Huatabampo', ''),
(1958, 26, '034', 'Hu', ''),
(1959, 26, '035', 'Imuris', ''),
(1960, 26, '036', 'Magdalena', ''),
(1961, 26, '037', 'Mazat', ''),
(1962, 26, '038', 'Moctezuma', ''),
(1963, 26, '039', 'Naco', ''),
(1964, 26, '040', 'N', ''),
(1965, 26, '041', 'Nacozari de Garc', ''),
(1966, 26, '042', 'Navojoa', ''),
(1967, 26, '043', 'Nogales', ''),
(1968, 26, '044', 'Onavas', ''),
(1969, 26, '045', 'Opodepe', ''),
(1970, 26, '046', 'Oquitoa', ''),
(1971, 26, '047', 'Pitiquito', ''),
(1972, 26, '048', 'Puerto Pe', ''),
(1973, 26, '049', 'Quiriego', ''),
(1974, 26, '050', 'Ray', ''),
(1975, 26, '051', 'Rosario', ''),
(1976, 26, '052', 'Sahuaripa', ''),
(1977, 26, '053', 'San Felipe de Jes', ''),
(1978, 26, '054', 'San Javier', ''),
(1979, 26, '055', 'San Luis R', ''),
(1980, 26, '056', 'San Miguel de Horcasitas', ''),
(1981, 26, '057', 'San Pedro de la Cueva', ''),
(1982, 26, '058', 'Santa Ana', ''),
(1983, 26, '059', 'Santa Cruz', ''),
(1984, 26, '060', 'S', ''),
(1985, 26, '061', 'Soyopa', ''),
(1986, 26, '062', 'Suaqui Grande', ''),
(1987, 26, '063', 'Tepache', ''),
(1988, 26, '064', 'Trincheras', ''),
(1989, 26, '065', 'Tubutama', ''),
(1990, 26, '066', 'Ures', ''),
(1991, 26, '067', 'Villa Hidalgo', ''),
(1992, 26, '068', 'Villa Pesqueira', ''),
(1993, 26, '069', 'Y', ''),
(1994, 26, '070', 'General Plutarco El', ''),
(1995, 26, '071', 'Benito Ju', ''),
(1996, 26, '072', 'San Ignacio R', ''),
(1997, 27, '001', 'Balanc', ''),
(1998, 27, '002', 'C', ''),
(1999, 27, '003', 'Centla', ''),
(2000, 27, '004', 'Centro', ''),
(2001, 27, '005', 'Comalcalco', ''),
(2002, 27, '006', 'Cunduac', ''),
(2003, 27, '007', 'Emiliano Zapata', ''),
(2004, 27, '008', 'Huimanguillo', ''),
(2005, 27, '009', 'Jalapa', ''),
(2006, 27, '010', 'Jalpa de M', ''),
(2007, 27, '011', 'Jonuta', ''),
(2008, 27, '012', 'Macuspana', ''),
(2009, 27, '013', 'Nacajuca', ''),
(2010, 27, '014', 'Para', ''),
(2011, 27, '015', 'Tacotalpa', ''),
(2012, 27, '016', 'Teapa', ''),
(2013, 27, '017', 'Tenosique', ''),
(2014, 28, '001', 'Abasolo', ''),
(2015, 28, '002', 'Aldama', ''),
(2016, 28, '003', 'Altamira', ''),
(2017, 28, '004', 'Antiguo Morelos', ''),
(2018, 28, '005', 'Burgos', ''),
(2019, 28, '006', 'Bustamante', ''),
(2020, 28, '007', 'Camargo', ''),
(2021, 28, '008', 'Casas', ''),
(2022, 28, '009', 'Ciudad Madero', ''),
(2023, 28, '010', 'Cruillas', ''),
(2024, 28, '011', 'G', ''),
(2025, 28, '012', 'Gonz', ''),
(2026, 28, '013', 'G', ''),
(2027, 28, '014', 'Guerrero', ''),
(2028, 28, '015', 'Gustavo D', ''),
(2029, 28, '016', 'Hidalgo', ''),
(2030, 28, '017', 'Jaumave', ''),
(2031, 28, '018', 'Jim', ''),
(2032, 28, '019', 'Llera', ''),
(2033, 28, '020', 'Mainero', ''),
(2034, 28, '021', 'El Mante', ''),
(2035, 28, '022', 'Matamoros', ''),
(2036, 28, '023', 'M', ''),
(2037, 28, '024', 'Mier', ''),
(2038, 28, '025', 'Miguel Alem', ''),
(2039, 28, '026', 'Miquihuana', ''),
(2040, 28, '027', 'Nuevo Laredo', ''),
(2041, 28, '028', 'Nuevo Morelos', ''),
(2042, 28, '029', 'Ocampo', ''),
(2043, 28, '030', 'Padilla', ''),
(2044, 28, '031', 'Palmillas', ''),
(2045, 28, '032', 'Reynosa', ''),
(2046, 28, '033', 'R', ''),
(2047, 28, '034', 'San Carlos', ''),
(2048, 28, '035', 'San Fernando', ''),
(2049, 28, '036', 'San Nicol', ''),
(2050, 28, '037', 'Soto la Marina', ''),
(2051, 28, '038', 'Tampico', ''),
(2052, 28, '039', 'Tula', ''),
(2053, 28, '040', 'Valle Hermoso', ''),
(2054, 28, '041', 'Victoria', ''),
(2055, 28, '042', 'Villagr', ''),
(2056, 28, '043', 'Xicot', ''),
(2057, 29, '001', 'Amaxac de Guerrero', ''),
(2058, 29, '002', 'Apetatitl', ''),
(2059, 29, '003', 'Atlangatepec', ''),
(2060, 29, '004', 'Atltzayanca', ''),
(2061, 29, '005', 'Apizaco', ''),
(2062, 29, '006', 'Calpulalpan', ''),
(2063, 29, '007', 'El Carmen Tequexquitla', ''),
(2064, 29, '008', 'Cuapiaxtla', ''),
(2065, 29, '009', 'Cuaxomulco', ''),
(2066, 29, '010', 'Chiautempan', ''),
(2067, 29, '011', 'Mu', ''),
(2068, 29, '012', 'Espa', ''),
(2069, 29, '013', 'Huamantla', ''),
(2070, 29, '014', 'Hueyotlipan', ''),
(2071, 29, '015', 'Ixtacuixtla de Mariano Matamoros', ''),
(2072, 29, '016', 'Ixtenco', ''),
(2073, 29, '017', 'Mazatecochco de Jos', ''),
(2074, 29, '018', 'Contla de Juan Cuamatzi', ''),
(2075, 29, '019', 'Tepetitla de Lardiz', ''),
(2076, 29, '020', 'Sanct', ''),
(2077, 29, '021', 'Nanacamilpa de Mariano Arista', ''),
(2078, 29, '022', 'Acuamanala de Miguel Hidalgo', ''),
(2079, 29, '023', 'Nat', ''),
(2080, 29, '024', 'Panotla', ''),
(2081, 29, '025', 'San Pablo del Monte', ''),
(2082, 29, '026', 'Santa Cruz Tlaxcala', ''),
(2083, 29, '027', 'Tenancingo', ''),
(2084, 29, '028', 'Teolocholco', ''),
(2085, 29, '029', 'Tepeyanco', ''),
(2086, 29, '030', 'Terrenate', ''),
(2087, 29, '031', 'Tetla de la Solidaridad', ''),
(2088, 29, '032', 'Tetlatlahuca', ''),
(2089, 29, '033', 'Tlaxcala', ''),
(2090, 29, '034', 'Tlaxco', ''),
(2091, 29, '035', 'Tocatl', ''),
(2092, 29, '036', 'Totolac', ''),
(2093, 29, '037', 'Ziltlalt', ''),
(2094, 29, '038', 'Tzompantepec', ''),
(2095, 29, '039', 'Xaloztoc', ''),
(2096, 29, '040', 'Xaltocan', ''),
(2097, 29, '041', 'Papalotla de Xicoht', ''),
(2098, 29, '042', 'Xicohtzinco', ''),
(2099, 29, '043', 'Yauhquemehcan', ''),
(2100, 29, '044', 'Zacatelco', ''),
(2101, 29, '045', 'Benito Ju', ''),
(2102, 29, '046', 'Emiliano Zapata', ''),
(2103, 29, '047', 'L', ''),
(2104, 29, '048', 'La Magdalena Tlaltelulco', ''),
(2105, 29, '049', 'San Dami', ''),
(2106, 29, '050', 'San Francisco Tetlanohcan', ''),
(2107, 29, '051', 'San Jer', ''),
(2108, 29, '052', 'San Jos', ''),
(2109, 29, '053', 'San Juan Huactzinco', ''),
(2110, 29, '054', 'San Lorenzo Axocomanitla', ''),
(2111, 29, '055', 'San Lucas Tecopilco', ''),
(2112, 29, '056', 'Santa Ana Nopalucan', ''),
(2113, 29, '057', 'Santa Apolonia Teacalco', ''),
(2114, 29, '058', 'Santa Catarina Ayometla', ''),
(2115, 29, '059', 'Santa Cruz Quilehtla', ''),
(2116, 29, '060', 'Santa Isabel Xiloxoxtla', ''),
(2117, 30, '001', 'Acajete', ''),
(2118, 30, '002', 'Acatl', ''),
(2119, 30, '003', 'Acayucan', ''),
(2120, 30, '004', 'Actopan', ''),
(2121, 30, '005', 'Acula', ''),
(2122, 30, '006', 'Acultzingo', ''),
(2123, 30, '007', 'Camar', ''),
(2124, 30, '008', 'Alpatl', ''),
(2125, 30, '009', 'Alto Lucero de Guti', ''),
(2126, 30, '010', 'Altotonga', ''),
(2127, 30, '011', 'Alvarado', ''),
(2128, 30, '012', 'Amatitl', ''),
(2129, 30, '013', 'Naranjos Amatl', ''),
(2130, 30, '014', 'Amatl', ''),
(2131, 30, '015', 'Angel R. Cabada', ''),
(2132, 30, '016', 'La Antigua', ''),
(2133, 30, '017', 'Apazapan', ''),
(2134, 30, '018', 'Aquila', ''),
(2135, 30, '019', 'Astacinga', ''),
(2136, 30, '020', 'Atlahuilco', ''),
(2137, 30, '021', 'Atoyac', ''),
(2138, 30, '022', 'Atzacan', ''),
(2139, 30, '023', 'Atzalan', ''),
(2140, 30, '024', 'Tlaltetela', ''),
(2141, 30, '025', 'Ayahualulco', ''),
(2142, 30, '026', 'Banderilla', ''),
(2143, 30, '027', 'Benito Ju', ''),
(2144, 30, '028', 'Boca del R', ''),
(2145, 30, '029', 'Calcahualco', ''),
(2146, 30, '030', 'Camerino Z. Mendoza', ''),
(2147, 30, '031', 'Carrillo Puerto', ''),
(2148, 30, '032', 'Catemaco', ''),
(2149, 30, '033', 'Cazones de Herrera', ''),
(2150, 30, '034', 'Cerro Azul', ''),
(2151, 30, '035', 'Citlalt', ''),
(2152, 30, '036', 'Coacoatzintla', ''),
(2153, 30, '037', 'Coahuitl', ''),
(2154, 30, '038', 'Coatepec', ''),
(2155, 30, '039', 'Coatzacoalcos', ''),
(2156, 30, '040', 'Coatzintla', ''),
(2157, 30, '041', 'Coetzala', ''),
(2158, 30, '042', 'Colipa', ''),
(2159, 30, '043', 'Comapa', ''),
(2160, 30, '044', 'C', ''),
(2161, 30, '045', 'Cosamaloapan de Carpio', ''),
(2162, 30, '046', 'Cosautl', ''),
(2163, 30, '047', 'Coscomatepec', ''),
(2164, 30, '048', 'Cosoleacaque', ''),
(2165, 30, '049', 'Cotaxtla', ''),
(2166, 30, '050', 'Coxquihui', ''),
(2167, 30, '051', 'Coyutla', ''),
(2168, 30, '052', 'Cuichapa', ''),
(2169, 30, '053', 'Cuitl', ''),
(2170, 30, '054', 'Chacaltianguis', ''),
(2171, 30, '055', 'Chalma', ''),
(2172, 30, '056', 'Chiconamel', ''),
(2173, 30, '057', 'Chiconquiaco', ''),
(2174, 30, '058', 'Chicontepec', ''),
(2175, 30, '059', 'Chinameca', ''),
(2176, 30, '060', 'Chinampa de Gorostiza', ''),
(2177, 30, '061', 'Las Choapas', ''),
(2178, 30, '062', 'Chocam', ''),
(2179, 30, '063', 'Chontla', ''),
(2180, 30, '064', 'Chumatl', ''),
(2181, 30, '065', 'Emiliano Zapata', ''),
(2182, 30, '066', 'Espinal', ''),
(2183, 30, '067', 'Filomeno Mata', ''),
(2184, 30, '068', 'Fort', ''),
(2185, 30, '069', 'Guti', ''),
(2186, 30, '070', 'Hidalgotitl', ''),
(2187, 30, '071', 'Huatusco', ''),
(2188, 30, '072', 'Huayacocotla', ''),
(2189, 30, '073', 'Hueyapan de Ocampo', ''),
(2190, 30, '074', 'Huiloapan de Cuauht', ''),
(2191, 30, '075', 'Ignacio de la Llave', ''),
(2192, 30, '076', 'Ilamatl', ''),
(2193, 30, '077', 'Isla', ''),
(2194, 30, '078', 'Ixcatepec', ''),
(2195, 30, '079', 'Ixhuac', ''),
(2196, 30, '080', 'Ixhuatl', ''),
(2197, 30, '081', 'Ixhuatlancillo', ''),
(2198, 30, '082', 'Ixhuatl', ''),
(2199, 30, '083', 'Ixhuatl', ''),
(2200, 30, '084', 'Ixmatlahuacan', ''),
(2201, 30, '085', 'Ixtaczoquitl', ''),
(2202, 30, '086', 'Jalacingo', ''),
(2203, 30, '087', 'Xalapa', ''),
(2204, 30, '088', 'Jalcomulco', ''),
(2205, 30, '089', 'J', ''),
(2206, 30, '090', 'Jamapa', ''),
(2207, 30, '091', 'Jes', ''),
(2208, 30, '092', 'Xico', ''),
(2209, 30, '093', 'Jilotepec', ''),
(2210, 30, '094', 'Juan Rodr', ''),
(2211, 30, '095', 'Juchique de Ferrer', ''),
(2212, 30, '096', 'Landero y Coss', ''),
(2213, 30, '097', 'Lerdo de Tejada', ''),
(2214, 30, '098', 'Magdalena', ''),
(2215, 30, '099', 'Maltrata', ''),
(2216, 30, '100', 'Manlio Fabio Altamirano', ''),
(2217, 30, '101', 'Mariano Escobedo', ''),
(2218, 30, '102', 'Mart', ''),
(2219, 30, '103', 'Mecatl', ''),
(2220, 30, '104', 'Mecayapan', ''),
(2221, 30, '105', 'Medell', ''),
(2222, 30, '106', 'Miahuatl', ''),
(2223, 30, '107', 'Las Minas', ''),
(2224, 30, '108', 'Minatitl', ''),
(2225, 30, '109', 'Misantla', ''),
(2226, 30, '110', 'Mixtla de Altamirano', ''),
(2227, 30, '111', 'Moloac', ''),
(2228, 30, '112', 'Naolinco', ''),
(2229, 30, '113', 'Naranjal', ''),
(2230, 30, '114', 'Nautla', ''),
(2231, 30, '115', 'Nogales', ''),
(2232, 30, '116', 'Oluta', ''),
(2233, 30, '117', 'Omealca', ''),
(2234, 30, '118', 'Orizaba', ''),
(2235, 30, '119', 'Otatitl', ''),
(2236, 30, '120', 'Oteapan', ''),
(2237, 30, '121', 'Ozuluama de Mascare', ''),
(2238, 30, '122', 'Pajapan', ''),
(2239, 30, '123', 'P', ''),
(2240, 30, '124', 'Papantla', ''),
(2241, 30, '125', 'Paso del Macho', ''),
(2242, 30, '126', 'Paso de Ovejas', ''),
(2243, 30, '127', 'La Perla', ''),
(2244, 30, '128', 'Perote', ''),
(2245, 30, '129', 'Plat', ''),
(2246, 30, '130', 'Playa Vicente', ''),
(2247, 30, '131', 'Poza Rica de Hidalgo', ''),
(2248, 30, '132', 'Las Vigas de Ram', ''),
(2249, 30, '133', 'Pueblo Viejo', ''),
(2250, 30, '134', 'Puente Nacional', ''),
(2251, 30, '135', 'Rafael Delgado', ''),
(2252, 30, '136', 'Rafael Lucio', ''),
(2253, 30, '137', 'Los Reyes', ''),
(2254, 30, '138', 'R', ''),
(2255, 30, '139', 'Saltabarranca', ''),
(2256, 30, '140', 'San Andr', ''),
(2257, 30, '141', 'San Andr', ''),
(2258, 30, '142', 'San Juan Evangelista', ''),
(2259, 30, '143', 'Santiago Tuxtla', ''),
(2260, 30, '144', 'Sayula de Alem', ''),
(2261, 30, '145', 'Soconusco', ''),
(2262, 30, '146', 'Sochiapa', ''),
(2263, 30, '147', 'Soledad Atzompa', ''),
(2264, 30, '148', 'Soledad de Doblado', ''),
(2265, 30, '149', 'Soteapan', ''),
(2266, 30, '150', 'Tamal', ''),
(2267, 30, '151', 'Tamiahua', ''),
(2268, 30, '152', 'Tampico Alto', ''),
(2269, 30, '153', 'Tancoco', ''),
(2270, 30, '154', 'Tantima', ''),
(2271, 30, '155', 'Tantoyuca', ''),
(2272, 30, '156', 'Tatatila', ''),
(2273, 30, '157', 'Castillo de Teayo', ''),
(2274, 30, '158', 'Tecolutla', ''),
(2275, 30, '159', 'Tehuipango', ''),
(2276, 30, '160', '', ''),
(2277, 30, '161', 'Tempoal', ''),
(2278, 30, '162', 'Tenampa', ''),
(2279, 30, '163', 'Tenochtitl', ''),
(2280, 30, '164', 'Teocelo', ''),
(2281, 30, '165', 'Tepatlaxco', ''),
(2282, 30, '166', 'Tepetl', ''),
(2283, 30, '167', 'Tepetzintla', ''),
(2284, 30, '168', 'Tequila', ''),
(2285, 30, '169', 'Jos', ''),
(2286, 30, '170', 'Texcatepec', ''),
(2287, 30, '171', 'Texhuac', ''),
(2288, 30, '172', 'Texistepec', ''),
(2289, 30, '173', 'Tezonapa', ''),
(2290, 30, '174', 'Tierra Blanca', ''),
(2291, 30, '175', 'Tihuatl', ''),
(2292, 30, '176', 'Tlacojalpan', ''),
(2293, 30, '177', 'Tlacolulan', ''),
(2294, 30, '178', 'Tlacotalpan', ''),
(2295, 30, '179', 'Tlacotepec de Mej', ''),
(2296, 30, '180', 'Tlachichilco', ''),
(2297, 30, '181', 'Tlalixcoyan', ''),
(2298, 30, '182', 'Tlalnelhuayocan', ''),
(2299, 30, '183', 'Tlapacoyan', ''),
(2300, 30, '184', 'Tlaquilpa', ''),
(2301, 30, '185', 'Tlilapan', ''),
(2302, 30, '186', 'Tomatl', ''),
(2303, 30, '187', 'Tonay', ''),
(2304, 30, '188', 'Totutla', ''),
(2305, 30, '189', 'Tuxpan', ''),
(2306, 30, '190', 'Tuxtilla', ''),
(2307, 30, '191', 'Ursulo Galv', ''),
(2308, 30, '192', 'Vega de Alatorre', ''),
(2309, 30, '193', 'Veracruz', ''),
(2310, 30, '194', 'Villa Aldama', ''),
(2311, 30, '195', 'Xoxocotla', ''),
(2312, 30, '196', 'Yanga', ''),
(2313, 30, '197', 'Yecuatla', ''),
(2314, 30, '198', 'Zacualpan', ''),
(2315, 30, '199', 'Zaragoza', ''),
(2316, 30, '200', 'Zentla', ''),
(2317, 30, '201', 'Zongolica', ''),
(2318, 30, '202', 'Zontecomatl', ''),
(2319, 30, '203', 'Zozocolco de Hidalgo', ''),
(2320, 30, '204', 'Agua Dulce', ''),
(2321, 30, '205', 'El Higo', ''),
(2322, 30, '206', 'Nanchital de L', ''),
(2323, 30, '207', 'Tres Valles', ''),
(2324, 30, '208', 'Carlos A. Carrillo', ''),
(2325, 30, '209', 'Tatahuicapan de Ju', ''),
(2326, 30, '210', 'Uxpanapa', ''),
(2327, 30, '211', 'San Rafael', ''),
(2328, 30, '212', 'Santiago Sochiapan', ''),
(2329, 31, '001', 'Abal', ''),
(2330, 31, '002', 'Acanceh', ''),
(2331, 31, '003', 'Akil', ''),
(2332, 31, '004', 'Baca', ''),
(2333, 31, '005', 'Bokob', ''),
(2334, 31, '006', 'Buctzotz', ''),
(2335, 31, '007', 'Cacalch', ''),
(2336, 31, '008', 'Calotmul', ''),
(2337, 31, '009', 'Cansahcab', ''),
(2338, 31, '010', 'Cantamayec', ''),
(2339, 31, '011', 'Celest', ''),
(2340, 31, '012', 'Cenotillo', ''),
(2341, 31, '013', 'Conkal', ''),
(2342, 31, '014', 'Cuncunul', ''),
(2343, 31, '015', 'Cuzam', ''),
(2344, 31, '016', 'Chacsink', ''),
(2345, 31, '017', 'Chankom', ''),
(2346, 31, '018', 'Chapab', ''),
(2347, 31, '019', 'Chemax', ''),
(2348, 31, '020', 'Chicxulub Pueblo', ''),
(2349, 31, '021', 'Chichimil', ''),
(2350, 31, '022', 'Chikindzonot', ''),
(2351, 31, '023', 'Chochol', ''),
(2352, 31, '024', 'Chumayel', ''),
(2353, 31, '025', 'Dz', ''),
(2354, 31, '026', 'Dzemul', ''),
(2355, 31, '027', 'Dzidzant', ''),
(2356, 31, '028', 'Dzilam de Bravo', ''),
(2357, 31, '029', 'Dzilam Gonz', ''),
(2358, 31, '030', 'Dzit', ''),
(2359, 31, '031', 'Dzoncauich', ''),
(2360, 31, '032', 'Espita', ''),
(2361, 31, '033', 'Halach', ''),
(2362, 31, '034', 'Hocab', ''),
(2363, 31, '035', 'Hoct', ''),
(2364, 31, '036', 'Hom', ''),
(2365, 31, '037', 'Huh', ''),
(2366, 31, '038', 'Hunucm', ''),
(2367, 31, '039', 'Ixil', ''),
(2368, 31, '040', 'Izamal', ''),
(2369, 31, '041', 'Kanas', ''),
(2370, 31, '042', 'Kantunil', ''),
(2371, 31, '043', 'Kaua', ''),
(2372, 31, '044', 'Kinchil', ''),
(2373, 31, '045', 'Kopom', ''),
(2374, 31, '046', 'Mama', ''),
(2375, 31, '047', 'Man', ''),
(2376, 31, '048', 'Maxcan', ''),
(2377, 31, '049', 'Mayap', ''),
(2378, 31, '050', 'M', ''),
(2379, 31, '051', 'Mococh', ''),
(2380, 31, '052', 'Motul', ''),
(2381, 31, '053', 'Muna', ''),
(2382, 31, '054', 'Muxupip', ''),
(2383, 31, '055', 'Opich', ''),
(2384, 31, '056', 'Oxkutzcab', ''),
(2385, 31, '057', 'Panab', ''),
(2386, 31, '058', 'Peto', ''),
(2387, 31, '059', 'Progreso', ''),
(2388, 31, '060', 'Quintana Roo', ''),
(2389, 31, '061', 'R', ''),
(2390, 31, '062', 'Sacalum', ''),
(2391, 31, '063', 'Samahil', ''),
(2392, 31, '064', 'Sanahcat', ''),
(2393, 31, '065', 'San Felipe', ''),
(2394, 31, '066', 'Santa Elena', ''),
(2395, 31, '067', 'Sey', ''),
(2396, 31, '068', 'Sinanch', ''),
(2397, 31, '069', 'Sotuta', ''),
(2398, 31, '070', 'Sucil', ''),
(2399, 31, '071', 'Sudzal', ''),
(2400, 31, '072', 'Suma', ''),
(2401, 31, '073', 'Tahdzi', ''),
(2402, 31, '074', 'Tahmek', ''),
(2403, 31, '075', 'Teabo', ''),
(2404, 31, '076', 'Tecoh', ''),
(2405, 31, '077', 'Tekal de Venegas', ''),
(2406, 31, '078', 'Tekant', ''),
(2407, 31, '079', 'Tekax', ''),
(2408, 31, '080', 'Tekit', ''),
(2409, 31, '081', 'Tekom', ''),
(2410, 31, '082', 'Telchac Pueblo', ''),
(2411, 31, '083', 'Telchac Puerto', ''),
(2412, 31, '084', 'Temax', ''),
(2413, 31, '085', 'Temoz', ''),
(2414, 31, '086', 'Tepak', ''),
(2415, 31, '087', 'Tetiz', ''),
(2416, 31, '088', 'Teya', ''),
(2417, 31, '089', 'Ticul', ''),
(2418, 31, '090', 'Timucuy', ''),
(2419, 31, '091', 'Tinum', ''),
(2420, 31, '092', 'Tixcacalcupul', ''),
(2421, 31, '093', 'Tixkokob', ''),
(2422, 31, '094', 'Tixmehuac', ''),
(2423, 31, '095', 'Tixp', ''),
(2424, 31, '096', 'Tizim', ''),
(2425, 31, '097', 'Tunk', ''),
(2426, 31, '098', 'Tzucacab', ''),
(2427, 31, '099', 'Uayma', ''),
(2428, 31, '100', 'Uc', ''),
(2429, 31, '101', 'Um', ''),
(2430, 31, '102', 'Valladolid', ''),
(2431, 31, '103', 'Xocchel', ''),
(2432, 31, '104', 'Yaxcab', ''),
(2433, 31, '105', 'Yaxkukul', ''),
(2434, 31, '106', 'Yoba', ''),
(2435, 32, '001', 'Apozol', ''),
(2436, 32, '002', 'Apulco', ''),
(2437, 32, '003', 'Atolinga', ''),
(2438, 32, '004', 'Benito Ju', ''),
(2439, 32, '005', 'Calera', ''),
(2440, 32, '006', 'Ca', ''),
(2441, 32, '007', 'Concepci', ''),
(2442, 32, '008', 'Cuauht', ''),
(2443, 32, '009', 'Chalchihuites', ''),
(2444, 32, '010', 'Fresnillo', ''),
(2445, 32, '011', 'Trinidad Garc', ''),
(2446, 32, '012', 'Genaro Codina', ''),
(2447, 32, '013', 'General Enrique Estrada', ''),
(2448, 32, '014', 'General Francisco R. Murgu', ''),
(2449, 32, '015', 'El Plateado de Joaqu', ''),
(2450, 32, '016', 'General P', ''),
(2451, 32, '017', 'Guadalupe', ''),
(2452, 32, '018', 'Huanusco', ''),
(2453, 32, '019', 'Jalpa', ''),
(2454, 32, '020', 'Jerez', ''),
(2455, 32, '021', 'Jim', ''),
(2456, 32, '022', 'Juan Aldama', ''),
(2457, 32, '023', 'Juchipila', ''),
(2458, 32, '024', 'Loreto', ''),
(2459, 32, '025', 'Luis Moya', ''),
(2460, 32, '026', 'Mazapil', ''),
(2461, 32, '027', 'Melchor Ocampo', ''),
(2462, 32, '028', 'Mezquital del Oro', ''),
(2463, 32, '029', 'Miguel Auza', ''),
(2464, 32, '030', 'Momax', ''),
(2465, 32, '031', 'Monte Escobedo', ''),
(2466, 32, '032', 'Morelos', ''),
(2467, 32, '033', 'Moyahua de Estrada', ''),
(2468, 32, '034', 'Nochistl', ''),
(2469, 32, '035', 'Noria de ', ''),
(2470, 32, '036', 'Ojocaliente', ''),
(2471, 32, '037', 'P', ''),
(2472, 32, '038', 'Pinos', ''),
(2473, 32, '039', 'R', ''),
(2474, 32, '040', 'Sain Alto', ''),
(2475, 32, '041', 'El Salvador', ''),
(2476, 32, '042', 'Sombrerete', ''),
(2477, 32, '043', 'Susticac', ''),
(2478, 32, '044', 'Tabasco', ''),
(2479, 32, '045', 'Tepechitl', ''),
(2480, 32, '046', 'Tepetongo', ''),
(2481, 32, '047', 'Te', ''),
(2482, 32, '048', 'Tlaltenango de S', ''),
(2483, 32, '049', 'Valpara', ''),
(2484, 32, '050', 'Vetagrande', ''),
(2485, 32, '051', 'Villa de Cos', ''),
(2486, 32, '052', 'Villa Garc', ''),
(2487, 32, '053', 'Villa Gonz', ''),
(2488, 32, '054', 'Villa Hidalgo', ''),
(2489, 32, '055', 'Villanueva', ''),
(2490, 32, '056', 'Zacatecas', ''),
(2491, 32, '057', 'Trancoso', ''),
(2492, 32, '058', 'Santa Mar', ''),
(2493, 7, '120', 'Belisario Domínguez', ''),
(2494, 7, '121', 'El Parral', ''),
(2495, 7, '122', 'Mezcalapa', '');

-- --------------------------------------------------------

--
-- Table structure for table `notificacion`
--

CREATE TABLE `notificacion` (
  `notificacionId` int(11) NOT NULL,
  `actividad` text,
  `vista` varchar(255) DEFAULT NULL,
  `hecho` varchar(255) DEFAULT NULL,
  `fecha_aplicacion` datetime DEFAULT NULL,
  `tablas` varchar(255) DEFAULT NULL,
  `enlace` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `folio` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `formato` varchar(20) NOT NULL,
  `aluoper` varchar(15) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `nombrealuoper` varchar(255) NOT NULL,
  `ciclo` varchar(10) DEFAULT NULL,
  `periodoesc` varchar(50) DEFAULT NULL,
  `clavenivel` varchar(100) DEFAULT NULL,
  `nombrenivel` varchar(255) DEFAULT NULL,
  `gradogrupo` varchar(100) DEFAULT NULL,
  `tipoventa` varchar(10) NOT NULL,
  `tipoarticulo` varchar(10) DEFAULT NULL,
  `claveartkit` int(11) DEFAULT NULL,
  `claveconcepto` varchar(20) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `periodo` varchar(10) DEFAULT NULL,
  `periodoletra` varchar(50) DEFAULT NULL,
  `descripcion` text,
  `unidad` varchar(50) DEFAULT NULL,
  `importe` decimal(12,2) NOT NULL,
  `cantidad` decimal(12,2) NOT NULL,
  `cargos` decimal(12,2) NOT NULL,
  `descto` decimal(12,2) NOT NULL,
  `beca` decimal(12,2) NOT NULL,
  `iva` decimal(12,2) NOT NULL,
  `total` decimal(12,2) NOT NULL,
  `costo` decimal(12,2) DEFAULT NULL,
  `comision` decimal(12,2) DEFAULT NULL,
  `efectivo` decimal(12,2) DEFAULT NULL,
  `cambio` decimal(12,2) DEFAULT NULL,
  `pases` int(11) DEFAULT NULL,
  `accesos` int(11) DEFAULT NULL,
  `formapago` varchar(20) NOT NULL,
  `monedero` varchar(10) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `cuenta` varchar(20) DEFAULT NULL,
  `rfcemisor` varchar(13) DEFAULT NULL,
  `uuid` varchar(50) DEFAULT NULL,
  `cadenaxml` text,
  `usuario` varchar(50) NOT NULL,
  `observaciongeneral` text,
  `fechacancelacion` date DEFAULT NULL,
  `usuariocancelacion` varchar(50) DEFAULT NULL,
  `motivocancelacion` text,
  `status` varchar(20) DEFAULT NULL,
  `convertidoa` varchar(20) DEFAULT NULL,
  `usuariomodfecha` varchar(15) DEFAULT NULL,
  `statuscfdi` varchar(20) DEFAULT NULL,
  `refabono` varchar(20) DEFAULT NULL,
  `clavecomision` varchar(20) DEFAULT NULL,
  `importecomision` decimal(12,2) DEFAULT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `operaciontarjeta` varchar(20) DEFAULT NULL,
  `autorizaciontarjeta` varchar(20) DEFAULT NULL,
  `bancoemisortarjeta` varchar(50) DEFAULT NULL,
  `quienautorizatarjeta` varchar(20) DEFAULT NULL,
  `comisiontarjeta` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tipodocoficialtarjeta` varchar(50) DEFAULT NULL,
  `referenciadocoficialtarjeta` varchar(50) DEFAULT NULL,
  `fechacreacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuariomodificacion` varchar(50) DEFAULT NULL,
  `fechamodificacion` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cadenaoriginal` text,
  `fechatimbrado` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `saldo` decimal(12,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pagosadicio`
--

CREATE TABLE `pagosadicio` (
  `id` int(11) NOT NULL,
  `ciclo` varchar(10) NOT NULL,
  `periodo` varchar(50) NOT NULL,
  `clavenivel` varchar(100) NOT NULL,
  `nombrenivel` varchar(255) NOT NULL,
  `gradogrupo` varchar(100) NOT NULL,
  `clavealumno` varchar(20) NOT NULL,
  `claveconcepto` varchar(20) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `periodicidad` smallint(6) NOT NULL,
  `importe` decimal(12,2) NOT NULL,
  `iva` decimal(12,2) NOT NULL,
  `formato` varchar(20) NOT NULL,
  `formapago` varchar(20) NOT NULL,
  `aplicabeca` smallint(6) NOT NULL,
  `unidad` varchar(50) DEFAULT NULL,
  `pagaren` int(11) DEFAULT NULL,
  `pagacada` smallint(6) NOT NULL,
  `pases` int(11) NOT NULL,
  `accesos` int(11) NOT NULL,
  `categoria` varchar(255) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL DEFAULT 'admin',
  `fechacreacion` date DEFAULT NULL,
  `usuariomodificacion` varchar(50) DEFAULT NULL,
  `fechamodificacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pais`
--

CREATE TABLE `pais` (
  `paisId` int(11) NOT NULL DEFAULT '0',
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pais`
--

INSERT INTO `pais` (`paisId`, `nombre`) VALUES
(1, 'MEXICO'),
(2, 'ESTADOS UNIDOS');

-- --------------------------------------------------------

--
-- Table structure for table `parte`
--

CREATE TABLE `parte` (
  `conceptoId` int(11) NOT NULL,
  `cantidad` float(10,2) NOT NULL,
  `unidad` varchar(255) DEFAULT NULL,
  `noIdentificacion` varchar(255) DEFAULT NULL,
  `descripcion` text NOT NULL,
  `valorUnitario` float(10,2) NOT NULL,
  `excentoIva` tinyint(1) NOT NULL DEFAULT '0',
  `importe` float(10,2) NOT NULL,
  `userId` int(11) NOT NULL,
  `empresaId` int(11) NOT NULL,
  `parteId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `paymentId` int(10) NOT NULL,
  `date` date NOT NULL,
  `invoiceId` int(10) NOT NULL,
  `amount` double NOT NULL,
  `paymentMethod` enum('Efectivo','Transferencia','Convenio','Saldo Favor') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'Efectivo',
  `comments` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `status` enum('activo','cancelado') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'activo',
  `credit` double NOT NULL,
  `amountApplied` double NOT NULL,
  `account` int(4) DEFAULT NULL,
  `anticipo` double NOT NULL,
  `autorize` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`paymentId`, `date`, `invoiceId`, `amount`, `paymentMethod`, `comments`, `status`, `credit`, `amountApplied`, `account`, `anticipo`, `autorize`) VALUES
(1, '2013-06-26', 797, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(2, '2013-06-26', 804, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(3, '2013-06-26', 805, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(4, '2013-06-26', 803, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(5, '2013-06-26', 806, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(6, '2013-06-27', 823, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(7, '2013-06-27', 824, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(8, '2013-07-01', 828, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(9, '2013-07-01', 827, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(10, '2013-07-01', 831, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(11, '2013-07-01', 807, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(12, '2013-07-01', 834, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(13, '2013-07-01', 833, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(14, '2013-07-01', 836, 2500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 2500, 0, 0, ''),
(18, '2014-07-02', 4108, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(19, '2014-09-04', 4126, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(21, '2014-09-26', 4990, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(22, '2014-09-26', 5008, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(23, '2014-09-26', 5026, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(24, '2014-09-26', 5044, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(25, '2014-09-26', 5062, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(26, '2014-09-26', 5098, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(27, '2014-09-26', 5116, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(28, '2014-09-26', 5134, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(77, '2015-03-05', 5656, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(30, '2014-09-26', 4345, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(31, '2014-09-26', 4327, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(32, '2014-09-26', 4849, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(33, '2014-09-26', 4867, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(34, '2014-09-26', 4885, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(35, '2014-09-26', 4903, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(72, '2015-01-12', 5121, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(124, '2015-03-30', 6214, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(38, '2014-09-26', 4309, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(133, '2015-09-19', 6376, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(40, '2014-09-26', 4291, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(41, '2014-09-26', 4273, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(126, '2015-04-06', 6196, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(43, '2014-09-26', 4255, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(44, '2014-09-26', 4381, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(46, '2014-09-26', 4183, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(168, '2015-10-06', 7024, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(48, '2014-09-26', 4363, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(49, '2014-09-26', 4399, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(51, '2014-09-26', 4579, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(52, '2014-09-26', 4991, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(53, '2014-09-26', 5009, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(54, '2014-09-26', 5027, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(55, '2014-09-26', 5045, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(56, '2014-09-26', 5063, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(57, '2014-09-26', 5099, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(58, '2014-09-26', 5117, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(59, '2014-09-26', 5135, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(60, '2014-09-26', 4201, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(61, '2014-09-26', 4561, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(62, '2014-09-26', 4417, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(63, '2014-09-26', 4435, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(64, '2014-09-26', 4453, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(65, '2014-09-26', 4471, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(125, '2015-04-06', 6232, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(67, '2014-09-26', 4525, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(68, '2014-09-26', 4507, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(73, '2015-03-02', 5332, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(71, '2014-10-08', 5243, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(83, '2015-03-08', 5638, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(86, '2015-03-08', 5692, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(87, '2015-03-08', 5944, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(89, '2015-03-08', 5962, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(90, '2015-03-08', 5926, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(91, '2015-03-08', 6178, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(92, '2015-03-08', 5872, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(93, '2015-03-08', 5299, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(99, '2015-03-08', 5710, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(100, '2015-03-08', 5980, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(101, '2015-03-08', 5890, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(104, '2015-03-08', 5728, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(106, '2015-03-08', 5782, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(115, '2015-03-08', 5746, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(117, '2015-03-08', 6124, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(119, '2015-03-08', 5764, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(120, '2015-03-08', 5800, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(123, '2015-03-08', 5908, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(129, '2015-04-13', 6286, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(130, '2015-04-15', 6304, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(136, '2015-09-19', 6466, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(139, '2015-09-19', 6520, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(141, '2015-09-19', 6574, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(173, '2016-01-12', 7150, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(174, '2016-01-12', 7114, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(144, '2015-09-19', 6538, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(145, '2015-09-19', 6682, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(169, '2015-10-07', 7042, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(148, '2015-09-19', 6916, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(150, '2015-09-19', 6844, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(153, '2015-09-19', 6880, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(154, '2015-09-19', 6898, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(155, '2015-09-19', 6772, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(157, '2015-09-19', 6808, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(158, '2015-09-19', 6826, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(159, '2015-09-19', 6736, 1100, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 1100, 0, 0, ''),
(160, '2015-09-19', 6664, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(161, '2015-09-19', 6754, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(162, '2015-09-19', 6934, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(163, '2015-09-19', 6628, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(166, '2015-09-30', 6988, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(167, '2015-09-30', 7006, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, ''),
(170, '2015-10-07', 7060, 5500, 'Efectivo', 'Pago de Colegiatura', 'activo', 0, 5500, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `periodo`
--

CREATE TABLE `periodo` (
  `periodoId` int(11) NOT NULL,
  `identifier` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `starts` date NOT NULL,
  `ends` date NOT NULL,
  `fichasStarts` date NOT NULL,
  `fichasEnds` date NOT NULL,
  `vacationsStarts` date NOT NULL COMMENT 'inicio periodo vacacional',
  `vacationsEnds` date NOT NULL COMMENT 'fin periodo vacional',
  `active` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `personalId` int(11) NOT NULL,
  `positionId` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `lastname_materno` varchar(255) CHARACTER SET latin1 NOT NULL,
  `lastname_paterno` varchar(255) CHARACTER SET latin1 NOT NULL,
  `username` varchar(255) CHARACTER SET latin1 NOT NULL,
  `passwd` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` longtext CHARACTER SET latin1 NOT NULL,
  `curp` varchar(255) CHARACTER SET latin1 NOT NULL,
  `rfc` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fecha_nacimiento` varchar(10) CHARACTER SET latin1 NOT NULL,
  `fecha_sep` varchar(10) CHARACTER SET latin1 NOT NULL,
  `sexo` enum('h','m') CHARACTER SET latin1 NOT NULL,
  `fecha_dgta` varchar(10) CHARACTER SET latin1 NOT NULL,
  `claves_presupuestales` varchar(255) CHARACTER SET latin1 NOT NULL,
  `categoria` varchar(255) CHARACTER SET latin1 NOT NULL,
  `perfil` varchar(255) CHARACTER SET latin1 NOT NULL,
  `stateId` int(11) NOT NULL,
  `lastActivity` int(11) NOT NULL,
  `foto` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'alumnos/no_foto.JPG',
  `correo` varchar(255) COLLATE utf8_bin NOT NULL,
  `celular` varchar(255) COLLATE utf8_bin NOT NULL,
  `semblanza` text COLLATE utf8_bin NOT NULL,
  `firmaConstancia` enum('no','si') COLLATE utf8_bin NOT NULL,
  `profesion` varchar(255) COLLATE utf8_bin NOT NULL,
  `INE` varchar(255) COLLATE utf8_bin NOT NULL,
  `calle` varchar(255) COLLATE utf8_bin NOT NULL,
  `nInterior` varchar(255) COLLATE utf8_bin NOT NULL,
  `nExterior` varchar(255) COLLATE utf8_bin NOT NULL,
  `colonia` varchar(255) COLLATE utf8_bin NOT NULL,
  `estado` varchar(255) COLLATE utf8_bin NOT NULL,
  `ciudad` int(11) NOT NULL,
  `rutaFirma` varchar(255) COLLATE utf8_bin NOT NULL,
  `estatus` enum('activo','eliminado') COLLATE utf8_bin NOT NULL,
  `tipoContrato` enum('fisica','moral') COLLATE utf8_bin NOT NULL,
  `facebook` varchar(255) COLLATE utf8_bin NOT NULL,
  `twitter` varchar(255) COLLATE utf8_bin NOT NULL,
  `mostrar` enum('no','si') COLLATE utf8_bin NOT NULL,
  `numero` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `personal`
--

INSERT INTO `personal` (`personalId`, `positionId`, `name`, `lastname_materno`, `lastname_paterno`, `username`, `passwd`, `description`, `curp`, `rfc`, `fecha_nacimiento`, `fecha_sep`, `sexo`, `fecha_dgta`, `claves_presupuestales`, `categoria`, `perfil`, `stateId`, `lastActivity`, `foto`, `correo`, `celular`, `semblanza`, `firmaConstancia`, `profesion`, `INE`, `calle`, `nInterior`, `nExterior`, `colonia`, `estado`, `ciudad`, `rutaFirma`, `estatus`, `tipoContrato`, `facebook`, `twitter`, `mostrar`, `numero`) VALUES
(1, 1, 'Admin', '', '', 'admin', 'enlinea*2016.', '', '', '', '', '', 'h', '', '', '', 'Administrador', 0, 1564325300, 'alumnos/no_foto.JPG', '', '', '', 'no', '', '', '', '', '', '', '', 0, '', 'activo', 'fisica', '', '', 'no', '');

-- --------------------------------------------------------

--
-- Table structure for table `personal_role`
--

CREATE TABLE `personal_role` (
  `personalId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personal_role`
--

INSERT INTO `personal_role` (`personalId`, `roleId`) VALUES
(104, 2),
(119, 2),
(127, 2),
(102, 2),
(105, 2),
(115, 2),
(146, 2),
(141, 2),
(98, 2),
(140, 2),
(139, 2),
(100, 2),
(106, 2),
(136, 30),
(137, 2),
(109, 2),
(110, 2),
(138, 2),
(128, 2),
(118, 2),
(117, 2),
(181, 2),
(145, 2),
(144, 2),
(143, 2),
(162, 2),
(120, 2),
(136, 3),
(107, 2),
(135, 2),
(134, 2),
(131, 2),
(130, 2),
(129, 2),
(122, 2),
(123, 2),
(124, 2),
(125, 2),
(126, 2),
(147, 2),
(148, 2),
(150, 2),
(151, 2),
(152, 2),
(153, 2),
(154, 2),
(155, 2),
(156, 2),
(157, 2),
(158, 2),
(159, 2),
(161, 2),
(160, 2),
(163, 2),
(164, 2),
(165, 2),
(166, 2),
(167, 2),
(168, 2),
(169, 2),
(170, 2),
(171, 2),
(172, 2),
(173, 2),
(174, 2),
(175, 2),
(176, 2),
(177, 39),
(182, 2),
(177, 29),
(179, 2),
(149, 38),
(114, 38),
(183, 2),
(184, 2),
(185, 2),
(186, 2),
(187, 2),
(188, 2),
(189, 2),
(180, 29),
(180, 39),
(190, 2),
(191, 2),
(192, 2),
(193, 2),
(194, 2),
(195, 2),
(196, 2),
(197, 2),
(198, 2),
(199, 2);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `positionId` int(11) NOT NULL,
  `clave` varchar(255) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`positionId`, `clave`, `name`, `description`) VALUES
(4, 'DOC', 'DOCENTE', 'DOCENTE'),
(2, 'CE', 'CONTROL ESCOLAR', 'CONTROL ESCOLAR'),
(3, 'CE', 'JEFE CONTROL ESCOLAR', 'JEFE DE CONTROL ESCOLAR'),
(5, 'JDEPTO', 'JEFE DEPARTAMENTO', ''),
(1, 'ADMIN', 'ADMINISTRADOR GENERAL', 'ADMINISTRADOR GENERAL'),
(23, 'CA', 'COORDINADOR ADMINISTRATIVO', ''),
(24, 'AEE', 'ADMINISTRADOR EDUCACIóN EN LíNEA', '');

-- --------------------------------------------------------

--
-- Table structure for table `pregunta`
--

CREATE TABLE `pregunta` (
  `preguntaId` int(11) NOT NULL,
  `pregunta` text NOT NULL,
  `tiporespuesta` enum('punto','opcional','abierta') NOT NULL,
  `encuestaId` int(11) NOT NULL,
  `categoriapreguntaId` int(11) NOT NULL,
  `rango` varchar(255) NOT NULL,
  `opcional` text NOT NULL,
  `numCaracter` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profesion`
--

CREATE TABLE `profesion` (
  `profesionId` int(11) NOT NULL,
  `profesionName` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `profesion`
--

INSERT INTO `profesion` (`profesionId`, `profesionName`) VALUES
(1, 'tesy'),
(2, 'ADMINISTRACIÓN PÚBLICA'),
(3, 'ARQUITECTURA'),
(5, 'INVESTIGACION CRIMINAL'),
(6, 'CONTADURIA PÚBLICA'),
(7, 'DERECHO'),
(8, 'TURISMO'),
(9, 'ADMINISTRACIÓN'),
(15, 'INGENIERÍA'),
(14, 'PEDAGOGIA'),
(13, 'ODONTOLOGIA'),
(16, 'CRIMINOLOGIA'),
(17, 'PSICOLOGIA'),
(18, 'DISEÑO GRAFICO'),
(19, 'SOCIOLOGIA'),
(20, 'MERCADOTECNIA'),
(21, 'ECONOMÍA'),
(34, 'VETERINARIA'),
(23, 'RELACIONES INTERNACIONALES'),
(24, 'COMUNICACION'),
(25, 'SISTEMAS COMPUTACIONALES'),
(33, 'CIENCIAS DE LA EDUCACIÓN'),
(27, 'CIENCIAS POLITICAS'),
(28, 'SIN PROFESION'),
(29, 'ADMINISTRACIÓN DE EMPRESAS'),
(30, 'ADMINISTRACION TURISTICA'),
(32, 'INGENIERÍA CIVIL'),
(35, 'INFORMÁTICA'),
(36, 'MEDICINA'),
(37, 'NEGOCIOS INTERNACIONALES'),
(38, 'OTROS'),
(39, 'TEOLOGÍA'),
(40, 'AGRONOMÍA'),
(41, 'LENGUA Y LITERATURA HISPANOAMERICANA'),
(42, 'COMERCIO INTERNACIONAL');

-- --------------------------------------------------------

--
-- Table structure for table `recording`
--

CREATE TABLE `recording` (
  `recordingId` int(11) NOT NULL,
  `embed` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `registrationId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `periodoId` int(11) NOT NULL,
  `dateRegister` varchar(10) NOT NULL,
  `confirmed` enum('0','1') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registration_v1`
--

CREATE TABLE `registration_v1` (
  `registrationId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `periodoId` int(11) NOT NULL,
  `dateRegister` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `replyId` int(11) NOT NULL,
  `content` longtext CHARACTER SET latin1 NOT NULL,
  `replyDate` datetime NOT NULL,
  `topicId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `personalId` int(11) NOT NULL DEFAULT '0',
  `notificado` text COLLATE utf8_bin NOT NULL,
  `path` varchar(255) CHARACTER SET latin1 NOT NULL,
  `mime` varchar(255) CHARACTER SET latin1 NOT NULL,
  `son` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `repositorio`
--

CREATE TABLE `repositorio` (
  `repositorioId` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `activo` enum('no','si') NOT NULL,
  `ruta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `resourceId` int(11) NOT NULL,
  `courseModuleId` int(11) NOT NULL DEFAULT '0',
  `resourceConfigId` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resource_config`
--

CREATE TABLE `resource_config` (
  `resourceConfigId` int(11) NOT NULL,
  `subjectModuleId` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resultado`
--

CREATE TABLE `resultado` (
  `resultadoId` int(11) NOT NULL,
  `preguntaId` int(11) NOT NULL,
  `respuesta` text NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `courseModuleId` int(11) NOT NULL,
  `encuestaId` int(11) NOT NULL,
  `profesorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rfc`
--

CREATE TABLE `rfc` (
  `rfcId` int(11) NOT NULL,
  `empresaId` int(11) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `razonSocial` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `calle` varchar(255) NOT NULL,
  `noExt` varchar(255) NOT NULL,
  `noInt` varchar(255) NOT NULL,
  `colonia` varchar(255) NOT NULL,
  `localidad` varchar(255) NOT NULL,
  `municipio` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `referencia` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `cp` varchar(5) NOT NULL,
  `activo` enum('si','no') NOT NULL DEFAULT 'no',
  `main` enum('no','si') NOT NULL,
  `regimenFiscal` varchar(255) NOT NULL,
  `iva` int(3) NOT NULL DEFAULT '16'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rfc`
--

INSERT INTO `rfc` (`rfcId`, `empresaId`, `rfc`, `razonSocial`, `pais`, `calle`, `noExt`, `noInt`, `colonia`, `localidad`, `municipio`, `ciudad`, `referencia`, `estado`, `cp`, `activo`, `main`, `regimenFiscal`, `iva`) VALUES
(1, 15, 'LSF100610LS2', 'DEMO FACTURASE', 'DEMO', 'DEMO', '13', '45', 'DEMO', 'DEMO', 'DEMO', '', 'DEMO', 'DEMO', '11111', 'si', 'si', 'R%C3%A9gimen%20de%20las%20Personas%20F%C3%ADsicas%20con%20Actividades%20Empresariales%20y%20Profesionales', 16);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `roleId` int(11) NOT NULL,
  `clave` varchar(255) CHARACTER SET latin1 NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`roleId`, `clave`, `name`, `description`) VALUES
(1, 'Admin', 'Administrador General', 'Administrador General del Sistema'),
(2, 'RDOC', 'DOCENTE', ''),
(28, 'CE', 'CONTROL ESCOLAR', ''),
(3, 'Dir', 'DIRECTIVO', ''),
(23, 'JDEPTO', 'JEFE DE DEPARTAMENTO', ''),
(29, 'ALAT', 'ALTA DE ALUMNOS', 'PERFIL PARA AGREGAR ?NICAMENTE ALUMNOS'),
(30, 'CA', 'COORDINADOR ADMINISTRATIVO', ''),
(32, 'AEE', 'Administrador Educación en Línea', 'Persona encargada de la Admnistración del Sistema de Educación en Línea'),
(33, 'DM', 'prueba de role', 'esta es una prueba de un rol'),
(34, 'OPR', 'Otra prueba de rol', 'Esta es otra prueba de rol\r\nAlumnos\r\nCursos\r\nPagos'),
(36, 'OPR2', 'Otra prueba rol', 'Prueba rol 3'),
(37, 'CE2', 'Control Escolar (2)', ''),
(38, 'JCE', 'Jefe Control Escolar', 'Jefe de Control Escolar'),
(39, 'CEA', 'Control Escolar Aux', 'Mismos permisos que el Jefe de Control Escolar sin acceso a currícula');

-- --------------------------------------------------------

--
-- Table structure for table `role_modules`
--

CREATE TABLE `role_modules` (
  `roleId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role_modules`
--

INSERT INTO `role_modules` (`roleId`, `moduleId`) VALUES
(39, 37),
(39, 40),
(39, 8),
(39, 43),
(2, 8),
(39, 41),
(39, 38),
(39, 42),
(38, 8),
(38, 37),
(38, 40),
(38, 43),
(38, 4),
(38, 41),
(23, 4),
(23, 33),
(23, 32),
(23, 15),
(23, 16),
(23, 14),
(23, 11),
(23, 2),
(23, 6),
(23, 18),
(23, 12),
(23, 19),
(23, 8),
(23, 25),
(23, 29),
(23, 30),
(23, 21),
(23, 26),
(23, 27),
(23, 17),
(23, 7),
(23, 31),
(23, 20),
(38, 38),
(38, 42),
(29, 35),
(29, 4),
(2, 37),
(2, 4),
(30, 4),
(30, 1),
(30, 37),
(30, 11),
(30, 8),
(30, 34),
(30, 35),
(30, 36),
(32, 35),
(32, 3),
(32, 34),
(32, 8),
(32, 11),
(32, 37),
(32, 1),
(32, 4),
(32, 5),
(32, 9),
(32, 17),
(32, 36),
(37, 37),
(37, 4),
(37, 8);

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `scheduleId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_group`
--

CREATE TABLE `schedule_group` (
  `scheduleGroupId` int(11) NOT NULL,
  `majorId` int(11) NOT NULL,
  `semesterId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schedule_test`
--

CREATE TABLE `schedule_test` (
  `scheduletestId` int(11) NOT NULL,
  `typetestId` int(11) NOT NULL,
  `datetest` date NOT NULL,
  `comments` varchar(60) NOT NULL,
  `periodoId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='calendario de ex?menes parciales, globales, etc.';

-- --------------------------------------------------------

--
-- Table structure for table `schedule_time`
--

CREATE TABLE `schedule_time` (
  `schtimeId` int(11) NOT NULL,
  `hr_start` int(11) NOT NULL,
  `min_start` int(11) NOT NULL,
  `hr_end` int(11) NOT NULL,
  `min_end` int(11) NOT NULL,
  `periodoId` int(11) NOT NULL,
  `free_time` enum('0','1') NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schgpo_subject`
--

CREATE TABLE `schgpo_subject` (
  `schGpoSubjectId` int(11) NOT NULL,
  `scheduleGroupId` int(11) NOT NULL,
  `subgpoId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `semesterId` int(11) NOT NULL,
  `periodoId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `school_type`
--

CREATE TABLE `school_type` (
  `schtypId` int(11) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school_type`
--

INSERT INTO `school_type` (`schtypId`, `clave`, `name`) VALUES
(1, '01', 'T?cnica'),
(2, '02', 'Estatal'),
(3, '03', 'Federal'),
(4, '04', 'Telesecundaria'),
(5, '05', 'General'),
(6, '06', 'Abierta'),
(7, '07', 'Particular'),
(8, '08', 'Inea'),
(9, '09', 'Otros');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE `semester` (
  `semesterId` int(11) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`semesterId`, `clave`, `name`) VALUES
(1, 'I', 'Semester 1'),
(2, 'II', 'Semestre 2'),
(3, 'III', 'Semestre 3'),
(4, 'IV', 'Semestre 4'),
(5, 'V', 'Semestre 5'),
(6, 'VI', 'Semestre 6');

-- --------------------------------------------------------

--
-- Table structure for table `serie`
--

CREATE TABLE `serie` (
  `serieId` int(11) NOT NULL,
  `empresaId` int(11) NOT NULL,
  `sucursalId` int(11) NOT NULL,
  `serie` varchar(16) NOT NULL,
  `folioInicial` int(11) NOT NULL,
  `folioFinal` int(11) NOT NULL,
  `noAprobacion` varchar(255) NOT NULL,
  `anoAprobacion` int(11) NOT NULL,
  `tiposComprobanteId` int(11) NOT NULL,
  `lugarDeExpedicion` varchar(255) NOT NULL,
  `noCertificado` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `consecutivo` int(11) NOT NULL,
  `rfcId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `serie`
--

INSERT INTO `serie` (`serieId`, `empresaId`, `sucursalId`, `serie`, `folioInicial`, `folioFinal`, `noAprobacion`, `anoAprobacion`, `tiposComprobanteId`, `lugarDeExpedicion`, `noCertificado`, `email`, `consecutivo`, `rfcId`) VALUES
(51, 15, 1, 'A', 1, 1000000, '', 0, 1, '1', '00001000000201889852', 'd@d.com', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `solicitud`
--

CREATE TABLE `solicitud` (
  `solicitudId` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `fechaSolicitud` date NOT NULL,
  `tiposolicitudId` int(11) NOT NULL,
  `estatus` enum('pendiente','autorizado','completado','en progreso','cancelado') NOT NULL,
  `personalId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `ruta` varchar(255) NOT NULL,
  `rutaAdjunto` varchar(255) NOT NULL,
  `tipobaja` enum('temporal','definitiva') NOT NULL,
  `courseId` int(11) NOT NULL,
  `courseModuleId` int(11) NOT NULL COMMENT 'coursemoduleId en el que se encuentra inscrito el alumno',
  `nivelInscrito` int(11) NOT NULL COMMENT 'nivel inscrito ya sea cuatri o semestre',
  `subjectId` int(11) NOT NULL,
  `fechaEntrega` date NOT NULL,
  `folio` varchar(255) NOT NULL,
  `nombreFirma` varchar(255) NOT NULL,
  `puestofirmante` varchar(255) NOT NULL,
  `sexoFirma` varchar(255) NOT NULL,
  `precio` decimal(15,2) NOT NULL,
  `horario` varchar(255) NOT NULL,
  `observacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `speciality`
--

CREATE TABLE `speciality` (
  `specialityId` int(11) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `speciality`
--

INSERT INTO `speciality` (`specialityId`, `clave`, `name`) VALUES
(1, 'F-M', 'FISICO MATEM?TICA'),
(2, 'Q-B', 'QU?MICO BIOL?GICA'),
(3, 'E-A', 'ECON?MICO ADMINISTRATIVA'),
(15, 'AGROPECUARIO', 'T?CNICO AGROPECUARIO'),
(13, 'C-B?SICO', 'COMPONENTE B?SICO'),
(20, 'OPT', 'OPTATIVA'),
(16, 'AGRONEGOCIOS', 'T?CNICO EN AGRONEGOCIOS'),
(17, 'INFORM?TICA', 'T?CNICO EN INFORM?TICA'),
(18, 'DESARROLLO', 'T?CNICO EN DESARROLLO COMUNITARIO'),
(19, 'AGROINDUSTRIAS', 'T?CNICO EN AGROINDUSTRIAS'),
(22, 'ADMINISTRACI?N', 'TECNICO EN ADMINISTRCI?N Y CONTABILIDAD');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `stateId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`stateId`, `name`, `clave`) VALUES
(1, 'AGUASCALIENTES', 'AS'),
(2, 'BAJA CALIFORNIA NTE.', 'BC'),
(3, 'BAJA CALIFORNIA SUR', 'BS'),
(4, 'CAMPECHE', 'CC'),
(5, 'COAHUILA', 'CL'),
(6, 'COLIMA', 'CM'),
(7, 'CHIAPAS', 'CS'),
(8, 'CHIHUAHUA', 'CH'),
(9, 'DISTRITO FEDERAL', 'DF'),
(10, 'DURANGO', 'DG'),
(11, 'GUANAJUATO', 'GT'),
(12, 'GUERRERO', 'GR'),
(13, 'HIDALGO', 'HG'),
(14, 'JALISCO', 'JC'),
(15, 'MEXICO', 'MC'),
(16, 'MICHOACAN', 'MN'),
(17, 'MORELOS', 'MS'),
(18, 'NAYARIT', 'NT'),
(19, 'NUEVO LEON', 'NL'),
(20, 'OAXACA', 'OC'),
(21, 'PUEBLA', 'PL'),
(22, 'QUERETARO', 'QT'),
(23, 'QUINTANA ROO', 'QR'),
(24, 'SAN LUIS POTOSI', 'SP'),
(25, 'SINALOA', 'SL'),
(26, 'SONORA', 'SR'),
(27, 'TABASCO', 'TC'),
(28, 'TAMAULIPAS', 'TS'),
(29, 'TLAXCALA', 'TL'),
(30, 'VERACRUZ', 'VZ'),
(31, 'YUCATAN', 'YN'),
(32, 'ZACATECAS', 'ZS'),
(33, 'SERV. EXTERIOR MEXICANO', 'SM'),
(34, 'NACIDO EN EL EXTRANJERO', 'NE');

-- --------------------------------------------------------

--
-- Table structure for table `subgpo_schedule`
--

CREATE TABLE `subgpo_schedule` (
  `subgpoId` int(11) NOT NULL,
  `schtimeId` int(11) NOT NULL,
  `day` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subjectId` int(11) NOT NULL,
  `specialityId` int(11) NOT NULL,
  `semesterId` int(11) NOT NULL,
  `tipoPeriodo` enum('Cuatrimestre','Semestre') COLLATE utf8_bin NOT NULL,
  `clave` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fechaRvoe` date NOT NULL,
  `fechaRvoeLinea` date NOT NULL,
  `fechaRevoe` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '24 DE ENERO DEL 2011',
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `credits` int(11) NOT NULL,
  `group_qty` int(11) NOT NULL,
  `student_limit` int(11) NOT NULL,
  `welcomeText` text CHARACTER SET latin1 NOT NULL,
  `introduction` text CHARACTER SET latin1 NOT NULL,
  `intentions` text CHARACTER SET latin1 NOT NULL,
  `objectives` text CHARACTER SET latin1 NOT NULL,
  `themes` text CHARACTER SET latin1 NOT NULL,
  `scheme` text CHARACTER SET latin1 NOT NULL,
  `methodology` text CHARACTER SET latin1 NOT NULL,
  `politics` text CHARACTER SET latin1 NOT NULL,
  `evaluation` text CHARACTER SET latin1 NOT NULL,
  `bibliography` text CHARACTER SET latin1 NOT NULL,
  `tipo` int(11) NOT NULL,
  `assignedTo` text CHARACTER SET latin1 NOT NULL,
  `cost` float(10,2) NOT NULL,
  `payments` int(11) NOT NULL DEFAULT '1',
  `rvoe` varchar(255) COLLATE utf8_bin NOT NULL,
  `rvoeLinea` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `subject_group`
--

CREATE TABLE `subject_group` (
  `subgpoId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `personalId` int(11) NOT NULL,
  `classroomId` int(11) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `recursamiento` enum('0','1') NOT NULL,
  `periodoId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subject_module`
--

CREATE TABLE `subject_module` (
  `subjectModuleId` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `specialityId` int(11) NOT NULL,
  `semesterId` int(11) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `credits` int(11) NOT NULL,
  `group_qty` int(11) NOT NULL,
  `student_limit` int(11) NOT NULL,
  `welcomeText` text NOT NULL,
  `introduction` text NOT NULL,
  `intentions` text NOT NULL,
  `objectives` text NOT NULL,
  `themes` text NOT NULL,
  `scheme` text NOT NULL,
  `methodology` text NOT NULL,
  `politics` text NOT NULL,
  `evaluation` text NOT NULL,
  `bibliography` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `tipo` int(11) NOT NULL,
  `assignedTo` text NOT NULL,
  `cost` float(10,2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sucursal`
--

CREATE TABLE `sucursal` (
  `sucursalId` int(11) NOT NULL,
  `empresaId` int(11) NOT NULL,
  `rfcId` int(11) NOT NULL,
  `identificador` varchar(255) NOT NULL,
  `sucursalActiva` enum('no','si') NOT NULL DEFAULT 'no',
  `razonSocial` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `calle` varchar(255) NOT NULL,
  `noExt` varchar(255) NOT NULL,
  `noInt` varchar(255) NOT NULL,
  `colonia` varchar(255) NOT NULL,
  `localidad` varchar(255) NOT NULL,
  `municipio` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `referencia` varchar(255) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `cp` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sucursal`
--

INSERT INTO `sucursal` (`sucursalId`, `empresaId`, `rfcId`, `identificador`, `sucursalActiva`, `razonSocial`, `pais`, `calle`, `noExt`, `noInt`, `colonia`, `localidad`, `municipio`, `ciudad`, `referencia`, `estado`, `cp`) VALUES
(1, 15, 1, 'matriz', 'si', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `teamId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `courseModuleId` int(11) NOT NULL,
  `teamNumber` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `number` int(11) NOT NULL,
  `float` float NOT NULL,
  `date` date NOT NULL,
  `double` double NOT NULL,
  `enum` enum('si','no') NOT NULL,
  `maxTries` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tiposComprobante`
--

CREATE TABLE `tiposComprobante` (
  `tiposComprobanteId` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `tipoDeComprobante` enum('ingreso','egreso','traslado') NOT NULL DEFAULT 'ingreso'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tiposComprobante`
--

INSERT INTO `tiposComprobante` (`tiposComprobanteId`, `nombre`, `tipoDeComprobante`) VALUES
(1, 'Factura', 'ingreso'),
(2, 'Nota de Credito', 'egreso'),
(3, 'Nota de Debito', 'ingreso'),
(4, 'Honorarios', 'ingreso');

-- --------------------------------------------------------

--
-- Table structure for table `tiposolicitud`
--

CREATE TABLE `tiposolicitud` (
  `tiposolicitudId` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(15,2) NOT NULL,
  `idfire` int(11) NOT NULL,
  `orden` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `topicId` int(11) NOT NULL,
  `subject` varchar(255) CHARACTER SET latin1 NOT NULL,
  `tipo` enum('dudas','asesoria','presentacion','discucion') COLLATE utf8_bin DEFAULT NULL,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `topicDate` datetime NOT NULL,
  `courseId` int(11) NOT NULL DEFAULT '0',
  `courseModuleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `topicsub`
--

CREATE TABLE `topicsub` (
  `topicsubId` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `topicId` int(11) NOT NULL,
  `topicsubDate` datetime NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `typetest`
--

CREATE TABLE `typetest` (
  `testId` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `typetest` varchar(255) NOT NULL,
  `regularization` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `typetest`
--

INSERT INTO `typetest` (`testId`, `identifier`, `typetest`, `regularization`) VALUES
(3, 'R1', 'RECUPERACION', 'yes'),
(4, 'INT', 'INTERSEMESTRAL', 'yes'),
(5, 'REC', 'RECURSAMIENTO', 'yes'),
(1, 'PAR', 'PARCIAL', 'no'),
(2, 'GBL', 'GLOBAL', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `type_calif`
--

CREATE TABLE `type_calif` (
  `typeCalifId` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_calif`
--

INSERT INTO `type_calif` (`typeCalifId`, `identifier`, `name`) VALUES
(1, 'FINAL', 'FINAL'),
(2, 'R1', 'RECUPERACION'),
(3, 'INT', 'INTERSEMESTRAL'),
(4, 'REC', 'RECURSAMIENTO');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `folioFicha` int(11) NOT NULL,
  `controlNumber` varchar(255) CHARACTER SET latin1 NOT NULL,
  `names` varchar(255) CHARACTER SET utf8 NOT NULL,
  `lastNamePaterno` varchar(255) CHARACTER SET utf8 NOT NULL,
  `lastNameMaterno` varchar(255) CHARACTER SET utf8 NOT NULL,
  `birthdate` varchar(10) CHARACTER SET latin1 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` enum('user','student','maestro','admin') CHARACTER SET utf8 NOT NULL DEFAULT 'user',
  `street` varchar(255) CHARACTER SET utf8 NOT NULL,
  `number` varchar(50) CHARACTER SET utf8 NOT NULL,
  `colony` varchar(255) CHARACTER SET utf8 NOT NULL,
  `city` varchar(255) CHARACTER SET utf8 NOT NULL,
  `state` varchar(255) CHARACTER SET utf8 NOT NULL,
  `country` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pais` int(11) NOT NULL DEFAULT '1',
  `estado` int(11) NOT NULL,
  `ciudad` int(11) NOT NULL,
  `postalCode` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sexo` enum('m','f') CHARACTER SET utf8 NOT NULL DEFAULT 'm',
  `curp` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cityBorn` varchar(255) CHARACTER SET utf8 NOT NULL,
  `stateBorn` varchar(255) CHARACTER SET utf8 NOT NULL,
  `countryBorn` varchar(255) CHARACTER SET utf8 NOT NULL,
  `mainMajor` int(11) NOT NULL,
  `secondMajor` int(11) NOT NULL,
  `thirdMajor` int(11) NOT NULL,
  `mode` tinyint(4) NOT NULL,
  `tutorNames` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tutorLastNamePaterno` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tutorLastNameMaterno` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tutorAddress` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tutorPhone` varchar(50) CHARACTER SET utf8 NOT NULL,
  `prevSchNames` varchar(255) CHARACTER SET utf8 NOT NULL,
  `prevSchType` tinyint(4) NOT NULL,
  `prevSchKey` varchar(255) CHARACTER SET utf8 NOT NULL,
  `prevSchMode` tinyint(4) NOT NULL,
  `prevSchCity` varchar(255) CHARACTER SET utf8 NOT NULL,
  `prevSchState` varchar(255) CHARACTER SET utf8 NOT NULL,
  `prevSchAverage` float NOT NULL,
  `prevSchCertified` tinyint(4) NOT NULL,
  `majorId` int(11) NOT NULL,
  `semesterId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `periodoId` int(11) NOT NULL,
  `status` enum('pendiente','autorizada','cancelada','baja','egresado') CHARACTER SET latin1 NOT NULL DEFAULT 'pendiente',
  `codeId` int(11) NOT NULL,
  `average` float NOT NULL,
  `cancelPeriodoId` int(10) NOT NULL,
  `nacionality` varchar(255) CHARACTER SET latin1 NOT NULL,
  `anioEgreso` varchar(4) CHARACTER SET latin1 NOT NULL,
  `maritalStatus` varchar(255) CHARACTER SET latin1 NOT NULL,
  `fax` varchar(255) CHARACTER SET latin1 NOT NULL,
  `mobile` varchar(255) CHARACTER SET latin1 NOT NULL,
  `workplace` varchar(255) CHARACTER SET latin1 NOT NULL,
  `workplaceOcupation` enum('FUNCIONARIO PUBLICO MUNICIPAL','FUNCIONARIO PUBLICO ESTATAL','FUNCIONARIO PUBLICO FEDERAL','OTROS') CHARACTER SET latin1 NOT NULL DEFAULT 'FUNCIONARIO PUBLICO MUNICIPAL',
  `workplaceAddress` varchar(255) CHARACTER SET latin1 NOT NULL,
  `workplaceArea` varchar(255) CHARACTER SET latin1 NOT NULL,
  `workplacePosition` varchar(255) CHARACTER SET latin1 NOT NULL,
  `workplaceCity` varchar(255) CHARACTER SET latin1 NOT NULL,
  `paist` int(11) NOT NULL,
  `estadot` int(11) NOT NULL,
  `ciudadt` int(11) NOT NULL,
  `workplacePhone` varchar(255) CHARACTER SET latin1 NOT NULL,
  `workplaceEmail` varchar(255) CHARACTER SET latin1 NOT NULL,
  `academicDegree` enum('UNIVERSITARIO','LICENCIATURA','MAESTRIA','DOCTORADO','OTROS') CHARACTER SET latin1 NOT NULL DEFAULT 'UNIVERSITARIO',
  `profesion` int(2) NOT NULL,
  `school` varchar(255) CHARACTER SET latin1 NOT NULL,
  `highSchool` varchar(255) CHARACTER SET latin1 NOT NULL,
  `lastActivity` int(11) NOT NULL DEFAULT '0',
  `avatar` varchar(255) CHARACTER SET latin1 NOT NULL,
  `masters` varchar(255) CHARACTER SET latin1 NOT NULL,
  `mastersSchool` varchar(255) CHARACTER SET latin1 NOT NULL,
  `activo` int(1) NOT NULL DEFAULT '1',
  `referenciaBancaria` varchar(255) COLLATE utf8_bin NOT NULL,
  `porcentajeBeca` varchar(255) COLLATE utf8_bin NOT NULL,
  `rutaFoto` varchar(255) COLLATE utf8_bin NOT NULL,
  `perfil` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `folioFicha`, `controlNumber`, `names`, `lastNamePaterno`, `lastNameMaterno`, `birthdate`, `email`, `phone`, `password`, `type`, `street`, `number`, `colony`, `city`, `state`, `country`, `pais`, `estado`, `ciudad`, `postalCode`, `sexo`, `curp`, `cityBorn`, `stateBorn`, `countryBorn`, `mainMajor`, `secondMajor`, `thirdMajor`, `mode`, `tutorNames`, `tutorLastNamePaterno`, `tutorLastNameMaterno`, `tutorAddress`, `tutorPhone`, `prevSchNames`, `prevSchType`, `prevSchKey`, `prevSchMode`, `prevSchCity`, `prevSchState`, `prevSchAverage`, `prevSchCertified`, `majorId`, `semesterId`, `groupId`, `periodoId`, `status`, `codeId`, `average`, `cancelPeriodoId`, `nacionality`, `anioEgreso`, `maritalStatus`, `fax`, `mobile`, `workplace`, `workplaceOcupation`, `workplaceAddress`, `workplaceArea`, `workplacePosition`, `workplaceCity`, `paist`, `estadot`, `ciudadt`, `workplacePhone`, `workplaceEmail`, `academicDegree`, `profesion`, `school`, `highSchool`, `lastActivity`, `avatar`, `masters`, `mastersSchool`, `activo`, `referenciaBancaria`, `porcentajeBeca`, `rutaFoto`, `perfil`) VALUES
(713, 0, '20150713', 'José Luis', 'Brandi', 'Bonifaz', '22-09-1987', 'jbrandy01@hotmail.com', '6124873', 'Josinbrandi', 'student', '7 y 8 norte', '881', '10° pte', '', '', '', 1, 7, 180, '29054', 'm', '', '', '', '', 0, 0, 0, 0, '', '', '', '', '', '', 0, '', 0, '', '', 0, 0, 0, 0, 0, 0, 'pendiente', 0, 0, 0, '', '', 'Soltero(a)', '9616037819', '9611778491', 'Prospera', '', '3 pte 2 nte', 'Padron', 'Supervisor', '', 1, 7, 180, '6124873', 'rdcnegocios@hotmail.com', 'UNIVERSITARIO', 9, 'Fray Bartolome de las Casas', '', 1433205462, '', '', '', 0, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_subject`
--

CREATE TABLE `user_subject` (
  `registrationId` int(11) NOT NULL,
  `alumnoId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `status` enum('activo','inactivo','finalizado') NOT NULL DEFAULT 'inactivo',
  `mark` int(3) NOT NULL DEFAULT '0',
  `tipo_beca` enum('Ninguno','Particular','Escolar','Prodim') NOT NULL DEFAULT 'Ninguno',
  `por_beca` int(11) NOT NULL DEFAULT '0',
  `matricula` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_archive`
--

CREATE TABLE `wiki_archive` (
  `ar_id` int(10) UNSIGNED NOT NULL,
  `ar_namespace` int(11) NOT NULL DEFAULT '0',
  `ar_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ar_text` mediumblob NOT NULL,
  `ar_comment` varbinary(767) NOT NULL,
  `ar_user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ar_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ar_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL DEFAULT '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(10) UNSIGNED DEFAULT NULL,
  `ar_text_id` int(10) UNSIGNED DEFAULT NULL,
  `ar_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `ar_len` int(10) UNSIGNED DEFAULT NULL,
  `ar_page_id` int(10) UNSIGNED DEFAULT NULL,
  `ar_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `ar_sha1` varbinary(32) NOT NULL DEFAULT '',
  `ar_content_model` varbinary(32) DEFAULT NULL,
  `ar_content_format` varbinary(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_bot_passwords`
--

CREATE TABLE `wiki_bot_passwords` (
  `bp_user` int(11) NOT NULL,
  `bp_app_id` varbinary(32) NOT NULL,
  `bp_password` tinyblob NOT NULL,
  `bp_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `bp_restrictions` blob NOT NULL,
  `bp_grants` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_category`
--

CREATE TABLE `wiki_category` (
  `cat_id` int(10) UNSIGNED NOT NULL,
  `cat_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT '0',
  `cat_subcats` int(11) NOT NULL DEFAULT '0',
  `cat_files` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_categorylinks`
--

CREATE TABLE `wiki_categorylinks` (
  `cl_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cl_to` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(230) NOT NULL DEFAULT '',
  `cl_sortkey_prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cl_collation` varbinary(32) NOT NULL DEFAULT '',
  `cl_type` enum('page','subcat','file') NOT NULL DEFAULT 'page'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_change_tag`
--

CREATE TABLE `wiki_change_tag` (
  `ct_rc_id` int(11) DEFAULT NULL,
  `ct_log_id` int(11) DEFAULT NULL,
  `ct_rev_id` int(11) DEFAULT NULL,
  `ct_tag` varchar(255) NOT NULL,
  `ct_params` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_externallinks`
--

CREATE TABLE `wiki_externallinks` (
  `el_id` int(10) UNSIGNED NOT NULL,
  `el_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_externallinks`
--

INSERT INTO `wiki_externallinks` (`el_id`, `el_from`, `el_to`, `el_index`) VALUES
(1, 1, 0x2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e74732f6573, 0x687474703a2f2f6f72672e77696b696d656469612e6d6574612e2f77696b692f48656c703a436f6e74656e74732f6573),
(2, 1, 0x2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e74732f6573, 0x68747470733a2f2f6f72672e77696b696d656469612e6d6574612e2f77696b692f48656c703a436f6e74656e74732f6573),
(5, 1, 0x2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a4641512f6573, 0x687474703a2f2f6f72672e6d6564696177696b692e7777772e2f77696b692f4d616e75616c3a4641512f6573),
(6, 1, 0x2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a4641512f6573, 0x68747470733a2f2f6f72672e6d6564696177696b692e7777772e2f77696b692f4d616e75616c3a4641512f6573),
(12, 2, 0x687474703a2f2f7777772e69617063686961706173656e6c696e65612e6d78253743566f6c766572, 0x687474703a2f2f6d78253763766f6c7665722e69617063686961706173656e6c696e65612e7777772e2f);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_filearchive`
--

CREATE TABLE `wiki_filearchive` (
  `fa_id` int(11) NOT NULL,
  `fa_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `fa_archive_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `fa_storage_group` varbinary(16) DEFAULT NULL,
  `fa_storage_key` varbinary(64) DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` varbinary(767) DEFAULT '',
  `fa_size` int(10) UNSIGNED DEFAULT '0',
  `fa_width` int(11) DEFAULT '0',
  `fa_height` int(11) DEFAULT '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) DEFAULT '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT 'unknown',
  `fa_minor_mime` varbinary(100) DEFAULT 'unknown',
  `fa_description` varbinary(767) DEFAULT NULL,
  `fa_user` int(10) UNSIGNED DEFAULT '0',
  `fa_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fa_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `fa_sha1` varbinary(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_image`
--

CREATE TABLE `wiki_image` (
  `img_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `img_size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `img_width` int(11) NOT NULL DEFAULT '0',
  `img_height` int(11) NOT NULL DEFAULT '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL DEFAULT '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `img_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `img_description` varbinary(767) NOT NULL,
  `img_user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `img_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `img_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `img_sha1` varbinary(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_imagelinks`
--

CREATE TABLE `wiki_imagelinks` (
  `il_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `il_from_namespace` int(11) NOT NULL DEFAULT '0',
  `il_to` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_interwiki`
--

CREATE TABLE `wiki_interwiki` (
  `iw_prefix` varchar(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_api` blob NOT NULL,
  `iw_wikiid` varchar(64) NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_interwiki`
--

INSERT INTO `wiki_interwiki` (`iw_prefix`, `iw_url`, `iw_api`, `iw_wikiid`, `iw_local`, `iw_trans`) VALUES
('acronym', 0x687474703a2f2f7777772e6163726f6e796d66696e6465722e636f6d2f7e2f7365617263682f61662e617370783f737472696e673d6578616374264163726f6e796d3d2431, '', '', 0, 0),
('advogato', 0x687474703a2f2f7777772e6164766f6761746f2e6f72672f2431, '', '', 0, 0),
('arxiv', 0x687474703a2f2f7777772e61727869762e6f72672f6162732f2431, '', '', 0, 0),
('c2find', 0x687474703a2f2f63322e636f6d2f6367692f77696b693f46696e64506167652676616c75653d2431, '', '', 0, 0),
('cache', 0x687474703a2f2f7777772e676f6f676c652e636f6d2f7365617263683f713d63616368653a2431, '', '', 0, 0),
('commons', 0x68747470733a2f2f636f6d6d6f6e732e77696b696d656469612e6f72672f77696b692f2431, 0x68747470733a2f2f636f6d6d6f6e732e77696b696d656469612e6f72672f772f6170692e706870, '', 0, 0),
('dictionary', 0x687474703a2f2f7777772e646963742e6f72672f62696e2f446963743f44617461626173653d2a26466f726d3d44696374312653747261746567793d2a2651756572793d2431, '', '', 0, 0),
('docbook', 0x687474703a2f2f77696b692e646f63626f6f6b2e6f72672f2431, '', '', 0, 0),
('doi', 0x687474703a2f2f64782e646f692e6f72672f2431, '', '', 0, 0),
('drumcorpswiki', 0x687474703a2f2f7777772e6472756d636f72707377696b692e636f6d2f2431, 0x687474703a2f2f6472756d636f72707377696b692e636f6d2f6170692e706870, '', 0, 0),
('dwjwiki', 0x687474703a2f2f7777772e737562657269632e6e65742f6367692d62696e2f64776a2f77696b692e6367693f2431, '', '', 0, 0),
('elibre', 0x687474703a2f2f656e6369636c6f70656469612e75732e65732f696e6465782e7068702f2431, 0x687474703a2f2f656e6369636c6f70656469612e75732e65732f6170692e706870, '', 0, 0),
('emacswiki', 0x687474703a2f2f7777772e656d61637377696b692e6f72672f6367692d62696e2f77696b692e706c3f2431, '', '', 0, 0),
('foldoc', 0x687474703a2f2f666f6c646f632e6f72672f3f2431, '', '', 0, 0),
('foxwiki', 0x687474703a2f2f666f782e77696b69732e636f6d2f77632e646c6c3f57696b697e2431, '', '', 0, 0),
('freebsdman', 0x687474703a2f2f7777772e467265654253442e6f72672f6367692f6d616e2e6367693f6170726f706f733d312671756572793d2431, '', '', 0, 0),
('gej', 0x687474703a2f2f7777772e6573706572616e746f2e64652f64656a2e6d616c6e6f76612f616b746976696b696f2e706c3f2431, '', '', 0, 0),
('gentoo-wiki', 0x687474703a2f2f67656e746f6f2d77696b692e636f6d2f2431, '', '', 0, 0),
('google', 0x687474703a2f2f7777772e676f6f676c652e636f6d2f7365617263683f713d2431, '', '', 0, 0),
('googlegroups', 0x687474703a2f2f67726f7570732e676f6f676c652e636f6d2f67726f7570733f713d2431, '', '', 0, 0),
('hammondwiki', 0x687474703a2f2f7777772e64616972696b692e6f72672f48616d6d6f6e6457696b692f2431, '', '', 0, 0),
('hrwiki', 0x687474703a2f2f7777772e687277696b692e6f72672f77696b692f2431, 0x687474703a2f2f7777772e687277696b692e6f72672f772f6170692e706870, '', 0, 0),
('imdb', 0x687474703a2f2f7777772e696d64622e636f6d2f66696e643f713d24312674743d6f6e, '', '', 0, 0),
('jargonfile', 0x687474703a2f2f73756e69722e6f72672f617070732f6d6574612e706c3f77696b693d4a6172676f6e46696c652672656469726563743d2431, '', '', 0, 0),
('kmwiki', 0x687474703a2f2f6b6d77696b692e77696b697370616365732e636f6d2f2431, '', '', 0, 0),
('linuxwiki', 0x687474703a2f2f6c696e757877696b692e64652f2431, '', '', 0, 0),
('lojban', 0x687474703a2f2f7777772e6c6f6a62616e2e6f72672f74696b692f74696b692d696e6465782e7068703f706167653d2431, '', '', 0, 0),
('lqwiki', 0x687474703a2f2f77696b692e6c696e75787175657374696f6e732e6f72672f77696b692f2431, '', '', 0, 0),
('lugkr', 0x687474703a2f2f7777772e6c75672d6b722e64652f77696b692f2431, '', '', 0, 0),
('meatball', 0x687474703a2f2f7777772e7573656d6f642e636f6d2f6367692d62696e2f6d622e706c3f2431, '', '', 0, 0),
('mediawikiwiki', 0x68747470733a2f2f7777772e6d6564696177696b692e6f72672f77696b692f2431, 0x68747470733a2f2f7777772e6d6564696177696b692e6f72672f772f6170692e706870, '', 0, 0),
('mediazilla', 0x68747470733a2f2f6275677a696c6c612e77696b696d656469612e6f72672f2431, '', '', 0, 0),
('memoryalpha', 0x687474703a2f2f656e2e6d656d6f72792d616c7068612e6f72672f77696b692f2431, 0x687474703a2f2f656e2e6d656d6f72792d616c7068612e6f72672f6170692e706870, '', 0, 0),
('metawiki', 0x687474703a2f2f73756e69722e6f72672f617070732f6d6574612e706c3f2431, '', '', 0, 0),
('metawikimedia', 0x68747470733a2f2f6d6574612e77696b696d656469612e6f72672f77696b692f2431, 0x68747470733a2f2f6d6574612e77696b696d656469612e6f72672f772f6170692e706870, '', 0, 0),
('mozillawiki', 0x687474703a2f2f77696b692e6d6f7a696c6c612e6f72672f2431, 0x68747470733a2f2f77696b692e6d6f7a696c6c612e6f72672f6170692e706870, '', 0, 0),
('mw', 0x68747470733a2f2f7777772e6d6564696177696b692e6f72672f77696b692f2431, 0x68747470733a2f2f7777772e6d6564696177696b692e6f72672f772f6170692e706870, '', 0, 0),
('oeis', 0x687474703a2f2f6f6569732e6f72672f2431, '', '', 0, 0),
('openwiki', 0x687474703a2f2f6f70656e77696b692e636f6d2f6f772e6173703f2431, '', '', 0, 0),
('ppr', 0x687474703a2f2f63322e636f6d2f6367692f77696b693f2431, '', '', 0, 0),
('pythoninfo', 0x687474703a2f2f77696b692e707974686f6e2e6f72672f6d6f696e2f2431, '', '', 0, 0),
('rfc', 0x687474703a2f2f7777772e7266632d656469746f722e6f72672f7266632f72666324312e747874, '', '', 0, 0),
('s23wiki', 0x687474703a2f2f7332332e6f72672f77696b692f2431, 0x687474703a2f2f7332332e6f72672f772f6170692e706870, '', 0, 0),
('seattlewireless', 0x687474703a2f2f73656174746c65776972656c6573732e6e65742f2431, '', '', 0, 0),
('senseislibrary', 0x687474703a2f2f73656e736569732e786d702e6e65742f3f2431, '', '', 0, 0),
('shoutwiki', 0x687474703a2f2f7777772e73686f757477696b692e636f6d2f77696b692f2431, 0x687474703a2f2f7777772e73686f757477696b692e636f6d2f772f6170692e706870, '', 0, 0),
('sourcewatch', 0x687474703a2f2f7777772e736f7572636577617463682e6f72672f696e6465782e7068703f7469746c653d2431, 0x687474703a2f2f7777772e736f7572636577617463682e6f72672f6170692e706870, '', 0, 0),
('squeak', 0x687474703a2f2f77696b692e73717565616b2e6f72672f73717565616b2f2431, '', '', 0, 0),
('tejo', 0x687474703a2f2f7777772e74656a6f2e6f72672f76696b696f2f2431, '', '', 0, 0),
('theopedia', 0x687474703a2f2f7777772e7468656f70656469612e636f6d2f2431, '', '', 0, 0),
('tmbw', 0x687474703a2f2f7777772e746d62772e6e65742f77696b692f2431, 0x687474703a2f2f746d62772e6e65742f77696b692f6170692e706870, '', 0, 0),
('tmnet', 0x687474703a2f2f7777772e746563686e6f6d616e69666573746f732e6e65742f3f2431, '', '', 0, 0),
('twiki', 0x687474703a2f2f7477696b692e6f72672f6367692d62696e2f766965772f2431, '', '', 0, 0),
('uea', 0x687474703a2f2f7565612e6f72672f76696b696f2f696e6465782e7068702f2431, 0x687474703a2f2f7565612e6f72672f76696b696f2f6170692e706870, '', 0, 0),
('uncyclopedia', 0x687474703a2f2f656e2e756e6379636c6f70656469612e636f2f77696b692f2431, 0x687474703a2f2f656e2e756e6379636c6f70656469612e636f2f772f6170692e706870, '', 0, 0),
('unreal', 0x687474703a2f2f77696b692e6265796f6e64756e7265616c2e636f6d2f2431, 0x687474703a2f2f77696b692e6265796f6e64756e7265616c2e636f6d2f772f6170692e706870, '', 0, 0),
('usemod', 0x687474703a2f2f7777772e7573656d6f642e636f6d2f6367692d62696e2f77696b692e706c3f2431, '', '', 0, 0),
('webseitzwiki', 0x687474703a2f2f776562736569747a2e666c7578656e742e636f6d2f77696b692f2431, '', '', 0, 0),
('wiki', 0x687474703a2f2f63322e636f6d2f6367692f77696b693f2431, '', '', 0, 0),
('wikia', 0x687474703a2f2f7777772e77696b69612e636f6d2f77696b692f2431, '', '', 0, 0),
('wikibooks', 0x68747470733a2f2f656e2e77696b69626f6f6b732e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b69626f6f6b732e6f72672f772f6170692e706870, '', 0, 0),
('wikif1', 0x687474703a2f2f7777772e77696b6966312e6f72672f2431, '', '', 0, 0),
('wikihow', 0x687474703a2f2f7777772e77696b69686f772e636f6d2f2431, 0x687474703a2f2f7777772e77696b69686f772e636f6d2f6170692e706870, '', 0, 0),
('wikimedia', 0x68747470733a2f2f77696b696d65646961666f756e646174696f6e2e6f72672f77696b692f2431, 0x68747470733a2f2f77696b696d65646961666f756e646174696f6e2e6f72672f772f6170692e706870, '', 0, 0),
('wikinews', 0x68747470733a2f2f656e2e77696b696e6577732e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b696e6577732e6f72672f772f6170692e706870, '', 0, 0),
('wikinfo', 0x687474703a2f2f77696b696e666f2e636f2f456e676c6973682f696e6465782e7068702f2431, '', '', 0, 0),
('wikipedia', 0x68747470733a2f2f656e2e77696b6970656469612e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b6970656469612e6f72672f772f6170692e706870, '', 0, 0),
('wikiquote', 0x68747470733a2f2f656e2e77696b6971756f74652e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b6971756f74652e6f72672f772f6170692e706870, '', 0, 0),
('wikisource', 0x68747470733a2f2f77696b69736f757263652e6f72672f77696b692f2431, 0x68747470733a2f2f77696b69736f757263652e6f72672f772f6170692e706870, '', 0, 0),
('wikispecies', 0x68747470733a2f2f737065636965732e77696b696d656469612e6f72672f77696b692f2431, 0x68747470733a2f2f737065636965732e77696b696d656469612e6f72672f772f6170692e706870, '', 0, 0),
('wikiversity', 0x68747470733a2f2f656e2e77696b69766572736974792e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b69766572736974792e6f72672f772f6170692e706870, '', 0, 0),
('wikivoyage', 0x68747470733a2f2f656e2e77696b69766f796167652e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b69766f796167652e6f72672f772f6170692e706870, '', 0, 0),
('wikt', 0x68747470733a2f2f656e2e77696b74696f6e6172792e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b74696f6e6172792e6f72672f772f6170692e706870, '', 0, 0),
('wiktionary', 0x68747470733a2f2f656e2e77696b74696f6e6172792e6f72672f77696b692f2431, 0x68747470733a2f2f656e2e77696b74696f6e6172792e6f72672f772f6170692e706870, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_ipblocks`
--

CREATE TABLE `wiki_ipblocks` (
  `ipb_id` int(11) NOT NULL,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ipb_by` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ipb_by_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `ipb_reason` varbinary(767) NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_expiry` varbinary(14) NOT NULL DEFAULT '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_block_email` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_parent_block_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_iwlinks`
--

CREATE TABLE `wiki_iwlinks` (
  `iwl_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `iwl_prefix` varbinary(20) NOT NULL DEFAULT '',
  `iwl_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_job`
--

CREATE TABLE `wiki_job` (
  `job_id` int(10) UNSIGNED NOT NULL,
  `job_cmd` varbinary(60) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `job_timestamp` varbinary(14) DEFAULT NULL,
  `job_params` blob NOT NULL,
  `job_random` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `job_attempts` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `job_token` varbinary(32) NOT NULL DEFAULT '',
  `job_token_timestamp` varbinary(14) DEFAULT NULL,
  `job_sha1` varbinary(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_l10n_cache`
--

CREATE TABLE `wiki_l10n_cache` (
  `lc_lang` varbinary(32) NOT NULL,
  `lc_key` varchar(255) NOT NULL,
  `lc_value` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_langlinks`
--

CREATE TABLE `wiki_langlinks` (
  `ll_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ll_lang` varbinary(20) NOT NULL DEFAULT '',
  `ll_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_logging`
--

CREATE TABLE `wiki_logging` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `log_type` varbinary(32) NOT NULL DEFAULT '',
  `log_action` varbinary(32) NOT NULL DEFAULT '',
  `log_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  `log_user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `log_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `log_namespace` int(11) NOT NULL DEFAULT '0',
  `log_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `log_page` int(10) UNSIGNED DEFAULT NULL,
  `log_comment` varbinary(767) NOT NULL DEFAULT '',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_logging`
--

INSERT INTO `wiki_logging` (`log_id`, `log_type`, `log_action`, `log_timestamp`, `log_user`, `log_user_text`, `log_namespace`, `log_title`, `log_page`, `log_comment`, `log_params`, `log_deleted`) VALUES
(1, 0x706174726f6c, 0x6175746f706174726f6c, 0x3230313630383331303033373230, 1, 'Admin', 0, 'Página_principal', 1, '', 0x613a333a7b733a383a22343a3a6375726964223b693a323b733a393a22353a3a707265766964223b693a313b733a373a22363a3a6175746f223b693a313b7d, 0),
(2, 0x706174726f6c, 0x6175746f706174726f6c, 0x3230313630383331303034323332, 1, 'Admin', 0, 'Página_principal', 1, '', 0x613a333a7b733a383a22343a3a6375726964223b693a333b733a393a22353a3a707265766964223b693a323b733a373a22363a3a6175746f223b693a313b7d, 0),
(3, 0x706174726f6c, 0x6175746f706174726f6c, 0x3230313630383331303035303033, 1, 'Admin', 8, 'Sidebar', 2, '', 0x613a333a7b733a383a22343a3a6375726964223b693a343b733a393a22353a3a707265766964223b693a303b733a373a22363a3a6175746f223b693a313b7d, 0),
(4, 0x6e65777573657273, 0x637265617465, 0x3230313730383132323134333134, 2, '20171105', 2, '20171105', 0, '', 0x613a313a7b733a393a22343a3a757365726964223b693a323b7d, 0),
(5, 0x6e65777573657273, 0x637265617465, 0x3230313730383137313635333139, 3, 'Miguel Ballinas', 2, 'Miguel_Ballinas', 0, '', 0x613a313a7b733a393a22343a3a757365726964223b693a333b7d, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_log_search`
--

CREATE TABLE `wiki_log_search` (
  `ls_field` varbinary(32) NOT NULL,
  `ls_value` varchar(255) NOT NULL,
  `ls_log_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_module_deps`
--

CREATE TABLE `wiki_module_deps` (
  `md_module` varbinary(255) NOT NULL,
  `md_skin` varbinary(32) NOT NULL,
  `md_deps` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_module_deps`
--

INSERT INTO `wiki_module_deps` (`md_module`, `md_skin`, `md_deps`) VALUES
(0x6d6564696177696b692e616374696f6e2e766965772e706f737445646974, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e616374696f6e2f696d616765732f677265656e2d636865636b6d61726b2e706e67225d),
(0x6d6564696177696b692e666565646c696e6b, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692f696d616765732f666565642d69636f6e2e706e67222c227265736f75726365732f7372632f6d6564696177696b692f696d616765732f666565642d69636f6e2e737667225d),
(0x6d6564696177696b692e68656c706c696e6b, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e6d6978696e732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692f696d616765732f68656c702e706e67222c227265736f75726365732f7372632f6d6564696177696b692f696d616765732f68656c702e737667222c227265736f75726365732f7372632f6d6564696177696b692f6d6564696177696b692e68656c706c696e6b2e6c657373225d),
(0x6d6564696177696b692e68746d6c666f726d2e7374796c6573, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692f696d616765732f7175657374696f6e2e706e67222c227265736f75726365732f7372632f6d6564696177696b692f696d616765732f7175657374696f6e2e737667225d),
(0x6d6564696177696b692e69636f6e, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e6d6978696e732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692f696d616765732f6172726f772d636f6c6c61707365642d6c74722e706e67222c227265736f75726365732f7372632f6d6564696177696b692f696d616765732f6172726f772d636f6c6c61707365642d6c74722e737667222c227265736f75726365732f7372632f6d6564696177696b692f696d616765732f6172726f772d657870616e6465642e706e67222c227265736f75726365732f7372632f6d6564696177696b692f696d616765732f6172726f772d657870616e6465642e737667222c227265736f75726365732f7372632f6d6564696177696b692f6d6564696177696b692e69636f6e2e6c657373225d),
(0x6d6564696177696b692e6c65676163792e736861726564, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e6c65676163792f696d616765732f616a61782d6c6f616465722e676966222c227265736f75726365732f7372632f6d6564696177696b692e6c65676163792f696d616765732f68656c702d7175657374696f6e2d686f7665722e676966222c227265736f75726365732f7372632f6d6564696177696b692e6c65676163792f696d616765732f68656c702d7175657374696f6e2e676966222c227265736f75726365732f7372632f6d6564696177696b692e6c65676163792f696d616765732f7370696e6e65722e676966225d),
(0x6d6564696177696b692e736b696e6e696e672e696e74657266616365, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e736b696e6e696e672f696d616765732f6d61676e6966792d636c69702d6c74722e706e67222c227265736f75726365732f7372632f6d6564696177696b692e736b696e6e696e672f696d616765732f6d61676e6966792d636c69702d6c74722e737667222c227265736f75726365732f7372632f6d6564696177696b692e736b696e6e696e672f696d616765732f6d61676e6966792d636c69702d72746c2e706e67222c227265736f75726365732f7372632f6d6564696177696b692e736b696e6e696e672f696d616765732f6d61676e6966792d636c69702d72746c2e737667225d),
(0x6d6564696177696b692e7370656369616c, 0x766563746f727c6573, 0x5b22736b696e732f566563746f722f736b696e5374796c65732f6d6564696177696b692e7370656369616c2e6c657373225d),
(0x6d6564696177696b692e7370656369616c2e757365726c6f67696e2e636f6d6d6f6e2e7374796c6573, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e7370656369616c2f696d616765732f69636f6e2d6c6f636b2e706e67225d),
(0x6d6564696177696b692e7370656369616c2e757365726c6f67696e2e6c6f67696e2e7374796c6573, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e7370656369616c2f696d616765732f676c7970682d70656f706c652d6c617267652e706e67225d),
(0x6d6564696177696b692e7370656369616c2e757365726c6f67696e2e7369676e75702e7374796c6573, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e7370656369616c2f696d616765732f69636f6e2d636f6e7472696275746f72732e706e67222c227265736f75726365732f7372632f6d6564696177696b692e7370656369616c2f696d616765732f69636f6e2d65646974732e706e67222c227265736f75726365732f7372632f6d6564696177696b692e7370656369616c2f696d616765732f69636f6e2d70616765732e706e67225d),
(0x6d6564696177696b692e746f6f6c626172, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e6d6978696e732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f61722f627574746f6e5f626f6c642e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f61722f627574746f6e5f686561646c696e652e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f61722f627574746f6e5f6974616c69632e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f61722f627574746f6e5f6c696e6b2e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f61722f627574746f6e5f6e6f77696b692e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f62652d74617261736b2f627574746f6e5f626f6c642e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f62652d74617261736b2f627574746f6e5f6974616c69632e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f62652d74617261736b2f627574746f6e5f6c696e6b2e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f64652f627574746f6e5f626f6c642e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f64652f627574746f6e5f6974616c69632e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f656e2f627574746f6e5f626f6c642e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f656e2f627574746f6e5f6578746c696e6b2e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f656e2f627574746f6e5f686561646c696e652e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f656e2f627574746f6e5f68722e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f656e2f627574746f6e5f696d6167652e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f656e2f627574746f6e5f6974616c69632e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f656e2f627574746f6e5f6c696e6b2e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f656e2f627574746f6e5f6d656469612e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f656e2f627574746f6e5f6e6f77696b692e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f656e2f627574746f6e5f7369672e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f66612f627574746f6e5f626f6c642e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f66612f627574746f6e5f686561646c696e652e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f66612f627574746f6e5f6974616c69632e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f66612f627574746f6e5f6c696e6b2e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f66612f627574746f6e5f6e6f77696b692e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f6b73682f627574746f6e5f6974616c69632e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f72752f627574746f6e5f626f6c642e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f72752f627574746f6e5f6974616c69632e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f696d616765732f72752f627574746f6e5f6c696e6b2e706e67222c227265736f75726365732f7372632f6d6564696177696b692e746f6f6c6261722f746f6f6c6261722e6c657373225d),
(0x6d6564696177696b692e7569, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e6d6978696e732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e75692f6d6978696e732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e75692f7661726961626c65732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f666f726d732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f7574696c69746965732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e75692f64656661756c742e6c657373225d),
(0x6d6564696177696b692e75692e627574746f6e, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e6d6978696e732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e75692f6d6978696e732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e75692f7661726961626c65732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f627574746f6e732e6c657373225d),
(0x6d6564696177696b692e75692e636865636b626f78, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e6d6978696e732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e75692f7661726961626c65732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f636865636b626f782e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f696d616765732f636865636b65642e706e67222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f696d616765732f636865636b65642e737667222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f696d616765732f636865636b65645f64697361626c65642e706e67222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f696d616765732f636865636b65645f64697361626c65642e737667225d),
(0x6d6564696177696b692e75692e696e707574, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e6d6978696e732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e75692f6d6978696e732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e75692f7661726961626c65732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f696e707574732e6c657373225d),
(0x6d6564696177696b692e75692e726164696f, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e6d6978696e732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e75692f7661726961626c65732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f696d616765732f726164696f5f636865636b65642e706e67222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f696d616765732f726164696f5f636865636b65642e737667222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f696d616765732f726164696f5f64697361626c65642e706e67222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f696d616765732f726164696f5f64697361626c65642e737667222c227265736f75726365732f7372632f6d6564696177696b692e75692f636f6d706f6e656e74732f726164696f2e6c657373225d),
(0x6d6564696177696b692e77696467657473, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e776964676574732f6d772e776964676574732e5469746c655769646765742e6c657373225d),
(0x6f6f6a732d75692d636f72652e7374796c6573, 0x766563746f727c6573, 0x5b227265736f75726365732f6c69622f6f6f6a732d75692f7468656d65732f6d6564696177696b692f696d616765732f69636f6e732f636865636b2d636f6e7374727563746976652d646570726563617465642e706e67222c227265736f75726365732f6c69622f6f6f6a732d75692f7468656d65732f6d6564696177696b692f696d616765732f69636f6e732f636865636b2d636f6e7374727563746976652d646570726563617465642e737667222c227265736f75726365732f6c69622f6f6f6a732d75692f7468656d65732f6d6564696177696b692f696d616765732f69636f6e732f636865636b2d696e766572742e706e67222c227265736f75726365732f6c69622f6f6f6a732d75692f7468656d65732f6d6564696177696b692f696d616765732f69636f6e732f636865636b2d696e766572742e737667222c227265736f75726365732f6c69622f6f6f6a732d75692f7468656d65732f6d6564696177696b692f696d616765732f69636f6e732f636972636c652d636f6e7374727563746976652d646570726563617465642e706e67222c227265736f75726365732f6c69622f6f6f6a732d75692f7468656d65732f6d6564696177696b692f696d616765732f69636f6e732f636972636c652d636f6e7374727563746976652d646570726563617465642e737667222c227265736f75726365732f6c69622f6f6f6a732d75692f7468656d65732f6d6564696177696b692f696d616765732f69636f6e732f636972636c652d696e766572742e706e67222c227265736f75726365732f6c69622f6f6f6a732d75692f7468656d65732f6d6564696177696b692f696d616765732f69636f6e732f636972636c652d696e766572742e737667222c227265736f75726365732f6c69622f6f6f6a732d75692f7468656d65732f6d6564696177696b692f696d616765732f74657874757265732f70656e64696e672e676966222c22736b696e732f566563746f722f736b696e5374796c65732f6f6f75692e6c657373225d),
(0x6f6f6a732d75692d77696467657473, 0x766563746f727c6573, 0x5b227265736f75726365732f6c69622f6f6f6a732d75692f696d616765732f677261622e637572222c227265736f75726365732f6c69622f6f6f6a732d75692f696d616765732f6772616262696e672e637572225d),
(0x736b696e732e766563746f722e7374796c6573, 0x766563746f727c6573, 0x5b227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e6d6978696e732e616e696d6174696f6e2e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e6d6978696e732e6c657373222c227265736f75726365732f7372632f6d6564696177696b692e6c6573732f6d6564696177696b692e6d6978696e732e726f746174696f6e2e6c657373222c22736b696e732f566563746f722f636f6d706f6e656e74732f636f6d6d6f6e2e6c657373222c22736b696e732f566563746f722f636f6d706f6e656e74732f65787465726e616c4c696e6b732e6c657373222c22736b696e732f566563746f722f636f6d706f6e656e74732f666f6f7465722e6c657373222c22736b696e732f566563746f722f636f6d706f6e656e74732f6e617669676174696f6e2e6c657373222c22736b696e732f566563746f722f636f6d706f6e656e74732f706572736f6e616c4d656e752e6c657373222c22736b696e732f566563746f722f636f6d706f6e656e74732f7365617263682e6c657373222c22736b696e732f566563746f722f636f6d706f6e656e74732f746162732e6c657373222c22736b696e732f566563746f722f636f6d706f6e656e74732f7761746368737461722e6c657373222c22736b696e732f566563746f722f696d616765732f6172726f772d646f776e2d666f6375732d69636f6e2e706e67222c22736b696e732f566563746f722f696d616765732f6172726f772d646f776e2d666f6375732d69636f6e2e737667222c22736b696e732f566563746f722f696d616765732f6172726f772d646f776e2d69636f6e2e706e67222c22736b696e732f566563746f722f696d616765732f6172726f772d646f776e2d69636f6e2e737667222c22736b696e732f566563746f722f696d616765732f62756c6c65742d69636f6e2e706e67222c22736b696e732f566563746f722f696d616765732f62756c6c65742d69636f6e2e737667222c22736b696e732f566563746f722f696d616765732f65787465726e616c2d6c696e6b2d6c74722d69636f6e2e706e67222c22736b696e732f566563746f722f696d616765732f65787465726e616c2d6c696e6b2d6c74722d69636f6e2e737667222c22736b696e732f566563746f722f696d616765732f706167652d666164652e706e67222c22736b696e732f566563746f722f696d616765732f706f7274616c2d627265616b2e706e67222c22736b696e732f566563746f722f696d616765732f7365617263682d666164652e706e67222c22736b696e732f566563746f722f696d616765732f7365617263682d6c74722e706e67222c22736b696e732f566563746f722f696d616765732f7365617263682d6c74722e737667222c22736b696e732f566563746f722f696d616765732f7461622d627265616b2e706e67222c22736b696e732f566563746f722f696d616765732f7461622d63757272656e742d666164652e706e67222c22736b696e732f566563746f722f696d616765732f7461622d6e6f726d616c2d666164652e706e67222c22736b696e732f566563746f722f696d616765732f756e77617463682d69636f6e2d686c2e706e67222c22736b696e732f566563746f722f696d616765732f756e77617463682d69636f6e2d686c2e737667222c22736b696e732f566563746f722f696d616765732f756e77617463682d69636f6e2e706e67222c22736b696e732f566563746f722f696d616765732f756e77617463682d69636f6e2e737667222c22736b696e732f566563746f722f696d616765732f757365722d69636f6e2e706e67222c22736b696e732f566563746f722f696d616765732f757365722d69636f6e2e737667222c22736b696e732f566563746f722f696d616765732f77617463682d69636f6e2d686c2e706e67222c22736b696e732f566563746f722f696d616765732f77617463682d69636f6e2d686c2e737667222c22736b696e732f566563746f722f696d616765732f77617463682d69636f6e2d6c6f6164696e672e706e67222c22736b696e732f566563746f722f696d616765732f77617463682d69636f6e2d6c6f6164696e672e737667222c22736b696e732f566563746f722f696d616765732f77617463682d69636f6e2e706e67222c22736b696e732f566563746f722f696d616765732f77617463682d69636f6e2e737667222c22736b696e732f566563746f722f73637265656e2d68642e6c657373222c22736b696e732f566563746f722f73637265656e2e6c657373222c22736b696e732f566563746f722f7661726961626c65732e6c657373225d);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_objectcache`
--

CREATE TABLE `wiki_objectcache` (
  `keyname` varbinary(255) NOT NULL DEFAULT '',
  `value` mediumblob,
  `exptime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_objectcache`
--

INSERT INTO `wiki_objectcache` (`keyname`, `value`, `exptime`) VALUES
(0x676c6f62616c3a4c4553533a2f686f6d652f69617063686961702f7075626c69635f68746d6c2f77696b692f736b696e732f566563746f722f73637265656e2d68642e6c6573733a3531313731313234376233386435656433656539366465653464336266383961, 0x9d92c16e83300c86ef3c45446f95680a947584f7d87532c410ab90a084b5aaaabefb0c74d254a9d2b48b13fdb13fdbb141e5ea16d8c44d0871c5b73253b1dc8a0f6c26e745683ca21561baf61844cb8aa1ce088d2d599ac859a1298c3d5c83d8ca68375c92dae9abb845420ce03bb2498feda4449ae250b13882d6643b16765981031f4fb68aeed1664c7ad7b985b286ef7f9e349d37ad7313fa3fe758885cd80816fb25eae1903cb1396d40f08df98df6dceecc7eb8cc2189853375b074ffa2880536a20fcec29af389c3f518049dd410f035641e48a1e296f8f3e30a54a66ea4f6b358f2908c1b50128c8d6123c7afbaa7e6d34c432f2f7422194e64835ce728d7392646ef18c52c52e97f3067f00435231e987b5007151b0866d91d5e1d7cabdfb12e72488f1aea5c17e501b3a32ef77986a57e4b39e61b, '2018-07-15 05:47:05'),
(0x676c6f62616c3a4c4553533a2f686f6d652f69617063686961702f7075626c69635f68746d6c2f77696b692f736b696e732f566563746f722f73637265656e2e6c6573733a3531313731313234376233386435656433656539366465653464336266383961, 0xe51c6b6fdb46f2f3f957ec3928e2e44459b22cc996ef82366d920697264192b6287040b12257e2c21497e09296d520fffd66f6412e5f92acc4fed2ba882d7277667676667666764674369a7d96f0cfb12fe5f1959c0d2fcf2e27b3e3d3a7e437e6672225d24f198b89cc361193e4e9e9d1e9d323f294fc106f489ae3a375c8fd90c850e4514062919139238b8827090b08cd33b1a219f769146d088f49ca9761e665c28bd82223926739bc15b1b4f3e70c8127294b581c008035cf42f27d2c1020cea7c417ab158b014b24fceb3e8cc6099f422e0d8921631961ab24121b09c3176c4d7efcf8916429f7af492608f5014212711922a804d0cf79c4b38d4645e157c0484ae325236241d66c8ef0e7a9584b96ca3e6062642564a6e810b1810bd801742e199162c52cb380ded72f2644c4d1a6af4984ff4bfcb0bcf90626f1788938a8e227c9429a9115bd86f95908af80c122bd36b07a84c6013c870d598828126b18407866692f01ccd9920357f139c23e0eb355449e91b90836c704761549055e861c782e59a4b7faf8d971cf6c27d2ba8c45aa69c455cc994f7116600b0410873b2df3241169861880a61ab83ef943e4c4a7203b098ccd70fd002b12e21aa95e00429c74fceeb7171f3ebcfee9a7176fc9f33fc88fef7e79ffe6f50f6f3f91e71fdefdfef1c5878fc7b866b588d7afdebefbf0e2271c06141d5b519028052897e4654a574cb10b3eab257f3e228029ce3cc9ff6233321c0cbebb3afaa2def58e901b6a44c8502ced6b02ec4f817d3332c00f090d0220d87c52c01674c5a3cd8c481a4b0fe4822f1068016e4efdeb652af238f07c118974461e2d26f883a380cc1f01068a3010d95fadbd629e46ab54036961ab0afaa1fe0cf39f8b34602941e913498fe0782d18739181be815a81080370a0448d84b9c92d4866c403f2884e83e9e2f2aa78e9699504b1cf42b34640f10b4b974ced8f1ea5252ca373f918f0327202f2086f79ea2c96f0155db2271ab3590b1038231ea0bfeae08bfa0f5fda276763fcc127014f4190c03acc4894a5c8bb825bf8070b7826f5805ee71b2fe2d7ac9482f68d2b26276a64c463e65991e07108c3b28a54f4c76c859c726686438786f0ac89f1f80d8ff35bf286cf599a0102d0b4574c0040da239ff88ac91e31f4d40818f64725724fef30d27036aec9479da086ecf72f70468d8bf807ec86164833c9ddbb616d8ebb360bd750b275dac8e5cfb9fb61ec7e98347760d89fd4a10ffaa30aca822b0e43dc8715429af49f6d27b69cb03624cd45145467ec5a51c306292d3b49996499d21807d8a34cf8c06757a8f593fd20ed27eafd054f65f633a3c82b05180d53a8ce3d54fb802d681e6564918241598146d135bfe67d09b63bc619ea4c15607b325091000e78b0f812ce7d41f101bc090d689a32aac912372c8501eb19b9e192cf23d6104607925a2a429b699fa1452f265755760cfa17d37161245fc4324fcd699899b337e03289e8060e356d3bf1846f28011a523f82539d02899af24480a7a20c51ca22f0186e1822f90be965b7404af742d43a0c5a34266a09ca755110040ae810ff7c5a1b648e8a9fd194833703fe099eb4c06ee58305fca6af9ebed70fab6862a1e7e791d126092c4297c4cb3609300a06fa57d517ca74cf906fdfb3d51c18f4f494e46974f258bd90a7f33c02341e0726f5e5cdf2f113c3e597e0d8a159475978fff615d1e3d4e1fefa05b9d0a712834dd77e8e129b10c72bbe1e4840120301e47f97b8467015b5a2f822606dc663a4951b007fe419236f0578a3eafcf2a33cd07e0c3c905ad07f040148696406b15b100809fbaef4ea11c800336f3e3724cf98107098d4a9f509e636d4f55c3b1fc5a05fe4d21c398ec3514a5221919f3b45707f8d28847560b8f11edc5911d3482d2df112fbb18a0c0e7c11e59942664dafb1bda9c63ae83b4af793164147bd128a0605c0100f8403bcd9d17438bee891f38bc1f4424b41a94703459c4b8d31d70dd176c77489b91edb2665f64d9b9f5773bf6051ff652cd1e281162ca24982921c89a5d086dba525e26d32383c2b596483196da9b5854394ce71a62928195b3dfaccc3ca36db91e0bc67cc9309f5d52ad7294dcc76bf0661526af92b9c0531b8c9526f7ce681539fe22ef5d4270abcb14feace6c29162a7a037a6a5e1d866db89e58983fcd9a3ffef6cac60ac60e50089ce0604ae07400015fa67056e01f6045963985371983702215527a26f43afa074400d580edc4466544596a0cc0408ee05443a35380949b38a3b7057a1a4981f498a3d221dec8866b7490118ec9b96a9d807b4d53cf223c7116d67357f9a4d76ddd4a4485716d22f2206ade1fd78e75d4a47d0c01c23ff90a5904ccb7063304bb7d0c260f857d0954f3f8986468d9c0fb071a3656841a42639df9e9007f2c38201d424b6d6fa4fef0796fa528cc4d5529acae8cb5012e216fb11c660468c3aae77ce671926775735cd7be738d070e60380f208e671fcb8514b88a03de4455c3b3fec428a87e7036b8591bdd00c72d1170cadc30fdd2844f80d18c2dd67beb15b32baebf65cd5013e784b3f6417509131b39b41e2988b900a0e336a0f21538d3a8b31ce42085135cbea11b91db837e5a8d3675a48931e7234aa913dccd23aaf9d28c0495e56a97fb4eadd1fb069e6ec05a15b45c201e46569e5aec95feedddb6ee6c875854d30276e983f6d539aad964470bce477a69af0bd456908cc75f22c7e0850cec6f1dca54bd8e91dec47a344d088433f36b0eda9bc0ea81403c3350bb179ce9f0662b59b385f073eda78320a0612a756cebc43ee888cf4208a1585a3116979797bbb17a2be9a91df1be128cf8ebeb20cc2cfb8c1406cc1729d5d988bbcdf491f59137cf215ebdf364301f10a6c9af9c5d12af1871b0643cefa4027c5a77c84e37d3f5305d4b5a58af7acececfc10583dd4b04849f2c35764bc54f9a37fae442df00d41d77be489c62bcab4c4a5fdb311ca87cd218e07b97f85f6108df3286796970363047ab32a368c141b51418676adfc638ae2b68a0bc038791c2b1808ef2874f6f54be5c160074a27b91c7f186aca9ce4ca3b1c530d640ad9f994ded6e7505dd203ce40190d96e725bac2c80bd6f2fc8c1742f6ed08e9594e2e8331421f36bb78fdba60f6df25e4d189c3e3dfa084189cd852b9f1c774b474b27ca2557a17a2e750c8aa27bc3d95a62b687063d8279ce9e7a049b2933916e7a202f19a0c7a102c429255449857c72a433e46fe90d5f6a457f4321302fb209372a67ff095177794e6aba21522a14bf296a9a10f6f0eaac469c597fee0ee73e3008c20246af776ca349876f39f82b814acd254eac3be0aeccc49a7b2ecedaa66f149a36dd8b6fc52965690dbff68ce9aa9731e6da086f86e2c7c5c550fd824985cb4d8e9aa0790753b7c4d42f95173ae929eb962abb46c0a305f1073b6de55839e57803b51270e0c7c59d9e35a01d39ba3bdc0db5dd6f8cf0e7805d8b2138a1d13ebeed6e292fdddbce0c4173539ed96da947358dc1e5f6bdae5e191e2c1311efc760d468afebc50c33c8196072dd363a1e5f8c2f5a09ec6b7466c21db7023c0b3c4c2a7bb115472bdde5db56e247232525ca7f28bdb18a4b5d0388f13cb8099d391a231745f67c8f33acb6abd4eeeb83e857ffb21ad55622fb46b05b3cb70c1c4ccec734e8f004db72b5cdf53e332bde29f1a03ef1f6ccfefd9d667beee737d547b5de079106bbcbfa12d15c72b6d3f3aca468dbb1d1dc4cac6da129a771a6bd981fb48b54f5637e6171de0abee969ef20a0451cdb322fba7ea09f6611b91b1530c3baa0e074e2b55b1d8071e876d0f9cd44b6551af71269376d518df2ce3acc80c9505573845ec377b36c682a6e21794d13d13445d3ea6323a4a35a9ede507136d0b4556e8ef5b1eedaadf3007fdac9a58786c916f71e5eb6bbaf34052df502b18e1f24eb5d47772f41df3e6b2a398c5e1e996a4f6f9748db2c89c26d25ba09949c8d072ba92660d269efd17b0eaccb4d7f05ff8089f6994adf1752d4bd5c5b145585f352a5f7daa66f171c95167c68f17190deb71035d7d7d05cfcb8b296dbc9e417d9db6e852e14559b9ceecaa9325fde48ba4b1edd98b485aef002c895fa2e3f021e28eb1b163e278df8326e39356d3c5acf5d9017b1ba755b80a4610a4386ba18512c541a4b2d1fd31ad4f79994f6caae71c4ce4274220a8ef5b60b7385b1dbbc34b50d87df0b57c3ba4ac4d76496e2c64b7ecb2411e048c172a4722780132fe1947e296e5b3c8b3cea1dddea2c348d372896d775691917850b1f5896a771510f6aeb2df45982c942e3631d8c1a1fd8829f1a158316c69a80ef4e5caac7efc5e276957fb6aca0084d76b9914e98d0910e3d387a6866405ae9dc27a430633be2c7e6db83e2c7a744d5c36eb3544d9fa8345432c32a6ed7de0caa5077f89e8d64623b3d46b2f6ccfcb805acad35ae5bd0505784ebe1c6f7f668bf669b45aa8a2552011c30853f580a827fd45c00bc4f9e99812783802dd531e41efb5d23b6bcfca24e869de84693dd082b63b6befea2788050fece0cf81baf1dacdbef789170fa6bac2f1454f990bdaec00a0e9f7ab97e6712513df5cc7db2ebcebcb35ce26c525cb7a9ae899007ccb91d9be7997237f4a37afdb9a9d874157bd41fb6d441180cefe268436892445c15b858534ec89f9512f62226b47648cddf719b56da4facaf996837bbc9ba3d1c6c33e1618a915c5cf7538fd4b29a2fedf2b39d2d0fc794fb66491743aa92a2dde55edb9bb21c637f49f2c2e8218509d1ddbb3c396b6a8a94cbbf83b8f7a0bc7b00ce6de15b55befae092a1456df2cebeb91bf7cca40764a1c578df7c6cacaca8a689f9ca78e5c6a1980e062b6c135cf0186bd335ee22537497f1e22ea3ef3014cb36f32449218657a76dc8239a72911b9f48172fa0ea981a302c68c1d073a143cf466d58195f99785387192ad4f2d80d76f39543db4fd2c177fa246df1883c01b1003783c6d3ef8a345afbcbd6b31853c42dbe4c3373ec94456095514ff925d7582b6e731e3a3d623a683dacd9301720182cc5652586e9ecd99216f26c0d924687719601836522de9c4a5669646c667b0fbd2fb63e98f6ade00fa1fc25b2b08d1f27a6d763e25d824e4841d68c0442b5871a95e4b6146abb71502be9bcefae3752b6aaaf91874279b51cf78a7275f397e6404fc7ce9e84172720133ddb8df8a4f20693763d8bf74997e130981bd603711ab064ec0052b9c02e60a8fcdf04521dc8def3ebed995f8e6c7c5fca5ac53d6e2bcab62d1415a1ac5e54ed10fbce2ac032635d80328986ce78e34badfc099b7029f0c7682492ecea644b1aa275712e178ae42d864fd8a3adcb6a002a59abee76d33fa2a5101ef740371e4ba2aa116d9f14cf8efe0121da89c9ee61c394a243c2fb10e813e913d34caebabd996a7393bacf2d16a6574ce5b9141cae5aebd731ccced6d8c80f567c45825cf54b14f40111e542fae43dea7aa42abc0b20198f22bcc5bd66b13675802f6254eaba475ca3599d3111f85437fff02c32b4c432c3ad120b12d248278a4d8f53bfd2356c5b373d97a36863c0b2e460563d3d0e1b8ac882dfb6de292ba1d5bdcdeddb5adc3ab66ca1129637a6c3e751e2a9669f5d367a3831b76ee6bab022b0b5a2553df44b01bb3d4bb86bfe81d7ae8df2c6ceac21f689d1984526b9a90f1cfcfcb99a1675baa4b770a8a0ba9a76ab7446d8953a3c54e9f55466aaaf7d4e53db09d9c7663ed34f3453edac9e58a81cbf694bf8f77f2e6c9543bfa86b28d7804941d5f012552d07b64898a2faea85af6dbbb6e98b7a21c021ad075dbbb5eb0a5e135ebd85ef5e5fb3ebb9ec19ab5f4477de58779856c392e28fa233bdc5d3b3c963b751a08d5efcb3f6b5086a63e06758ef7c2fd2397b80fbb6ad8277c0baa32f703b6bafbab66e0decf4f02a032c060a82870fee4012ad5c21d83b90fda7b7de440ce683c1459331d6d2fdabae774da1aff2bc6b7f5b01765d37ec9ed92272f5e63255fb24d0741a73b8d09f1a33da9c83fad6da3d6c7ecb8503f9dee4b5846f24734b9eb6aa67f5429cf21b296af6c4dc485505b774010d05e6b70a9ddbbafeb70c6ebf2c6adbba9ae2992629f792722bb678213a14f8bc733dcaa7db4163eadc85b691684ac2402c483786cf473b2abbdcaf26c08ef6346e2a5ec337d8bbca707b4c67f1a95b666cbc78905c6d07d67b49fcec5a61bd5e6da4fd3efcaaadf1ec78c123268fafe86c389a7de6b3013ec56fdf0ac58a9d729af821fc739a80cfcbfd3ff126f314bf85e314bf85439eea2fe83ad5e9853e0002487c3644189777847183f590e058cb02cc1980994cef0806fbb3c1fec4993cd55f8f55801b01b88bb3dde020941179ea63b34eea9f96df3b82709c8f2b7e0b680be8e7007d3a3c9cd8324028408e11e4e87090f61b0154158b053af94aa6ea8ea202dc14c18d0f07878d4605b00b5cf0e070602a5b26339a16102f01e2e51ebb72b73dd7794767a786a83597df5cb68a24698968f895dba70d77090f756c7a7e383c6b7bde80e9b11bf945ce00624865882666046c194e83b3e1f970e84fe7d371e0fba3f128f02fe7e7e3d180ce83f30b98f37f, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a3133643162303230323236313866323838323234316633313562643630313966, 0x2bb63236b652d2cb2dd7cd484d4cc9c9cc4bd54dcc4bcec82faa4ec92c2ec849acb4cacbcf4bad55b20600, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a3438316637643936633839303166643666666430313737666433376364633731, 0x9d57eb8ee236147e9514b4da8be26cd899a9761cb5ea13f46f7f546de5d80e71716cd73164699477efb11d20210cb41512f8727c2edfb9d2e2a7e7d71caf7e6a381324315628d7674a8745cac461fde7be31c869a4c821cd9a0ef9bdbfc89c0ebf6baae5be51482b1eee818f6b397542abeb3d9262c7d375a5b5e3161949286f034d2d18e30a51e2a4503b38dbb7dc36bc6dc916981ae2ac96fe26cd548bf2c43fb1c0d7025bce2aab9ba05043b64a54c7740dd7a0add892a0c4ba158effac9da03ce85b21a33b0eefcba3a07a3ca2da1cadd8d6ce1f49b126a5de3bbf60a2a59288865bbf6b7429243f08def91d807420f4d8030d1873c40a30184acd8e7d49e86e6bf55e31bcaeaaaa008cb4c5eb3ccf8b86d8ad50382f0c614ca82dce877a93d65fd2fa29ad9fd3fa25adbfef2bad1ceab85708975a3220de72545a4e768854801e26072dd8c0dc8274d8cb5e8ad6a1d61d2547ee68386effda13cb07d38fc237bc49f20210e5a88e2f37d917de14da9a9aa8163f159d60ba83c5606c742bd58cdf33abd496815a1be31246da9ab3241c9f8c8c1283aeadf89be3afc6155d0d8e41ad8130c020a6e88005ea2c31381aeaf7853e705b49dd61b2777a10cd36cd3ab1138e94121473f5be29fb093842b582f1111da0ee47bdf202f880738944448aadc20d849ce4c37a2b7549e42f20d570db83d9aec69b3c7f977c271aa3ad23ca158d5028dee493e3c1c3f2c8db27f1537667c7cf648c61313d8b110e318ca5b3c329d12880c8214b6fbcb8a649ce2a4efc704bd4b0769a4eec40a309d5abff4c9ddb6a29c0b78490b31d2fe65b714a81e097016a0355e019481abf74fc9beb6714887229276427fd90e495bbe4060a2989f3ec8537438cc26017023c92ffffda3af9f66b4f7dcd61186bd6e3bc864a6902c811b2b89dc336f72a99f2f405e451a49cc32e2119e0caad2232f308e35018d25bd73e77a2b191a81f91c0abe4c32a21ced90f496d79957c4c561f573713f14db1bffa87bffff0fef3e7f7bffd2b15960fa6ead4ce99162f951a487ae1064b05259864addb97fdc50953ecbc6e8871aa6d6803d7d83ee42754cdad70f7582e4906df87a05c41c7f291d387250eeb824a4eecb8361a9a926761b9045e077e4e4a1f7e499ee4d957f8dd64cf10ba739e8989253f94770c85500a7a21f1313c4af5cb5168583e9019648d72f339c3374552701ab82fe012cb6a3c0997b1362f6a8ab3d0610cb42300f45c9c6375f53132cda3988be341a99dd30d0e0a5ef80ba56669792e5c909ccbaa45293de7d493f936f5eda535bd3ebf2b16165dfa509c5586da35be88041d60f0e0fd4d6953324a8c87ff44e8e3712a27f868de929f2f95e8aeba118efb11f720beee05ce9d30810e1b8d8b46dd0081313684923f69db71df747f34dc11461c59d4d5d99c72bbfb8c0516fc2d8969393e2daea5253f26d02ce0ab4edfba61376e3edd7df769f2766a88a79eefd90d4ca6cd33f783d77fd279aad995ec058e8b397299aa4b0163a0ce999fa277316ec6f77ee20473d2d9eeb6f597b1e886f3a0044384d79cf8683a0f2a79f6e45bf8e9ff410223ee699c10cae7cc05cee232fbc6921f86f2cb5329ae9ea2526ababbcabccd640800f92113479dc39470e5cc738684809d49c395b0a010ad8564f349234cdc53a6f030fced1a678dd9e83c0cabe21f, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a3438663263383461636537643536323337633363396464663137323530383130, 0xed595b6fe3ba11fe2bea090cec6e2d45b22c3b961e0e4eb70dfad2f6a1ed0fa024ca624d5d4ad1711241ffbd33a42453971428d2a268b149e048c3e1cc702e1f8774131e83272ffc89b492be4a3ba5492588645519965549a3a4e295081fdcc33e20691493e47216d5b54cd56847c217d63049d376e08b5df7c9053a49247ba1033923e4e82239af5ea8d89230ab926bb3d00872a9e04c09e6a43c7f21e2ebb67fbc5c6c22483cbe17efe5f85c37e3e3557c5d5d48479c465ee3c1a0e371b7f37d2096f4b67da8ed9a8aa62a09b71465e08a89eba2d9481b56bae49efb8004c153f0d4594e71b3e32a7d032e3088ddb673c2cc49fe21ee162c33d907ffb0e4998a890ffe5c371560ecc76ad4f08aa6c85a655caa5be1723241697bab446adf04a9c3585072b1f1bdb358716e6378a242e718a4846409e136e1ec5c86054b534ebb5cb43965e75c865efd3ae42121c44842dba46a816e5410716665e8ec6861b99d957bdb7cb7cdfd6dbedfe6c1363ff486c71cc4cc133acaaa52da37adb6ac4441f820cf8d3075335eddc21c0ca46554933465e5d996551d3a012d46425c495915a1e31d81a8ed1a68b014aba9384b2d34bacbbd56696cd83b0dbda7a74d97ef4c4ae002c5307d2a6c61715cf114f84d093b94b93729de012881497191e730a1805eedb9562f7f5cd38116a345f3311fc6ea76f0ff1efd6fa163200cb50afae0caeeca5bce1ad026df38b5e55b4dc3e6ef5722e8183d5fcd762d0f350e9e8599156fe72c3e86face1219925941ce54d73f6773733d303795eddc81d11adba055071bf5cdb802e44a072e4e33485b65fa8ab45ad06d52a5742be5f612a7db8614b5020724b69632282305e36f615195555393846ebf5757c1a8e814cf7a0a0fe5909df077a80823e5d2341df25190945d9b7007a535780e19f7f5ab326fb4e6139a46b9e005eb9603b8d86a29212850a0d05992c49c2e122f6394a70d95ed52ee2e3b64241eb2c45319a03eeff157efe8e6410c607483c036641f268d4e4b63524f5171e4f44ccbb41d06556ddf6d3c059b2e03689840d898d9b8f7401e93f6c65299ab058d5a30f851ca9a9a93377069052eb58bea1d72e3154523cb58e0af11e4647c61f283d1552ae07e424b006053bbda0d35b2eac1ee5bcf657d9be42bb9ca6a4857a1ca012920b30118e446944efb4da722b718d1f1b31e64956c1df501797423a2043b1501f3e62a9a95c8ae237b9f6083070348d76924eebadac1b3acc416c2d60e1e88cadec87aaf1084a36f53de51fe11d25f27a512ab1789b27b1f83559cd40d0d870783db92e97d02bcb477d052c3b00b39faffccd2c84ca43b8c4dbdbac47925143f24939c6ad9f75735ea4c47c7d77699138affca35e30a3c2be35691353273c8282933f1706c506168414566555a00ac903e385a5e8b183a456532c8692771b413ca7964cdfb3c56e65430d919028620ccacebf35b97bba5c10edc001ee6527c66ba90fce3e99326a117a1a7f7253229c7c085649f94a3a22c4367a5ecc581c68448c5d627e19d60ba58a19cb263e897bae96cabeecb19a31c32099a923b0b1a66cac7f7bbf8513820eb523cf2ae4a57f6cb1c3c36dfa1d14e8d640a9b16f0200529614b11e0876e14c2ca123cbf04982449c6e4f4c1911f82cd04e896fe9ef7815d2e0b0cbad28d55b1aedb644b488d093bd94114660d0d2f364f1363a73659f3d2c2c583ea92656fd03fa0b74315cd496d821c93d122ed742fd252199cc14a3001a1d6dcb4cb0ab7ec45136cf53b0db20fd663bf6e59867f35585c05fff2786317f6286803bb40429bc746248f054d1941bad35c2078b0e44735a179ec2db513ce6aac4ca72ecf3fd3784ff75fa38578742011f6193b1b58c1172339b6c6f3d72dda9112494235efb17939fffab5e0db8dff7de33fc3d366e7c2221b08d0c6ffed66b7f31c173e814a4b6889c03c4dfeeb5f9eed273dd04852a6844318f5505921dd7fdef8bfdbb8bf8060d0016c20bb6c34472e65bdf17fd9ec9ee1ef76bb3937dfa904303defe0c409ffd40c94fdc2e8ed37d5ab9e062338ea7a1e7e049a4345a037b527e948f4344f19a32c5102fa3fff3bdac452cd65ba5acbc818e77a6cb3f3b32c1b962aaa0b1de9cad835e9534d35010befca6276866e450bec497ff09cc03de1aa9ca743907bae733abd1c9d9377ca6df5f2aed89fff5555aa435928b3a1c24ea8ed00da9ef2c039edfd97bd7372f7b9ad5e3ed60659b27b3e8f91ed43a55e3f9b949f2c0eb0e3e763465cf2f5570c5a1dd55a5e1be85a1aca692235cc0c5de572a06896c439a183539c86300d5d2b5097aa1fdcc517bbaa097d73045bb20f78f64fe06cba3dba4b2153b8fb01493f20e90724fdd72069ad53fe00125441aff04f3101616076fa980002363c0b19ff614800150a1248e092e30f48f87f83841314a93742826d62c2bf1f12bcdd04126c1313fe2721018b0321e17448a9ab21411ddb26c7547d80b43c75bfab4e423d9779d8544c6ab06774b1e348e094c9cacba7ae978c7b5ebcae4b387826840369de39b048f9278555a06121ebd9c5dfe55d68c33814ea70ef8a7227173dfd6d252c23d04fb31b63bc1271b00f2b68d3a8d3e5721559428ff1ca2d6c96010cb9917987fbc16d77b81bae5223f3da5311d6bf9e79c06f8bfe58c1086deb0a5ef00646504ef0cba19553f37843fa00874dc2fb99d3b54205e16a33261af97b4a52e34ac4b83f8face95979b7fcea05b241d9f7e76b3c1e7255fffaf0b76b514310ec92bcb496116b5b9fb9a7da74f63df4db0708db1acfe617354f70285f1a65dcbbf4a98a09a56316ecf1d7b8dde8a0c84aa7b9c635d6cdf468defd14fd03, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a3565323934376231343764386635313432663562356238316134376633646439, 0x858d410ac3201045af5292b5a186b60b739a499da8a08ea82414c9dd6b420ba15974338bf9ffbd9f44ffb889a6730b1b49be8a83a88c6716a72c3847370490d2782578d7dfd15d78f773d736304b8aca8e5cf79734733b11658cff7c6b5b870378b4e513b083a7aa13427ceaaf261aa5ab678bb61af3301b05d9903f0d6d70c098c8832d07aeee6904c9464878869ae10d, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a3631653364333137336264653633653565623337613362646434363762663363, 0xa51a6b6fe3b8f1afa86b1c7039585abf37b1706df70adce702edb7c5a1a024cae29916751415c731fcdf3b24f5184a74b2c1264032246786c3797148aade2f174f9bddfe53743a87a928152d55c895bc06199334554c947b68def0b0541c0f43f31644355314fa346da0e88b229292b9d3cbcaaa5113be1d0670f1d0e9de099d9e50cbd3d45472561eaf4dc95291d1306119dbd35342b35b7022f2784d487a3c48d1941908cf85dc5f28e7e21cdb46c261f81604e7445e3356579c5cf6ac048ec0890b3364e6fea62e15fdf553dd2427a63efd31c79d49a39428479d92d6748c98334e3ffd717557dfaff81bf4fffa09ba7aaaa163ac32970694e1d2988e897d4892c86f8a294eff9847f405d6cacab67d4d84cca80c13014b39ed97d54b900148b3386d640d7a2a28af6effac9baa1252d5c1cf5a8030a3a990c44c00ea3586a02dddc3f5fb672b4549e3f718dec0bfc0de156fea132b9b3aac447db5369c2d16bbcd6211073717a3a4870ee331592c7c180de71d0a2104c6a793cc274cc73d9a89e37ee149bc86ac169c281a3b236de72da82b5246a9389d2098ae39045558ab0ba77ba6086769fc5176b3333bb27f4bfacce839026ea2ba82f31f58d95b949e000be249e5429ee63325044f889ccfced57f41f38978595e534e09448450c52de0cc8a98514e41fb73d32858ad84bc846de7756c331336aa80603b1471a7f9c7c778b23e5073295458112505e7c06912a4b33c27b7a8290714c3e44cd9a1502023cfda0924b846c69ea31651a7023b1d7ba5fb2fdb9fac63c1a40788024d0c019769037292507e9d8cda419b6fd020a779376673c09d41cbf5994ac552c2dbf113cb324e5df27301e92d04b5a61402e02c497533938241fed39cc07897eb9965aad83f2e7e8aa7b6ec850ccf4c15edb41e9e41304aea41a48ae694a4a4d2269bac628a7e228792e5976bce05519d0a475bc17da6f7f05dae76ea594a9436607d0dc66245dd50d0f0519e6e95b35fc415c932561e00e2e0a8adc399e432b4439d89279d0cc4697bbda60bfec628928133ef5e111bb0b02eba8c565b7a8adb4ca71761b22a042ccb82d9d7af5f7bb9a3a5c60c90fcc122d2b4af421b3b76a79a88b2cf998485a405e3d9b56561e75b4c45d04b046b20f28068db486af78a692ab2b62b400db40c81ae6ee15e038665cf11d4c67d08416592a6140a6609751e82ddab16653d37037a67b459653a36ed4711feb4f04578109146892ebdda447190e4729b5560e8368d057d3ed34544972f5bcd6d40716d8fe1a9950961e7d0831b58dd22cb9a101ca345352c2155fe3cf7a47f63c428237541c1476043ba59dd5b297576af21bc88d9d2eb514096f4ac2785bd8995429b53cd23c8171a98a4ce5ba03326b03e13596a77b139441ce84b4a65a53a37daafab9751eed13dadacabc19d57bfef7efffa5b8c3690b7278028d6da73ccd8ee89c6199fc1e6ba00e0a176aa790da9bd3cf886462c7c1cac37daeac83f76d57a4d1867eab2b73d6daab6a8105a343dc20e395785a7b78f39eb27cb05680879640a1e48a1ca23da425dadf1db575d8e80d54c556443914091049825e1c84b4cf040c89f74d9454a8572c4d0a9fd5d27d58143944b0aae30ead43151429aa6d22d41635fedac48c269a4cb0a03b5e1a1f71ec854dfe3c6ad6be8b2aacd4080ca4955d37d073835f868c2e0ef01ec3ef0a798df1bc93c23bfbc49378c66d3d035a2f6fad5e11e983cf021c9d0fcbe605fe95f8f7b4c19757be93476232aa590f3a88d2d382835694a6b9c1539180bb85acccee9d2d4385d47d7757f596c4d77c7a5afa99f4cb761a19dbfa333708bacdd7facc75e857a0f0b96431e1daa97d8bb7bb6dbdd2feee0204150acb010a639c8014da4003d895d082b0b2a998a27e5e39d2a2230622fb493db85d9fdad13c25526f26c635e926ed3ad2f3a085dd3f50d49ef6a7fcc27a3aba7c4c727cb97d9f286d5df9beb71ca27f99267894f1ebaccb32cb75b3b2b7381ec88b27a9e7fc981675fa7e862c2a678bd49c6024a25d883ce5dce44cccc2edaa58c2f901087322fb655ed7a5bbd3814267b5ef15c01febb79027cc897f688038707da5ba217d1a98f116650d98a9441ce2fd57eddbb24ccf3a867b845b0033484ff4b2fce390699fa83286273e0bd3c7673d0e64e4ba7a95147e1cf3d4efa81652f5b4734c06dca6362d50c7ef27c8ce93f5ce99f31269cf2b54dfd24147e80a4dd174ee7ff9da8229a18459d5167ec1652db4902b07dd60de0d80e769df0bc9ffda6a8a00a8c05c5cf89701f5e5f1deb92bb4feb782528e2efee595ece73af589334efdf1e91ddadd2203462b7a8d87a95e4df62cc46ec5fbf073bd5bf1eec86471d0c87cbf2a00f4bd70f1ca326f24f97d8c5e0f4ccd9f0f9f4c03846b9067d10af6da004cb68079ed55b797c6139e66b8fb76394115fc3d3ec077ebe9a89785f5ee19377ad8b8c37e415efcb3be1bbb6858b23ef449a2c7b57e02c734e4456b5ee89687aac1ff1f5093cf06deb65ccd8e60ca307f227816d44108817ecb7d6c51ac97ffeacaba5cf92d6a291b0197eae65faf904c71da2fb234e0f24bd7c36e8f567c42c3ab0fc1fdb2ff97af38037c64ad4ccd4c33652832e60070c492b4a747e69a15ebfcb9df6ee8e5e524e147ba6b112d53ed46366393524251ed6152b4b58504f0ad90f57f7a313a7d6cc0fafbd9dd3ac3b25bb6df283eb86d346b1dceb9cf03329ab8779dfa80738291ee6c1d01068a41ce04333c0051be023c23922ae278e6089e00b82096254520c9f878640d415413022ae51bfc2307db8ba173d3a41a0d358b1c2da59e3c60637b6b8b1c38d15d2e81ac11b046f11bc43f00a2b7d8d1b1bdcd8e2c60e377a06981e93636a4c8c684b445b22da12d19688b61c688d53ac11bc41f016c13b04af9013ad11bc41f016c13b04af90d3ad11bc41f016c13b0477b4c8504764a82332d41119ea880c659c7a8de00d82b708de21b8a3958856225a896825a29588f682682f88f682682f88f682680952b46d6c70638b1b3bdc58a1c05c237883e02d827708ee69cf98f88ca9cf98fc8ce9cf030381b42690d604d29a405a13486b2659ac11bc41f016c13b0477b4486915d259855456218d554861359ab746f3d668de1acd5ba37915a2558856215a856815a6458652c8500a194a21434d93a3be35852aa5cd50afc943c0d9bc6b2769eab60fa5dbfe8b39ed9c38cd033f3aede3312492b85370e94ec19b57a77d7a35534e6a5bf3e856515933524ede0fdafe5bc7243dba93d659719fa91691a5fa34cad209673cd8b32f5c2d4018df659ed167529203916cc27a18ea19c38ee1a8fb0d5524b43cc05966c2b5edef598a378413925dc88483e9bdcd94484d816eff773701b656f63e63b5f8a3fe99a7df57dffae87d782dbfb71fcaec13989fa14f205f617c6f4177f8bdf3c88696f886963ea0a80fe80a996f61ce392607dc59ef1b2afb80d63ea03847baf6ac64bd4fff311f2858271c9a66347247fbe6f8730ef364437915e68cf22c2c58a99ca730e7acb39a3cb0848fc359b955df529f967ff81c6064faaba1b516d59c06d69b5df6e83f0d68e1bee70cd47e1d5209665087ab20731374f79b8eeee380c56eb325d9cda3327b15f5e3273f67d5a1616a4f806b9a6c1fc6339b5ba0ce58f656da73cdb6cbd779dedb088c1380cd828dfdefb9e3d966e953be71edaeafbd66da41f565e3452f84a405789a3e2a3245d3ba6e2f30fbae3f9d1efd643942d25d3dd277bcf04419cbf3102c28c1cecf7a47030db51eae87be9f850d32938becd9555f36391f1f7d2fb5f13b87f8ced496f6d470c5acb4a140a287256e688f2b85cb139fba3dec67f69dcfbcb79a2beaf9a4a7d39c3b5292e791f0a3e78cc0bcbd2aa3a6b906cdd5b86dda6bb8a1a3bd8a3670ec3cf71a1e5a59030bd3421ccc153cba771f6eee6fef4cfb0ecfc955c72d309e6c1e9deb80783fc5d381f66773aae633fd3754c2686af48410b755e3a27b0bd2df635512d2412e84a272f44941f492d1a43984f695ab178b2410778da2f1abb9f17fd93f3d993837e259c3b85298da44474f68dfe96d9a0ecf343932e51938d5d3ce71875d319e72d406af3c5274776e2e88e2e94db69336f4b3d6e8039584c0ac3aa5064edd0d8841a07dcdfb49a36fab1ccbfa664de0e25f47327a36fb3726f06eebfe0964b7b85b5037d5bc6e12f7b471fb14ff1f, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a3733306533346636616439336361383130653439346537366331383931396236, 0x8d556b739a4c14fe2bb69dce346395958b084ce71d34d15863bca1a8df167605e4b2641704c9f4bf773536f1eda4d3c2008773ce9e67f75c992e0220e91f9b2961194641d6704992c120c1f43986d40b121dd4609e11832b045940127d1794181919497560f838f0fc8c1311de65ba023e1b552348102ef51600c0d8715b0d1654586f4969f9e31d10dd27070ee5e69411aaa72448324cdf149f5f51298e60161cf00b70b38de317ccc6093485080589a79fd835e9fc3ebf5acdd6498f03352e3b6d3595b6a870a64b220ef8a92db6e5b66238d00d3d4af204352e829d7cba0d8750c477d94acb1a2351806a9f908b34a419192ef9d17c8848c13d049ae06cb6066ad473e0175151befe7a4053b9b9d8695088829ce94a5a724ef9b65ee4f639932fffe4baaed128b013723765142697f3c328e228a2c26a1832cc9ddc207966346252fd8b16fb0725f2779dbf29fc68b290533149884348587b8be3296aa7887c08e294d00c26d95536ec20c2e899a4d00db2a30eae24014f94e74b741be778cb3c1446ad761d53f1ecceb708529c6298e909b950d7b2d77cea9c3c0e3eff86d5707dec863cf1c3e7ab45410c3dace734fa826006f5f3af90261e37cc705bfe1aacba93790146038f98fc7a5c2cfdbba5c7a9eee9d79cf5cccde9bbeb089a7fe26a77d1dd6c3597cdad3d372573b39ccf4c5ad2d57d668b0ecacf4f858217da2e995a61ec6f6121ef54103aac5e0d252c24f6a83eb74b094efa117d50da8ba3b22829cd076dcd8f0eedc971548fab7a6774bb58a3358e9d3d08586aa9d99ec95b6be8a49beea11c2c06a36a6be13e75545b88f12300222bfa0c2c3b5996de5b615fec1e7a4ff68cda92a2899a63b151ac6c9dfae2aeb00b77d329ccc4eb6ab1baada33a1d4eb74292a2634b1c2ba9ac261db466bd8db9034fd32368e3c11885597e9b6bb35dfd7b3c8aa4853dd65a4fd5ca7dd432d3b9db84c5183e81ece8b462c1224a386da900474277d4119e609b7da72a38a25ddd1296b9029dfa8408d10298e1b29b0efb76b4d5eca95fa60c0bd3fb89ba712613b7da3f80c37625468fe5749a0d54096dd6e37a7988c52aa193a8236501224fbd62dcf5366b36ed77014994453ba5753c52ac516eb7d5c83bc0d1a1df891f5a28db590f92d8bf2fe7e8584aee2cf5d4582e35d65b8f426b5899f2c3edbd2c5736aae072a7b6fc8342ad819c1f2b376747a75cac5568f9ce78d6597bdc2da9442bcb9a4d82a1af4d1fa36a23f517f9b6a4d53ec6ad8d9a0f16ed70cfec89bc9feec7727fb59f6fd9e1560e27da3ab3b6d52ce9888fc7ca76415735e3addff64cc19f6c16037f5768fcf4ab04d27d7da17600301fc4ee90954bd3b11f2db2571dbf9bcfe2ad3b617d4446cb9e2ad3818f7bc53a7e328733cbd5f633979ab7c373f22e96abc97ca4f436c3e1b71be3dda2108a200c048a19c9a98b99c0a8cb730905f0c46f42f7546fc2599d091ec5f8aaca9abc8afe439abc6bdd7c08f0bb857aaafaebc9111186dfc60274785bce33fc3a0240add9e1ed9d5ee6d2cb98ba9a43cd73f73f338a97f6e19008fd6f46884de975403811dfd29f9b7de1071cfb2c46d825149e379590041bafedac291abb20e2638df7ccd4875f2e826f22b8f9fd5cbfa6e1efd07fb62dbf6f5be6b63f1a3f01, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a3863306335366436383462656333323336366335363865646266353434346663, 0xa557eb8ee326147e153ad16a2f325e6767a6dac16a1fa17ffba36a5718704c838162926c6af9dd7b0027b1e34ca6551529e1723897ef5cd391c7a79717f2906b639dd43ee372bffa73d75aec0dd6749fe5ed01877db8c8bd89bf2b66d4aed5d86811ef0597be13cc4ba3aff758c9adc856b5315e386c1565a28b348de45c68cca857526fe16cd709d78aaea31b606aa97746859b2cd71d2e5078e280af03b682d7ceb451a1966eb4ac8fd90aae415bb9a151895527bdf8c578c9448682c235b6e62080417594cc64e988197b7472d3f870a4e48a5666e7c382cb8e292a5be1c2ae359554622fc521ec00a53d65c71e68c09a23d100c2802ac38f7d45d976e3cc4e73b2aaebba04948c23aba228ca96ba8dd4a4282de55cea0d2986669d355fb2e6316b9eb2e6396b7eec6ba33d3e88a011a98ce225b20006ae9ca05b4c6b0090d0bd917ce07e413bec54af64e771e78f4a607fb482747feda81383ed47e96bd1a2a20450056ed2cb75fe45b42532ce365477e4b13c486e0eb018ac4bae65868b7b8655c671d06b6d3de2b46b0447f1f86466121995ede4df827cb5be3c34e01cdc5908050262ca03b0c007472d4996867d69f6c2d5ca1c08dd7933c87693e507b9959e560a14f3cdaeadfa293c5277928b111f20ef47c58a12188183a9c254c98d262dc49d028fad36ca5454fd0a72ad703d18ee1bb22e8a77e807d95ae33cd5be6ca5c6e9a6981c0f0198b73c7e923f657776fe4cc6181ad3b314e710c94479379cd28d018c42fbfec68b6b1a745671e2895ba28695376c62071e4da85fc267eadece2809dea5949eed78b6dfcb531e44cf0c084a04d3e01c489db0f4e2bbef67249809a5a674270db112b5bf64088e99498afc59b4034aa1184dc300c9ff79eebc7afd7920bf66318cd5ebedfc869a6923d009b6b49d4337f72ca253a6a194bc152ec3d9b388e600ae709aaa3cc04c6285c86e5d871c4ae626a27ec4823ca00f0f887aef3ea0c6891a7d440f1f1f6e26e4eb727f0b2ffff8e9fde7cfef7fff573a2c1f4cf569bcb71d596a0558651776b0d4508f69def95dd55f1c31852f2887b960c6c5a6700defdb0ca56e8493fe1ecf25c98042c3c9a176410b0b01d4c72589eb922941ddb8b606ba5460e284026e7b71cecf1085a84045fe157ed7f91384f09c27b2a901c4624fa02a2ac9868bdc10cba3d8b01ca5c6e51b42a3b0517031cc18de94192818780e7c18a14935369d248552a95e1418efa0e158684f00eab954a7521b22659a502929c783ca786f5a12351ccefca5d6b3fc3c5731c8d26509638c9d73ebd17e9ffaf7d2a95e9ede950b932e6d298d2f43e3db504da20e308b88fea6b42919a336e07f220c413995139d346fd14f97927457dd11effb417727c4d2f33bb1732752a0e326f392593760e01c6a48ec0093469ef6ede15b2b3ce5d4d3458d9d8d2eb7bbd1586cc1e58ada4e90d362b892867e46d039e0abc95ebbe1376e3edd7df769f2766a48a09eeff90d50a6cdb408b3d87fd279aad995ec058e8bd97299ae4b0163acce999f02783181a6f761080573b2d9eeb6f59731e986f3a0124390378286703a0f2e45fe18fbf9e96f0382b1f7345e481df2e6826779998753ed8fa3fae5a992574f71a50cdb5e65df7a32118002311b47a5e3c870e5cd738ec4889d4923b574a0106ba4e2f3b1234ee153a6f030fe1b1b078fd9343d3c94ff00, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a6163663034666230396462663133336561323330626362373662376662373463, 0xed3c8972db38b2bfa29d94ab928d49f13ea4da433ee38963c771ec2453af6a8b22418936456a49caf251fef7d70df0000fd9729ccccbe4c54a24124737803ed06834900e145531ecc16fff9e112f707aa99b1012dd4db35978e7c75126a4c12d19c892b4718f699be3d8bbb99b926032cd68ea70e62493201a48c3b9e379413481275acf7766417833489d2815529204fe3dad3a76dccb49122f224f70e3304e062f7c033ff7e26c29d0120ca010121f319059095886e7719c782419c8f3eb5e1a8781d77be1989ee9db79869060c38465e0655368480e2a8be70301aa0c3b90d3bf61fea6e8f8197a4142dc2c88a341982565c37af8006394a52c73735586100697e46ec5209495e677611011211fca209a4276568ea6a893594faa4a4fe50add54a901ffed308816d7bdc3604c920c40feb6b94f6280e26c7e0c6624dda478873c3259548ba119c75916cf009fa273235d43ccb3816891597d40f0010633ca489461616ec865be6cd1e81c0e625b5954e5faaa71cf3af76cdcd57b64f0e02451ade0175d2c7a5726f0186b8d5356b786955b32ace338f4eed7696a4390caac1759ecc2c8709cc4121a1556095455cd0f92347b431cecdf5d7c45123f8c9783ab200dc621a9132c88bcc075b23849efa090930da8c80c9ba359b540122d9332479c06542812123a59704586b7088c5c0fe41518eebc209d87ce0d7037053f0e63f772781bc3e0cbc3bfd733efbde04a24b37976f33e4eb2906465e52886dc4508f44ea145d94d4884ec664e0690ef0eb9c460e64cc86091842f3d277306f4b59f5e4d5e5f83dada50b737d43d78da5024189e14fab1a1ee6c288a2c4af00da92472631c3e967cf6714fb03043dddb507737a411000058500e6044292b34cdb2f9863ada50f6e0df72b91497aa0892072f8a046453f6680da58d5266a9544db1349da53002e4c5548a3f47ee06891b1228e25eb36c45ccebb8372cc12e129246013f084396b4a1a892a42b964b9fab9ee54da5afafbac7b4bf0c2e837e7a194469ff1cf45c9cf46966da1f2f4220971080121001cabf6cc9d3ed577f0bc8a3c499471350c92931b4cde07cebf8c3527abb3f8947f077747a36dd3d9be0e3197ddf1e1dc0cfcee2f3c57b1f13b6a20fa71fc377a3fe72a73f7a6fa99fb6321bd3df5c86bb27e71fb4d1a7f7dac53289979fdc0323de9dec6e650707a747dbfede477b76fc6567b47ddc0fc74707fbdbfd1bac37da0df73e5e9e2e4e66dbdbaf7aff633f6710a05bff22aaec5b0808c6e17e9e102ae2c060a4a1b6404fddbf00b922477116b8e4ae2676a88612c266a38fe43ae3d582867aa4c87c974e603e29e68efba65ebe6b8beee3e25e08b774ff622ecc817fe3c8092b48ce18e6df454686b9be45854b3509bcd4ea8302e321a0aead49369fd721e558a64d0c9adab43c2a93a106340c1a632ed3b98e293fac32e42d8ebcf5b5c98416e7068896584e816a423a775c6cce3271e680351316a09ae7d0c44d7c71a09d45026ff994a388287b8084b74c123227d0b228ce9ff8bc75581111568c28abb2aebf6ac3c02171126192c09c012cf2324b605e993b093c6f72cfaf36bf91425d647e4ba16e28f2cef1f6c72fef77a138d3aeefcfb60e0f200361084cb17ea2fa09feed7c0440d2e9f93e7c531d8a89bb470cdb83ea781fa8330ddc141e69f53d569d0244cd27cba29779bcba65ade956db81c7120e9d1b92fc274ffcaa6921af34ba066a5c3e5659b66d1b7e5859569d5591e6d7ecfda6f60efd90ecfa2c232b45d1fa44235aaa51e45c0564b91517a02101ffcb98c3ca15c475c0b2102ab662e523b2cc6b74d64276514754665879d08cc0ad57841ffab903cd6dcc5a26fd63407254ef64d15681a3b60dd1d00d57005d0ab9dbb2a8593abc68507a5b15655d90441b9f3530715d50540a4cabdb20c392c97e2d5a49564cfaabe2ac8bbfa6ce0610aa68b6418bc2144bf3245363ef262b6be8167bb714282d3104344562052586523294fc75aa89b265426143cecb82d1a9605365b404e0cdc4174daa1aa12ba680282804db90e1c594f3b65b16f6de34b07b2aedb0c110cb0006cc00c5867cc9d6040d706fdbf808d9a668ebecd7403816c0b3e9704a865ebe33f450dd30e9780930a49602282c590170d05c402019ea1b4a8ddb865db12e2911271d23c464d93922dd666361981a7dd328457543dd5644cdc0e6e8a2a653d2ca941426905bcfbb50beb21e146073101ae03125bd0048c1e3c8184a8152cd4728af54b6f0b07c6a76b66e443d4fe1aea3ddd1d632c7baa7535bab854f88856f8e929b50ea73ae0eebf1bf05b33998ee4e94ddb7e6be7c7d0d42071f9c9d5368983bbd6b4fc2850dc14dc2f9bcacb3799dd5ec3223f21c3f4e669bd56b10cd1759691bd527760d40c2ba030cb0d93c24a7ac4d0558b65a61ae0459110d9cf3e90be8c8e5700640d82b6be9b5506456ebe8bc3332e21996e687d6342f8ceed51562282aa1ef82793e98d703fd1f2f1cc7c91d17e310a8dff66e5013a5db7c78aa15be8b5f27cc0adffad2ff7248537f3f436bfbe4e0cdc9e7adf404cb5cecc4473b7d533dfbe4452499cede9ca73b277ffc9e1c7d3a9fa83bff9d10633c79075fe4e2889add5bbf7f38d37793cbdf2793c93ffed121360fb326a3312c8d3d429953977c73dc9487726861b87b94d7dad616fb11ae5becd0e49fcacb9513446a8f3b275b3c81dab05fb0f61f501439a7e17abf4482ae889ed4cb7ff19b33446515d8a2e6ab1a0a4b32be0c40f8e6d01d6805d8a6192c1cfc8084dec3e8077eec2ed2bb7891a1d66032f560051184c425d338844128e41b2c9447b008b354a0232a7c65f5f8f6eb6a0e8aa1c959c6236e9c38d48ff7b48a2e8e6a288c1759f6e4ba60ed2cc22c7d5ee5aae5775f45eead55c861d5c89758b5d62b9679856a64fa8b7709bb0b587a2583791cc0f233196293e862300202daf8077c5b5b9235b8b8bdb41a963ead69e001a0afd413009caa09d5f66df307581435bc4ccf7231d5ccfc07bc49ea36a248b324be24025729afc3324a6bcd70f1d3f423a17628c1e5465e699683298bcb0ef835e55000a3b3b2933adc580d2756dd8555ab0a0f93f289595adfcfcce21806ed2cc93475e57bdb598f326929902e41c1eab19f877c071d4aa029e59513173db057b4451f41e25b16563d9b37dd723156a8d1f6edcc8d456e6ecc2ec80975ee9d488573effc780ae6c6c1e876bbfff9f5f5e8f3f8338977f6f647eac8beb99423ed62b1f5e1d83d2313df493e5dbc57e38b3fae766faf53e3e275743399c5af6f6fd34bd38ebebcce8eafbddd69e8ab676fce27677bc9f9f21b9825993316c609712e292125dbd3561b256c3762955d527981ea06f7fcba49ae45d84112aa8e9fe152ab5b37bfe8b9063de9ecd863547d4c34ebf4434f2547c22ea765e786ca23bbb11d9b9e2a7ebe1d65b72e73f7fcc1c7545231f5b8a02c397d3bfdb03b7a7772bbe31de97d7d115c2f76dfeeccff3bd9ba0815dfb4969eb2737e21bf568cfeb4dfefbff73372feeec8bc8df7c9d89dc8fd2ffd3f4e4e46e1e82c3bd95e5c1cfcfe8e2e1b4ecfce8f3fbcd5b7bf1c1c7c1d352358243a61b570905db7ade0d794d162edd0e5126e13f99f48e6da1ab35908f2db496244963d6773453addeacb8857d8c38eae5bbad501252521bc43c16f48fcd10915b1ab73c5a78bba9ddd42ac8fe2fd2ded64741085ef267b6fc987b75badbd96af211ed897389f56d45314cb32917a0ff4b873f0aacce608aaaaca0cd7cadcee9a061108ba467a4ea77f3f671cb6c5fa0465100600f04161176dcecf5079481aae07969677493234ddf19ad67973c7a9dd927f726de96458e0f8a8bbb5bf268faf32069ecc2f4881551c5370048db3a0711e9db591cadcecb38ae0ef48b4b8ab2fd7b85a0dde6a39b5680c909864616f2544c8a4562bd8a953e2788d823454a3c2f78bbfd6e2af87b614bb798ff332558b7ba543c3a06bb2e6ba15eab6694eb4ba8e608cd9d03c4d6d6672498c77557e6b9661c3cdae211f93c326f642e5691e7e3a9ae3ace9dda0f01f5fdfaca68e9324f152f0e26554b9d03d53f1a59fd7fda074b91f8c95fe025dd4252c6e88922487820e8f3a3e0aba407f6f3ba2584c1b3f0defc0f7f609344949835d145f6f89dbb7760cacc7432543e342a067c262e0210d50b80e69337205d086d5537469960ea9db75ad92eb146a88a33883afbd3871c9e9345e32e15cd92d1a3f57afbf878eeb56b527ca26f57e57a36bd8966dff92d06748a8ade0e7ff4e423982a29c1aae2b197fa29c76f253731ec25764febb6a33916dff744e4d6cfaa19363773073beddd7dc274c83f00abd842c401a2095e1d16e08bdc6797fca963a4e184ca2baf947bd425d2e42ecc0608a6ef9b21b9b0fca75d9d9872ccb274680554e8ed2efd1e8481bfee635db4572a21ba4fbe55d6d27f7f1f2f0ee11df59841957536ad68335fce38dabbb78dac857af02ab0dc2ee50b4af5df215681f5af2e565ba17d6edccb517d67fefe10183a6bddfcd369588a4198070cbcd580eca032b889a5fbb1befe3be38fec441fb40c24ab0687ab65764ff2ee6e34b72e327ce8ca4bd2486ae913b3f896777b5d91a031c062cf7a5e491c92b6e7e6ee77527df67f16aa0aaf110d8227755c63d74062bfe143df9193af1c2758445b47432779afbaa3631894fe88a6fe88a83510c987878f65545b911ce32fc0f7fea86adec72c9911edac62d251a63890cb0f2dacd7eaa7d97d7aea661df75c7e42733eb9e1943ca6f1b1b0f5a8530eba5ec890dd77e3e5a5c44ac53164e81fa9011fb7e4ab23296946d30830542e782d2567415e2f93e6f2b76542f4e3374d437acf1e3f5e595d5fd7a5d786874b0bbd3d772193eabe5f18c37459226aa869ad347c9f7b245ddce07f8264f5245d536eb31c5e3bc1223e6689a10bf6ca7c3f20a2e3d8b822ce7168cb33bc5e9ff383a4b49a33315dd1a76bd25ca18998ab1d49a112a182d0a6f9aa84916fdb50c0dc364313812f142375559b45499656aba00bdd465411115cb64cf9043dfb094c0ca606581562d600a08b4b56400c9dac0e8561546c0ee0c4530ddb1eec97c161fbe2089185822dbd5df9fbcf6a8291bea1a80d65adf3d36b35bc5ddb714fc135567032a91c79af29329cef535df8f2c379cfefa8b094c435c803c63f37b8b4b275b77581a6c65bbd991c1c2249f618808d390e2763553517f3291fa658bfcb245fe5fd822ae35567469e34755ad4d7d83fad5516df5bb8730ae56742d8b8453b1cf57b06dacbee69a3fdb52efa7b7587e70b16a0b9532364defcf335aeaccdd61b788614cef8068895591f10cc1ca21b07336eed8feb51ef88b499727e3e7af205d05abb19d3bc750ff4411eb60f3f2984d04c559901275b1f64c499aa5bd20f203b07f488f3566986f17ad57365eb7e49ac5f8035cc5be4fbe5f35ccf77f0472054392b2229d1e5869033db0c396475a889300ddc45840373786ab323a34130d006aa9a57a58103bc8395b0a9173154c6867f1329ceeed50811d24a2e5f18ca980715ec5cd548d409da706f23e514952f45528b1271bd6abf6f66c7ed155071be7c35c323123e5667139047b604ddfa4b0045c39bc84c1decc2fb07ac5a7e31ef2668eed5587bc16f85ab203a872783dbd0241632ebac0209b3f1346b3fa5a556b5777dd17db7c8cfefcde43f30831bd4cac62103eca70ddb36e79f449b9b538553b764eee5f203a8e893b8e39570de25aacf0a79ef35baa0496d8b82ce905bbe7ac858205ef3541e2e1e8309ec4ab24493630ca8d85dd953de5cef4617601a3b931bcaafc93c30feb679a56855e33698f087f395d71775a77ef586b6a5baee5496eda6ad6ef1a70ba6b4b0fb387257d7b121e01a78771b9c8c4fce6b49ed438c2f8c4e3c78f5cf6f2c488d6031656ba4d83ed47f3e987e8929ed696d869ed4fe6e7bd9446b4de8cdebddfe98fcdc5e1a75b6b79aadfc48bbd4ff2d9875d3f3898bf914f94f3ad5bd3df7f7f2a7bc7fbe4d9b1fb6c44b960559538f2b888dbef1afdfacd6cf9cd3bb5d8ceaee0cfb648e644ea150fecbabbc6f498c710b4588d6f0f3e72b714225bc047ae5d9fc7f6411f05f1ccdb8ed6c3b0eaf6a39543d471d1110c8b804125034a3801dfd7440dcaa21688b276b566d088349624abd1e14221bde6a5b5c591dcd875d1a50b48d7c9c7476a34d882bfb2022bfb710c4aad7db3656ddfbca284c9343e7f096505e5dbb04d090b19a463f3bfc6cab5b0eff2c6484e1431a6a7c637b57ef7f25f6a5fd76e1d5c59a8117ed31ad55a400ede8ac04556ad861cf9715b1eb4eeb6d24b0656b4232902b69acd60c71b805ebd95103970dcad89d07a924475fe6dce8c8f1e0a79aa3a2e90d2b0363c765c6d8ca88aeefd50de335cb13a91e78478f23c3f83fe1dd6fd5d71b14a73ddbfd6625b2a4ecd57d75531af802e5b535db42de55c06567e03c9b7fc42bbe15bd045136f6392e437b27ca58baa7d688b1ade552599a2ad9a215efc24d3af43cc4537842daa7a0866a361e3976551678285fe054bb20e3551a109baa675f90e24c37fa035b668e38d48505d92b45094687d4db42cfdd0a2707511afd5821fbc8b4b62f72741017a0f99219a8a1a422b2c05db827756d19bba2c5d79c88bf1e7392056c8033a216455d3befbe6e4e3f2d8387aa382597e5fbbb7b90732d27b59c5a5029bcdaf5fdd75dfad2cf3772bb3e99f5ecccb7f974b873566b436bcfbca5c6f1f55e4ae816aead5f60aaa89a876292557af6b315855baff6df8bf, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a6165336661343537306235616330633663663762333737366338616534643666, 0x8d90410ac2301045af525c3bdd89901cc313c4e968436326ce245629bdbb56411414b2fdfc37c9fb6a36dbad59b55a8e47d2ec396ae3dad3084a4eb0dfbd62083e0eeb9a92e9f94252577598fd85eaba07c6a213726031fbe070b099ae193a4216b7a02672a4f9f31608690919b08850cc555a95cc0fcb5af287742dfab9c1d8fbfcadfb0f6b5a4d84de05381792dbd42c5f3f041e4defbb8ea20586e796ef9c42f049bddae64ffe7c1c3439a4c7eca3b834afec1d, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a6265353166626234386565326165643166613565383033613132663237383831, 0xed3c8972db38b2bfc29d94ab261b93e27d48b5bb4f3ee3c4f7994cbdaa2d8a0425da14a92529cb47f9dfb71b20295e92653bc99bc98b9548248e6e007da0d16820e9ca8a28cbdddf46e93878f4a230e513ff817425515c7bc2b4f541e4de3f8e883f1ca534b537b6e3a11f76c5dec4765d3f1cc213ade7d9633fb8ef267698f009897def89561dd8cecd308ea6a1cb3b5110c5dd779e8e9f274e18cf785a8441e403e2210a322e204bf0cc0da2d82571579adc714914f82ef7ce365cc3b37a2c838fb169fccc77d3113485cb80a5d1a4cb439d5e0b7efad7cbde640d3f3dd78f8993fa51d80dd2f8296f1a6d2371fd346199eb8b32f8c0bf218f0bc6a1a834790cfc90f0d968fae108b2d36240058d8c39715e7a24cdd18de40af0dff6fd707ac7edfb0312a700f2b7f55d1201147bfddc1f93649de2ed9591498292210280691a8d019fac95c6ba82b8cc098249c6d501c10718cc3025618a854b432e95cbe68dcee020b6854595525fd5d2b3567ad61fab3dd2cbe0444199c3cfbb98f7ae482863ac344e5edc1a566ec6b00ea2c07d5aa5a95559ea71f34aefd2c881b129f1124b6854798e9d04cf8f93f423b1b18b8f5c744b622f8866dd5b3ff10701a912cd0f5ddfb1d3284e1ea1909d76a9dcf4ea233a6f83289806928c9b44894f252326819dfab7a4f780d0c85d575a80e2d1f5934960df038b53f88320726e7a0f115040eafdbd9af9c4b9fead40c693f4fe388ad380a445ed3082ec6900544fa04de97d40f8f47e42ba90eff44a89fed81e92ee340e7e77edd4eed2d74e723bfc7007fa6b4dd95c5376e0694d16618012e8c89ab2b526cb9220c237a492d089700459f2c5f90e6f6286b2b3a66caf897d0000b0a01cc00813566894a69335a5bf26efc0bfd96c26cc1401e40f5e64114827efd01a7213a5c452a9b662691a4b6124c88a29147f86dcf163272050c4b963d9b290d571ee59829527c4b5029e1f042c690dd4bca8c9a6439fe73dcb9a4a5fdfb78f6967e6dff89de4c60f93ce2568bb28eed0cca4339806402ede07552000947f59a2ab59efffe6931ef71c7526e1103473427475ddbfdc383a9d899f7787511ffe0ecf2e46db17437cbca0ef9bfd3df8d99a7eb93ef63061233c3d3b0f0efa9dd956a77f6c2a571ba985e91f6f82ed93cb53b57f75ac5ecfe26876e5ece9d1f6707b23dddb3b3bdcf476ceadf1d1d7adfee65127181ceeed6e76eeb15e7f3bd839bf399b9e8c3737df73ff6b2d68fc6ac300fdfa175124cf444830124f9398504107162335f505faea897b07b2450ea3d477c86345f6501fc5844d4be7e42e2d6b071526e722f32019c2c4924f224f7505fdd814dfe7653e1770111a38e127c0c35168077350f600a6e2694a7a99e645d54bf509bc30a551a808517c2a8140b55b11ef725e8ba86399265bd2d4ba1d52b21fb80ad8c0af0dbc44273e8ea941acd52b5b20590f2a530b2694478996988d80747c32b11d6cd12cb627385a293f05353d8166aee38b0d6dcd13cab65031948893032c6543252613024d0ba3ec098ca079e62a2c8918e70c292992a6bdef3560e0a8d8313f8c6102014ef93d8d619299d8313caf979edfaf7f23d53a4dbd866a5d93a5ada3cdf3afc7db509ce9d9e38b8dfd3dc840183c53b1575453c1bfad7300249e5deec237d5a698b87dc8b02d55ccbb409f91ef24f048abefb0ea1420ea404912dcd42d2b5ed69a7605eebb2c61dfbe27f1bfb3c4574d1059a5fe1d50e3e6b9ca926559f0c3cab2eaac8a38b963eff79577e8876855e71b49ce8b56a71cc154f43ce7d627b38d28070d09f85fc21c562e27ae0d56063f672b563e24b3ac466b2d6417a54fa58695070d09dc7a4bca433fb1a1b9b5f9cba07f0c4886ea40122c05386a5317744d7778d0a990bb2909aaa9c18b0aa5371541d27851b0f0590593d7017525c304bb09522c1aecd7a49524d9a0bf0acebff86b686c00a18a6ae9b4284cb6344f3454f66eb0b2ba66b2775386d2224340534456506428455dce5e47aa20990614d6a5ac2c18a1323655429b00de0c7c51c5792334d9e011058560e912bc1852d676d3c4de1b3a764fa11dd6196209c08041205b902f5a2aaf02ee4d0b1f21db102c8dfdea08c70478161d4e51d78a77861eaaeb061d2f1e86d494018529c9000e9a0b08445df948a9f150b330562525e2a46384984c2b43a4596c2c7443a56f2aa5a8a62b9bb2a0ead81c4d50354a5a8992c200726b59178a57d6831c6c0642053c86a8e50029781c195dce512ad90865958a16ee174ff5ce56cda9b729dc55b43b5a5dc64073356a7535f0f111ffcd51962694eac4abc102fd6ffe780246bc1da66c2aaccc7ed9821ba40e3ed4b048a069cee8b16526ce8d89d24c9c4dce90f254546d3327b21c2f8ac7ebf3573f9c4cd3c24aaaceee2a808445089862e34940ce58a372b06cedc2dc0b922ce838f1d3175093b31e370628ec9d35f58ecf73e76bebac371222ea1556885a373274ba1c6f586b8821af34b92bfc21cc17825e9177b66d67de8c41002cd07479504ba5c91eafb1c9b7f1eb84d9e41b5f3b5ff769eaa70bb4bd4ff63e9e7cd9484eb0ccf55674b8d531948b2b3724f168fcf132d93af9e3537c78753954b6fe3324fa6078005fe4fa901ae11b9f4e2fb4edf8e6d37038fcc73f5a6467397f322ac362d925944335d1330675a128c616c69ba3dcd6b4b9d80f7fd760883a07cdbd5f1941c4e6b89704ac4ca026ec77acfd7b1445c66be8022890a07f8213b9ec17bf4bf6a8a4005f541c583d7e4606373e08e004ba03ad001335854584e793c05d8ebeeb45ce34798ca629aa0e26554b2b0820260e1945010c422ee360a63c83851f273c1d51fe95d5a387d7d5ece64393b18c4b9c28b6a973ef65151d1cd5801f4cd3f4c575c1e4990669f2b6caf3963fbe8adc1b8b90c30ab25c62d1b22f5ff1e5ca9129b0b2abd899c2122cee4e221f96a2718fc336d175610814b4f00f155a6571d6e3b82a27375759bdc2d135f25d80f54a5d01c0a9aa502ccf32fe04aba39ae3e94d5ea78abdbfc4c1a46c228a248da31bc2972a6575584661b6e90e7eeaae25d41005b8ccda2bec73b06971fd01bf8614f0607dce0da616cf56cdaf55f56a55aac2c3b0786226d7f7b3b74a0c83069768189afcbd0dae6799b4104a87a07071ec679917a14511d4257deed8e5a85bf696b6e91ce4be6169d5f22b465c26cc3235dfbe9dd931cdcc8ef13539a12ebf133177f95d1e8dc0ecd8eb3f6c76be7cb8eb7f197c21d1d6ce6e5fe95bf73752a85e4f374e8f9c0b32f4ecf8eafa5889aeffb8dd7eb84bf4eb0fe1fd701c7d7878486e0c2bfcfa213dba73b74781a75c7cbc1c5eecc497b36f609ea4f6801fc4c4bea1c4142d575d6c9cb0ad8a45f6c9dc2754b5be27d46229136c1ab4d184eae53778d9aa66ce2f82ae40503a4d728caccbbd7c4d12a2f3b24cc5564766eb6ecb335bb62ddba20a7ebe1d75376e32cffdde79222a987a9453979c7d1e9d6ef70f4e1eb6dc43ada34dfdbbe9f6e7adc97f861bd781ec19e6cc95b72eafa50fb2de19753a9d632f25970787c643b44b06ce50ea7cedfc7172d20ffa17e9c9e6f47aefd3015d439c5d5c1e9d7ed636bfeeedbd8ea221ac19ed60be8a901ca7a9e95714d47c21d1e6266e92f99f48e8ca92b35e0819a199268464c6d9eb0bd2e94e604adcdc3ab635cdd4cc16280909e01d0a7e43eaf74fa89cdd5eca1e5de26d6de7b27d18ed6ea827fdbd303818ee7c26a79f371afb30afa11e589b38b3cec927cba66920f996f4b875f0e699f5115414a547add8b9f15d2c916a40d05bc2d9ad3eff8c73d80eec333376152a005c2eee8255f23bcc5d263557044bcbfa24eaaa66bb7563bdbe19d56cca3fa1314b5916783e6cdf0afe3585bcca267896619a5308d26021d3e44c41c3316838486b7524747912aa12bd64081e9070fa585bbf952bd658ace1eba21143429c064b60422e3564c1741d11dbad954433b58cf117a3adc4680d3e7a96094bdea7f9a25f6e5135e8b3ac3875f9aaad9a51adaa2c187bd654505dad19a524c6c14a79e79661c39db05e398087cdf1b9ee535dfcb434c75ed1eb41e13fbfde594c1d3b8ea319ef46b370ee5f770dd9137f5e9784dce692d017fa10344113b1b82e88a214f01a3c6af8c86b3cfd7d680976312cfcd43c06dfdb4f5027258d89913dad216edfda59b01a0f150c8d6b02ce8075c1320d90bb1469333205d084c5c99a384e7ad41dbb52c9550ad5c45118c3d74e143be46c14cd98702eec160d5cadd6df418776a3da0b65937ac5e7a3ab5ba665fd92d03748a825e3e7ff4e424b044539d51d47d47fa09cb6f2537d1ec25764fec7f92e23db166a9d9ad8f44327c7f6c8e76c1bb0be7f98f8c12d7a0e593835402a82a99d007a8df3fe882d7aecc01f86551b903a894a6ec36a0fba23f4d517fd585f2ad8456f172d2ae898bc2c486ceef0287c20b59ed49b0c08d6efd8fe921dde23e56f1e2b9bbc2b5480779778f634484b55c57a4f6045ff7cf3aa1e9f16ec744db8ccbacf167b2dfb282f5affb5e05db600cccab4afb39b992bafb3ffcee1a9847a63da59672e27490a209c62a7b60465c93aa2e2ee6ec70b247cc639573ea4d03cc3b0102cda9fcdc5d9ffe493f20db9f7627b4c122e8ea06be4d18ba3f16365cac6f8872ecbfd5d74c9f07d69926ee6b5273fa5d162a08abe0c6c9ebb28e3093a83157f8a9efc0c9de0de39363f0d6776ea8c32dfd53a269513daa21fdae264641df775cb0cac08522ddca5c7fdbb7c5487adf032e111976df116428d01473a587bcd86bfd4cecb6acfa763cf7106e42733efde18685ade52d6975a8730f525ec890dd76e365aa5b059bb289c00f52123f2bc84a445c029db7c064b844e0785cde8c8c4f5bcb2cdd8523d3ffcd0525f3707cfd7971656f7aa75e1a1d6c1f64edf49458cad9a053ddee749aaa0e84a461f39dbe716342b1be0fb2c491114cba8061e0fb24a8c98fd514cbca29d36cbcbb9f422f4d38c5b3016ef0c4d80a3f02221b5cecce956b3ef4d41c2f0550cb856f540c690527853055534e9afa9ab184b8b11948817baa94882a9482c53d578e8a526f1b2209b067b861cfa86a57856062bf3b46a0e9347a08da50348d61a86c02a3002566b9882e10c34572a6795431b4401e34e246bfef783d7201565435d04d05af3bb0770b6abb8a7868a7fa1eaac4125d240957f32c5b9bae6fb33cb4d497ffdc504a6262e409e81f1bdc5a595ad5b2c0db6c05d6fc96061946f3044f85140713baa212b3f9948fdb2457ed922ff2f6c11c71cc89ab8f66755ad757d83fad5562ce5bb87372e56740d8ba4a462dfae609b583dd5317eb6a5de4f6fb1fcc9c5aa2954f2c030dc1f67b45499bbc56e118288de1ad110ab3ce30d82954160e7709c81f56b3df017932e57c2cf5f41ba7256633b78b6aefc40116b61f3e2184e08c559b412f5b27286288e13ce0f3d1fec1fc2b1c6f4b23da3d5ca46ab965cb118573ee1956ffe64bb56bd6c138827b73026092bd2ea8215d7d005db6b78a5f928f6d1538c053463adb728a34535d148a0865eaac607b11308b87713dab7fe9076176fd069df18e5d9492356018fa2f218f2955f6a558bd9796978ef4baf66a0f8e711c6aea49bef9b5bb5d925592dac9c8d74c1c88c9cebf93512ec81b57d9dc2e271f5f03b8cf77a76f3d5fb723aee27af67d8deb7c86c8eaf213f802a83c769731034fea20d0cb2fa1b61d4abaf54b572e7d753bedbc718a0bcff503f684cef1199734839e470d5f37059244ab1c338525af64f8029115f898f1f17dc4b425b546a32dbeee7aa375ef1596aed8ea577ec92b4061216cb57074acf6607d1305a244f928e516f2c0cafe86de9ec1f663f6530ea7bc48bcabf381cb17aeea975b338dfe005d541cab7dbe537afb5778f35a7b2fd5a1cfaa6cdce3ace3d95c1d33d5c7af83d28c8cc89785e9c9edb2d052b6637af7162edccee0b4f2ab78eceab835cf758a4e9268dc4ef4f46a7e10d3dd82db283dd57c6979d8406b9def70f8eb73a0363ba7ff560ceceb4fb68ba73255d9c6e7bfedee4a374225f6e3c18deeef199e41eed923707f6b3112dc5af2ac4960679507fdbe8576f76cbeeeaa9847bb6c5833625332312973fb0ebf26a13651651509c926e6b0f3e96ee3944b6808f54b97e8fed893e0be28d5724ad8661d185490b87a8e56a2418161e634cba94703cbeaf881af445252e65e56af5101271208a66adc3b94efa5096d6064796c6ae8d2e6d401af122cfd7a8b145f97e0baab7bc2802c5d6bc1cb3b2893e27051df7ea2d967328df866f0a58c8212da100155eae848217574e966411437c2a8c93cdb21996ec97dada952b0b1716aa45e33486b5129f8337289442ad16430ebda829106a7b5be985040bda11e7115cf566b0430f402f6e21c4f29186d2958bd07c1287550eae4f8fcf1f1979a142ce91d240373c9f3cdf255164cdfd53b9d270f96a87ae1de011f5ecb0fa777002b405cbca7527c04a2b6f313f5e3fbfe08ab90834c91c698265ca9712f0f247487e28afba6b8e064d30f0fe2651fa2849b79aa058fb96a0e2ed56a221588a11e0555112fddac75cf4495882a205603dea167e9926f52c98e86c3045735f15649aa0a96a9b2341d4bd25adb1040bef5082eaa2a8068248ebab82696afb2685ab09781117fce0ed5d22bb71090ad09bcb74c19095005a61cad816bce58adeed656af23297c68ff3462c9007f448488aaa7ef79dcae7e5b1761e4701dbfcb7de7f01, '2018-07-15 05:47:05');
INSERT INTO `wiki_objectcache` (`keyname`, `value`, `exptime`) VALUES
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a6434316438636439386630306232303465393830303939386563663834323765, 0x2bb632b05252b20600, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a6435353630616266386133363839663031623734613466343533623465643061, 0x2bb63237b352d2cb2dd72dcfccced4cdc94fcfaf4e4a4cce4e2fca2fcd4bd1cdcc4d4c4fb52a2dcad1d007c9eb17a516e7971625a716eb271617a79614ebfb0035c41beb15e4a5dba79a19a7266ad62a590300, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a6531666664363033636261616135663161333665306431336665383433353335, 0xa592d10e82300c457f65f1d9fae293e36b80545c2c2b594b8c1afe5d111345a60e7dedcebdb7b799d8cd7a6d17abfa002513e58db8821094ab8af0bc25ced50657ed34839a4fd00a0610242cd57af698c1018bbdd3c8432dd3e1eba0336648f68a5e813498f826cb672c2825ca9e0b7426eef131ea61fd4d768f22dc6a77235a51ae47961349d906e1601b7657f7d099326fd4b14f5d6c06deef3d13ff232d76b5cff2fbf5863f412e35248dece3d3c9df326295df2a476de308903b931305d123e1802eb20b, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a6537303165636263303262653235363837643936303332386232313936356139, 0x2bb63236b652d2cb2dd7cd484d4cc9c9cc4bd54dcc4bcec82faa4ec92c2ec849acb4cacbcf4bad55b20600, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a6537646532343063623737363661656365666161363938393831653338646238, 0xa51a6b6fe336f2afe8d628b05b585abf37b1d0bb6e0fe8e703eebe15c58192288b6b5a54292a8e63f8bf7748ea3194e864834d806438e40c87f3e29054bd5f2e1e768ffb0fbf9e68c64850a792d2f21a9dce612a4a454b157225af199334554c947b68dd70af541cf542eb16d54c012fa90903459f159194cc1d2c2bab468d9976038087874c63c764663690a5a9a9e4ac3c5e9b92a522a361c232b6a7a78466b71391c76b42d2e3418aa6cc406e2ee4fe423917e7d836120eddb773a29759579c5cf6ac0476c0860be830b3fea12e15fde543dd2427a63efc39c7c8a4514a9423a4a4351d0fcc19a71ffe1cadbb5bea1f80fee503607aa201f12a0968c1253188919a4892c83f14539cfe398fe833ac92956dfb9a0899511926029671da2fabe72003906671dac81af453505edd7ead9baa1252d5c1473d7d98d1544862f8835a8dfe694bf7e9fafdb395a2a4f15b0c6fc6ca156fea132b9b3aac447db5a69b2d16bbcd6231ea2fe9a1eb7f48168b697fc37937801032e53e9ff01b633407c7dbc2937809592d385134767a5ae4adae4819a5e27482b0b9e6103e61ad2e9cee99229ca5f13bb9cdceecc8fe23e913a3e7089889ea0aae7e60656f477abacd2074542ee4693e5342f084c8f9ec5cfd0fd49d88e7e535e59480fb0b55dc380b8c7c19e514343e378d82d54ac84bd822af633b9920510504d6a1883b853f3cc493c5dda252a8b0224a0ace81d1241e67790e6668ca6188e171a6ec50289090672d7f09de90b1a7a81da883decec65ee8fecbf627eb4b30e701fc5e13df54a64dc74942f9f54ea7cd2ba893d3bcebb3117fa7d3727da252b194f0b6ffc4b28c5397fc5c401a0b41a92905973f4b52d9b402d6f86f7302c35dae6796a962ffb0f8299edab117323c3355b4d37a788ed27610a9a2392529a9b4b9266b988c3e9143c9f2cb35e782a85643a35c7f9fe59de12e4f33ef2c254a5bae9e4ad4f5040d1f25e3562bfb455c912c63e501200efed9fa99c923433bd409778264204c8bf5da2cf807a34806cebc1b426cc0c2bae6325a6de9296e939a5e8449a010a42c0b665fbf7eede58e967a6480e40f1691a67d11dacab13bd544947dce242c242d18cfae2d0b3bdf622a825ea2431d106d1849eda630cd3ec66e052881962190d52ddcafdf65084ae3be0195499252289823d4a907f6a85a94f5dc74e8ddcf669269df148fc2fa71e109eb88344a74d9d4e686832497dbac021bb7892be83398ae10bafcd82a6d033a6b3186a3d6a34e99981e3cc0aa1519d584dd785854c30252e54f6d8ffa37468c32521714dca3db7b3a297536af21ac88d9b76b370e4b7ad673c246c44aa12da9e611a4080d4c92a54991c0f84c64a9fdc4660d71a0cf299595eafc67bfae9e47d946635a4957831faf7edffdfef5b718ed17af4f00e1ab75e798d0ee7fc60b9fc0dc7a8fe7a176a7790da9bc3cf8babe8383f5435bfef8fbae5aa909e34c5df616d3e6663b14428aa647d80fe7aaf060fb58b34eb25c80829033a6e07e54de88364f5752fcf6d5d61ca6ecb11148a00a827125e1c8414cd040a09f745d454a8532c380bc453a8d0ef4510e05fa7c8cd4c150425ea6a3523df654c48a249c46ba7c30501b167a9f81e4f43deedb3a05786f9774602827554df71de054d6a309837f06b0d9c09f627eaf27f3f4fcfc2addd09b4d43d688da2b57877960e2ff5d92a1f97d41bed2bf1ecf9832eaf6ce49d046544a21e7511b5470f669d294d6381572b01530b5233b7f4b53eb6f2d5d87feb2d81a74c7a5af981f0ddab0d06edfd119b81dac1d7facc65e837ad70a9643fa1c0a95d8bb5fb61bdccf6ee7204150acb010a639c8014da4003d895d082b0b2a998a2785e29dba2130622fb48fdb85d93dad13c25526726c635d926ed3ad2f38085dd3f50d49ef6a7fcc27a3abc7c4c727cb97d9f286d5df9beb61ca27f99267894f1ebaccb32c6febc55c2033a26c9ee75f7260d91726ba7ab0a95d6f8db180da08769e73972c1133b3777609e30b64c2a1aa8b6dfdbade56cf0e85499b573c5780ff6e1ef5f8ca9e63e090407b3bf4123a85301a1954b67e6490eb4bb55ff70e09d33ce8096e1164fe86f07febb5e1c38ea938882236ffddcb61eeb0b9d3d2296a8428fc79c7493db0e865eb8506b84d794c4c9ac14f9e8f47facf50fa673c12ceefdaa27e120a3f406293d4e9fcff135544d3a28833ca8cddda693b097e8bb33e00077230ea84e7fdc4371d0a9ac0a3a0e03911ee1bd7d7c2bac0ee333a5e098af6bbdb9597f3dc2bd624c3fb77466476ab34888bd82d25b65e25f97717b307fbd7ef199dea5fcfe886471d0c67c8f2a08f46d7771c9a26f24f97d845e0e470d9f0f9f46c381e32e489b58d926019edc0af7a1b4fce9723b6f6183b1ee2b2352ccd46e067ab7988b7a5151e69d7bab678455af1b6b463b66b5baebc2a6d96bd296d9639c71fab56f7f8339176c4d627edc0b62d8f315f9b2c0c5bf28dc0e62108040a7658eb5b8de41f3feb0ae9b3a4b56824ec809f6b997e3637d21a1f717a20e9e5b3195e7f46cca203cbffb5fd92af379ff06e58899a9912d88668d045ea3042d28a129d585aa8d7ee72a7ddbaa3979413c59e68ac44b50f759f594e0dd9888775c5ca1216d49342dac3e5fce874a935f3c36b6fe734eb4ec96e9bfce0ba6fc572af53c14752569fe67da31ee0a4c0b0408d72800fcd00176c808f68cc11313d71044b045f104c10a39262f83c3404a2ae088211718df00ac3f4d3d5bdccd199019dbd8a1556ce1a3736b8b1c58d1d6eac9042d708de20788be01d825758e96bdcd8e0c6163776b8d133c0f4981c536362445b22da12d19688b644b4e5406b9c628de00d82b708de2178859c688de00d82b708de2178859c6e8de00d82b708de21b8a345863a22431d91a18ec850476428e3d46b046f10bc45f00ec11dad44b412d14a442b11ad44b417447b41b417447b41b417444b90a26d63831b5bdcd8e1c60a05e61ac11b046f11bc43704f7bc6c4674c7dc6e4674c7f1e1808a43581b42690d604d29a405a33c9628de00d82b708de21b8a3454aab90ce2aa4b20a69ac420aabd1bc359ab746f3d668de1acdab10ad42b40ad12a44ab302d3294428652c8500a196a9a1cf5f5a8e06d827a493e059ccdbb7692a66efb50baedbf98d3ce89d33cf0a3d33e1e4322893b0597ee14bc7971daa71733e5a4a0356f6915953523e5e489a0c5f7eb4a8feea47556dc67aa4564a93e80b274c21977f6ec0b570b10c5779967f48994e440249bb01eba067bd4aeba5f514542cb031c60265c5b7ccf52bc229c90ec42261c0cf63653223575b9fddf95b3b648f63c51b5a347f89907ef2b6c7df4be712dbf571fc1ecfb969f9f4f1e5f457c6f3d77f8bdfe828616f88a8edea1a677680a9f9bcce166d5de577856fb8ac2dea1b377a8cd11ae3d2059c7d37fcc9706d6ff86a6e98ddcdebee9f9c0457ff510e68cf22c2c58a99c972ee784b39a3ca2840fc3d1b855de521f8e7fb8fa3732fdd5d05a4b6ace00ebcd2e7bf09f01b470df73f269bff2a8043343879b1f73f173f7db8ceec17fb1db6c49e65399bd78faf1f39eb3ead030b5e7be354db69fc6339b4b9fce58f602da73a9b6cbd779dedb088c1380cd828dfdefb9d2d966e963be71edae6fb966da3ff5cde2452f84a405389a3e203245d3ba6e6f2b7bd43707a31f25478334aa1ff4f6534e94b13c0fc18012ccfca4b7325050ebdfbaebbb39d8083369c89e57f5cd92f305d177121ba773685f9df8d470c5acaca1408287256e68772b85cb131fb43dec67f625cf3ca79abbe8f904d3e9cded29c9d348f8d1b3857ef9544647730d9a1b70dbb4176e03a2bd7236708cdf720d0bada98183692106e6a21dddae0ff7f3b737667d83e7e46ac3bab07950ae03e2fb844e07d8b7e654cd67fa6fa88451d2e899206ecbc445fbdca3afea2107e442282a47df113c6734690ea17dc4ea052209c45aa368fc62aef49ff78f8f666a2399b5872b81a94474c484f6f5dda6e6f04c9323539e8e533d458e119319476df0c52345b7e3e626289ede553b99423f5a8d3e3849084ccacc4d2b2ab1efbca079bed4990af9eaeeef8ebf8e84f37cb5739fbf7703f7f397ddaa6e7553cdeb26710f14b7db87f86f, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a6562626361346438393336653737356630623835303635653734643965616333, 0xed595b6fe3ba11fe2bee090c6cb6922259bec4f2c3e9e9b6411f7a7968fb5c501265b1a62e25693b89a0ffde19529229c941b7dd16458b4d02471a0e678673f9488e65b4dbae82e8875f1434656421134169d99046d157e5a634a90451ac2aa3b22ae921a97825a2077fbbde90f41093e47414d5b94cf5684ba20b934cd1b4e9f962df7ff6814e12c52eb4276784ec7c24e7d5850a874459959ce54c23c8a582332d9893f2f8898847a77b3c9d5c22483cbc17efe5f05ccbe1f12c1eef2ea4259e54e7b83768b75badc2108825bd3a0fb55b5321ab92f085a6f45c31f17d341b69fd4ae7dc531f90cde679f3dc7ac5d58dabf40d98c01e7675a684898fc26d3c9b3315bd0db7739eb198781b4e58a800533fd6a287ffb122c3f655babc0c32aab9562275af82d4512c2839b9f8deb2e2d8c4f04085492fc806c512c25dc2d9b18c0a96a69cb6b96872ca8eb98a82fab54f414288957fae4d3502fd4341c4919591b7a2c5c26ff3c0c9574e1e3af9dac9374ebeedcc8e394899a6f221ab4ae55e8dd6b21205e1bd38ff80499bf1ea1ae5601f2d0f354953561e5d55d591b7a1c540882ba5aa22f2821d108d593d0d56b2901567e9026d06e31aad51b2771a05cfcfcb365fd9948d0f14cbf4b1b099c571c553e0b725ac50e6daa6045ba06c6c8a8f3cdb1105f5a2e31ab3fa61495b5a0c064dc74218ab9bdefb6bf4fe02fd0241a81718f2de93ed99379c4950a6de3875d55b4d23f9b7331174885da867fb8b0035f68e8599156fa62c2106fac672b024b3821ca9297ccea6e606606eaa9aa9ff0ef7d87aad26d6a86fc2b541aeb4e7e23483a4d5a6df91560bea24554a1da59c539c3a9214b58605241a7b325230fe16155559c99a24d4f9529d05a3a2d52cf713b8af856c8fbf7d39580997a6699f8d82a4ec2ca315d455ef38645cd7afdabac1986fd034c805275c73401557af2402f91a0f5a45624ea7499731ca5349553317bacab61989fb0c0974f4f5e72df6fa1d5ddc8b01609688677de661c29894b42675141d434e8fb44c9b7e5097f5cdc4fd062c04541881d790d5b8e1400e93e6ca5295ebf50c5a30f08794c99a9337f06705fe748bea1df2e2154523cb50dbaf07c8c7f8c4d407a377a9ad97d01280d756ae774003a966b0fddc712d3e8f52959c55d567aad0958094d693807fdc0ad17ebd34619b8de8e03da82a713cfd01097425a2041b350113e62ce49da8dec7f32eb37aef6d204fc751185435bd5359894706d7f8b6276a630fef1522efe1f3987590be83acd78c5aa8591f4aee9c0b2671524b1af50f37e6854a6ffcf0d2dc804a0fc3c6e399ff13330f7602dda06beccf39b46ba1f8a198e2d4c8bebdea516f3c3abc36f364d0fc676e18ef40b236ee2e9a1eece4b14ac9ce381ceb55585a50915d8d0b00d316c7ca7311c3a1501b0c529a5108dd84727e989ee8589953c19435bd0fc0c4b22ea94d891b70030f8073b9128b7f7db650fce3d9a3134127a1b5ea6254801b1f327c54809a328f59ca2e1e9c4188d25c5df2dd08b66b35aa692bfa93d164f6a2ee0a18a31b31058a921b0bda65cbc7f79bf8413820e95c3cf27e285de5e0aee9668c661ae4d258344304254809fb87002fdc84b0b204b7cf3125499221274370e387f83242b6b9b7a727be365705465cebc662b8afdb664b488da93ada30344ef5275b3c278d8cfdd0265d50b876d05cb2ecadd1ae8e7428470509526cbe0569c61b8f96c9e09255827e84567b7b2e2bdc9c6767dd6e5741eedef260ec59830e67c13f3d5dd9893d092a01f2132a9fa4489ef42513e99e3c41d860b14f7a827ceaac7413ce6aac47af2e8f3fd2784dd78f73f1e83a22dc239e5fc0fc4f565a38d6f3a38376a4449148cf7b9297e3cf5f0bee2cc32fcbf0059e962b1f56282134cbf057cbd52af07cf8042a2de1e003e619f29ffff4e23e9b01a94899120e0134436585f4f06519fe7ae9ff04824107b081ec521a8e5ca97a19feb45cbdc0dff57af5aea15709607a59c17d12fee91928fbc2e8f597d5ab99062338ea07017e6c0c87f67f676a473271e8688136465ba205747fe117b489a586cb76b5919131cecdd872156659d62f5554273ad0b5b1f7a48f35d5042cbc298bd9118e25466047fa5de06dfc3daeca7bde6ef2c0f7f6fbcbcedb07fbdcd52fef9afde59f55a50f2333652ed4d61eb56d41db73bef1f6ebf0b2f6f6fe3a77f5cbc7da204b562fc721b25da8f4ebb726e5371607d8f1e32e233e79fc19a3e608799670489194d344197ce94f8ff38142ce8953025ece0d7619ccba8371a9feb9b391da883745ae19f757c0d8784bf46732c628f71d8cbe83d17730fa6f81d19d93f10770a0ab79ce3ec6038480c93563040678c8998af8cfc20168d07040363ed97d8783ff3738d8438106031cb8361efcfbe120588de0c0b5f1e07f120eb038100ef6db94fa1a0ef42d6d742935d7c545a03bb7fae26398ec9ba5e6d1631d1f6cfa095c285979faa6ee91d5bec54e5cc2c12b115c3ef3d68305aa3f689092cd5cd68b8fbff31ea7641c8ab4efa7a2dc512fa76b44c22236e669d208d65d0f3c7a15544a7d939caf224be82ebed35dcd328020ff60f7663f686247abbe4b7ab03b9a9a70ff3b9707fcfee7f7158cd0a6aee005fb2c8272825ff8dcb9210fcdcf07b85a12decd1caf15aa07579b3121d56f2849ade687d5169f5c8b57f3ef537c63dd1fcff170a1d507d687bf9e8b1a42e096e462f7e95d73b91eab3279f7d06d1b20cbb19eedef5e9ee1f63d37c9eaaf74598ad96402b659e3afd5c668a1ba4a4f9ee31a0b667c0b6f4d2f080acbe5d5b1fabadd8a4849957cfa2d4cf84b68cea6db9092c7f687c3df01, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6373733a373a6638643063363839356365336165313434333463313662386663613539343332, 0xad92db6e83300c865f05b5b74b05553b89e46ada9304e2823537c99250daa1befb02f4dcee240d2e128c637fffef789ee70b3e99f9a6aac00734da7766036e45a6e5352a055a58e3b1ffc365e10d3501443096a7826015e2d2a20a755c0be31438ae8d06f1c1502bd8f22ccd7361a552a8ab98b296ae42cd5966b749dabffbcbc6cc5b285152776ae88064c00d8842966f95338d56ac34641c6f6b8c1c65e37cfcb006750077248890a892bec7540ecf3dc171c37a256c6eb742a1b7247723fe297f365fc23a191741a881d580551d783684aef11df88682effe1df6519b6e2c5d506c7656758dd8439fa5a4d9594a806d6092b0d2bc9fa2486e67ce0c1b724e712042ebd18be48bf820328e5096104d6c9db48fb05974c1810ef7264d17afcbfce5595c58f6f07624b3c386912c800e3e544eee6e55fd70fcbd01b7bbb2716574603eec08388658a7fc63c5ba77e55e99478af1efdcb8d1f4f4abd44bfe835d751c3cf5c3ef0629ed78110a436a3f119f, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3037353630623037373932333433333338636131313235333433336136323762, 0xb557dd8fa336107fdfbf2259a180752eb7d5a90f0da5a75555a9f7d6aaf7b6dd4a0e4c125f0970c624b742fcef1d7f11c3c2eeb56aa54831f67ccffcc6e366fbeefb77df6d6f4f97b8a8580e22e6a7ba80139432bafdf4b905f114d705cbe05815787a4bf76d99495e9551403ffda68ea980cf2d17404f55de1640bae84a42ba33132bde7c28eb56feded6752524e469e8490c79b9caabac551ae34c0093f0b3d58f47c81612ca9b8ff045323cfce732a4e54431b5a864259f6a4883785fd2332b7ea9aabf1afc724b4552bbcd614d8fe6ecaa30712eae1ab6877b5c9e078da493e2a913205be159c57c9aa4cf98cc8e110841babe1f8431716822401a13b7122ef7528a26ed7a2a7859f0124cc8d3b77f9ac51ff99be06d12c4c09434648c1932f05d2ba1b9668a53b54b3abe8fd4226e6ac8f89e43bed9ac477263649386a6642720a473263c0c9b8fa95e62c45a48fa9e24d65347995cddc90a60e2d76bd42238a3f354b3daca50094ee591373430eb20d2ff244163f5ca684ad3d4106807a351f2c96663cf8eacf9a9604d3339d79e5b929c49363afea646864b257245e78cb0e2780e11894bac20fc6b8ed505ff8c7e9e87d6e258c0a93ac3bddb26332ad4b6f64807007d914245c00878b87bb43e9a98da78da005b257baca32622490f45039d1f98304c4686cc056008e60dea9ea958622536584299546a7aaf2a1b907e124de602015a85124097d34879aef7639e2b23d69ee53a2be65b633245480fa95067ebc594294cdbde60d0e65be3b2971555092e619d52b1d5cd20c49a75f82313ce28fc4133ff185a3e84d61709651e69682a4f081dcb4261be8c513928bcb882e8e68b6e6baca5d37ad9f2bc27f18ea3ea5027dfefc2ab1c5b93bf11d229d648e247af5b08df7694c6051b605f09887c4ae2ea325dc280854e2de03cc20ccf1d9086d266793e5bb353742ce3dfa2e2751878459d1d597900bfae55544c6d631bb9c774a79873ddbc9bb880f2208faeb85519a86ab6747e7b99b16e8d70d7a22d89ba56c624549f2757298b7d6c1a13c5a8c18abc37d36b76b399b93749e7894c871bd12fa674b8385e0fc9280ccf621a67ac28346aac8bbd6d6e3a827de2298d4d68fd1d7773a7eb3b9be17f657aa09499e6f45f79a145c67b5e48ac9b681af7f7d799638b18327dea4df8e0d9f98810b1ec83c5c4ce0cebc0f49999be0725db1590ab4ab6bda1fb9ae6b09d36071aee8a568c69c65dbe7f493dd5d7578c83c6e1801e3c17360c05c162a2a7414b66333f53c0891ec6d2ee00723bc40ecc4d66136ebfb09dbb7d1ab886fbc1b42d7bf0e238a00139e273295a8db7073c0ef5fd82fc218738b538aa05bcbf0fc3ad23b1f2e94d33e3b73f52fd9fde2fb83d3bb8e80bfc2bc240ba918b8bb2ac8b73c46ab032dbeb85f1665cdc06d02e3ad83f557359297f5f4988194ba6681a89d3d8b0f998b7d6a89b3f9a940fd29aa96902169569f360b168d2984886078b156a767b2361e62618840c787b514ee0f7aa20724f1bec1468ee01df5c6a5211a790864dbb3b71391e503c5e5da6daf0468d5c633ad3fbf483e6f94c8379fcc84f50b572648b916598c6a9c6ecd26fef54bf54bf20ba60d3ac2e6eb032a34d5baa97efa2b5530bad711e85be0d8669dca8eafbc8bca988febc4dfe06, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3038666330623030616261386234353930383162306636376239363363653933, 0x2bb632b2b4522a4a2d292dca532f2e4a2e4e2d51cfcc53c84b2d57f0cc4d4c4fd5d0b456b20600, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3130626439373430653332346261616433633133353065613738333037623636, 0x4d8c3b0ac3301005efb2a4904188b8954f912308fb0514f4b177b536c1e4ee913bc32b668a79e2c7f1e9291f2ed5b0805dcc6b4246698654bad7b5c55a84ec5bcb7ca179d8cf4bc15fcbd834326cae8b260c673fb9274ed0cc497be0184a234f10fa0d531f4d7f, '2018-07-15 05:47:04'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3132363463626563396164666538323665666634633935643434376365396265, 0xad58eb6fdb3610ff9ebfc2518d5042292e1eb60195a70c7da0688102d9920e2b60e4032dd136135954492a4ea7f87fdff1215b729dd40906d8b044de1deff1bb07ad925f47af4e9360b92285a03993842fab822d59a9c360c9724e57fc8613c5a8cc1697f57cce940ef0ac2e33cd45190ef1f55f3593dfb0645f6b2e195e8abc2e58d4841b92e50a0fa306e4f764a48de180876443482b8ebf7a61aa12a50269f4ee42ac5404c4ba96e50048c89ce9b09909b9a4fa9649059cc9cf985a110912152bdd3908bbdfc4892ce91284d28c25a7b8e04bae132f1b2ba750727cba8e482e4ab6553da79ae2ebaf5f3e5c180d9c4e767132bac28dfe56b1c4ee1a9d2efcfe0766bc18a22ff139e8726975883f03298a9c754ea17534369ff578b83d2e6a6ea9343682dd95577f2aee98ba6405cbb4900a0fddea059b03433a0cd10b65e3e5cec183176eff6359d51a4564c6a5d261d4b2d965c7d525c39564b75cd4ca49f9ccee80a843416e69114663502a6dc0c1922693093a4b117e457ebbbac237a2342609d92ea35fc8688460271799588ae47884a705cd6ea64c82f9f0c62b91b7c44602af16e0f7ceca7acc67e1f19064050720120df109e1f8a805c278dd3a6d00ae7f0f607807510933516a50def971683082a7144222d90c825edefc49255d2a2bdb939299e78d1a4b9fb6ebf03be3733294d6d3a088504609648850346ec5a6968b50ad21e40e849ddd9769fb447899b3bbf35988fe40d1593cfa039da0049ec75bb5bc28c524a705ff979d4faf21e8e0f75d55d3c6bc5aa6a4dd33a02443f30880f1ea18c843708fb64724dbc78d6392f6613d5efb2cdb3db0e36d51be61b0ccfeaee044e611abb6b0d10bae3c5cc0cbdb8d9393edf3719a7e0f385b21b4049484e881b28370d3a639c4c2247eac34951a9944da03e1ed897db8584c7f1219b549b7c1cc8ef18f030032abcc4334317e8fdd417121b22bd8314b21daaea1e8fe1e2d6c55403d4fbe9e6926bd23974cd3dcc2d038d4ebe0bce9e5391f00a77aeb7601674f71199409e9bd06bf75a115c265bd849c3c9f5db88564c7f6ce99a460e55c2fb063bd64da54b4a4d59a98520856d6e54d295625f2856eb3ed4a30effa3d793010269a1b2f49067923dfb715d210e05e966f92625f1dc03e21de5a7bd2fdc9e2fcbb5cf9307aa34dd49af5b8154fb69933d9ac6dd2f02a358f4f0a87332c86b287702b30691fb0ad168f85a32d27d6cc9723f0d991058b79778b26ff7ae69395a4d56bf5090c810c9cd142419bb64c662384aef03b3d03fcbae2b1808ab0d58c6c2ada9054c6e2708f63a29657735d8059560d42f3fc6d4195eab8d87b2336ac28325d70136f653bdd26de438b997e52b8b547d20277c97ceb7a4264a0e764373e479e932296ffe3d303e8eb8f9635eb2480aa5806fde0a29f072ea1faed8e15b65ee04733e26040db130c86402ec916bcc801b161e48d4cd3f4143a266cd10aa69cdca227e7b7163f9b807bdde3824e59013b169c108aa59ab705d2bb2436fa515ef2720e80c08f4ab39ab5d2ec0b004f2dc40ae2bc66806aab97abcfe411a6f1da5b078036d36e441654fd00aa4d8ffef999f2129dcceaa2b0401da1aede3fcec5a3671d71581eee9b39d3497f5cc4886c24b8952b1862f771926bc1cb10e1013211da821fc677a661329ff5e1fcfdd46f705d8a9c59604f4eafc6301ba7f0bdbf2fd96a00487a5d7188fad01503438991bf5620bc7be3207ee7b17b06f80067b4cc5891ec4ce55d35b09794ee3dd8565eff12b5b71c42a7426aabab644b71cbdeed635caf7d834d1ad71f927effc3ae3c7675eb558d35aeed389134533ba525fd710d53337124bdc9c3d89b2d18dc7ef082cf17057c5d5f76f7a1a94da38a2acd0659ad07b91415c29df387a1710a2496e4e06500eb0dfb66070d634e441808dfbde00c0d47ea19c7c3fd434e9cb5e5dcb76b5f21e0829a1910cfe0f512a664849d80fe62646f5726bfbbf7a55ef16a2f12bd8b4e0fa4cff0e541d1ebf7b835f6356ac375b4b7e67f17fbb637fa46b73ba0760ab3251898192d0d163ccf59190ccce5200dda0a110ca04fd6b0300a7e3a33dedb81959f82939e3bc1c33de7ed6a003a4244a770d7ee21a6d7cbbbfcffd3a0eb8e8cad12cf68dff616b64bf7c02de029236d7b6530c51386af620ae6b8cbca9b5a6b736df4952174ff0c84d6d27fc052ff178b2d4e4d00400f92c951d0d57d40c9dea28e0f214a1670a83c8cd4f8f8961d463b1359ad9a4c144226f6fa3f36be88739609e9fc55c2f4bbeecaf253579cd5d2b4d883cc3a90678f958772ee31fa50d6ae0f560baefbe63ec436e88f2dcdc0a83e2bc42a71d93b8e456c7db9596745c12bc5d578f0c0ba3d3c767f80c1150d868c757065e0f4d0181624011c6e1395b392114202bc43ecde80f04dad322a03406d30fe0f, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3164623961386437303063383466363437363831323335303834373161343034, 0xd558dd6fdb36107fcf5fe1b8c648c18a16a318b0495586a249803e0cd8d6007d18f6204b278b0d2d7914e52473fcbfef4851dff247dba7010d6a91f7cdfb1def98bb3ffdf2f3c29dae9f1c9e05110887ad371cd6904a3acd1f599a3b5b0865269c2ff9d48e8b34942c4be9ccfef24701e2c516f04fc104d8eb2c2a38583bda9058bb6d202642727f464922d79c584e20a5a024628258beef13dc24b6787fef3fb134ca9e1c250d72f93e65eb4009b917c11a5e5f73900f6c0d5921bd9913a74e98711e6c72b6e4f0102c73bfd6996dd47f79a919b9244b57b93f73e059421ad1ddde9ef5999d08e2a0e032b72b668fc5f452262c7738a42b99583b01b210e944ad797bbd03419834ae96fa66a03c55db963754839194411a8232e7e09e13441145392800b8130532a0a447fcc97845eccabf92384c188f04a4b45a6e6bb106060f8d40d5b74aa171c1f2f6fa9f0ac6907899156974b7c52c4151b43c3dcb41c94440cefe0582818e4051854017d7d7764b359e371d4a4c8234e2f0a7e6568ac762d868f52fafbdfd39823a473714e9efead8bb33fad7df96dde870d38273bb4a0f7707cf1b140dd1872c95014b41b8e4cde66acbe0299f1498c746749f200cb4e31d1aa5de259cb5cdc1034d58ac8ecebd5cd8a532941431c5edd6f1030e9f59d4caca6104c28087050fa4faba65a57bd4bab8f12bdef9c2dbd7e68ee8f86ad9eff034f6b6c9a046ceac9d823d4cb6b69c4d2054bdb14e64bc4ec63aeb771d1127b0327278354e065b6327d947559bbc12a063eb76cc7a524bd4b23702b6776559ed12a80d6a29a8eded15c8cae2af8fe119a1bb6cc5ee30fcdbfabc6fd3b537e9537163b6b551e91ead434d313c51646d65c648356d85b1aca5e8ba22752a7c55e9eded71a7533b3559a76e9657c0cdf50f3fb4f71ad0500b7d401152b0d50af06e5b429c0965c807434ac62ad93adbc243569144c7ad98139707b924aa262b8b3b04ad449c9309995f9cf4a1575a464a68278287b459470d8e99d0163b1d701c0cd69da63a12aa3b23e6a8ef87ed4078e19fdd0b7ba7aa96f9853d0608050485ea5a7a150d5b06028363cf50107e63262a46af663a958d255b09c69aa949c73195a744d25aceb09059a5a631b1c795d65051f76ce9b3dfe81946df339e39619e53b2c9729d59c4c66e00ef0ab64510e82d8a0ddfaf84432c894b3009123c1afb1adb42ddf001dde97ae992c5e699ec6d9266621de0add9ab01d1a1e3f14c65701216e1ad849fe45d8e319984889fdc9f6e78104292716c73a7935cbe70f0a711cb71f9c59da4590adef4e6dd8f8ae3060dc6420442be8fd1edaaab33e22390aa3459aa7a6fb0b17cc86819a4533798dd1c7a2dac6c89b53518b0da1c8e97eb1593b0f6307b4da5bb389e092a17eb6a67edbe299ba22389349e4727f267e19dd5efb5f159617d049e078fde9e196876ea4d1fa8e7dc186d8c46df0fcf6301fd5e641a9ffd835a9c183b734c2e5c775ac95f57c54eb0fc8e10bdf475b82e01ed96f8d6b8d66c1ad3c8a3406d5536e3a8a70dfaccb03faab4d4b81af29d02963ea97e1de9f83227df59540e0075c9b3f0b105d2e3e96066ab1aa417ff37942a988e0d016ebf51535980fbf64ca785faa556eed2c8d60b9f300fa40601e60eb605865cbd15bc51bfafd260cb56fa1540654d2544efeb8f2ec11e780e5d2923545d3143357b63a25f0972b238c62e96aa262a96f37ad9f4f55ee38a5fcbeef2541368437965946038bd3d2ddf5130ace58fc1fbc9ac9a1fb5c9cd38890043282deb4335dbf5386ad919aa6469c06f45b6c1f13c2d415ecbab7d508c3904224c3ea69b42d6af34281dab073ce32c4fa32c2cd4f0823e61278a4e7e543bd49a2f347fc4b6e699e837480b327c6e18bc8f601758d6a69b49f27672330990a91e03fbfac935291f1742cec2c7c923bce0c59be72d0ce3f5a052df912f1b500f4b9a90bcbee20496b030c1a5c55bd37b66ab15870faa21a0045d2aee3311c2a7247b52f550cf6368c46d39f553dd383a317a9f775e4f5ae62bcb717832129b28dc2b2695539673b1e48538c62f40dd7cc744d4d455ed1e06e96aa149bd4e5a384bcd389c4adaf54f0d15755a24416e0c81f546befc9e213e41b5f2bb86a6636f97cc589abc25a365bc57a14773b429d265f87b2e9859e1a003a5019c916af251a7dfb6be65e1f98de7f82dd0c9da3a09ba11d10f69e846afb6d2dd196f3cfa66321576e456187f8dd1b78bf96a3ffa340f99a2005331cf899ce11a1379357a8046b6e18b03fc5077c7f1272765c9d9cf4d67e76cf590d5c1443db8f69ee0cc985d55c69b339c2b43592e5df41daede50a7de7f, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3236303464333435663638336563373638343464653732323830643665623062, 0xb558dd6fdb36107fcf5fe1d88525d6b42a67e81eaca8c1d0b54581accbda147bf0fca0d8b4cd565f93a83a9decff7d7724f54159698362038ac83c1e7ff77d3c369f3ffff9f9c57c18ed9d3009d62c737894862c62b1b087115bf360cf3f73270ce26d116cd9906e8a78257812db4fe8a73f0a967da519fbbbe019a351b22e42464abb6689f6f409299f38ec5eb0786da30c8d43cb344b5637d71fdfff723daff90503d981000cbea9178ee02264e371bd4e832c889860593e1eb7209d55127f6199b8098b2c084d88e68813b2782b76beefbba4cc9828b2d8b2bce397201bac9222167e0fe2bb22ba635947212ab282114f410c1ed4c306d1397b0bde94f074e612daa316f18efdfa2edc65a5e7a07fdb3b3666504376e358257b9364514ed97d1af215d73caf91464ab43f9584f710c39ca6f5e6db78cdee7dd703f57a4e8ec77dd48594b73cf7fd024e6f78ccd6a4b6e2617ee98373a9e5e1203f0f44aba5a911af2d13bf0622c04403476cf81629b6b5df7ecc5976adb92c42ad168045d0b4f316a592a4bc06b267e44a6a03ce9eab1fb365a544e322141aae3314d998a63ddf46f7ba077f0bc4ce89786c773668db05d3599d6b4a850e332844d38cbdec8fbf8afc99548694fb1d0f99dd46bfd43b8a9616f94e6d2f4c1596a44a36a504c8dc4261b3ac91a4d64a7559838f89a7dc3322d935455b702183a5640088150521c4b3341ce3aa3c6a9836ac8f6d56178edd51eda72adc1755b811b22aad37507a51d0b2789f646b69afaaa2adda7f7d62d2a393b38da0b2b34d198fdb2b19a0a6439c6e2d50bde5e1809f3a786a41439e8bdbe416ba73630dd2942102e8be65510ec50f50b6c72f7153fbc9e39309299167e22379c197a8698b637a01bee4150f581de55bdb0ae2b54526d50a1599e60cfb99483230f6c8c29c0d3a40b3f31ea05502969a678f759fbc17605ecec48794ad7810bedc01d30afb6563e81a6201983b9e3b7997cbc74dc0034c5bde817fc21da8af3b42bcee05572d0719c3d6061ddace4546e322921500df4bdf3d1cce81d8bd73ee8a8dbf587aaa2281713a2525d05409227f1d33a47e4aa04b58686a2d320dd636da4b73fe0fa3ab1d85b42767b2f0563b52ae76bee56a594921fc0f22e3f1569e2014cec2da6fb486e3b219ad180f6d1b11a7704887813c5bedaa9f752f026957c032515073f59900a5a5a28cd4e6abbe45bf0461c140b40047c7344991053a85fee1ebefe1506eb3a448e716b5e81ac203253cb71ceb8849c6f377c13b05d45c2b72a90c052daea59e95985ff9968b9c72d955f7bb046eef64b381c1250ab86c579aef26c844eeeb05a445c8a1401da8c928b8bf0983155c37769b159ac8e1b05812ed162a755020dad1d29dc15d5e69db06dd60b681b141e837072524549db4fe0344c0779bdf17b04839433d16b2dc3aca90b236fd44d1f1b84380ce940b7977fcbeb12149c8644614a68678d12858c5bd3414f531f91a26daf81de0f47c84adb8f6dee577115b0c392425b3ddc6f758e1d81e30b98d536d10274d521b398dd0fb86edeed2c19c074c1bd30b0baaf19b71cee12dff18ce8196045772f9d039ddb9ea6dd3b12ded41971e4fb8cab706a571aff2ead9039a8e2ce22be54c4053a8f26e9f22d3b69ca3843d719f913a54b946726ab734d97b7252c990ccd3995797e00963157ec90902a41e35fbe335b8681f32851f71f0b0653f30bde3499a075d69b3f16ba42b49ad406af2dcf5544daaa66dc399172ed1ccca0a2091b9241005edf771b954f2c1d520affc4affb6371baad732302ec2108ce9e48fd2296330b4e4cc26eaf2d0edd591a7eb2ede2a1f834b375ec883fe379cf13e6aae56b8c7206c826d59a646094e4594424308e21c8792dbe00e3a702c4fa93e590d576cadb0aa86ece9ef8f0d526bac8c37682988b851481681f63aa2a391eb8c4623cb33953a918308b7068badde0be6b9fa1602a36471d6e6cbbad72f40f40bbcffa03ae568d03e02fec1968ef9c8073c3eebc2c3fec2a4c1c0b5f4399c340d0046afedd9ea2242895edd3ecf4f7c278dc4c7250480c1c00d93274835b141c1a3816dbe7ae52d2f8dd45103819db8c23ca96cc407e5651bcb182bf1296c1adb6645cb49d9419ef8df39a18d3f39d6e16ba6481dc2abd603decc5108e5bc43930fa2beac698aa38efb8fa7b4098d198d9141c91faa71f8ff919ef7c3d71ae81c68c419c39eea05cadfba1ae9b7cbef01736ca246a26ec8e11ec0e109ae7443c8fb57feb3c5c8a5cba7f077695fcdff72dca7a3a7e4ea5935599e003912c8b12ad5afe135d29d0b3df0489ae45cf02f4c4bf25bec788da43d64e5934be8fdb3b9bb3c3b1c6c6b6a4d3a40c4332cf03bdb4e1488d5ceee58a91a9341c4074e96ec0731db0f5e6519549e55c468e24024830ddc8383400704ff5b2663798e033bc767853c3f1f806a7531ebd4a9fc50cd501d3568dfbc6ff0e030535643bdfeaa88cee5df23218f7f7cf5df4c903caf8330bc0b569fab04ceffab2ad87481db15d8950a8f4a1e9f4a5e7c47ca1277e14d6677343c31cafe96af8eb4847f4378730fe7c3c1d7211d765ecd40a603209bef70641e02e6d0fb17, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3265373038356137373561303037333036396434653035393432313938643136, 0x6d53596edb3010fdef2d4af42301d44072ea2475ee50a047189323891117958b553be8dd3b246d4b72020884dee3ac6f867ed73cd5f58ee9e9415910e81ea41e156a34e18e454f58600b5105cfaa361a1ea43577dfaab7df11ddb172f8274a8795b6222abc7fa728d9c78ec9ce3f780c77ef8c738dd6a006a93cdbd515e336fdbcd09f80806cc7ce391811b26dad51c76c27a487bdca8e19a390816ec3ca2391d688bde24af2e16ae731d76a8d935d1f1677c606d96a69accb660bd2e1014181106e41a67e02a861840ec9b8b9f01304de2be9c3e2e26f4023ae17996bc1f0a3975d8ed85ac731678d5a832b4d76e48394914533183b196aa997027385d920a11182b34aa1b8329c94ebac9327486de65c52a752e48914dd544c43e8339d235df44aee06a75cf4c7c0865432a0d348a80c72a3ab3df0214da51844bd47d7230869baa2dd48b2499cac69a5f3614d053be6121c177024f3e7f4aba49664b7254367276237db8af9de4e548f40438d95c0892af97cd69432e660890fd65261aee04152ffec400327c50887b80fbda3feac2a6d859ec2146128554c7a2b698a4c345f250f782e399b134512399ea3e7d4dc6196d9cfd455d099505846519f9938a627b5f0495b5184785c30690c6072f0fa86dedbf009ab64fc48cefbb2a2d34211f965cdaea7bebafa64afaef70e53431083a5e5921cd4f99d66036d0fb828f6b23a8551e7a16fb645dff4082670e6325392bfa539f7218c452f05a68bb4a434588a5ab1033809267cef20cd3a9d3397e46074cccc4069191d0b26d90c4b1b5a7fa2d2b9e0d23bf46ec104aa8fd13133f194deea69c19ce89d313a68f5101cef7ff99aedbed6336c083633dcace1e31afe58c3ed1a3eade1f31abeace1cf356cea1b7c535773535873535973535a936bfb77ff4a1f7bfd0f, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3265656539303661626266663638376130666435643430663036343333653036, 0x2bb63236b452ca2dd7cbc94f4c492dd2cbcc2dc849cd4dcd2bd1502ace2c4955d25152d2b456b20600, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3331306366653535653337386338376138366364353838373734303030333266, 0xb53c6957e34892dff91586e15952230474efccee58a86b691a76ea4d5d53505bf3c656f7ca56da56214b6e1d4531c6fbdb37222f654a294355cf7e40963223232323e3cc837274f6ef3ffcf14fa383d5bd97e6514c0a2f59ad53b22259651fac489c44f7c95de27dfaad26c5c3eb7271e0ceeb6c562579661fba9ffe86a56e417eab9382b8ab3cae53e26c6c09b2ba770f9dcde7a818e469fc2e2a4a52b8659acc48705114d183b72ef22aaf1ed6c4a3a5ee9a82fc4ce6519d5665b059458b6436dadcbcbcbd7a73f1fa6a0454cef26c9e2cbc05a96ceb7e719354e44db42296b375a334cdef49fc976a955eb11194a371a8165fe6ab559e5d5455914ceb8a40b595c4966bcdd2a82ce1b7ac1e5202bf69942de0274e0a785649450b8b1c7e34740da29f1e788fa3cdd65d91b28c16801da815ef2ea2ace10d0bc5bb3bcf8b55548d2c3a6c6beb0bbe0da2f59a64f1c7a45ae675857c4bb2857d0860d0853b5b26690c6f8cb1899b92cc4fe6f6fea1979494adb6847036e235188bb7d0df42bf76129c62cb40147bf0b1a8967e724ef11d1d391b408a7393cf0702689c84fb4160e5d34f6456590d76280fe27c56230bbc5941a28adc922fd59b3c26b602e3f85bc0a91424595945d90cbb60b2341c2ab5de322a2f716a6c8b4ae24790c45f9738bdaba4aa4861393a056a5310930a25c0863eb705a9ea221b70067a8cbb0d97802182f1319901cdef8a6415150f54923298ff849436c9b02676361c19fff60ab24ea319b14f867f38fde1cffec9c2b52696e528e5bfd57945cb0fb4e294159e6b850b56f8a35618add6b47468a9a456c0e064fe6027d9baaee864d1b74187a7508715017dee79d80eb9c2c77103320cc2c5b028e841c1aea3248da629618a7b9dd9f91aab4ac903a9e751b1289938ce413fa6d1ec8eab729091fb0188bcb41f1e2b97a8dc3bf21060f3f129e816fc52090e1a59a67567a1f382bf8ca8a5f066d00fad73cf1cbf2a1e04490c3debc506dc0d4e18dc2caa664b1b2c94a032e0e025a92ae04229f595da1768eef8d4302ebcfba8c8b818ea067134b08e00f0c8c217221038be9039db3a2fd75186334a392fba46b9f4b72a6b82cdd6d7580554bdd30da264781c5591b339f400238ab26e375d5aebb7b02dfab1c9099508c18ce9384de85eb3b15e73340d3e29274c227429e2560f4d16871b0ef98bc7aac0c4d4594ce64986fac6ca021dc4df92b424a24e275582b4a5942ac97e9b1e9406bd24d825fbfe561dd47b524297411b034a263586000f7d7232c172a208588f8f4d012967d19ac456a3531a66a9ad74b86610b4883613279ca23d7dcad37a913c776afcff478e1d56c0135205d532293db25a570f40b3d9cf31487707531bf562b0feb62d9edcfc74c74dfb17fa1ef40bbc2bc9d75a7879963e5cd645faf05301d6f9b688b2126733b075b0ce94f7554b0160fd44657519cd96048d016715f5755d43aa38c256df32bed08b6930d5d16361304524166c68c948720e8d28f7458cf95474804e3695c0fd8b92db4a3e292addf4d706681d87bf755943ad1f861aed2b460f34a8d1988201c1dbfbec5d91af490102844d9c8d800f5ac3ed98f2269e114d309829a903b4143cd66432e6467d32092d7fab1131868a90f5255adce6c802f1d5f8d66e3b18b7d6a8193e77e3c880755e02b716751a15af20be2da2d4ddd3bfb9c6fc1415aeb1e2660d9c3654ddfc56430884927b47d04fe435e8d7df203e212eaa9e7847ff5442e0b574a3ece17219013ca070a372962417e97a194d492528e3f2fbd648414f25d22dabdeeb23bd5fc24b495bc7790a156e9c2c122016e5fde78660197cff7794d684d6de344330d4caa22b60428afa4d328cf06ec08454b7d1822b7c945ee70578fbf8863240405d6531c2ccd2bc24f8cd1a90ecea4b9526d91dab101f38c5f872c983500af991173250f955812d4c2396c5b8eb644ddc599ee6992cd770dcf24286437e6579f651b2edeacbba00d187a1a0458b56ca37695e675d13a60016d4b3b8d24c6a9a050466104975523856ec83f406a74d2a335be610afd96b43d4281218d69bcfb312c840d6a5cc46300f61f5c1ba84c0dea66acc4a407bb33a4d25628e47c6fb58899e41d25242a20a713ba346f6ede60548184cfc3ba09ce91eed6f1cee24a9454f2088c1f12b187d8d1886da5bd7e5121b35a642d0be2789cdde16aff382d8308d7daceb259cf9b238580379a05029611162ac70aca1835539bed2662b79cc477d9e3d39306d186a9e22e4cb5ebbf3ac6f28628e6de9457809a3f8053e46f38c53e5683daca23bc2d218162ad87c7631bd95d3b6b35b3a06914179653d05a7602347a1b103249452084b94efa30073e41d63468ac0ae912f9ca002dffb86bec2ac040488779e5275c94bc7a315bc2d5227005b62cf268092c52120976a0dbba9403a75c710b4a93df965fccb663b194fc2c373708027382566efb3abe964f2d8db947a879d8d4b735bdd81f5603864444b2f16740404fc3a045c8afb338040b6ee2b4ed18404f27c5ff590067a3c20a4ed6982bd2eae730be1ba0ec8807272f24241ca1c9381baf3134069707c268ce57701fc0156d5bf99017f042829e7dc89f309d2754a1adbb1399c0877693a2b82741f329f1d0146c0bdcb582764475004bdf607255f850ee055647a18f33c4ca1c2cab44b6bcb46717f70b633e472761a506ed33fe549665bda6a52da1edb57760e2d7e67d74f76a873f85b7bdb19f81805b921e5297bd4a1696f3751a680baab75e38be37f44c7ff0c8f4e983ef706c1467378107ec7dbf586c7c676166dd744e3466b8024b128dd60800ed1c4d2d8ddd4363e520d89921cf659112d1b089530d0ec0fd9c7d87a7ff5eed5c5e595c542a297805fda16f7ecd4394613a304f286718c2d6e17fb41424b358a0c4c1b070fc8d88a8dcb172dd4e043ad5706ada6188d1cf6c4fb8e9a3c290aa400a8e3603c543b96e1215fab51eb805f3ca6007e9fbd68554160311a5b976fdf5c5edc5a214f05ec169023463cb6aefe7efbeae59bbf5a9c15ee136d7f089db0136fa9499569dae4bced000a71e630eb32d43daa932ad2b11ee9dc1b6be9592779d3f2b5e77a3ed93912188b51f4e94733e1adb4cf6169a55120769232eece0aa7ee34740c53c62bbfa7932589afb3df49feb7d30864b45371e99835a2dc1691aa63be3711aeeb33fb78a574f35cdd960474960c34c9dda1aaddbedb6adb68ddc7977f7d49d5aea5656aeb6e4ada6c8e358e47dfffa45e84f3a767b0ea52d3ee951c05b299790dab3affedb12ac97ee3eebe9a5a75316c6ff7d29202fabbc8d522f5ddd42956deb824675aed1262bf7b0edddd4c0b9d670c71dc1aa3dbb2e4eaa093f2a2d94eb74b9e1fd1a53042f31afa1ac97d7665cbbb2945185f6d1ba81f5e95bf821e8acba804b6fa0ddaa0796dc180aaa91840d51ad0c7c7432fc9d8d6a446af5c77361c43c02584e333658b272d89be0bdf0cb1bd0f1f7cef6cb4a12ab0e32444621b8a34402349ed23108cb4e1f06b7018ce3d8c555e848f8fe3d03c66b9325ed4a44ff84b93f40bf770aa4bb71271338b869bfbe9833db6fe72fbfad5c5ededfb973f7db8bdbab17431745a7d438f7b4d976fd195470bcdb833de71dbcc8a2ea94f9770f705ee66c5cd3014b975fb449b96f3fedee51c4e20c6028055aae14bad549d4c0b13ae07fa86e1b4fc8fb600feb43129cd8be4eaaa81eaaaf49e8d61ba363e4ab4a6c9063c6836bb73a2088812de8074b439aa30469f400367f8a2bf912f7d636e21d5072d8315575dec6b0b81c613a7e5abd5413b947fedc12926ce4412f2af23ab46467f1ffa8d08079d369cfa333af8afb6e4724595a9ead5ababd7576f80315ad34e9f4f30836d9273b42656ef7d33afbb33d65253e5d3e90651ea364fd02c891b32efc1fec1e1d0b29def5c6f72727afc673f78f19f17c7ff98fcf2ebff44c7fffcdfc997ff383d9e7cb9be3e9a1ce39240731e8f2f8debbb21e0daf8091fa0c990cfbcc3609b1b5c541cb119d389cfb51ce2d414a43f919023f6a0c96ec4312a28e52eefc7b317dd601eeb9d113ee9da75877e5c8479fff4e281b6cbc636d8942587dd1986cc275c99e0f451f2b6aebe8d98163bff95045d274559d169267854e0d9343d9706cb82ce690b430e3dc2730dad6458a660ddbd18852001d433d16e3fdbddbd9d1c80d4b511634d0df44cb39d95e3a64a9361d2e58cadbb73081a4f77f4d9da40342d63b1febb04846c2340ac2c186660b311cb203b80b65b00ea59550ada3321735597af74a9aae41ad6b143bab7a8caf7efc2c917debf151906340223e0d9b91edc45ad627ace52b2ba9240bd865de479a5184ed34af3a9db02b29fbddc695e0c71c4ce334b8dec671d697ab1737c2325ccea10f7f8088108e44dcc6732f38e47af8afc7e800799ae8a02921f8b8adf80e0c720aaf0dc4b4219651dc1abe2b98eac4102c92222c35396e2acea5e7bdfdfef3b20d59c039367a3d86928761c4c1406e2c5c749f9b42a17f4e4837fe89168b6b4699346e5f160d4e708260201f1748f9e468686f395008efbaf4e73b4ab01caf298180e5a414bb7aca7584bcf80141142bb0d71e57d82dbc4fc6413c2399b1950200e368de84756afa6a4b0c0908198018c3f2d4874e7d33a7e9c7b24ba090ebd55b4a604c918af1976b3858f34b0f35d59fb7417354b8c54da1d1acf4e92cd49a6ec93e0211e8a139db16391410bc296fc68f54ae3bf8e947dc8eeb2fc3e1b48048303eb487e1cd18ddeadc20e79f69471cbb238af6276327064e80074013848e2010e0965f5e2e61625559d142524349c575484553d8bc7b478a40909178c433c561ca8e78ba338de7d5c5e0832635e73f4cc6552633e8d89d85d3e82e6dc259682ffe313d022d020c60930f54b20f7602818460f67a72c7dc0ea73b599b41a8d963795630a1f6ac762ad43eb88e1393ac3d3b0d20b18b9b7461b106560df0b17cc9c7b48709d164c8038562f28e4a9dd8278b365545c54f629ae6c6060b3a1f0b44a66425bc015c0c4d65592e2c1c30f454a1b532c14a5b289021ca704501c7c2cbc84f58e0b8440189de488ce302442f686de4819d1112c0b321f419fcdcc982791a47cb018b4a04c349998913d6c890dacc01a9ae3595475b14a1d87b64ec5e1c78cfa240c83fefb141ce6888631f2940a6dcf4924fc4a8d89beaa9350bae2c6074e256de873204e6fb94ce678945a4969f58a995c4ac0625fa001eeb7aeb6f0352f9be377f8bc28c9ed5393c1e387267315918a59d371f68a45209546a714c504a40b20ba773f86c37d287fce451a943300e562a84a9d62aa910add3c03201bbd85a268b9d61f404c67a00e77cd2d30302d048c1af90c34f3e3d5341be57080149db9e8574327b41161949b3c7d7c1507cb35d6aed31a0231236731a4014388f9c125de06525ef1882e2e250189099ea22fe89ad7ea0df5a3f40ec34bb435f40dbaab33137489aa432b99e9bb4ef388475f22d4c040ed33292a86b8318cb8420a43a6140a4115560695515280872dc5fb390517aa298bf1c4223da44eabc7b23c1497134c8283e5cf119c866514bd72f38a9ebc66f6bd0102c4f2ddc371dda2a30b02bc2be6dd5efdfdf6d7376f7fbe52d1d233d94a2394099e4b226a7a96203881e2b2b2f556405ddf0c36ae486fe295005fd927c18923dc93b9eba0dd8e4e4eab90baa3b773db0a2c07bd924142c67d1486949d7e7bca9aab31a00e5459071d2600f0f3868ef3d51df0d75329468fafed31b707b0a78d80c9370b38b9360a3da5c390fb07c88bad7ec5a0ad428c369b29234366180abb7b0024144693c0aac0f53d4cc9077a834d68a45115e9b14c010aa6d1422f28be3110805f7a9c56960e87f2d5e3774c54f58336afa3b5b36174041d5876f395d55a22e66d03eb3710249f1898cd873897dc80dc1cfc73af856c58709f1771e374781f58c8ccc570689c97ff62f86d04a4bd62a7569241ca61ea12331bd1a33cbfbafbea99edd8988bc8084dcf358eb04ecc18f69d99839e0c05117cf8caee048174a2f7a9961d722dcb700d1b9a74ee24634c40d7505ec6a5e58c61cae455ce015ee3fcd56ad107519e09cf35bd2304598544c8d049a664e5e32364275b7ea30e523c732c5782ae9305c8872da66e38146f28b3ef2de705ba9bd1fe99cbf2c40eff77ba2ce6126537c8e1bd74d6a145a06af3b695186eddfaabda7e8058a0699bcea80936078df4925027be5770f74a50d598f83346e2bfac1b85fe76375b71fb3426103ecdf0f8d13d98d7fcdeb516af2df749a5702d300683e61aba3df03c6fe0f0dbb10e353b248a3d9a19ce330f35af7367945e2004deca1bfc08c2bb526e7fb07b64fe8e3a753d04434a14a9e61e1c684892598f8ffb2793cd64f3389e8ccf7f1c865cd7282cb808aa1af4835efd92722169e3dbbf08c26e31eccba6adbb634af70e5f0602a8b1521c7678d166f0465ef517edc5957e05cdb6751facdd8b1c0fbbaeb716ebd4e2ca6d0f3b7fce5781dd597eae4b7e6392252ed6799c7cc610be7bf34066d56a1394807e7ad4d02e2615ae24387b743d0b55cf961122ffbf108ef3c475667b7360382c71301a1f4c0fdc83699cc03326293cf10d84159e35fccd810c044816f02c5780037feb297daee1b93cc3c7f7f8f8011fff868f3fe2e34ff0807080e00f6826fc901536c33fb0fc7784bde419a2aeb017e02b92917cc626401fc1cf699acfeef05e3fc2e7d87d8d8f181f15b2138123eab0e10d74179e453d7dc01f24b3402a8b8a3e660881ddae23048ea653dae11c3feea631d6442b04c05bdd883f59213a70a877f093522621a6383e08b7748de6c0ff3f, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3336616165313062373837386437636237646663313065356262613339633839, 0x8d564b73e23810becfaf60521496078d0bf2aa148e5295dad9dacd61e79199d93d503918dc80822d33921ca00cff7d5b966c8343b6968bed56f7d7dd5f3f901a9d5f5e5f8eced2759064510c32e0e92a811484266729c43c5af3250f7205f28cce7231d53c13a44b9fbfe520b754c2af9c4ba06916e709f805a955d235edfac54b243b9c1aeb0731cbbeca2ce50ae864abe147f6276cd8f829ac2c3a73d03f9d22f10b3e23ef5b767ed1123001eb0e467ebfe2c40f8eecc3bd049d4bd1699984fb592609678390df9e5f5d87bcdff78b3a9e317f6284f7f1c00f74f65d4b2ee664881f2ae153204384ed06b0d120624cb0648516731020230d8f9188b3f43b2885d93cc4a39a0a4b8314b1a29c4aba80cd23be97c1df4b196dc98d4fa772bbd2195b73c45807f66bb7739fa9faad1484488a3deaf5ecd3246dfdfe1d253928bf9015f44f2ef44d851f9e5627461b9382444163591b3554dd58a2d03fe1bd0b9f31364057ecaf482f02590212ffc360331cb81fd28f68864e797777678d6e6f2ffcdef9d555b8dfbf02769c1883a6180ee2a9aea5d30a9e332e88e761e014133aa6daa96275a69998f1b9499978eb79d91ab14707ceea7394c2ffb533ba95b7479873a5b1de68f6aac40767ec24d2a13522229fae8d02aeee8501aa239945896957543982654ce449526b998f9a1f53bc4fd8894716266e0b3e7a7732dfd2bd6384f8ce011aa9b73ab93eb039664b0e36c7746db03ed6e736c346bd8afd08c0b93f394338c78d0b75d24513262d60b3c265a446c6cbbe5901b58661e28d66392661b7ab44ea20943d9de4d325e80661095b9aadccabb2d4d850e92a925ad11790c6d659519c9339d0a579c654673a4a4267cbeaa552585d352af695f96840abbc2e06fbcadd6e576086d6dd1b6570c17a7d8cb22c84deae209bb918b1189e2a179c87cbc45a2720e67a71775e0b70fdc0e6cb8c7823cf7fcfd8c7a15f94a9b1aa24ab84ebf2d4e0974715c8b0d7fb9ca71390563c1e3c99d672d1072e3724cdbeb0b66e68a3676e075bf910e57b3311ee90b11c039c7101b1fdc3e8e2187d4d222ebe4c9e61aa49e5ceb18ac3a517325b9783f2bb94b885bc07f112253cee5895a0632d3b48393e20eee0aaeab46002b30b5a81b7130bcb6ae38a33ab6ed9e1a20d82cd6734faac251f2fcdbec316692dd7523b2cdbe63f51df396e9656f724bee9057378c70c3cfeff498896c8ece9593beca3aa29fb58f3beebeb7aec5a5438b1ffe1e6fa72303898476b67d7e91f32cb57aa99a86994249368bab4e364fc5b8dd3ebd49e79748c8de1c0bbc12798819480131ba0fb2c7901d2e0f8419c0968dcb8a5cee70b7d320a877a74b708f4024473d3a96e18b572250864098b2e5ead1cbcf7ec5f87623822e5a5eb1fbc74b93b968f423f3c0bff05, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3361643061643135666665366639393138303430653230646539346637366537, 0x8d8d410a83301045af52449804d250ba2845f1103d82d5b14612a3490611f5ee554b91ee0a339b3fffbdf1c9f57e4b2233486df3129d54a6d368b00d2c6a7a42374a339c1b325d242a6a8ba06ccb62d13cb69370d89372288c2d49239f3e313b8a7c8a197c0dc0e59a41650bf2a7a72607027238b4ab40550c65183bccb20cf6ca3c1fc14e5a0ab06943ad3c9785b61e7df8795278cfa61ad5ab0ec965e1e982dae3df04e4142c6cd8b6fb44e91b, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3363306438393032633761646539646433666135646661663166386135323439, 0x85914b4fc3301084ff0a0a96b296121710e2d02847ae489c3850904cb269ddfa91fa414069ff3b9b508ac48583257be79367c60ecbdbdbbb656606a19d6cd10b657a8d066d84cc60abe4a0764af4728d2244e963eab3a24bb689ca5960c5f631a1ff2c3cee93f25818d7268d7c8433628682f1b1754d9aee143f9bfb6f0fd16819c2833458ff8f088fbd960dc2025e0fabc01bad482faddb06588503e38b2267d7a7e936b09b9c57d46bca5e8fc78afd86e223cd53545a28ab22ccd8c6b91de453dbb96ce36ca47b722e3a2a060cf24b3394a76919f183245ebd4b7fc15ad575350151be6914d3e9b995519666a83345bcef2874f642695407332d34da75dccc31fef84ef2d97466710f5764753cd282f94b9e083ebdfc24f02aabbe00, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3431333636343935343639363330643032366561393866666161356434396530, 0x8d54cb8ed33014ddf315a6aa268e1a220d120235640342620108a4412caa2ea2fab63113dbc576268c32f9f7711e769cf401abc4beaf73cf3dbe6a7dfbe6edbbf582557121320232a6ec580003aef18201a15945ef69acc1dc661a16d1bee43b4d05c7cbe8f78f12e46324e14f4925444c90b280b0c6ce8555d132ac1f328976821d6901e46ec8a3d2ba89864bd91e1203c016496b0907aa34c88f83c7daa5e419031718d6748f5fda533cfc84b5cea5a810870a7d9252481cd83c88954a23d721ca2c30c440e7820461d238549bb6d636b5e7a4890ea06da66fc636a2b2c8dbdbbee136f67b26b54a7d5bac8e05d538884d2103dd39c505f083cedfbf3e83dd52d6a5ec1bc8b30730d855b9dfd3bf2d6609ba947c2cba99677e75bb9de29f323a19924c6714243ecb6710fee4f75c54dcc5a360d52575b83c0a3342c6d2bd625a62229f2577f820c8e3543fa9cea9b283c6be5fd45966139a0e26f41b19a5b819616cc3faaab9156a73d563e35774e221c99409d20fe39f4cf4cdf74657aeede22a869b9b53f38b8b18c37a86ed3ffa4a9a19a6d47bbedd14bc8e7ada67014f4ff39b39aacb0f2158f9aeab0071a1d15e949c20ca07b68c938fc02ab11389d1e045e95d0795b8a575faf63b11ee3cf13962e7cac413afb36a3695262b319e6f441ce49a1541549fe05172672b9b0f27fe5b77909678191f33a9e0f3ddd72fe65f4bcabac8b0abdc34e683bbf5ffcbacff61d3b7b6305924cf, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3435323765633030623634653161343135393731646532303063306639303435, 0x9d586d6fdb3610fe9e5fe1048129d68ce2b45db75a5183ae68b7a0cdcb96acc0600b0323d1316d59542929b667fbbfef28917a719474db9790228fcff3dcf178a4930c5ebffce1ede060beb0434103266d3e8f433667516a1d4cbf654cae6c3fe4f07940c659e4a75c44d62199fea6668864df322e19998b200b195e5b95095e3f50d989a518f3907da0fe84b9ebad73a8c1dcb59e19942b22fa80d77cac5ad775b32860631eb100afd5c082478158d8d0e5f73415d2d982651d7c0853769630f9fe1ee07b68837a6a240e693a1672eeed3720254b331975fe0b80b355fe3c309980d8cb6c7ec72499b195fbfc3292cd5c9445b3482c2244962e5a22b2e061f0875991b84374153349114197c63be85f80d031676100fdcfbfde5e7c81f6c3448a3983cef597f77fdedcbebf3dbfbaecbc82ef739f2d184d58883c526ab995344a4006c80592e1b1f509766a2c969b8b9bf38f9b1c939c8d9290cfd828f985f933b1f92c22b5e342e26382006ba8293b37744c25af24a829a3aa5c948fd6756bc27cbceedb254b139fc605ccae2fd737af90e7111de86b40e04ba6a2e4d3398f0458f8260c638d4f102f03405064d0abee1be80b1d640d0cbd59299ca07015299c79c2d5bac4b81b274a128d022978804a5537d91854b9c81a8d8e37a39173361a251b6c0de9d1dffda3b7a3913d1af5bc176718e69d4dc01e369285608737caee102312d1f9fff5e969d5c6c3523d8f459037131181c11eba0ba93f83c495abd237c91460c34925ae993c1e09e94a6479b2deab4cd9d1a105a492079078d063c17d5dd182ddcd788a0ccc4e6636a06693741ee689b103aa860c5e2c59920a952605e0d7625b943c1a43f5d27ca414bba3cc23e67caa25505b9446b178f35af9427d15591e652ab449168944b52284982655342b885d6f769728e1065c5181ea542f616e59fd1291499f95330aaca8a0dc01128bbb7d879fd667ed9045f7e9c4e1bd1e5e17abdda2b125036d3eb3eae643ee0dfb1ed91d3af1b0b3d5d5b058ed6c49469b558dcc69ea4ff2bc70b3998e79d5d387420d9898a8be195e3a50aa730437628bceefecfee332b690857acd42684f058f2c28a0b88730c2365b32dfca28c66bd053460c46da4b1cf8017619b553f1452c98fc0047c7c24f72e727f069cadcd78a348780603d3a1b38bf885a19f491799a43c7b185e5f131f92e8f3902f65e9d6f04050a8a50d06b63361b145399b073b8ef0bfe971e39e93fc3571e9d56cfea975f732b80b74c8f169fdb8ed3332a76ee87a6965ea34ed73d373e17b4afbc9c20df6cd73585b3dbd556ef5ef7fbd512f4d2eea3867d518e2a73f7adfd135e17722111f38e753cbad3f3b01543753dd8de0b7c5c6566b76b62b02bef04e4b13061958413a5a02e41df1bddaef59856c4b24989f3f755c59683682f9cc7d48a47e728309912daed36b2e79dfb632bb97c187606a363effbfc799d7f82fedfb8a92afa233f0be8bcd83f86d64ee9e9670fc3c9ee61a833273c9c69667b74f457c1dde6a2326c75b1f19c2cb83fc1333cb5f48422df6cfa76df6979b1ee0de1fde9b939c740fdd175635034cdbb71d070b33c6d83f2a1aa6706c642b73fc3d91d1839f0885e9e5dd074628f4301b752433e86e37e035912dd5b78b0c4a43139687c6de19249e10aaf1eff731a13ed1b614beaa7172a485751b82a6e415f4401cf6b0209b8249c88983cd0904c49cc99cfbe1ab7f20f18f7c51ca2c91c8de91eda3cb90e298faeeea6cc4fcd4f077c667e86981f26b61e3057476c87a9544734b6651ae235b0bb8716ba13c10a4a1e4f2ca4c6113e43aa1920b0460e58c32ec743302e2a4cba8a991877606c5fd58d5c03da6c948de6b3d5067a6ecbaf94fd663c9c6d150bf71180125d9b77dd31850252fee0c9bf72450da3280bc3d226951998548f8ecab2f1e410b15bcd14af0b07766467f02457a4dd57d3aacce64982e03aa86d9d6bdcd089524b263b89439e42a01176cc06bb80551f5f4cd49ed501b5d853b3427f3759ed384b2616ea03c2b60e519a9fb6401a0830aa2dd719072153a19b423b6d5bec4c55f02026c54968481e4e3d7cda18a7a11adbc36b837e74e2dc494667c5c5d0791ae75d0b4e0553a2a854d8b71844d3d2e1d6263d11f79463aa983693a7646eee6a94f3a1dc378d8876f6b4908414344cb7206f1b290855c22afecf8021bed83970fe01, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3464646261306535326133336166623366643465363935636237343663626262, 0xad924f4bc43010c5bf4a2db22410725b90869ed69b7af0e4413c84cdb48ce6cf9a265b9690ef6e23cd2aaca0076f8f99df3cde8399baedf6a66bcdccb5930a3c4773d060c006d21a5028677c43aea51da31c81a3c5d0b221da7d4067c9357b7d8ce04fccc37b440fcc381535d044ce8899692aeeab439f940cb24b998d106e8b3c9305d93905ac107770a2e9287d53a685ebbf99f04288caf755f0e0eedd0c7e27272054e040eaf16653d573855fd04e41da3db8a159ac1fe481260f217adb5cb27c094b6a2c91572e5a05035a5022b3e9b736ec2875847fe87445fed285a64baab730affbc52aff5073faaab9e615398b4c3e3fe169f904ba0ca868c507, '2018-07-15 05:47:07');
INSERT INTO `wiki_objectcache` (`keyname`, `value`, `exptime`) VALUES
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3531646331393162623264343065613461623064363239623535616535383134, 0x95576973e23813fe3ebfc2cbcc2e508031f7e14abd054c485892008184c0663fc8967c80af4832e7e4bf6fcb1c214cb2b32f148e2c753fddea7e5aadb07aa15ac8d563ee52767c8409956d3770884b3c9e88b904db6869cf6d19e9dcf63d796193a51cf88c5f629bc7d246e845f3896fe9d92024749da6e425b42949bb3e0e1d92dc268e22ee32fd2db98d878c488c535be7717581a8a4fb9e619b17607e37924dc2137fc5976623528ba761d80ae93d59d80cde3b38fe7732adfbfedc265db2be88f7f7ce1c04e2a93dce99da5ee711393b5be225b275c44aa6bf617b91b6b17af059a2c4f517a42500a98ba26d24b7424adead24922a80598090881fa222238313300cebc8892765501572af475003a2dc0bf919aaee104447b64bfc90276c9c54233386ede1443c8a38a482031cc2b8e520c67606c5a474186404328e275546f801e9e71da44b8a925429e12115be388c9cf8c62c7ff9ce318c384a6ec5f3423c7efcd8beaab6114dcb2e610c99e4e2e222f430015709de891e57bec901a28c5c8f6e6f20ff87e937d733fa89ad0c430b703f1d21004de88f1fa023064999301d050427921048111891434e80a888efb218ff77aa028d8ef9b1b82bf24209384d2133b01dbe0e886f4867bb8a0b9e7a667c9ff2b35c08df3954094071b2e2ef42025e1208acf439b4afcd0894c02fa15110809fe7e09192eed8fa3cf1019b92724089501bf989b8e6e33550c2c6175f4e68f18156baa00862bcfe44e81de912e7d4880277acb55db58a9d89b8c7fff8e3586ec9ed5b6d3391a9a5d93f6685d3907c504387b2d9eeb75c17e461e667c41135bfb7963e50e63582ddd7393badf3b4173a0e6cf4351171660c9cd99f5e825de96d4c672c56ffeb4bec7d3e10f09b6e5d444ddbab2b120ab9af82802d3ca81bf68a6095fb415d512d629b168781430c5e2f29bfab9b0ce497acea3988b06a005686d91b52cf1582d5eb0746ea16942cddea21653ead07be0d64a06f82dba3554a80fff682ec0ccb65e2ee6c6684d1009206ecad8b69a9103da3474ece09393094d97b9a934be57c092675df01835fcbf972b15c5235a4cf4dea436d67f60b46517c55cda75039f55cb09298efd858fa8a755cc33555d441865908fb4b8890222b11aca448d4d450225f2aa50f3f452e25f738198ab01db27a2958c1ccea4d3f0ff83009ea5f755d57334ba2cd214c9c226fbf7fe43860255f6212418c409033c06d35e3fa9bff22c5fe8390ff6b995f09bcca6c0e23d7f77c0d2828bde551644d64e437e8b83ee5c8e3276c88cef2ad1f20dde6ebba72b2620351b6fbec66a27c172115aa249de6341f85f32d83e24040bceef9fbd1e9da914f551171e5f7335b19dd22fa1c883fdf9e28d9aea8cb903ad1d9548f5eb38167023023e562da7e6cf6ee974af7caf41bf0b91b3e58970f268c9ae2b531683526e2af51cdd62c315bbb742e078ff7c5c6747cdf2834260ff783065dd1c76b3ece6b388c7e1b6cefc6e315ab6c08b1a66859342aca5c63a94da740b2deb89bba1faf0aa8d776e84da93c5c97862b4ac3ab72cd7216e5deba9b7237a96af7fbf0093f11579b29360b46153e63c5e9a8a30593e6627535bcea6ea623d2a65a659c75c99da2e4d9b2cd94872ae7c1f568dece3717ad97f1808e0ba55abea68d58d72d4db5d4f072395eea93eab2e199cd9a5b99a6708a76fad3ac17e0752e7f5b0a8a15af8a9f586bd2309497fe5a2993ab5b3ce7e1f7b03630527fba5da7301cdfd6722f9b47fdaec61bdae564bebc452f0a5f6b39373bf24bf37eaea21027dbec56b32fa8ccfea415658d8dd428fb10969096eaf95967a834e60fcda0d31e3bd3dab86fad0246b2fdeb5e65a2f57afa6676a32ca68f79e76ed5eff3ab4a014f9e6e53ab859bdf78b4e7540bdcc6fe4b6b79db34274facdf6e2abe571a96039a22ddd2a81b8ecb15c75ca0eea25d756f72981ba39b42be7dbdbac7eb55411f0466c52dae6aacf5d49d8f3a9b46f1e6fb75b1b819e30d7a302a396b51a2a3ab62b8dee8215b6babe153058d2ced76507d32212c41816e46a341cfee58b5fe9db39914dac370baa29b994b72934a78352ccf676cdc2bcefab3db62fb71763f658befc579aff6c447d3cdc0abe6efd69bb1ae342b0d776a95cd46d6ea4d865796b1acc1ee1f3d4467a961a5aa288d9b7cb3c3560f0d6d7c37f26715cd6a860377aaf7581bfbdd8756a548af2cd25a3eb92f8dce60a4d766039d36be7722f20e1f1e7bf7dd526bd2e95c24d50f8b222bae22594a981f529db02ca37af6fc8a928dc459d6a4849c54990c55f43f5c2b1ab9e46f36f9b05045d59f760ec767e4ad2d200d8ee59093630b5024b90ac73bddf7a55d9b3ae9437274fa4713cbddf1a1f90e7ed723f272e1d82034075cfafcb05f5a36d88e9631d17d1af56838793ca21e8f3339af1ab6036d0dceccc04289fdc2455e499eefebd00dcf4d7f8e5dfc18bb08d8b12f7f8b0efff13542a77030121cabc78644b29024deb12f39480a9e43452139e8fc488ea53f518764739f9ee88b0914d2ff0723ba021f01cc10512cd4792881ac6e0b08a3e0c9b1c3268e175ad0118b8516dc0c255dfc8370f11cfbf96af1bc93ba7cf69ef9e7f2efa4fe452e6a0fd227cd423abfcd1e5123bc2c00fe6c054916250698f8fa1cfb601b820fa730f932870b2d53f790e87c73ef8cfc3413833b624cfd07, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3536613437313263616536326338363565613463383937636632656561396366, 0x6d90316bc3301085ff4a31269240686887823d15ba74ec503a940e223adb975892733ee106e3ff5ed9a4ce5290e08977f7e9f1c6eae9f9b12afc64fa681d90413ff4e021b02c3c38b4139ed1d8014d1a810adda470648c4196faf49e80ae9ae0929040fbe8520f6a96fb889f74a9e6d2c00f4370f9695e3267a0c891af03e8b905fec8d4b7d0c46adf523301270a0fdce168f2889cede654e2b27e28b407b69558f360de143a61660ed5976829a661145a10b61d8fe27b51863b08f748ceb25533369b301bef70b86bf307dd43fce3d5cbcd2bcd2b3440044e2a437082236791b3781c41aa7ac967bd722bf2331779eb4c6d5e51ff02, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3562613935663733366634386664646430643333373566353865353265653831, 0x7d544d6f9c3010bdf75710b21220b1562bf5d25d7148a356aa2a35ad922a87d51ebc6600076313db94ac56f9ef1d7bd98592a417e48f37f3de9b196c561f3ebeffb40a9b9e084573d08437ad8006a48dc306724e7b5e73d2d21288069aefc3b4e824b35cc978913efcea40ef530d8f1dd790362aef042487f80c69fa74911cfe501d98ae6d95b6e6a7a00c2a25902a8bda71137119e48a758e9930a4b2f065d081576d67a364cd0b4c489892052f490978d3979f115a7fd5b4011325c901213d97b9ea8955ed45960d1b03a2480ee30d9a65d42924958622fb67b77e7e46964aa91af3a379ef1d492d6a891242f37cf4b718ce8f1e17061dd29d803bf7314eefc52bbe93c3298c14a868f0b79914638b3c936d9cac9f6721a4e9974c09415bc3910bf10dade17a3cc198999c6c96c25f9113e658de590811204b5b2587713c3ac36519470f8faef3c4635d0c36701c0c3438cb33c139332ffd1c4b60f72d6421ab80d53bf5146e5752d99848652a5e58ec21309ba0d513e0d61d5f0bceea63d2453c91e01b22550e265d28d5f11f6ef99f96bcd106a720baf4d5f67a97169e6c304ce4bc4998fd3cc3be40b75eb3d25742208557932ddec6c4d1863206c6d4b04772cc08c2c018f82ebac4a6778d5c2a09014d0327acc2dff2b46ea904e137ed52a852b9a5d79a0682ee40a4c1aeb356c9c875c067255d9be3bf76a794b0bcbdf2ecdf616fdcfc9ccb86d4d1066174e98eb6c3ac9cafdf1c934d343e213dcff1973551faf28cfc36a0bf3999f7fee055cc2d50cdaa296a9b901ceb306dfa441350564daf6e6e48c70997456720b61537c7393c17c27924f80c082e6b7334dbf459c8b1ebbac02e8727db726e79fe5460394ba5b97b9070ba350c21c8e4d8626fed1ed1c3f3997815e1fa2f, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3630346136613138653764633466646533316533333134383735336234356137, 0x6d54c152db3010bdf72b428641d24438a49d76daa89a1ce8a53d94299413e160ec7550b02523c94026937faf6449c10d1c08d2eedba7a7f55b99f9ecf3a76ff371f39cd52a2f4167a2696b68405a3c5e3f76a03759a1d4838031ad3a5958a1243ea6eb3f3e43353c7642036d54d9d540b678002955d1791adac9122a21a124dba75c8fdaba3360f8743999ae58c28f74fe8c0dd96ab09d9623c376fb4c09852aa11c643b7959151fcfbe7cc521777df9f35c35ad925eb4c934b4755e000e07513442849001e16bf9535e774eb5a8c22a134ee9cb4585d11811cef99917ece23c644d2d1ceb8c9ecec8fe8ce972399eaea82f18c6964b1f5c2e913b378aee39062a2aad9a5f5717bf9388082b94acc42a5b1b25173e9db5b9361041f348e2db1880fc387e1dbeeffc036c688fa3aaf501f37ac123ce071f23a61d05bc589025deee683cde61f2aeb6664fc112856b8becea7a5fed6a5be700c34f676ce74076d382aa468759ce91ec9a3bd02898a0cc37861f80a83d8c7009cfa31fb9054c98cd0cd87e6db3555c9189e721be215eda9bde19ab855c896a93fa77d507e28e8596e364d4d4c91b906f5ce59a4a28e22835c8d975d1b3ccdf01077a7a70990562a3742f34394866565dff3d8ff2c81ca17d759bdb7b5feaff0feafc76082b55930be9816135808680077f48210345a7c1a3c30ab9ec6db65642628408090e0bc3c50737767ff3388e2c78d037ccf0830e66a6ad85c58eddf9dfe3dc059d9bb86be2c29b67beddb14a69ec53829fd19a47a2ac06b9b2f74c7caf99984ce27b916b6b12e246dc26761ec965de000faa708fcdccbda82c2664a0f17f40b828f737759675b24e4edc8fb7b6e3f2a3d8cbdd4f68a020ec4e43fed0bbfcc8fb21e26e7cd1ed5bf42e4d7e80b11d3b182eeeda70ec5e8d463dc1f93b433c1cdf34e6bd118fd20c0ea3d4875ee7359e6db57f2fe2a6ca6be3766c47707cbfd387736a091bb37f, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3638616336323032303832636435386230643533636234353461366362373433, 0x5d4f416a03310cfcca227ad88031494b2f1b0a3994f6d2435b722b3928b1d6b891edad6c13ca92bff42d7d59bd217b29088d9034a351eaee6eef3bf027cd110d89767e60f214720b9e8cc3933b3acd186c414bda6046507d0987ec62686fd4e75b21f956425fc509291f4d615a8c93decc49941f2bad054aa04630cebabc150ca98fe2b7b867822e146605890614cc51fe8f4750d0c1ef4f055d0b05670556d07b94a7ba95a0fbd82918b808f27b35303520340fcdaad9b890c9924ca5a183f3c8cd4a2fd594ae79862554918bbd67896570c1be62ce2461f6d723f31e0fc797eb6b97331460775eac6bc0fa0f, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3861333237633838363131303933323739373636346633383062333063616338, 0xcd595b6fdb36147ef7afb055239236594b5a6018e42a7d480b34c0b67640873d147d6024da564d4b2a45c5cd64fff71d8aba9032e5c8490dac40db883c379eeb4726f37efbf5e5a5676cb62e495088a91b6d528237386696f1f55b8ee983bb416b7c931082d22cba23d87016791cb02889ada9f3f52f4ee250fc2d8f2876364998136c179644b2d9da45fd3966c97249f0bb4ac33468c53aa8a470a6215ea09cb04f25a593a47c35b38b7b44c732fd4d123390e1c05acc5014639a39ab2459df2042ee50b09e579c7ef5ff6e57ece7d1c29ac8425c7144bba098e5349eef8140d831f17d137f4f511c9a1717ed52c58b4d8545b5d9f7fd3c8615b029b48bce5e9c13a2e101d97ce7e262a2ae1f18a858cf68b45c625a99ecb726bf31eff022a1f85df9e96eb63389cdf4aadd2aa8b8bb6fcf6547fa4d2ce13003b5a305c3b44f79b9d9af5b44a98a9a9b1288ed1f49882f2e14e55166990c951c76c1dd296f82eb43cbbc1e07a89462da2ec1f192adca03d4d9e26b597e1a5f8f19e5666092e1c7e9d95d123e343c07713dd058ffecc609ebd0ba0149329c31381808b3a564f4d5cc83f5da3d519c3114b3f751a8aa7257b062a98184cffda87b2a3763496a319a6387ff63bb0be8021f7266d96e4a934d948114374c626cc9a240d2817fb4926ee36182c63d31b70e829e13d3deed0e961358b607c4974410a7e78529459437af3345e851b7660418ff4e7f40804a496f93edc018159af6ab7772a7a8678120169e7facb42bc94dc93ec1c707b21ef1f501fdc93ed64b38c1b7cf39a5ee78a3e67cdde658764eaa2d2216ea9757a6ddd138b44b1cf867b86bcf6cfd80ced463fcb0a8c21f15f544f1f23dcc430213732a6090a3e09f0ed6d9a2ac9e91a13365f83bbba92bd9a9f3e313ac3a62e8f21ffb200f2ed30806f6438acbf42251b0065853271698b6ce3ea22c632b9a433142d30bf19f6883390fa24bcc1c139936ec340bb68b18a396b9a278716c8763a6171258aa7b7d6bcc1a3fa4146719d883dded2a0a56c073f54afe7af5521550400fa6f81ecaecad68cc90ebb8ec6e1f6992a2251268058220558feccf8982d0e41d5f475e6955e8d4fa831d02feb3ccb6f1e190030215309551d7513a135978d9266b4324260ca951a58e3bea1156f65bb1d72fbfcf129959a415e7554ddb1fd8c653cf2ee49cf40f095c797fdee6ac8e54ca6835f1fdfaf4f5a041d54851c95ab4a7e586a8a8e4fccb924ff94636d66bcd81d31fb9c028126a2cecb5cddca9cbbeae7330c45dc4ddfb558bb79b7ea0ab6bb68a3217a3606549f8bc7b49eaeb14d07904346e6c12c3a76a50ce5d1e91f0ad8c7a7e871ee140d56da0758a959ab69250124c1711cdd82dc31b47b2e2161a5890437d6e0427dcd44aba7b44e6b2b5fed4e2a7820e1286dadcaca09b5c532162a824e386a9b49da631904d60a3f95e9bcff26267d488aec7e53675c7f38a8f24b85c6fb2a565ca55d68e785d31b44ba37e3582e898922a07edb912dd36c1ca54ace64d85713fc0825f284dc79b5c3a6d757a4aa57b3d092615cd7ecfe712a06a381540a3d09234d5a520ec981fcc49910f9a39c98b67aecf52f9be2a12603cb5ccd768cc27926fbc30ae5fff82aee14e5896bd6cbfed6e294a813603dbc7013fbd6f68bb2397c189b898fa3ac06752cacf7794ff8e023ec0ccb8fedc4a40e9097c5f5a3e38a298e51dbc3dae676af772ad563977a1aea29f921f0a848085b3c55c9a3e9d9ec2319eb200eda48fb46a094a8ff23575169590d234b95a8518c07888bf7f58880e550a97a365da006d2e751699aef9b32a690469435080f5a24ca75d165e87c6d66990caa6403d1dc5fc86a52c3423f2d4ce70b6c04a63c4ef1afbdc44e7583d2ddf8b6e79d84ce7f2e8e5a87e56aa87a4fe92db3c2e899924be24e821defb9a8dbebb711337816304bee948299da2ef7656dd3e3e258d11f5e1d4d8ea4a5df57aa5fc2cdeae6670830f743e65d42bf7c76ce58cdb0f3ec01a773602cee8d0aa91738fb6eaf0376b76653fd1b5a3f3fab6b9569df45af64834482402f003bd5fa33e599038102ce6155743245dd276bb49bdbcdb4904e6ecca54162044458f70c7bc2a6f640332408e5d8d0948741411cc48c44101897490a0accd96e57f5c9f4dd71af0aaa786faa47740f93dbe65e39ebe8de14606ee0ea3fb1e7f5742b8b781e8ba7a767f76a53f3f3ee72ef2fa76d4dc5d14110d2cf724fcabc87503448825a7f61233ebd276f86f9e9c427a5ee4884ebecd7a93ab3d9850e1fbb328b82c1508d6272ae0ff704729cf27cd1b48a70bf63dd9fc689fc15fb899f1c741cbdc46eb28454bec4a86dc3425015d0b8b08cfab6b0bff0064b4b7aadfb26e7018a17f40081f434e61045966789f4786be308b054910f368b45cb1f96c93fc3bcb334c67192638605e9cc4783edbe2bb75c4341b9bec70b1bbb01f57055e9e604618ed69118e4c461919c8261f603fd6cb38aaaa15fd185ba58ae005dbbb1d48edf4b00439cd12eaa54904d2e9bec683430d3b819cdb7d22f933b4e9bc769cbdf29ec809989303950ca3e4ea87533e4d87eec8bd9cca69f52400060a12656c96b107686725a9f1a52c59cd1390e119bc0b5084a9e12814a2df1adec810bf4b8fa801fdc498ff07, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3861363931636564376336343031666230353537356334343936363762623030, 0xa5586b7bda3816fede5f411a1ad94118c8b581b84cda4967fa6c6626dba4b3cf3e40bb8a2d40ad6fb5e5242cd0df3ee748b6b149c8763b1fc0f67bee171dc94eba8747272fbbcffd3bcb0b99cb634bf891c77d1e48e3b9cf5dc1eec41761a55278cfe9380d1c29c2c0a8d3cfff4c793ca331ff9a8a98533f74538f9b73a360f1ef68dd9c9334e1b544c6c291a477cbe21a2ab2e72210b25bb09a7344adba130612ecda46898232827ab41e842ea709f7b823c338e91577f68058fe5df3267467cd28163e8b67841610dc6ec36da6b929f9bd04485146bd71181bc26e53cf2eb4591e0f2672da13a75e4f341ae65cd9b5eb46c1311023b327c6862264ece63ce6328d839a06c7224ea461f696cb0cae84d75b1a26d068cceed218e41d1059e5027265cee1cfbe82a40513f5dccbd468de0fefdfbd09fd280cb04448b6621e79cce1466bab35a1e4c55e879430a2b1e332363434f8b2029a1a3ca980bb1a3c2b83df14767c4e300c9e382ce2efdcef0b4165a21c3952579a6ba8f913314bc65eec9f21d82d3bf002114b99c7eefcb0218d4fd92c6bdb6b6766cb565f23d6ab60078aefa70ab6778058bd8a7510dbaa622a8add2af61231a38a9d206656b13788d12af616b156053b3e47ec1b79347b90ab67132e2157ab2c456cc27f673ea7118b999fe8d52685f4f8db984d70065c49164b0a99a35fd57a1f67b84d08558cb69c453c1cd77255b66d9344d59df473ac0bc3059a7f2c2616786090bbc9654601b71e9ab3156489c0e5f77f8c0db24dd4827bc8b865dbcd8e392f7cd272892720f287dc8d4e66acc2d7a60f392157602fcf890adcae5bea39471587a2c0f08a3dadb2af3a0d3bf2ca89450423a041fada246914b4a25bb58fc0b3431a4a55f731f98cd65b722fe1cad6836c9ec552381ebf64725aaa3da97708dd68554790a7ae9863a0bf6143c6b5bbf9da2ef8402a5f54b197ad3eedeb23cb1f7e8b055165245840c4a03b3450acce07d1687dd8b018716d2588fbd313721740aecafe0f133a5f0d58440db0d02056348d080c6dca5cf7cdd5d52a22dc35f4da48ecd53e095c5772e6f16b36d11cf98c4bac64cab95c2ce00619aeb227c817d8bfc406fa9379292faf43c07095997308176b6cdb29a4692c02eeea06f3428721af358df9b8b74467626e07fcaef69e4fceef23837c1c7cdc1eed0e76fa23f2ac016e6a3caba13601c1dac6e0e30ef0c184a1be1d738bdf73074daa35e617e975f983bdc61f7446a59da1a177863631575d11a41eb645bed575f119d37919c6d074f242045f4a516b906244143348854b65187a524494390e4f922f7c4603a0e0b6aa2b501792fbb4ee81265acf35d4530fbd67f124c52ecd77f1d3fd221ced981283cd9c9cb257b0529894b141d03c514e98167a911513278ef6050e012897b1abe543723f21f4dc0bd40b0b277bd26784ec21f307aada5ef728f5ec820bcaed1a24f5c035fed5686b15a9579156021040eabd22551b5ada15b75d75fe002515b99c8d45110746d093af92871ab403305babdccb47fca946936b8ab91fdef2371e4b1283703f92b3ac03d67c9eb22463ba55a7ab6b7693403fcd55956d9df6bb9841779f7ae2d56912b1e0d5692bbb00028e42636373ae6ef2a81e57b126a5a6a070338b5989854ba01535ade8c36a1714305975aa16f8bea601c6555f971e2cfcbb862d75b1c836d69c52da58cd790e3eb3b11eaa6e85bad5dcdc2ab47eceb6aa4259315d2aaeececac1cd145862db6b358e4e0a03dca32f73b3c010dac03663eaeb81a64a1f886c3b99b1b2ae145b1208abcd5325ca72f8d5c26f9b5cedb99caf43ff82c318a61abd8c107983ab7cc13c87dee33513ae4e093cc07783c760ef7f7f6ced4b881874e7bffe0c29dc249954ea5ef1d2a59989cfc3e52f350cb62eec95aaf9735d98435ffdb6e9e6c6dd75fec0cc96e63386cb6ecfec74fff992f96df48af622867061ed25b375a9de8a44106a451b6d420c3a1356a00e1a782b852dd208a64f4bbc0f518d1dc05721d8e9282e419cc63b47c269da9b1ee900955c680f1fc28927797b70767ae1b43195609661aa0ccf3c2bbd7b0517d512d9df56f46dd2ab76f96c83183daebbdec06c5ec9586be0ea205fffb8376736fb41874f646fde1d035cd3e1c67097d7ffee9dde5a7d7ffbe3eb79177ef10d80e478b3db81c8ce0ef64b4e8a88bbe6ff7d555ff9bb9f8d9cf3f2b69d258a9532936e7fbcb3298b75b168d95701643b6d6aa55286da87830d5a6a94ea979f68e7e2c7bcf7e3c7d1dccc84b958c4e968b410733b19ecb3f8f4ae9205db87417f8877d066267cdb7ac391ecd3bf40032035e74e8f1d284bbc5e30c4f89b6e9d152517f40f6585dd481f23b8aa1837a508e2287324e218595f837f8d3ed6f4ec4d192fc1f0db2c1a79d9d35d956b7dbda4cb276916c979aebbb5aabfc4e5c59cf8f712f162bbea327f860d6f7d4c17862b93c8a391c55b981a294e01bc22f5ce230cfde46f44b28251f609302a112561341223973f1cd7e833ab9b6135cc2b14ddc135ab7c6c1a6cd02b5af0918a6b6aff7458be5d40b76c37fc40d3d2b096d0d07862363af69f68d30c222e01df3245e92a918ab1b3892e3c53287a37a8b3efb5b9e6c889994bed5e1ae9ba8a1b255ba7743471d962d65f82afbbc7506935e7ff34ae098b991c72083e2d833522f007a1bcf05c9b6137aa91f34e1cda1c6680dbfc14d2190fc1e0e70101d3e444d882ac45b1144a9a4350f03a7b59b54ca30c037b9d571260b456585050ecec7ba5972378b0ece0eeae689c3c3f2ef95ff73f21b08b0092fa5d9d788cef3fa9bc8629191d549a2fca4f6d6ea345a4dff8c0d877f78f319920fd32617551f2412feebf56f1785edde121c0e4229c6b31ca37396caf057e1f2ee569b4a36e9128f4f983323cbe20ca5cd162b522b584b83fa6e8b7fbda5a13e0bff0b1676f61518eb6ff69ef7fe02, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3937616338343335383439313937343361373062393066303235613235626537, 0xcd5beb939b4612ffbe7f8576b3b5801711c9791a825d293baea4ee52be4b5cc987adfd8060241123506058ed1eabfffdbae7013323405a9f53b94d9505f3e8eee9fe4d3f6648e5cf9f7ff3e21bff62b3f3b2224a48e9a59b6d463624a7f6c51f7fd6a47cf0aa7ab522154d8bbcba7097751ee3a37de9fef16fec764bf2679d96c4dd14499d11a7b1bb214e731795937554bddbe5e1bbc51f24a61e7ffb57596c49491f824b957cd8c4511e93cc6f49c4454ec93d759a74299fbd24a29147d30d297f7a731e86799d654e1367242adf436351d3de914eb0071a975e5abd35887bf0bb4c571ee7ed00adbe76f8c9329df2253e2e8a7b20bd77d769427ae4d627e05b94e6a0e6659a27b6a52e7e5a92aacee834aecb12d46f395e4936c51d799d4555655b632383212e28940de281912a5a94c705142bf2ee2263addb92dcbdc70940acde42d3212d372159f44012a7913d934df4b0206f098dd736c702d00d87393a6e1cc56ba28f604dbce3c794066044fab025c5726298894be52dc812161a86a125a5b00e2caa0d1d372cb003c9bc8ce42bba06aa33a7d120cb552cb519f4ea2cb4ac604fb28a4c3835006defb8c7c7f32143a68000ff2eadd245462cc7b05acb076807ca4669f10baabbba3ae33b4f2c972915c63b6c6b5de7643779033ab19d29ebba81ae5bb6752a1a6db6dff591fc39baff7e458610a4e84803afe52a0c9476e7a865a32525e54986652347ecaa8ab02134c24eb0b5c458783ee3f66a00d1849249371c763a88792e475e5df54bbc44c88f8bca868cc908ec3a6fab28ca6d256e54d7a962b2cad298d833d760b989ee7f297695e92e8e5becef3293629b015803e9d636a1aa0fbf4f63be7c705b64fb0af4f7e8c78774b6dfebfbbeda9238edbc240cd0fb79d4e8ba6101ad7fec8b4f6145a88c5f9ddb34c561241c814ed5bba2e86742a6fef0d96f343105624d9e1c984d11a925c9fdf8a5986738f3d1f826a628e1aa57060e08c9c0edc7aa8816adeeddb9238c0704eb9e40e76e45c681fbaa267c1560fad7bffeea5ef2782a7f2b179847f9dba2fc3d4d2898609d6609c8c6df5297dc6ff92360833f2083a0daa56809c9079159118b6d73cb67cf1c12e2456a83bf71cee2856f0ff10242add01afc0d784779f2b62c36d0a069f14632be0dd90a834549a20f01e7a56ce663d38c440b62550d5601732270cd2c4cb7c7c95192c377083ad5bad801a0b971c286165b43664fe8c42b964b8028308631d743636a70323f9274b58681eea2a0b4d8f85654d3c2727768bd41e23891d917e6ad1901316f6f02b8b34ad86d94ae91838d93e580498a983ff0c6d790c591125bbba73769195edaf0506332ee9dc9a71f7876ee783166850964de62b7ba42f0b07f3d3d89c1b6a8529c8b32fe932cc14d280bb1326851f216c89cf3efcb327a5016e6def051ae55a27ae0177c6a89bfb093e15fa6ad5b0700319debc4590ff3ea4a6b28da19cea419101d108e20bb8fd70251533e670a8bc75c48a170ea248140c524619fd9036927c5128eb7139d20a442e0a53df3befdea999ca1cb25f4a2b1e5a60e0fb08c1abd56087ffe3c6881114af2d008ec7f8ee8da8b1695ad529cb6a39def40a6f9ec59d7302294d2a1527bd94e7e258cec4b64ecf787f6e324353602cbd059d2cc3aa022f1a5d341fc8c5261b37d412cd89784d6653ee926047b13edca7e747a3683ce9f91771aee83984906b6956e37e1b43c26568b72a65f9594e8d0065fdad6a2481eacb316605353c47ea89ce0be30b71d70b6e845b81c4e20e3df60509791b0b770adac8e8247365bfa007b44c64a700001145b761ace82d4ac26d440c14348905e5f3b0d8e31d5ae8cbd496f2543d4de77497af712aae62849064b66eca6b4b421de66969b3ac2512003cb4cb5744e8eb729ea8a15e46a2ea469aa826a21a624f93da5eb9f71341612661c5cad33168b645e7269d3755a813bcf8a0a46f5ab76d2d3081e7f1901b2c0b8b0aaed16b6ccfbc2961618c9d3f988fe8c6f6ca848cc44b234aa2d253363e017933c6cb345c7e1166c95f353bead211ac9596d3b16b983c7125ad216cab9bb32dafe9403780120380011d2c218325135b70b35123cc0ca1889d16c511519ec2aa0a0050963168a97d30ab6679d23771e2934462fcf5af1388dab2bbd5f6e1be602b96cda806b7b688b4adf61307002e9ac398323d39d46e6b6e6fe83f61fb8a78c625a94cffad3411922c7d9b0f0b54973fb20a366f2ee950c56946123d92b2716dddb73b7a53b9fcd44baefa8e9302ba24e213553483defa7a59c849c261ca711e86b5355fab1649824b2b8a8179b94becb5f6769fc41b499d99e68d637dd08f3f373b5ae60279e62e661b1257c042f64de8bc33496054b1ff994c2f1e0b8138f6004be57843e3e4aa2f866cf1ca859ba5e7867f9a40814e0eed067f01cb39db78eaa9e98d116ac4e23668f0a7dd627b50f64a9927032322d5f1485fb877321a008805757d2f7f54a262340275947322a99fbe98f232f27cfc07d71b6c3aa8621e44f501c73d22d65b5ba3b28044fabfcbd35dd40a10806b2acd3943a7484a0e9f3c958ea0da8ada9e04f66a51d6a72cc1174d4a80af9b4922cd3b21240d76081bc2056fcbd9aef8732eae76f803267fb54289fbadf2fed9b5b2730d0e09dfd3f1963df2eeaf4eb22b18eb14c59198d9a333c791f2e1f1f45536a5a4cd1ab9e0d8b5ba9f18321f588497050b27667e8343b5e47f98a5d7ef5f75328bb569816f2814c97ee07f200beb1aaba8846642a8b7d7a08737751f51bbf9219349e7e6fe3a2e305a5be21cb084d7e3e97a7868c38c6e3c997331fb4db913e3c49332b08ee9a5c5a624270ac2099cb8c5c23cacddb5294758529ee4cc937265f7cfb644159e43d5d50837dc74a15e3f937fed851e311c0e9dd67e6a1fda9d03949d2f917fef0b84f92178d29a23f703d3e8edbc134aaa9a04340b7ceb2e536e60f8ede4b702a46957a583aeac379a5daeed35e2be2a9244362d3b30611e38e95d0270aa78dfe04b2714c25bccd1fddc97caf89941d24d3e94179e9e92d7864e3c11ed9e2071ad12ae2c71cc814c0b5ccb58f358c2b217e04f71bd6086e54aeaa10fe6127a65520cf38089428e64d92e25ee5760be578718cab40478cb0d413bc50b9a268f11cb61f8688f7e68c5bc36fd8958caf88b177cdcf4eb04d5ea6357b51cee093f8f4019ec4399b2f6455ef48fd9b5b5714acfe7cc63f8bf0a180e4d7cefef9dc55aa46ffeb19fcb95ac586438caad0ffc2ed4e28e5fd855ebbc12c30135a19d52f36f9cb99bac9b0e366768b882dd8e73880573c9603e54fd25c761f6c7a79ab662bc672c5e01b78be9559e1a49755050e335ff1ada18a363fce4850e1bf733d176be1266c8d0988daa6dc5ba91db6a009ebd5f7e9ab768259048b196c997ba3f4d119693d8db8daf5513a571e55f1370e05c091480e7ee159ad3f73d939e39b6297bf437041fee94ab7d061cd74d368faa1c316f56c54dc19555b3c0081c4a1c8c9d089a9250f15ed13cf567106933d01d9956b30e39054591e48463c0aca25f4a3ce3ff1e09391abb7671a437643dda6f0ff130ff7b2a06b50e2d01a8291c561edc06fb294c30848fa39c9f6708283936ddc731076b74ee3358c9a3f3e122fcae83fc8033ec5b4ccc463b54e97b219bf6880c783d4bae7a0591ccaf090f051a1ed785c334f87cdcfa9fabf2818bd2b76678339fcb288eb0ac393733a58bb22ec93835529cb5a601ee2527e39f1047a9f02843243fa8b51f87109dd09d9dcd9f817217f21b6fa6e7e4ca07ce4d5cfe90868af7ad4bb1e71650835b0cc98f8ed16660771811ff252026ebe582e01ee10a7c7c12e8b5f284284fd8381fed7459dd37086ba918da79065d3aeaf0dbdb414ba527b60be23181abbca3c8b34e5ecf91ce5493c81e922ab4b1554264b65cb297997dc52a7d7a76679b5c77bada3c9b0ab8e1737e14ac6a37ec2f34a6997e9440049a3cd3fe6c67b17b7b98034e1c2bf39bb50656b00ffe5322b763e2c20217920ef137c792f16e0973ab3002fa5e1877f5b330b16459990d2c75423f8cf148a58720f49f18b17c116fc33a4853064037b20cdfde97c7b3f99e17ffbbe4dd0b40c4b48a8697a07c575147f589560e404749141920ca80539a020aee0655ba4f8dd829400844c9309f2f82c627f8712c88729ae64fa7c7b1f885c898bdf8ef79e7f453613fe1364a0d7a9f83e68ce9af67de945f3c985ed63d370d28b0c9875abd24544a1bba5cce6dd521044d3089c54eeb3af1926a6cda7c5948d69db4996a5db2aad82c9403b5b2498308a092811ef43fbc4966718874afaeccbd75fbdf8feeb4051592f3a2632684cb3684132a18755193d98ab3a329dfd3f0f9a1a97b0bba6157dc8889f52a0133f91e21ab572b8b22acda07d4c1bc69adc9386aaf20b75b591a7614bd971202c8a2cd95fdc82cbb808fe0b, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3939643336316433303331376531666538653534336166383865313835633633, 0x2bb63232b0522a4a2d292dca53542ccfcc4bc92fd7f3cb4f49b556b20600, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a3963323138613962316165346430663232623834313130346365393638646161, 0x2bb63235b0522a4a2d292dca5354d428cfcc4bc92fd7f30af6f7535303917ac525459979e9996995507e41625171aaa6b5923500, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6131653834613237316235343032323730363862323439623561656235633363, 0x7554516fdb20107edfafc8a22806c5226ddf16e687aab3b4872ed3b6489bd46e13b52f091dc614f0d2c8f57f1fe0d875d2f5c1d6c17d777c7c7787599c5fbcbb588c8b1d1125cb41135e280105488bc6f70f15e83dd9f2cd56b8cfaee0d18ee3752533cb4b8926f1fd170f88353c545c435c94792500d768002976b89e1ca7486aa304b79732ffd86d2ffa0859e6102b6671fd97e911f7e6a5d66c9f38838438148d224cd7a5463c39a3fc7d872002e4c66e299fcd70cdd7a8dbbfe13f0fae2449ce709d95d27259016d4e78112e25e89e534fa5cb8269a3c1565a8ebc8736f131fef53b14cc66db589526368ac9e02d789e0bb8e3f66065a294401d6bef25feb7da2b7084977ebd4a7fac7e2f3f7f48711d7225019533cb48582309bbd157d8a48f0a45e8d7d3edadc1d1ccd5b4dd236032a6c02b82e3884718fb934224ae1dad2498eefa393cce827d73de69463bca495e6695ef0b92696016d24397441ee00ad2e1482698314b564012f5f246b4bf70cb3d54d28b8edcf9f8d93b74b882b71c3a7f102979c686b51708595dc18002530a647eb5e5224783d0e1398a69c73ea8ab410996410b7f592157f6068481d16bd549afd34fe9b22dd074da6ae07379a7994edfce91c93457f6c9d8bd1b8f3927164cdb5ec4b28d970a3bd8d106b1e575b9037dc50c20ec4e6a65eed277121fca3fbfbdeba59e638cebe7e938a1f3a62beb6cc65f0ce6ff066010eb462074b5d3a369e884ace5c95cf70310587db39acb0dae0f3363b7dc10608e6d0f6be76302229920efc6d4d9a1ad517494398aeb52f30d974cf8e5c2c3acef11dcb898934bbc785c42ee78c889bab08636e8f07e159073f69dffe13878c6f41f, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6132306532373933653933323135313764633465646633633039626333356136, 0x2bb63237b5522a4a2d292dcad3482bcd4b2ec9cccfd3d0ac562f2d4e55282e29ca4c2e51b786482b96646416aba9292aba4195e91514e597e4975416a4ea2565e6a558d76a686a5a2b590300, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6164313464393362316636336135376339653730326436663862316437316234, 0xb5596d6fdb3610feee5f2107ed242daaeab67b01a26ad8970d18b0615d3ba01f32af506cdae62a4b1a49590d52fff7dd919448c954ac2cdb97c0e11dc9e79e7be191e257df2e5e7e7375b16fe2bcccd684c5745fe5644f0a115cecc99a660dfd48e39cdef0b8ca6b96e5acce4995314ed845b4a98b95a065113c89fefaad26ec3662e4ef9a3212edcb35e8857741a7b26fc2bbf61f4f2df51654dec8a5025c352aeafd0d61e19d5f73e271c1e84af8094a52fc13f32aa722f0bff7c3ebc53266a4cab315099efff907fff279e4fba1198291277228a19b602e27e7a4d88a5d78c788a859e1095693e478c89857953c5d4465455856ac23f2a9628473c008a6e499503f789d8ba8d9514178051ba4fbec23794bb6e493468f182e9f87d121cb6ba7748dd20fc507297b0796155b2df40b1f24d425a128d9b8241b94089744a0e4e0921c50d2b8248d44c09d10b89215a57337ca3d9018154eb74e1be729ea406864b94b2ca510312e190ca314dcb3829874693c45f908c0169d131595d43754ecdc7225411d088d2d71a9c4318a57e57e9fb9c4114a4be612950c6510722e210c43ec76d9b22637f53608ef8eea873fcc1e3fb2d3c7cc5bed4a0ae9a0b2f5dd6d21b24fb32e03bac40cef300da80ef36453b280a68b84beb6e7e9fc49e8e525ae809aa92dbfa6cb40669b92cdd3b4a8f3bcdb4caf7d3ceaff51981c936307954370906200b645a6c6de121e958c6e6991e56f2069217135e6f47a390576b78c1bb911b7e0b134583b263df06aebb8aaf9ce4c0d93e3c0e2cec2e257f64bc9485044d5980f46ad530cacd30a904219ca354d6b8be60198759858738e9d633421af8bb3d6f5acb0ec388956aec0c3c2296ff976dba7ed913b202259d4eb1ba8f4019a0b7343e09e7701c61318be4c61fc1c20bbdc32fc3d46f13e13ab1db878b077184b819e8be05ac541202b76242cad816751df6a23e8e1a47d16a0e6db19d36da473dc7bf6ccdb64e0eab5477de5ff9fe04c56391ebd58846132a044af3373e826d6a255c6392eeaf93abe4e1632213b405c4c455cc0e26d3572a394207f8496e30ccc6202cccd00e6662acccd59981adca50f75beed3fe0e7f58be5e7cf0b07dccd04b86200574c852b1e01d7f4460bd519b9f18b09f80f03fc87a9f80f8fc1af52cc8dfa3001753340dd4c45ddfc97acdf6b46336e866e4f537da25f17118d669b484487a8598689e95a3b0de89bdaa67669b50430dc27a23b78afdb16d8f4b951bb986cce4c13b60c6d25d9f42ea79129bbb9fe4973ca837fd99530b52054522c0f973e88f4c8cba5fc6fa8f8d5b2571addeb3c75cfb20b5f29c658b20c974de744c365237acf110bc1621f157c6c7beb7ee2f21374f1679c3377606c8f04ee5d198617c8709a9e27b9d307f3c798751c6a7cc88765fd3dfc9f25009dd2bb8f3c8610586448c9fc2194cc1f4689234a667650c245c6b4ebf24e92532ea28924d9a4d8e372a59f61a189b428204e5e3a1bc18a0e5fda8d5a5dba11f77af4b60f9784752ad0a323698e0053196dbabd2ce7c45c33d42ddf998d1ff0663712801d216341d8869b546c432a6a3bfc8562f477d82b8461351b97c37b8aeb8ad4c9cdcf785516abcc32d3720dd40a1c983451a90e8a0deab968e9ecbe9f19346c8c197d173e1353a7a56f040c6e753f982e1f32c6b25bb8436c201fe876e7c80ae9a7f632ffa04220a7000eb9077a11b71989c544ee7e227ca9842a01703ae4402a5555e0cfe4daea06478dc3e4e8283da3d49842a11fafac6a4193fbea8509624892d05d63a17ce8c79c7e6d7d6821c12ad2d60c57c1f8fa7f2f18bd3401a4eac1a82b203d716ac4a7ee0053bc516fa887a4d621c3bafd2fddd13e5c3dc601ed0b979b7b58c1b0f65deaa259b3f9c51746f1b54befc479cf5ea899e71cf1503f288b4e5cd1bee576ed31e5913a04227928e21361a4e6dadd32b4c383e731cb4bddfbb0f111e8ebaa6fe897213a37757c3638abac086f8d1c06f8dc984f970f3debd45ba23b3035de29bd2ebe54f6424d5b3f31d2f44e56b6f78e8057ce23a09d3406bf6453d197ac075e5d8aa6e0565b58bdceabe534ec6ae2287438a5d7d4f1fc6ae1c7bb98092db5de20b226c48e337454ac1c87dd6a77eae8d0d2902cac8ebb8ed8b1b2f10ad2783f3006787cf90ce711fcc7cb047e5f9193b16b2e792c4af57818e0750ef07bf81227f9c5ef45f2a512d4c023bdaf369adff7192b60ee95876fdfd8c5a91bde1ae8c4af5682e4b7b1a79e013d2ecaaac220127af1f6b96f11e1839f7bf7c1b51bbf8a992f5fe6c13d1d0e24ea7b570c95bb6482a7b313856318c8cf69efe9473cdec3e422f907, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6165313131613462363637373534323433616561666661623837626532333434, 0x8d4fcb6ac33010fc15637ab08810815228517508fd80d2b3f141b1d7c91a596a56ab94d4f8df6bd3d829f4d2dbeebc9889bbc7e7a75dde7f2a176c03a4b0ff70d083e722efce09e8aa8ec07b668ab96c93af19832f1e64f73e7392e09c9040f6a1490ec4b028b20884d6e117bc06cf145c2ceadb21868ba50c6563d99a61940ebc5938353d473ee936508166abf16502346e366298e5e5a22bb152def65099dfc8c5ba047a24e0443e9b0d7afce9a95abfce30eb0a31dca47fcbf20963b9ad949d1c78480c51e851dfc356c7dba1839aff9d7937ee89ecb51073ac1e85cef537, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6166636163633863396566653934616564656363356163643739363839643330, 0x9556db8edb36107dcf57c882604a35c3c401d2027695450bec53d3360916ed83e3075a1ad9dcd52d2415db50fcef1d5d28cb2b79770b18b6c5199e3317ce11d5e2dd2ff3b70b3bd9b338e3214826923c860452eddaf7df0a9047c6830094fa038e1ff906629b46451a6891a5ae43ef3f571e54c2b74248a04916163178a5db7349f65ef99d4b2be0c10ec2df0cd69f5928220152d142c11d28fd4942240efe644ee38a866f62f0c9a6d03a4ba925d2bcd0d4d270d05c02a7d6031cb780860434486a6585ae1d72996d2512504b410c81264b1389b5053d24770bee95227227059f4eaf45e895127421d3ab292c4f5582c81d090cda61412cb07eac5da838281f6cf25784c79aac9748df7ab29427e0fb3ec972909c4ca766fd3bfa630e7f15c906e4aff3f75e398aa77622d284125001e29e2056608da0073b9925407efc18a71d05ef40f298eb289349e59ff080dcac48a0658cac595ed599ac174d62b40d67ed0d2331201304d98bb497a90945f1884bd133c4fc884dfea729c487f7ef7ebe52833698a6b41df16434fe27a9bde97450b9d674aedce36a0c6bfa90a5d5146592784f45dc8b75c01ae16845d961045c04b0078e47bd8af6d161f91dd73f9039b6f3d5d5c3d7f568796a86c02baf9d717f08b23cb57331661a9dbb5a405c68f4a519bcf6e12c3266da086983eacbc3743af0af31bb111d379b48dd0bb01ba2f13f598c2b83c7ee3391bae435366e86dfb301742fc9220fb986bb2c8bb5c8ff4e6f5b056db7502d740cb726ed4a2cb894fce8bb28bb89daba649fc9f0b5829c4baeaba33233868de4c1036885413095c742bbc4c19ea2e26ee190fb29ecad2fb0bd3de4aec3129ebb352e6a2e6b56194a01cfc1e4c27eba416ce2204016877755547e3f36563f50c9f78dcd38310978d203701b5a4a1000a91b27e34d2f6bee5f6f7c257913836d5a5777fb71570dc9cc7f79a51ec5e1d5c0860d15c7607ae530f5ceb83c5d69eef9f4566d1421754c939dfabdd5fe7cc2d754aa97cf9c8bae2006c4772e8a649699506ef756441d11a1df59c2ae39afded86fb6947cfd6a937ab708bdb289066149fd678562e5db6426c219b1d78d5be3c26248b77a87aa32f7ca67c26e76acde56d27eeae7eb7701e7f5b36a69fb448de7ffa76bf6b5a427874529bbd8d79d35e577b78f4e16f44e2806286d6ecf76d9d7ca05a1f1b37c0a9c8daa853fbafa72a02b13f37280f6f6d4655749799bfbd58bcf59e02a7d7b2e6f05ba924e4480330d5ef8708e2e6f70d51a829ddcf672984028f8bfe24178585b5ae2c736b36a2fec95335fdbd4be1c6b5cb76c6c85bdfc0f, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6235613361356462313265316266643965326162386165383733336336333930, 0xc5586d6fdb3610fe9e5fa10699292db2daaed88759108a62ed5eb001edd60c1b90050323d136635954492a4ee6e8bfef8ea4244a8edb1518b02f36753c1e8fcfbd926af1f58b17df2c4eb7bba414b46032e1dbba645b56e9f074cb0a4e777cc3135af3d378d954b9e6a20acfe29b5f1a26ef63c93e345cb2782b8aa664d13eec59b6bbf82cdadf5219146c499b52bfad91aeb27d4d25dd32cda45aeca9615e900f288dc44b21b7542fc88d121569637a43ef16fb46960bd0aed1bc4c5097f7b9e4b50e09a844a258f32d138d5ebc78f6e5f367cf9ec505d5f4e2be669d9036aea5d872c560e736edd40bb6b4fe99ad687e7f2136ac0aad1e56df5cc9e5abdc2a7b4900014d6252b01254860148d32c47d256dc22e1ba14f906fe9baa1bb12de525fc03904222a7b0472757295f866709af5e4949efdda6b1b75ff424cbe6cfa33d1c574b9a6f4202a382d592e5d4ec0e67d6a8f05fe4dca99c1ac3ad921d9555487e532c10cb40af5970dab19c93d3c02c0ab80a7a61451220f329ee7e1af04a69468b8444a964ba9115413a495bfb15584969db617939366a82964ac0505708f259c268be0ed1660afcc9ecad9215d36134b8d086ddc7b7b46cc0693e29f41298afb2b3e4355b322959114689644a94b72cb422122722dcd36b807cd1ef12eddb364a5b83d2ab9a67fd843349b47783ccfd3f3cc001c04ac2d3613613138dc04c4d05daf28a15bd887e367baf25af56e1940e8a74a42106e058ec4eb3aa08f76d3c0160e08a0f1746a92fff636270be1770825f51aad75c258eaf3fbca5624c3305d4cbabb475c021c05a6888abec106267efd1e2c1d01c80ba8b1d3dda03b6fdd80d1223310478d0563138ca20dd8300157fdb99cdfbc8bcb1319ff79d1895c9f76f2e8873ecc0a8892cc764830ab550ffb90eefdebeff4c2524c4aac89952ef868cf98852366b4188a4903e31ae209a037fda261d6593ce3061a22a8af6134a36f94e6e0487ccf200a9a1054953ee2c5bd252b18787c3092f446cfa0c263c607097e43f89351ed12492ce937e346e05f930432c71d0658751a288efd632c65c83a5e535d486f448e88d02c28f3c3fe27c8b1f5f6ce26d64cc116e3621467bf3974de9e901548ede9a4d1e730adf1770ab9303e7cb9cfbcd663b0847b14bbe7368cc663e6f2e2a3891be704bb6701a0eb2f553046f8e959544fb0ec8ac62bba09303c17bc4f93a76e8206a440b6d31f541e3580e95293f317412dbe9b4f5f5458db2deb0fe8cc3c8e8f9e4797aec9030d532f0defd81d433eb0253689d9253f6f38cccac39c939ab7251b0df7efdf15b01f5bfc23eeaa8ee5302a4cfbaa4390b9ffe993c5dc5e48bafde10b3ef675bc979d1917510781017704893827c574d96d0bb0c5d1c468f063f7fafa96e54ccee7256db4ec90b38d0fa065aa290acb5ae49bc87458bf1c2c5633216fdc894e8a400b0869da1c0c3c1fccd6f3efcf1c3afae80e09c9f611e1e7a5ad594a5f749c8e3ba8acdfcbad173b6ad35349ee4ed4f012c017b414f04f4c0d0032b2508f335cb37c10f1717ef8235c32659bd8c48ec54b47a59470a7aed12d84e48d7518243643e3931144fff97d03e6e2ab1abc8e2802f7d44fd139ce81478448fc9916daf34e16bb1d71b726936aadf49c9aa955e8f3b82a46ed41a7d224ae127a1e58edeabd0eb0460d79ef9d2177e65cc92b65d7b19f8fa4d9a37231a47edd41bcda10ba68168cbda93d001695d6f367393fd2019fc07b98c581299061b9a66d35e43771318b0170189473bb87e049b81dfb95e9b9bc250a94c506330d974f648bdea8a937766ec82ed8d63ba3ca10a9a651d25d0bb57e1781757a35d25c86c3df084a286e1235a5859887c3cc2d060d721774d0b9b62adf9e073a260948e76ef7df67f3b16ba51eb3552a96df14de73835126ae254e86cf2ceba5b772ffc5e8aa68e8bd414cac9b550dbe37b8c597f5939acf9e6ae921699cf3f9bf95f9728f09c18e1f636f8a430b03b9d6c0ce24da9bb199f745763284274618ba1826a88375cef700bfb072814d9206e023ac4bf8d1a182446acbb9b39b5ac1b5c615f6eb09d5cb86cde344c7390aee08a6372e0608c8fcb050379a9a26b738ea333b6f0344b78a774c9c2c0e9cbeb6f96ffce7278756d8feb9315fd396114777132f635eb649fe730c71d0fdbc6d1793e0d1a74d4dd95cd24357cc298943af762828f1a4d5d72f7b2d08fe754e66b6e9e362ac1b774c578b514f8c051e30351c115bd2e5961a6edb30fbe85344a5f330c583303e0d01c1bb0f90a7554c8613dc6d6a0e1db8437be95547093e7c57cc94b3687a61048b9a8ef0ff6b41b41ee5eb18257e6b1054e6596c18759ad85989754ae3a02023438ec40baa65565644e28731c3b7205cd1f0a546bfb92c3cb12ac54cebb3920dd32c997881cf8c0dc600ec4b5101be396660357dbfb590e8d98ac408c239c10015276921b4bf4091954603a5fe35edd4a33bee3505ee76a4d2132e7d0f45df3a230ec0e44cd7569cda73da068a38579a1b216ea474a53b5c63a3b7c75bbd98fc21c56e8a580d4df516b0aee6cb7eb65009bd2425283bc21fdcda4b08d444719eb64483b29aa15c0c3e4c0a41a7b6ef484abcea1f1890b6c882eed7baec5037d3f34ef95bff30d77ef9391290ca7e93f, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6237313236373239323636663461383038393161626137303030333566396665, 0x95544d73d33010bdf32b924ca696a9c693504e161a0e942b94818103d3831baf5d35b66464a969c6f57f672dd96eecc00c9c24edaede7bda0fd5f1f6cddb4dbc2a0f51a192147424caaa8012a421ab1252911cc45e443ba5f6025634b372678492644d1fbe58d047aae197151a68a9525b40d89031a43cd075d804b686456db4d89980218b47e24d0d261e43f770a48f496181aaaa33d461f398e8c54ec94ce434852cb185f9ec5d344d0c30efe20eb0db453918f23338e41f1cfe8d864c3c0574345cab3211f2c4709398fb93e3c7a74ae8a423086e433665e44de5e0e29e6a4a4253073d777a425a21cdd93db4d11a765643bcdcb64c64641d9963056478fd92f340dd3d00e62c6ca66222e89442cdfb58d6af7c1ac65a286a6806e71aaf19902999e57220642d8a503306ceadc4782121bdb898bde1255fa8758322b1285cc261718d1b8219c425c21a7f1325904fb6bc034d3a5b7849fe8af47abbd96cc290cd75b882bbf72c50659728952dcec506d2d104ff256606f36f12ceb9a52d8aae520518984b632db6f750aec8b7d2259ad82cdc7bba6e70a3b01c50dd897fc51192b97761b9d6fd20fd6174584bf3f97079ec57c3287d77286ec650201a3a561f735af5e7e7d1e6a5f4c7e9d4cd87ce3753a273dbfd22755480cccdfdbbabb1931dbb4364ada7e7e3735ed213320dc66ad92becd3f1de9fe25328d6b6ac25eeb3fa819f55ff336115db90add86f, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6238313164303133646564323266343031333263626466366166633961666538, 0x3d8edd0a823018866f254470ab35113ac9111d750175d2813310fd92d5a6f6b961b1bcf74641672fef1fcf9867db4d1e9989ebbe6a00b9328306039d259181465593ba2b7e82f6f01c2276755d6d55df9198dd8e0ef0c5101e4e2130d3374e03f5e45f3113f5e1f637dd7918eb6a80fc1f8f16a947b00ebb45d01c61d0550d242585947e26f4cdf7cb955ccb4b2c0b5996346d5922659c2554ccb398c997ee1ce86830a888c407, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6330343366636630646630356334313063356662396530333632626136393433, 0x2bb632b1b4522a4a2d292dca5354cc0a2c4d2daad450cf4d2d498cce4bcc4db5558ad0f5f70ff5d40df008508a55d7d4cb49cd4b2fc9b056b20600, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6330653061366531326661323963373261616263363230326364373562313335, 0x4d8fcb4a033114865fa50c42736808d28d38b15bd7d54d17c54566e64c3d36977a9274909077775aa176fd5f3ebed8ae9f9edbc64dca0633202b72278b0e7d128dc381cc444752bd1db89163f67da2e0c583fc7acbc83f92f13b13a37461c816a1885bc54d509639e22226a63e2df54cb8bc6cca01d3d66636f635b06b6f039f5d872c4fd7e87d7e8b50ce8617a4c7c082368f9a5eee4265d11fd2a7a6d50a0a8de222405d54ff95ade1882cee367bfa907f1880d2319aa3ae953165f633a6565dc55579372b03e80abad1bf, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6434316438636439386630306232303465393830303939386563663834323765, 0x2bb632b05252b20600, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6462306630373834353237333833623835353966643064623239393937633661, 0x95914d6ac3301085af121b9348440c140a2d115e6559ba283d81628d6b2592ecc852ea607cf75a71d238d04d77c3ccfbdefcb59be797d74d6abe41d742a203651a8d06ad27e9fe18d09da1a8b038eceaeeb352a5df6a551c5256065b78555b92b1fd47543187c7a01c3253cba091f6e42ea17d06a5fdc327ffd5d0fe24dca27178da5e55b90d5ab32c46be522d8f111491ba3b8f6d5449e654925fb8e512a18d6ddef03c768f683ba248de85afc0a871a898535662f7c053362b2078e1bed053ca264e74ffe4d64f144aa53d3a325bd5a10fce26712d90aa153b8d920f141a573764753913ca154b929b115c73940f0f27bad547984fa68b38061ff840a6b7501a6b29ff01, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6532663061643262623666393561393530303336366138636136653265626132, 0xcd92cd6ac33010845f253526d68211e9a5b4519c7b2e81426fa507355e13054976f493a618bd7b95b47644c13df7ba33b39afd905d3e3c3d2e33f54165cb6b3454a84ea242ed4876387a349fd4f1f78daef19c958dd73b275a4df2f2f07cd14a83472f0c96aaadbd44e8c9cd027d4e1b4d1b61ac7bf959518d32f4276e664ae851d25e4a9613b71716624ad7a4788d4f8b8bf8560045bedb935ff9a15ad5716371134b0f0b3ad376a418f20594f70b60a2214362bd98cfef84ddf2ed3802e8a321ad545d4b419fce06370b282dce9295abc4369509019841e78d4e6f67815d5949fe072a7efe77a8924a23aa64368d6a9dd8a63229aa9b21a20ae4fbf301b068c9d817, '2018-07-15 05:47:07');
INSERT INTO `wiki_objectcache` (`keyname`, `value`, `exptime`) VALUES
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6538333164313135396535303435356665323437663336646131643066343231, 0xedfd6b77e3469230087fd7af10d11e9a2842125576cfd34d168a6b97ed6eeffa36aeeadb52b40f244212ca144913545d5ae4fcf68d6b6664029454ee9e67f73de7ed199788bc67646464446464443d3cfdf40f7ffce47f0d93dee5ede262532d17bdabf9f2bc986797c5c566b97e9fde5597bdcdfb55b9bc3cbc59ce6ee7659ee7c9f2fc7579b149badd20e7b87cb75aae37b52991de4559dcfaf16c79717b532e3663e9467bddac6fcb74e8c6f296baefbc75e5d3bbcdf57af9f67051be3dfc72bd5eae7bc9ebffba2dd7ef0fd7e5afb7d5baac0f8bc3b7d5620665de569b6bf8d2aa493adaadcbcded7a71a89dbe85a4d1ae9cd7e55d380e48dfe9acb9b50ecce976312b2fab45394bc69c38dc5c5775e6474b89d962f9276ee4ee4db13e9c95f37253cebe9ed5f9643ac2947a5e5d94b94f3fa604caba582e2e8a8dcde314ca5cddd6d7360bbf2903ba2ddf7d7f69f324891b9d1775fd146793dfed2865b37cb959578babdc671d6b1a15b82eeaefdf2e6c36a7fcb05eaecaf5e63dcfe376856baa8dbe29d73540214f4e8f4f4f8f3f49325e98dc81a786e121903398d3a67c076b29cb818bc9858f2f1730f46ad32c3bda656b18df4d7ef2d3e4ac3ebbfdeacbafbe3a7bf7d960dadf46df1f9d5c65eb9bfa8735acd53b287e74531f9d64eb59515f7f365f5d17f9c9516f72362b8efe394d4faeaaecf2a2b829e72f8abaf4432de6f30c60b929d76e90fc0960facb0a4080c57b883d6edcb9fc5aad979b2503fbf5af983214c0e0546ac06f9cd6900b673acd6192407f8babcdf570906d969fadd7c57bbf0bdc1808518e2f60743dc43c04ca55b9f10517b7371ea8b7379d7c713b9f8f31f9d9608c352607f0bb8fbf8eb9bb29a1f00452a7e9b0a579c4b1979be2e217df090cf9a666dc86ae74da37e5faaaa46ac7669ebd34e3e223280aa029df7c4f7421c7829426eb9b6b4dfc18c914e00f0ca12c2eae7def38ba73184f56acaf6a3759190416a53164613168e5a658351b71f5a97737d79ecea958f5c21d8e93c92a574ddb619871264d187a4cb1578268cb4246fd31e08bd56afe9e3b845113cdaaa995cb6a5d6ff6b552feda1b6021d8aaf795393ac542e5afbe48c56b0878901b84c85ee7fdaadfab006120613848477b40f43c1f74bbaf9f41a1f18470e8f5743a9c4ca997c56cef9c1d0a6cb70d64416c55a41be23f590df4656829257c67f58aa06a9329c56d4640211842ee498a24983111fd5a5fc09e5cbdffbaa6fd46bfb30510836cb9c2628045f3e5a2cc36b01a80e86e4d2683e9767bb7cbaafc5436adcf5328ceca7295774e47fef09456e018395f2ee765b180b3914a71c6a8d14b45bd8caa7e7fb48b9be9d833b82313adeaaf6482073d2e96c271c9cd4243d84805fdf3085d0eedc4eae868b4bb84251855cf381ffba5c3b727c0084696326949efb00e820ccea0432998de0160655613cc9b8e10b2b9644b12ce482182d9e91d6efe6a715bd2401132dd2e6674bb3d37bf1fe645b560f4e951a5edb66756307705e9938bc0ff701aa61876e5ebc022d132e7306a40e8b005484bc7f00f20b6f0096d65edb05c0d84b805421e20274d50f08b86c9cd1fca48617d1db3a12b25cd603670273be565047d22e4efdd01c355003b3214fe28e9f7e41cea7f5b6cae8fd79879d34bd3e375b99a171765efe4ec0b38399324cdaafac7b298bd1f760659893c96dfcc37f5559303c344d8b58be57265b73d6c1087903e1db036a6da88d9948e9b430b2623accf0721fdab6bb2dd3ebaad02cb73437f637eadb52afc6674ee76e1679ec33fc7ccca51d5ef00ebd7d5456bdd4e842f9805080b7f8e56c5ba2ebf9a2f8b0da5f64f53a098d4e09737abcd7b4697a851a44ab8caa3605b99a15e168024a3dd81aefd1ab74b1660604b93bf94ef71bf752061bb8d016548c9768b535f2c67e52bc87545157a543c1eca66fd1eb7175634a41c8812338c7c32426e9698ec246d16b0d53d1395253039fdf8fe3269f4bf03ee180efd324e8731097f7abc7cbbf8060e472656008b18a8f148a108f2ff7169dd7090969bedb9ddb6d7cf70c4d16230a072a19d1efdfa49e26413a1f354ceac4c98ec76c9d8b3e813e5e0dd48523841b485a16f00b9461250be7c53ccfd0867c5a6a021e20f47dd90e7e6acf44e041c2031e5c5cb8b75b5da98cdc8d5b9c42429a1e964ca2311b1880a005fd4931fbbcc31de7e1035cdc033bc3c2125518eadcf1260ea134fbb3c776fd879264ab3f23b4808d9573ae55d279872ac05bbdde013f8fd6f966f95df07d02f1a890d161571206253493e2ae6b725300d03651a10e9855d10fa91cbdf79f50b6fce03dcb7dc049ede7a7eb59cd4d47aee1852e625a10938ac85078606b8509ed31e49efced765f10b9e252c0143a395c3f67fa93d6ef0c346ac488b1d5419fff81707fdc14deefc96c40d0ca8ef57359058496461e92a498694077bd8e023d6c5b394248f5fca48a08383295b97f5ed7c63042949d86e27535ef5b532591e908418c2694001e46d02f90bdac964a34336520ade41c97802dfd321d6114606f96b861056e28c5d2078558b68d8b47570ec5e749091f21859e7e08024dfdc095613e969b4439903128e151df26a8c0207312637c5bb1e6d917e950eabe160e451c7f1a4b4e2d040b70bffc0a2c24449ea723d8fdc5a1e9de2122070fc3c489e02d91b4e9c991782fa9ce0e5a0016c562aaae37c7b5dcdcb1ec93c80d1983381114d73ae38790dbfe9e081fc0ef1d9400fa98a1698867c9d69e220686367bbcd2b15c12815a937a059248f7b82532d80cfdbf0b434f16b4cab4b4045382b4b5444593a440de8b4b5ca97ef5628a777b8b951cbfe8d1acf3b9ac023a24d47bb2d2a0830083b49ef645c245ebada061f253f16e3a3990359da43698319b6d15a565264b80d79f73d9e7099d9d2081c7de9f8639e2746a96993743985cabfdaac6a25486528241b961a924953745bcd86a719b056efcc9ebe5c78751cc20e693b97c936372b23bfaaa2c6d31490046e56f9e562225928e77199cbc5e87291637ddc0e4df9147af58c9cdb10a31d769e1b2d941339b3a7e988069537f50a20dff354a577562cd02125dad35e5b9329aa56b8d163040d0c3af8ebd85ffc00195c7aa30ac458bc6dea38fa3d948abe2836c01690fa8739d0a1fcdda5a303aba94a3e674dc0218818e7e5fa90d9b74385d221a1203577f86379059be590493fcb5d09a93d36bde4104436afd511dec6f085c98479c0c3a48f79fd649a4c5bf99874a4cd1cc68c885249dc4d09ff4df8d425a149f716e93d6309439128605c1f275d8864a12209b470daedaa022310820cf7ec45bfed56869ce703c742bba46441604fb4c5e70310ddf8e7d1695a091b80137f59fdf39ff332f77724ccd232542a5de60c56688d0ad95780854066fefeed37d966f94bb9a8fe8942fecd0a8e02d1f866cbdb4db9be59d69b178cb4a4e9fa7ab1badd64204e7c718b0a2d587728bef942ee2fb299f9f1251ea59af075fde757d0d7fafcf6eaeafd7fbdfc4c7e7dcb5453a93eed731013eb4c5403b091695e49fff489c75bd8fce52588fde50c3ace85e3f75d57ebf5eda206d23a433dc820233c7b01d80ca40bd8a84d49bfa1199a795b864062dd968750f87e3d2bd746159f9dd3995fc08ac12f0b9dbc33700b8fa2f5b79ffdfde7efbefcd367afbefeeb97f9e9b3679f9c667291d1bbdba5d1150632327810ae962be245e02f291e7f5e149bea4dc969a883a46b17f7c59737f849bf32bd7b71e39d57c05b1c303b42e8c1c7508ee9ca48b4b03498bd8793318c8ca80eeb3c01785dfc02d227e313fc28eaf78b8b6d71bb595ec262d5f40b98d1f75b5cf6f5725e6f67b8aedb595517e773a8705dcd66e5625bd570a66ee7cbe56a7b03fc67b59a975b80d0620b0b036b3c7fbf959b35e8eb02326649064ccda6ac57c0e8e6c9e4ececddd3c1d9d9e6ec6c7d76b6383bbb9c26d9c575b12e6054eb2f1717cb195e3425bdf1f00cfe77bc850a6f8fa6dbc94f50713038827f8bc134ed275905a3d95497152c7ea3be63ac93b74996bcfd1d50bc6203d4f21cb61100e3ec6c92f4fda8fac9935ed26f34d24f5218455c70f2e4a78fb69dff9e8ef334ce1a0f3feef971ff847f3f9ea64fd28fb767499c719660ce59b2859efd4ca0cb741bb77b7606205ad5e5ed6c09631fee1fead9590f3293de878f22dd62bd28b39702eca753c8f2b0838e9e50e1e327f04f7a7686c3cdd666859132f0e9d3b3b380054b8005904b395328f9299c6e7f8be3f849c6304d7550d06f54f0236d1228c44d715f9b4fb2e85b6a9d57b07997ebfadebabdc9f3fe7f23146c6abc46d8a083d27fdd2e11cd6ca379d23f885a85f94d3f860578326e5d709e1a2fbb6d4a1001f2cc0688c66f11ea236886283a9e36f95df2f517c93028febb3d0805f59217df7cf6f265541ed6e29e1aaf3efb5354bead70b43f017c52fdb357af7e8cea5bf483123fbcfcf22f5f7cdf28e3c092bcf8f3d7dfc4731cf688329140b4c59bafed62738dff1de1477ad4bb00b96bb65d5e1ee1a12f7b29c683f20d50b9e56c06083ae903494a7b6767b327e9a2b161a1ba948833a0421f764c73c1691b2515820069760c4224434acb01521f69d94559ce6a61091a2009ba60241efa4994bf6eaf00160c090f983d73875420bdb3744c536e1b7e6f9c4f7e82397f2413d90182227f52e727387efa2da7cf16875bc079b18545dd2c17e9472755b6be86f30350f9e4a7ebb31925c8c17af2d3e4a7bb69ffeceeac7e7236e1c4c3b3b727d91a8e199209d7dcc5ef7a133c2a00c0bdb3b7f02fe0a9244007d9baaecee778b49c4c001227a84fb92880f93b01ba78862600b70b49b160243a086470561c5d4eef4eb3ffdc85731f6f43501d00293d26085c31972d6dbae3fee78c5366faf76fae329fffd7d515b0cc8377495f0a1c0dde9d0ee07f2a5160019089f1cf76db68642c2943cc7f36188b8af772bdbc7901bbf00570c63dccea4babe9705f89e7cf4f07dbc1bb2ffe301864f8dd1dbcfbe4abaf30e5c5806e906f17f36531fb33b08673cb80a5778609259b07d4f993fa88e52ed4ed58a9cd3290c7b411bf833180c095edcb19a11a674fa61a2a382160e455fec49addd128865e9f34f63a3bba1bcb40dce6b2c2dbe94d3be79a91634198e0b0b5015cccd772afe97409f940b44252941438c0c2d5a4d60179661754c85f231bb71bed9ca0c5a245c3de45d583200094a2a322a2cf3ab49b4c819155d9d57a79bbaab3e57c962d2af8af7cab3205fc7c29eda20ca602f258fee2c548b9d695dd6e2579681702af87bced9545046f98a352bf93bfb5c2482611a8369d2ca7a370ebea750d0a8d8e57366cb71d4ddd6eb54a87e441f3f5c7e0ebf4d4f1d13202d647204cbbdd507a3a202e3ca80cd220c13cf78489ae3edc62c9d572ef26a77293d3691ab402ccfc1fd33b5c313759400514dda0dbcfdf7f3debdd90708c25e4de61056474b141c4a79628ad9a41432412d01cbc96ccd966b8d9b166a93d95ae965b161ea6190c31c86c0e38c56b791624b53d367991197cc868dd9d37c3efe934b57445b7401376f5e7ef5f1557783f63d6a2d1bc36eed6e793290c526f0583d65ea014fb1d294e1e3b00570561d29c9ab97ffcb52e00c61d279e032abbdfc740e6370142c11ece612fe722a48ffc7ed6151a997d9d875ba136db3d549ad8ddd6bcd8ea588b4d2628b9aa2efce88888e0d80c403e535eae9754b3c44cc0df85f00996c1d9fb5137d1eb076da28e9b40220685b0956402ff7c9cf4e1773ff9787a988caa9c07176ae4aba3231d358ad0587cb35408f55c06b47a60a0a90c44b404dd2e7e4b21b763ccbe748432580719d7eb65b5e801bb9012a53105d2bbe8d454e4f2233a267341adf0199c47b67e13c7f81804ec2275201c359720fecce7741fdf8115481d90d7e5cdf24d192d155d78a9fa84a7efa0105f647d749aa4ed479339ca02558e1a1e90d5ab2f4299909cb1d61a878a85984ac0af3e6a339f13a9a5b2df88ae8f8dbdb8fe846ad4d7d525b02353d500f55c1eb631cd552dee4cf520d70cf6a658ff62d5d177978b896cb9694e2a45a75e36b560cb97eb0d9527dbdeea8d3b1d8f79fa42207a09e4018c71d1c554a473b9e841623ada67b260960fca054741f82debf902792469124782f7027877e4063b1366ae8702579d5d3367a77afe754ec9aa45dea2e18f24357717ad0866728b13be779be6d2a6ed56b6d50b5450b1f68eaea26ed7f979b75b64b3eaf232872ff81de975cfa3efde7f9f1fd7cbdbf545f9352ad9b65babdf0319efbf8bfdd90744acb02f0765fca05d099debc51cfec6c11c2f00b15ff2c0c55eec76cd0a47af7d739ba5189f0e3121c27c52dffe40722b31327e7ded8595b7f2c9efb13450eca372409c49dc4ae4881525f78698e1c6303e2719ecdf3b8e5e380ee0c0e49b05be247dd4c87e58d6157e1673191dee2377c567f7a3bf28bf12d6537fe57dfd35bab7261227d57c0befce9f842c659dc36e9c4c89862933ef3a837d608bb66c073cdda1e6a4f73a288987cc14d9e4122f7bf34e4f06801f92486497ee5a3c745a0e1c6f62ccdfeea5c57dcc50f846c19df9a39d5aeab3b0716c0cf7e99642d3f9a3054b94c6498f3933accc9d464204553a8e2ae85245c9e3e8dbe1204e0499f264d8816d363262870ef5c0a679fb772296f280e1c5f2064966c674132f4b88591ae33ff1a8312d907b887a400d2ffd9058736c650de0e330299a84a7372a05edf417b63592cb9bbca5ea8887ca59e56501a7ec5fabf22d8e8573ba5dfe0bbdf30fd8ac2bc246f90492ffe51bf8f14d556fca05d2fa3d19bd84a5fd2494fa33b688f1bcb356df6ce0fca4167c933ead972c17aded21b6877256de212c43e0a623e5908d2e5f4f58675606c71b1d7f17ca6f03114a04a13a981132a1ae58429bac95db97edb2bf2fe0d0cac54cce57d4463067b3bce1a33d71cc980ea02997a00a5909c7be7138112217dd18b3a2d8e31ee9c4b683f2d89e29308a85d3800c94cd54acd0f1c77d613782d88df49e54b61333728e8c4998052042b3096aa7a77e7f56336f6cd0b02c88444dc0f183809a8578243a917d8235ca107a3e74bb56ae1e4f6ea664cebd1bc938e79b72dd1ca9b049805900e6ca8833aa03f4da40d755443aad7d61535402dac2ade349295291b0b91100ffc7074a9c00c0269715698c1801179f2ead8544b450ee0552582373ac267776ca669a78cd0067e43dbbd56af5ae1e8746fb4ec6f8706ddfc1d08d218446986f546fc86d5c35d0235e856636a4c643f31931c5524dd9c323a2871357c87b01855136961438d2866a1e557d64996a32d9b12a19ff8c008d75620973645688af8ef6ac91a350ddae7f64a569c162c5bbf8e0bea5f03a960b4f0261e306f60d28603a7d8a986fd9e56a12d778bd506bf18184740167281d67c9b3e290b514421cfbc9c7cf9f9d14cf937ef28cc5e938ffe8ec72faf1e14d0dc2def22d6c4b987f997ffc31d5e04732877aab8fc9cf4e38117e70f2f36424226203f19249d8ec4fd0c0d41d4480b84eef443890e0e5f7346fb9f7c6cbe533bcc2638de99ece7498f775d172373f1e1235d80677600f7455cdfe3bb730bcaf4b28796f6343319eb8a7095fe4be868adf9921f59fdcd3def1ef8efb784f456a9774d48a6dfc9417e4abdcf31c4e9dc082176c7ffc1b69cd90002659c2061d50266661a84e1a5542090e2a7d91a4f760138979f72e2f35135d4d3a8b0a0bbd8396752817648a72df3a68912c19aae54ac2fa8e96f13ec986eff0f4891ac98e9f0c991ddc59da20c29953e105744245b75c69807c931840096fcbf35faacdb761233efb66f9cfbd79cbfdb5ea282bdd4b9c741a0016209e0bda88543957735abad382b29928a39ae993ba8314c240ed5b6b8a9b747267a9c2f0f384d60399d70ece797fcfea335921ba259639a0da61777bdbd002a61d2fdb35483bc1f0823355ba53ad433ad27b8bdcb7b0ddee69824ba69eeb709aac6206c2631e28affe382e62596e08e56f57a8f23a37cca7324664cc76bb0246bbd383bf50e876156bbfa81f379271f889b5d261b16faea85cdb934535bba7ff195e74aa95ddb96329ce733b70e627ce91818b0c2f77bb508b393af0467c1ecee3464f7becf9bc391ffb43e075eeec9dce51e77c5f16d99e739661d9e81b2f2db9e55e11eb020ae4cc7be771f2793abe07a6e9f0d474d73ddd6e7b1ddda0088f2f4a1496f1da71ef707bd4b10ed8c108f00ac6148e0692adb2c2dcc8d9e4ac48adfa52d68fda3bff4ded9d7bfbdc53c72c3ac3d5b13e00e9795bd6223d6a264233436fb8a920fb747c740a406cc1c9c761caed9a18e902365d61109777a14d2880e92ea6d939fc392766b153d04ec47d7167f627000a8724301b9f0ea11825c09fd3e16f9eb60a1438502202feb15bac38072cbd5de7c528d25507bbb2581ddf2ef82e04f5da5ce5fcde2ae771152e5cacd8fef41cff02e0f1ddb95aa18ec3b1ad26071542100b0eb59e451582535bfa2982c0a803e143347a7ade7ad114ada94b91051c90c45e8232f1c283ff71c51aedb9d33d7cc584f5f9f27eaf1273afe583484ed804aa53cc655964319825f9c71f9d22036ed524d1c062c586bf2afe56398ef09b4f2a9a40fac0bd3217e2ab477d661630011e163842c8de6ef7b2150c1677ce8902c05d7fedb3bbd8d837baeeb0b0cbe88ccb692927d8ec5439c2e703bfa2eef8f622a6b53fb833262e7b4c5b1e63cd62e4d1a68d831f0c2e758453fcf0e25fc2295ca4cb451edfb6351f6b4cf10235bf8483debe3e8eea65cd7ac0d098d1669d481c1ffac7380207e8e6c0be5a1be39be1a6de965586a6a97153eb45f019e27ba5bc5d77440500a7a1c471bd2a2fd0e2953a64edd1902f387505c835815f8256d704c9cbf7b08cef0ea96c7678bb589717cb2bb46a981d22ee95357a44181e267d7662a06ddf2e2a902e5ee22589eb2078b049209ce971442feaf8c1e060149e536e3b951bd84a2ea31eb983210f1885971b9471ba5d359f21ebb41eb961910428d4732c16ed5bdbe363544240945d0650fad7b99f08f3fdf846534e85d778dde5fa263f2b3d5f7cf27a9aa163999d9f0d2d52439124af62f4fa463ff7e821e9215e92d081eeb8e2409945e7b67eb839930e13cbe984a19d7e2e9df1edd0c81b1d597edbdb94e574b363f34ead9691af39a139bab05b84efe1acc2d79419f9077f047eca27135d92cf47f83df239f62e3a9c81eaecdaa6f04930e84f9bafdbff8a7b68143cf125fd9eb952e313a9ceef8cedc5f0f7834cae6f49101cdafb56be521d3a7bf4cc139fe11d3a2e5accf0efba9c939035bc4b9e27c3bb59b51e269e2549c4c15167b0cb92c3967c48eebbe475f9a65aded602a0a0ee7fef2bb4dba1e9e957a4408731b051baa71c387a79843a399d3a63befb35e96a5296f7f4d776cbbf3e75bf7e8f0e18ecb3f0b6868cf91b22132aafee5ce3099226f940bb9651f02456a943f629daefaaa5fcc3130baff8dd0020471bfc841ca82c36d7097be07306747796fa4abd01de6aebdcf37e4f7f8e150a9af49f008fd374f8f4898319f68226ec89828c939633b4251b697d68536afcafa980e30fd3b4a5ca28b228bc6fc01690083d7d8810838fc8fdbb0b382ab2dbc5afc8d8cdf28ecea7dbd5b57360c47d3091b598321fe67a35ded9f0280bc6e990a01d8bfcd474147048b06e863bd164640a79bcde844ff3b20372b0688a688e7a0cec2569e2e6294cd811974d8fa2f454073dd0410f3c06499d919b96ab1c976847e94fc845c8a5ee597a87125cf4e36d80b7aed3a383ae53e3ec7b37e01ec39ba809be70f16a8c480b32bce7eaefd1ae452403afc6dc539de6750acf7555a03b4271d14836771357820ce0dc83652eb8ddf6b48a7d0fd1fba9f910cab413bd1bc1c7206400ec3a35b73ced10904e1945ed19eaeff3fd092a107259eecd6e835f7cf032522c0192942830e92eb398f08bafb7725d90e53dcab6f7d94a3137931b01c0f0fd2c3f5181c8bd8fb48fd3ece4092bc435b1f188191be803eb336aa99d2763ed21a7c10ea3b6251b6fce9bf93f413ea52a6fe9763c4f1cdf4807159e3c50e139c8f8b6fc478df2bc958f28514946ebd8e1cc1be33bf6be5474dbd5231f72062959873e308c6d034cdb6d309e416607d43f7543ea27476270d472969233aab7d7c5c6998931e7417e17c59f6075b39af31dbaa1621d39473360ffde16eb99cd3ffa94b2b189245b5e12ef867dd079c66fd71c26506ff200bea05f8371eb96eb74caf025414c9d9c21efbb9bb9fa090100f09b74dad5c47493a526fd22ebb6acde146b7a009ef34461e432a5716258d6a4854713bba6685cb471729ef6bdb431bbadd9ac38efc090bbdd0ed7f176516c9047a3525900c699de397960640504fc6702f9221171636c1676afdba7a12be2afd323676404a31c61a48e08f09d22fa68a49c6e378094f75a40bb9f2b4f14a86266e5e584a1a4e0f253c201311d52bedb5528a5777e25c54ecc9936d33110a4e477401b0901725f6d82c39fbaf73a8400391b580f90db123700701250dae974c466bd7b4b3ce58672d79a9ab299975e1397390dd6abdf37b5bc49092d21cc877af6a31c00c52748e28bfe5eea5fe444f72bfd3e56e4a6dcabfb1802f944e661f601569b8e023754c49509f481b56268d25eb3800fbe11ec2977922a902ce0d010cd41f454bd4ffe9bc1f22fe1be82905af2b84783b3d30ebecdb43d6c19a23b5927b718de2d171638ca11ef9dea186797b37b2699ec7f28851c74bbf87d42dfcff301998cb431f8cc3d7bbb5fef0047757072f739e1bf301b4aadcb0dcb929a11e9e6b6db40e6004645343ce5ec902ba0c6897f11e360de1e18b736defaf9808073b950a5e829d943d7b9742f57b45992b8b938f62f1a70e404a3d736fe74fc5893ea6af64e12d06d0e176858513b712130a09ebdcbdd15896f7746cf74c8541a4a580b6afab48576bb740fd3ad1ace813a7ff67edf172853c8a28250b1586e92e1bec95ac982cd32c89712db69c14f1ecc3a177f26f7be9df1c6885cc92df72340dd3cae6976b70b85bcb4c99548870e25b3c91457c0d8b747f6ebac8a72ad204cc572bd0ae03ecd9dd629bd8f8f20102109a3f356c744a97e50aa431db9d2465dd8714f069142e1b2a55902f8faf012dd6b7e19bfb0a54c7bbd80dda8ba7f5f5f6cbfc69ecaf945d56fb406edc5ca41b956392093b257f47e3650f7797e97c6f0fce854863c2f90d96a1f2ee6b1e2c6789560190cb348268a34230195c24248a3a89dd10effe4f8cf6f10a45b0429fcf50db4369a2d1d26e277de768540436911ef009d860482542018667356cacf6fa971fdd13e4c572ccf1942aeb8821f9351442049c9e9c78d46d75cb21a76d69d97a39057a435e4c7e1494cc8e405c3b5ba5f9a2f2f0a36eb8812909c5f3b4702f09bee83548942a20d0da49ae101b85e2e9b7d99f9f34d371ab060697223f47071befd2b2e50bf2bb62f782be972603c5f9143a26d23a987ba844e47b604b91ca69fd7ebf272bbfd6f4e2ece898121f95d8dc1eed3b6a895188c0e6539b47daa3fac16ba9252ff4aad4be3f44cf7c82ceee194964573767dc525229af4910a93a4ca1036f7f4c5d4ca9240a01f8d81a9b9af7d361825b89608a2ee540c3a710028d14b75a397df7487115b223ffbcf86e01408429928fff7ac582760cd64a053bd1c8123831c8fec5b6ef14b2217e47601a9322fd1bebaec01655f5d790cd78a32ff86f77eda7ee3f51df6cd1e635a7a463d952572fbf9fcf64ea961d8d1f488b479712bd6a769ca6aafed168b359ba65608488433c970df8bc058bf0a3c829c768fa9651fe365a19fc0897af6e3f6ca5f7f536b4658906635e1d9607ca0bffb12cbc573e3d425de73fcb6298823b9861bd6fca9a8e0f5a9a2bbbeb5fca664d220f09ae45f19c3e9bf610cf3dfb69291a056e506f4fb20cfa33d3aaad0f9fe878ef3ea7ff738fb7d07d70f1bab3e66724411358ed33c2294bf26d3917a9dbd5b17b36a89211ee8143a5fbec3df97c0d2e0df5551d76f97eb19feae6e8a2b4cdcc9c32e6d0f2483e6bb671ca2eba2be3dbfa9f06e16f9fe72735f1bc1a3e5ca3e8ef5b22bc6943092ac0fb4649e47d5c19c4791f44b571fb6c191de90a956df7dbb0576d7e2194574f87e317f6ffcf1a898c6ee2e6b72809ad5cbaf8ab5fae57117cfe8a998e435ef1973a26df38d0df94ac622e6f644ba1c0f869ce50d4276d44dee5c7e88db8ec974e4bb1468e8b7888054d1dceb621003757543bef7c4cd0d15634d91dc854a97f8af0cc4ddfb0999d86e2977b413871884b83d860e8c2dd59b62bc44259359d3b1baef8bba0fe45cf5fbc02b27edb3efe4a1ae08455e70038bc4f1c324c5f798ed13f1579b8cc6d812ba683618262e7fbca13dddf792462b183732c17e2154a12a15e30c81ef6f9f2de19dc8ec9cf3b849ee0c12788d5b03fbb80da159f4310e8447278a0f3d727b899b512135a8eb3d8218472d3cc7d06baacc5b08abb6881764b10f55b795a40ed016361b1b853e4e60a738e27250cc662f1cde0974d007972665e71847427c7d90aa47324060901bc3ef960b117bea1c4ba3f2912ea2ac810b3acb25f61e7f7867d2a63d628bc20b9d50bf128b9be606a3216b6eb7f1d08c9f0556cc343a4005cf43f744cbf9ec45e3aaa87ccb370d5e9d2b932582f66f19bb12a0b671379e23049af2dfdca5b94279508faf7e915ec4b728d467b7ab59d1cd884b3ea564819a53142960d176c2157d3a55074a5137b916a7c1d8bafb21d7045de09aae64607c2bf5a59d062ad54e2b7d1ffaf2a68eaa442ac98e66c3debd67a15b65c6a1ab8b0283dbe0ead258dc6bd40d477b75188843e98ee6eef3d8bcc76d1f39ec774acec67b5aef0f6509acdba246c31ccf46acc4da658fc217d6f42f4ee7eb23387815ae52c91b7cfb8707c88a6305b4b99b6ed5fee212f010b65bfedbb60a761cf629316d52ec19cfb0953124752b656b861c9ee2983b171da957357bb65ad6c2b7c94f8020fff446407821ec8a75bb1dff61ee577c626e7b76a9fc4ad0f7e1dac18f463b98d86ca73936c3b9ef55f847fee6fcfa6fca9b954496447ef2db62c59ecbeb8dfe5c97e5bbaadea03f54d5a20b3660a59aee01b6dbbdbb61bb4d9e24cecf9dd2c6b18bec30d421e1ad82acc8d70bcfc600b3c33d38278de9d8e1388d40c6edd9e16096432e232d7f7fabcf14d6630f4fa0bcd8c7d85b729a591f6cb76605c793e950c03074a31df95344b92c47d4be5e98bea36331402abc03b859e56e6ea6962c473af2a57bb470b03e418b558ec9f7ddca603e6f49dffe44da27b75b1d3ff020dd5dd5888322b32518840e78518ecc0b5fcfe7becffbc668464623a53931b7efc7a6b7473826df1905facc0cec5030c8085602f2df340640429a84ef681c5c31d248868c8758fef9d1a9dc78613504aa5ac5f3b703261fb866b82dcbef6deac766ec62306f10356bcc2c1dfa24a2a2765562a029893078c720f3319d42f782b66df63c655ce051d657ebe5cd2b6299030e9c5822f524ab44f8750b533e2f0b7401fea3d878b3c8a916df1361c6410e23412743239deaa2dab8e25175b96277f5513086a3ee202a860fc97854eace3164e5efbdb5b053c33857d190380839b7fed9e2fd87741098a629f0a804dddbdddb158aeb930738287c17d1eb44b000bc8702ee915327cfe3e822295e310483520627f5c4de42b3d9fd3002470b67300a3a08df81009ca7ad7c88dea2b7624d2558e3092180285c877d4caac23455d399a023f1a51375235b87369acf528b07737e182ee075deef573c330a0c367a2d336b9dd06b9d502c6a1b0ea27a7eca2af8d669516e436876f68615d0348d7a247a029dc9d1d3a953ea1f266338f08749b24b1b41ebc8d7a76ef8ead96b31716f2114d26b95bd4ed38c66df5656953f411da8e1aa98d91c0805725aa2b5e83c74353dc4f641a89dc0fd09551052b68e90063d99badfbccfcedfbf849d66929dbd4076fe5e84c43c6ac517a96f57e55a92f390c5331bc6d172b75b0db3ffdaad80f0cb2f96b7d025be304b068931fe605fd6e4c9504642c281f4f37971f1cbedaa410f02a6d04da8db8d1d32a11733333c8dfef3177a1d97f7e4b39f87bd715cc4d3e1b736cef0763b383e4de9f8a0ce5decbfcb9e997f3cd0dcd334ffeed4b935647ac2a1f6d48b3535ee23543b426366c914fbb577ddaea4215a50f2e59e3eac7d68f8b9d6bd1dce4d43270540e452846e86af514158c6ea9482840418aadbb177b76d92189cf3b6423faf46da49b78bf0b2b9ad903098af5050107889d5635c936376cca7edeaf9405541c0c6b1c3f54ecfcaa0dbad6f530d92cc3770762b0d59a922f66e6710dff1653e0d8ab4704536dfae121aead286f205dcb65677f00ad5267548d130aff182d40ef63118b16f0ff0ee7272e4ad97a4f598a5150e2dca2c294a87f68b5d60c062e4ee79357f36ecab3251fe4bb0333f6d2434d19e21da53c86298385fcd9b8e8e5e7538c58fe0589be37195085a8401e9ad79eef00580447ce552e6dcb6ab475b478623dc424cdbc322bbb629f66295c5879d3b62843d3b764a6eafaf56757121ebcd39ce9d2b7f35d76d7f2c89cadd57e11fbeb542baafc1d966ea09d00dc6c6eef37ee679aab96c1ab7706e08f9813678ec550d81cbfe668008251a1a3283ddd6310fc16bdaf2dc8cfde259b9e4f95394073125773248ea18a0afbf48825000e834327492af6f819bfe195a39bb53c7d969388c5ee4c59107a3ec647033d5624ce79ce6214c52546ad29e89bc0337621d28b8fd309a1eec47bb068a09189545e34b27be3ef1774595b9ef0a23154d231ffae3c130580bbb5f8325a9685a2140395624038bdc577b6e190f480468ee41abf20139f62ad10e19523f10d46124805062fd807800e4694320b812cef8341d1960bbd3a48585270cf6eab336599e1deec74befcde4ddeae39042a364a1e169c885463e1b1ca1f8a0d00807adb068ba00687a395067b4ea823e4963ef06e2f68b6c2ed573ed3e8f0a79a7631d2158afd1bd74d4e68ca9cd7bae7fd3831f7b7d35ddebf53fed9e8a6bdcce5e17c3a10749b478cc3ffe9d788ef48f1cde1813bbc8ec0aab105c92df25d05b7ae7ddfd9349d696ac28afcbeaea7ab37d5bcde8095ac35f098729e543587eeef55a4be59b2e45c8bc0b6dc080e57fcaee0d39ca4e9b939047c183ecd04e000e1100420786449d120ab2fe187871711a6d035ed2d423c0f3d01b5ef5d3181a978a2f6fbe8d56f8b482c2cc241cbe777e984ba087600aea48f39e394864ec51fb52938f9929597f8e9b6b3cec1dfcab6e5b76fe0a84f9169881c6d11d492c60a2ed92ab81928d870ae7a0c2664e926132cd4d8233fe9134e6c4f3065faef99ba65f92918b4d0c60c230b8d641be663a7744917ba21129eaecf9188c8e791b9bcd156aa0b7f3f2557195f74e7e7a4611ef3040dec9f8796f3c7c76767276fa7c9b7e749272e9aa7ec9af4d4f7e3a9efc34fcddd9e4ec389b3ef9e8c45b56006c17cbb7ca73d6d9afb7c59cde01648b250b9bcdb8dcae8cbf6dd528d87082fab6422cabfcd353d780f12fc51757f8d2153a562f9cbea0f7e2f2e81e83c71480b37ed86127c2c4baecc0590b3ed85630f241b77ff6721bea41e8c685b01ced7c0f0f55f0bbe003a6a90bb5a0a0dc0c553f587ce266e61d8ca0c59d1a8fd9a99a4463c20c26e4805c4e7b2e19c2478ffcdb6218db243017af0d73def2d6616cf673ecefccf81c1bb3afafe1643a6ca9c0238ea1b40744878d31208104ae431b5ec0eedb94c01ade91539a7defbcc8f31069d3e69739c591478d157e1985d5fe2875dea202aa92d0089ccec52fb280be33c50f63ee4c5693f920d28f47b4065bb8441b036cbf69bf91aaf565d88e01ae6708b525688271328fc60cd59fbb9564b2891ee2d221d5807fbca44a35f56b1c7ca1bcdfd78fa11369edc5803af9d8ffb02b1a9950365a1e2f56c2aa71f40a343307dcfd37b4c7ce52f0dea6dedf5aa763ebb7c8cdceb9457028c422538c22c39699b9b80b3b390696cb0dd7734ef41a11db4d54d5030aab0aa74aefd9e4ecedd9dfa6fde7e9e4a7e7d3275b09b5fa8422ab568bca1d59b06fe873af72218e4d19493106e09622b7804782ea883c8a11863fdb805c8f259e198d83e6b86f35eba792cf6d49d103e49fa8626942373b6e06f815dc0eed0ff4e85df5a81610047e60679de4e7549d18043296bd0f61e76e8ac505ce9ce1aa213881ecaa698552aa9b727d55322e490a9961226bec7a50e03735160fc5f6746821a88d87a0e33cacb3a253bc4f770cc20f73a03edf5380c09e9ff3a5da4ca289ac75f2df642c703e132a4bb602fe4b9bd34c590fdaa1e4628551ab51ca9b7f116a39a59d7f921647aea4693d9d3e2ee2a62ac92926a5122bb7db42520aa3a1e1ca91783aa2e9e94b58ce538c704181022299c7749127e5b43a8a676e1d8f5f93f373c720b8fc033fc8b4314a1b1c544705bbef968e6577211cd7f221307463798e2d989b4edb4d26844a63bd0e5b31c56b07dd50996618f083cc3d7b1fba001ac7d92d94547ad31b0a557df963dc3527336bd1930573d3997be2a45753218f7753fc5232ebe6880f1de0c09f2075354f191cd91df9f948a2d33908ed67c4add1d90ac7cb9604b4f179039f7f596caaf996c25b9c6457b7c5ba80b19533b9bcbb23bf1b50819e80f053e41a7fe3cb3d7a0202ade08b0d2f6b31fb840ef642f61f4da16fb1b3e05d04dd04dcaebdf1ad280129f41f85dc0bc2f6f6a885dcac01207b58ea1408ae8002fd1603d270a5d445ec8b9cb3045763de3b32fcc7030a1ed3a0623d13bd97711125be6509e214ca12ef1c17a345be68bc715c441e46161df564b1e6212cccf5f59a0ef126777a5d1856839f072b6b7ac09fb5e28304a7264c62bb1cce572ec1eef4dfca6f324fc3edf28d5ccc7202d42ee6cb1a4e8e268b54875c82fae89ee7863264065f56cb3abf8749aa53e710cc2519e63b66a15cef50cbec56f4c2ad96283c6ffc42c42002564d478aa29ddc85dc6d71a41de3dc338a180d53409b457e354e48870eaa62dc74476bab848470f2734edb10d9297ddb395aade02cb343365eb2d5f28c5e16d3805b1e1577024954687cb72b3f2c40c68269eb1a2f0f907e60500e655a87e283de78746bf39d1a89bad28db042e2112126af562e9693917c07207745144a886d56cc5a243f8fa3f7c96e0aba0697867c462fcd22dc738da6a9748cd7b70f892450ccbf37133b0a1e0d0093d9af61f4ad3bdb5caae1a6f4c6d54ca008a7c827d66c791712c1fd64d9fb2c800ca758288b8beb9e04016c7b70dceeeccbbb23b4810c43afe1e2f24a1486e235acdef3165b460373e053c8beb7497d6d3a05a303abd2e3ea114d49511429f1606c1f8b02996b5b175f34123c491f5331f69ba6bdc2367a2c10dafafe80eafb46f09ba068c7e2c1885dfcb64589bdcab926058a0f608ac23a7693b0dddeed52736fa09ede33c7213daa596ad5b7420d285b755f0307ee3241e6595dae297c25bb3f9136423ff29afab750d61f06c4498c338c8335f6a81a78bfc408bc8e09913b005782009c7952a516a88eab5d317f70b9d0b5402e082f0fc4bde1efc9bd21ad76e25fe8e5543860c25d78db56c580e933a276a2bdc263c57314cfd9617727e679797a417346ad45ad58a69a790fbedca03aa8f282f4724d0e1bf61dbddcd64835348be5869c58e6bd93b397fd932b4e66171fec4215c3f0fa8741749df83d67f7a4983cbe237a9fdbaa13f9c05768234b9e259d398b9e1b44caba245ddf9fb3cb7901bc2bb73cc18f2979ff70749f731ce97f51cce7e730491382c10d517ea8e1887e1af6acd73a7460f35be79c0e23c1639769168110b61a99d39737cbf57bf4c559ce324e63bfe5f2c13efbf8f74bf26039af6a56f1e272e51d05d572715192212536e5e7372b36053060d44beec04a9fdd2e668ea86b049be930371d6eb783d181f9ceb5248f33c7f1b8676694418d21878a59ddae69f799ad693b14f61d2b4c4cb29a34e340918da2bfa753d4959146b1dbd529d59be5eafbc557a466d4e9764e1d9fa903a327dbd80babeb1084fe978be286209124b125b17a046e3dbd938510bd04e9d8e59693b6d78e95f07701d3e666292e5709a016824ec43944668a1cc0ddd99dc1eefdfc0e806f796365c46ffc8d2553d5f607e64f4c5d14704c42f8e5d325ba36a28a3c3b66d8a9213f7df8ec76e11f6f0ac2fc8fa7773272b94b4f9d1f40b611e1a52020b7235103d016f9086284b39a3d8a546940536f966fca56984790bc8d2ead0c38499c50b352fac8236e1d8ad25e64c923e5e738340fb59ea1ad7b1a4c1a7e52f2b3dc4e3f048618c806e5d887d49df9c0523b7b2b2db30f047013a0fe72318e2600c71e410505bc834ea7c7bbd5ac04f200e49dc8c252b13e58be41a81dcb641f34ea31cd92edd988d512560e768d5c5560235062beb4b2089cccd4ac6f8f4c320579e27d19f6852db5f6444dd2ddcebafc5b05e29f2ba2c647bc3705b5d05b021152f2520a44453c5ce23f6415c8fe2e6d5d6632c6fe672f45772af5d4e20b1321dd86b52a4109ff25219a116605b0c1f9eb2c98df31fbb159b70d183c358a5ceb5c115c8e1aaab52f245096c13ff821e4e97635c7383393645dd6cbf91bb47cc127e349169fcd188cfda23ce4f54bd24c2bcc926986b5f14487ca970530658fa9fc9afd8d6165e023aacbf709f2e2cb2b0c9ed3d680d69dd2110b9c4f829148d90ff47a7953d5c0f15046135087948ef2f2fc6df1beb60566029b639cb4a188c7388fdede15d95c5bfe9d4179b9a89d4b9e7a1472f3ba045e53b628df52627a7760a91faf87277d554629da8323765eb17d49f68e299ce76cf8a8339a50453895a7bd68a03c34f2ad8ab5e42c8f51b0a2c05d54d0dcd8b86e35ef5880ef54783ea997325475aac78231025c938cb880aa1d5e7d9fc388a1bb4b93656683693fc1cd8326b030760a0947fd8e5d7d3790a10814e3890e723a3473e50371842b284650be2ac996f4db2f38f0afde11fff96b7e13320eb71da46b457c1d4a3f5050d2f541de5a928f5715f002fa81b8357a344e10fd66803c959df1920e7c49fc64aabd7884e0631dd88111b3585a45ce49e413422a0ebbcd1443fca7214daa9f4ea7d0add2714d7e4a8948c3017a113e0ea64612f4fb6fef9a6a81b12ec2bda432c67edf1ecf59092eaeb603beacb45665c6802824fe2b616d2533f3a594c06b0a80e56d4016eadbf3e57a860f0a79ad0e24223bee0132daab733a60b8073f25f1f795074555ad0d5c54512d707d39812f306c5f6dbbd564fb0d3b160deac0e3a46f1dcd6d4cad614cc8d2ec76056c7f895de406359dff0b32d2f35e3d5c114a7777d9e4ab8bd68ecbe3a78384d733b7c289c37de36a715da6004442fe2a9d3bf2ce9484ceda78849eb1edf48e8e1c0452535b56624ff51d9308d3b1fb548f08baecfa4de28ed32a8495c99b18b382caefc5cdb514893a6829113bd863d12e4032807e3bad0fcb0434bf3d4b69bf47925e150321dc0ba91c0b06e8d1b110b4d58070b4f47a6898151507061dbfc4ed2b7cff301bfbde1e15ac9e39a09be26f9029f6377194e6778ad190514e0c38c88f485bc4d555f58f586fd839cda881bf15d566789a5d2fe733ce705d6112ad35ffb0bd62250cc84aa00aaeb9c99003cfab75d8d85ba8418de10fd871586e7c7414373a7458448351322071dbd596e27ce9b3f0adf2abeaa65cde6e7ab6356f7a286da11a43faef70ffdd6e7300f82850fb74cb112cb3b35999705d36e1f00b0667ddd5552961e7d60a377f5d1e15e825d44da2b7afa6e0f2f2d2e7ee827b9419bd196059d87b3d9ecdbe7c033f70c8e5a2a4db15c962213ac8ed255f7cffad78fdfe6659cc30aa3dbe2f989718998b2dbc4662bed55a7d0e955aaa3052b89e79a45415b9799a0e310517d7c5e2aa340db8dea22a513f080ae3b948521f00c5768bee4e37eec115b5697c40d3b05e12c702b9da6a823b9d013d0ab01cc7d0b60bf390d563aa2148041cbbfb9d378ec5911dfdded1ecc7753d8b1e830c71d6876042b3eee3d0a0d87c301a44551a684072e872855a408c288c3fa5265d5988b515df5bfa6773ee7a42f247261c303dda5be16ba815147b79b15e62e42cafc3d3b41714779ad73726583214571f00545e92b361d74f9370050d67bf1f10ffbb0ff1d29e3538f3444a4f02443da0fbac905c3b358aaac2bd5e851463ce05eba1de19f34399d43d73d39733cbb78b6f30d4133ed94e06897bc3542de6d0dce7c8b77f87c612df14ef971847f654295a2447020394cdaa371952f14c4c3bcaf5083fdbcce5eacfdfbf2aaee8462ac132897b7e885f18291dfe1cd79bf7f3d2936e683fbff751d4c875fcd872dcc5f1455de39b8cfc2059c9ebab61710ea7c3eda61c21db5bae8783113d7082bffcde097e0046c0bf8809c3a33fc2ff56ef129a300ad1702cd31d5dcf759506c9f812c7d879e3631c1eca3f97cb1b580bbbc8fc7a291c293ed659cd8bf7435ea8d10db0c2d50286e386bb825d8d7646a7ab773274fc85cd0f4f1f5c677c89839dc2690518fd37ac8ef15f85bf062c72cb43034653f81da5f1a1124f1d45ac18631e5ecdca07349f95481fbee4e7791afdae3d133802dcae9c4880c54b36b353f754c329e09844e8f79bb4b8b828579b2f8a4dd11e4b9872a42c7f4d42c7ed1c522e8aaded4c75fac1b382edd659315abb058ebba4a66c6322c7c30ef7864179f16f071f56ed0f5358d1bbae9ccb0a29599faf8b8b924dfbceeed860fbc9d96e7b36d1df53b4d65e9353b72f305ac4496ff2d9d1ff3d4d4fae0cdf020d7ee64215fe52becff8460b4f2e848d31b86b0b5ae19dd72758fc28e94313fe35adeb3b4b8ed06f4ce4d49e7a68ced9054cd40dc60339f037208424982a5909728fc918ff1d6a12c13911706b22224832c67f877d4ceb2709ea26e0d798be870c55bedb2548a83688acacffcf97df7fc7c9d4a23daad41e01922358eac98b43f0b4de9d17dc905b90aafe12af0470a1c5a09a381785339d0ef8030f08e569d4df3f369518c18f5af2adc80537cbecd5020df4a4321e209b25cece5b5ab5bad1f4c35c60d8ce62fe859b2fd90be008b2d59b4d7014fb4d28065aee54102d261960b1bb586df7ff2adf9b6771b8cbb3aafe4ee3f539246467123967e952511a5b765533cd23832fd33a9b7e0529ddaef9223fa99d0a7d167290b56a86ce5d3b30b96ed727d182e3ebc6e66e11ecd5c5892cd95882aa58a0e33162d8abbc31aa9c69ddeceb99443eda6ef5d1d36d3573421fced48c9e2564374cf183813f152077bbe11daff9d011c0e56a678df074e87ccd9f38eb4a4d0faf3c69d97d37a198ebd2251c2a0f3a04a3563988eb50ae56dc3964c95d01e23e1cdab902bc3877e137ea6b4d1b6126cd7ec60439b2f666b304876237e59ca8188d6a9abbcaf7acbaef8b77a2a8e64d40d8fcc18ee4a2382c1c466d6fecd11fe95c8f76ea876d52b341ff1dfb30dcd9d361f83d8a50d76c1802825f8e1c663176258721c28cc4ec47020f06b2016bd4c47847da458a6acad30aca42c9bd05a6b4afcbe883da601b28766a70c8aa8428535cb4194b2a5ab4b8f394dc6e508da6270de1a242a44337a0ecb31420d7691e367ef0c34eeb39e20bf88561624318259d3657a2a5af03bfc6a62d430e75baf8749d30931f8466a2d3720f4fda98c2ed965aef3091389697e48df1c5844858c85d48bd387f78870f077120c3bb042fdbcacd61826f2192f2e6bc9cc96f2696f001ac1b306ec32f9efeaf175f7cfe9f5f1e7df6e57f7e71747a7a7179f4c7fffcfc0f479f7efae9ef7fffc9ef3f1dc0ff12b22ba0962336b59cbb9049fa84cbeeae49db7692a32d4ad5287a1d7edcd4b21e6ad8386b8cc31feec695e55e0620754622cd1931158f1b69a350d8cacfffea501455b29ffff501695badef32c28122ef27f723fc36c30f881654cdd6f1055b9d97feb5997786817b069ac983732834644cefeca9e9384ff7822d7a52a0fbf967cfa326c4d5ce90f5ae31e25f95d388da7dea52165e51339dd2cf63624bd5b2533d9c8a38901e6034bcf41ed229b619bf4f591cf82c089bce0669ccb622997960066e8502d6da1fca0c4f656742db7abaa13562ae852a5d5542659285b5f196dbad473724c801cdd1561d37a5b03671224d87467e68dd6258ea31d3f275a3c979e456ccfef5b6bc2da33d430ec1780f227e5311c53a389e11e57a1cb02fb97c8771d9a94432a23f797315c993d248582f3eaaa9a86375f5c4666efbeebe76327768eaa33aae24949eaab2c58fd02a5d50e9112d0ef1767fdfbc657e7e7a2307021d117d981a1c1b5d6cb97800720b7cb9906fb183ccae97cb5f6a3733cafb3326d9d6d0703e6fc1b032ee17df0f625c60713ca34639e95ddcedc80c50cce3f05ecb5a37c2320aec6e175c2b687274b093a3956640f6a223a08fdecd078e9aa7a70e807c9fdd2e67dc7165328aa33b7ed2ac66060ead0b820b807b1bbf04d7a8701259effc1c6e27875d617a76c746790fd83ec5e615dad63a3a3acca0dc9d52b3946cc0ddbef325c2c66803d6e5069d793c354a9386d5289d15983aa23525cce57ab2e231417bc6b9f1830646323dc104cf0cc1b5271651c4612b21dab3699c9304e1245a76822b129adfbe4bba5d2a05c3eac4081f6d11d3043f516c6cf78df538732f5d6f69921f3d96c5fabf1e6a54ea3a5a820114da0c9508224e11b4b9596517e4f0f7944d3e9ad757cea10c7b29a9822795727b6a6988584d50ab6a3111dcb26a7bd9c1447fd2997c1fcac1800dc699b32ba6a0d6ffdfcdaa49d8b137726b126f7046811bbc22ba5931dd40f5164ca2df1fb924daaa6ab446049f7efab09ab3c0ca8cef6be485c66a717b93f74e26fda3e91835adb32767c7dbf46cd6878f49f9e59432e0739b9ea07bbadbf54549f52eea9a25917c92bc5aae922cf911af1ee0efe7cbcd6679033fbec17ba829dffad47fae66b372116aa961119d04c02f7b2282069d081b24570aecc06c81869fee35b47fad4b4c61e0f9411f33d120500550bbc347be8201d15b1ec7bf6417d7d02c198c1198ff546eb275f136889483271ed554dc3bbf9dff921323c6fe97dd4d3d19d523190c5834d7853e7aa09b3162738271fae155384042166006c381192b7b9a40a8e409ba0ab405ce8086d936d8c2c55b7a0803a5703e6c808333b7275ead5c1e9cb62c5512034200b85c606ab8d846689055c6a2dc9e7ddfea98471696f1a06e31099228f7b46db06518de98fdadb1db4e3f4c2c5165b6fc01319bf652d3c186f437f51047360e269b0eb9f7b16b68401d03872b4ba0f7161778a78a6d9168d2a30b8c0b0932b9a5b093e9472755f3d2895ce7edbd7612c77ad9835753d9e5bab8a28be8a898ee89af241f2f2842cf838787cfe6d5e29793e7cfc83fe5f36727f2573d349e141f3f2fd04723fb28e447231febe43e469f85aaac90200d7fc37757f50a6f7222f7844678fbc4d5dad0a56c47fcffb55cc86ef846562538ad77bdb999bf2cd75531c7e0959d7b1ac009b6d7fffd8b39d095bdc05d1400dce30b2c436eff48163b266fd5083d3c189e0da110408dfe242382115b80240a234dbde0d8d7b4eb653d823b582ae5dd766a16570a9a8817f1191a831530f6e7ef60fdf4b75f98c592e6a96d31ace26961b8615ea6c07963eb50e9bab8d587a5e007e1fcc7873ae58fe5c7c7ac44fe7813e00d65ca4ab40c6cff40151cdad0814c94ec3984e4618bc6ca832faf23b38f0b90d77f31ce30fda56cd820f9386d1f6285c61afcc0f37fef1d315d0d37e84a46a648df91bee1c18bed96e8b56c3143f171316c7db5e048b6ae5538ce16499f9cec7774c693aa9f7c7e7b0ed4a34ea6b92b8a879ba82ac572c05e8cfa712668c0d2da94ac98689126aeca54158112f83eba2f27ca0c73bbc1e9d67cab4c382aeeb8b7ba539036676b20ecbccc273fc14fbc655eded6a526415dfadeae96a45053b74400c7db744beb0f550858df2ed7ab6bae22c0a33f5bfa1788c7f9fc764dd7d8b855703f30ad840a939f8ea74f5264c98e7bc7fd149d5ffa6b6d3eb65e01bef9c723d10d26a7d28bc65e7ce9e9dd231497e56717e8775ad1802f9f956f74d654b68cc3c535084f5e954cc0b9bb9a2fcf8b39aa9283878b4e54acb36bb643647561f8ba1a197f6a07440d29f7fdf9ebaf1719f9552de6d901e5b225a32fa04d8a64e5c05867cb757545f737d8bf3586f839542776343fb88d91668fafd5b4d20c2997c491fccd4d9e56f0beaf6da6f76b8f1d6b1f78d9a91df0970e55af41697b3174721d2e431d5d21b667d065a0afc880f385b83baddd9e6bb8b8d825150f30b208c2a76c5eb12556906c815aa25fb192fd8a8f8302c8de9363587ee36386734c98638ce98d98358acba9cb31c433d6d0d52081c1b1ddf2103c01d16443425aa40fdea89816ee49768947e5279b293d2567b94f712c873a93d3e9c8a35f8ea2dbe4e994c7201762c7eae69b118f65666fb120989e07e091448da20c8bca3a48e773520ad0997005441dc733d4c47320b8e4af8c2fb8478fecc2e16c74d54dfa418eb8ac531fba7d46f704b4b3059587badd118d8716bfddde770ecab203ebfc68e8bd23f8ab9e3607c2912b49bfff877e29c4933a007f67090baf816ef49a0faada79d56f4dc7d7ab9ae1002ef189d8fda3c01dceb6dbd5761b7c1a85a1bbf4175a6590d93d50f73ef99ae6b5adc9ac49b154d29ac71ebad62c1314a7f4e83c8f1b4a35aea24c077a065ec47f989939003378dde7711bb18bd373fb31da5937197e41f48d74fb3af4fbd9c00e820553579694e3363bd8087c80c952a3104c84457cf2c46fc35b8e35137200a3c1e2ae100f16afcd8985271d6e1a1a2f1c7672eae939f7e1079adcaff291e676ccbe636ebbbde728d113f07f868c1efc4fd2511bb45ee67317ac2e2fa0d15ceb409aeb27976dff5b49732bc161100124190add2ebe99fab1bc02d6bf97f47eda9e9d1da749bf41eb2019b8c7e32767a8d0c34baa1efefa087e8e1ce6e5af73b72d82d57b8dabe74f002d34794d563d3d83dbdbad5bb8dcf339c79a88614995c9d96e838d6e8b1345c0a2304780c5cd8a89ba2fe0a69752b166389da0b9d6ece4c993a4db6d164a9b74e5b5f85d68297cd74e73342c992c2ce3992790fcdd4e2399aeba35e9763bd19ab0fa5a9bda94c51a04a8853f5934c5de46997325e2f6fcd9125c9632e9f7d78c71b5915e8059d464fadc6a4873e0e889d60b1bdc7b55947045b21bca847334141733bda941b65cccdfcbcb2621b3dc3c64d034d0f1db39498f443695c06e38a23436f643b1b9ce49e9efdfe7b02a1e10aafede81953ae6501fe9d8bfee197286a1562db55caeabea09a2a767c309395fc47d9e3b76d60faacdeee113f1886592fe10c830460c95f83e48f5dab9f334a88905bdbd030cefb95a3ac83ca9801f3d133e4386f4f2d52631c1def1e2e46117c3247d36e8761df7c1ec3d93c2d8da87a138444a28398cbfb4e6229e7075af6def762925e576015d5ff1c4738b43e3a7c34f46d112e56d7c645c08f0388f92c6ff2aa16657807a726124a1c84b892ca0f849b55f220a192b727afbcf0a136791181a1164929b3e5644c0211c58e875bb8e26316c1b092ae129076cc891351c0e1b75b46fb1644d90b7f6a96af602a7569d7eafe76d27af9cb3f4502ede19be2aa11f1a9237dc9e4ad44d7408d9e613d51114e3ab1477333990e4ab3c986fcb4595dfe569a3153c0d550d5b956ff978e45e79eedbad06920172eca35992fb616d6a52611c4b809b22ff0febe5aa00b000517db959e271de4b1d0a21f8aae7a7630f9206cb12702c792f603891e83a324e0e0627bee169c49d52616e263187ae1eb48230e4c0930d5aa44ba621e4b573c2bfa7beb69ef35cdbf568ac80716d74beb2b7f6748864d7167308cba9e82c0ffe7ec12bc46fe50c181dbe4528adeb20f57ee0567815c8365f01feb3acbd3fef35c56a4b185dd07e3eda566d7397bd825c8700115326b23a7bb6d6c19d9e4b16dc90c612a4268aa8d47ec2c875f9fafd9defb097b6bc3389eb0564afd927a4903b2bd14fd9e5628f50a45d8ab80859c090c85d56ef2477e422a218b94d83bf3a9d239940a03f3df2d0d4ee27c371f5e12e21cb85fddb849c15de4b8883c2408e7108e4781fd3e5d870c48f4f057aa36ff85440de2f043a9e549b449e0b8d94a1d224d7012082713a36366ac40104f6561c7cd7c9ffd4de07512dd8b1481365a6ea039ace4113e3d70b355ac20b3751675fdfdc94b30a80d7deab3f802d13a02fbf6dda3dc2cc9d059517b5e0972e201edebe2ad97ce2eb885eaf15279a12d8943dbc72868a6046eb920a1951701ca8c6d53957eac446ba213d44979f0f1245192540cf00938965a0565a2deb8d229f179f6c6a0325477bb6bdae6b2c3c38ec13dbb279637fd7201bc4fb3bd4f4b50b81993b72850ba34b475b2274324dba722a7e7ebbd92c17d66b005e28f35da4841a19914b76dac04dd6837dbcb70602804e3049dde2892f8abd5d0904d4d93ffbc80fe6c006182dca816a8a371e2d6238be3275816dcb1aa3214f43cbef20c76c14a3e635feedd9a3b975329f0f6c0c2d578682dc64132832f5d183a281b8ce9b8a4153d489e2162fb8061d45e8e3de639c54da317ec748f0ac21dfef6b94e6e05af55a0a5252046da6c674dbb6466ef9de354e3e18d241ab60e5238ad121b2e34370057b36bb58aedeb35cec51871492d5a2987fe96535ec10cdd77271884f1faa3040a229491265242c906b6573e5ea055771b24f596c2febae6a1b8520838be01d188e5d9b4643b855ad9ee5e1a73e470af2d3a12f20926843da0c268f871976d3f2ba001ba13cdc220c764c9ae641039cc6f2cf3d825d50e7b85e5fc8b5ac5114ec1ccbca75028d412c27da7256d0e18c9b7253e063d54e27f856433d05193ba61e879f426f43280d05b108a7ea6152cc37d0de214b1af5e105068a9a23a53abcd8acf1ade76170ae335efe705dd468aa4c6339a4d8c9e54c0a90da0193794e879beaa67cb9296e56876f407a3a8465b9b84eccf33445574494cc238d0c0fe36da179d8fa0500050df3f03ffc1d351186700b27ceb738043eea5d0d406c92963dd6bec4595f237de8526420e1f1874a33b33dee0e641e7cc01cf21f00f3bc82c27f97bfff38bc5c2f6f048f0ed9b1c2dfe5ef3f0ee1b42eff4efffee3b0be5897e5e2eff2f71f879ba5d4fa20702051216f1ccc242c2f307e5bc663f390e0efcc0ccde799442f9fd140d5ff8a071c4fb563818e414d03c4df238c8f665a10f21a9e5cc858cde5e2d7c80e241e411f9de5906398e39abcafa081ec768bf5ba5df65a619207e9912fcf2d34cadbe4416a3aff47dcf93f1a9dbf5aae5afaa6d496aee3d22675905a9215ecc56ed7ac9317b64d89dcae6e1eac89477d876443bbeca653da4230324298905bb57bacc705baa7e3d3a1fe7e3afec4fdfe74fc743848d3b4b9a3840f1ddea153a0e19daaa1d0108a8da286770d4db57bce8606124d3b1b8e21734cb5c58b8ffbf696db62b0e3e5637abb636e920e12b12b4a76191a13dd3790fcbe819025d29dfbd91842d46fa2164c09be0500de715fc7eef1bd447960a957cc59a5ef0d1f4dde4a52d2a9610db3266675f1a85419d260714253721f65c2a05896147ccd705e02af5bde2e7879adb4d1c6395939a3137a10a19cf0c0bb6b493ce6c19155651e8a2de4f9bdbab99d072e82dd958c48d07c5c4a18dbc840a3c1a6a452c9586e50e45fea6386867dc1e0e01ce4f0edda499b4ea657326fcd77cb81633e915b03718d87ce94a2dca3f5daaf4e1b356faabc19638bafb871cb733ed52aea254a4b35318568733e679a701615bbb65783da8d771ce3ae33b467e36ecebd419390502e0c79e863e9c0e4a9a97dd810bf9f7757750e620c2befea757dc17c97bc88c19dd50ccfc9b57cb0b30642f966f8d2730d6705fcc3965dbc5d43b90032477ea76b514e6a220315984589db6d5b6ae892044bd89d85a6a0636f2b3934369136d0a60e8a1d073078c22d45444b67cc7594abccfdec35c959bf6158dc94e3614662165996048b64a220de354162879eb5a9c1a202f7a8ae8292e16e8b5d85b3fb90702df72e9a87335f4d05173a65b4af61abb5ec740e631a2c21d9f26691dee843c6d904c043238d3ac3a1b6e8ad50cd8ba20a7302b49e34cc36c8ef19ef41eb80ef59ba68e4a8b73fded7a70ebb2dafa758dca68f0b7c7adf912c810bbc1e26f41b48e33a6111635e166f4a4d86e33c137b68292e5f5c413ea48a6611fbe07d580238501a8b4e1c556d62f634bf0bd810289de98d147d30096c9cdace1393578367c288baf3d7b0a55e239847fa59be3ae4b2db6d4f7ea1524d38dec6ab346135a4641a5eb235d5b5a4dc6d9ac6b53bbf372dc1e4433f391484890c47e4c1005bf48b297d3b8ca54c7e47c68a8fe2e4d0a83e49630bf3a0717c9ec88589893bfe997b41497a850f5835c1bcba50d686ac20945bc3aef2063f473623c24f1aca1b643383af41c5b09d6170a38429b107094ccb92006838cfc6cc6cb996991cd8bb26cdfff9dc530dff08786fb7c635c72e7b1c771a76e48d705a32d59190d1fe984b10319288f145b8c75ea2138e5a10965307becbd448e9df855462c9c7e51ddcd9cdb9c57a7ebd723fd6739976acf7af4644c388f3d4e1a6de6749438691b0ab9a4eafa09216fce119207351ae37ef7928c73fab9bdabd0b1cca135afd3bf1cb25afa112e1c67e7e7d5b6fa44d7a74661d61b4efd17b06d06cb20d5fda3a3e8d16d1a39176676e090577bc387e3f6d61198e5eaa60f8809609b4d09451cb0a3b832a5ae156c73207498056ad748129cf23d673ffde7332da07ec470bc8fdfb31223a76acad44e79e6395e1195d7a89de830dd81ad3f149321b384909ea7a1bc59b459c06b92b2add5969784971fcd8d3720f15ba8fac083455edd0b99f1a34888fe8661ad487582b561c39fd0dab6fac5ea58531f2068eeb3c5e8c768440a628d079ec3177d0e51eb5f25e506eda421fc959eef242d8ef5087cad0a76705651dbebb426d2f4e87d8132d420ec39b0f1a68ee6a9c2d636c6b2ceb6943a892ec9f22d6b6adf6e3877cd03ae6a3d39651b7a90c5a06de62f2ea4011a850c299b9be4817b2f300300e54ac90c10f129c213b99f65d2eb2e5a2f4b1fe48e5f3d522726f5107ce097c9eb6d5f4b832a3d704ee4d9b0972ea9e6959a3fc0d3f8760e08b5a2b1ca818e4e35d208d380ab956a9e35ed6f2a3f31fd6ebc32f370a2ad136147d04e3ab35e718b8b584826471117bb7e5306a36f35e10ecd44f911849c0ef862e8222bb98887b6ebef8169a9c11f392359c2bd8dddfe3280e9ce6c29852bd7d4411dd18913dbe14c3df408fcd57f812315c917d7e63a2d399511290307cf5c9be6460820f216fe856663f8ed3b60708ec6d0f9bf244144d3e0e54394725d9af6d1d292734d51b0718fb87284bbdd07372687fc5abd36208346e0a82fde438e9b7141d368b7a71d5995c648d43318ad372dfc6dfbb632f2fa32d6b766bcb4e355b8a10df79d8b57bcd78d9b57bb86d1b3db08b1e8d96f6907798192165e33683261e38667cb8235596bbba6cb912f42036a17b9d5f117f25fea8bc13baf076635f6fac9756192c8d032dbf2c2e4be70ec41920fb786dcad8d47ab9bb4dd2ac964a8ff02f822820a5436f03e91d5b47d868a177ed45b90c59b61a67765a960d54dc38f383a4383f5f6f8bf5a6ba9897dba2ae66f0ef2d7093dbf359b5bd28166f8a7a4b8716fe836d6f518d5ecdebed6575755150585bfc79bb2eb797cb253eef4ffac97559cce0d7f5d57a79bbdade14eb5fb63725e62d8a375be0d6d09380fae382d39080bcad6f6fa0e4fb2d2a86b76f6024cb245b7354035eb7fc4416f06cd6cf93de98ecfdb7f091262757d97ab1acafab1b763d6c9f123c839249df4dba9fa493b3b3fae4f934c9920a5668dd74be72f2d359dd3fc9d6efd0d3c92b58bc1368a4830e0fb6e7e8bf60be251fafdbebf5b6bab9dab26b04f49582d32cb62047143769af37397b3b9cf6d3c94fcfa74fd2b393e7275755b6deb06f156c52f2d19f015d8e9f3ca3bfe852013b86ef6df777e3b3b7fdd1094eef6bf418221930a7fa625dad365b8add409da75851fd869cc88fb3fa09faa6fa299f6e73f8ad8e3f8ea9303741a62e273f7db43d3b81a2af8b37c5b6bcb82952ce0dcb7d5bd4d4fa4fb84da0fcf1131c3ef9e47d498508764f9e75d015c3e4c5179fbdfaec6cb23d3a4ab798303d9be2efe750e22358b2b7eb62f56db1ca251cf870729a25cf98b01c52b080d5bccc3fd65f1f3f87057b76c2f9cf936906470530735cebb22ae73360b8b98cff424be3b2e03237c58ab3e9c734a365e22ca6e59cabbfa7180fb490f6d9b50fe5cb4f7429359c3c7579bc7652847e9aa280322d655d41c8a6adc2b5dd97ed0bc6f149a3fe662dfdad9fb774eaee7a0f5a1dff8c27832c81eac994a6f8f767b3ea0d37473fa63b47bbc8dce03e1ae8bc287d51bdc96dadd0f5cd7dae54d29160c33120034d3f3709801d2e9ff78afb42aae3be14743e8149942f8e4bea9bbaf619334fee31fec47cee620f6f8a2b7fb6f00bc10c1d9a5d2ee1b0d5b83d52b8d58f52e4f3617c5fd91ef4b6dd264f927418b5fc2b92be9772ecc2f8f6b51a97332d86cfa168fcccbef05426539a5c9d6b5317b86ea80f012951d2463df7d68edcff76c4739b041eec5067ad6a650423f6063db1d166cb65f84d097c1f8f269355f0758d0732f8b67799c0291557eee986ebd62ee038e84163434f7911d321fd31ae5e40901466565c3f0923810ab0c065995182c93328b96cb695d967b7fa5c3201d26e8a45b542cd037c30cfcbf3bde0705ffbcd324803453b3df16f560ec2992fbc2523469e391d4bea5073bd7f31686badfafe7b5d890157256f28edce6ebed08af7b854670fc706ce6267cd6787f172ce8a6017b7af029c299c4b647956da11a9b49f9c247d5749f9f6a8236035603b841de19e26dbe3bc71c2b1ff12bfacce1edb0e8f12f0f1bd5cc57a730813b287c7ea8da4c261c121f52772a1f0e59b421d05aecb4b5d004f7790e270b0cf7b36608b96f2cab59e641dd372e4eed6e4a0cf3f5b2d0d43fa913bb4e5eabdb76d00f2c0aa59fc11a09cf73aa90e17a07c1c4c820c6cb279b69ccf9a3e87b03cbe1368e660675a474c76ea5cbec53b83b375acbdab7f6e4a5f55eba754bfdb8dda7c2288657f360f1c0da8e572f52c84be97e569886c8b64eae1a2c92b76ed9ec517fb157b91d96536f7205812a0552fd4abdad7757d5bd666592cc39fb19c336a5b2abf285a3a7765f02b0ad664d5b6d6d35bb78bb59a66f2b3d6f563076a04eb9971aad1f6d49e60c9e3b76feceb4d63c7857db3cd8d9b136aab68ab273cd2633c05f024458b14f8897ed62c45a251528e2b320a4909cfc3e9a46c4f5635489dd9c7af94e01c2252ebee2bf086e7bd2d76bbb8b0de73a0bf6c81b9df70172e334da50fef6830a86cdc9fda31f3d570b7db76ca39a32569393ae4284de50f2cab079e4e5fddac629ef836f5e93e75cfc8980d4cc2be99cfd1ce6bfd32c64f5aa27d8978ba1878cda7a973bba8abbfba51065e1e9bd141e68186aed4b7db9f2d58575fc3ce2c575fd814d1b343674a8429aa5c76406d0175f4ef16eaac5afc505cf9f8090fbaf36d4525e34bffefdf7e0335f84804826de5685ef6e459e243db7118bce778ab448313d626f4eaa81a5f2f15182ce4813a54b785829883d4bacdf5ec0a6fea760a04536877de899e50dc34f4b957d321c4e9696a1ff55ae8303ee842e42a26cc49f16e962837ac6beade8511dee5a69839bdfbfdca51099b7dd742db0933e28272a0cc42aca2161bb866476a7e6fb7c1b083a9da0f574e26fe98f9d1f918b10efbe6c12178c2b2cc14737fbbddde55c894b8a7a308981a966340517a0dcb156cba0eefad6ed7ca1eae4d3970da6047ba3f9eaafa48c6f18c76d9f92de0ab8ac32155a83315500eb80b55bc933d1afbc072d200ee71f2c302c24c46dc34a94f9027991b87da287cb789ead2534a74059f2b7a7ed2f12f015fa9ba53de201cb7a50add73139e04e75c2063514f59b0bdc61cb26968243fbac721ad9697a460a35165710ba1c228cd0a63a612a1e1826a98cafe9eb65b9c7f236aabaf1deb1c508eeca94acef3fcecaa0b552329b0f711eb836057b5c104aa8240a44a04d5b890b3794ff1301bdae98b8020e13055b99825cf3e3a7dfeece4a3a74055fb54f6e974f49a6b0da6d6c5944cd3fbf10defcf1b8a4c38c61b691f08e696063c986078691a8e61c3d1df590d4f52ba88a9405459cd690630c6c978b23e14406125d5b8edab361c0088f04bcc1ebcaaa2c535578be5548fd54851ddc9eb699aa9b00a5d73cf8db603d377c6339eb7094b6437014ef3c0b7425e4e889794b0de79a2510f4280d08a87dd84f9a31da20421bdc189dd4edd3e504e543f5ab0c059b6dbc25780a63da1823c07e753bda11aa1b073ce6300ad3c55617704047d47d77c3cd2057bd22102e7c91e708747a7d6c3a7d2bec7f33b08111979831a5089f094d006e383c1414a683380269a243a987beda6685408914e881cf141f3dc4ea0fb82ffe170edc181639688218b6680b23af38e498c728085e8195f63a1a87a4fe454be2151705218c7d03976abcbec7b7d6b3ca89800f8f8713bdeb3c5c74a4bc8533618a866dd6e10e1d305870a24472bbe0719de6982dcbfdeefe930d24bb63b7d0b8551da75268a6133baa0bc6c77300d9cbd85737667a379ee124bba8de0e2ad0a28d36c6a14556154597e266363cb22925633f138d11a8488bcce3ae40c635548180eba32de53e48dbc39f10a6ce52da05daa296fca2962444f83aef734d8103f7a831f7b5d43c54799c4eb80cd456fb1386a491ce708b3b9276b0665afb067cb9b6f516deb7dd664c116f5568aa1a0d1486a49fba3981ca953968676980d3e99cef15bdc067953c367a0e0ffbf330b20c0e57af33919a5aaca9f3282c38e26c696abfffabcac32264a681b0e5b22d0080e8acb4df872f37fd7088e316edacbea7c0e1c998e26f6b2ebac4d7e11d1cf9c13449c9dd5c8d8a9d7c9ff803753719bef515a67e426b4afd6b0f07ad6b8c8ad56d094578e58cbc2a3c28097dae663cffef80cdf27c645bd051c92eea1c03a27e32070f1c3a416bd3c11a526803e102af26a12c6c10c0755b77c6183ff8c4b78a8b2deac6e5e8f095868d513bdb892d2420df3410312917aeb41cd5650200fbfd86903cd7518e48c1a0de5cd14ae1dd41b364a59332e0a9ddcdcb56e2160624c9a0e1e9a159b24a100f75b4ec0d84e095d4e657cc1b0f181d9905d681c92de963b4628bebc7342a79733ad090d88b4414c00cf60684f6acc8972973139619696c78f6ae836838256e5a11cbaa64e43a0c47a7bc45457bba3027724ad73817bc4f529821ba7c681aeee97bec9d75e8b524436b57af1fcad9b395ca1dc2bbba18b41e0b6c019aeb571401af1eb413e46268b11fb62d205c5735705b50c8f3cbab05e74548df6cd9d8e1192b1a0165555f07b9265ce551f491790050bf344b65bfcadd04e4d1049e1d9396223da7c37cfc0f064960a3e8082c683d679fb06d0a15b7621c13e69ec6415014b2486c1e2c390fd1e12dd6595fd7551bf54659efc25c37451c435b73908bff2c2b2fa8ef5d5f9fce8945735171f85998f3a973bcd7414870ee1ec13b7dbdefcf9291be2b6efee660829bdf42967c1e6bbcf80937c8a39cf7097c0596c8ecb5f25391c1103111d2e9a90733c6f2c8d3a804ba22764b9485f161dcd6a10f185b6d18c5dad93042a81b695abb54a09bc2505f968f5dc4d833944e9ada326379440bcf1dd08a81a1bdde22f27efebd0f0ec918de190c1f1245970eb988e3c16e5aa36904321a44ea476d6e608de20142a1e497670bc118e522c44c6fd0aedabb5af4881abf86bd4400117b5d315f16b89b60354ae4a2526906f1b9f91489393705247a7d1f28c0ccc7414c1ad6b6abcedf93e0c4cb42356641f34943358c82b67e2576b3c556b03d1e44171576339d6fe507b68ac60748d3f9750f52febb9b7cb90045f5aaf3b54ebe659571921b0fb7c3969d58592e24e128ef4e08e36638d89e73dcbf0219e8ac01fb276e69123bdb8e2e3e6d57298f0af44654a4c929f49660595a13c2bd4d4cf484e4a485c4af438025c1a26e668b24fb7c82f87f77ce5940ee2cda385be7bbb3ca4acf81a1cef36a8f7dcbb40945837a823cd39d3a19eeea81c33fd995fe7156c704c33278eb088e675528f5b438e7fa2e39e4a0ccc112a51e4b8c0d7f47c5183f2af719ac48729147c0927d82f588e62798a3f5d58b51bf66423215dc944450d3f8a8bcd6d31ff827318768095428ed12c986a2a18c83d55700bb2a037b9c7bace5482d4d899f6c69eb271ccaaf25ddeac6e37e5ec25368f4c1dfe7da0188183ae0ac654fc585a571f941ab7160f3a1fba96b9253ed84d6c5eceb61664dca340e1c0ddeefbb76baa1072b332f09c6871f6b528a9640542452310ab210d8299432472311366d735c18b97f7f8af2a3d7bc9334e38a47fcf97eb59b9ce3f1e7c7cf8b69ac1a182bfaecbeaea7a833f4ff0a23d5ca0c8ad5a4a4ed7a4133ce7c4b84f7d9d3732be70ea31ebb6edf8ed1a38ef1eb586684e375d8f0302b6efd769d70adcdcad5bbc8e71fcc5fa1a18945ffe06dcfee7f3e5c52ff55f8bb90b5219e74521ab5baaaa1b3bd5adb734be6b49c4a7d7843dd59b8cae5a85ea976bf662e72c99db6d259da924e1147e015eb0db38c47f6f6af5708049d7f163cb7117b8a750ef9927ab655d91717d715e2fe7b027478c72c3c188100efe32bac18fcd12afd5e6e5e56678f447f8dfea5d42f36d5ca8524f6933aea91727295a258de49fcbe54d4353edb375a007c9d1dbf2fc976a7374be7c775457ff0436550d5531697474b3fce7bebca49fecc95152738e4b3bba018eb05ac01c1d0ca0e6aa98a1e8393c5dbd1390e02f1cf6f034a198a58f37629749f1564e7e8f006c432f6c94fd45fe0d4b7630a8ef8e201d58c038488feec35f13b293e7875194f9d789a42f6e6f803cadde05ef627eea257d8c67de4fd2deb8b37a974e8aa37ffec7b4ff11bf8ba19a80df44c26b343f7cf1f265b6567cc2a09b802fdb35e2cef69ca2986f117530f226e0813f1282b320bd734de64dad6853af6743391c2f57ec77ccaa40f6978ebb96503f480f1c19da33caa0e888a71ec5e7a6d3f6422a31e9a255cf6eaac5dff847f18e7fe0d9cfe7248d987e8eb46aae3fc8ac8621233a4864663477ac3f70ac3f88fb0a3240e3531cedf3b900b34aa1a9bf1f67452ecaf1bc4a5a9cefecd7ab6225295d1b08f1337e6c54518cd96b6463409c642c148e9b1d801cf0de30fb64a4109344fd1c2900355d3e4761b128d7b68cef1d03284a87b6c8dbb626dd10a2b6dd1076c67750708705dfe831ac9f24b831f512cf118de8f05627fc0f6d0d8bf0b6ca0720276ecd6c0d6254fd0dfdfa77e2641bca1160f8d579cdbc22fde1a28c4f26613f0e751cc509d008a7234b8d3f476b0ecd770c870c3b96c3f9f05c730c2042dec32fd98109a5c21038296f40954bee7ceb14d1881edfc2467959fdb34cc6c96979930c15bfb8e8aa7a57923b5a385390f0fbfafbbae6efc760138878c5ed664958e5f9ffd9ec4fe5065d177f4d760c3382d3578bec1a92be72afc011af62fd9f2b9d9b7a3d358890ac8079a2257279eeea9ae4972b860395e2bfbd03cdc865307bbd8c34794064bb587e293202ea0f820240f0801f7bf792cef91fcb79853a134c5ccbef3f57b359b9f89e8ed6da667c4b94e8473cacf0d07c98f18a42b41f1e3ec3279627cff5059e3cb37b561c5eafcbcbfce393e2e3e7c5b393e27910cc5d9db050d0f682cefd7696b1607e91b764d1ed16b225c95227641a2306ef72be2c3643c2b0e5aab8a836ef87c7bff711e2254d5054bf009707b614b4f615b693773aae794a18794e0d353df8b80e38a179b5ca13c36625ada1dddbab994ee765b1264d156dbb7c6f5779d49936e0504166e7bff17cdbf2d3d8e36f97fffcbc35e36fc46f86794e03c2460ed25376d78a60b1efab3d48a8fb48c8254df615d032745cec777e7b5dbcef8e113eeab66d433ca6cbb67a683760375cd455bc19f3fce0e17ee24a7431d1d8957b6019eedb0f8164b4e3c3f7fccdfa77edf29ebec4abffff82df7d825f539e6b13e77800add29cc90a853993d126cb1de1d04fff63247fa82ecd1265b8a664f729a6c68049460dbc6edd539dd3d11eb4ec0cee15791acdef2b8ac064b183a310c1acd087d0e97fe072b48ce851edf0cc13987a024d32d70b8de2f748b13bdf2be61eb41b4e6bc568d51f8707fff362bdaefc2089477ae3572e8fb2446a1f24069d25ed1481b56ff157c5ba2ee9b4eced5d10edcaaeae190aefa058f8170e2962459c0f8035fc37434e64463f36fc4b9c01b0f574b8c07b5ef6ce12bf9ea8288c16f01ee8ba7520e5e768ef01685b67bdc79f59c5997310f87d15d910381c972a25133f39bcf48f32ff9501ddab89d991b64545e1b7c52a12bdc47ec6dd56f22db1f3a8cb171cf3993e35c56fb455956ae91de4c9658717cc44468a1372a9a42214c9667a25670287e208303c5edade23357b10b4ab63085de4b22ea998afae8bfc84fe9cf5263fa5d32767e44c4479cb13f971563f418f235c04bd84c8e210d04e7eeae1126d094f7be3ced1c5a42ca6e93179430139903ce8ec55571d3f493f52ef2db0c6dfddde444527fda3699afb1a521870fae5f5f26d7ee7ce80c41d02d99baaaeceab3932d0c935214ca23706c384080d066fa8ebef96eb9b62fe6a5d2c6a72b10bb2e86653ae5fe2ac615300fdc8504efc1b1faec9a78301d7fb01e4043808ea7c9230e70983fa1efe03fe14febda993a96750de00215eae51cf437b948521127de9b2519630602ac87f3e3fa9be28a81a89ad1409e7b34d6f80a7c95f80c28b5d0c05d695d058a729ddb9b93a59959bf1b644682279d8149954d3be743a7a607c8a51daa17d0b0f4b033b95754b442c314539335a087e0fc5abc32612fc96092d08d0b0822fe6b57e78678e659ea969157e046f9ef8011a2633f3e6379b7d8dc05d4ab9f03d335bd3c1d6f13758f6be292450f4289326877d05ad76bbf1a5926cd106f973167e610eebf6aa9a899e5ad64b1f078f1a7a165eaa453e5eddad35af431e7665aec5dc543ae67e8c2bb5fa2ab023e062e33d5785e69e90aeb7c91a8091e0dfb3d024775fe3055a3b8465367bc0dfba62d8dc38586abcb71fca51b5b30e2248e0089c4430f7f8a60452775e8a1b0c36fcaa6fcf37ebe26263dc59c0a67034d49ac9e93582141a7f8b51706f8a77bd8146728493f4a8a72da267d0b4efa2ff3dc5f1021f940ec570cdeba16ec9b48054a3dfaff924358a48e022d64556d59f13ff00f2362b77e454ac72cac740cfa6c858f878808f9cd5493afe74a88a3862cb92f1e9708050f02f193f1d55fdfc29df2548abc2bf24b405fa798c4854ac0f9ffc26030d58c83c4686489860c61536ed86866d1f35dad6aba5e481f6a9bd4e34d496e60424416bfd84c09e44adee0e6887b64ef931c3b2a3d2e27b20f841c3522c7f8322b975b8742ff230a610da7dedd702c42e5afd0829f812c3dfae0d4d02372fe3c923e5b645d1bca163f2164066e29297883d99cc1307e3e5d6440c799fe583edf68d5762e04fd6de9be91af86395668d0657d8a2398772a97d6723e796059d99aa31cd6d0899bd5406d0e817ef07e7b9117db053a0184e018cb8f218c2b0dd3eb4efb378f40aa59415ed0d070c752de1fc54211a6ac06900c195587855427cb45998449a717ead0ff50a6d9c9cf22500c5a142de90c8f3f00e063f8725a158a309868c4a2eabf9fc7b698713e6e5bb3fad976ffdd74bbadd956fc741f2379a70ff59be0f306169db1290f14fe0cb17357fc08e58be95dffffc1acf1cf9bd5cde24148e8d98380c7978c78ae46418ab84c789fe823521c0f3c78e5761d872f3c40793ec5c3d639b9e163e6926fd0118047b205b4741149084dcb7e2e27a8ed5bd64bc29e7c4db129fdcbcdd5ad8c232ed89b602675b6f6f5edeca8e6b3670203422d33647685d70bb71b26bd619f88731f8e8e6c0daedaa594560bf4b176c22fcd8335e59bd1c0be0a3f3d3f409fe7a3aed9bcd1a9332be551b512fc9829098f94b311c264f9b5b1d6cf0d2c13d2220b688ab9aab65dd137eda32c07ece9bd7be458e6e04ba5d67b70c4d92c0428cd3f797bdc45f1124297b27b0126c522daecb358858dc3ead0fa0562f813300f20e2901c895cc8f3e8f6bf5be66f1378d1667fd3ee84858211b71900e5eb47dc546bbdde4ca7429ebc6fd396f6f7c781cb476680570b502b1d49fb670db2664aecb725ab03838b5c7ed9f7fe376f17bf0dfb367da00cb87630457e23d18aa8acce15b9a7b8f605f03587414f9050751b26daa01a4b146ba39a51ddb88820313475892f80c75feeba47467607cf5c05e02b4bee841bd740cffc0813ba403de1ef6911def24613d7f92098734f5f6b69528155a9721bfe7d834d4dd1f9e8aab46d1c30cc93dd29b3c1834fc1aeee6b151b049c7acbac9cc359174f720f338daa5c34714dae14b8c68bac149e6cc6a6b1659c84d4c6c1d411bf43e798db7f9f85132d3bf9109d5e4e1206d097625dc440311dc85f1bd1c94aebb14e6357778a10e3a8c85c5b869732141908ddccc292919b78f7b83e3c1e913b35558d777fcd1297281c9d0d9a4204786ba917d8b6996d13007991d4bd322245330343622b7394e481ddad362499fd29f9c0e06a87c84014990e7dcb6daedb640402fa7f52b514312e4d9728aa6c19d3ec7d7d8fe7cf42f14c8171c57f76f02687cf41a404e536e347216208768d389253797a423cf1210190ba7d369998f6713767662398f8851454a8edb07adb839e4ec7e7298f4258d303946597bc31358c828b2b7dce3648f120ec2f7a29e36dd397a363c48f8b9e5915318b3dde48437ab195b324d9b4f2ee4ae05f045ef58e0a7dcbb88446d5e4bac48fd0a54e2d2860174449cb3fb9c0dd49c1d80341eacb21266907176895713e81a7b53e77b1e8fb112cb44301f4e28656ab530a87293067520817e4047453dd1db4af975f4d4fd1ef80b086d0b571c0957605ac8eda70f410019bcbc419b47edde2d02aeca4b35f7bfef8d44207b64a06e3abb4167e7f4d477e49f0955357bc211cbb676ddc408aab33e3f7a07562e18d8d0349dda00ca6943452319e101e1600b552d0311ca23ee240ead3e65820dbdac58845a39307e99fa9ca28ea036b4c58382bb03e06813f23ef31a521e2a4c31229657575624ad37c5a60ca2d660029f8c4b7c2595f8b63067cc613eaf31102dbff8c19e8d71897f027910daab381d383f7ad5f832f4250d061e6524479bdfa5a181caabb765195d2862ccba0c50332b8b1abd3fd870c354dc87c40529a9dadc5fdb914daa9ad3bfa3a8991cf5e168b78f8fa786949961cbc3f61bcfa88bec168aea036655bef333632c99e33f23812796cff90f9c78f55ba4329c278deb552727c25aadf9cd2cc60ce61f1714849ddb5bcc72f88f3f701439fe13482c2293e218a66354c2a35e7b44d43ab6946439c58166c594c5cd63aa4c9f48254e04197b6184fd69444d386771be085a46dd1a9bab55b9be285de03810cd66d983a351df22eac76176bb9600b75c6859e7d492f3e344509f9885986abf596b434f3477909db697486db468dfa1d49358bab8703d5dae23bface9132addf7298d29d59b72a521764c927f857accd29f74a34fccbde4e8c4fdf4ce4bfe528a46cef03d68592b53327c3b196f1eda83662f45d9a36809f33b17ad2164b537584ef59214f31ec141957196938d6b67da117beb5ec7e733ddde6ee3145b4fd4cbfe9d776beb3861ecdf1e2ebe64e64b2297e902005295ed56aa02e1252be6f160289389f87499ad3f1c2fdfd1dada81f867a1cd3c69c0b8cf8ae60dd0698022566498f604a64d85841d8f1b109f91ed40e19f808e7dfe45d451374a2bc0735785d4cb31c61cd717ebe57cfe0a48697b0ed9bedfed01af0182aa5fbb5d9318b8267ac4f0460139c9ef90072e0c2d5d39ec5ae19a23856fcb1c1cfffe886e252f96756ff5847efef0757af2d444dabe7c176f26da6ba3102bd0c0865c33bcfb0e494005e2dad7b36c7df98ee3771d9cfcd41b0f995fd8d2452f1ec5e947275864d1b027190fc5a4649b1a33147e30656d516e17f9c9afb7e56d490b01ad158bea868822994aa0fc52e793990b06cf4953c60eccbb4b9e24c389e1f001750c2f49e5e4c063e766c42898622e663781884e45e1e6796256574c473473e0dd2eb3dc9f4c1f3e27333e7ff714db6eb155ba377c0772669fc783af814cffed3404eba7d03c10f2323fc507545f03740ae6009e12cf4c5da3f40a7f60b0c4a9229b618e79cd1bf1b4e95f347f1af1b06540dbede968b6bce3bee85fe03cc8249e4ad1bf27943edab7bb09ea54b02fbb994d64a8168c8c7fd8953871c0d032a7ddeed15130513ea968d4280c10a7432dc8f0e9cf76eba6311879824210906fe482784d4fa7631e654fbff152807f3f9d0efbfacb1f69c40deea6bb3802da57b8997ae465eb15eca8e5edc63edda0ad6603d0e931d0e31ce77fea2d3d8037b7bf8bafde7118b66a7131bf9d9524e9caa3baebeae21a637ae2e61083652c2a5294299fdb0f340d2019e9c059051c858d53c3b9954947d4cb446fe1fb54629a4baabb3497643ac5c93a2068964a3bb5197fb111295750f111330c0cec6e66b189b0cb910fb3fd319894b84bcd7b4a3874ef4da6e931fba9f1594052a6696c23e51b798495142a9d98f4f86a62c3c25c971b67664851c451909d4ef46adf91c09edb51350a147263e11b13d18e09a5de60cc6797d5ba5423bd8c1edb88c912418eddeae0dd014add0d9d9f982f45876068cd443e3ec966b0c55ee9f21d9e1cac15ebe0a88f89f60b57e96af803c1d5e33acc7cde2ea8c04c6ff9a3d4c148e629b71be40c0a9dd494a338217a0fdf095b22db522cd6630d7098dbef8f1064c7c5fc6df1beb6db7a4f7258fde888802053a6343359e736391eb1cabec65d9df5ab05dc9a5e5e540bc206a0e4728ba109806504fa83e59b727d3987959ac85b27f9cec2cfbf47dfff983a3bbdfdd714238b5b796c07366ec10d6b08b8ddde6b4f37344681413f149f0239a9a445efcfd7f5a9b112b40a7dae47afc4bf2bcb59fd4df11ea8f50303311daa26d8991b066a4de15b03c534fbbfa5a550d06a236e65d4ae36b87b881fb5c3e1b00fe7a2e682cedcf339bfd25181d3b8c03fa202780452641da084885b870ec7e44e9d3e264ed0566e32b87fd78791b62c13af5cd84dafb5e784c46ad57b62f888a02ad1e282280c2daed7c3625ab7aba4c9ff9a881c68ef3885ca7506b268dec671879491abe4fbda72928fd1ff119b26ad297e44d19b7dfc8c2f71af7f4f0102284872ea7c36bf54fb57c50a71d9cce9326c4d38e6efd1ee40fa7d982c6777425618cae95dd456ded13691140756a94cfb43bd1da1e40cfdff34c2d74a7155e6c1ffb716d613ad2db07974a0580c24a8ddb52f43e6975034888d8a726e1bfe424d6b83851e0e3cc7c1079a6bc72d8a07e1c48a804e4ba340f40ca82d60b958d2003a93bded56bf85d813f7b6dbf938400d473be34751d4fb289af340e399121cc557cc8e3027221ec3bf148d2bdd9490b33abea3653d27f32774b28d9c1db2211d8b56230b719127f272d091980c5892e3ed95a34b03253ad20e7d22a16b5696bcc154985648c3007a74fdcfe5ac454b40c4a4f7dd3d261bd62e83ef6a42d30c6764c3996a901c74c30d11d3ee6028b22fe16304581d76303d196a084f29c1301aa9894e0bcc4d1187149f296beb775db9de54659db917345e3907bcc572b52a6731b7dda20650f78f80c8e57aed15b25fc837fafb6c1c80fae8bebaf88564502036197ec49e9078148effbee488dff43684af68517ccb492cdb6e03d90edd4917d50291c99887bbf1f3fec5da7d9fa68adf23d3388c0bd8bcdcb576d22c0eb26b264ae1fcf4088bef05db31118fc73ce888aba898b2bef5fa74f474cf400692b1a92edfa31b3a5ede89916444cfeda63025ba28c9cf803955aed6d96849413d1bb513c08de5fc4dd9d6cbd4198dc81aed3cac73d70020dd4d0544839e150cbda8a4d76f3e4aa047cf94e4a8a804594485983fbc833e15959defbd1f5c3b438bf192fb3d171fead58f438a612b4ae9820fe39b82ec801769389966e6841a86faaf7231b3da2f7b71250fdcdc9ae394fd4554987e1c6e78616fa2327a3dd6c03c0a8820dae550aaa53def877cb5dc2cbfd41147f82c79e33d783d141557b879f9824152918ffb8dd87fcadc901bdf63d03393d2d3b489d3c8d23d5427f22fc9586bb6357d8f1ae7ee7d0b97de377fb9676821b77bd41546ed10769af2bb546cce6c70beb370217e8a950cd820afd1d904e7b573d71b4f8e6ebdecd2f9641e6d88e3feeaf6f2dd31e9b57bd11e87f3203394026b0efd8c49361f46bd51e22ef54e98ed0a5dadd1d221aaa1e929b3b9512ea619801e50221ad2e0f1951e5f16d53cae8269eec88bf238d5cfdc9dc9519854979edd89f62b2425d6a573ebda2867a1c5728fa0f86ef349a2b17e3985fe3586307cc412fd89763e977cf8f87257e38eeb0a357c7953e1179538be5dd4d7d5e5a667fc25533410b1b07300712f94c5952b7bf8d0df6d1c4b4bcb4e348acb724c3133046f6503db19089937d2c04f65a62f45d309cb9e53867361cdb57cb4b971e3eca312e9f04ef16c78092c46e772d1edaa694173c1b94eb7cb837007951dd3d0b6c07f6d8048d7941c1d5a76378239b8932ef77b767979391e6870f7a08c37a01fdbf4a1fd40fed7dc74e138eb719c30b135a6c338dbc7a9638d0d6f7fb5f237093919e0dcf914d4e68d76f88d6fd8f1af029b667ba05f113fda049634c1ca3bfce56feff998727d3ad17756b25a9195ba2e1b7599faa67885afd49bb65c97c5ac7cb51c4618b7592ad279a260cd7c4431adfae094746feedd4d3650fd000abac8acd326001e4d1f1d6d9682928d6e46cae49511a7d35e9ccd3f508f92b7aa55481f8310810ab9dd63bdf6f6b2d9d213d0382e00aacdbdc843b06e6532b5437e2a88a389228a53d5e41218e2fa3a51951e72311a22763732e338e682b9497286f0dc3877e730b3733af6c658a696d86d31aad83a76d669836ba3db277a7ef25f5438e0e2b028257b6839c99673f50509fc5499d6a4d0acb5c5d1ceb849dd70f46db5ac4cefa454ee8732f23ff90a89cc49c2181ebe08934b6892c409b192917dc3dece6107679388378bbcfa6b3862867567208719b77cc04626f8d14ffcd546c277ec4e3dc05f5933ee376f715541386da07ffdee3f087aa8b711f0db82ee117aa0720982c2ed6db2dbc59b7ab61de551dcd389795bce733ab667f6d1d188ed29284b3b217bb79cae9fd0e0846e3398b886e51c99e5a0da61a6df300e75dc929c8e642cc87b5c883629430e9fa200733138fc1c1ab7d150897347a16c78fb85fbc1194e1a74d2b7698c480f23110f6c0f16302f4a3ade89c1a7642a666e710623dab41dd384d1a28263fad74b5514a84f280c0850c12d950305ed8a86911861a0ff6dc2560819fb57d1e31e8cd88b10dcf55e1478d81b020c897a725bc47e1d1f30a8d2bb20951383735a22061e1af88e764db3f6895e74647c7591f1e546cb3b24d250d5f5579e5f12d7ffa3e87b0ffbd838c9856b94cd1771926a043ca62edb1d54f271a2873b9b2a90f697d660ef013f8a2dfbeb394cf98be5dbc590db908b9d8cd2ffb2d254028ca4be626b66c91110a61972335f2ffce3666e6947e9dfdf6e4c0635c619d296cf93e67671f005515aff467007c0723af4872024fb79321d59c936d46a92fe07cbb5ef7e8ac2d6b032512bf96867e20ea0a45c3718bb0261693af57b122311d36fdd8a6eb31d1d396adb095a0fad1361af2289880d638279e2383cdde5de82c989ee8972464a4c7a69d853b1de4426e6ae360fc2764ab13fdf14f383fcf49351d44a6c4420a6730281af67f882e26ba9df0bd72b6bf610754cbc92e9801817d79a7635d2ae384a89ad4ff24b0ebb69f976f89f8301e076bd193e851fce7cf6d3c1c0ca0040a18af7217c334f5cbd58d694a1307fca27f610ff19c5879fc579cf6299fd84a1dd0da3b86193a9dc584f51114c97f7b0ed00d2d2d2806c9edda879d8ae6e31cac51b09a89ce1e3a9cd239dddc2a8cc83af8b7951d7789706c47af3ff9e3b5c9ac6dec16be8c211690be8e351befa590d8dae836870f78c43625ee3588ad82f1eb99c5c1977b4f864c70031679fb80247e4f237be2c1b239d401b27cc871658dd2c0015c021ba507b00577e5b5cfd138eafb83c66b335c849615cec22c0bf5fe4079d0e4de5986ff7fcb34f183182ad6461be960f57a004fcc295eb74f6c112df3827a91694153b967056a4ae369d7de1924941215fba0a7b7a9035e052119ad27412b238f7962fd81817be6a29cc0f2047061cb4306dade38ca0f17531ab96a607fafe2bd5b4adf002fb600c4c1ef293b3f5c9558b52022ab53ec563db367476e1d5251cc7472299d151d508f7a7e11322e33368986f69e9829c225f3b393dccd3cbf3287ce2be07f7ed9e0c14c6f73b3160933b464525a2cc9a8963157d68089ffe352897a40896ceb93cda241bd708200c3f2250de3de1ec9ca321f7e844cdd13a14edcdb8bcb091edf0e9ff9b38aa5d16bcf4c2f32dd503da95f74e06bc879f246944ff563704ac1c143f4cb69cccf5c09805b023101b7d0e7d3fdc1f8c5b41ca0e3ab08334baf5773843c0d9834f0e707bf069bf3f8ef0390e79ab30dbd6fae1c02ede68604ff7802e5255e98890ef254d6af319bb5b71c70a80b8738ce6b921468f3ca4f84d08be8255cd2a3db9d6df18be9c5a169f024810efebf8b694eb57bd85e5eda177ab2cc8b1d9aa9067f2e49361a448b7ab69d750f6117ba663b96fa04e1221718ca3c69bd69be21d7db33478ea6e65c520a1caa5ee180a0e5dc1a173b206c9cc437345e78694b9e81e7fbac1c2506070ac6631aea6cc6930ee48153d10644411f9d65c4205da2ef8d4498a9a60ce5a0ef0cbc90212f1b85118fd286dd08dcc2af19e7364df7261d9b9a4295f441b46fd413283fe46c3b2da22f5439e08b817e01bee45025945dde637c52fa5b5ff81350b17d13aeb6c5d25258e0b6e26dac1c77e01140c3284f439bada412f38d132e76e22646ac80e717e4e5d317a92c46e2e547317b7d0391581ca35a57e142ddee747a74eeda4af4277bba6ca814fed2c519ed3aa1b9ce81490ac69f45aca2ed57ecb2b79e2c03e23387c6ade0a5db112247492661198f47a2a7082c43cdb9e3152488d7bc2c3ec637998b403d73b3487ef8e8826f90682cd80bd64a813a11f4802ff5c2c66f3d25fb2aed6c73e395bdfd6a5c4fbcbe939954c7fabeb957e7452653157bc875b96725f13f716f0722dbc130ee2d1aff3a53ad679f859baf77c11b67f5f105cb752be32f72c8fe15b8fa6700a0dc70107212bb8208bf8c03ede392fdd6e17dea19afefc83fff9b4e1a90b388a06aee47188b6d0d905ea721aa3a40617ca1d797a5bd57ffff69b2f9617ea7b76e19c1107bc40e8028a10cbfa80ea59b42327a4c7889c260cd0589175a8e89b7aa76521076acca799d36a2e99f55fa07c9572bef53ece37f219c63e1cf633bf44f784a6997dea61da4f025643e283878379980d77c308a21ffa11ac7d34af88dde1f95b37874438dc74c4db61eb3e898f36a74ffc8e7d4a0f88a6e047cddcaff877e3c5edad17cbcd5b8cffce21c3b5a8b80f0ac3adf3f14670cb5dc909302553310bb59ecdd8bce89de2d542bc543f885e8435862cb1bf27b36e18b8ded3c0a026bd96d5814ce968736baf0f8e0fbc357022daaba384fc72a7ecfd3d6a2050ee854b46123085de6cf8ee89c63cc6e2436d984e9fcc6dbd215df00cef3d063b4d31d8f8e9e353d73d57719c17f3d222ca7b9edb9c45cd5d21f2f71b17de1ca59a3b5f8539ff68b31027a07461ef81ee7da9ebc8e582eb7164e15f408a708a9da8b2035c0bceda410478f4201ab10abfe37cb3aa2bf68063dab31deae5edfa42b7e8c9d9dbfec955da7e6f73456ef073cf2044cefc1ca519c545f2df04cf71cbe949278f8fb6704d9dd04929399cd2186473481ada8d67d5e84264c0e6a136249df541a33d194a1050a1edfc97719a211beeee112bbe7748dee99b81365e1187e04eefe2f35836dbc35be9813d4fd8af013a75ffe29ed5238930530ef26e577fb51eb1c434effc64ccf0b5de4303564fbf0d4e882298712fe469ca882151a19eab1f462165056678bca712f3db932e72819a68bc04249eccadfbf7614d865e08494cf30cfa1e573383ddc7ee8494ef8be5723dabdbc245865b67d440c0de03c0c217fe3abd0e3947769f0e016331135ad88068dae25cf083d6088a70e764287c59855c97ca3a2c885bb47203f2b82e4ea7cb5945171a0f21d1c11e2c65efd074a60c43b48da4547e0095e9c3a7fdae3923f6f87e51d58fa1edd06186811cb13478cd9dbec5ed0437152d54816f30daf45a561c0dee4cd03584bb03ddaf16b1127578e7e259641c2861c7256c3ad2f7b0084ad44604d02daae20ad88b5bc6b32d5b8e9254babe985717bff87ac5160b62568bb88987f1878a9b64cff74871f38746fbe1abb13606f63e7114d5337459c0a8e2816e6276aa5f5ae3b9b8554e95bed13ff812bdb25f6f6ee65fc1af8caf08d14fbbbb2a64cbc07ba45a772e93600bfcfebb9bf9bf4bb6e5d6f207c55122b854f66120b3807a604ad8276f7b44cdd01fd8bf203a52f8d79ee1e054eab607e66f140aa96ddf349b88cbf4400a28ce49d7b6576d0d05582fbd4769aef99ec068ca987cb87ebdd8f434253b1da443bf8f99c30baea4d2edd6efd7b67c9111f10e743c181e9d8a42d092b1f0fad4d133f5908cb7a75952af2fee21c1d1fa3f48fb1a2777f6a9fade0d28acb9856df6e5d5a3fbd682b5d9bc81bc667bc44e64c87d1cff0dd5a83e3ff0f5d4488a6a39edb6e32923432fc11cbc362d8bd9f78bf97b0c6e55bcfb86a81e928d723e975859f2f5837856812acbb790b5c0f4e55c7e01efff6db1821f976b0021c780a00274507f290775ab7657b734df5505d750393f490a71e4406eb1e306dc3578023f963456397d88f6e52793b3cdd9fa6c7176396dbdea85f9bdc082adf7bdd44459f34ba48bdb750609fffc67f61a4d328b3931caa43b99abe327b9a681b15da01ddb1e27ad2293b73f410a75d76d87c8ebc885a54ea1175f73be663f7bee10489d370f1920dab0d00c73ae4bfe9c1b2a1f7ac812fb34f5b7ded514039d878784380861c5bb763fc67738fd300d3d06a7fe1e99d233f25b4b6f76d07efa166daef2815c9bf468097219f7e435ab95b89c8f4000fd50396afed900e679bbeee72e09ed30dd0a3a6b35bc28c4de46eaeec41a88f8f2c2b6b94c9345b42d7857275cc4ff1c8ac5bc0b7a6877d694ffc38867e6f6efc2bd83ff8f20df07e01ee7ed473fba95c3416211ed2c2892f1fb348b930492718c99439649ff6dc8c986a66dc89991cfddbf1673e129f6c53d51bfbd7f652b08b5dae53708b97d3d617df942697e2112922e31e86da015e3cd6fc1d82ac25833e106c65611c67a10f85f84c3f7b1f755231c8cd9e64ed70ee7f6656e0796b97c51bfb713618f86b2babe9a2ad8f19132b47e7c5dd43c4db303ef28c782d767aadb202ce156c566fbbb0e99a0bd92628a133a6f562b1ddf881edd07f615d2cf3fbb023fff9cc454433cd2fa19879f5e1fd33945e39896574e61fb14b240de552888cce333e2a796eb68cd72dcad9a471b9628b2a5c78e44318192b903796af8cc82a634eb6142e4488a8708911345c1f5ad09db79295e0ac2dbf65e723ebf5d1f120fcfff8228427f97b79bc3f9b298e1db6960bc0fd90ee0f0764189c4d41fcecee7fc23e927374be0f766cbb78b43fa75bbe2bf884dfc0b9d35c92f689a7ea0be46d2002da020b473715d2caea03b02e8617d7b7e536d0e7f29df53d3f077856f97f107f450aed74b58096428df6de09cbb0598f837bd7bc581a66d3c6204bd6055b5402cf30f9822a9120179e84c2b315d82fd7c7555ae45b7658de40d3f798d40f01875b9f81ebea18def6f3721a1f2e09142e9b107538f2a6cb79203c88af258f804a8cee239e90438379801b470bb686ba351fdf2d2d6e7aaa89bb80a9e44ea6ec8f68fe4c00fc5950e86f360abf72c17eea6b11bb0ab973c7992c86af989682e6c7dc8e6ee9d69c5e2a20c9f2590ecf02b26e4bd93b3f189a4009da9669be52fe502648a5e966e7b6793ed1dfcd96da7e936e98d87939f92b3331435a6dbb3b309fe3e39bf5cac37f8793b399b1547979f1d7d35bdfb74973e49ceea27c3f116f7ef96b6ed965ec11c8d7be3cee06c969ecdfad0e2d931fcdda6d876f9e5149ddc8e29c10b3224b0ff9f2fbfff2e4474224012ee1c73bb5df3c1951c641b39d4022bf25827f4eb6db52ebf5b2e5e2c6f6e0ac08515809f90034e8080797615dd59bff6afb1a904a478326740ea37327d63908f1b3490c79ff365cd9ad36824dd2e9542671938a2c1889fd7ad9807f6a8880de2a11d54ceb1eded965a1851a57edea1ae8e3a9825532033cb74dc732c4722adc279b059a769cf45592042d54bbe5ed0ac0e119c432845abe19f491080fffeed37f17221a051dfb6b95991d48ba98e8bc78f4e0b2bc5623e2a14fd6a7ff1fdb73f601ff82ae666459e925d1220376ae1209dc7f1d57a79f392da64ea98208d3d8122897203a4b483263ebbc0981c7f9737cd07c9b7151c15f5f272738cdabbefbf4da8e5e3a27ebfb8c81342e88452f02481223d0183d76862cbe13bd90e246db7f8efb15a9b7fc966e6db2d26b63f02a089ac09f8c69565fb9ac040cc920810a169899e5ebc2ede7db3bcf8013dee66f2c10e2bd6c0295ce727bf3b7e823ea837480026e3ee34fd399ffcd49d3e81b4ebb298e1c3a7939f7ac74fc6e9707278b699627875a2074fd2b3f5f8a3939bab6c3d8736d181cf6679b19c8b7afb1cbd3f16ab15fe775403a12aaecaed71ff888e941a06b0bd04b60ffdb46fdf5633f4513cc4712c962f58cfc2cdfce9cb57db3f7ff9d917e4277be57b383b393b8194db357537397b0b2d4ffb43a42a984584ebec64fcbbe993ff03480dff1ec2902163d80372936ee1ff4ebc938a1afdb56e30841aea65e80b58e857e4b93b797292a88bdb0428f10891d382329fcb0fd2f9190d775068df6b83025ab405a911bca70b6a374a8c7676697304057b850c4a063a28113bd5cf1830c4af96de81c6f7eb576efe3d0ec271bbf61435d8db08982fdf114b83a8847936e849b348b0d3b178de2c336a2601ec45f1a579c4a4ea47ddd24a38e51689e360326d5715d02c9ca58fb6ecbab0c288a6f958f72825f413f65718547311eff1a04e461eb2132d31cd5bd2d8b1b2fa3fa1a109f9fab016c85058aad3659b5bfe6a8197979b8710c0455b895c7165af7ffdfb9f7fd46760d414477202feef175867d756eedb22ff1eda85093e23f51d58c5cd81e88147ae793361ffa89ae4813df3f727f0cf7eaf7fbffeaa40cee9bd781d900a66fa79b36cef7e308c9ac86fdbb3caaa4e0c20486aced0d49eaa4d737dec70d161464bf97414c333c80ce52a157fe341e9beeff4dc75406b6bbb9d094228eba5a7900ea331fac900b8cbad9935fa39ea76b53c115913ec1d08da97e2698a5cd067f5fa423d4694ab0c64aaec725e6c644584793b38c67a2fcbcd06a6551f9b02dbeddd8e245ba8882e1ca83504c1fa6202499137db9ea949d9631ec4b0879d6fb7f407f03e4d53caceb519f58c80a163c22b4ef2892753a17caf7da1c468ee6c48f16309105fd4256c4dc6b96cad290c8bcb6a5d6fbe503279b1615dab4b607f237cb6d6b9b33ba80d31352b244a19bb6288c44f0c85c3b0558881ac53dc84af65e01b84c1ea869404db2d0d18991d9dc59f89b5e82572d81f61b1449e375f00f2e1f2e08829f4a98c5462e3f10779699822b76cbff9aaee6293da61ea5661ef13e770fafe22bea3edf42af2b6a6000d6097db7223ef04440768ea299baba5b75b823488bbe4128e5d4b08bba665a67177f4ae51c6890d062b8b85cda738f9df852d045f2070db1ad4665080861da4c01608366b0b34c3168c9999c0621214985aafb788d42f1828bddaa1b1607555bfbc25e306515741b9a71a2c13f1f70d8a1348ccdf64071eb278f0b422b21cbf84a47e4aa75346316c80488059a4f4ce2c18fe8c2ff28215c59f38391961dedc1d4e93ce57a348688e75ce5f55e57c068d7026061a42184cf616402b41ce60cc40306000010159b7cb33ffca05c2e4c2b94dee39807b30c1fa61531a2c74b47f367c7fe0a6a2058536e82736e6cf16fcea50896e577ebb36107eb98127e6d30ed129a338eb7293272687644accf46bf954e8855b4a141729c3faccc3b3fa660548903f662058143669731c923162aaf446c9d31be7c52c6e920632f5706964755c4d812377316aa165347e583647ce76d2a06b43be012726c9e67abd7c5b2753831298e750c1c58502c9666f0927d6f056bfa3fb836120ac66f4678835c790f5dd52160319f3c34b90cc016c02d8cdd22fe58ecda87761c3352375921de0fc873a126301a0b7dd24c80f07d9bca837df2e67649037048a506e0af4369b594e60780792d2309084c9043d01513301ea83a9f36128d2ca8379236f21f0b3abf9f21cca76067c6f59d748edf0935406f8434ea757d4017a7ba9b8cb9377476fdfbe3dc2a7ec47301cbae407c6e910c5098c19fa97575f1dfd21c9d0ca0b5dea528c2695473354680c59adb19a17d522c9d0444a52f06792bdc3efa0bf9b7976e83421d9eb7ab9080b608a94785dbc29ea8b75b5da603459395f87a8dc1862ed13ee8e7a3ae196a8f6c92e0ba916574934f1efdf7e93c8d835094dec74309a863a26ee57f606ce9e06960c59afc32a9d439a2902993fb1157755e234889289931e46daaa9d651a192b74c5608c9dc1cee1cdad75db261ca86093bf019484b1e1569b8cabda341a7c4c7d5b4353a1a5a4b08ce4cc0f929de036bc4f90f71a8e946ab9ac7b6b19298d6af9f90398bc1b722ff4a022c67bca74024b0ee923cc335ab128c0e601b1e36256b4c10bcb0b10e8cabffcf88d432766166b597df149f28a5cf36048973fd136acbdfa26ae98f9275fbaa0e854d0b9a0561f412f78ed953946f3d15a36f9976f601334f2bbdd5e54d75d8cc17111e5bc26f57b2ad7df7145af72c59eeef1d19ea9c7cb2fa2222fa4417419b9b8280f6fca1b905b3978dae6b67e0103cbc9cbaf7c20dc335420036d1340e58d14bebca5584618c77680daf1cfce51a44d2e0ae8055f4733e396dfa1f9d5fb9744bb075983d7f72804c211f376a49b91186b1b31ae6403f860f9fca1e587a997c6d444ae9a4a5680b5a20dc7860a322654192879cce0713a9ed43b693faa0833889d0cf8d0c65841de6ae0f3779ee40e01f2d97c1ec2c45cd286a604088b71eb3cc4b21d89c68f76a5daad8511caf37d8f21c9106d43f18aa948cbca4fe6fa36655f96330eb60582c00ed6b2e000468e5789eb6a567e2bd2618b0b401d961721c3586662e8e171d9b77153ac54706093444a501c7bf65479c519496e94e99b9960fa14c339852918469b7f4ddda3389268c57934667302d79c9a47f932d602374d1827fa964ccc55780761892cce7d0e0616e4cd461cabd7ccb89fc7d46acf55c63803e81b7b9099a4d023faa8e1e29f1558cead6e1ed317349c18c9ec9823cbf90bbb920c62fb2419dd6a8f805305aadfc3e3024560fa6379ae146fd4fca5195e4564418aeafab388ebea272727e819877d50a866e9a6dc5c2f67e4b295be3744817d3aa78c8c5c185cf1f97452d2a60fea902749427c3f06c55c02dfb7c4380cfaf8751529e469fa91267e14d6ec747a1214d3454c043e3e9aba06a97fdac8c300f63d134e53dba000379bcd6a988c933f0c9261f2e9a79fb0ab9c9099a54a516f7beaa66cb6c4104379d3b0bede73f6f141e37a8f6be49e092b14ee191a2114b30a978eac91eed74c7b8e267311518c16d69c25faa01cf3463bc32ae4f6acc549f0213f2235882be59e46b27cd1eff30dacadebac2712e22cd09b1d6ab1043bf90facfc5f562b47756b3262923bae8ebfef621983aba423e58172421e26d5a6a2a811f89ad595654cebe73dbee9176598e4a6e3a49be062a67da9a88f33f85396958afbd7a9bc8f01ec7163facbef58e0dd928f4e7fce933ed91ff4fbe9500bf51f1a5162aab112b03eae2e5594b36ffdac8837d1965471721c9f8abde4ebcb232d7ef4b2820e92ecfe96ac551eca8f8fece43b20861848f8e2da7510d5d679e9c6f1ab895f465254e7b79e9c99ccfd830854a959580944e63db53e231133c942ed3c8e4884cf4998331ddb9c8320abdf0bcbb2ce679c6420e9abf4da4f4687bfe683e3c16982f6a843df1a050de57856ac92bb56f66fcfd8abcc95995453a54be7253451be04190a7dff984f368a8cd86e513ad669ee80ee09484841e4b0c5eded78604a4adca0efe4801c9e8a22e4d471ebc3d39d6af7aa694f06ec0ef2fc7e92e7c5b15692d731bc019dff47a719ea5e5c0bcef48127e219f5fc34a279e95d53de89881c8032c92602370776527920da8878f67cc0fe2e5552b33e28edbb0903d944ca27e42cfdd8fb9e44ad542dc3f5bc4f8d6272c87766387baba9b27c9f42c62bbb50297658865162b110b360d9a240b2ffd2f163fec22573a849b79faa7ecd64f979f1bd62fb46a84ce679bb3c6ebcf5e84254c3a4a7ea8455a1d9eea693b32c5a79b1bb5598c8651e643edac00d1eedf3c1f8d3e1e060e466a9e9f9d3c180e262c3c7b34f0603de39b7353e9d1b7c2ac16cf45ec429151f77a1859cbea9f088cb02f2efeeaf0e1a2788ae41bef72aea1b380fdc59c15ae21b57fdde3323d772a3ddc3dde0a9b0a7f5f0c030adee043908b84f079f2a438b3c1a5ac7242ac4b09fd0c55268bff1d767d7262ebdd19e7c985597ad0027c906fd78320eb864621d98fd7769f46910a6c309223971e1ba81f9b7e89fcfca457690ac5ef645f1f58b4c89e2365ae94bda1ed9346aa5176f3a4559eaafcfcf100c12b5c6ab8a0f90896e7adf1423e7bd11ac1aad083df56dd08ca7fee4762269cfff4c4746b7e3f7fa07907437dbf1015377d1b90fe9eb4b56eaebe0fc761beb41e746d9901a71048f9b2a3bc1ffa043e885f4161c447812f68e8e02a63dbd9f5f5faee8d279174a0aa8ab2153c740eb49a24ac3ffb8b48e6f5e1b85b28494d229b7f89254ea619b0f35e7d6d4b429aaf936a7f7f824374b56cb3a7ad7cf62b08262c29fc68cbc3972a78a699a4991ec100466d05a2317c48aa802c97b46f11b4e1117a0475a77ec9dae60785cee1e972216d1d790c544c139ed65179aabff5cbe29e67f0169c54e2b066c4baf7cf1e33a55f8ea25cea9bbe601a64aeed1f076206d0dfcf3765dac3e9b1b3fbb784bb1079094f521ef7ca471aa689ff8f85768e2b097f9122caeef710eb04e26d9a1f390f4b8fcb537488f2fe6c8fb70a007df54f056175b3c065615cee2cf89af761d8e7694874e5f2317e1ee559ba86ce92517192490cb6c7948ed1322bf5b543d2ae25009d361eae2825b6344848a371cd7d78b2030dbbf7b4da8f97dab72dfbb2ab1728b5f4d39231d7cb6a45f72f72e5fce28d82558e408df3d3170249dde0861d9181cccc9dee3cb981bf8706cf54d8c1b201acaa8f8e94438ac7015180d31f655f36d5ac3eb2abf913a5fcede2769e37527a92be864e25757885188de145e44626b857e2956eb630d322781bcef7983bfbcbc0451e76fe865e5593e10f4e6447646fa0c9fb21aa766e5bcc2f7e41cf3eb7b2a586348889ef14722cd04f1a453e7e70ac384d14bdb8344f260da2e70b52154c154de547585de485ae7d2d93f79716ac17776eba783fce43f9e0e4eaeb2f5f91a8872b9c94fce266753b4d77ef1e3375fa137f2f1d902f3f94d14b4c40a58b2efe634759752dda09138705be586acc3d9718ad47bc8e5ca2fe5fbab72919e54deaef4fc16d6f60754358adaf05db63c7f9d196d6356cc66de77604bb86b289f86be1bb00573b6b2dd876972bb5548b0ba8b3bc67864b3998ee28deed0e608fbc924e93b37dc36fc60850a937e324db2378d29f0c65666bf63b29d16139ba4e90417b5a8bac0a953f876c8dc37a2053de883bea1105fefb48d818333fa79628b3e7a29297d3dbe15b6050d564fd530320b36e9cba28da7bbd332cfdb1bef66c7f4a7970ed52551e0611c18e689d2ce69ce66177ff9f16b642761ab007dc1bbc97e9227fd963c7db53b0ad73b72136e325aeef0bd4ed91aa79a4ae1a360c6c12245f5bc5c2077bb9d0397ff03da7fc80396228d10b5b00e2a7051d84b3a5e0f7a67e64c7c9d49232f002243d1860a5931e11fadabaf3798c7af97d5a29774ed7dced34186f6f1ad4c13f0131579496921fec17d010ddb9566e0a4a42d0ad2f69d217bb8133a6badd7593e3e34cbbffcd2147dc1ee9d626b0ebfd24396446239c6f18488695647f6c1618aebe2de95c96155d5bd64e8bd9077bb96163275093cdf43894e4466a514b2f318188e4f3c769abcedace92736462f157c51c48a105c55e6fdbfbc71b86d430d18c75ef6fe3bc265f4a8e9e1d70c11e0accbc86b287b407017dab8893d4ae1f19225f8162949511018fe863a246905c77db031df5daf73798316bc160b9c2635b0ad43601653b26e17ce2ce8658b62d916156e5b3cbdf8ee4535fc78d099f594e53ae097422f37c56256ac67209bf6528d742ec3c1a4d16ed8284887338cfeeb593ec8e0af330e415b0ef87ec9dc87b71e89a7cdeca6ccbd008cbbb826711c8480461a1a9cf0fbeac4921ca427380c31b3b7a348efec1799cbf7bcacabe13a51d5ae2eca97eb3aef74ecc8f1d9f95b60e35eac4be04a36b0ffeb84bb7145d25130556d0ce71a3586930d6ade19b8383dbadf0ed604aae3ae69fc8dee766b472e16092a26ab9963691f2e8b2ad65d1808478e8be5aeb9695db26a96f7fbb4b638bd637cd8d9b317df7a43706c6cb5583fef738060d216d1845551d76f97eb592a017ab53bb6e4e3b5a46b99963cf88981cb1a39e8c664b733eda93147b74be38eec40a8a1466aa3b2b8b26a8139103fbd0e4afe7e247745e5ec08797d347dbd27334ffefeed377fde6c5692914894459cb1d3f543b7feba297c2482236fb99ff2c5c58520978333cf4debc05e03da8732b0d3c99cc02b55cc5b26a0a6e774ddc3e160e9bac2e80e9d229d4446a90ffb45aa6db7380ea3e9cff34ff1c5045f07073bb39a4dfd00bc2e87566a412d905e989d1ff827e7cb15ab526594bcb94c8f1dec91a0e62ed5d4c79c8c1c6dbc449d4b406395ae3738e4f6bc1969e495455aa1d828795cd6df288962d8f7c0d9eefec8aaa013f1a146497ead1c996f4349a7a40e47347e3a180c3f1d7cdaa29e3f7dfaf41357eb2916a12d64ae529440f4ee5977a41ac7ad1667c42f71f8878034f808f43d2348b4e0c99db9c88bc3b2ef418b18a3724709770dc328b65b776a5137a8e6e9c0a124fcd55dcb6129f6ecfcaebc7cab5e01c2bdde4b039f94517be69cddd35af88c3c7c45fee757af7ec08d7f603a689aa23a336f563d8a25b737c3ce0e034bed3de9e5c54d6bfabb239f1318744b6ff8581adbdc62b194134f22036c32a296268cbd1e5dd3a8ca5a54f6185531b03ba31d153158ee9ebbe7d4adde344e6eefd412c590594d44dff4b1f515e6127b4dfadc91daf4b01ffba0737f9cdfd3b96d98882c431629ba7fc94ddc9c68617a097e51e4beedd695881efdb71ffd3f9b7b00ee677f004255fef30f714ed019b0311a27bee04704dad6b13e2a88f281b9e2fc7a7d21664692b0245e2e775f8d0ddd7612797a8fd7785cd5938eedf604db04a943c99744216c944cddb81f1c0699c2e2c4b984d5543792d441148569e4dc5421e01aeab8d938ba83913edd4b14263bb8cea116fcc06087d153a74dbb4f462fee3e9ce75e0a47319be633cfc14fa6d91a2f9656f9492f4fcfc6bd71dedd7e946ecfc667e3935193bc50d961a253e207172b6d6f1889a8eeb4b77d7248d720420a90d9653ff939e9f7d4dc2b1dd16d8036406fb485081882bf8f0ee0a0e811c7ca6e47f7dcda3d8230cfceb555f240868ce3db350abe0b770e2263053bb85cd394d1e931203af5d141df5ae8b596bed4f60e2f8cc609fc9b0c9d2523dd6205efb77b816d157bf8734ef21e7ce443627cd02b717bdd6e827fd93240478bf7fcd6a00ac7c120f2184aaebc6456ba5e2ddab1a8443a8e127a688a15a4d88100ae4ef4f73437bfbd644d75d10230e9dba11966c283de1a1746e68aba08de56912a914eceb68b4696f6411eef257e05348d230a37f02172a6621bee27876f8bfa70b1dc107e9129c8ee207addea1aa207c1a36895f8da77643052940813dbd174d4969807da84a837ef1713f568d602ddd46a6dd58c852866988d4b112250bced22d4086903ba9888d6dcb0ac6ef44ef769d0d28c0b08bff96a56e76bc6264c2c98cd6db332207a645ad2434fc028ae70e8494d9ef564bf94e58aafebcd93ee477a2ef2228ab416fa0f344de75260a4059155d1dfee05927202fa44aa2e67f91a439bcfcb57c5155b981305c96a69b663fae876d9db0957d4a14ea4f588bbe042f8b411905aba1288912af8ab75714505c94bc5d4814b3a4efd598c2f91f947e4bd48f3d5cd6a2f8ded026ecaf555d983338e0710decf11107e26b6c0ab91f173147e86a60da43cae0d9315bc5b83a53cf0d49d1a774b4a5f78833a6755a777aa2f7ec49c8f366798461a18bad4a50acbcb4b7c0467bda8b28ee5f2927c1e6a03c17b04acc0efd6a158865f02c5941fd3b9ec01b6bfcf91284f3bf54745ce2923fe63378b7ba94d39ce8e5f0adafb2266b17ff8fee52b9687e98a599d0d065ab3c8ccc21973b09505bf5325e30eee6597d283124fc9acc46e0d081d09648fa0d08ef394a76feb9267b3eacdf3c41906c4db3e6c3b2567f2de4de630c84525b113b9bd2ec5bb0f36d64ce28b946e5f9c298db6b6dd4ed4c4d2372f15bdc5586cbf1059f8f86706993761ca229b286bbb15587565de8237b00f626b1fef65927c69f83db4c71923fb1c1cedb9292f16d54d815ad7f6bb72951a817f70716cd17cd538cd33dd921508f00d8b6335f91007a54c118046220d5355fd5ee9ebc009f75778458f855b4755d536738cff0e6367cc7f1c07e185aaf2ed766b3ce273034324e9d228db00501815bee58fc256b8f0bbc2dcdeae7f58d674c386ee2fbe292f37f8f7c5cb97af962bfc257fb82dc9e252c5fce2760eb077f557f243898c331848342749b10502a2ec219a3a8568205d1c12076d85ce3e60712f5cb017b24b70f9c9ba9c93a525900837c25cda173800e177b3690e8b0df3fc9c9a25e6909a9072349c6b1e0cb338af97f3db0d8638b2c997d53b66c475bd256c2a87a8c926019c6508d3f4f9d1a9e853c32ec95d83eb5fa7a9fdf1447196a6d4314c7024ab1aa4e3b4449926b5d8a9219c439b9e1b1648620357bd510053a944fbb1a05717fe91b6535ca2650e81b7f298c5a78bbb5f58ae3afacc0d510313729b7be42ae257dae759046de01cc34630250ff24d33f849ed7c43b0818612f4f67b95f8db08ef20eb80b2cc4ca883d48394d606d14833766d37d2cb6883daeb9ed869ab231e0a4e7b3788f472789fb1946c8763471598cff0c4808e0443e4322072d9f9f25d7e07f0459f170095e1609779eff183690665c9684ecd8facbd1fbbe25c5ef847064a3ee16f83641af3aa0b66b9eb9e8e8448849b3e8ca92ddeebe74b8006acc98b7905edfdc897a761e0579ccdfee2c822c29c734fb271f0aa494320407d44b63e5e5702f9bd2affc1a024e699169c9d40e3ce39d2d11f5f500faf50ca1ea40c466c087ff896fedede126db1b8294cc4b6e048741437d2fc749c81a6c29eb43bd4c70f746e64fc91f12922a4f39ea536264b6d54dd503b41ea0720cd71b2cd8072f53bec52a0983465b2e43d796c8967eb216232df976ad817999f2de5dbdbd932b4c0e6183868367d4e915a6041ffc621ce588d1634428b6b0f933d8de05206adec0cba2ddd808ee2111e3596e206c845b578855c1ab5c48bb8f4c3396a0c705f233828690551cc0efd032c5eee5f5b87e862ad6bf3baddfbd75717d71dab318063c45426220d11ae051bf8c347616f1d71144e0ce9ed9ddfaee8a8c8ede724731481d38562243bcf7e8a35fa8ad45f64bc0347ddc93f4ed4aa0f92fdc9d1b4a937b62c41b4b690e9934edea8015c48e84a0d1ff6263633f36eaec73414bca8868f740cff5010dfe91049d83e4e5887cb01b9e483a83736822a24473281662d57685527963c54c290c15e9aed2ff00ad5c6a98d20ab70a248ba3b33ff46bcba8cafbf0f020943623e91d0432c6020c7f05a79ece3d859048ebc98cdfe546e30e56b905ac5386305a471eed8e4706950e8bbddc8eb63ffa1bf7266b63c97e183582f6e6f16cbc5ea9d3c77d6aa63cb591bfe9007d84f56ef92a116e6bbcd0899d97e78a8a11b33a2504389e86830974dfcac4cc7f5571cf66a089c13f0036cd3a9f7812c9f27c9305942ff9269da1439e7cb779b35db1506b12f6003689ad9024cb6ac2f928b6b6020c890375e6d202eb60ba76ce3363a5687969558220f8b4b67e27bcd47d0c0afb11050981c93776fd2b77f67123cccd0610705e6c1768b8616e07b375dc27c02c396b75b43aac477aaccbbedb93b3cfcb6d85c03617fc775d1c89db4dfb0dba461e4fee2245396896750b62529186a1a06bd0e38dcf8b022b8d10a399746241ec650953218af07d30e1c6a8c79b186e6ed93660949e08076364e0546fac8f79c814e53e08b178bd94bffec825266b3cfe5ce43b5bcd439f14fd26ed2ed72e2717133a3d781f0bb97b0592e488d4140b840a1e078f89ff95b1515fc95fdfc91267c347207ec8be5e2725e5d6c8c8a9a5cc97aabbc8f60705cdc19e57d94fffcd148ddcebaf808d269a3b4a4ffac838cc66c80b158f2d3bc3c66ddc396dc28f6b408474132fa7f00, '2018-07-15 05:47:06');
INSERT INTO `wiki_objectcache` (`keyname`, `value`, `exptime`) VALUES
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6566333934383630303665363964653535313463333036386630363936633930, 0xb55bd976dadc92becf5324acffc4761b0362c6595ea799c18c363349fa6f0d1b21d08406a638fd2efd007dd58f705eacabb62410021cdfb457624bda5feda1aa764d5b321f99743a157f0cad59e3b34204891d494ba9a9b142cf620debe956259bcf25d622b777771191587d4981cbb0b2e91263a6190aabf2e4e97623a982b689e8c7675fbffa6e220a6b2ceffee97bf2f80b1f3dce6c95b7244dbdbdfbf5fbf7b7934e29cded8db239cce5e6ee9b87ff2c99454dd1594be264726b5ac6dd2f9cbfcd3ec1f5db9bcaae2591b53423629bc4c88b44b5be19c4b20df5cb97db9b954d8c5d8fc88407c48da47e1634de5600f3f5eb8dacf1acdc83e7ac48b0c9591834b082505e03a62999165189e16ffc726bb3305d8b9fdf463784ebf47e44991f91efb187e4cfe8dddbdbb1b12bb33b580aae202a9db4f4760a27b16aa7f7d6238644cc74ecad4dac8aa1a9d65b07f8c67e6e49aaf4d64bc63a6ba960681b58d75b8b90aa8623f8c6afcaac6946efbe7e3d3ecaab82a14942f40e7ebefdbef5f11c79d6eebc365fc2266f48baf54d9add7e3961eddddd2f8f3b11efa22c137acfe3506d56214f7f86440ca2cb2c4f6ea3b7fff1f6c3bce36509da1f16e6ed0ff3edafbb68f8e62fc67da66a0bf3af38089bceecc9552d7af3f6f6fde7b7cd5c8289d1fb884c54d19adffd72eeccb934b36eef6e61957eaaa75fba6dce8fba3653ef7ecd5444fdfee6e22ea0a8463a4af3edf741ef4c54c4810eadca26c26bea4c129f7087c05d8bd56f2dc32677a0c7111994961811d09a9e661bb0ee5f21aa5aa1c75074031b2c8a80883ed743bffd788388a85fc6edf7ef2153b248281cea65267169364e877e86bf8754cd11143c2f4c04b21a4cf7a1f0f79fe16303a266c0201d14185065b2aa4e99dd2b3eff14c2dd10110dcdd64d688b66e6923014924e0fd846a9e94538d45092bb97dcd2b8d01ae14d5337c80c3ba9ae86b97a579f3830dd90d6602b8e4881cc585bb61049e438d3284dd863a3a6234fb16d9edb1acde47003bda42f7563694b42817b915da65796743e1cb55dc8da88ccaaa20dcb8f08acc5e214b95663afd54b40c364923f4fc1e6525255491523c451591ca43b543bc59df51cba0205b9830d4021dc0ff55867185f5f434a003466a0f780eddcf7f7e6f4e5fe0fbd4674d63061bb0245aea00fb2ec28fd270ab28551545696257589f31758a556ac89ce480b6aee222ccf13d36c905d93e5880c209d1fc773a9690eb8124f859944eca71fadeb84452d509ed97eab19334eba32c0fef42c42954815d55229d78d9d00cc9dca43db0b131fa6cd4eefa4cdb6b432cc543725242fda059e5be953984522e39f01c70a548117c26bbaba49ada8f09813c4ce224dbaff0166da95fc4256a450102029120a8aa4447643523caef6a4177e4ef825a76d7b683b8ab2c42f015dc98c6ceb7e78d21b3fd74ca242e3ac95dbed8aec094b1cd3058d43b59b6adf33a993464dd690974c51d3fb9b421ae770b2560a1858128aa5d36864c7b2543bed00ec0c784530c88090f2ac3579ee3a1c499df6a32d25807c0aa5f7d36176f49af4f742b63aab0ad849452232ea1797cecd535c61eb47cd5883b358d3925080c566b5996be69267339e699a55d3d67b6a2966b5e7e69a1bcd4eba012f8e6259c493dd683a73d264cb32182b42993936f8d87ed26dfb011065e42dcb40f518bf964a76721ef73783d1d22564351b5fcb5a923f6d13e732fcb7fab0270093dff7a2236e84462c9e8c07b57caead8951f7f6b256d093b1f6f3abbf3f89c9e22ce7e594b0c83d2b94e5097f17d4a84b7b94cbacd0cee498cd89e41476498a9a2cb3a0ee8ef42af3babab293ec094ae3970b760badd99234628bd5939dab6c1e16b6a223376b9bac9d18cf4e5bcbb0fb55130c299ac752cfb64b8d9c1f41fdee5c93054758bb226769f6ce8f58d92add24f3e2a0fcd26e6b676da0598a2e130c7c4cb34f4c04c71633729f54d7c09364dacf125307f344c7eaaf94de33d7aef8fb5bb8c1159ab7ccb89b2b2e5fa1875cfca4075b146110d73730513d5daabccccf4c84c572755520c8b7f64211d7b1e289265ba8eaa66658742e39ab597ab11acf474d08339993795ba0324e54e8f072b3ab5645b9b2a106f204383734cb92c98340380d02035ccb38364a57275cc73f81ad220b1aee02815bc08e16a327b3030bb883b6757e3762b742d7df664bc07003bb6d56971d659c8dc11c525970780780e3cf4ff111d3dac18a812c534dccd2662def78c913221f0db804cd109cc51a0bf33eb9d4051c2813ce64de23030beee90350d6d67565dbe6d046a4d3ef9071b665d1a1e4f99c2d0cdac50f0c050e9ce86092a9045f726bb650134a94ee3d22899535117d17db5d1656ad36ce8c09a793e174369c89bd47098a297a5636b3538d79a3eecc32fdee8086a6eb2e996a6de41d37d770cce43b34106ad868819594b51adfcfdd51b2efb343d1201842612969ae31de8f81ea5dbcae410ce9c8574e4d13f16739f7be46e886261ab0c539eafbab056133e1b7f50f080a88a4bdcb824c65bf1919fdd2073867d2ede671bcfeba5c57c4ea47e864c9b1668c4cca29436f7e84062c813b12c4a3c97169deff08d5c198e5caab67b9568a516d7a870206c12d68af5e9699e5ebe003ccb3344d06730044ade18bc9b42160f2abc3a7ab841b096224b4c593447eb018249877a44b663360b5e91996b6b6d8253bf1d8072838082b315a20fd72a99b86c804b4eecc169d117986b12ec6560373a17d880ac2286483faca0e53897aec4334b8fb8026516a17957a5af9100d8442b226e0f43639a9c0e4da9d0f91cd584ac368ab4c6d466de50768341a6a3d6f9878ecde943e44738862305e1810ab5318ea1f22d46dd964a9557ee52b4db13a1e7f88cc841886da95ca889f7562ad8f11cd21b6012231ab8fd4562af93122dcb840141fb6777c352b7e88c83258d59cd14d78cfb1e9cab4685fa133a9ad9bf6667c7bd975724415a24de757e850017293fee75ea7fdc38ec5e269e737de830f3520b59266bbb316cccb20b97792314d7182c65a2e57d246f34520456375694e64d4cbe6cb7d7165efe7018045c0813aa2ca4b44b0fa7235f4e93224a2d8a6c5429e82d910dbef0d9e5fd0b6e6523fafe00d228282037af99acb73f5fbd12534cc105278cbc21824b6e6c89cdf5c58046ec6ea30ce444b18e731c94c387bde4f84875145cdc0aec4155f5b3d6f70bb3389543897bb00871b64dd944b3d4f6be5d57b5070e4128a5417d7aade686040731177ac244cd643bd55d959d790548a983d14b2716998c85ec3d93a966470e84c33b3907b133770cc41ec18632e11386593c2f8f535d5ed8caff5bbc19a1c5ad3685515e6d1abe32be086214cc625418090a9750a834b50af04e0aabea83d4372bada87ce509840166548614754f93157784e8f743536096021a8b5317aaad5324bbdcaa04f49c4c3a9f4cf0bb088e4240ee57e8bdb0f5a343f6282cc991122702ccdab079962df6a6b822b72269e0ec753b10b78ac64a0a5ad2bbb5dd9086e1eac6f6d58036b20001aadab7bbb5c17a880826a5e017727896a9eaab29cb29a2b3eb7a4d3cc5c457a3e32d96c267bd5a1a34ae1783211a0c01dee4e74302c5ae557711a98a897aa96666a51db6246fc3d0131f2a733a374631abc492c2c2a6335b1ae80e86f3d5b73ec4e9668ea95d8c7bad5edae186cb614d9cdbb17996c6cf9d2ca204f8e69ef39f4983298dcb2475eaab12b7d46340da3210f3d9e58cb06bfda04d0124fb5b0aab6f465b315e486a49a3a1874d4ad7981bb2fe6385a8da15bea6c86aefe7735d3c9df86c95daa9d2ba6a8ec82ca78028ee023cbc9ff17dbf8a064a50852c51854b800a5aa59d24ce259374cce3657f96775815922930dca9b62d1c86ddb95977539f31258df2b11cbd4ee72ddfee4a5bfe904dab1246b386969172f716bdf2fcd2ae489c10a1f610d7ede73d2607497e562b5b4b3e95e4c8593a9702a766e2f4d2773cdabfc9c969b2a955a61bd4906a5601ef2efcc6c32cdde4fca01405fb268343053a4783fbd111c2181ed0f8c37f02c24c7e4f86ca53ba64cbeb2010f6073bc5b6b7bb1eec811041f94884bd0b30c9b87ad410487d42db663286529af3b6522853e44876588683ddee2343a64220b435e5e49a4e4258ecb424acf926294babca03973c1054d5b4206dc64779a8d22aabea465a2371cd306ebcaa4c29f1890543c09a24aa09983ff68eeaed89db3f50607785d4845a533a9d10172200f90490c569301d30403c613c1ca3664e9289c628955176d8ca599d4d95a0cb44ecbb55469aa959aebe173c119ba9eadf45aad0a8969818a19569862c2979047ad95a77b865d9918ba5ed257db29782e16d55514122b3a41d8a141d85a221b1d723754d8c93e36c8cdb8a077734bb896268a5473d7d67625775e87efe28ec66c1e6f34d2cfa5a031f3aaa9a1f938331d5bb4e07a363bccdd9c6c9929e8629f1746815e20122386e49d2c44854ca2bdcfa40220ac3b402c8663d97573c4f1c125b2746b7b91537e696d075b75e558f754026411dc453e82e3424987e93637b67abd732c457bc5ca8aa639a69759edd36a33d9c04a1f43e5cec483cae6ef03e24a141a5076ebe3e16a3e41d92612e16496ce350d163f17f64ad7d7a6cc9a1825198ddceca522571dc3771e28392473098d1a5ae64cddb417d1e159247b828b08d26c866ed448ecb7896ad090b8605c4244e0647a265076183fb7985c6194da39eec151ff4f57481562b1ee01d4522d59d915133cc7f1a3bd101a1dc351608230988fa4ccf81d421d7c9e3bbbd1b2a5aa0579e86c756a82cec37e1f29d81ac9701cf24289a793dcc03ad63adf27e93a1ee45e6f9787eb66d0d19d50601eebe7612cde35adfb5df41d25c45fa3437c77df69565f3b7b5aad01f56162d775878ee83bfdac107db92b32832b07845823acc4ed9dd02fd2ca3e44f7c1f05a1670078c721b61ceae1abefabfaf378983cc5bb60d56366c1cda70eca5c574ebdd2961ae9d4ebab1736356822040d4033027b36d99c88144a1f2dc21c6d8ab5d67a83b3eb3be879e15480ae6a83f0b93ebe4ead3bceff0ec025c6515aa6d523cda9b919170f19cf480c6180e1c6571ce1ac075428f69d4dafd46e9c4b4cbe3207f163a11714760ec68676a722a1a347128b288c8ca32717632534e373b1c8b524f86996cb0573ffcb8616a129bd95772c94b7d1b8415b0e7dae4d92ec4123bc7e1c4c12e31e124fc0eea94ee6c45d6b06c1dcfd4067b6b10af2e868e9bbc04d659cbd0e408eb9ce5e453845fe79f31684b62d491a266ef2caaa494342bf4082bfc4badb14dd06c2a96b9462229ce9090207bd1ebb0369734669375473c9ba42b3af44343ce98ecce2254178009a8c9aa02f8ca236b5bed815aca587f26016cba57af1a556de7644e6888986c06588de1d0d901bcdb01276b3447aceb2f2d6934de5f64f309d8cd86e441b5b61feb992b13e3e7a0b9c474c18de876188f75b77f06476422125af86cea7cad2b4bf90fd340368e0b795d2aec6ebd3bb8cd2b6bf1d313758eef3ed140b923bec85569f98151d712be2b2280ae5a368edce3a693e1761bbf468aaff718d4469a3ef926baa91cdf0aba4e8f086db2c58a88ccc6627239cb0ea939bab2280f7eecbfb24d4eac4eba72a57f4971833cbeb4e966d79bee159ca2ad89eb7de45cbcd8b3bbe818e289f8958978785feecaf50776763309059cb747817c691e3d84b81bbe70ac38be585ef0d39823c99a779d6a748b4fd9937c62756511f8f20c3108489a5ae942bdddda29159a12c51cf31e0fd6d92e901e9734947ab2de79bea6d5e0b121fe743506e0a99746afafcb120d63ae6d312707c5ceb3af529f6fd4289baf4dcb5605e21e08e69f53f975a31f0ca70f482f2d1baa59b6da89e64feda3e3de695a7316bc1cba00074b2b83a8cae0ec8e8c58f7eba3e45a09d6bfce094d48b96cfd48d84cea22dbee687f2474c93dba42eda560f5e5d64707a4962113cd47e7cdf4c4f16d1783e1235fa96b2042d72d06f68429b76cc7535e092d764d7e94ceb57a56b9d58e17d6c1dcc483aec18b3b1ee479346033ec0b1f8c5988c8f2bb630aae34ea525f9d07e3d2030c85d235245a21dfd41bbd7b7d1e2c2cb958dd80248386a0f7c6444d3f6fef6952130c211cb0093107b58ddd72a9abbf4c8226df8569b2e0213f85c45a6f6a6ca7cdcb50bce6249a9a19f9321795cbc245bf63639e5ccb4d4b7d652a86826d87cc124ba189e7cacaac04a33e3c2365054943951193bc999805df19c39375af74336f95a353086ece218753f478aedc5797dba0086c2cb3e9b46090e3ee73c344e542276e996eb55cee5aed8e700e70ab679b6a7a3cdb2f8266c53976a4367dc8ab5351dc22cf72615a69a4bb380ed95e3c19b4152edd71f34c372f137395e95dee3f826f1dd7713123ef9c53df5616fb661583c2dc7b23e07b031624dd28b47ab5338f265b17cdb7872fbad997f752303ab9acb97f692cd5439d2af5ce780313df23f2cf346fb193f61cede7f7eb643d6a624f0993adc9aa581965e9fe8e87cf1ddb55e2235feb4aaf928b356657f8dac3e49a0815c8930ec316e255259baaed7c6c2266eac19c4b584e4e0b95547b9dbabf7ca2e67fa3f8062cde673c43e3ad1bef956b0bf26eff69da972f1597806e7fcddae924c249aaf0edf7ed9d5bf41634e541266b22c7bd394c27afd3d7cd7e1098c3a7c3b19ef7caaf2610a70f4da3d6363e2cd9d97d55a74bc36af34faff1816e6b2dddb05ecd97116dc73a7ff67028e1821edc038167b6bbeb2c370b27cdc11301f89f3e431e0591cf558bc9f52e4fd36a2048814053898b87928b17ccf76e6f3049fa8e19d9d38fd0f8a1d319d41fbab5ee8fd0cf9b3bf76de7e3e21efc25f9625a2eaeea06f3ff37d6c371e3d73666a53ae14a3e75f1406e458c72de182fba82cc5d4039c24250cc9e68c5c5a8730e72d746cd15224b2d4e9b4d47dd0beb07a32760155f73c64d2de4d67252bf0444d3661b9463b6200fac15c75fec0fc77c705e9a050f214bf4a0b4cc3567cfda3ef60e05e4a39443fb79a3ba2e3696d7a1c7b7886bed71ac68ddcbd7b1184e4baaf8c00a6b2f3f582e93bb56bfacfe99c8d5de6eb1d75a8cf9f49f09dca8a1ad768b13b3b1fe33013e748a35e9e7faa4389b35afd3d057a29d7a0df269c459b23631e3d70964a702fe09dc4d9e33b2fbf83becc7d731dd6478b66f8b75b6f8ce4ca865c4f8bb723f568d75e51d24d814c3eb3896c855a6eb6ded3df89ab8ef074c8d81b6925e5ad7c16e755deae60b0b51495d07a20df7a65cdac8dcb4c23b5106be0f6ed29788459570b24d73233ed36b89ccbd0f4017810b182ca315b35c6d9cb4a91aa769cba339e1d6e9789caf713ed09afac623a4cbaf995d31b6be06c1b7c27498b9b4a6df312c5973c056e57334b5d2b39e517de592584202eb9582bcf2e7ddb76f878f2c201db16e7f853622fd1ac8f9d4e1ec538a70c839bc7efcc284e91000597b0e9dce4967adf9818e4e02c31c7160c85df444c043139a2122e43549fdf1e3f16d66e9f0e7c78f28fcc31bf37827120d11a264f99e69fa9c18c7fbb9e5a7c73b5f0792c19fdcf89a14164489fdc295245b742045f10154b2c1bb3755f50f80e5591fc83c99bd29e10dfea194a6e2fc31e73ec85a3dde58444600fc71a6e23e060f828f379a210b68c58f2d5b45a72338b794b179c392783ceef4b15dc27776515ed1bf180a72c4e9603e3920dff3e3ebcd8f2157ca5ed379974e238d8cfa1055841e1dc7b71187ac21b1aa75321fd41298223545f80444ffebb7d381012911f48e027b8c46379b4d4462757e0ebf5893a860eb081b51b6a12318bf710282779118251e0a0b8f21e2e85ed17103e70d7d7ced095fe869db0a581fd4cc2f31ba16375d7b0c31917826e230b1ace2b972be5bf750ce83912159fea72d56523195740e791f43dd7ffd3716103feb90adf1924e8b831bb182dfe05916117059a6ce629de2f157e8210e142de2a4310f0cdc948f25c518dcc21f7c5a924cde36a57ffd2f4d54e0c1c0b481ff489538de7d16fcb02434d4f3ddcf4587759f478e16a42e3c3e254c03220ff296d6d87fe678770acbba5367dd8e73fefb5328834be9caa02e922ca3b56518ff830018d797dfd9020526bc9b000857e72619fffa1f8a4c9d3cf1c3a90a1e185f1728eb15caf5c7877818d4c3e5f9e3032870e811e4eaa37e64f0632d87dd8ff1c3f5df7e4802dc0dabffed6ae9df74c33d26cf1f9e10a5c221d665f363fa707d02c9848fd946e8311bf655d74e7039c8e40eec7d6462bedb131c036b61296b1f99b87b790a8095f047b63e3249fffd2914e64f4be62a9dbe73199cbdc32cd6c738f68c710adda45e177f5bacbc3caedc91d089801c00e37e42e7f44c0c972e81dfb0690bac80a000dc6bb711668c67597430bc088c45d9ea3c02861e5e28a4fcf4eedc7664247d1f91f211afbc8623037727ecdb7980d46f9f91f29b83eff8263d983fb02faef1bbb07d3762a9a03aad9e59fc9be7e8311058a8ad65b03d4954598cc84ffaa65de7d7e0fbd088f5a8a3865de08f7160fb38770527e271c31bd8d55e9ce30535f499aae10b155822740282c7d0d08b0c66ac2cd317d41e4315ef12b44d9720ecc4520a6c695dea38d7bfdd893b2e296f4258629e7837e2b579d61d5f22e81a64266d834c70f6980f56d2c0dbab8e1d3d90ba9dfb1e95b7bae446a3209f542a1e8b51dbfe4a4cfaad69937e4bda62b734cd733f917bf45045f04b3d9ca20571d939d39b446465ea1df084cf448ffcf91f5f7e84fefa7a737bf76fe11f3f1e22d1d843eef1dbd33fff3dff30fd417ffee3efff641ff6ff75ff0313fc6cec01fe56e027743e2bf7eb9f830b63ae421cff25786efa14d3a4e53b90b42d1fa77ef2aa519f3568aeeab639bd394de84899df77dff0eb67df17c6a7df17fbbf2ebefc6df1c7be2cbef80532fdb6f8b7f3c5eef1e369de20b0f9dc4fa76f6f9ce69bbb6fce45c434f8a740c4fb4f1aef3e81029be42b9ed03e11f3abe270e5c93941fe47bc78b0165f3555de3d39dd995f31fc7d7276c357b702fc9479de35a565bb17f206050a18ebe970470f51f1a08938c7094fbe35e1c7e32e90c2f04b77f2f646674b8437ef9ba128e4e0a6757b86bcbbfbf5d14131aa7367e85e7b9f6523e70f0c050570b96916767d963ad5db9b39f4767307e68b7ee5aa0a60b264c19dce9d5b82faf67f, '2018-07-15 05:47:05'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6631643934303635643563373665656362393235653361353064636562383833, 0xc53d6977db4692dff52b24af960086104d4a8e631382bdbab2f66e9cccd8c964df324c1e4442126412a00150b246e2fef6adab0f1ca4ec64f66d662c017d54575757d7d5855631dc7ff9fcdbfde113f762994eca244b5def5e3d6e1757d1c02dcadcbbbf89f2ed3c2ba332fe7d165f94a16e9dfa05d796cf42373d3c2cbc07377df5ea957bb0bf57785e90c7e5324fa1365805d86c7253fe7e157f36006ea21903807142c7a14609fdbc092eb2dc4dc26f83e455d80f92bd3d68186207849ffce599e775fa9ffb1701f4ec8637bd32fb50e6497ae90e9e7bc14a06863a19f97c964d3e166594973c867f4dbf7f09d3f876fb28cfa33bf745dfa3b237fdb0fff9f9b7cfbed93fe80fb864002567df9d9c1e1dbf78c925fb50f2f2c5f1d1e9c977675c72002583fec1fe37cfbe7dce25cfa0e4e4e074ff6cf05d9f4a8efc63ffc43ff5b94719cf17887db84ce362122d62374e27d934fef9fddb936cbec8d2382d89fe8c163c01f5d3107ef7e0f7657945c5b7593efd3dc20984a3b1d00cc87528cdf70e82a41b3ef3eeafa9e3e42aca4f608ca3d24dbcc3c3fd670ff5d2ee00ca07cf9be5fb50fea2597ce0050685de62595cb9d7b000c56d524eae5cc1e25f01814954c4dbfd2160f7b9ffa2cfff05e7791c7d0ca86a005535e86a0e03465577b4bbedafefb6df3a431b28cc5380da200fd6833cd80872bf9574f6802f60bc176ab0559d7009d0f22a99c5ae6bd5f05aff2bb0f54e38003ad63b01d73600c990b053f65fdaebb3c5d5aafef0f0803791fce711ff98ad028c645e0e1b385995dd10f0bb37dc37780e6cd7f5ee7f1925e3d0741c593d9271b0e20ed8f830fcf6a5d5c592362e14ec1d8c7fc35f2ff8d7e099fc7e3ef60730fda3f04d3f380edf0c8293f0cd7e701abe3908cec237cfaced100e043ceebad0b5e11ff9df785dd73dee9c80f4fa9fe3cea9e775cfba8846b7fff99ba317fbdfbe7cf9b24227007e0aa39cc07036a063ff0016e3383c0a8e42dadc32bf7d42e0e011048e7f3bf9edd41af9f9d9e9cbb3e3a3c19f19f9198dfccd974d1d67fee09e54e7ffe2bbc1f1f1c9e9c99fc1e279df5edf2f9dffc9d1f3fd93c1e9f33f36320871f74dbf7b54ed0d82dc7d33e81ed74af7a174bf5b9b230874f7cd41f7b4560a8aeecdb3ee59b574459312ed06e37a5dfd3cb09ef7ade703ebf999d194000754d9f7d96d9c9f802c7281bb8d72def5ee9d250828d8bec9a4646d39bff5afa2e2c7db34fcf1fc3a9e94bdad0550262bef16718f2bfe9a678b382feffc62964ce2f088c5846e44a57e9947938f27d16c760ebf8b70b7a79f5d671ecfb3fccef1b8d19b289dcee2bc0075c3057f5bc6cb98948fb21cde450b54d4cb18ac83e4421ec3302cf3650c0c7095143d29bb5f05f45ac4965551c4b3989e7c6a2506420090767b49f1d75994a43c57d3d263e1536c27a0f475e13d80fdf759761ecd00a3bf232c1747f3e17faacda8181b7301f10b56300e1226bb30900077a720f3c2e974a2fc723907dd5c88185c3f4c6d1e41651879b9886605bc491d7092451dfef5f000545a19b3ac31d83c5af81fe33b452d78150023281d3394607edb9b6597bd69bcc8e3096c1cf73649a7d9ade9e8433f9827b49b64e94572d9e9383f03afe977206d51c6d1b4e700c1606cc342e1fd655c0e5b96ef4278482cc8b858cecac24f02551ed649f96af05ad50dd3e56ca6d69c0d347bb5cdd210fff626d0cd6a10c860c860964da4ea95022381244d47862792f138a4758079b976b199915e3fe9fd18dbd046d8e10dc9c85a0beddb33337c412319e634ed475bbac39806b6475ca6d3f82249e3a90665f5d4d088ba2b18b875e1feecbeb3712dc6a1bddbfee4667b35a841d784103edfb0c7fcf873529445cb846b536db21b4d1278a868f250813cd4320d98eb8e99c9c3c3e38b8fb2c85e7fc479d5369f8d147b9cc700aa25abe3a2882e8d10594479348f4b10f0426898fa3c2a43a78c3f83caa1229414f08f5fa05308fff8c5f40ead478b295f8fc6436bc75aa30516b7828061b46c21036d8b381f5aaeaaf40011c548f6a2c56276e7226ffb2385296d6285a937466906f2cfada10b4ed68ae76ef1874d0bf64c8d2c317515615203cbf6b6790719e25576348caa3c577b66ec1f7e2eb7902577082833afeb31b3592b038bcffee314b8ac564134736c4a5d95f3594ffc4de7d0e92aca749d578e46ad5ec1fbb4061ae54173446293b578606da86804ab89f6cdfae9b4b6a7a2da44b0cca22bbcf16a16b14dd40a3b334636d3991002f1024e6f7d6f9afcfade88c2dacebc93d6f695d9afedaea8b301424dce553501ee096126bd2d5024cc6fc3fb34bb1dba353e04e3f122646ba187cf88460a26631add7c202f110b3b1dfcd92b9339205179e941bbe4324280d45ca1adba773a22cea80f20801ca050705e3727a13a7655079c7373b25d8cec9ca2a503d560457b9ecf14344df99d0927733542cb92525a09a1b7a9e4b3d5b797c7c01093d87dfaebaefbebb4eb3dbdf48d92297330adcac995c81090849f43e2beb769e9528d3fe86f797b0305da1617d81af58811a08ddaa1b3eb74094eb022de43a3dc4cb2cc16c9c49f4665047ca4ed75164cf75439e426b05c311076be18c2ee22b252af21fe00c0550fa17791e4b0ef343c3df087e57931c993f3b88ec1a4620c16719c821cd56ae88abd0a1b22b58b6f80ee247603ec7268cd40e95f2846c94b2d43533fc28a31ca4faae911163d22d98f178c9307acd6c7c81463c68b4dad7dab8f3c1305619fac2a5e10d37124e8eb498e1bf48aa653575a695afd9c164d6a193a55ddadddde25b0995b29345c7691b2af05bf478331ccab06c620928337771353c3fed8b0339b1b156b03f104437f08ff7cd1c743f9edb34f4046ba3f4bce8be1fdca9fc597d1e40e9fe6dcaa18e21e446f107c47f06c67b01bed326966e68ea2e82bf721415336cc6d4f8d5cb765602af3e2b2dd78903e623d98025f8fe755e52b38520d290965a155b4420a15d92c5692535e832df4c26ea33c0da5a4d391072aed74be1320968b7e0e205eaf2967cad820d4c8de7017b671b60870c438cfb3bc392415ffc9310946eba0dad90c772438c1424c45248c70cfceaf9527eaddc38bf65c6dc96e35c2c5044fb7b80cc94905edf1c4e992b1f2643b29b6f5c0e0ad765d68f6da75b6414842a7a103664e2b361afe3d33f7328fce67f170a7efc729b0817eab38bb80c46d8f7698ebc0931ed8f149ad8ad78dcb826868aea59955bd2f60e4bfe3ecbf0e1e000ab92788264fc711901d59e7cdb2680a56739d5df3f8122c80fc0e1c64bfc896f9848231fe39aa118cec90a8027eff6b9c4ee1d7fbf813f810e04fef0cfc45ad085a7f9210907f9d9d53c1ee3cca3fc67948f2615214c7cb8b8b184f78cccb4fa06e4c83f6d09367140450fd1dc174d9959611bc7b35d42e06aaca6894c2960f9fbc8f7956dfd3f44fefa034997c28ef6671f1640c1c6081d0611c26aebbe5fc906d1f22acedc761bd02430074b38fd1116022a0cbf6941bc024ee60200b3d820956762f2acbdc7510b8e33b1ba063d30592fba7cc75aee2688a16ba92d102d88a0c011f50bf9fa24bb288fd147ea4d95479f2e1349b903ceb4df21878ea6c16e39b0bbe23f462a2982ebbe6b9771e83068e5d14a331e8897b0d085645a014c77730ee0f3027852aa81741ffe42a994da937c62a7a34dc87ab382ebd7bfbad077cf01319fc64c0d3484505446d02d8f8074090ed7febd8cf220ae8ddb3f9793c9dc6d3930f1f5c19a2668dec12123efd3c9b01dd6e4fb89de13fb4772cc6a46ed96c6af8d666e2600347db9dd88af27aa01b41fe307d0c663610b21f2626fa840d1945de0e7a5b3d3c48390776ddbeeffc5b325f6479e92846c7b0842aa351b86737747e4d9dae740f2a5069b35a6d79f382fcc2876c59dae2a546718f0c0915dee4556d1102815a7c5d17d8728366eca8f57f078bee24e9b67aef743467d84d0ec397c0c7b4aaa1253f409bc53780d716867ba8968c3b77c35604d67630eac80c124a2f8c2cf469db484585b541bae2d2b46206061aa066f82cfc1a3cf4123547d55bc862e1af006d71bedaeaebc7e8860a8fd56a827ac38d6ded95cb48ac80c0e39cc40b72e9fc7bfd3c8c45f90c59061508df417ea90efe2532406d07e85cdbab3ab6be125e40d16644a51209168778b4a81b56ee6b683aa912f46bbad28149733e2b5b2b9e64f373740cff0e662e6ec079365dce6289585d4540529440e0f4ab1ae33470813685954d30e2f271ef8641e20656921573421868ef3a4b5217ac294f4b9ac1be8d1b20fc1e14c15d15233b86261595001ad09df430310d4cef039ef22910183e43e995235c6773ac54e1b115a577df45c92c9ed61001710fa01f4187da849b31620180ed307685d6b0f3f0a00be64951f0094005bd5a6cbae6088bd9a5570811be46eb0a0ffbce7088c29ff3044ea0c7658c3834d6af81d4fa1606cb69766fc105838f2834c708bfea4eab646009981d3d50a7d35a69c680ee6655ecb660efc2cce37492c03221c56a60d4084105c53ebae52b4e9db02a3c3e80be86c5bd3e44cb54adec35aeac26646850c146a3eb1a1a485addf8e141b3756b63ef1e8a43a90a68d06241dbe31a9dd6ebbd70108862d030891e78eea0dc2d04cd6e15c3e367145adbd4c375ded1faa14b430f5d07773af012ce62db46c8f17cb5d85aaab68d463b4a46a36797621d7f5caef3a043fea5a53c76da53660c0bfad546ce553bddecc0a20453140f8c6573f85bf5dede97722c0e4050a778d2a4d675033fc69fe3c912373f216e9dc98229756a3555a821ad6637f1d45fa6ea51091f805cf8c5c76411d40f06d5f842420fc3bf7976bb6d2dffcfe9c734bb4dcd4adf0d352fb071d8a4280c059b104d2d906af042996f9a075adba3d86f290ed5d12cbeb8956d6ab55ac453dc998d3a9ba49835b066ed65e583567968347a9d97370ed7866a059d8db52e490209566f6c89c22ea31083f3d888a38dd5633dc394cf246b7c85ca706fa0340b2dfc8ecd6ae6190fc257c8739be76869436c5cd7cc0611acc503713d56c898402333e8485a8d9b2caccfec5ce724c927cb19c524c0d6073c62e0eb1288174f87dbbb83edbd57dbbbfb8ebf2573179868e75923c96490e31a9bb18eabbd1b4911f3338772f526d29b5beaabd683a62b70f06e2f8e26574df32a997e567bf8fe3109e15946962aab7ab11f2679b228dd229f684b62b7175d479fddfb653e1b423985eb7f02fe046b9a1a83ed996745719acdf12c6ba70f5eefe40a63582b7b7e14bc618562c610c4d19f97098311798a0b94839ef4825a10886967398168c66908d543e99a7ca321bc7b0993e60010ac5dcbe29292401a70a73a172390b1d405ab2ab57ad1ec36ba2b6ceca6f10c386cbb3a66502d15608800af3f6dffdabc31847e5fa74571955c94aee72a8b7f7d2c8d63769ea880d6567896d61c722dc87e63652c6c147f6138178cb1b8e24a00d1be4fd28fee3c9e26910f2c250730b3b5612340e0a3e305b6672d81a278e605f10c28370b6dc70ee749e03b1dfa857212380284e416b4a6a2907e22e17a57200f42c0c3c251eb5fcb2cb6129808f304712fd0ebe253121f587ef2f144bd167ebe4c993b4c9be23db113489f29aeca1fd0c86290a1159666e5f6791c2be303816edfc5e5e31a5ad9c96292ac1f05936db03106bddbc1601c7c1edd092e8a6ed30a0eeb142f3746433dd0a40a6be163962f3e86201927329dfc14382e9e1ea9ed272742bf44897ae4c6a88444a6aaec328aa538b7975587f87bbb93e38f50eaa3f5ccc3375519970735b46ce4ff90b5b10a6a133310a3dc1cfaf909c9bde45508a53aaaac6aad384453e24207d45032608bc4aa21501bb73be0285b60081e36ad86ca1288e9f0da96ea46d40d8dfc5da2cfe656fb5ae3b4e05acda2227c61cb6cd5a7b08687fa2236b7eba69d86c40feeaebfeb37d484df5860b588b5715c6b18954fc56b5b4bda138503a5cb22ce2bae0893c629923276da166db77749999a67209f14fa6d78e8d0d017b6e7d66d15f04fbb6c6bf7377bd0ff248f8e5ff744c2a04bb7660fad5a4314eabc96c8aa5ec8bb5bdfb45d7cea03667656d59bed296ee863a759abb4179a00d8c23505125659bd4d8968a58d09069d8e16a3b028ea11c58196ae3abb03c9a401d6852ee111d6b051fabedbd547f955f4b0b9b651f6f67836303a43ab8ccc69326b424977a870d13d00856bbbd6f5265ba48c5b643356d3b96ec09ade0c0d034239aa3e50dde08acb0b10c2b1532b19b0bd3d6b470d6c0668fae15c64abd08098a588d98acef9640f0732ee238b2ace7ab53f63a192ba138420420d8490b00c27eac2697e4abc48079e4e1bca28faab58afeab249cf5dfb9514e3c02171312461172d1fce831d5195fd4118d655a6d230f8243b11ff6bb78c1a5bc1adfa496471bab63fe9935ef53996652d65c507b657b4ea1cd77c61624c8067e7433d3c10f09d4ae233c5dd38c3c90631941c9a0a868d68387f6cb731ec6be2e1264ea5c864c77ec592ab95703eb009ce1a7b6be531c18616d986f41325bbf899edd8dbcee617cdc00e5a5bd8773a0dbb81cc15cbc16f04dc80aad97241799e797283d90a8f6a9fcd619d4f2645cde80fc97ea0d9dc66f9c70af3a17ffdb7659cdfb999710bb090421f7ea43e8e14e195791281d5367e460916b02b7858498a8c7a08c3f5545fd849f0f330521b09534ebaecddc7d35144e26d1c66eac99c4853030bdff365329b8a392599453cd377d142f48fbf000728f9ec83a9a7b0e7129c80d578117231d2df79ed38437eed3a3d274043945390bbbac788ebc77280e33bd6c939b6e7e207c726ef34137fd260e94f96790ea5c751a1ac0134da95a2e32009f50981713f97b0d4eebdc448861ba7bfb24123533014b3c452e20596a35f43a00b94e8ee7226b66edf12d5798bf980f1b4253453a0fdf67860475b88a37df0cbf563e5c80dde4d67d8bee628484b435cbc74098a21775eaba325281e83b73f84df64239a737419e7bdecb1a176509120727a38b4ce387ddc2ff5fcf25caddd62969405d8e19f89badf1367fb9ffc737febfc0391d53fff77dce0bebcf20b53dce7747a6997e5c9e53165b49244005f5cd1aebe3e15eeb19e6574c365337f1615e56956d24aa93d512c2ff0d7f91dd86e47a84b03994d88b1ed7458f32bb1ccf100527a59afbabdfc19ccfaefa16609c625349ac6e7cb462b2a74bc55c0c4c2686a955ee1239eecbb4a6bc7dfeff7fb2c553e814cf974f8c94e69fd2496466b0c825a8e3e8d3deb944d95550e4eb448af856e55634ef652729d5e5856e81182b503683d86e642fd6c26499392a365f59a38c5243a50d036d7a070d38c13121e01e7a189baa697357a9a21d4c7b9d4363feb396a551d553e94e69acd59b01871a8b86615382c2e0392a2e27be579f3c06a328b23fc7ce16bdd2ef0f34d8a0400da8b010374b30cc9844c66f37df101bfe2962d6b3d3d213e33847c2da3617b6c34ef70ad8a7154f436ae27575bbaf31cbf253fb47b05e7c8e522528cbb404d46e7c8695413b0ec696b4032a611ac13712680315c4005232918d349487b27dd46045eb3f3882bc638c7952d0ec3350d03bb11f39c9a009052a55b128978be14dc2358685654856628999a23fecddd880aa697aa53baa808abe5a34bc6cb92b9967e968c8fe186bc92959f2bcd0c54d4961f05473a9d56e98ad179c7d3a78fd6d03decd6949da613eca9ba7208955ab7ad04c554b3b0d1befb32d0eaa4fa3d685bc287ad6d4293e4d1c3f2b7f2f18083dfc08ad16535c164fe3277fb158de505acab2a0d2921c06e85013ca3cc429b358d2ae411bdd70c50b0ee1e0c6d2ca58c846f45e5bcea773a3bbb5be0ec9e61b2a17cc8698cae4e67d63518bcaa76c6ac90af3400ab345fb32ceb6421b1ac0c08e2b08accb0fabaf29adbb94133b51b2cf397b670d32866b54014f6825937b44c0c1a66772d05ff0891d0d726a38d45bc656152e2f6cfea144664a171a09369231860e44732b5f58f062f2dfc64aa858449ccac991b2269a06ddb69870c15cdc84fb50e3af08021c1c34c25a992e9389499042b5f351cd634942f72c7aff8b697b69d49f908924166c86082b3d679fb2386bdd79000f5084f05385e47624728ec9033cfc6d50d9b31e50a0c8d631386f9f8842b7c1ba6bd4815b83b3662b555da722536bb3d5f16740a146d735b9f8e852258aa0a30afc1045f70ee2543b473c2daa3a650b6e3102c1d4c43c6cf87568a0986f2bbf2d59b388952855f71547865381a33bb0c654a5a2f09795e732d7d6e20f6948afab301623535c94a400587b3ec86b6414dcca8fb63468cdd1beb709c55f005f1ae47b2436a01b01a73d5a10a7f3d3c54ce4dbe2a03a6920c026b92cc177cdcdbd8b2727cc399f3fab32b2b0aff35ccdae055e8859d2b1cdbcaaf8c06eab696b32229ae9c44e9ef4df97d3356dca68195a285bf4dd71af9db993a120daa98aa439c95ca11178c2a972950dcbc6d70ac688ccd8bac28b2a5062220348e5a8b96a1f4114adb0248ddc6016da151398ed1ebde32aae189966175e5978e6b9fd93c7e50bf565a3f2eedec2cd6caf97235d6fc9848d43be8d1e377b1f1e9d7c30325d9b59fa284f4735d13b530a17a58d7505332d44fd2b4122f68f71afd9184727d9dd73b56b18475b15f098723f8966ccb167164a75cea38f0caa773d7e1459b80ab1e38a0b93095e3ed6afed29f3d8a5092d8922f35c41b7c619b220d9d8c12244a599c389e39eaf0eeb7d4047ad32c8da5941ac824753da6ff4a21e5fad9798d7caedfc86bd6cb50435ec334c94f7aca265d7a7d27daf7d6dc7f4c639ce13ccbe30ac155ca72996d237350f8cd46918fef5a4f96ea28fab5e14d505b5758694f645ed7751aa82fe009669b8b6446cade9f35cc4d3bbf536b13abea3125b779f5d758674ace56caeab90a4f7f73afca7251bc1e7aaf7f7d0aff7f0a9b5cbb2385a795b2baa9e3291f4a3e9ae3d592cb25095a023ad8559ffdc9c73aeecc1ce7d407bd8e6e22c9507c78901a4ba29aa8be9ebab91dab46d124bd8966c954d43290112319791acdb697f9ccd78456734542d750e8591adb531e216c7879c05b0a851554a0ad711ef0874f0e2524d2e96c35bea0687c352179820a19f159f80603451e8da9dab6aaa0bad975e9c383d9ccbad08053fb4eef05bd48e609f7125bc80d03114b9928f3cd2e9b4ed75784b483a7443be50ecd6b2eeb9fd3fe46c72995c669607e8b6aa374a9369340d64966bb46f5f1a7466b326344c66de8083a0ff8482271754237af16ab13a2e5c31f71a45aef0be3bbc11efd28cc57acfd4f414885a2bf161d21107dbd474518376cbbfb860fe4342626d44207bfaa15e688d0c517924f569f9b49887e64a353437dc8be833176f52dcbbab4ce27ca3ac4be729301ca26369b7ae67aa63a15ecece79e78d43085242d16b0c1eae77e517ed97eab867dc02ea96d941b729b7c4c7a02ccf12d68d05c8a7bf9327d1fd3c026922175788d46c1596e3e1d6180d7cfe740ec8ebffbf1f4e7efcf7efff0f6bfcf7e7f77f45fc341bfff17f8d7f713304be9621124213c5c25f0b3efe39e8cf101669a60a4a18f7768fdc7871f7f68aefa3dc3689c5061a90fc4b86b54e13e8372d75b290e87d2ff8cef9ab09d77489c5f8038bc7ed472086b588f669f1ea712cbf6057a13d8a8fdc4f29153451c122c7c110c6dedab879beacc7fa89061cc2bd3ab9d196ddac6afa571d7f9b79644641dab91bb06f158b071061dddd2570b1b0e0bf5b18125f69f7e070b7f917d7ef87111e791183972cf5496d3a1c2d125b034089a9d2f23e1190fe6781b4feedaf0c3847183da563da5594e8e9b605bbae341235024a4c093208650de02bb36c863f126a68cad05df0f90c021ee0fbe44cd8521f8fb6628d7f62bbef0be086deb968a71a3f0d5a0ed5ba539390664609a0fb6fe195f8ae33128d1a8601aed216b3972108004aca8910d8497ecc05a83e5622ad786adaa97bdd8761e2a0a54736b8fb8ab47ca983bd4423fbdffece36ac9516aa569cb9790281c7b281b4d0a686b57cebd6c9cd6737f16aa5612a95c995934e70f8e165bcecac346f94e17e714f9e4ff83260f0f0623f315056bdb870777c7aa1599441152fd259baee5038791ce62f3f954538c3f0f7b6da96ec6141ed9a37350b482cf5d8564e6862aab4cc75fc6d52ffa14a5503090da1ed13666972fb9d014f2752ca38649f52e3d09a2375a79c31ad8660b7f430b0a3d6e68a023851bda98a81e5dd9f6f4b75f8bbffcea8a64c7a98f067839aa3c5993ea4ad1fac3c4a8c09b7940982801020279efa76f5e7ef3fc5bfe02f9ff44245d17d07a653c57d81ba163d85747055d9e8149c6eb826ea61019f45097ded6d9be6632d5d965fdf60f718bae9777fe02ecb8b8aea4716b33a37dcdeeb6b22dd74932f604a191be41029fd5157d605478ad59446d3202b60d99f1edd24d2c45106ff28ddf26012971aeadc6b8a6d117afcb170c074a862c8cda9d622dea142f4b074150b10ef836bf2f311084cd93cb34432f1f0fdc78e11b778381c9273eea2f7952f21510fa1aa4d9b2b8a2627509122a795f69c35a5736bf36714b935989058119d7680733a58dc4a0fc5d63f85812b30ad20b2a100a31b690e5e5c2c7ff13e9c09427f1d3426d7d3748e54b8e3a71e90a8b6ad73eee6d89dabc9dcef4a531aeb56cf4290e7ee721bf7cbc4877d8fa1780f8a6590d043392e4cfbaf09f73717e759ca138439d7fe91fbc04c145e54f4cf1a76556aae243533cd385af4ce1a52eec98c268be081c7d067ecf385977786bb953986b5847ce93c3579df1d34bbf3a05ba1c57ce33b7cccd7be09df978275b81d9ac25b9c2c4da37548adeb55f84782732b6a4481a36e6b8956a81724e8a6f427a18a92ad26837faef1f70355698983ad692dca424c5324931f3b0e886786ba16add75c227722db35c7bac0ec53d501a4fe473163583b0f28d84552a374000eca7aff41dc2058f0605b2c26250187ad0b248ac79086d6d3c742bebafe8a86ce621bd9c6719c8b8947a0ad6f54e806bb49c95436b0ef42707f0ae613cf6c3f1de83e782a8ab067cb7b921e3da8e277cff2d5a1687bf3e1d457bff38dafbc758cc8b2ab4d6b35175ddb4f0cef6db197e0139db86ddb75d46977c0920b2c0c9e9d14f47e85dafc1f24b60db216d6b0de8f23f5ca5c3a7cc897433b759401fa863f6857c11646e8097fbf1573ed1e20b1a8a78401378789f9150ab5ce89a7d8ced82957f9b4c414053c4e62acb3e36af48c53ba7518bd5c55baa836ad8a492fd467d7c6af09a9ee97ec7f1d07a6eff632532c8fd56349d526bcc83f25943f03b3ffb1795289f9626d404eb7e49ca2b739bbecf19246dd133cf7c42b75afbe7369cdd6bc7dff5e9d6d25d3c8db8a65436fb8f6b68f18b9751dab7375324bd0099c68eb55635a268b854d2a5c4b6a22271dbd65c48cbdba67a2d2c8cccb7abbaf16be74cabb7a1433c8b362af2bad33569693a725f5ca2d4d2b17c7de20d8a1eab10e010fe8713b546e3cb4cf14cb376372dc943f3aa441ef81b7c16ac94b2be767a9376c669058ff7500e0335df6d5ef44b99d2fa30c80e005b1168d821eb426aeb0f87ec2fc430606ac6c2d8b5bc7d015c8ede4a75afbc8a53fea3086d51f1b6cfbf03be9662b7770b5d25a0bbebcbf802b062aefed5dc0bdfc3ef9251ac617ced2cc53b4b51c4814068107aa65ac83d9832acba80e356b1ea5c055ac12084fdc55b06f69bc1617eeb6df1fe883e1f2f8bbbf09b75a6d0db94cf07cdc7b5e6c2cdf6fb2c25d89fd35f1de0ebe6f537fdf7d3642a5d863b03ba42fd7d8cb7add4fe9e8350fb5d04b20450044f4710dd7315d03d1ac393ef7ce8ef9aad994268dd5b52ab7abdbe8a6e6e163144dff76f200e1059d3bc4ee7ea9fa00238b431bfcf2e2fe33cbc27c53b9bf15f28926bca0d2164747579aad4abf96429817a7868124efd95a46a4bb386f4aaee26c793df19d83d3f900502726fb69ca7f2420d392fc9b6e8f9e38e9e1cfbdddbe08675d8c32afce19aa186ebc61d5acfe6d21f430ed96fa46dacb39915ff8d069bdcbd366a2b22d7d690beec7e12fc2f, '2018-07-15 05:47:06'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6638383438356165313966393266636531646336643566346564656235393861, 0x7593cbae9b301086f77d0a4e8408561c74ba69252cf72cda17a8d43d72c2843835363176694478f79a9b819e76031e33f3cf3717eaf4e3ebe74fe9ae6c12a1580e3ae16525a00469e2dded6e413f1273d5ca1801c71c4ecaca33ecf0c5bd0c57320ef1ed7bef8435dc2dd7804b955b01a88dbd4bc365ae1a6c650e172e2147ed3e4ca52aad2c604f7e311d8474f44946ade77332bfaae6a49c196f6cda7608dfeed98c45424f4857d7d403e420d8034b9519cdb8e0b2c06726c4899d7fe2b9a2cc613be81ec6f012943519cfb160b5c9e0379ce92be197d83c2a50976025f442e9fea4940026f7a8dd88d13907990f7415485667ea3b43ba99396834ab2ad0f1c47465869a2bafb12ba5aa21a707094df08d1988d1d16362a68b9aba87ede75713afd67f74524b3dab70cf97b88ce211f7b9062144ba45e1ec6aec6996eeacb1fbee6caa8fa297c513b5637ed22d77513428fe182fe295f33b2d4a9754513435e0cb30d44519440d818bdc0ec7680b1be61acc9c7293e36da0498726fe37f9db90f33811a42301e986eac3a4b07da5d3dc06cbafc03face7738c381c48a7c158ed47eeba192633c3df4bcc4c7682824bbfc1a89da2fd96ad8157bfc324f0c12b5c986b194adfbbf89f6376758d1c9d1d5a87e27e0fdd11911df903, '2018-07-15 05:47:07'),
(0x676c6f62616c3a7265736f757263656c6f616465723a66696c7465723a6d696e6966792d6a733a373a6638643738666532366562326262376235376362616165633133626235633864, 0x658ecb0a833010457f454221098450ba2918fa115d751d74b4d39a44f34044fcf7aa2d555a98cd0c77ceb9213f9d8f3931bd6c9c2ec14b346d03066c64c44089bac7274aeb2256031155b2454467d9413cae09fc203c74093d08e3cad4001fd937627a3ed214200bd16311a99a1d6fce65cb4008ba06e1da650d7cf41093b7d9562705b435a33f55b0d0cb03e532dec16ece3d601ffc88ff7c6a9a474d6cc5df663c5f4f44bd00, '2018-07-15 05:47:07'),
(0x69617063686961705f636274612d77696b695f3a6d657373616765733a656e, 0x158cb10a84301005ff65bf60936cb2f2525908da9ca2709c650c59b0b63ceedf4fbb1918a620e07b4141ef61dda6f945f984cf170434f6db4837060fb254c5d4c792580f6b9d15aec695636b62a2fc7409347c9669dd1f71f7c0b3eb585d74222944cabf3f, '2038-01-19 03:14:07'),
(0x69617063686961705f636274612d77696b695f3a6d657373616765733a6573, 0x554fdd6a833014beef53482e85b6897f59e3951b520ba50edd4a777996a41ad028eaea60dd53ed11f6628d4207bb397ce7fb393fc03cf6d533ca50ae847c870e853d7388cf90b5b02d0d1755c0a01abdb06dab1c8696add7e338ae14b4bc34057aa92ba525aceacfebb1a92eb2b3c08ada4a71e0eaf767ced5a0740b85bcdec152c89e77aabd0fee24977ae025e842f6cb8faebafe63660b68d1d47378d6ffdaf93059b5f3820998b3f338ca9e12035ed274ff989e0cda4787ed6bb48df3e93ff3ed31cef25d7a40a1628e613c8692284f26d17518a2e22c2805bec11293c0e7e088332694b818806e1c31f90286e2d3f32e7b9b1a620638983c604a7ce279814b51f87d03, '2038-01-19 03:14:07'),
(0x69617063686961705f636274612d77696b695f3a7063616368653a6964686173683a312d30212a212a212a212a212a212a, 0x9557dd6edb3614eeb59f821550601b625b929dc4911d035d9a2e19d2c66bd2f6b2a0255ae642890249c5718b027b84bdc21ea01743ef769b37d993ec1c8a72243b1b3a0749659effef7c3c47bd8c8230f2665469a62e4b5394c68b867ef44947fb91975db33be38d75140c0ffcc89b14d389364ae6e9f447cef25b96f3446a4289a0e43dbfe1bd49df893b933ee816d35341ce9fcfc8c992d3826a124b9aaccb5b4a12a61346963466248373781e1c117aff2778633961822ca43254b0986710c848d4802029d386df7fcd4971ffd75cf098da7330328a6972ff55252c67d65d2ae79ca95cee11aaefbf40e04cc29f1c9d284605ff4863eb08543914026ed3ea640fd574298c54f75f285993842f4aed7405264e959242b894a0264830e6f040938ce71c00a086df52bd8795cc219f058f795d8096a09ed0a4e7d5089d54d12c86134c4e1c7bb95c608495476288a08f3de80214430531d80fb2546c71ecf5fb1933b4b702e0339670da932aede3b7fe191345048e0d40a7fb4c7bd3b4c462b0805297547139e9d32929a8a244ce418d29800130cf1c2c5ace1523565d5a332d176645e10c03f46cf29dc932043e1434afd3cc56dd25a389e039f3084f8ebd9982d494d41fa0f912d2a8bf13fb1dd802c6d349b68a207fa3596c38b4a8a02903d3fb3f529e5352280ef0165478c4291c7bc1aea7b68fe9a40fb97526a5984e049f22b0ff8de46ab5ea59106d791b205fd1bca4227af9fc178be24cb1b4cc0df47aa1585c02ba40b60a2a770310d6491f424efa10bbd3993ced7649e7355bcd664400970d34b8006a774e68bc640931504544423f18f987c1d0df1f1efac34a46d85dc1d53a22a383a1ef775eac739af118c9895d8dc8820acd3a27b3b7d607f409508b88dff3fd110225f34477de302cb42d0efc8d18ca29948c99d652915baeb9818c72094c8d65893106fdc0b79fb66a8a7ca1dbcaa30765a9cddfbffd0e05d03c015ec5a20435cd3f6206fdd03f3a0cf643325f037a9d6b9615027c11aad23283cafe45ef8ca74bb8a5c43ad5489384156609d8f5877ee7f4ae60707acb90d230c8c8a2cc2b32b9e47c4caed3ed6e5a72adc00d24665d3d38b560552d22df3ddbcbf45e4c85d07bc6a5f97d07fc00c6cf087cf0c127f613902ee91a0923ab11e48ade32acbf4e2ab67d5d71b324376c4d6024c638173fc47343bbc8b70f516175229e2ca95e4641d77ffac3c30f413831436d68566cb1c60a15c336421d3c21830ec154aae90da3fc82e669092cb8e0f98df6c6348221ff196401c84ea0b4542aceb605e779025316666153e0e362e046b0cd76388c1eb9af2038c0b85bf1acb583b3791e36cecf9386e410f3c820f3a6f6080e5f72c1ae1855f1f2b2c06637e558f1a9bbeb9b0c425c6b4308f43f46e798470154321845df3a26ac05e6b06f01841c50e931d8612e5c5503cb1bcf237fec6cce78c21e112170afe54fc047a6d6add33318bae740d1867fc4e7954c4ac1b651a94eaf62c50bd3940d1e6466dd3643d1cf1a5059f0f41d55db5dab5e1bcea46c16780482f754e53c4fb74e5d5df634883e71a88342be9f6cd246c682dd3251e30e78b8ef102cf242fc17aab02bc631bbbd0a1cedf2329b33e5ac02aff2c4f384dd35cf209d85929941326f11f9438bc808330e22b958686630b9e1705445a279bc946a3b19b7f1c69f6bb29ec27672955fcb1b86e5cf6d85960933250ba64ceb02a2d5f5e5c9d9f5ab0bf40e19d499c0ed7343a00e0bb3e0c01f0d60380dc38105c9ba05f3d39cce054b5ad1aab3cbcbb7e7358d4228e449f325f0095e7d763793f096b56e841ff83b8acf63dc0b2cd9b984e1684717afa49db42fa8a10f9a8f78bdc06df9c64ee25ad7722438c2ee83ac9ad2dd18b4010dd761bbfff039f4db6a2bb8366dbdc0f75ce14dbda2708b10575b3d3490a23c1a584ac26fb5e6c6aec2b6f56637eeda8f76ed07832d7bd89cd5da745b139761cb89ef9cb8ed689d846d27f5aeaa37eab7f8d88661b311ed966d5987ce7a585530dc31ac3671bd81ed027e347c801838175bcd87d70df8cf853901f2ddfc4ae31b18221ba6ee52e5a5a0e9f64c7adb24e4eb71759bde31a5ed44b51c087a07bde1e64ad997ae6bc71077a51aebd59e86b5dea97d37ab1c0707f5e91bb77dcf13cfd2e5f33f, '2018-07-15 05:47:04'),
(0x69617063686961705f636274612d77696b695f3a7063616368653a69646f7074696f6e733a31, 0x458dc10ac2301044ff653fa06c629ac6c9513c782a887a2f76c11caaa52ba294febb0952bc0df31e332db6a05d77bdc9290d42a8312b8c050d6795be1d9fe971578a1d18f3a208195c64d2dc52d46c93a97ce54a369cd97fa9340e64d9046e8ce3da35fcf3eceaeddf639a3e14138277cc85f9951de595cacba12f7c13972f, '2018-07-15 05:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `wiki_oldimage`
--

CREATE TABLE `wiki_oldimage` (
  `oi_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `oi_archive_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `oi_size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `oi_width` int(11) NOT NULL DEFAULT '0',
  `oi_height` int(11) NOT NULL DEFAULT '0',
  `oi_bits` int(11) NOT NULL DEFAULT '0',
  `oi_description` varbinary(767) NOT NULL,
  `oi_user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `oi_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `oi_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `oi_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `oi_sha1` varbinary(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_page`
--

CREATE TABLE `wiki_page` (
  `page_id` int(10) UNSIGNED NOT NULL,
  `page_namespace` int(11) NOT NULL,
  `page_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_is_redirect` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `page_is_new` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `page_random` double UNSIGNED NOT NULL,
  `page_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_links_updated` varbinary(14) DEFAULT NULL,
  `page_latest` int(10) UNSIGNED NOT NULL,
  `page_len` int(10) UNSIGNED NOT NULL,
  `page_content_model` varbinary(32) DEFAULT NULL,
  `page_lang` varbinary(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_page`
--

INSERT INTO `wiki_page` (`page_id`, `page_namespace`, `page_title`, `page_restrictions`, `page_is_redirect`, `page_is_new`, `page_random`, `page_touched`, `page_links_updated`, `page_latest`, `page_len`, `page_content_model`, `page_lang`) VALUES
(1, 0, 'Página_principal', '', 0, 0, 0.059883443248, 0x3230313630383331303034323332, 0x3230313630383331303034343335, 3, 557, 0x77696b6974657874, NULL),
(2, 8, 'Sidebar', '', 0, 1, 0.520164216747, 0x3230313630383331303035303332, 0x3230313630383331303035303332, 4, 214, 0x77696b6974657874, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_pagelinks`
--

CREATE TABLE `wiki_pagelinks` (
  `pl_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_page_props`
--

CREATE TABLE `wiki_page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  `pp_sortkey` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_page_restrictions`
--

CREATE TABLE `wiki_page_restrictions` (
  `pr_id` int(10) UNSIGNED NOT NULL,
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(11) DEFAULT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_protected_titles`
--

CREATE TABLE `wiki_protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pt_user` int(10) UNSIGNED NOT NULL,
  `pt_reason` varbinary(767) DEFAULT NULL,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL DEFAULT '',
  `pt_create_perm` varbinary(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_querycache`
--

CREATE TABLE `wiki_querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `qc_namespace` int(11) NOT NULL DEFAULT '0',
  `qc_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_querycachetwo`
--

CREATE TABLE `wiki_querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `qcc_namespace` int(11) NOT NULL DEFAULT '0',
  `qcc_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT '0',
  `qcc_titletwo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_querycache_info`
--

CREATE TABLE `wiki_querycache_info` (
  `qci_type` varbinary(32) NOT NULL DEFAULT '',
  `qci_timestamp` binary(14) NOT NULL DEFAULT '19700101000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_querycache_info`
--

INSERT INTO `wiki_querycache_info` (`qci_type`, `qci_timestamp`) VALUES
(0x6163746976657573657273, 0x3230313730383137313635333230);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_recentchanges`
--

CREATE TABLE `wiki_recentchanges` (
  `rc_id` int(11) NOT NULL,
  `rc_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `rc_user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rc_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `rc_namespace` int(11) NOT NULL DEFAULT '0',
  `rc_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `rc_comment` varbinary(767) NOT NULL DEFAULT '',
  `rc_minor` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rc_bot` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rc_new` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rc_cur_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rc_this_oldid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rc_last_oldid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rc_type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rc_source` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `rc_patrolled` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rc_ip` varbinary(40) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rc_logid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_recentchanges`
--

INSERT INTO `wiki_recentchanges` (`rc_id`, `rc_timestamp`, `rc_user`, `rc_user_text`, `rc_namespace`, `rc_title`, `rc_comment`, `rc_minor`, `rc_bot`, `rc_new`, `rc_cur_id`, `rc_this_oldid`, `rc_last_oldid`, `rc_type`, `rc_source`, `rc_patrolled`, `rc_ip`, `rc_old_len`, `rc_new_len`, `rc_deleted`, `rc_logid`, `rc_log_type`, `rc_log_action`, `rc_params`) VALUES
(1, 0x3230313630383331303033373230, 1, 'Admin', 0, 'Página_principal', '', 0, 0, 0, 1, 2, 1, 0, 'mw.edit', 1, 0x32342e3131382e3134322e3932, 744, 1024, 0, 0, NULL, '', ''),
(2, 0x3230313630383331303034323332, 1, 'Admin', 0, 'Página_principal', '', 0, 0, 0, 1, 3, 2, 0, 'mw.edit', 1, 0x32342e3131382e3134322e3932, 1024, 557, 0, 0, NULL, '', ''),
(3, 0x3230313630383331303035303033, 1, 'Admin', 8, 'Sidebar', 0x50c3a167696e612063726561646120636f6e20c2ab202a206e617669676174696f6e202a2a20687474703a2f2f7777772e69617063686961706173656e6c696e65612e6d787c566f6c76657220612041706c6963616369c3b36e202a2a206d61696e706167657c6d61696e706167652d6465736372697074696f6e202a2a20726563656e746368616e6765732d75726c7c726563656e746368616e676573202a2a2072616e646f6d706167652d75726c7c72616e646f6d70616765202a2a2068652e2e2ec2bb, 0, 0, 1, 2, 4, 0, 1, 'mw.new', 1, 0x32342e3131382e3134322e3932, 0, 214, 0, 0, NULL, '', ''),
(4, 0x3230313730383132323134333134, 2, '20171105', 2, '20171105', '', 0, 0, 0, 0, 0, 0, 3, 'mw.log', 1, 0x3138392e3134382e36302e3337, NULL, NULL, 0, 4, 0x6e65777573657273, 0x637265617465, 0x613a313a7b733a393a22343a3a757365726964223b693a323b7d),
(5, 0x3230313730383137313635333139, 3, 'Miguel Ballinas', 2, 'Miguel_Ballinas', '', 0, 0, 0, 0, 0, 0, 3, 'mw.log', 1, 0x3138372e3135372e32372e313330, NULL, NULL, 0, 5, 0x6e65777573657273, 0x637265617465, 0x613a313a7b733a393a22343a3a757365726964223b693a333b7d);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_redirect`
--

CREATE TABLE `wiki_redirect` (
  `rd_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rd_namespace` int(11) NOT NULL DEFAULT '0',
  `rd_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `rd_interwiki` varchar(32) DEFAULT NULL,
  `rd_fragment` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_revision`
--

CREATE TABLE `wiki_revision` (
  `rev_id` int(10) UNSIGNED NOT NULL,
  `rev_page` int(10) UNSIGNED NOT NULL,
  `rev_text_id` int(10) UNSIGNED NOT NULL,
  `rev_comment` varbinary(767) NOT NULL,
  `rev_user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rev_user_text` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `rev_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rev_deleted` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `rev_len` int(10) UNSIGNED DEFAULT NULL,
  `rev_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `rev_sha1` varbinary(32) NOT NULL DEFAULT '',
  `rev_content_model` varbinary(32) DEFAULT NULL,
  `rev_content_format` varbinary(64) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=1024 DEFAULT CHARSET=utf8 MAX_ROWS=10000000;

--
-- Dumping data for table `wiki_revision`
--

INSERT INTO `wiki_revision` (`rev_id`, `rev_page`, `rev_text_id`, `rev_comment`, `rev_user`, `rev_user_text`, `rev_timestamp`, `rev_minor_edit`, `rev_deleted`, `rev_len`, `rev_parent_id`, `rev_sha1`, `rev_content_model`, `rev_content_format`) VALUES
(1, 1, 1, '', 0, 'MediaWiki default', 0x3230313630383238323133323332, 0, 0, 744, 0, 0x63393673677767316e70623373626e64686436753363667774306768337a7a, NULL, NULL),
(2, 1, 2, '', 1, 'Admin', 0x3230313630383331303033373230, 0, 0, 1024, 1, 0x3368346277797279327a39716a6173337974366e6977616863747138643133, NULL, NULL),
(3, 1, 3, '', 1, 'Admin', 0x3230313630383331303034323332, 0, 0, 557, 2, 0x346e343875726f667661647032646c67386236627430377567637566696635, NULL, NULL),
(4, 2, 4, 0x50c3a167696e612063726561646120636f6e20c2ab202a206e617669676174696f6e202a2a20687474703a2f2f7777772e69617063686961706173656e6c696e65612e6d787c566f6c76657220612041706c6963616369c3b36e202a2a206d61696e706167657c6d61696e706167652d6465736372697074696f6e202a2a20726563656e746368616e6765732d75726c7c726563656e746368616e676573202a2a2072616e646f6d706167652d75726c7c72616e646f6d70616765202a2a2068652e2e2ec2bb, 1, 'Admin', 0x3230313630383331303035303033, 0, 0, 214, 0, 0x657a7a687937316435736572636973727466646137793872716e63396c7261, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_searchindex`
--

CREATE TABLE `wiki_searchindex` (
  `si_page` int(10) UNSIGNED NOT NULL,
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_searchindex`
--

INSERT INTO `wiki_searchindex` (`si_page`, `si_title`, `si_text`) VALUES
(1, 'pu8c3a1gina principal', ' bienvenidos au800 lau800 wiki. elu800 iapu800 chiapas coadyuva desde hace masu800 deu800 39u800 au8c3b1os enu800 elu800 fortalecimiento deu800 lau800 gestiu8c3b3n pu8c3bablica deu800 losu800 tres u8c3b3rdenes deu800 gobierno asu8c3ad como conu800 lau800 realizaciu8c3b3n deu800 investigaciu8c3b3n consultoru8c3ada yu800 difusiu8c3b3n delu800 desarrollo deu800 lasu800 ciencias administrativas enu800 beneficio deu800 lau800 sociedad.\" consulta lau800 metau82ewikimediau82eorgu800 wiki help contents esu800 guu8c3ada delu800 usuario para obtener informaciu8c3b3n sobre elu800 usou800 delu800 software wiki. primeros pasos primeros pasos primeros pasos * wwwu800u82emediawikiu82eorgu800 wiki manual faqu800 esu800 preguntas frecuentes sobre lau800 wiki '),
(2, 'sidebar', ' * navigation ** volver au800 aplicaciu8c3b3n ** mainpage mainpage-description ** recentchanges-urlu800 recentchanges ** randompage-urlu800 randompage ** helppage help * search * toolbox * languages ');

-- --------------------------------------------------------

--
-- Table structure for table `wiki_sites`
--

CREATE TABLE `wiki_sites` (
  `site_id` int(10) UNSIGNED NOT NULL,
  `site_global_key` varbinary(32) NOT NULL,
  `site_type` varbinary(32) NOT NULL,
  `site_group` varbinary(32) NOT NULL,
  `site_source` varbinary(32) NOT NULL,
  `site_language` varbinary(32) NOT NULL,
  `site_protocol` varbinary(32) NOT NULL,
  `site_domain` varchar(255) NOT NULL,
  `site_data` blob NOT NULL,
  `site_forward` tinyint(1) NOT NULL,
  `site_config` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_site_identifiers`
--

CREATE TABLE `wiki_site_identifiers` (
  `si_site` int(10) UNSIGNED NOT NULL,
  `si_type` varbinary(32) NOT NULL,
  `si_key` varbinary(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_site_stats`
--

CREATE TABLE `wiki_site_stats` (
  `ss_row_id` int(10) UNSIGNED NOT NULL,
  `ss_total_edits` bigint(20) UNSIGNED DEFAULT '0',
  `ss_good_articles` bigint(20) UNSIGNED DEFAULT '0',
  `ss_total_pages` bigint(20) DEFAULT '-1',
  `ss_users` bigint(20) DEFAULT '-1',
  `ss_active_users` bigint(20) DEFAULT '-1',
  `ss_images` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_site_stats`
--

INSERT INTO `wiki_site_stats` (`ss_row_id`, `ss_total_edits`, `ss_good_articles`, `ss_total_pages`, `ss_users`, `ss_active_users`, `ss_images`) VALUES
(1, 3, 0, 1, 3, -1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_tag_summary`
--

CREATE TABLE `wiki_tag_summary` (
  `ts_rc_id` int(11) DEFAULT NULL,
  `ts_log_id` int(11) DEFAULT NULL,
  `ts_rev_id` int(11) DEFAULT NULL,
  `ts_tags` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_templatelinks`
--

CREATE TABLE `wiki_templatelinks` (
  `tl_from` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `tl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_text`
--

CREATE TABLE `wiki_text` (
  `old_id` int(10) UNSIGNED NOT NULL,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=10240 DEFAULT CHARSET=utf8 MAX_ROWS=10000000;

--
-- Dumping data for table `wiki_text`
--

INSERT INTO `wiki_text` (`old_id`, `old_text`, `old_flags`) VALUES
(1, 0x3c7374726f6e673e4d6564696157696b6920736520686120696e7374616c61646f2e3c2f7374726f6e673e0a0a436f6e73756c7461206c61205b2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e74732f6573206775c3ad612064656c207573756172696f5d2070617261206f6274656e657220696e666f726d616369c3b36e20736f62726520656c2075736f2064656c20736f6674776172652077696b692e0a0a3d3d205072696d65726f73207061736f73203d3d0a2a205b2f2f7777772e6d6564696177696b692e6f72672f77696b692f5370656369616c3a4d794c616e67756167652f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e6773204c6973746120646520616a757374657320646520636f6e6669677572616369c3b36e5d0a2a205b2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a4641512f65732050726567756e746173206672656375656e74657320736f627265204d6564696157696b695d0a2a205b68747470733a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204c6973746120646520636f7272656f20646520616e756e63696f73206465207075626c6963616369c3b36e206465204d6564696157696b695d0a2a205b2f2f7777772e6d6564696177696b692e6f72672f77696b692f5370656369616c3a4d794c616e67756167652f4c6f63616c69736174696f6e235472616e736c6174696f6e5f7265736f7572636573205472616475636972204d6564696157696b6920656e207475206964696f6d615d0a2a205b2f2f7777772e6d6564696177696b692e6f72672f77696b692f5370656369616c3a4d794c616e67756167652f4d616e75616c3a436f6d626174696e675f7370616d20417072656e64652063c3b36d6f20636f6d626174697220656c207370616d20656e2074752077696b695d, 0x7574662d38),
(2, 0x3c7374726f6e673e4269656e76656e69646f732061206c612057696b692e3c2f7374726f6e673e0a0a456c20494150204368696170617320636f6164797576612064657364652068616365206d61732064652033392061c3b16f7320656e20656c20666f7274616c6563696d69656e746f206465206c61206765737469c3b36e2070c3ba626c696361206465206c6f73207472657320c3b37264656e657320646520676f626965726e6f2c206173c3ad20636f6d6f20636f6e206c61207265616c697a616369c3b36e20646520696e766573746967616369c3b36e2c20636f6e73756c746f72c3ad61207920646966757369c3b36e2064656c206465736172726f6c6c6f206465206c6173206369656e636961732061646d696e697374726174697661732c20656e2062656e65666963696f206465206c6120736f6369656461642e220a0a436f6e73756c7461206c61205b2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e74732f6573206775c3ad612064656c207573756172696f5d2070617261206f6274656e657220696e666f726d616369c3b36e20736f62726520656c2075736f2064656c20736f6674776172652077696b692e0a0a3d3d205072696d65726f73207061736f73203d3d0a2a205b2f2f7777772e6d6564696177696b692e6f72672f77696b692f5370656369616c3a4d794c616e67756167652f4d616e75616c3a436f6e66696775726174696f6e5f73657474696e6773204c6973746120646520616a757374657320646520636f6e6669677572616369c3b36e5d0a2a205b2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a4641512f65732050726567756e746173206672656375656e74657320736f627265204d6564696157696b695d0a2a205b68747470733a2f2f6c697374732e77696b696d656469612e6f72672f6d61696c6d616e2f6c697374696e666f2f6d6564696177696b692d616e6e6f756e6365204c6973746120646520636f7272656f20646520616e756e63696f73206465207075626c6963616369c3b36e206465204d6564696157696b695d0a2a205b2f2f7777772e6d6564696177696b692e6f72672f77696b692f5370656369616c3a4d794c616e67756167652f4c6f63616c69736174696f6e235472616e736c6174696f6e5f7265736f7572636573205472616475636972204d6564696157696b6920656e207475206964696f6d615d0a2a205b2f2f7777772e6d6564696177696b692e6f72672f77696b692f5370656369616c3a4d794c616e67756167652f4d616e75616c3a436f6d626174696e675f7370616d20417072656e64652063c3b36d6f20636f6d626174697220656c207370616d20656e2074752077696b695d, 0x7574662d38),
(3, 0x3c7374726f6e673e4269656e76656e69646f732061206c612057696b692e3c2f7374726f6e673e0a0a456c20494150204368696170617320636f6164797576612064657364652068616365206d61732064652033392061c3b16f7320656e20656c20666f7274616c6563696d69656e746f206465206c61206765737469c3b36e2070c3ba626c696361206465206c6f73207472657320c3b37264656e657320646520676f626965726e6f2c206173c3ad20636f6d6f20636f6e206c61207265616c697a616369c3b36e20646520696e766573746967616369c3b36e2c20636f6e73756c746f72c3ad61207920646966757369c3b36e2064656c206465736172726f6c6c6f206465206c6173206369656e636961732061646d696e697374726174697661732c20656e2062656e65666963696f206465206c6120736f6369656461642e220a0a436f6e73756c7461206c61205b2f2f6d6574612e77696b696d656469612e6f72672f77696b692f48656c703a436f6e74656e74732f6573206775c3ad612064656c207573756172696f5d2070617261206f6274656e657220696e666f726d616369c3b36e20736f62726520656c2075736f2064656c20736f6674776172652077696b692e0a0a3d3d205072696d65726f73207061736f73203d3d0a2a205b2f2f7777772e6d6564696177696b692e6f72672f77696b692f4d616e75616c3a4641512f65732050726567756e746173206672656375656e74657320736f627265206c612057696b695d, 0x7574662d38),
(4, 0x0a2a206e617669676174696f6e0a2a2a20687474703a2f2f7777772e69617063686961706173656e6c696e65612e6d787c566f6c76657220612041706c6963616369c3b36e0a2a2a206d61696e706167657c6d61696e706167652d6465736372697074696f6e0a2a2a20726563656e746368616e6765732d75726c7c726563656e746368616e6765730a2a2a2072616e646f6d706167652d75726c7c72616e646f6d706167650a2a2a2068656c70706167657c68656c700a2a205345415243480a2a20544f4f4c424f580a2a204c414e475541474553, 0x7574662d38);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_transcache`
--

CREATE TABLE `wiki_transcache` (
  `tc_url` varbinary(255) NOT NULL,
  `tc_contents` text,
  `tc_time` binary(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_updatelog`
--

CREATE TABLE `wiki_updatelog` (
  `ul_key` varchar(255) NOT NULL,
  `ul_value` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_updatelog`
--

INSERT INTO `wiki_updatelog` (`ul_key`, `ul_value`) VALUES
('filearchive-fa_major_mime-patch-fa_major_mime-chemical.sql', NULL),
('image-img_major_mime-patch-img_major_mime-chemical.sql', NULL),
('oldimage-oi_major_mime-patch-oi_major_mime-chemical.sql', NULL),
('user_former_groups-ufg_group-patch-ufg_group-length-increase-255.sql', NULL),
('user_groups-ug_group-patch-ug_group-length-increase-255.sql', NULL),
('user_properties-up_property-patch-up_property.sql', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_uploadstash`
--

CREATE TABLE `wiki_uploadstash` (
  `us_id` int(10) UNSIGNED NOT NULL,
  `us_user` int(10) UNSIGNED NOT NULL,
  `us_key` varchar(255) NOT NULL,
  `us_orig_path` varchar(255) NOT NULL,
  `us_path` varchar(255) NOT NULL,
  `us_source_type` varchar(50) DEFAULT NULL,
  `us_timestamp` varbinary(14) NOT NULL,
  `us_status` varchar(50) NOT NULL,
  `us_chunk_inx` int(10) UNSIGNED DEFAULT NULL,
  `us_props` blob,
  `us_size` int(10) UNSIGNED NOT NULL,
  `us_sha1` varchar(31) NOT NULL,
  `us_mime` varchar(255) DEFAULT NULL,
  `us_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `us_image_width` int(10) UNSIGNED DEFAULT NULL,
  `us_image_height` int(10) UNSIGNED DEFAULT NULL,
  `us_image_bits` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_user`
--

CREATE TABLE `wiki_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_email` tinytext NOT NULL,
  `user_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) DEFAULT NULL,
  `user_email_token` binary(32) DEFAULT NULL,
  `user_email_token_expires` binary(14) DEFAULT NULL,
  `user_registration` binary(14) DEFAULT NULL,
  `user_editcount` int(11) DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_user`
--

INSERT INTO `wiki_user` (`user_id`, `user_name`, `user_real_name`, `user_password`, `user_newpassword`, `user_newpass_time`, `user_email`, `user_touched`, `user_token`, `user_email_authenticated`, `user_email_token`, `user_email_token_expires`, `user_registration`, `user_editcount`, `user_password_expires`) VALUES
(1, 'Admin', '', 0x3a70626b6466323a7368613235363a31303030303a3132383a49776177784e52646e692f44775275326154653766673d3d3a74665a37716a7753703964534e32514137784135732f41534e63726b2b526f336b68414d6b6e495866722b376b2f6a674b3672362f58716f4f3349537a4c795663617636553557384f746d483338397857587947644c346d4b72626f596e52466b673864384c694f357a43624c4944576d5061587235534842315368464c4372634c6477396d32644e66516e4c315a6f36523849592b69486866334f2f546642313661386173434b6c32343d, '', NULL, 'dlopez@trazzos.com', 0x3230313630383238323133323338, 0x3536393766323534396134373363656134383530313133306132623064333938, NULL, NULL, NULL, 0x3230313630383238323133323331, 3, NULL),
(2, '20171105', 'Claudio Francisco Escbar López', 0x3a70626b6466323a7368613235363a31303030303a3132383a786e44482f47673249323878595251395969497046413d3d3a3765714d68343346575350624c4c653341653778706a6279357778624374354c7651637033687536726d784761415836756750574d39664a62796f396d54336c736e434156627a564d436970514a3864644b776e7432386f4e5a7136454749396558626a4e746a642b7742654841455243724175554a68697739363655436d4635376550696b794462553531663641623036684f35577570575a67525a4c53415a384b63415568304d63553d, '', NULL, 'claudiofescobar.inap.doctorado@gmail.com', 0x3230313730383132323134333232, 0x6533653634613562613364326137326631663033653335313835323361333838, NULL, 0x3537646464393634386662663862333166393038656630326165333634356236, 0x3230313730383139323134333134, 0x3230313730383132323134333134, 0, NULL),
(3, 'Miguel Ballinas', 'Miguel Ballinas', 0x3a70626b6466323a7368613235363a31303030303a3132383a4c4d79426d3263556b59386650434c37393870312f673d3d3a3076526241364f6437347939532f4d4c7a594863506477336a6a516f4b31506368383052554836626f573934412f6e4e2f46306657504c336e3548666f6957745a6e786a3951483237477033782b5644366e583941625337734d783974646657436a38366a7178686d574470744374645845794c63366869657655726d4769475479544e444a3031557772586350497644474431345a34714c45747a312f47706a716570734a37494e596b3d, '', NULL, 'miguel.ballinas@gmail.com', 0x3230313730383137313635353438, 0x3862323238363032613362336261303733313034393961616234353332656363, 0x3230313730383137313635353433, 0x3461353735313530396633333665323531376463333366636237303063393666, 0x3230313730383234313635333139, 0x3230313730383137313635333139, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_user_former_groups`
--

CREATE TABLE `wiki_user_former_groups` (
  `ufg_user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ufg_group` varbinary(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_user_groups`
--

CREATE TABLE `wiki_user_groups` (
  `ug_user` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `ug_group` varbinary(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_user_groups`
--

INSERT INTO `wiki_user_groups` (`ug_user`, `ug_group`) VALUES
(1, 0x62757265617563726174),
(1, 0x7379736f70);

-- --------------------------------------------------------

--
-- Table structure for table `wiki_user_newtalk`
--

CREATE TABLE `wiki_user_newtalk` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_ip` varbinary(40) NOT NULL DEFAULT '',
  `user_last_timestamp` varbinary(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_user_properties`
--

CREATE TABLE `wiki_user_properties` (
  `up_user` int(11) NOT NULL,
  `up_property` varbinary(255) NOT NULL,
  `up_value` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_valid_tag`
--

CREATE TABLE `wiki_valid_tag` (
  `vt_tag` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki_watchlist`
--

CREATE TABLE `wiki_watchlist` (
  `wl_id` int(10) UNSIGNED NOT NULL,
  `wl_user` int(10) UNSIGNED NOT NULL,
  `wl_namespace` int(11) NOT NULL DEFAULT '0',
  `wl_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `wl_notificationtimestamp` varbinary(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki_watchlist`
--

INSERT INTO `wiki_watchlist` (`wl_id`, `wl_user`, `wl_namespace`, `wl_title`, `wl_notificationtimestamp`) VALUES
(1, 1, 0, 'Página_principal', NULL),
(2, 1, 1, 'Página_principal', NULL),
(3, 1, 8, 'Sidebar', NULL),
(4, 1, 9, 'Sidebar', NULL),
(5, 2, 2, '20171105', NULL),
(6, 2, 3, '20171105', NULL),
(7, 3, 2, 'Miguel_Ballinas', NULL),
(8, 3, 3, 'Miguel_Ballinas', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abreviacion`
--
ALTER TABLE `abreviacion`
  ADD PRIMARY KEY (`abreviacionId`);

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activityId`);

--
-- Indexes for table `activity_config`
--
ALTER TABLE `activity_config`
  ADD PRIMARY KEY (`activityConfigId`);

--
-- Indexes for table `activity_score`
--
ALTER TABLE `activity_score`
  ADD PRIMARY KEY (`activityScoreId`);

--
-- Indexes for table `activity_test`
--
ALTER TABLE `activity_test`
  ADD PRIMARY KEY (`testId`);

--
-- Indexes for table `alumnoshistorial`
--
ALTER TABLE `alumnoshistorial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`announcementId`);

--
-- Indexes for table `automovilprofesor`
--
ALTER TABLE `automovilprofesor`
  ADD PRIMARY KEY (`automovilId`);

--
-- Indexes for table `bancoprofesor`
--
ALTER TABLE `bancoprofesor`
  ADD PRIMARY KEY (`bancoprofesorId`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bankId`);

--
-- Indexes for table `bank_account`
--
ALTER TABLE `bank_account`
  ADD PRIMARY KEY (`bank_accountId`);

--
-- Indexes for table `cancel_code`
--
ALTER TABLE `cancel_code`
  ADD PRIMARY KEY (`codeId`);

--
-- Indexes for table `catalogodocumento`
--
ALTER TABLE `catalogodocumento`
  ADD PRIMARY KEY (`catalogodocumentoId`);

--
-- Indexes for table `categoria_pregunta`
--
ALTER TABLE `categoria_pregunta`
  ADD PRIMARY KEY (`categoriapreguntaId`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chatId`);

--
-- Indexes for table `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`classroomId`);

--
-- Indexes for table `cometchat`
--
ALTER TABLE `cometchat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to` (`to`),
  ADD KEY `from` (`from`),
  ADD KEY `direction` (`direction`),
  ADD KEY `read` (`read`),
  ADD KEY `sent` (`sent`);

--
-- Indexes for table `cometchat_announcements`
--
ALTER TABLE `cometchat_announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to` (`to`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `cometchat_chatroommessages`
--
ALTER TABLE `cometchat_chatroommessages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `chatroomid` (`chatroomid`),
  ADD KEY `sent` (`sent`);

--
-- Indexes for table `cometchat_chatrooms`
--
ALTER TABLE `cometchat_chatrooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lastactivity` (`lastactivity`),
  ADD KEY `createdby` (`createdby`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `cometchat_chatrooms_users`
--
ALTER TABLE `cometchat_chatrooms_users`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `chatroomid` (`chatroomid`),
  ADD KEY `lastactivity` (`lastactivity`);

--
-- Indexes for table `cometchat_status`
--
ALTER TABLE `cometchat_status`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `typingto` (`typingto`),
  ADD KEY `typingtime` (`typingtime`);

--
-- Indexes for table `cometchat_videochatsessions`
--
ALTER TABLE `cometchat_videochatsessions`
  ADD PRIMARY KEY (`username`),
  ADD KEY `username` (`username`),
  ADD KEY `identity` (`identity`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `complementoConcepto`
--
ALTER TABLE `complementoConcepto`
  ADD PRIMARY KEY (`complementoConceptoId`);

--
-- Indexes for table `complementoConceptoParte`
--
ALTER TABLE `complementoConceptoParte`
  ADD PRIMARY KEY (`complementoConceptoParteId`);

--
-- Indexes for table `comprobante`
--
ALTER TABLE `comprobante`
  ADD PRIMARY KEY (`comprobanteId`);

--
-- Indexes for table `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`conceptoId`);

--
-- Indexes for table `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`configId`);

--
-- Indexes for table `confirma_inscripcion`
--
ALTER TABLE `confirma_inscripcion`
  ADD PRIMARY KEY (`confirmaInscripcionId`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`courseId`);

--
-- Indexes for table `course_module`
--
ALTER TABLE `course_module`
  ADD PRIMARY KEY (`courseModuleId`);

--
-- Indexes for table `course_module_personal`
--
ALTER TABLE `course_module_personal`
  ADD PRIMARY KEY (`courseModPId`);

--
-- Indexes for table `course_module_score`
--
ALTER TABLE `course_module_score`
  ADD PRIMARY KEY (`courseModuleScoreId`);

--
-- Indexes for table `cuentaPredialConcepto`
--
ALTER TABLE `cuentaPredialConcepto`
  ADD PRIMARY KEY (`cuentaPredialConceptoId`);

--
-- Indexes for table `cuentaPredialParte`
--
ALTER TABLE `cuentaPredialParte`
  ADD PRIMARY KEY (`cuentaPredialParteId`);

--
-- Indexes for table `documentosprofesor`
--
ALTER TABLE `documentosprofesor`
  ADD PRIMARY KEY (`documentosprofesorId`);

--
-- Indexes for table `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`estadoId`);

--
-- Indexes for table `estudioprofesor`
--
ALTER TABLE `estudioprofesor`
  ADD PRIMARY KEY (`estudioprofesorId`);

--
-- Indexes for table `eval_alumno_docente`
--
ALTER TABLE `eval_alumno_docente`
  ADD PRIMARY KEY (`evalalumnodocenteId`);

--
-- Indexes for table `ficha`
--
ALTER TABLE `ficha`
  ADD PRIMARY KEY (`idFicha`);

--
-- Indexes for table `folio`
--
ALTER TABLE `folio`
  ADD PRIMARY KEY (`folioId`);

--
-- Indexes for table `gradereport`
--
ALTER TABLE `gradereport`
  ADD PRIMARY KEY (`gradereportId`);

--
-- Indexes for table `gradereport_inter`
--
ALTER TABLE `gradereport_inter`
  ADD PRIMARY KEY (`gradereportInterId`),
  ADD KEY `alumnoId` (`alumnoId`,`subjectId`,`scheduletestId`,`periodoId`,`semesterId`);

--
-- Indexes for table `gradereport_recur`
--
ALTER TABLE `gradereport_recur`
  ADD PRIMARY KEY (`gradereportRecurId`),
  ADD KEY `alumnoId` (`alumnoId`,`subjectId`,`periodoId`,`semesterId`);

--
-- Indexes for table `gradereport_user`
--
ALTER TABLE `gradereport_user`
  ADD PRIMARY KEY (`gradReportUserId`),
  ADD KEY `gradereportId` (`gradereportId`,`alumnoId`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`groupId`);

--
-- Indexes for table `groupDEL`
--
ALTER TABLE `groupDEL`
  ADD PRIMARY KEY (`groupId`);

--
-- Indexes for table `group_subject`
--
ALTER TABLE `group_subject`
  ADD PRIMARY KEY (`gposubId`);

--
-- Indexes for table `homework`
--
ALTER TABLE `homework`
  ADD PRIMARY KEY (`homeworkId`);

--
-- Indexes for table `informacionAduaneraConcepto`
--
ALTER TABLE `informacionAduaneraConcepto`
  ADD PRIMARY KEY (`informacionAduaneraConceptoId`);

--
-- Indexes for table `informacionAduaneraParte`
--
ALTER TABLE `informacionAduaneraParte`
  ADD PRIMARY KEY (`informacionAduaneraParteId`);

--
-- Indexes for table `institution`
--
ALTER TABLE `institution`
  ADD PRIMARY KEY (`institutionId`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoiceId`);

--
-- Indexes for table `ipn`
--
ALTER TABLE `ipn`
  ADD PRIMARY KEY (`ipnid`);

--
-- Indexes for table `kardex_calificacion`
--
ALTER TABLE `kardex_calificacion`
  ADD PRIMARY KEY (`karCalId`);

--
-- Indexes for table `major`
--
ALTER TABLE `major`
  ADD PRIMARY KEY (`majorId`);

--
-- Indexes for table `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`mensajeId`);

--
-- Indexes for table `menu_app`
--
ALTER TABLE `menu_app`
  ADD PRIMARY KEY (`menuAppId`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`moduleId`);

--
-- Indexes for table `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`municipioId`),
  ADD KEY `estadoId` (`estadoId`);

--
-- Indexes for table `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`notificacionId`);

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagosadicio`
--
ALTER TABLE `pagosadicio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`paisId`);

--
-- Indexes for table `parte`
--
ALTER TABLE `parte`
  ADD PRIMARY KEY (`parteId`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`paymentId`);

--
-- Indexes for table `periodo`
--
ALTER TABLE `periodo`
  ADD PRIMARY KEY (`periodoId`);

--
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`personalId`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`positionId`),
  ADD KEY `clave` (`clave`);

--
-- Indexes for table `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`preguntaId`);

--
-- Indexes for table `profesion`
--
ALTER TABLE `profesion`
  ADD PRIMARY KEY (`profesionId`);

--
-- Indexes for table `recording`
--
ALTER TABLE `recording`
  ADD PRIMARY KEY (`recordingId`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`registrationId`);

--
-- Indexes for table `registration_v1`
--
ALTER TABLE `registration_v1`
  ADD PRIMARY KEY (`registrationId`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`replyId`);

--
-- Indexes for table `repositorio`
--
ALTER TABLE `repositorio`
  ADD PRIMARY KEY (`repositorioId`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`resourceId`);

--
-- Indexes for table `resource_config`
--
ALTER TABLE `resource_config`
  ADD PRIMARY KEY (`resourceConfigId`);

--
-- Indexes for table `resultado`
--
ALTER TABLE `resultado`
  ADD PRIMARY KEY (`resultadoId`);

--
-- Indexes for table `rfc`
--
ALTER TABLE `rfc`
  ADD PRIMARY KEY (`rfcId`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`roleId`);

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`scheduleId`);

--
-- Indexes for table `schedule_group`
--
ALTER TABLE `schedule_group`
  ADD PRIMARY KEY (`scheduleGroupId`);

--
-- Indexes for table `schedule_test`
--
ALTER TABLE `schedule_test`
  ADD PRIMARY KEY (`scheduletestId`);

--
-- Indexes for table `schedule_time`
--
ALTER TABLE `schedule_time`
  ADD PRIMARY KEY (`schtimeId`);

--
-- Indexes for table `schgpo_subject`
--
ALTER TABLE `schgpo_subject`
  ADD UNIQUE KEY `schGpoSubjectId` (`schGpoSubjectId`);

--
-- Indexes for table `school_type`
--
ALTER TABLE `school_type`
  ADD PRIMARY KEY (`schtypId`);

--
-- Indexes for table `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`semesterId`);

--
-- Indexes for table `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`serieId`);

--
-- Indexes for table `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`solicitudId`);

--
-- Indexes for table `speciality`
--
ALTER TABLE `speciality`
  ADD PRIMARY KEY (`specialityId`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`stateId`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`subjectId`);

--
-- Indexes for table `subject_group`
--
ALTER TABLE `subject_group`
  ADD PRIMARY KEY (`subgpoId`),
  ADD KEY `periodoId` (`periodoId`);

--
-- Indexes for table `subject_module`
--
ALTER TABLE `subject_module`
  ADD PRIMARY KEY (`subjectModuleId`);

--
-- Indexes for table `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`sucursalId`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`teamId`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tiposComprobante`
--
ALTER TABLE `tiposComprobante`
  ADD PRIMARY KEY (`tiposComprobanteId`);

--
-- Indexes for table `tiposolicitud`
--
ALTER TABLE `tiposolicitud`
  ADD PRIMARY KEY (`tiposolicitudId`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`topicId`);

--
-- Indexes for table `topicsub`
--
ALTER TABLE `topicsub`
  ADD PRIMARY KEY (`topicsubId`);

--
-- Indexes for table `typetest`
--
ALTER TABLE `typetest`
  ADD PRIMARY KEY (`testId`);

--
-- Indexes for table `type_calif`
--
ALTER TABLE `type_calif`
  ADD PRIMARY KEY (`typeCalifId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `user_subject`
--
ALTER TABLE `user_subject`
  ADD PRIMARY KEY (`registrationId`),
  ADD KEY `alumnoId` (`alumnoId`,`courseId`),
  ADD KEY `courseId` (`courseId`);

--
-- Indexes for table `wiki_archive`
--
ALTER TABLE `wiki_archive`
  ADD PRIMARY KEY (`ar_id`),
  ADD KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  ADD KEY `usertext_timestamp` (`ar_user_text`,`ar_timestamp`),
  ADD KEY `ar_revid` (`ar_rev_id`);

--
-- Indexes for table `wiki_bot_passwords`
--
ALTER TABLE `wiki_bot_passwords`
  ADD PRIMARY KEY (`bp_user`,`bp_app_id`);

--
-- Indexes for table `wiki_category`
--
ALTER TABLE `wiki_category`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `cat_title` (`cat_title`),
  ADD KEY `cat_pages` (`cat_pages`);

--
-- Indexes for table `wiki_categorylinks`
--
ALTER TABLE `wiki_categorylinks`
  ADD UNIQUE KEY `cl_from` (`cl_from`,`cl_to`),
  ADD KEY `cl_sortkey` (`cl_to`,`cl_type`,`cl_sortkey`,`cl_from`),
  ADD KEY `cl_timestamp` (`cl_to`,`cl_timestamp`),
  ADD KEY `cl_collation_ext` (`cl_collation`,`cl_to`,`cl_type`,`cl_from`);

--
-- Indexes for table `wiki_change_tag`
--
ALTER TABLE `wiki_change_tag`
  ADD UNIQUE KEY `change_tag_rc_tag` (`ct_rc_id`,`ct_tag`),
  ADD UNIQUE KEY `change_tag_log_tag` (`ct_log_id`,`ct_tag`),
  ADD UNIQUE KEY `change_tag_rev_tag` (`ct_rev_id`,`ct_tag`),
  ADD KEY `change_tag_tag_id` (`ct_tag`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`);

--
-- Indexes for table `wiki_externallinks`
--
ALTER TABLE `wiki_externallinks`
  ADD PRIMARY KEY (`el_id`),
  ADD KEY `el_from` (`el_from`,`el_to`(40)),
  ADD KEY `el_to` (`el_to`(60),`el_from`),
  ADD KEY `el_index` (`el_index`(60));

--
-- Indexes for table `wiki_filearchive`
--
ALTER TABLE `wiki_filearchive`
  ADD PRIMARY KEY (`fa_id`),
  ADD KEY `fa_name` (`fa_name`,`fa_timestamp`),
  ADD KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  ADD KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  ADD KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`),
  ADD KEY `fa_sha1` (`fa_sha1`(10));

--
-- Indexes for table `wiki_image`
--
ALTER TABLE `wiki_image`
  ADD PRIMARY KEY (`img_name`),
  ADD KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  ADD KEY `img_size` (`img_size`),
  ADD KEY `img_timestamp` (`img_timestamp`),
  ADD KEY `img_sha1` (`img_sha1`(10)),
  ADD KEY `img_media_mime` (`img_media_type`,`img_major_mime`,`img_minor_mime`);

--
-- Indexes for table `wiki_imagelinks`
--
ALTER TABLE `wiki_imagelinks`
  ADD UNIQUE KEY `il_from` (`il_from`,`il_to`),
  ADD KEY `il_to` (`il_to`,`il_from`),
  ADD KEY `il_backlinks_namespace` (`il_from_namespace`,`il_to`,`il_from`);

--
-- Indexes for table `wiki_interwiki`
--
ALTER TABLE `wiki_interwiki`
  ADD UNIQUE KEY `iw_prefix` (`iw_prefix`);

--
-- Indexes for table `wiki_ipblocks`
--
ALTER TABLE `wiki_ipblocks`
  ADD PRIMARY KEY (`ipb_id`),
  ADD UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  ADD KEY `ipb_user` (`ipb_user`),
  ADD KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  ADD KEY `ipb_timestamp` (`ipb_timestamp`),
  ADD KEY `ipb_expiry` (`ipb_expiry`),
  ADD KEY `ipb_parent_block_id` (`ipb_parent_block_id`);

--
-- Indexes for table `wiki_iwlinks`
--
ALTER TABLE `wiki_iwlinks`
  ADD UNIQUE KEY `iwl_from` (`iwl_from`,`iwl_prefix`,`iwl_title`),
  ADD KEY `iwl_prefix_title_from` (`iwl_prefix`,`iwl_title`,`iwl_from`),
  ADD KEY `iwl_prefix_from_title` (`iwl_prefix`,`iwl_from`,`iwl_title`);

--
-- Indexes for table `wiki_job`
--
ALTER TABLE `wiki_job`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `job_sha1` (`job_sha1`),
  ADD KEY `job_cmd_token` (`job_cmd`,`job_token`,`job_random`),
  ADD KEY `job_cmd_token_id` (`job_cmd`,`job_token`,`job_id`),
  ADD KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`,`job_params`(128)),
  ADD KEY `job_timestamp` (`job_timestamp`);

--
-- Indexes for table `wiki_l10n_cache`
--
ALTER TABLE `wiki_l10n_cache`
  ADD KEY `lc_lang_key` (`lc_lang`,`lc_key`);

--
-- Indexes for table `wiki_langlinks`
--
ALTER TABLE `wiki_langlinks`
  ADD UNIQUE KEY `ll_from` (`ll_from`,`ll_lang`),
  ADD KEY `ll_lang` (`ll_lang`,`ll_title`);

--
-- Indexes for table `wiki_logging`
--
ALTER TABLE `wiki_logging`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `type_time` (`log_type`,`log_timestamp`),
  ADD KEY `user_time` (`log_user`,`log_timestamp`),
  ADD KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  ADD KEY `times` (`log_timestamp`),
  ADD KEY `log_user_type_time` (`log_user`,`log_type`,`log_timestamp`),
  ADD KEY `log_page_id_time` (`log_page`,`log_timestamp`),
  ADD KEY `type_action` (`log_type`,`log_action`,`log_timestamp`),
  ADD KEY `log_user_text_type_time` (`log_user_text`,`log_type`,`log_timestamp`),
  ADD KEY `log_user_text_time` (`log_user_text`,`log_timestamp`);

--
-- Indexes for table `wiki_log_search`
--
ALTER TABLE `wiki_log_search`
  ADD UNIQUE KEY `ls_field_val` (`ls_field`,`ls_value`,`ls_log_id`),
  ADD KEY `ls_log_id` (`ls_log_id`);

--
-- Indexes for table `wiki_module_deps`
--
ALTER TABLE `wiki_module_deps`
  ADD UNIQUE KEY `md_module_skin` (`md_module`,`md_skin`);

--
-- Indexes for table `wiki_objectcache`
--
ALTER TABLE `wiki_objectcache`
  ADD PRIMARY KEY (`keyname`),
  ADD KEY `exptime` (`exptime`);

--
-- Indexes for table `wiki_oldimage`
--
ALTER TABLE `wiki_oldimage`
  ADD KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  ADD KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  ADD KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  ADD KEY `oi_sha1` (`oi_sha1`(10));

--
-- Indexes for table `wiki_page`
--
ALTER TABLE `wiki_page`
  ADD PRIMARY KEY (`page_id`),
  ADD UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  ADD KEY `page_random` (`page_random`),
  ADD KEY `page_len` (`page_len`),
  ADD KEY `page_redirect_namespace_len` (`page_is_redirect`,`page_namespace`,`page_len`);

--
-- Indexes for table `wiki_pagelinks`
--
ALTER TABLE `wiki_pagelinks`
  ADD UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  ADD KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  ADD KEY `pl_backlinks_namespace` (`pl_from_namespace`,`pl_namespace`,`pl_title`,`pl_from`);

--
-- Indexes for table `wiki_page_props`
--
ALTER TABLE `wiki_page_props`
  ADD UNIQUE KEY `pp_page_propname` (`pp_page`,`pp_propname`),
  ADD UNIQUE KEY `pp_propname_page` (`pp_propname`,`pp_page`),
  ADD UNIQUE KEY `pp_propname_sortkey_page` (`pp_propname`,`pp_sortkey`,`pp_page`);

--
-- Indexes for table `wiki_page_restrictions`
--
ALTER TABLE `wiki_page_restrictions`
  ADD PRIMARY KEY (`pr_id`),
  ADD UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  ADD KEY `pr_typelevel` (`pr_type`,`pr_level`),
  ADD KEY `pr_level` (`pr_level`),
  ADD KEY `pr_cascade` (`pr_cascade`);

--
-- Indexes for table `wiki_protected_titles`
--
ALTER TABLE `wiki_protected_titles`
  ADD UNIQUE KEY `pt_namespace_title` (`pt_namespace`,`pt_title`),
  ADD KEY `pt_timestamp` (`pt_timestamp`);

--
-- Indexes for table `wiki_querycache`
--
ALTER TABLE `wiki_querycache`
  ADD KEY `qc_type` (`qc_type`,`qc_value`);

--
-- Indexes for table `wiki_querycachetwo`
--
ALTER TABLE `wiki_querycachetwo`
  ADD KEY `qcc_type` (`qcc_type`,`qcc_value`),
  ADD KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  ADD KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`);

--
-- Indexes for table `wiki_querycache_info`
--
ALTER TABLE `wiki_querycache_info`
  ADD UNIQUE KEY `qci_type` (`qci_type`);

--
-- Indexes for table `wiki_recentchanges`
--
ALTER TABLE `wiki_recentchanges`
  ADD PRIMARY KEY (`rc_id`),
  ADD KEY `rc_timestamp` (`rc_timestamp`),
  ADD KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  ADD KEY `rc_cur_id` (`rc_cur_id`),
  ADD KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  ADD KEY `rc_ip` (`rc_ip`),
  ADD KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  ADD KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`);

--
-- Indexes for table `wiki_redirect`
--
ALTER TABLE `wiki_redirect`
  ADD PRIMARY KEY (`rd_from`),
  ADD KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`);

--
-- Indexes for table `wiki_revision`
--
ALTER TABLE `wiki_revision`
  ADD PRIMARY KEY (`rev_id`),
  ADD UNIQUE KEY `rev_page_id` (`rev_page`,`rev_id`),
  ADD KEY `rev_timestamp` (`rev_timestamp`),
  ADD KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  ADD KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  ADD KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`),
  ADD KEY `page_user_timestamp` (`rev_page`,`rev_user`,`rev_timestamp`);

--
-- Indexes for table `wiki_searchindex`
--
ALTER TABLE `wiki_searchindex`
  ADD UNIQUE KEY `si_page` (`si_page`);
ALTER TABLE `wiki_searchindex` ADD FULLTEXT KEY `si_title` (`si_title`);
ALTER TABLE `wiki_searchindex` ADD FULLTEXT KEY `si_text` (`si_text`);

--
-- Indexes for table `wiki_sites`
--
ALTER TABLE `wiki_sites`
  ADD PRIMARY KEY (`site_id`),
  ADD UNIQUE KEY `sites_global_key` (`site_global_key`),
  ADD KEY `sites_type` (`site_type`),
  ADD KEY `sites_group` (`site_group`),
  ADD KEY `sites_source` (`site_source`),
  ADD KEY `sites_language` (`site_language`),
  ADD KEY `sites_protocol` (`site_protocol`),
  ADD KEY `sites_domain` (`site_domain`),
  ADD KEY `sites_forward` (`site_forward`);

--
-- Indexes for table `wiki_site_identifiers`
--
ALTER TABLE `wiki_site_identifiers`
  ADD UNIQUE KEY `site_ids_type` (`si_type`,`si_key`),
  ADD KEY `site_ids_site` (`si_site`),
  ADD KEY `site_ids_key` (`si_key`);

--
-- Indexes for table `wiki_site_stats`
--
ALTER TABLE `wiki_site_stats`
  ADD UNIQUE KEY `ss_row_id` (`ss_row_id`);

--
-- Indexes for table `wiki_tag_summary`
--
ALTER TABLE `wiki_tag_summary`
  ADD UNIQUE KEY `tag_summary_rc_id` (`ts_rc_id`),
  ADD UNIQUE KEY `tag_summary_log_id` (`ts_log_id`),
  ADD UNIQUE KEY `tag_summary_rev_id` (`ts_rev_id`);

--
-- Indexes for table `wiki_templatelinks`
--
ALTER TABLE `wiki_templatelinks`
  ADD UNIQUE KEY `tl_from` (`tl_from`,`tl_namespace`,`tl_title`),
  ADD KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`),
  ADD KEY `tl_backlinks_namespace` (`tl_from_namespace`,`tl_namespace`,`tl_title`,`tl_from`);

--
-- Indexes for table `wiki_text`
--
ALTER TABLE `wiki_text`
  ADD PRIMARY KEY (`old_id`);

--
-- Indexes for table `wiki_transcache`
--
ALTER TABLE `wiki_transcache`
  ADD UNIQUE KEY `tc_url_idx` (`tc_url`);

--
-- Indexes for table `wiki_updatelog`
--
ALTER TABLE `wiki_updatelog`
  ADD PRIMARY KEY (`ul_key`);

--
-- Indexes for table `wiki_uploadstash`
--
ALTER TABLE `wiki_uploadstash`
  ADD PRIMARY KEY (`us_id`),
  ADD UNIQUE KEY `us_key` (`us_key`),
  ADD KEY `us_user` (`us_user`),
  ADD KEY `us_timestamp` (`us_timestamp`);

--
-- Indexes for table `wiki_user`
--
ALTER TABLE `wiki_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD KEY `user_email_token` (`user_email_token`),
  ADD KEY `user_email` (`user_email`(50));

--
-- Indexes for table `wiki_user_former_groups`
--
ALTER TABLE `wiki_user_former_groups`
  ADD UNIQUE KEY `ufg_user_group` (`ufg_user`,`ufg_group`);

--
-- Indexes for table `wiki_user_groups`
--
ALTER TABLE `wiki_user_groups`
  ADD UNIQUE KEY `ug_user_group` (`ug_user`,`ug_group`),
  ADD KEY `ug_group` (`ug_group`);

--
-- Indexes for table `wiki_user_newtalk`
--
ALTER TABLE `wiki_user_newtalk`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_ip` (`user_ip`);

--
-- Indexes for table `wiki_user_properties`
--
ALTER TABLE `wiki_user_properties`
  ADD UNIQUE KEY `user_properties_user_property` (`up_user`,`up_property`),
  ADD KEY `user_properties_property` (`up_property`);

--
-- Indexes for table `wiki_valid_tag`
--
ALTER TABLE `wiki_valid_tag`
  ADD PRIMARY KEY (`vt_tag`);

--
-- Indexes for table `wiki_watchlist`
--
ALTER TABLE `wiki_watchlist`
  ADD PRIMARY KEY (`wl_id`),
  ADD UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  ADD KEY `namespace_title` (`wl_namespace`,`wl_title`),
  ADD KEY `wl_user_notificationtimestamp` (`wl_user`,`wl_notificationtimestamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abreviacion`
--
ALTER TABLE `abreviacion`
  MODIFY `abreviacionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activityId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_config`
--
ALTER TABLE `activity_config`
  MODIFY `activityConfigId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1069;

--
-- AUTO_INCREMENT for table `activity_score`
--
ALTER TABLE `activity_score`
  MODIFY `activityScoreId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_test`
--
ALTER TABLE `activity_test`
  MODIFY `testId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alumnoshistorial`
--
ALTER TABLE `alumnoshistorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `announcementId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `automovilprofesor`
--
ALTER TABLE `automovilprofesor`
  MODIFY `automovilId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bancoprofesor`
--
ALTER TABLE `bancoprofesor`
  MODIFY `bancoprofesorId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bankId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_account`
--
ALTER TABLE `bank_account`
  MODIFY `bank_accountId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cancel_code`
--
ALTER TABLE `cancel_code`
  MODIFY `codeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `catalogodocumento`
--
ALTER TABLE `catalogodocumento`
  MODIFY `catalogodocumentoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `categoria_pregunta`
--
ALTER TABLE `categoria_pregunta`
  MODIFY `categoriapreguntaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `chatId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classroom`
--
ALTER TABLE `classroom`
  MODIFY `classroomId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cometchat`
--
ALTER TABLE `cometchat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cometchat_announcements`
--
ALTER TABLE `cometchat_announcements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cometchat_chatroommessages`
--
ALTER TABLE `cometchat_chatroommessages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cometchat_chatrooms`
--
ALTER TABLE `cometchat_chatrooms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `complementoConcepto`
--
ALTER TABLE `complementoConcepto`
  MODIFY `complementoConceptoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complementoConceptoParte`
--
ALTER TABLE `complementoConceptoParte`
  MODIFY `complementoConceptoParteId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comprobante`
--
ALTER TABLE `comprobante`
  MODIFY `comprobanteId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `concepto`
--
ALTER TABLE `concepto`
  MODIFY `conceptoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12912;

--
-- AUTO_INCREMENT for table `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `configId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `confirma_inscripcion`
--
ALTER TABLE `confirma_inscripcion`
  MODIFY `confirmaInscripcionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `courseId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_module`
--
ALTER TABLE `course_module`
  MODIFY `courseModuleId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_module_personal`
--
ALTER TABLE `course_module_personal`
  MODIFY `courseModPId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_module_score`
--
ALTER TABLE `course_module_score`
  MODIFY `courseModuleScoreId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cuentaPredialConcepto`
--
ALTER TABLE `cuentaPredialConcepto`
  MODIFY `cuentaPredialConceptoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cuentaPredialParte`
--
ALTER TABLE `cuentaPredialParte`
  MODIFY `cuentaPredialParteId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documentosprofesor`
--
ALTER TABLE `documentosprofesor`
  MODIFY `documentosprofesorId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estado`
--
ALTER TABLE `estado`
  MODIFY `estadoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `estudioprofesor`
--
ALTER TABLE `estudioprofesor`
  MODIFY `estudioprofesorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `eval_alumno_docente`
--
ALTER TABLE `eval_alumno_docente`
  MODIFY `evalalumnodocenteId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ficha`
--
ALTER TABLE `ficha`
  MODIFY `idFicha` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `folio`
--
ALTER TABLE `folio`
  MODIFY `folioId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gradereport`
--
ALTER TABLE `gradereport`
  MODIFY `gradereportId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gradereport_inter`
--
ALTER TABLE `gradereport_inter`
  MODIFY `gradereportInterId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gradereport_recur`
--
ALTER TABLE `gradereport_recur`
  MODIFY `gradereportRecurId` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id del registro', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gradereport_user`
--
ALTER TABLE `gradereport_user`
  MODIFY `gradReportUserId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `groupId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `groupDEL`
--
ALTER TABLE `groupDEL`
  MODIFY `groupId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `group_subject`
--
ALTER TABLE `group_subject`
  MODIFY `gposubId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `homework`
--
ALTER TABLE `homework`
  MODIFY `homeworkId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `informacionAduaneraConcepto`
--
ALTER TABLE `informacionAduaneraConcepto`
  MODIFY `informacionAduaneraConceptoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `informacionAduaneraParte`
--
ALTER TABLE `informacionAduaneraParte`
  MODIFY `informacionAduaneraParteId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `institution`
--
ALTER TABLE `institution`
  MODIFY `institutionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoiceId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ipn`
--
ALTER TABLE `ipn`
  MODIFY `ipnid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kardex_calificacion`
--
ALTER TABLE `kardex_calificacion`
  MODIFY `karCalId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `major`
--
ALTER TABLE `major`
  MODIFY `majorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `mensajeId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu_app`
--
ALTER TABLE `menu_app`
  MODIFY `menuAppId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `module`
--
ALTER TABLE `module`
  MODIFY `moduleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `municipio`
--
ALTER TABLE `municipio`
  MODIFY `municipioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2496;

--
-- AUTO_INCREMENT for table `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `notificacionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pagosadicio`
--
ALTER TABLE `pagosadicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parte`
--
ALTER TABLE `parte`
  MODIFY `parteId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `paymentId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=176;

--
-- AUTO_INCREMENT for table `periodo`
--
ALTER TABLE `periodo`
  MODIFY `periodoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal`
--
ALTER TABLE `personal`
  MODIFY `personalId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=200;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `positionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `preguntaId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profesion`
--
ALTER TABLE `profesion`
  MODIFY `profesionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `recording`
--
ALTER TABLE `recording`
  MODIFY `recordingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `registrationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registration_v1`
--
ALTER TABLE `registration_v1`
  MODIFY `registrationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reply`
--
ALTER TABLE `reply`
  MODIFY `replyId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `repositorio`
--
ALTER TABLE `repositorio`
  MODIFY `repositorioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `resourceId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resource_config`
--
ALTER TABLE `resource_config`
  MODIFY `resourceConfigId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resultado`
--
ALTER TABLE `resultado`
  MODIFY `resultadoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rfc`
--
ALTER TABLE `rfc`
  MODIFY `rfcId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `roleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `schedule`
--
ALTER TABLE `schedule`
  MODIFY `scheduleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedule_group`
--
ALTER TABLE `schedule_group`
  MODIFY `scheduleGroupId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `schedule_test`
--
ALTER TABLE `schedule_test`
  MODIFY `scheduletestId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schedule_time`
--
ALTER TABLE `schedule_time`
  MODIFY `schtimeId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schgpo_subject`
--
ALTER TABLE `schgpo_subject`
  MODIFY `schGpoSubjectId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `school_type`
--
ALTER TABLE `school_type`
  MODIFY `schtypId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `semester`
--
ALTER TABLE `semester`
  MODIFY `semesterId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `serie`
--
ALTER TABLE `serie`
  MODIFY `serieId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `solicitud`
--
ALTER TABLE `solicitud`
  MODIFY `solicitudId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `speciality`
--
ALTER TABLE `speciality`
  MODIFY `specialityId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `stateId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `subjectId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `subject_group`
--
ALTER TABLE `subject_group`
  MODIFY `subgpoId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_module`
--
ALTER TABLE `subject_module`
  MODIFY `subjectModuleId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sucursal`
--
ALTER TABLE `sucursal`
  MODIFY `sucursalId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `teamId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tiposComprobante`
--
ALTER TABLE `tiposComprobante`
  MODIFY `tiposComprobanteId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tiposolicitud`
--
ALTER TABLE `tiposolicitud`
  MODIFY `tiposolicitudId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `topicId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topicsub`
--
ALTER TABLE `topicsub`
  MODIFY `topicsubId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `typetest`
--
ALTER TABLE `typetest`
  MODIFY `testId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `type_calif`
--
ALTER TABLE `type_calif`
  MODIFY `typeCalifId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2971;

--
-- AUTO_INCREMENT for table `user_subject`
--
ALTER TABLE `user_subject`
  MODIFY `registrationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_archive`
--
ALTER TABLE `wiki_archive`
  MODIFY `ar_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_category`
--
ALTER TABLE `wiki_category`
  MODIFY `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_externallinks`
--
ALTER TABLE `wiki_externallinks`
  MODIFY `el_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `wiki_filearchive`
--
ALTER TABLE `wiki_filearchive`
  MODIFY `fa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_ipblocks`
--
ALTER TABLE `wiki_ipblocks`
  MODIFY `ipb_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_job`
--
ALTER TABLE `wiki_job`
  MODIFY `job_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_logging`
--
ALTER TABLE `wiki_logging`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wiki_page`
--
ALTER TABLE `wiki_page`
  MODIFY `page_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wiki_page_restrictions`
--
ALTER TABLE `wiki_page_restrictions`
  MODIFY `pr_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_recentchanges`
--
ALTER TABLE `wiki_recentchanges`
  MODIFY `rc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wiki_revision`
--
ALTER TABLE `wiki_revision`
  MODIFY `rev_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wiki_sites`
--
ALTER TABLE `wiki_sites`
  MODIFY `site_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_text`
--
ALTER TABLE `wiki_text`
  MODIFY `old_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `wiki_uploadstash`
--
ALTER TABLE `wiki_uploadstash`
  MODIFY `us_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki_user`
--
ALTER TABLE `wiki_user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wiki_watchlist`
--
ALTER TABLE `wiki_watchlist`
  MODIFY `wl_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
