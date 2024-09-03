## PRINNS

### Problema:
En la actualidad las grandes empresas administran sus negocios con sistemas cada vez mas automatizados que les permite realizar operaciones cada vez mas rapidas y almacenar grandes cantidades de datos.
PRINNS es una Base de Datos diseñada para resolver los problemas relacionados a la gestion, registro y almacenamiento de productos, clientes, ventas, proveedores y empleados de NOAH-FARM, una cadena de farmacias ubicada en el Noroeste del pais. 


### Descripción del Problema:

1) **Gestión Sucursales y empleados**: automatizar el control administrativo de todas las sucursales de NOAH-FARM, considerando los empleados de cada una de ellas como asi tambien llevar un registro con sus clientes. 

2) Gestión de Transacciones: llevar a cabo el registro de las ventas realizadas en cada sucursal cada día, como asi tambien el registro de los medios de pago y facturación utilizadas para dicha compra. 


### Objetivo:

Implementar una base de datos relacional que satisfaga todas las necesidades que NOAH-FARM con el objeto de almacenar y gestionar información relevante sobre los productos farmacéuticos, ventas, clientes, empleados, proveedores y sucursales permite realizar operaciones de inventario, seguimiento de ventas, gestión de proveedores, y control de clientes.

## Descripción de la Base de Datos - SISTEMA DE REGISTRO DE PEDIDOS EN NOAH

Esta base de datos está diseñada para gestionar pedidos en Noah así como la información relacionada con clientes, empleados, tipos de pedido. A continuación se detallan los elementos principales de la base de datos:

### Tablas:

1. **CLIENTE**:
   - Almacena información sobre los clientes que realizan pedidos.
   - Atributos: IDCLIENTE, NOMBRE, TELEFONO, CORREO.

2. **EMPLEADO**:
   - Contiene información sobre los empleados involucrados en el proceso de pedidos.
   - Atributos: IDEMPLEADO, NOMBRE, TELEFONO, CORREO, IDRESTAURANTE.

3. **DUEÑO**:
   - Guarda datos sobre los dueños de Noah (no se utiliza explícitamente en el proceso de pedidos).

4. **TIPOPEDIDO**:
   - Define diferentes tipos de pedidos para clasificarlas según su propósito o requisitos específicos.
   - Atributos: IDTIPOPEDIDO, TIPO.

5. **EMPRESA**:
   - Almacena información sobre Noah disponibles.
   - Atributos: IDEMPRESA, NOMBRE, DIRECCION, TELEFONO.

6. **PRODUCTO**:
   - Contiene información sobre los productos disponibles en Noah.
   - Atributos: IDPRODUCTO, IDREMPRESA, CAPACIDAD, DISPONIBLE.

7. **PEDIDO**:
   - Registra los pedidos realizados por los clientes.
   - Atributos: IDPEDIDO, IDCLIENTE, IDPRODUCTO, IDEMPLEADO, IDTIPOPEDIDO, FECHA.

### Problemática Resuelta:

Esta base de datos permite gestionar eficientemente el proceso de reserva en restaurantes, desde la información de los clientes y empleados hasta la disponibilidad de mesas y el registro de reservas. Algunos aspectos que aborda incluyen:

- Registro de clientes y empleados involucrados en el proceso de pedidos.
- Clasificación de los pedidos según su tipo.
- Gestión de la disponibilidad de los productos.
- Registro detallado de pedidos realizados, incluyendo la fecha, cliente, producto, empleado y tipo de pedido.

En resumen, esta base de datos proporciona una estructura para organizar y gestionar eficientemente las operaciones de pedidos en Noah, lo que contribuye a mejorar el servicio ofrecido a los clientes y optimizar las operaciones de Noah.
*/



DIAGRAMA DE ENTIDAD-RELACION

![image](https://github.com/GABRIELA-LIQUITAY/NOAH_SISTEMAS-LIQUITAY-NADIA/assets/173738215/25734995-5f56-430a-85ed-352b0a99e3a0)



# SEGUNDA PARTE DE LA ENTREGA
## Segunda PreEntrga de SQL
* Listado de Vistas más una descripción detallada, su objetivo, y qué tablas las componen.
* Listado de Funciones que incluyan una descripción detallada, el objetivo para la cual fueron creadas y qué datos o tablas manipulan y/o son implementadas.
* Listado de Stored Procedures con una descripción detallada, qué objetivo o beneficio aportan al proyecto, y las tablas que lo componen y/o tablas con las que interactúa
* Listado de Triggers

---
### Formato de Entrega 
*   _Repositorio en GitHub o Google Drive Link_

*   Un archivo .sql que contenga:
    - Script de inserción de datos en las bases.
    - Si se insertan datos mediante importación, agregar el paso a paso de éste en el DOC PDF más los archivos con el contenido a importar, en el formato que corresponda.
    - Script de creación de Vistas, Funciones, Stored Procedures y Triggers.

    - Documento PDF con el nombre “Entrega2 + Apellido” ->> Recomendacion para presentaciones futuras : usar [Canva](https://www.canva.com/) o  [Visme](https://www.visme.co/)
        - _Alternativa muy rara ->> [Dektopus](https://www.decktopus.com/)_


### Documentacion de Vistas
### Vista: PedidoPorFecha

**Descripción:** Esta vista muestra estadísticas sobre pedidos realizados en diferentes fechas, como el número total de pedidos por día, por semana o por mes.

**Columnas:**

* **Fecha:** Fecha del pedido (formato YYYY-MM-DD)
* **TotalPedido:** Número total de pedido realizadas en la fecha indicada

**Ejemplo de consulta:**

```sql
SELECT * FROMPedidoPorFecha
WHERE Fecha BETWEEN '2010-12-01' AND '2023-12-31'
ORDER BY Fecha ASC;
```

### Vista: PedidoPorProducto

**Descripción:** Esta vista muestra la cantidad de pedidos realizados por producto, así como la capacidad total del producto.

**Columnas:**

* **IDProducto:** Identificador único del producto
* **Cantidad:** Número productos
* **TotalPedido:** Número total de pedidos realizadas para ese producto

**Ejemplo de consulta:**

```sql
SELECT * FROM PedidoPorProducto
ORDER BY TotalReservas DESC;
```

### Vista: CancelacionesPorTipoPedido

**Descripción:** Esta vista muestra la cantidad de cancelaciones para cada tipo de pedido.

**Columnas:**

* **Tipo:** Tipo de pedido  (ej. "Normal", "Grupal", etc.)
* **TotalCancelaciones:** Número total de cancelaciones para el tipo de pedido

**Ejemplo de consulta:**

```sql
SELECT * FROM CancelacionesPorTipoPedido
ORDER BY TotalCancelaciones DESC;
```

## Documentación de Funciones 

### Función: producto_cancelada

**Descripción:** Esta función verifica si u producto está cancelada para un pedido.

**Parámetros:**

* **mesa_id:** Identificador único de la mesa

**Retorno:**

* **TRUE** si producto está cancelado para alguna pedido, **FALSE** en caso contrario

**Ejemplo de uso:**

```sql
SELECT producto_cancelado(10);
```

**Nota:** La función solo verifica si el producto está cancelado en algun pedido. No indica si producto está disponible para una nueva pedido en este momento.

### Función: contar_reservas_cliente

**Descripción:** Esta función cuenta la cantidad de pedidos realizados por un cliente en un intervalo de tiempo.

**Parámetros:**

* **cliente_id:** Identificador único del cliente
* **fecha_inicio:** Fecha de inicio del intervalo (formato YYYY-MM-DD)
* **fecha_fin:** Fecha de fin del intervalo (formato YYYY-MM-DD)

**Retorno:**

* Número total de pedidos realizadas por el cliente en el intervalo de tiempo especificado

**Ejemplo de uso:**

```sql
SELECT contar_pedido_cliente(5, '2023-12-01', '2023-12-31');
```

**Nota:** La función no toma en cuenta las cancelaciones de pedidos.

### Función: cantidad_productos_por_empresa

**Descripción:** Esta función devuelve la cantidad de productos que tiene una empresa.

**Parámetros:**

* **empresa_id:** Identificador único del empresa

**Retorno:**

* Número total de productos en la empresa

**Ejemplo de uso:**

```sql
SELECT cantidad_productos_por_empresa(2);
```

## Documentación de Triggers 

### Trigger: after_insert_trigger

**Descripción:** Este trigger registra la inserción de un nuevo cliente en la tabla LOG_CAMBIOS.

**Detalles:**

* **Tabla afectada:** CLIENTE
* **Acción:** INSERT
* **Información registrada:** Fecha, ID del cliente, Usuario

**Ejemplo:**

* Se inserta un nuevo cliente.
* El trigger registra la acción en la tabla LOG_CAMBIOS con los detalles correspondientes.

### Trigger: after_update_cancelacion_trigger

**Descripción:** Este trigger registra la cancelación pedido en la tabla LOG_CAMBIOS.

**Detalles:**

* **Tabla afectada:** PEDIDO
* **Acción:** CANCELACION
* **Información registrada:** Fecha, ID del cliente (si se conoce), Usuario

**Ejemplo:**

* Se actualiza un pedido para indicar su cancelación.
* Si la cancelación no estaba presente antes, el trigger registra la acción en la tabla LOG_CAMBIOS.

### Trigger: before_insert_cliente_trigger

**Descripción:** Este trigger verifica si el correo electrónico de un nuevo cliente ya está en uso.

**Detalles:**

* **Tabla afectada:** CLIENTE
* **Acción:** INSERT
* **Validación:** Correo electrónico único

**Ejemplo:**

* Se intenta insertar un nuevo cliente con un correo electrónico ya registrado.
* El trigger genera un error y la inserción no se realiza.

### Trigger: before_insert_pedido_trigger

**Descripción:** Este trigger verifica si un cliente ya tiene un pedido en la misma hora y mesa.

**Detalles:**

* **Tabla afectada:** PEDIDO
* **Acción:** INSERT
* **Validación:** No se permiten pedidos dublicados en la misma hora y mesa para un mismo cliente.

**Ejemplo:**

* Se intenta realizar un pedido de un producto para un cliente que ya tiene un mismo pedido en la fecha.
* El trigger genera un error y el pedido no se realiza.


## Documentación de Procedimientos Almacenados

### Procedimiento: actualizar_pedido_cancelada_por_email

**Descripción:** Este procedimiento actualiza pedido cancelado para un cliente a partir de su correo electrónico.

**Parámetros:**

* **p_email:** Correo electrónico del cliente

**Retorno:**

* Mensaje de éxito o error

**Ejemplo de uso:**

```sql
CALL actualizar_pedido_cancelado_por_email('ejemplo@correo.com');
```

### Procedimiento: actualizar_tipo_pedido_por_email

**Descripción:** Este procedimiento actualiza el último pedido realizado por un cliente a partir de su correo electrónico.

**Parámetros:**

* **p_email:** Correo electrónico del cliente
* **p_nuevo_tipo:** Nuevo tipo de pedido

**Retorno:**

* Mensaje de éxito o error

**Ejemplo de uso:**

```sql
CALL actualizar_tipo_pedido_por_email('ejemplo@correo.com', 'Pedido por mayor');
```

### Procedimiento: crear_empleado

**Descripción:** Este procedimiento crea un nuevo empleado en la base de datos.

**Parámetros:**

* **p_nombre:** Nombre del empleado
* **p_telefono:** Teléfono del empleado
* **p_correo:** Correo electrónico del empleado
* **p_id_empresa:** Identificador del restaurante al que pertenece el empleado

**Retorno:**

* Mensaje de éxito o error

**Ejemplo de uso:**

```sql
CALL crear_empleado('Pedro_juarez', '123456789', 'Pedro_juarez@ejemplo.com', 1);



