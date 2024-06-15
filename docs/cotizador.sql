-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-06-2024 a las 12:31:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cotizador`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `cargoId` int(11) NOT NULL,
  `cargoNombre` varchar(50) NOT NULL,
  `cargoEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`cargoId`, `cargoNombre`, `cargoEstado`) VALUES
(1, 'Gerente', 1),
(2, 'Subgerente', 1),
(3, 'Jefe de departamento', 1),
(4, 'Coordinador de proyecto', 1),
(5, 'Analista de sistemas', 1),
(6, 'Programador', 1),
(7, 'Diseñador gráfico', 1),
(8, 'Asistente administrativo', 1),
(9, 'Contador', 1),
(10, 'Auditor', 1),
(11, 'Ejecutivo de ventas', 1),
(12, 'Representante de servicio al cliente', 1),
(13, 'Técnico de soporte', 1),
(14, 'Ingeniero de calidad', 1),
(15, 'Inspector de calidad', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `categoriaId` int(11) NOT NULL,
  `categoriaNombre` varchar(255) DEFAULT NULL,
  `categoriaDescripcion` varchar(255) DEFAULT NULL,
  `categoriaEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoriaId`, `categoriaNombre`, `categoriaDescripcion`, `categoriaEstado`) VALUES
(21, 'test 10', 'decripcion tes 10\r\n', 1),
(22, 'test 1', 'descripcion test 1', 1),
(23, 'test 3', 'descripcion test 3', 1),
(24, 'test 4', 'Descripcion test 4', 1),
(25, 'test 5', 'decripcion tes 5\r\n', 1),
(26, 'test 6', 'Descripcion test 6', 1),
(27, 'test 7', 'descripcion test 7', 1),
(28, 'tes', 'tes', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `clienteId` int(11) NOT NULL,
  `clienteNombre` varchar(255) DEFAULT NULL,
  `clienteRuc` varchar(11) DEFAULT NULL,
  `clienteTelefono` varchar(15) DEFAULT NULL,
  `clienteEmail` varchar(250) DEFAULT NULL,
  `clienteEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`clienteId`, `clienteNombre`, `clienteRuc`, `clienteTelefono`, `clienteEmail`, `clienteEstado`) VALUES
(1, 'Cliente 1', '12345678901', '+1234567890', 'cliente1@example.com', 1),
(2, 'Cliente 2', '23456789012', '+2345678901', 'cliente2@example.com', 1),
(3, 'Cliente 3', '34567890123', '+3456789012', 'cliente3@example.com', 1),
(4, 'Cliente 4', '45678901234', '+4567890123', 'cliente4@example.com', 1),
(5, 'Cliente 5', '56789012345', '+5678901234', 'cliente5@example.com', 1),
(6, 'Cliente 6', '67890123456', '+6789012345', 'cliente6@example.com', 1),
(7, 'Cliente 7', '78901234567', '+7890123456', 'cliente7@example.com', 1),
(8, 'Cliente 80', '89012345678', '+8901234567', 'cliente8@example.com', 0),
(9, 'Cliente 9', '90123456789', '+9012345678', 'cliente9@example.com', 0),
(10, 'Cliente 10', '01234567890', '+0123456789', 'cliente10@example.com', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `contactoId` int(11) NOT NULL,
  `contactoClienteId` int(11) DEFAULT NULL,
  `contactoCargoId` int(11) DEFAULT NULL,
  `contactoNombre` varchar(255) DEFAULT NULL,
  `contactoEmail` varchar(255) DEFAULT NULL,
  `contactoTelefono` varchar(20) DEFAULT NULL,
  `contactoEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`contactoId`, `contactoClienteId`, `contactoCargoId`, `contactoNombre`, `contactoEmail`, `contactoTelefono`, `contactoEstado`) VALUES
(42, 2, 2, 'Contacto 2', 'contacto1@example.com', '987654321', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `cotizacionId` int(11) NOT NULL,
  `cotizacionUsuarioId` int(11) DEFAULT NULL,
  `cotizacionEmpresaId` int(11) DEFAULT 1,
  `cotizacionClienteId` int(11) DEFAULT NULL,
  `cotizacionContactoId` int(11) DEFAULT NULL,
  `cotizacionClienteRuc` varchar(50) DEFAULT NULL,
  `cotizacionContactoTelefono` varchar(50) DEFAULT NULL,
  `cotizacionContactoEmail` varchar(50) DEFAULT NULL,
  `cotizacionDescripcion` varchar(500) DEFAULT NULL,
  `cotizacionEmpresaPorcentaje` int(11) DEFAULT 0,
  `cotizacionSubtotal` decimal(8,2) DEFAULT 0.00,
  `cotizacionProfit` decimal(8,2) DEFAULT 0.00,
  `cotizacionTotal` decimal(8,2) DEFAULT 0.00,
  `cotizacionSaludo` varchar(3000) DEFAULT NULL,
  `cotizacionAdicional` varchar(3000) DEFAULT NULL,
  `cotizacionContrato` varchar(8000) DEFAULT NULL,
  `cotizacionTipo` varchar(50) DEFAULT 'Borrador',
  `cotizacionFechaEnvio` datetime DEFAULT NULL,
  `cotizacionFechaVisto` datetime DEFAULT NULL,
  `cotizacionFechaRespuesta` datetime DEFAULT NULL,
  `cotizacionFechaCreacion` datetime DEFAULT NULL,
  `cotizacionEstado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`cotizacionId`, `cotizacionUsuarioId`, `cotizacionEmpresaId`, `cotizacionClienteId`, `cotizacionContactoId`, `cotizacionClienteRuc`, `cotizacionContactoTelefono`, `cotizacionContactoEmail`, `cotizacionDescripcion`, `cotizacionEmpresaPorcentaje`, `cotizacionSubtotal`, `cotizacionProfit`, `cotizacionTotal`, `cotizacionSaludo`, `cotizacionAdicional`, `cotizacionContrato`, `cotizacionTipo`, `cotizacionFechaEnvio`, `cotizacionFechaVisto`, `cotizacionFechaRespuesta`, `cotizacionFechaCreacion`, `cotizacionEstado`) VALUES
(1, 1, 1, 1, 1, '123', '1234', 'email', 'descripcion', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-14 15:43:09', 1),
(2, 1, 1, 1, 1, '123', '1234', 'email', 'descripcion', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-14 15:48:44', 1),
(3, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', 'testas', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-14 17:11:20', 1),
(4, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', 'tasadasd', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-14 17:13:15', 1),
(5, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', 'asdasd', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 12:57:08', 1),
(6, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '123', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:00:32', 2),
(7, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', 'asdasd', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:01:05', 2),
(8, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:04:40', 2),
(9, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:05:52', 2),
(10, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:06:28', 2),
(11, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:07:01', 2),
(12, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:12:04', 2),
(13, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:12:35', 2),
(14, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:12:49', 2),
(15, 1, 1, NULL, 1, '15', '12345678901', '555-5432', 'luisaperez@example.com', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:15:02', 2),
(16, 1, 1, NULL, 1, '15', '12345678901', '555-5432', 'luisaperez@example.com', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:15:09', 2),
(17, 1, 1, 3, 5, '34567890123', '555-8765', 'pedrogomez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:21:45', 2),
(18, 1, 1, 3, 5, '34567890123', '555-8765', 'pedrogomez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:21:50', 2),
(19, 1, 1, 3, 5, '34567890123', '555-8765', 'pedrogomez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-15 13:21:54', 2),
(20, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 12:30:58', 2),
(21, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', 'test', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 13:13:04', 2),
(22, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 13:13:56', 2),
(23, 1, 1, 3, 5, '34567890123', '555-8765', 'pedrogomez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 13:15:18', 2),
(24, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 13:16:02', 2),
(25, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 19:48:37', 2),
(26, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 19:51:10', 2),
(27, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 19:51:44', 2),
(28, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 19:53:15', 2),
(29, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 19:54:26', 2),
(30, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 19:54:55', 2),
(31, 1, 1, 3, 17, '34567890123', '555-7654', 'luzmarin@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 20:49:29', 2),
(32, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 20:57:04', 2),
(33, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 20:57:45', 2),
(34, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 22:49:26', 2),
(35, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 22:50:53', 2),
(36, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 22:51:43', 2),
(37, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 22:52:06', 2),
(38, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-16 22:52:30', 2),
(39, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:11:56', 2),
(40, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:14:49', 2),
(41, 1, 1, 3, 17, '34567890123', '555-7654', 'luzmarin@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:17:06', 2),
(42, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:18:19', 2),
(43, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:19:49', 2),
(44, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:20:46', 2),
(45, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:21:58', 2),
(46, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:37:52', 2),
(47, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:39:46', 2),
(48, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:42:20', 2),
(49, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:44:33', 2),
(50, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:55:26', 2),
(51, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:56:44', 2),
(52, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-22 18:59:05', 2),
(53, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-23 16:00:45', 2),
(54, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-23 16:10:07', 2),
(55, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-23 16:19:06', 2),
(56, 1, 1, 1, 25, '12345678901', '555-6543', 'miguelf@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-23 16:20:36', 2),
(57, 1, 1, 3, 17, '34567890123', '555-7654', 'luzmarin@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-23 16:22:04', 2),
(58, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-23 16:23:29', 2),
(59, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-23 16:25:54', 2),
(60, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-23 16:27:53', 2),
(61, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-28 21:15:26', 2),
(62, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-28 21:48:23', 2),
(63, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-28 21:54:23', 2),
(64, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-28 21:55:18', 2),
(65, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-28 21:55:53', 2),
(66, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-28 22:00:59', 2),
(67, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-08-28 22:04:03', 2),
(68, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 10:54:13', 2),
(69, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:31:24', 2),
(70, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:31:52', 2),
(71, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:32:34', 2),
(72, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:33:04', 2),
(73, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:34:10', 2),
(74, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:34:27', 2),
(75, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:34:51', 2),
(76, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:38:22', 2),
(77, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:39:02', 2),
(78, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:39:07', 2),
(79, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:40:26', 2),
(80, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:43:36', 2),
(81, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:45:34', 2),
(82, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:46:19', 2),
(83, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 11:46:35', 2),
(84, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 749.91, 0.00, 749.91, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 12:30:07', 2),
(85, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 12:39:57', 2),
(86, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 19.98, 0.00, 19.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 12:41:28', 2),
(87, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 159.98, 100.00, 259.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 12:46:18', 2),
(88, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 89.97, 0.00, 89.97, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 12:50:57', 2),
(89, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 19:19:03', 2),
(90, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 179.98, 0.00, 179.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-05 19:19:44', 2),
(91, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 179.98, 0.00, 179.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-06 11:34:18', 2),
(92, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-06 11:40:02', 2),
(93, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-06 11:40:17', 2),
(94, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 179.98, 0.00, 179.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-06 11:41:04', 2),
(95, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-06 11:53:57', 2),
(96, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-06 11:55:35', 2),
(97, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-06 11:57:55', 2),
(98, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 139.96, 0.00, 139.96, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-06 12:03:30', 2),
(99, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 179.98, 0.00, 179.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-06 12:07:32', 2),
(100, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 379.93, 100.00, 479.93, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-06 12:09:36', 2),
(101, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 379.96, 100.00, 479.96, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-06 12:55:14', 2),
(102, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-06 12:58:22', 2),
(103, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-06 12:59:05', 2),
(104, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 11:39:06', 2),
(105, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 11:39:10', 2),
(106, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 11:39:18', 2),
(107, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 11:39:19', 2),
(108, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 11:47:17', 2),
(109, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 11:49:47', 2),
(110, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 11:50:22', 2),
(111, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 11:52:02', 2),
(112, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 11:52:52', 2),
(113, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 11:53:19', 2),
(114, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 11:53:43', 2),
(115, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 12:17:22', 2),
(116, 1, 1, 2, 27, '23456789012', '555-5678', 'maria.rodriguez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 12:18:47', 2),
(117, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 12:21:16', 2),
(118, 1, 1, 1, 25, '12345678901', '555-6543', 'miguelf@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 12:22:13', 2),
(119, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 12:22:39', 2),
(120, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 12:56:54', 2),
(121, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 12:57:34', 2),
(122, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 13:12:04', 2),
(123, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 13:13:51', 2),
(124, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 13:16:19', 2),
(125, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 13:17:46', 2),
(126, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 18:55:53', 2),
(127, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 219.98, 0.00, 219.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 19:08:15', 2),
(128, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 179.98, 0.00, 179.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 19:09:15', 2),
(129, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 839.95, 200.00, 1039.95, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-07 19:10:28', 2),
(130, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 10:55:06', 2),
(131, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 79.98, 0.00, 79.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 11:03:17', 2),
(132, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 79.98, 0.00, 79.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 11:03:57', 2),
(133, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 179.98, 0.00, 179.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 11:06:00', 2),
(134, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 79.98, 0.00, 79.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 11:08:08', 2),
(135, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 11:09:45', 2),
(136, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 11:19:54', 2),
(137, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 11:28:54', 2),
(138, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 319.98, 0.00, 319.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 11:47:00', 2),
(139, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 159.96, 0.00, 159.96, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 12:13:18', 2),
(140, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 12:14:30', 2),
(141, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 12:14:58', 2),
(142, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 79.98, 0.00, 79.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 12:15:32', 2),
(143, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 299.98, 0.00, 299.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-08 12:15:58', 2),
(144, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 179.98, 0.00, 179.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-11 12:31:25', 2),
(145, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 279.98, 0.00, 279.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-11 12:43:02', 2),
(146, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 139.98, 0.00, 139.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-11 12:43:49', 2),
(147, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-11 13:00:01', 2),
(148, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-11 13:01:41', 2),
(149, 1, 1, 3, 5, '34567890123', '555-8765', 'pedrogomez@example.com', '', 0, 179.98, 0.00, 179.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-11 13:06:06', 2),
(150, 1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-11 13:06:47', 2),
(151, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-11 13:10:41', 2),
(152, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-11 16:07:02', 2),
(153, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-11 16:08:40', 2),
(154, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-11 16:12:56', 2),
(155, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 439.96, 0.00, 439.96, 'ad', 'as', 'as', 'Enviado', '2023-09-11 17:47:44', NULL, NULL, '2023-09-11 17:44:48', 1),
(156, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 179.98, 0.00, 179.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-11 17:47:59', 2),
(157, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 299.98, 0.00, 299.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-11 18:12:31', 2),
(158, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 179.98, 0.00, 179.98, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Enviado', '2023-09-11 18:16:51', NULL, NULL, '2023-09-11 18:15:56', 1),
(159, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 79.98, 0.00, 79.98, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Enviado', '2023-09-13 12:17:07', NULL, NULL, '2023-09-13 12:16:26', 1),
(160, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 59.98, 0.00, 59.98, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Enviado', '2023-09-13 12:18:22', NULL, NULL, '2023-09-13 12:18:14', 1),
(161, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 769.92, 0.00, 769.92, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Enviado', '2023-09-13 18:09:44', NULL, NULL, '2023-09-13 12:19:13', 1),
(162, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 329.89, 0.00, 329.89, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:asdadasdasdasdadas', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:asdadasdasdasdadas', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Enviado', '2023-09-14 15:40:26', NULL, NULL, '2023-09-14 13:53:48', 1),
(163, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 79.98, 0.00, 79.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-14 15:44:41', 2),
(164, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 279.98, 0.00, 279.98, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Enviado', '2023-09-14 15:48:14', NULL, NULL, '2023-09-14 15:47:51', 1),
(165, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 59.98, 0.00, 59.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-15 11:19:10', 2),
(166, 1, 1, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '', 0, 59.98, 0.00, 59.98, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Enviado', '2023-09-15 11:20:43', NULL, NULL, '2023-09-15 11:20:31', 1),
(167, 1, 1, 1, 26, '12345678901', '555-1234', 'davis_anderson_87@hotmail.com', '', 0, 219.98, 0.00, 219.98, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Aceptado', '2023-09-15 11:24:19', '2023-09-15 12:40:22', '2023-09-18 23:16:06', '2023-09-15 11:24:03', 1),
(168, 1, 1, 1, 26, '12345678901', '555-1234', 'davis_anderson_87@hotmail.com', '', 0, 59.98, 0.00, 59.98, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Aceptado', '2023-09-15 12:31:27', '2023-09-15 12:33:57', '2023-09-18 23:14:11', '2023-09-15 12:30:48', 1);
INSERT INTO `cotizacion` (`cotizacionId`, `cotizacionUsuarioId`, `cotizacionEmpresaId`, `cotizacionClienteId`, `cotizacionContactoId`, `cotizacionClienteRuc`, `cotizacionContactoTelefono`, `cotizacionContactoEmail`, `cotizacionDescripcion`, `cotizacionEmpresaPorcentaje`, `cotizacionSubtotal`, `cotizacionProfit`, `cotizacionTotal`, `cotizacionSaludo`, `cotizacionAdicional`, `cotizacionContrato`, `cotizacionTipo`, `cotizacionFechaEnvio`, `cotizacionFechaVisto`, `cotizacionFechaRespuesta`, `cotizacionFechaCreacion`, `cotizacionEstado`) VALUES
(169, 1, 1, 1, 26, '12345678901', '555-1234', 'davisanderson87@gmail.com', '', 0, 59.98, 0.00, 59.98, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Rechazado', '2023-09-15 12:44:27', '2023-09-15 12:44:48', '2023-09-18 22:31:25', '2023-09-15 12:44:07', 1),
(170, 1, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '', 0, 219.98, 0.00, 219.98, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-19 12:26:50', 2),
(171, 1, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '', 0, 832.95, 233.00, 1065.95, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Enviado', '2023-09-24 18:22:11', NULL, NULL, '2023-09-24 18:20:51', 1),
(172, 1, 1, 1, 26, '12345678901', '555-1234', 'davisanderson87@gmail.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-24 18:22:02', 2),
(173, 1, 1, 1, 26, '12345678901', '555-1234', 'davisanderson87@gmail.com', '', 0, 1099.90, 0.00, 1099.90, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Visto', '2023-09-24 18:24:19', '2023-09-24 18:25:06', NULL, '2023-09-24 18:24:01', 1),
(174, 1, 1, 1, 26, '12345678901', '555-1234', 'davisanderson87@gmail.com', '', 0, 1039.94, 500.00, 1539.94, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Enviado', '2023-09-29 20:26:11', NULL, NULL, '2023-09-29 20:25:41', 1),
(175, 1, 1, 1, 6, '12345678901', '+51981233834', 'carlagonzalez@example.com', '', 0, 359.96, 0.00, 359.96, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Enviado', '2023-09-29 21:48:07', NULL, NULL, '2023-09-29 20:40:51', 1),
(176, 1, 1, 1, 26, '12345678901', '+51981233834', 'davisanderson87@gmail.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-29 20:42:08', 2),
(177, 1, 1, 1, 26, '12345678901', '+51981233834', 'davisanderson87@gmail.com', '', 0, 179.98, 0.00, 179.98, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Enviado', '2023-09-29 21:51:21', NULL, NULL, '2023-09-29 21:51:07', 1),
(178, 1, 1, 1, 26, '12345678901', '+51981233834', 'davisanderson87@gmail.com', '', 0, 59.98, 0.00, 59.98, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Enviado', '2023-09-29 22:07:27', NULL, NULL, '2023-09-29 21:53:27', 1),
(179, 1, 1, 1, 26, '12345678901', '+51981233834', 'davisanderson87@gmail.com', '', 0, 0.00, 0.00, 0.00, NULL, NULL, NULL, 'Borrador', NULL, NULL, NULL, '2023-09-29 21:55:13', 2),
(180, 1, 1, 1, 26, '12345678901', '+51981233834', 'davisanderson87@gmail.com', '', 0, 179.98, 0.00, 179.98, 'Es un placer para nosotros enviarle la cotización solicitada. Hemos tomado en cuenta todos los detalles proporcionados y hemos elaborado una oferta que creemos se ajusta a sus necesidades.Adjunto a este correo con la cotización detallada, donde podrá encontrar todos los precios, descripciones de los productos/servicios y las condiciones asociadas. Estamos seguros de que encontrará nuestra propuesta competitiva y de alta calidad.Si tiene alguna pregunta adicional o desea realizar modificaciones en la cotización, no dude en contactarnos. Estamos aquí para brindarle el mejor servicio y trabajar juntos para satisfacer sus requerimientos.', 'Detalle de los Costos Adicionales que no han sido Tenidos en Cuenta en la Cotización Inicial:', 'CONTRATO DE ACEPTACIÓN DE COTIZACIÓN\n\nEntre AnderCode INC, en adelante \"El Proveedor,\" y [Nombre del Cliente], en adelante \"El Cliente.\"\n\nEl Cliente ha revisado la cotización proporcionada por El Proveedor, la cual incluye una descripción detallada de los productos y/o servicios a ser suministrados. Al aceptar esta cotización, El Cliente acuerda contratar a El Proveedor para la provisión de dichos productos y/o servicios de acuerdo con los términos y condiciones estipulados en la cotización.\n\nEl Cliente acepta pagar a El Proveedor la cantidad especificada en la cotización dentro de los plazos acordados. Los detalles específicos de los pagos, incluyendo el monto total, fechas de vencimiento y cualquier término adicional relacionado con el pago, se detallan en la cotización adjunta. El Cliente comprende y acepta que el incumplimiento de los términos de pago acarreará consecuencias definidas en la cotización.\n\nEl plazo de este contrato comenzará en la fecha de aceptación de la cotización por parte del Cliente y continuará de acuerdo con la duración estipulada en la cotización. Cualquier terminación anticipada deberá ser acordada por escrito entre las partes y estará sujeta a las condiciones detalladas en la cotización. Ambas partes se comprometen a cumplir con todas las obligaciones y responsabilidades establecidas en este contrato durante su vigencia.\n\n                ', 'Enviado', '2023-09-29 22:17:24', NULL, NULL, '2023-09-29 22:09:30', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresaId` int(11) NOT NULL,
  `empresaNombre` varchar(255) NOT NULL,
  `empresaPorcentaje` int(11) NOT NULL,
  `empresaEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresaId`, `empresaNombre`, `empresaPorcentaje`, `empresaEstado`) VALUES
(4, 'Empresa 4', 90, 0),
(5, 'Empresa 5', 30, 0),
(6, 'rest', 12, 1),
(7, 'test', 100, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `productoId` int(11) NOT NULL,
  `productoCategoriaId` int(11) DEFAULT NULL,
  `productoNombre` varchar(255) DEFAULT NULL,
  `productoDescripcion` text DEFAULT NULL,
  `productoPrecio` decimal(10,2) DEFAULT NULL,
  `productoEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`productoId`, `productoCategoriaId`, `productoNombre`, `productoDescripcion`, `productoPrecio`, `productoEstado`) VALUES
(2, 22, 'Producto 2', 'Descripción del Producto 2', 15.50, 1),
(3, 23, 'Producto 3', 'Descripción del Producto 3', 22.75, 1),
(4, 24, 'Producto 4', 'Descripción del Producto 4', 18.95, 1),
(5, 25, 'Producto 5', 'Descripción del Producto 5', 8.99, 1),
(6, 26, 'Producto 6', 'Descripción del Producto 6', 12.25, 1),
(7, 27, 'Producto 7', 'Descripción del Producto 7', 14.50, 1),
(8, 22, 'dos 2', 'mas test 2', 1.50, 1),
(9, 21, 'Producto 9', 'Descripción del Producto 9', 16.99, 1),
(11, 25, 'Producto 11', 'Descripción del Producto 11', 11.00, 0),
(12, 22, 'Producto 12', 'Descripción del Producto 12', 16.00, 1),
(13, 23, 'Producto 13', 'Descripción del Producto 13', 22.75, 1),
(14, 24, 'Producto 14', 'Descripción del Producto 14', 18.95, 1),
(15, 25, 'Producto 15', 'Descripción del Producto 15', 8.99, 1),
(16, 26, 'Producto 16', 'Descripción del Producto 16', 12.25, 1),
(17, 27, 'Producto 17', 'Descripción del Producto 17', 14.50, 1),
(19, 21, 'Producto 19', 'Descripción del Producto 19', 16.99, 1),
(20, 21, 'Producto 20', 'Descripción del Producto 20', 11.49, 1),
(53, 23, 'algo', 'mas test', 0.11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuarioId` int(11) NOT NULL,
  `usuarioCorreo` varchar(150) DEFAULT NULL,
  `usuarioNombre` varchar(150) DEFAULT NULL,
  `usuarioPassword` varchar(50) DEFAULT NULL,
  `usuarioEstado` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuarioId`, `usuarioCorreo`, `usuarioNombre`, `usuarioPassword`, `usuarioEstado`) VALUES
(1, 'admin7@hotmail.com', 'Admin', '123456', 1),
(2, 'sucursal222@andercode.com', 'test1', '1234567', 0),
(6, 'test@gmail.com', 'test', '123456', 0),
(7, 'admin@gmail.com', 'Administrador', '123456', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`cargoId`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoriaId`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`clienteId`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`contactoId`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`cotizacionId`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`empresaId`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`productoId`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuarioId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `cargoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `categoriaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `clienteId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `contactoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `cotizacionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `empresaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `productoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuarioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
