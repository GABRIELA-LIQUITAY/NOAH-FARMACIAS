USE noah_sistemas;

-- Vista para KPIs de Fechas de Reservas:
-- Esta vista mostrará estadísticas sobre las reservas realizadas en diferentes fechas, como el número total de reservas por día, por semana o por mes.
CREATE VIEW
    PedidoPorFecha AS
SELECT
    DATE (FECHA) AS Fecha,
    COUNT(*) AS Totalpedido
FROM
    PEDIDO
GROUP BY
    DATE (FECHA);

-- Vista para Cantidad de Reservas por Mesas:
-- Esta vista mostrará la cantidad de reservas realizadas para cada mesa, así como la capacidad total de la mesa.
CREATE VIEW
   PedidoPorProducto AS
SELECT
    PRODUCTO.IDPRODUCTO,
    PRODUCTO.CANTIDAD,
    COUNT(PEDIDO.IDPEDIDO) AS TotalPedido
FROM
    PRODUCTO
    LEFT JOIN PRODUCTO ON PRODUCTO.IDPRODUCTO =PEDIDO.IDPRODUCTO
GROUP BY
    PRODUCTO.IDPRODUCTO,
    PRODUCTO.CANTIDAD;

-- Vista para Cantidad de Cancelaciones por Tipo de Reservas:
-- Esta vista mostrará la cantidad de cancelaciones para cada tipo de reserva.
CREATE VIEW
    CancelacionesPorTipoPedido AS
SELECT
    TIPOPEDIDO.TIPO,
    COUNT(PEDIDO.IDPEDIDO) AS TotalCancelaciones
FROM
    TIPOPEDIDO
    LEFT JOIN PEDIDO ON TIPOPEDIDO.IDTIPOPEDIDO = PEDIDO.IDTIPOPEDIDO
WHERE
    PEDIDO.CANCELACION IS NOT NULL
GROUP BY
    TIPOPEDIDO.TIPO;
