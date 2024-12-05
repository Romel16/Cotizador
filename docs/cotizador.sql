-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-11-2024 a las 04:33:27
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
(1, 'Categoría 1', 'Descripción de la Categoría 1', 1),
(2, 'Categoría 2', 'Descripción de la Categoría 2', 1),
(3, '2222', '2222', 0),
(4, 'Categoría 4', 'Descripción de la Categoría 4', 1),
(5, 'Categoría 5', 'Descripción de la Categoría 5', 1),
(6, 'Categoría 6', 'Descripción de la Categoría 6', 1),
(7, 'Categoría 7', 'Descripción de la Categoría 7', 1),
(8, 'test', 'test', 0),
(9, 'test nombre', 'test descripcion', 0),
(10, 'test', 'test', 0),
(11, 'test1', 'test2', 0),
(12, 'test', 'test', 0),
(13, 'test', 'test', 0),
(14, 'test', 'test', 0),
(15, 'test', 'test', 0),
(16, 'test', 'test', 0),
(17, 'test', 'test', 0),
(18, 'test', 'test', 0),
(19, 'categoria8', 'test', 1);

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
(1, 5, 9, 'Juan Perez', 'juanperez@example.com', '555-1234', 1),
(2, 4, 2, 'Ana Garcia', 'anagarcia@example.com', '555-5678', 1),
(3, 2, 7, 'Luis Hernandez', 'luish@example.com', '555-9876', 1),
(4, 10, 1, 'Maria Rodriguez', 'mariar@example.com', '555-4321', 1),
(5, 3, 5, 'Pedro Gomez', 'pedrogomez@example.com', '555-8765', 1),
(6, 1, 6, 'Carla Gonzalez', 'carlagonzalez@example.com', '555-3456', 1),
(7, 9, 11, 'Mario Castro', 'mariocastro@example.com', '555-6789', 1),
(8, 8, 8, 'Laura Vargas', 'lauravargas@example.com', '555-2345', 1),
(9, 5, 3, 'Ricardo Ramirez', 'ricardor@example.com', '555-7890', 1),
(10, 7, 4, 'Sofia Garcia', 'sofiagarcia@example.com', '555-0987', 1),
(11, 10, 2, 'Carlos Valdez', 'carlosv@example.com', '555-7654', 1),
(12, 6, 10, 'Ana Maria Flores', 'anamariaf@example.com', '555-3210', 1),
(13, 2, 15, 'Fernando Morales', 'fernandom@example.com', '555-6543', 1),
(14, 8, 8, 'Natalia Hernandez', 'nataliah@example.com', '555-2109', 1),
(15, 1, 7, 'Luisa Perez', 'luisaperez@example.com', '555-5432', 1),
(16, 4, 4, 'Jorge Chavez', 'jorgechavez@example.com', '555-1098', 1),
(17, 3, 12, 'Luz Marin', 'luzmarin@example.com', '555-7654', 1),
(18, 9, 14, 'Felix Torres', 'felixtorres@example.com', '555-3210', 1),
(19, 6, 7, 'Carolina Vega', 'carolinavega@example.com', '555-6543', 1),
(20, 10, 1, 'Gabriel Espinoza', 'gabe@example.com', '555-2109', 1),
(21, 5, 2, 'Marcela Castro', 'marcelac@example.com', '555-5432', 1),
(22, 7, 8, 'Daniel Ramirez', 'danielr@example.com', '555-1098', 1),
(23, 2, 6, 'Valeria Flores', 'valeriaf@example.com', '555-7654', 1),
(24, 8, 13, 'Lucia Herrera', 'luciah@example.com', '555-3210', 1),
(25, 1, 5, 'Miguel Fernandez', 'miguelf@example.com', '555-6543', 1),
(26, 1, 4, 'Anderson Bastidas', 'davisanderson87@gmail.com', '555-1234', 1),
(27, 2, 10, 'María Rodríguez', 'maria.rodriguez@example.com', '555-5678', 1),
(28, 3, 8, 'Pedro López', 'pedro.lopez@example.com', '555-9012', 1),
(29, 4, 12, 'Ana García', 'ana.garcia@example.com', '555-3456', 1),
(30, 5, 9, 'Carlos Ramírez', 'carlos.ramirez@example.com', '555-7890', 1),
(31, 6, 7, 'Lucía Torres', 'lucia.torres@example.com', '555-1234', 1),
(32, 7, 6, 'Juanita Fernández', 'juanita.fernandez@example.com', '555-5678', 1),
(33, 8, 5, 'Pedro González', 'pedro.gonzalez@example.com', '555-9012', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `cotizacionId` int(11) NOT NULL,
  `cotizacionEmpresaId` int(11) NOT NULL DEFAULT 1,
  `cotizacionClienteId` int(11) NOT NULL,
  `cotizacionContactoId` int(11) NOT NULL,
  `clienteRuc` varchar(20) NOT NULL,
  `contactoTelefono` varchar(20) DEFAULT NULL,
  `contactoEmail` varchar(50) DEFAULT NULL,
  `cotizacionDescripcion` text DEFAULT NULL,
  `empresaPorcet` int(11) NOT NULL DEFAULT 0,
  `cotizacionSubTotal` decimal(8,2) NOT NULL DEFAULT 0.00,
  `cotizacionProfit` decimal(8,2) NOT NULL DEFAULT 0.00,
  `cotizacionTotal` decimal(8,2) NOT NULL DEFAULT 0.00,
  `cotizacionFechaCreacion` datetime DEFAULT current_timestamp(),
  `cotizacionEstado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`cotizacionId`, `cotizacionEmpresaId`, `cotizacionClienteId`, `cotizacionContactoId`, `clienteRuc`, `contactoTelefono`, `contactoEmail`, `cotizacionDescripcion`, `empresaPorcet`, `cotizacionSubTotal`, `cotizacionProfit`, `cotizacionTotal`, `cotizacionFechaCreacion`, `cotizacionEstado`) VALUES
(1, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '7', 0, 139.99, 0.00, 139.99, '2024-07-21 23:00:28', 1),
(2, 1, 2, 23, '23456789012', '555-7654', 'valeriaf@example.com', '1', 0, 119.94, 0.00, 119.94, '2024-07-22 22:44:52', 1),
(3, 1, 5, 9, '56789012345', '555-7890', 'ricardor@example.com', '2', 0, 139.98, 100.00, 239.98, '2024-07-22 22:48:09', 1),
(4, 1, 3, 17, '34567890123', '555-7654', 'luzmarin@example.com', '3', 0, 439.95, 100.00, 539.95, '2024-07-23 16:04:16', 1),
(5, 0, 3, 28, '34567890123', '555-9012', 'pedro.lopez@example.com', '45', 0, 159.97, 100.00, 259.97, '2024-07-23 16:07:15', 1),
(6, 0, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '46', 0, 379.98, 100.00, 479.98, '2024-07-23 16:09:10', 1),
(7, 0, 3, 28, '34567890123', '555-9012', 'pedro.lopez@example.com', '1', 0, 0.00, 0.00, 0.00, '2024-07-23 22:18:23', 1),
(8, 0, 1, 26, '12345678901', '555-1234', 'davisanderson87@gmail.com', '5', 0, 0.00, 0.00, 0.00, '2024-07-23 22:39:00', 1),
(9, 0, 3, 28, '34567890123', '555-9012', 'pedro.lopez@example.com', '1', 0, 0.00, 0.00, 0.00, '2024-07-24 14:31:14', 1),
(10, 0, 5, 9, '56789012345', '555-7890', 'ricardor@example.com', '2', 0, 189.94, 0.00, 189.94, '2024-07-24 14:32:06', 1),
(11, 0, 1, 6, '12345678901', '555-3456', 'carlagonzalez@example.com', '1', 0, 79.99, 0.00, 79.99, '2024-07-24 14:37:31', 1),
(12, 0, 2, 3, '23456789012', '555-9876', 'luish@example.com', '3', 0, 0.00, 0.00, 0.00, '2024-07-24 14:39:49', 1),
(13, 0, 3, 28, '34567890123', '555-9012', 'pedro.lopez@example.com', '3', 0, 139.99, 0.00, 139.99, '2024-07-24 14:45:14', 1),
(14, 0, 4, 29, '45678901234', '555-3456', 'ana.garcia@example.com', '5', 0, 139.99, 0.00, 139.99, '2024-07-24 14:48:04', 1),
(15, 0, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '9', 0, 229.99, 100.00, 329.99, '2024-07-24 23:00:18', 1),
(16, 0, 2, 23, '23456789012', '555-7654', 'valeriaf@example.com', '1', 0, 139.98, 100.00, 239.98, '2024-07-28 22:02:50', 1),
(17, 0, 3, 5, '34567890123', '555-8765', 'pedrogomez@example.com', '2', 0, 129.99, 0.00, 129.99, '2024-07-28 22:47:05', 1),
(18, 0, 3, 17, '34567890123', '555-7654', 'luzmarin@example.com', '231', 0, 79.96, 0.00, 79.96, '2024-07-28 22:49:26', 1),
(19, 0, 3, 28, '34567890123', '555-9012', 'pedro.lopez@example.com', '321', 0, 139.99, 0.00, 139.99, '2024-07-28 22:53:25', 1),
(20, 1, 6, 12, '67890123456', '555-3210', 'anamariaf@example.com', '1', 0, 39.99, 0.00, 39.99, '2024-07-28 23:55:39', 1),
(21, 1, 1, 15, '12345678901', '555-5432', 'luisaperez@example.com', '1', 0, 259.98, 0.00, 259.98, '2024-07-29 00:05:28', 1),
(22, 1, 3, 28, '34567890123', '555-9012', 'pedro.lopez@example.com', '12', 0, 59.97, 0.00, 59.97, '2024-07-29 00:06:43', 1),
(23, 1, 2, 3, '23456789012', '555-9876', 'luish@example.com', '1', 0, 39.98, 0.00, 39.98, '2024-07-29 00:14:08', 1),
(24, 1, 3, 17, '34567890123', '555-7654', 'luzmarin@example.com', '1', 0, 139.99, 0.00, 139.99, '2024-07-29 00:24:11', 1),
(25, 1, 6, 31, '67890123456', '555-1234', 'lucia.torres@example.com', '2', 0, 139.99, 0.00, 139.99, '2024-08-05 23:01:44', 1),
(26, 1, 4, 16, '45678901234', '555-1098', 'jorgechavez@example.com', '2', 0, 59.97, 0.00, 59.97, '2024-08-05 23:05:21', 1),
(27, 1, 3, 17, '34567890123', '555-7654', 'luzmarin@example.com', 'vghc', 0, 0.00, 0.00, 0.00, '2024-08-05 23:16:29', 1),
(28, 1, 3, 28, '34567890123', '555-9012', 'pedro.lopez@example.com', '10', 0, 189.99, 0.00, 189.99, '2024-08-06 23:09:43', 1),
(29, 1, 2, 13, '23456789012', '555-6543', 'fernandom@example.com', '11', 0, 159.98, 0.00, 159.98, '2024-08-06 23:12:48', 1),
(30, 1, 4, 29, '45678901234', '555-3456', 'ana.garcia@example.com', 'jjajaa', 0, 269.97, 0.00, 269.97, '2024-11-22 13:59:18', 1),
(31, 1, 5, 9, '56789012345', '555-7890', 'ricardor@example.com', 'aaaa', 0, 39.98, 0.00, 39.98, '2024-11-22 14:03:51', 1),
(32, 1, 3, 17, '34567890123', '555-7654', 'luzmarin@example.com', '', 0, 0.00, 0.00, 0.00, '2024-11-22 22:15:35', 1),
(33, 1, 3, 28, '34567890123', '555-9012', 'pedro.lopez@example.com', '', 0, 19.99, 0.00, 19.99, '2024-11-22 22:18:23', 1),
(34, 1, 4, 16, '45678901234', '555-1098', 'jorgechavez@example.com', '', 0, 79.99, 0.00, 79.99, '2024-11-25 15:10:09', 1),
(35, 1, 3, 5, '34567890123', '555-8765', 'pedrogomez@example.com', '', 0, 39.98, 0.00, 39.98, '2024-11-25 15:12:03', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecotizacion`
--

CREATE TABLE `detallecotizacion` (
  `detallecotizacionId` int(11) NOT NULL,
  `detallecotizacionCotizacionId` int(11) DEFAULT NULL,
  `detallecotizacionCategoriaId` int(11) DEFAULT NULL,
  `detallecotizacionProductoId` int(11) DEFAULT NULL,
  `detallecotizacionPrecio` decimal(8,2) DEFAULT NULL,
  `detallecotizacionCantidad` int(11) DEFAULT NULL,
  `detallecotizacionProfit` decimal(8,2) DEFAULT NULL,
  `detallecotizacionTotal` decimal(8,2) DEFAULT NULL,
  `detallecotizacionTipo` varchar(1) DEFAULT NULL,
  `detallecotizacionfechaCreacion` datetime DEFAULT NULL,
  `detallecotizacionFechaModificacion` datetime DEFAULT NULL,
  `detallecotizacionFechaEliminacion` datetime DEFAULT NULL,
  `detallecotizacionEstado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallecotizacion`
--

INSERT INTO `detallecotizacion` (`detallecotizacionId`, `detallecotizacionCotizacionId`, `detallecotizacionCategoriaId`, `detallecotizacionProductoId`, `detallecotizacionPrecio`, `detallecotizacionCantidad`, `detallecotizacionProfit`, `detallecotizacionTotal`, `detallecotizacionTipo`, `detallecotizacionfechaCreacion`, `detallecotizacionFechaModificacion`, `detallecotizacionFechaEliminacion`, `detallecotizacionEstado`) VALUES
(1, 10, 7, 2, 19.99, 3, 0.00, 59.97, 'D', '2024-07-21 23:00:06', NULL, NULL, 1),
(2, 1, 5, 14, 139.99, 1, 0.00, 139.99, 'D', '2024-07-21 23:00:38', NULL, NULL, 1),
(3, 2, 7, 2, 19.99, 3, 0.00, 59.97, NULL, '2024-07-22 22:45:04', NULL, NULL, 1),
(4, 2, 7, 2, 19.99, 3, 0.00, 59.97, NULL, '2024-07-22 22:45:08', NULL, NULL, 1),
(5, 3, 7, 2, 19.99, 2, 100.00, 139.98, 'D', '2024-07-22 22:48:20', NULL, NULL, 1),
(6, 4, 5, 14, 139.99, 2, 0.00, 279.98, 'D', '2024-07-23 16:04:30', NULL, NULL, 1),
(7, 4, 7, 2, 19.99, 3, 100.00, 159.97, 'D', '2024-07-23 16:04:43', NULL, NULL, 1),
(8, 5, 7, 2, 19.99, 3, 100.00, 159.97, 'D', '2024-07-23 16:07:26', NULL, NULL, 1),
(9, 6, 5, 14, 139.99, 2, 100.00, 379.98, 'D', '2024-07-23 16:09:20', NULL, NULL, 1),
(10, 10, 7, 2, 19.99, 2, 0.00, 39.98, 'D', '2024-07-24 14:32:15', NULL, NULL, 1),
(11, 10, 4, 9, 89.99, 1, 0.00, 89.99, 'D', '2024-07-24 14:32:40', NULL, NULL, 1),
(12, 11, 6, 8, 79.99, 1, 0.00, 79.99, 'D', '2024-07-24 14:38:01', NULL, NULL, 1),
(13, 13, 5, 14, 139.99, 1, 0.00, 139.99, 'D', '2024-07-24 14:45:27', NULL, NULL, 1),
(14, 13, 7, 2, 19.99, 3, 0.00, 59.97, 'A', '2024-07-24 14:45:42', NULL, NULL, 1),
(15, 14, 5, 14, 139.99, 1, 0.00, 139.99, 'D', '2024-07-24 14:48:15', NULL, NULL, 1),
(16, 14, 5, 7, 69.99, 2, 100.00, 239.98, 'A', '2024-07-24 14:48:41', NULL, NULL, 1),
(17, 15, 6, 13, 129.99, 1, 100.00, 229.99, 'D', '2024-07-24 23:00:34', NULL, NULL, 1),
(18, 15, 6, 13, 129.99, 2, 100.00, 359.98, 'A', '2024-07-24 23:01:04', NULL, NULL, 1),
(19, 16, 7, 2, 19.99, 2, 100.00, 139.98, 'D', '2024-07-28 22:03:00', NULL, NULL, 1),
(20, 16, 6, 8, 79.99, 1, 50.00, 129.99, 'A', '2024-07-28 22:03:25', NULL, NULL, 1),
(21, 17, 6, 13, 129.99, 1, 0.00, 129.99, 'D', '2024-07-28 22:47:16', NULL, NULL, 1),
(22, 17, 6, 8, 79.99, 2, 0.00, 159.98, 'A', '2024-07-28 22:47:31', NULL, NULL, 1),
(23, 18, 7, 2, 19.99, 4, 0.00, 79.96, 'D', '2024-07-28 22:49:35', NULL, NULL, 1),
(24, 18, 7, 2, 19.99, 1, 0.00, 19.99, 'A', '2024-07-28 22:49:51', NULL, NULL, 1),
(25, 19, 5, 14, 139.99, 1, 0.00, 139.99, 'D', '2024-07-28 22:53:37', NULL, NULL, 1),
(26, 19, 4, 9, 89.99, 2, 0.00, 179.98, 'A', '2024-07-28 22:53:57', NULL, NULL, 1),
(27, 20, 4, 4, 39.99, 1, 0.00, 39.99, 'D', '2024-07-28 23:55:47', NULL, NULL, 1),
(28, 20, 6, 13, 129.99, 1, 0.00, 129.99, 'A', '2024-07-28 23:56:05', NULL, NULL, 1),
(29, 21, 6, 13, 129.99, 2, 0.00, 259.98, 'D', '2024-07-29 00:05:38', NULL, NULL, 1),
(30, 22, 7, 2, 19.99, 3, 0.00, 59.97, 'D', '2024-07-29 00:06:58', NULL, NULL, 1),
(31, 23, 7, 2, 19.99, 2, 0.00, 39.98, 'D', '2024-07-29 00:14:18', NULL, NULL, 1),
(32, 24, 5, 14, 139.99, 1, 0.00, 139.99, 'D', '2024-07-29 00:24:28', NULL, NULL, 1),
(33, 24, 7, 2, 19.99, 3, 0.00, 59.97, 'A', '2024-07-29 00:24:42', NULL, NULL, 1),
(34, 25, 5, 14, 139.99, 1, 0.00, 139.99, 'D', '2024-08-05 23:01:54', NULL, NULL, 1),
(35, 26, 7, 2, 19.99, 3, 0.00, 59.97, 'D', '2024-08-05 23:05:40', NULL, NULL, 1),
(36, 26, 6, 20, 199.99, 1, 100.00, 299.99, 'A', '2024-08-05 23:06:03', NULL, NULL, 1),
(37, 28, 5, 19, 189.99, 1, 0.00, 189.99, 'D', '2024-08-06 23:09:58', NULL, NULL, 1),
(38, 29, 6, 8, 79.99, 2, 0.00, 159.98, 'D', '2024-08-06 23:13:03', NULL, NULL, 1),
(39, 30, 4, 9, 89.99, 3, 0.00, 269.97, 'D', '2024-11-22 13:59:31', NULL, NULL, 1),
(40, 31, 7, 2, 19.99, 2, 0.00, 39.98, 'D', '2024-11-22 14:04:05', NULL, NULL, 1),
(41, 31, 5, 14, 139.99, 1, 0.00, 139.99, 'A', '2024-11-22 14:04:18', NULL, NULL, 1),
(42, 31, 5, 14, 139.99, 1, 0.00, 139.99, 'A', '2024-11-22 14:04:23', NULL, '2024-11-22 14:04:55', 0),
(43, 33, 7, 2, 19.99, 1, 0.00, 19.99, 'D', '2024-11-22 22:18:37', NULL, NULL, 1),
(44, 34, 6, 8, 79.99, 1, 0.00, 79.99, 'D', '2024-11-25 15:10:17', NULL, NULL, 1),
(45, 35, 7, 2, 19.99, 2, 0.00, 39.98, 'D', '2024-11-25 15:12:22', NULL, NULL, 1),
(46, 35, 5, 19, 189.99, 1, 0.00, 189.99, 'A', '2024-11-25 15:32:17', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresaId` int(11) NOT NULL,
  `empresaNombre` varchar(255) NOT NULL,
  `empresaPorcentaje` int(11) NOT NULL,
  `empresaRuc` varchar(12) NOT NULL,
  `empresaTelefono` varchar(12) NOT NULL,
  `empresaEmail` varchar(10) NOT NULL,
  `empresaEstado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresaId`, `empresaNombre`, `empresaPorcentaje`, `empresaRuc`, `empresaTelefono`, `empresaEmail`, `empresaEstado`) VALUES
(1, 'test', 12, '20204353', '987654321', 'correo@tes', 1);

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
(1, 1, 'Producto 1', 'Descripción del Producto 1', 9.99, 1),
(2, 7, 'Producto 2', 'Descripción del Producto 2', 19.99, 1),
(3, 2, 'Producto 3', 'Descripción del Producto 3', 29.99, 1),
(4, 4, 'Producto 4', 'Descripción del Producto 4', 39.99, 1),
(5, 3, 'Producto 5', 'Descripción del Producto 5', 49.99, 1),
(6, 1, 'Producto 6', 'Descripción del Producto 6', 59.99, 1),
(7, 5, 'Producto 7', 'Descripción del Producto 7', 69.99, 1),
(8, 6, 'Producto 8', 'Descripción del Producto 8', 79.99, 1),
(9, 4, 'Producto 9', 'Descripción del Producto 9', 89.99, 1),
(10, 3, 'Producto 10', 'Descripción del Producto 10', 99.99, 1),
(11, 2, 'Producto 11', 'Descripción del Producto 11', 109.99, 1),
(12, 1, 'Producto 12', 'Descripción del Producto 12', 119.99, 1),
(13, 6, 'Producto 13', 'Descripción del Producto 13', 129.99, 1),
(14, 5, 'Producto 14', 'Descripción del Producto 14', 139.99, 1),
(15, 4, 'Producto 15', 'Descripción del Producto 15', 149.99, 1),
(16, 2, 'Producto 16', 'Descripción del Producto 16', 159.99, 1),
(17, 3, 'Producto 17', 'Descripción del Producto 17', 169.99, 1),
(18, 1, 'Producto 18', 'Descripción del Producto 18', 179.99, 1),
(19, 5, 'Producto 19', 'Descripción del Producto 19', 189.99, 1),
(20, 6, 'Producto 20', 'Descripción del Producto 20', 199.99, 1);

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
-- Indices de la tabla `detallecotizacion`
--
ALTER TABLE `detallecotizacion`
  ADD PRIMARY KEY (`detallecotizacionId`);

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
  MODIFY `categoriaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `clienteId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `contactoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `cotizacionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `detallecotizacion`
--
ALTER TABLE `detallecotizacion`
  MODIFY `detallecotizacionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `empresaId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `productoId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuarioId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
