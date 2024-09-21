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

INSERT INTO TIPODECOMPROBANTE (ID, NOMBRE) VALUES

---![TIPOCOMPROBANTE](https://github.com/user-attachments/assets/2f530316-3d7a-40ac-a1b9-86481cecd279)







