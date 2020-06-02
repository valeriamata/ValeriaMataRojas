use BARLBD
--SELECTS WITH WHERE CLAUSE------------------------------------
SELECT * FROM Empleado
WHERE Nombre='Alejandro'

SELECT * FROM Cliente
WHERE Sexo='Femenino'

SELECT *  FROM Bebida
WHERE Costo=18

SELECT * FROM Platillo
WHERE Costo=89

SELECT * FROM Pedido
WHERE idEmpleado=5

--SELECTS WITH GROUP BY-------------------------------------------
SELECT COUNT(idProducto),Marca
FROM Productos
GROUP BY Marca;

SELECT COUNT(idEntrega),FechaDeEntrega
FROM Entrega
GROUP BY FechaDeEntrega;

SELECT COUNT(idDireccion),Ciudad
FROM Direccion
GROUP BY Ciudad;

SELECT COUNT(idVenta),idMPago
FROM Venta
GROUP BY idMPago;

SELECT COUNT(idEmpleado)idTurno
FROM Empleado
GROUP BY idTurno;

--SELECTS USING AGGREGATE FUNCTIONS---------------------------
SELECT AVG(Costo) AS MediaProductos FROM Productos;

SELECT MAX(Costo) AS BebidaMasCara FROM Bebida;

SELECT SUM(Costo) AS SumaCosto FROM Productos;

SELECT MAX(Costo) AS PlatilloMasCaro FROM Platillo;

SELECT MIN(Costo) AS PlatilloMasBarato FROM Platillo;

--SELECTS WITH HAVING CLAUSE-------------------------------
SELECT COUNT(idProducto),Marca
FROM Productos
GROUP BY Marca
HAVING COUNT(idProducto)<2;

SELECT COUNT(idEntrega),FechaDeEntrega
FROM Entrega
GROUP BY FechaDeEntrega
HAVING COUNT(idEntrega)<4;

SELECT COUNT(idDireccion),Ciudad
FROM Direccion
GROUP BY Ciudad
HAVING COUNT(idDireccion)>2;

SELECT COUNT(idEmpleado),idTurno
FROM Empleado
GROUP BY idTurno
HAVING COUNT(idEmpleado)>4;

SELECT COUNT(idEmpleado),idTurno
FROM Empleado
GROUP BY idTurno
HAVING COUNT(idEmpleado)<6;

--SELECTS WITH TOP CLASUE----------------------------------
SELECT TOP 3 * FROM Productos;

SELECT TOP 50 PERCENT * FROM Productos;

SELECT TOP 3 * FROM Direccion
WHERE Ciudad='Guadalupe';

SELECT TOP 3 * FROM Proveedor;

SELECT TOP 5 * FROM Cliente;
