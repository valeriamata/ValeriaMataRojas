USE BARLBD
--VIEWS----------------------------------------------------------------

CREATE VIEW EmpleadoDireccion
AS SELECT
E.Nombre,
E.aPaterno,
D.Ciudad
FROM Direccion AS D
INNER JOIN Empleado AS E
ON E.idDireccion=D.idDireccion

select * from EmpleadoDireccion

-----------------------------------------------------------------------

CREATE VIEW EmpleadoTurno
AS SELECT 
E.Nombre,
E.aPaterno,
T.Turno
FROM Turno AS T
INNER JOIN Empleado AS E
ON E.idTurno=T.idTurno

select * from EmpleadoTurno

-----------------------------------------------------------------------

CREATE VIEW ProveedorProducto
AS SELECT 
PV.NomProveedor,
P.NomProducto
FROM Productos AS P
INNER JOIN Proveedor AS PV
ON PV.idProducto=P.idProducto

select * from ProveedorProducto

------------------------------------------------------------------------

CREATE VIEW EntregaProveedor
AS SELECT
E.FechaDeEntrega,
E.APagar,
P.NomProveedor
FROM Proveedor AS P
INNER JOIN Entrega AS E
ON E.idProveedor=P.idProveedor

select * from EntregaProveedor

------------------------------------------------------------------------

CREATE VIEW ProductosBebidas
AS SELECT
B.NomBebida,
P.NomProducto
FROM Productos AS P
INNER JOIN Bebida AS B
ON B.idProducto=P.idProducto

select * from ProductosBebidas

------------------------------------------------------------------------