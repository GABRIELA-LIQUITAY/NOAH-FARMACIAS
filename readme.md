## PRINNS

### Problema:
En la actualidad las grandes empresas administran sus negocios con sistemas cada vez mas automatizados que les permite realizar operaciones cada vez mas rapidas y almacenar grandes cantidades de datos.
PRINNS es una Base de Datos diseñada para resolver los problemas relacionados a la gestion, registro y almacenamiento de productos, clientes, ventas, proveedores y empleados de NOAH-FARM, una cadena de farmacias ubicada en el Noroeste del pais. 


### Descripción del Problema:

1) **Gestión Sucursales y empleados**: automatizar el control administrativo de todas las sucursales de NOAH-FARM, considerando los empleados de cada una de ellas como asi tambien llevar un registro con sus clientes. 

2) Gestión de Transacciones: llevar a cabo el registro de las ventas realizadas en cada sucursal cada día, como asi tambien el registro de los medios de pago y facturación utilizadas para dicha compra. 


### Objetivo:

Implementar una base de datos relacional que satisfaga todas las necesidades que NOAH-FARM con el objeto de almacenar y gestionar información relevante sobre los productos farmacéuticos, ventas, clientes, empleados, proveedores y sucursales permite realizar operaciones de inventario, seguimiento de ventas, gestión de proveedores, y control de clientes.

## Descripción de la Base de Datos - PRINNS

Esta base de datos está diseñada para gestionar información relacionada con clientes, empleados, productos, sucursales. A continuación se detallan los elementos principales de la base de datos:

### Tablas:

1. **EMPLEADO**:
   - Almacena informacion relacionada a los empleados de cada sucursal.
   - Atributos: IDEMPLEADO, APENOM, CUIL, LEGAJORELA

2. **SUCURSAL**: 
   - Almacena informacion relacionada a cada sucursal.
   - Aributos: IDSUCURSAL, NOMBRE, CIUDAD.


3. **FACTURACIONDET**:
   - Almacena información de las facturas que cada sucursal dia a dia.
   - Atributos: ID, IDSUCURSAL, FHVENTA, TIPOCOMPROBANTE, CAJA, LEGAJO, NROCOMPROBANTE, IMPORTE.

6. **TIPO COMPROBANTE** :
   - Almacena información de tipos de comprobantes que emite cada tienda.
   - Atributos: ID, NOMBRE, ESTADO.
  . 

7. **FACTURACIONCAB**:
   - Almacena información de las facturas que emite cada tienda en el día, mes y año.
   - Atributos: IDFACTURA, DESCRIPCION, IMPORTE
  
8. **TIPO COMPROBANTE**:

almacena información de los diferentes tipos de comprobantes que puede tener una tienda.
Atributos: ID, NOMBRE.

9. **MEDIO PAGO**:

Registra el medio de pago por el cual se realizan las transacciones.
Atributos: IDMEDIODEPAGO, IDSUCURSAL, FHVENTA, TIPOCOMPROBANTE, NROCOMPROBANTE, LEGAJO, IMPORTE.

10. **EMPLEADO_SUCURSAL**:
    - Contiene información de los empleados que pertenecen a las distintas SUCURSALES
Atributos: ID, LEGAJO, IDSUCURSAL.


### Problemática Resuelta:

PRINNS permite llevar un control totalmente administrativo, empezando por empleados y clientes; ademas gestiona de manera más eficaz el control de las ventas que ingresan en el día, mes y año para cualquier tipo de RITAIL.



DIAGRAMA DE ENTIDAD-RELACION


---![image](https://github.com/user-attachments/assets/64d0e029-60fe-4c63-8729-285210e4178a)


## INSERCION DE DATOS

Los registros se realizaron mediante insert, para las siguientes tablas

 INSERT INTO SUCURSAL (ID, IDSUCURSAL, NOMBRE, CIUDAD) Values
 
---![sucursal](https://github.com/user-attachments/assets/7731b4a4-79a4-41df-ad3e-f0d99a434f34)

INSERT INTO EMPLEADO_SUCURSAL (ID,LEGAJO, IDSUCURSAL) VALUES

---![EMPLEADO_SUCURSAL](https://github.com/user-attachments/assets/9607ffa8-6352-4652-b46f-867e2316bd6b)

INSERT INTO EMPLEADO (ID, CUIL, APENOM, LEGAJOREAL) VALUES


---![empleado](https://github.com/user-attachments/assets/920fcd1e-d8d4-47f6-be3f-c4cff9e94299)

INSERT INTO TIPOCOMPROBANTE (ID, NOMBRE) VALUES

---![TIPOCOMPROBANTE](https://github.com/user-attachments/assets/2f530316-3d7a-40ac-a1b9-86481cecd279)

INSERT INTO FACTURACIONDET (IDFACTURA, DESCRIPCION, IMPORTE) VALUES

---![FACTURACIONDET](https://github.com/user-attachments/assets/2808dcae-d21c-443a-9c28-77cf22ea3f73)

INSERT INTO FACTURACIONAB(ID, IDSUCURSAL,FHVENTA,TIPOCOMPROBANTE,CAJA,LEGAJO,NROCOMPROBANTE,IMPORTE) VALUES

---![FACTURACIONAB](https://github.com/user-attachments/assets/c504111f-86fb-4b63-9b35-0a4267eeca5c)

NSERT INTO MEDIODEPAGO(IDMEDIODEPAGO, IDSUCURSAL,FHVENTA,TIPOCOMPROBANTE,CAJA,LEGAJO,NROCOMPROBANTE, IMPORTE) VALUES

--![image](https://github.com/user-attachments/assets/2ffd0c76-f624-4e5e-b601-092f7eff4798)

## VISTAS

**Vista: sucursales_por_ciudad**

Descripción: muestra las distintas ciudades que están ubicadas las sucursales de NOAHFARM 

consulta:

SELECT 
* 
FROM sucursal_por_ciudad ;

--![sucursalporciudad](https://github.com/user-attachments/assets/91b36c9a-be62-4d2a-ac24-4a1fa8206f3a)


**Vista: factura_completa**

Descripción: Unifica la información de la cabecera y el detalle de cada factura, proporcionando una visión completa de cada transacción.


consulta:

SELECT 
* 
FROM factura_completa;

--![factura completa](https://github.com/user-attachments/assets/f232482c-b4a7-4a01-b3df-c1e213fea862)


##FUNCIONES 

**Fucion Total_diario**

Descripción: fue diseñanda para calcular el total de ventas realizadas.

Parámetros

fecha_consulta (DATE): Este parámetro de entrada especifica la fecha para la cual se desea obtener el total de ventas.
Tipo de devolución:

DECIMAL(14,4): La función devuelve un valor numérico de tipo decimal. Este tipo de datos representa valores monetarios con precisión.
consulta:

SELECT total_diario ('2024-09-07');

-![total diario](https://github.com/user-attachments/assets/32234939-5950-41dc-bb85-da8e8469bb9d)



**Función cliente_compro_mes**
Descripción: determina si un cliente espesifico realiza alguna compra durante un mes o año determinado

Parámetros

legajo (INT): El legajo del cliente a consultar.
mes (INT): El número del mes a verificar (1-12).
anio (INT): El año a verificar.
Tipo de devolución

BOOLEAN: La función devuelve un valor booleano (TRUE o FALSE). VERDADERO si el cliente realizó al menos una compra en el mes y año especificado, FALSO en caso contrario.

consulta:

SELECT cliente_compro_mes(243209351, 09, 2024) AS 'EL CLIENTE COMPRO ESTE MES ';

-![clientecompra](https://github.com/user-attachments/assets/0e03726c-2268-4f3c-8228-da5c164e16eb)

##TRIGGERS

Disparadores tr_auditoria_facturacioncab
Descripción: realiza cambios en el campo 'IMPORTE' de la tabla FACTURACIONAB

Detalles:

Tabla afectada: FACTURACIONAB

Acción: MODIFICACION

Información registrada: id_factura, importación, valor_anterior. valor_nuevo

Ejemplo:

El tigger se activa despues que se realiza una modificacion en la tabla facturacionab

si se modifica el campo importar, el trigger insertará un nuevo registro en la tabla de auditoria_factutacionab con la siguiente información

id_factura: El identificador de la factura afectada.
campo_modificado: El nombre del campo que se modificó (en este caso, siempre será 'IMPORTE').
valor_anterior: El valor original del campo antes de la modificación.
valor_nuevo: El nuevo valor del campo después de la modificación.
fecha_modificacion: La fecha y hora en que se realizó la modificación.
usuario: El nombre del usuario que realizó la modificación.
Desencadenantes tr_verificar_importe_total
Descripción: tiene como objetivo garantizar que la importación total de los detalles de una factura no supere la importación total de la cabecera de la factura antes de insertar un nuevo detalle.

Tabla afectada: FACTURACIONDET
Acción: INSERCCION
Información registrada: importar
El trigger tr_verificar_importe_total Es importante para mantener la integridad de los datos en el sistema de facturación, evitando errores y asegurando que las importaciones totales de las facturas sean correctas.


Tabla afectada: FACTURACIONAB
Acción: INSERCCION
Información registrada: empleado_sucursal

##PROCEDIMIENTOS

**Procedimiento registrar_factura**
Descripción: Registre una nueva factura de forma más estructurada y segura, evitando errores de inserción de datos.

Parámetros:

p_detalles: son de tipo JSON para poder manejar los detalles de la factura de forma más flexible



**Procedimiento registrar_medio_pago**
Descripción: resgista un nuevo medio de pago asociado a una determinada venta o transacción, este proceso se encarga de validar la información proporcionada y de insertar los datos en la tabla correspondiente

Parámetros:

p_id_sucursal: Identificador único de la tienda donde se realizó la venta.
p_fecha_venta: Fecha en que se realizó la venta.
p_tipo_comprobante: Tipo de comprobante emitido (factura, ticket, etc.).
p_nro_comprobante: Número del comprobante.
p_legajo: Identificador del empleado que procesó la venta.
p_variedad: Identificador de la variedad de pago utilizado (efectivo, tarjeta, transferencia, etc.). -p_importe: Importación total de la transacción.
Si la variedad es válida, se inserta un nuevo registro en la tabla MEDIODEPAGO con los datos proporcionados en los parámetros de entrada.

**Procedimiento para registrar_sucursal**
Descripción: tiene como objetivo principal registrar una nueva sucursal en la base de datos, asegurando que el ID de cada sucursal sea único.

Parámetros:

p_id: Identificador único de la tienda (clave primaria).
p_nombre: Nombre de la sucursal.
p_ciudad: Ciudad donde se encuentra la Sucursal.
Si la tienda no existe, se inserta un nuevo registro en la tabla TIENDA con los valores de los parámetros de entrada, en caso contrario dispara un mensaje '45000' SET MESSAGE_TEXT = 'Sucursal ya existente'.


**Usuarios y Roles**
Permisos específicos:
Administrador

crear, modificar y eliminar sucursales y empleados
ejecutar cualquier procedimiento almecenado
Ver todos los datos de las tablas.
empleado:

Consultar información de sucursales y empleados.
Crear nuevos empleados.
Modificar información de los empleados que crea.
Dueño:

Consultar información de Sucursales y empleados.
Generar informes de ventas.
Ejemplo de cambio de permisos:

GRANT SELECT ON proyecto_cismo.* TO 'dueño'@'localhost';
 INSERT INTO sucursal (ID,NOMBRE,CIUDAD) VALUES
 ('B001','NOAH-FARM - San Salvador','Jujuy')

**Copia de seguridad**
Para proteger los datos una copia de seguridad DUMPPRINNS.sql

Restauración: Si se produce algún problema en la base de datos PRINNS (falla del servidor, eliminación accidental de datos, etc.), puedes restaurar el estado anterior utilizando el dump.
Migración: la base de datos de cismo se puede mover a otro servidor o cambiar su estructura sin perder datos.
Desarrollo: Los volcados son útiles para crear entornos de desarrollo o pruebas a partir de una base de datos de producción.








