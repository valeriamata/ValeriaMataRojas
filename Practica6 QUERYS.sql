create database BARLBD
use BARLBD

create table Establecimiento(
idEstablecimiento int not null,
Telefono int not null,
Email varchar(30),
constraint pk_estab primary key (idEstablecimiento)
)

create table Mesa(
idMesa int not null,
constraint pk_mesa primary key (idMesa)
)

create table Empleado(
idEmpleado int not null,
Nombre varchar(30),
aPaterno varchar(30),
aMaterno varchar(30),
Sexo varchar(30),
FechaN date,
Telefono int not null,
Email varchar(30),
constraint pk_emplead primary key (idEmpleado)
)

create table Departamento(
idDepartamento int not null,
Puesto varchar(30),
NombreD varchar(30),
Sueldo int not null,
constraint pk_dep primary key (idDepartamento)
)

create table Direccion(
idDireccion int not null,
Calle varchar(30),
NumeroCasa int not null,
Colonia varchar(30),
Ciudad varchar(30),
Estado varchar(30),
constraint pk_direc primary key (idDireccion)
)

create table Cliente(
idCliente int not null,
Nombre varchar(30),
aPaterno varchar(30),
aMaterno varchar(30),
Sexo varchar(30),
FechaN date,
Telefono int not null,
Email varchar(30),
constraint pk_cliente primary key (idCliente)
)

create table Platillo(
idPlatillo int not null,
NomPlatillo varchar(30),
Costo int not null,
constraint pk_plato primary key (idPlatillo)
)

create table Bebida(
idBebida int not null,
NomBebida varchar(30),
Costo int not null,
constraint pk_bebida primary key (idBebida)
)

create table Turno(
idTurno int not null,
Turno varchar(30),
constraint pk_turno primary key (idTurno)
)

create table Entrega(
idEntrega int not null,
FechaDeEntrega date,
idMPago int not null,
APagar int not null,
constraint pk_entrega primary key (idEntrega)
)

create table Productos(
idProducto int not null,
NomProducto varchar(30),
Marca varchar(30),
Costo int not null,
Cantidad int not null,
FechaVencimiento date,
constraint pk_prod primary key (idProducto)
)

create table Pedido(
idPedido int not null,
Fecha date,
constraint pk_pedido primary key (idPedido)
)

create table Venta(
idVenta int not null,
Total int not null,
Cambio int not null,
constraint pk_venta primary key (idVenta)
)

create table MetodoDePago(
idMPago int not null,
MetodoDePago varchar(30),
constraint pk_mdpag primary key (idMPago)
)

create table DetalleFactura(
idDFactura int not null,
NumFactura int not null,
Concepto varchar(30)
constraint pk_dfact primary key (idDFactura)
)

create table Factura(
idFactura int not null,
constraint pk_fact primary key (idFactura)
)

create table Proveedor(
idProveedor int not null,
NomProveedor varchar(30),
constraint pk_prov primary key (idProveedor)
)

alter table Establecimiento
add idEmpleado int,
idDireccion int,
constraint fk_emplead foreign key (idEmpleado) references Empleado (IdEmpleado),
constraint fk_direc foreign key (idDireccion) references Direccion (IdDireccion)
select * from Establecimiento

alter table Mesa
add idPedido int,
idEmpleado int,
constraint fk_pedido foreign key (idPedido) references Pedido (IdPedido),
constraint fk_emplead1 foreign key (idEmpleado) references Empleado (IdEmpleado)
select * from Mesa

alter table Empleado
add idDepartamento int,
idTurno int,
idDireccion int,
constraint fk_dep foreign key (idDepartamento) references Departamento (IdDepartamento),
constraint fk_turno foreign key (idTurno) references Turno (IdTurno),
constraint fk_direc1 foreign key (idDireccion) references Direccion (IdDireccion)
select * from Empleado

alter table Platillo
add idProducto int,
constraint fk_prod foreign key (idProducto) references Productos (IdProducto)
select * from Platillo

alter table Bebida
add idProducto int,
constraint fk_prod1 foreign key (idProducto) references Productos (IdProducto)
select * from Bebida

alter table Entrega
add idProveedor int,
idMPagoE int,
constraint fk_prov foreign key (idProveedor) references Proveedor (IdProveedor),
constraint fk_idmpag foreign key (idMPagoE) references MetodoDePago (IdMPago)
select * from Entrega

alter table Pedido
add idEstablecimiento int,
idCliente int,
idEmpleado int,
idPlatillo int,
idBebida int,
constraint fk_estab foreign key (idEstablecimiento) references Establecimiento (IdEstablecimiento),
constraint fk_cliente foreign key (idCliente) references Cliente (IdCliente),
constraint fk_emplead2 foreign key (idEmpleado) references Empleado (IdEmpleado),
constraint fk_plato foreign key (idPlatillo) references Platillo (IdPlatillo),
constraint fk_bebida foreign key (idBebida) references Bebida (IdBebida)
select * from Pedido

alter table Venta
add idPedido int,
idMPago int,
constraint fk_pedido1 foreign key (idPedido) references Pedido (IdPedido),
constraint fk_idmpag1 foreign key (idMPago) references MetodoDePago (IdMPago)
select * from Venta

alter table DetalleFactura
add idVenta int,
constraint fk_venta foreign key (idVenta) references Venta (IdVenta)
select * from DetalleFactura

alter table Factura
add idDFactura int,
constraint fk_dfact foreign key (idDFactura) references DetalleFactura (IdDFactura)
select * from Factura

alter table Proveedor
add idProducto int
constraint fk_product foreign key (idProducto) references Productos (IdProducto)
select * from Proveedor

alter table Entrega
drop column idMPago

--INSERT STATEMENTS----------------------------------------------------------------------------------------------------------------
use BARLBD

select * from Establecimiento
INSERT INTO Establecimiento values
(1,89998208,'bar1@gmail.com',1,1),
(2,83099829,'bar2@gmail.com',2,2),
(3,82918133,'bar3@gmail.com',3,3),
(4,82347451,'bar4@gmail.com',4,4),
(5,82025405,'bar5@gmail.com',5,5),
(6,87249503,'bar6@gmail.com',6,6),
(7,88858612,'bar7@gmail.com',7,7),
(8,86475003,'bar8@gmail.com',8,8),
(9,83924613,'bar9@gmail.com',9,9),
(10,86591864,'bar10@gmail.com',10,10);

select * from Cliente
INSERT INTO Cliente values
(1,'Eduardo','Torres','Vega','Masculino','1998-05-01',81208898,'edtorres@gmail.com'),
(2,'Gabriela','Salinas','Diaz','Femenino','1997-09-24',87291450,'gabi.diaz@outlook.com'),
(3,'Abraham','Salazar','Gutierrez','Masculino','1995-12-30',88444994,'a.salazar@gmail.com'),
(4,'Stephanie','Sanchez','Davalos','Femenino','1999-11-20',88783764,'fannysanchez@outlook.com'),
(5,'Adrian','Hernandez','Alejos','Masculino','2000-11-20',85604795,'hdez.alejos@gmail.com'),
(6,'Andrea','Medina','Marquez','Femenino','2000-11-22',81179958,'andrea.mm@outlook.com'),
(7,'Jared','Castellanos','Jimenez','Masculino','1996-05-18',89491371,'jaredcj@hotmail.com'),
(8,'Tais','Rodriguez','Castillo','Femenino','1999-06-28',87924718,'tais.rdz@gmail.com'),
(9,'Francisco','Ruiz','Leija','Masculino','1999-12-15',82381609,'fruiz.l@hotmail.com'),
(10,'Janeth','Arias','Muñiz','Femenino','1995-02-28',82279693,'janeth_a@hotmail.com');

select * from Direccion
INSERT INTO Direccion values
(1,'Los Angeles',1900,'Anahuac','Monterrey','Nuevo Leon'),
(2,'Cumbres del Sur',214,'Cumbres de San Agustin','Monterrey','Nuevo Leon'),
(3,'Lacandon',118,'Azteca','Guadalupe','Nuevo Leon'),
(4,'Hacienda Santa Maria',100,'Hacienda El Palmar','Santa Catarina','Nuevo Leon'),
(5,'Santo Domingo',454,'Nicolas Bravo','San Nicolas de los Garza','Nuevo Leon'),
(6,'Constitucion',321,'Estanzuela Nueva','Monterrey','Nuevo leon'),
(7,'Cedro',662,'Olinala','San Pedro Garza Garcia','Nuevo Leon'),
(8,'Calle Decima',671,'Tolteca','Guadalupe','Nuevo Leon'),
(9,'Valle Grande',821,'Valles de las Brisas','Guadalupe','Nuevo Leon'),
(10,'Olmeca',963,'Zirandaro','Juarez','Nuevo Leon');

select * from Platillo
INSERT INTO Platillo values
(1,'Pizza Boneless',89,1),
(2,'Nachos Especiales',69,2),
(3,'Papas a la Francesa',69,3),
(4,'Alitas',89,4),
(5,'Boneless',89,5),
(6,'Aros de cebolla',59,6),
(7,'Orden de guacamole',59,7),
(8,'Carne Seca',79,8),
(9,'Aceitunas Preparadas',59,9),
(10,'Hamburguesa',79,10);

select * from Bebida
INSERT INTO Bebida values
(1,'Shot Tequila',15,11),
(2,'Shot Vodka',15,12),
(3,'Tarro Michelada',69,13),
(4,'Tarro Clamato',69,14),
(5,'Mojito',59,15),
(6,'Gin Tonic',59,16),
(7,'Vampirito',59,17),
(8,'Dos Equis Lager',18,18),
(9,'Dos Equis Ambar',18,19),
(10,'Indio',15,20),
(11,'Tecate Original',15,21),
(12,'Tecate Ligth',15,22),
(13,'Amstel Beer',19,23),
(14,'Heineken',18,24),
(15,'Sol',18,25);

select * from Departamento
INSERT INTO Departamento values
(1,'Gerente General','Gerencia',8000),
(2,'Gerente General','Gerencia',8000),
(3,'Cocinero','Cocina',6000),
(4,'Cocinero','Cocina',6000),
(5,'Mesero','Cocina',4400),
(6,'Mesero','Cocina',4400),
(7,'Mesero','Cocina',4400),
(8,'Mesero','Cocina',4400),
(9,'Barman','Barra',6800),
(10,'Cajero','Caja',4800);

select * from Empleado
INSERT INTO Empleado values
(1,'Cristian','Lopez','Robledo','Masculino','1996-09-24',82178136,'cristianlopez@hotmail.com',1,1,1),
(2,'Georgina','Ramirez','Tello','Femenino','1997-08-19',83259502,'rmztello@gmail.com',2,2,2),
(3,'Gerardo','Avila','Sauceda','Masculino','1999-05-15',87334245,'gera.avila@outlook.com',3,1,3),
(4,'Alejandro','Moreno','Livas','Masculino','1998-07-26',83368603,'morenoalejandro@gmail.com',4,2,4),
(5,'Samuel','Padilla','Vite','Masculino','1996-01-08',85116083,'samuelv@hotmail.com',5,1,5),
(6,'Mayra','De la Torre','Salinas','Femenno','1995-03-16',88918256,'mayradt@gmail.com',6,2,6),
(7,'Alexander','Cavazos','Moreno','Masculino','1998-04-23',86644125,'alexcvzs@outlook.com',7,1,7),
(8,'Emiliano','Rojas','Hernandez','Masculino','1994-06-11',88380785,'emilianorjs@outlook.com',8,2,8),
(9,'Brandon','Mata','Lara','Masculino','1999-08-28',86873948,'brandonlara@gmail.com',9,1,9),
(10,'Gael','Martinez','Govea','Masculino','2000-02-12',82275037,'irwinmtz@gmail.com',10,1,10);

select * from MetodoDePago
INSERT INTO MetodoDePago values
(1,'Efectivo'),
(2,'Tarjeta de Debito'),
(3,'Tarjeta de Credito');

select * from DetalleFactura
INSERT INTO DetalleFactura values
(1,0001,'Servicio Consumo de Alimentos',1),
(2,0002,'Servicio Consumo de Alimentos',2),
(3,0003,'Servicio Consumo de Alimentos',3),
(4,0004,'Servicio Consumo de Alimentos',4),
(5,0005,'Servicio Consumo de Alimentos',5),
(6,0006,'Servicio Consumo de Alimentos',6),
(7,0007,'Servicio Consumo de Alimentos',7),
(8,0008,'Servicio Consumo de Alimentos',8),
(9,0009,'Servicio Consumo de Alimentos',9),
(10,0010,'Servicio Consumo de Alimentos',10);

select * from Turno
INSERT INTO Turno values
(1,'Tarde'),
(2,'Nocturno');

select * from Productos
INSERT INTO Productos values
(1,'Harina de Trigo 20 kg','Espuma de Chapala',489,1,'2021-03-03'),
(2,'Queso Cheddar 3kg','Ricos',290,2,'2021-01-02'),
(3,'Papas para freir 1kg','McCain',89,8,'2020-12-01'),
(4,'Alitas sazonadas 1kg','Bachoco',99,10,'2020-07-01'),
(5,'Boneless naturales 1kg','Tyson',89,12,'2020-07-01'),
(6,'Aros cebolla para freir 1kg','McCain',120,5,'2020-07-01'),
(7,'Chiles jalapeños 3kg','Maxima',60,1,'2020-12-05'),
(8,'Carne Seca 1kg','Machaca',600,3,'2020-09-09'),
(9,'Aceitunas 1.7kg','Viander',210,2,'2021-02-08'),
(10,'Carne hamburguesa 1kg','Grillers',89,8,'2020-07-23'),
(11,'Tequila 990ml','Jose Cuervo',195,5,'2050-01-01'),
(12,'Vodka 750ml','Absolut',196,5,'2050-01-01'),
(13,'Salsa Inglesa 1.9l','Maggie',420,1,'2021-02-22'),
(14,'Jugo de tomate 1.9l','Clamato',69,5,'2021-05-02'),
(15,'Ron 990ml','Bacardi',179,4,'2050-01-01'),
(16,'Ginebra','Henry Oliver',407,2,'2050-01-01'),
(17,'Sangrita','Viuda de Sanchez',68,3,'2050-01-01'),
(18,'Cerveza','Dos Equis Lager',16,192,'2050-01-01'),
(19,'Cerveza','Dos Equis Ambar',16,108,'2050-01-01'),
(20,'Cerveza','Indio',12,144,'2050-01-01'),
(21,'Cerveza','Tecate Original',12,132,'2050-01-01'),
(22,'Cerveza','Tecate Ligth',12,216,'2050-01-01'),
(23,'Cerveza','Amstel Beer',16,168,'2050-01-01'),
(24,'Cerveza','Heineken',16,120,'2050-01-01'),
(25,'Cerveza','Sol',16,132,'2050-01-01');

select * from Entrega
INSERT INTO Entrega values
(1,'2020-06-01',990,1,1),
(2,'2020-06-01',1068,2,2),
(3,'2020-06-02',712,3,2),
(4,'2020-06-02',580,4,1),
(5,'2020-06-03',801,5,2),
(6,'2020-06-03',312,6,1),
(7,'2020-06-04',1800,7,2),
(8,'2020-06-04',1140,8,2),
(9,'2020-06-04',420,9,1),
(10,'2020-06-04',60,10,1);

select * from Factura
INSERT INTO Factura values
(0001,1),
(0002,2),
(0003,3),
(0004,4),
(0005,5),
(0006,6),
(0007,7),
(0008,8),
(0009,9),
(0010,10);

select * from Mesa
INSERT INTO Mesa values
(1,5,1),
(2,6,2),
(3,7,3),
(4,8,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,5,9),
(10,6,10);

select * from Pedido
INSERT INTO Pedido values
(001,'2020-05-31',1,1,5,1,1),
(002,'2020-05-31',1,2,6,2,5),
(003,'2020-05-31',1,3,7,3,4),
(004,'2020-05-31',1,4,8,4,3),
(005,'2020-05-31',1,5,5,6,7),
(006,'2020-05-31',1,6,6,8,6),
(007,'2020-05-31',1,7,7,9,2),
(008,'2020-05-31',1,8,8,10,8),
(009,'2020-05-31',1,9,5,7,10),
(010,'2020-05-31',1,10,6,4,9);

select * from Proveedor
INSERT INTO Proveedor values
(01,'Chef Mart',1),
(02,'Kesos y Kosas',2),
(03,'McCain',3),
(04,'Bachoco',4),
(05,'Tyson',5),
(06,'Aliementos Rivera',6),
(07,'Productos del Campo',7),
(08,'El Pariente',8),
(09,'Alimentos Garza',9),
(10,'Grillers',10);

select * from Venta
INSERT INTO Venta values
(1,104,96,1,1),
(2,128,72,2,2),
(3,138,62,3,3),
(4,158,42,4,1),
(5,118,82,5,2),
(6,138,62,6,3),
(7,74,26,7,1),
(8,97,103,8,2),
(9,74,26,9,3),
(10,107,93,10,1);

--UPDATE STATEMENTS----------------------------------------------------------------------------------------------------------------
UPDATE Empleado
SET Email='crisrobledo@gmail.com'
WHERE idEmpleado=1;

UPDATE Empleado
SET aMaterno='Tellez',
Email='mtztellez@gmail.com'
WHERE idEmpleado=2;

UPDATE Proveedor
SET NomProveedor='Alimentos Garza'
WHERE idProveedor=6;

UPDATE Bebida
SET NomBebida='Vampiro'
WHERE idBebida=7;

UPDATE Productos
SET NomProducto='Ginebra 750ml'
WHERE idProducto=16;

--DELETE STATEMENTS----------------------------------------------------------------------------------------------------------------
select * from Productos
DELETE FROM Productos
WHERE Marca='Tecate Original';

DELETE FROM Productos
WHERE Marca='Tecate Ligth';

DELETE FROM Productos
WHERE Marca='Amstel Beer';

DELETE FROM Productos
WHERE Marca='Heineken';

DELETE FROM Productos
WHERE Marca='Sol';