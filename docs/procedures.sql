
DELIMITER //

CREATE PROCEDURE `spInsertCotizacion`(
    IN `pcli_id` INT,               -- ID del cliente
    IN `pcon_id` INT,               -- ID del contacto
    IN `pcli_ruc` VARCHAR(50),      -- RUC del cliente
    IN `pcon_telf` VARCHAR(50),     -- Teléfono del contacto
    IN `pcon_email` VARCHAR(50),    -- Email del contacto
    IN `pcot_descrip` VARCHAR(500)  -- Descripción de la cotización
)
BEGIN
    -- Manejo de errores: Si ocurre algún error, regresa una señal
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error al insertar la cotización' AS ErrorMessage;
    END;

    -- Iniciar una transacción
    START TRANSACTION;

    -- Insertar datos en la tabla `cotizacion`
    INSERT INTO cotizacion (
        cotizacionId, 
        cotizacionClienteId, 
        cotizacionContactoId, 
        clienteRuc, 
        contactoTelefono, 
        contactoEmail, 
        cotizacionDescripcion, 
        cotizacionFechaCreacion, 
        cotizacionEstado
    )
    VALUES (
        NULL, 
        pcli_id, 
        pcon_id, 
        pcli_ruc, 
        pcon_telf, 
        pcon_email, 
        pcot_descrip, 
        NOW(), 
        2
    );

    -- Confirmar la transacción
    COMMIT;

    -- Devolver el ID de la nueva cotización
    SELECT LAST_INSERT_ID() AS 'cotizacionId';
END;
//
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `spInsertDetalleCotizacion`(
    IN pcot_id INT,
    IN pcat_id INT,
    IN pprod_id INT,
    IN pcotd_precio DECIMAL(8,2),
    IN pcotd_cant INT,
    IN pcotd_tipo VARCHAR(1)
)
BEGIN
    -- Declarar variables locales
    DECLARE pcotd_total DECIMAL(8,2);
    DECLARE subtotal DECIMAL(10,2);
    DECLARE profit DECIMAL(10,2);

    -- Calcular el total
    SET pcotd_total = pcotd_precio * pcotd_cant;

    -- Iniciar una transacción para garantizar la consistencia
    START TRANSACTION;

    -- Insertar en detallecotizacion
    INSERT INTO detallecotizacion 
    (detallecotizacionId, detallecotizacionCotizacionId, detallecotizacionCategoriaId, detallecotizacionProductoId, detallecotizacionPrecio, detallecotizacionCantidad, detallecotizacionProfit, detallecotizacionTotal, detallecotizacionTipo, detallecotizacionfechaCreacion, detallecotizacionEstado)
    VALUES (NULL, pcot_id, pcat_id, pprod_id, pcotd_precio, pcotd_cant, 0, pcotd_total, pcotd_tipo, NOW(), 1);

    -- Calcular los valores de subtotal y profit en una sola consulta
    SELECT 
        SUM(detallecotizacionTotal) AS subtotal,
        SUM(detallecotizacionProfit) AS profit
    INTO subtotal, profit
    FROM detallecotizacion
    WHERE detallecotizacionCotizacionId = pcot_id
      AND detallecotizacionTipo = 'D'
      AND detallecotizacionEstado = 1;

    -- Actualizar cotizacion con los valores calculados
    UPDATE cotizacion
    SET
        cotizacionSubTotal = subtotal,
        cotizacionProfit = profit,
        cotizacionTotal = subtotal + profit
    WHERE
        cotizacionId = pcot_id;

    -- Confirmar los cambios
    COMMIT;

    -- Devolver el ID de la nueva cotización
    SELECT LAST_INSERT_ID() AS 'detallecotizacionId';

END;
//

DELIMITER ;


DELIMITER //

CREATE PROCEDURE `spListarCotizacion`(
    IN `pcot_id` INT
)
BEGIN
    -- Configuración de nombres en español para fechas
    SET lc_time_names = 'es_ES';

    -- Consulta principal
    SELECT 
        cotizacion.cotizacionId,
        cotizacion.cotizacionClienteId,
        cliente.clienteNombre,
        cotizacion.clienteRuc,
        cliente.clienteTelefono,
        cliente.clienteEmail,
        cotizacion.cotizacionContactoId,
        contacto.contactoNombre,
        cotizacion.contactoTelefono,
        cotizacion.contactoEmail,
        cotizacion.cotizacionEmpresaId,
        empresa.empresaNombre,
        empresa.empresaPorcentaje,
        empresa.empresaRuc,
        empresa.empresaTelefono,
        empresa.empresaEmail,
        cotizacion.cotizacionDescripcion,
        cotizacion.cotizacionSubTotal,
        cotizacion.cotizacionProfit,
        cotizacion.cotizacionTotal,
        cotizacion.cotizacionFechaCreacion,
        -- Formato de fecha simple
        DATE_FORMAT(cotizacion.cotizacionFechaCreacion, '%d/%m/%Y') AS fech_crea_format,
        -- Nombre del mes
        MONTHNAME(cotizacion.cotizacionFechaCreacion) AS mes_en_texto,
        -- Fecha detallada
        CONCAT(
            DAYNAME(cotizacion.cotizacionFechaCreacion),
            ' ',
            DATE_FORMAT(cotizacion.cotizacionFechaCreacion, '%d'),
            ' ',
            MONTHNAME(cotizacion.cotizacionFechaCreacion),
            ' del ',
            DATE_FORMAT(cotizacion.cotizacionFechaCreacion, '%Y')
        ) AS fecha_formateada
    FROM 
        cotizacion
        INNER JOIN cliente ON cotizacion.cotizacionClienteId = cliente.clienteId
        LEFT JOIN contacto ON cotizacion.cotizacionContactoId = contacto.contactoId
        LEFT JOIN empresa ON cotizacion.cotizacionEmpresaId = empresa.empresaId
    WHERE
        cotizacion.cotizacionId = pcot_id;
END;
//
DELIMITER ;

CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdaterDetalleCotizacion`(
    IN `pcotd_id` INT,
    IN `pcotd_precio` DECIMAL(8,2),
    IN `pcotd_cant` INT,
    IN `pcotd_profit` DECIMAL(8,2),
    IN `pcot_id` INT
)
BEGIN
    -- Declarar variables
    DECLARE pcotd_total DECIMAL(8,2);
    DECLARE subtotal DECIMAL(10,2);
    DECLARE profit_total DECIMAL(10,2);
    DECLARE cotizacion_total DECIMAL(10,2);

    -- Calcular el total del detalle
    SET pcotd_total = (pcotd_cant * pcotd_precio) + pcotd_profit;

    -- Actualizar detallecotizacion
    UPDATE detallecotizacion
    SET 
        detallecotizacionPrecio = pcotd_precio,
        detallecotizacionCantidad = pcotd_cant,
        detallecotizacionProfit = pcotd_profit,
        detallecotizacionTotal = pcotd_total
    WHERE 
        detallecotizacionId = pcotd_id;

    -- Calcular nuevos valores para cotizacion
    SELECT 
        SUM(detallecotizacionTotal) AS subtotal,
        SUM(detallecotizacionProfit) AS profit_total,
        SUM(detallecotizacionTotal) + SUM(detallecotizacionProfit) AS cotizacion_total
    INTO 
        subtotal, profit_total, cotizacion_total
    FROM detallecotizacion
    WHERE 
        detallecotizacionCotizacionId = pcot_id 
        AND detallecotizacionTipo = 'D' 
        AND detallecotizacionEstado = 1;

    -- Actualizar cotizacion
    UPDATE cotizacion
    SET
        cotizacionSubTotal = subtotal,
        cotizacionProfit = profit_total,
        cotizacionTotal = cotizacion_total
    WHERE
        cotizacionId = pcot_id;

    -- Devolver el ID del detalle actualizado
    SELECT pcotd_id AS 'detallecotizacionId';

END

DELIMITER //
CREATE PROCEDURE `spEliminarDetalleCotizacion`(
    IN `pcotd_id` INT,
    IN `pcot_id` INT
)
BEGIN
    -- Declarar variables locales
    DECLARE subtotal DECIMAL(10,2);
    DECLARE profit DECIMAL(10,2);

    -- Actualizar estado del detalle de cotización
    UPDATE detallecotizacion 
    SET 
        detallecotizacionEstado = 0, 
        detallecotizacionfechaCreacion = NOW()
    WHERE 
        detallecotizacionId = pcotd_id;

    -- Calcular los valores de subtotal y profit
    SELECT 
        SUM(detallecotizacionTotal) AS subtotal,
        SUM(detallecotizacionProfit) AS profit
    INTO 
        subtotal, profit
    FROM 
        detallecotizacion
    WHERE 
        detallecotizacionCotizacionId = pcot_id
        AND detallecotizacionTipo = 'D'
        AND detallecotizacionEstado = 1;

    -- Actualizar la tabla de cotización con los valores calculados
    UPDATE cotizacion
    SET
        cotizacionSubTotal = subtotal,
        cotizacionProfit = profit,
        cotizacionTotal = subtotal + profit
    WHERE
        cotizacionId = pcot_id;

    -- Confirmar los cambios
    COMMIT;

    -- Devolver el ID del detalle eliminado
    SELECT pcotd_id AS 'detallecotizacionId';
END//
DELIMITER ;
