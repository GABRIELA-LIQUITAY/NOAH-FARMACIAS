
USE noah_sistemas;

-- Función para verificar si un producto está cancelado:
DROP FUNCTION IF EXISTS producto_cancelado;
DROP FUNCTION IF EXISTS contar_pedido_cliente;
DROP FUNCTION IF EXISTS cantidad_producto_por_empresa;

DELIMITER //

CREATE FUNCTION producto_cancelado(producto_id INT) RETURNS BOOLEAN
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE cancelacion_date DATETIME;
    DECLARE is_cancelado BOOLEAN;
    
    SELECT CANCELACION INTO cancelacion_date
        FROM PEDIDO
        WHERE Idproducto = producto_id
        AND CANCELACION IS NOT NULL
        LIMIT 1;
    
    IF cancelacion_date IS NOT NULL THEN
        SET is_cancelado = TRUE;
    ELSE
        SET is_cancelado = FALSE;
    END IF;

    RETURN is_cancelado;
END //

DELIMITER ;

-- Función para contar las reservas de un cliente en un intervalo de tiempo:

DELIMITER //

CREATE FUNCTION contar_pedido_cliente(cliente_id INT, fecha_inicio DATETIME, fecha_fin DATETIME) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE pedido_count INT;
    
    SELECT COUNT(*) INTO pedido_count
    FROM PEDIDO
    WHERE IDCLIENTE = cliente_id
    AND FECHA >= fecha_inicio
    AND FECHA <= fecha_fin;
    
    RETURN pedido_count;
END //

DELIMITER ;

-- Función para obtener la cantidad de mesas por restaurante:
DELIMITER //

CREATE FUNCTION cantidad_pedido_por_empresa(empresa_id INT) RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE producto_count INT;
    
    SELECT COUNT(*) INTO producto_count
    FROM PRODUCTO
    WHERE IDMEPRESA = empresa_id;
    
    RETURN producto_count;
END //

DELIMITER ;

