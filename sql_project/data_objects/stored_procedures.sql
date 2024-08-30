USE noah_sistemas;

DROP PROCEDURE IF EXISTS actualizar_pedido_cancelado_por_email;
DROP PROCEDURE IF EXISTS actualizar_tipo_pedido_por_email;
DROP PROCEDURE IF EXISTS crear_empleado;

DELIMITER //

CREATE PROCEDURE actualizar_pedido_cancelado_por_email(
    IN p_email VARCHAR(100)
)
BEGIN
    DECLARE cliente_id INT;
    
    -- Obtener el ID del cliente usando el correo electrónico proporcionado
    SELECT IDCLIENTE INTO cliente_id
        FROM CLIENTE
    WHERE CORREO = p_email;
    
    -- Actualizar la reserva si el cliente existe y tenía una reserva cancelada
    IF cliente_id IS NOT NULL THEN
        UPDATE PEDIDO
        SET CANCELACION = NULL,
            FECHA = NOW()
        WHERE IDCLIENTE = cliente_id
        AND CANCELACION IS NOT NULL;
        
        SELECT 'El Pedido fue cancelado por el cliente con correo electrónico ', p_email, ' ha sido actualizada exitosamente.';
    ELSE
        SELECT 'No se encontró ningún cliente con el correo electrónico ', p_email, '.';
    END IF;
    
END //

DELIMITER ;



DELIMITER //

CREATE PROCEDURE actualizar_tipo_pedido_por_email(
    IN p_email VARCHAR(100),
    IN p_nuevo_tipo VARCHAR(50)
)
BEGIN
    DECLARE cliente_id INT;
    DECLARE pedido_id INT;
    
    -- Obtener el ID del cliente usando el correo electrónico proporcionado
    SELECT IDCLIENTE INTO cliente_id
    FROM CLIENTE
    WHERE CORREO = p_email;
    
    -- Si se encontró el cliente, obtener la última reserva hecha
    IF cliente_id IS NOT NULL THEN
        SELECT IDPEDIDO INTO pedido_id
        FROM PEDIDO
        WHERE IDCLIENTE = cliente_id
        ORDER BY FECHA DESC
        LIMIT 1;
        
        -- Si se encontró la reserva, actualizar el tipo de reserva
        IF reserva_id IS NOT NULL THEN
            UPDATE PEDIDO
            SET IDTIPOPEDIDO = (
                SELECT IDTIPOPEDIDO FROM TIPOPEDIDO WHERE TIPO = p_nuevo_tipo
            ) , FECHA = NOW()
            WHERE IDPEDIDO = pedido_id;
            
            SELECT 'Se actualizó el tipo de pedido del cliente con correo electrónico ', p_email, ' a ', p_nuevo_tipo, '.';
        ELSE
            SELECT 'El cliente con correo electrónico ', p_email, ' no tiene pedidos.';
        END IF;
    ELSE
        SELECT 'No se encontró ningún cliente con el correo electrónico ', p_email, '.';
    END IF;
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE crear_empleado(
    IN p_nombre VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_correo VARCHAR(100),
    IN p_id_empresa INT
)
BEGIN
    DECLARE empresa_count INT;
    
    -- Verificar si el restaurante existe
    SELECT COUNT(*) INTO empresa_count
    FROM EMPRESA
    WHERE IDEMPRESA = p_id_empresa;
    
    -- Si el restaurante existe, insertar el empleado
    IF empresa_count > 0 THEN
        INSERT INTO EMPLEADO (NOMBRE, TELEFONO, CORREO, IDEMPRESA)
        VALUES (p_nombre, p_telefono, p_correo, p_id_empresa);
        
        SELECT 'Empleado creado exitosamente.';
    ELSE
        SELECT 'La empresa especificada no existe. No se puede crear el empleado.';
    END IF;
END //

DELIMITER ;
