## CREACION BASE DE UNA APP PARA EL SISTEMA DE REGISTRO DE PEDIDOS EN NOAH

### Problema:

Nuestro equipo de desarrollo está trabajando en un sistema para el registro de pedidos solicitados por clientes a NOAH, un microemprendimiento dedicado a la sublimacion de productos, por ello es necesario diseñar una base de datos eficiente que pueda llevar un registro de pedidos realizados por clientes para mejorar el servicio hacia los mismos.

### Descripción del Problema:

1. **Gestión de Clientes y Empleados**: Necesitamos una base de datos que nos permita registrar la información de los clientes que realizan pedidos, así como de los empleados que registran el mismmo, los encargados de atención al cliente.

2. **Gestión de Tipos de Pedidos**: Es importante poder clasificar los pedidos según su tipo, ya sea una pedido por unidad, uno por mayor. Esto nos ayudará a organizar mejor el flujo de trabajo y adaptar nuestros servicios según las necesidades del cliente.

3. **Gestión de Productos y Disponibilidad**: La base de datos debe permitirnos registrar la disponibilidad de productos en Noah, así como gestionar su capacidad y estado (en stock o sin stock). Esto es fundamental para garantizar una asignación eficiente de productos y evitar conflictos en los pedidos.

4. **Registro de Pedidos**: Necesitamos un sistema que pueda registrar de manera detallada cada pedido realizado, incluyendo la fecha y hora del mismo, el cliente que la realizó, los productos solicitados, el empleado que atendió este y el tipo de pedido.

### Objetivo:

Diseñar e implementar una base de datos relacional que satisfaga todas las necesidades de gestión de pedidos para nuestro sistema de REGISTRO PARA PEDIDOS EN NOAH. Esta base de datos deberá ser eficiente, escalable y fácil de mantener, permitiendo una gestión ágil y precisa de todas las operaciones relacionadas con las reservas.


## Descripción de la Base de Datos - SISTEMA DE REGISTRO DE PEDIDOS EN NOAH

Esta base de datos está diseñada para gestionar pedidos en Noah así como la información relacionada con clientes, empleados, tipos de pedido. A continuación se detallan los elementos principales de la base de datos:

### Tablas:

1. **CLIENTE**:
   - Almacena información sobre los clientes que realizan reservas.
   - Atributos: IDCLIENTE, NOMBRE, TELEFONO, CORREO.

2. **EMPLEADO**:
   - Contiene información sobre los empleados involucrados en el proceso de reservas.
   - Atributos: IDEMPLEADO, NOMBRE, TELEFONO, CORREO, IDRESTAURANTE.

3. **DUEÑO**:
   - Guarda datos sobre los dueños de los restaurantes (no se utiliza explícitamente en el proceso de reservas).

4. **TIPOPEDIDO**:
   - Define diferentes tipos de reserva para clasificarlas según su propósito o requisitos específicos.
   - Atributos: IDTIPOPEDIDO, TIPO.

5. **EMPRESA**:
   - Almacena información sobre los restaurantes disponibles.
   - Atributos: IDEMPRESA, NOMBRE, DIRECCION, TELEFONO.

6. **PRODUCTO**:
   - Contiene información sobre las mesas disponibles en cada restaurante.
   - Atributos: IDPRODUCTO, IDREMPRESA, CAPACIDAD, DISPONIBLE.

7. **PEDIDO**:
   - Registra las reservas realizadas por los clientes.
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

SEGUNDA PARTE DE LA ENTREGA
Segunda PreIngreso de SQL
Listado de Vistas más una descripción detallada, su objetivo, y qué tablas las componen.
Listado de funciones que incluyen una descripción detallada, el objetivo para la cual fueron creados y qué datos o tablas manipulan y/o son implementadas.
Listado de Procedimientos Almacenados con una descripción detallada, qué objetivo o beneficio aportan al proyecto, y las tablas que lo componen y/o tablas con las que interactúan
Listado de activadores


