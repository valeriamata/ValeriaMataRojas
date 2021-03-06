USE [master]
GO
/****** Object:  Database [BARLBD]    Script Date: 02/06/2020 01:28:18 a. m. ******/
CREATE DATABASE [BARLBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BARLBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\BARLBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BARLBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\BARLBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BARLBD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BARLBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BARLBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BARLBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BARLBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BARLBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BARLBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [BARLBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BARLBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BARLBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BARLBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BARLBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BARLBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BARLBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BARLBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BARLBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BARLBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BARLBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BARLBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BARLBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BARLBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BARLBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BARLBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BARLBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BARLBD] SET RECOVERY FULL 
GO
ALTER DATABASE [BARLBD] SET  MULTI_USER 
GO
ALTER DATABASE [BARLBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BARLBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BARLBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BARLBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BARLBD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BARLBD', N'ON'
GO
ALTER DATABASE [BARLBD] SET QUERY_STORE = OFF
GO
USE [BARLBD]
GO
/****** Object:  Table [dbo].[Bebida]    Script Date: 02/06/2020 01:28:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bebida](
	[idBebida] [int] NOT NULL,
	[NomBebida] [varchar](30) NULL,
	[Costo] [int] NOT NULL,
	[idProducto] [int] NULL,
 CONSTRAINT [pk_bebida] PRIMARY KEY CLUSTERED 
(
	[idBebida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 02/06/2020 01:28:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] NOT NULL,
	[Nombre] [varchar](30) NULL,
	[aPaterno] [varchar](30) NULL,
	[aMaterno] [varchar](30) NULL,
	[Sexo] [varchar](30) NULL,
	[FechaN] [date] NULL,
	[Telefono] [int] NOT NULL,
	[Email] [varchar](30) NULL,
 CONSTRAINT [pk_cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 02/06/2020 01:28:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[idDepartamento] [int] NOT NULL,
	[Puesto] [varchar](30) NULL,
	[NombreD] [varchar](30) NULL,
	[Sueldo] [int] NOT NULL,
 CONSTRAINT [pk_dep] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 02/06/2020 01:28:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[idDFactura] [int] NOT NULL,
	[NumFactura] [int] NOT NULL,
	[Concepto] [varchar](30) NULL,
	[idVenta] [int] NULL,
 CONSTRAINT [pk_dfact] PRIMARY KEY CLUSTERED 
(
	[idDFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 02/06/2020 01:28:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[idDireccion] [int] NOT NULL,
	[Calle] [varchar](30) NULL,
	[NumeroCasa] [int] NOT NULL,
	[Colonia] [varchar](30) NULL,
	[Ciudad] [varchar](30) NULL,
	[Estado] [varchar](30) NULL,
 CONSTRAINT [pk_direc] PRIMARY KEY CLUSTERED 
(
	[idDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 02/06/2020 01:28:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[idEmpleado] [int] NOT NULL,
	[Nombre] [varchar](30) NULL,
	[aPaterno] [varchar](30) NULL,
	[aMaterno] [varchar](30) NULL,
	[Sexo] [varchar](30) NULL,
	[FechaN] [date] NULL,
	[Telefono] [int] NOT NULL,
	[Email] [varchar](30) NULL,
	[idDepartamento] [int] NULL,
	[idTurno] [int] NULL,
	[idDireccion] [int] NULL,
 CONSTRAINT [pk_emplead] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entrega]    Script Date: 02/06/2020 01:28:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrega](
	[idEntrega] [int] NOT NULL,
	[FechaDeEntrega] [date] NULL,
	[APagar] [int] NOT NULL,
	[idProveedor] [int] NULL,
	[idMPagoE] [int] NULL,
 CONSTRAINT [pk_entrega] PRIMARY KEY CLUSTERED 
(
	[idEntrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Establecimiento]    Script Date: 02/06/2020 01:28:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Establecimiento](
	[idEstablecimiento] [int] NOT NULL,
	[Telefono] [int] NOT NULL,
	[Email] [varchar](30) NULL,
	[idEmpleado] [int] NULL,
	[idDireccion] [int] NULL,
 CONSTRAINT [pk_estab] PRIMARY KEY CLUSTERED 
(
	[idEstablecimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 02/06/2020 01:28:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[idFactura] [int] NOT NULL,
	[idDFactura] [int] NULL,
 CONSTRAINT [pk_fact] PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 02/06/2020 01:28:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesa](
	[idMesa] [int] NOT NULL,
	[idPedido] [int] NULL,
	[idEmpleado] [int] NULL,
 CONSTRAINT [pk_mesa] PRIMARY KEY CLUSTERED 
(
	[idMesa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MetodoDePago]    Script Date: 02/06/2020 01:28:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MetodoDePago](
	[idMPago] [int] NOT NULL,
	[MetodoDePago] [varchar](30) NULL,
 CONSTRAINT [pk_mdpag] PRIMARY KEY CLUSTERED 
(
	[idMPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 02/06/2020 01:28:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[idPedido] [int] NOT NULL,
	[Fecha] [date] NULL,
	[idEstablecimiento] [int] NULL,
	[idCliente] [int] NULL,
	[idEmpleado] [int] NULL,
	[idPlatillo] [int] NULL,
	[idBebida] [int] NULL,
 CONSTRAINT [pk_pedido] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Platillo]    Script Date: 02/06/2020 01:28:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platillo](
	[idPlatillo] [int] NOT NULL,
	[NomPlatillo] [varchar](30) NULL,
	[Costo] [int] NOT NULL,
	[idProducto] [int] NULL,
 CONSTRAINT [pk_plato] PRIMARY KEY CLUSTERED 
(
	[idPlatillo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 02/06/2020 01:28:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[idProducto] [int] NOT NULL,
	[NomProducto] [varchar](30) NULL,
	[Marca] [varchar](30) NULL,
	[Costo] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[FechaVencimiento] [date] NULL,
 CONSTRAINT [pk_prod] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 02/06/2020 01:28:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[idProveedor] [int] NOT NULL,
	[NomProveedor] [varchar](30) NULL,
	[idProducto] [int] NULL,
 CONSTRAINT [pk_prov] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 02/06/2020 01:28:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[idTurno] [int] NOT NULL,
	[Turno] [varchar](30) NULL,
 CONSTRAINT [pk_turno] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 02/06/2020 01:28:20 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] NOT NULL,
	[Total] [int] NOT NULL,
	[Cambio] [int] NOT NULL,
	[idPedido] [int] NULL,
	[idMPago] [int] NULL,
 CONSTRAINT [pk_venta] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (1, N'Shot Tequila', 15, 11)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (2, N'Shot Vodka', 15, 12)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (3, N'Tarro Michelada', 69, 13)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (4, N'Tarro Clamato', 69, 14)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (5, N'Mojito', 59, 15)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (6, N'Gin Tonic', 59, 16)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (7, N'Vampiro', 59, 17)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (8, N'Dos Equis Lager', 18, 18)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (9, N'Dos Equis Ambar', 18, 19)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (10, N'Indio', 15, 20)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (11, N'Tecate Original', 15, 21)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (12, N'Tecate Ligth', 15, 22)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (13, N'Amstel Beer', 19, 23)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (14, N'Heineken', 18, 24)
INSERT [dbo].[Bebida] ([idBebida], [NomBebida], [Costo], [idProducto]) VALUES (15, N'Sol', 18, 25)
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email]) VALUES (1, N'Eduardo', N'Torres', N'Vega', N'Masculino', CAST(N'1998-05-01' AS Date), 81208898, N'edtorres@gmail.com')
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email]) VALUES (2, N'Gabriela', N'Salinas', N'Diaz', N'Femenino', CAST(N'1997-09-24' AS Date), 87291450, N'gabi.diaz@outlook.com')
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email]) VALUES (3, N'Abraham', N'Salazar', N'Gutierrez', N'Masculino', CAST(N'1995-12-30' AS Date), 88444994, N'a.salazar@gmail.com')
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email]) VALUES (4, N'Stephanie', N'Sanchez', N'Davalos', N'Femenino', CAST(N'1999-11-20' AS Date), 88783764, N'fannysanchez@outlook.com')
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email]) VALUES (5, N'Adrian', N'Hernandez', N'Alejos', N'Masculino', CAST(N'2000-11-20' AS Date), 85604795, N'hdez.alejos@gmail.com')
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email]) VALUES (6, N'Andrea', N'Medina', N'Marquez', N'Femenino', CAST(N'2000-11-22' AS Date), 81179958, N'andrea.mm@outlook.com')
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email]) VALUES (7, N'Jared', N'Castellanos', N'Jimenez', N'Masculino', CAST(N'1996-05-18' AS Date), 89491371, N'jaredcj@hotmail.com')
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email]) VALUES (8, N'Tais', N'Rodriguez', N'Castillo', N'Femenino', CAST(N'1999-06-28' AS Date), 87924718, N'tais.rdz@gmail.com')
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email]) VALUES (9, N'Francisco', N'Ruiz', N'Leija', N'Masculino', CAST(N'1999-12-15' AS Date), 82381609, N'fruiz.l@hotmail.com')
INSERT [dbo].[Cliente] ([idCliente], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email]) VALUES (10, N'Janeth', N'Arias', N'Muñiz', N'Femenino', CAST(N'1995-02-28' AS Date), 82279693, N'janeth_a@hotmail.com')
INSERT [dbo].[Departamento] ([idDepartamento], [Puesto], [NombreD], [Sueldo]) VALUES (1, N'Gerente General', N'Gerencia', 8000)
INSERT [dbo].[Departamento] ([idDepartamento], [Puesto], [NombreD], [Sueldo]) VALUES (2, N'Gerente General', N'Gerencia', 8000)
INSERT [dbo].[Departamento] ([idDepartamento], [Puesto], [NombreD], [Sueldo]) VALUES (3, N'Cocinero', N'Cocina', 6000)
INSERT [dbo].[Departamento] ([idDepartamento], [Puesto], [NombreD], [Sueldo]) VALUES (4, N'Cocinero', N'Cocina', 6000)
INSERT [dbo].[Departamento] ([idDepartamento], [Puesto], [NombreD], [Sueldo]) VALUES (5, N'Mesero', N'Cocina', 4400)
INSERT [dbo].[Departamento] ([idDepartamento], [Puesto], [NombreD], [Sueldo]) VALUES (6, N'Mesero', N'Cocina', 4400)
INSERT [dbo].[Departamento] ([idDepartamento], [Puesto], [NombreD], [Sueldo]) VALUES (7, N'Mesero', N'Cocina', 4400)
INSERT [dbo].[Departamento] ([idDepartamento], [Puesto], [NombreD], [Sueldo]) VALUES (8, N'Mesero', N'Cocina', 4400)
INSERT [dbo].[Departamento] ([idDepartamento], [Puesto], [NombreD], [Sueldo]) VALUES (9, N'Barman', N'Barra', 6800)
INSERT [dbo].[Departamento] ([idDepartamento], [Puesto], [NombreD], [Sueldo]) VALUES (10, N'Cajero', N'Caja', 4800)
INSERT [dbo].[DetalleFactura] ([idDFactura], [NumFactura], [Concepto], [idVenta]) VALUES (1, 1, N'Servicio Consumo de Alimentos', 1)
INSERT [dbo].[DetalleFactura] ([idDFactura], [NumFactura], [Concepto], [idVenta]) VALUES (2, 2, N'Servicio Consumo de Alimentos', 2)
INSERT [dbo].[DetalleFactura] ([idDFactura], [NumFactura], [Concepto], [idVenta]) VALUES (3, 3, N'Servicio Consumo de Alimentos', 3)
INSERT [dbo].[DetalleFactura] ([idDFactura], [NumFactura], [Concepto], [idVenta]) VALUES (4, 4, N'Servicio Consumo de Alimentos', 4)
INSERT [dbo].[DetalleFactura] ([idDFactura], [NumFactura], [Concepto], [idVenta]) VALUES (5, 5, N'Servicio Consumo de Alimentos', 5)
INSERT [dbo].[DetalleFactura] ([idDFactura], [NumFactura], [Concepto], [idVenta]) VALUES (6, 6, N'Servicio Consumo de Alimentos', 6)
INSERT [dbo].[DetalleFactura] ([idDFactura], [NumFactura], [Concepto], [idVenta]) VALUES (7, 7, N'Servicio Consumo de Alimentos', 7)
INSERT [dbo].[DetalleFactura] ([idDFactura], [NumFactura], [Concepto], [idVenta]) VALUES (8, 8, N'Servicio Consumo de Alimentos', 8)
INSERT [dbo].[DetalleFactura] ([idDFactura], [NumFactura], [Concepto], [idVenta]) VALUES (9, 9, N'Servicio Consumo de Alimentos', 9)
INSERT [dbo].[DetalleFactura] ([idDFactura], [NumFactura], [Concepto], [idVenta]) VALUES (10, 10, N'Servicio Consumo de Alimentos', 10)
INSERT [dbo].[Direccion] ([idDireccion], [Calle], [NumeroCasa], [Colonia], [Ciudad], [Estado]) VALUES (1, N'Los Angeles', 1900, N'Anahuac', N'Monterrey', N'Nuevo Leon')
INSERT [dbo].[Direccion] ([idDireccion], [Calle], [NumeroCasa], [Colonia], [Ciudad], [Estado]) VALUES (2, N'Cumbres del Sur', 214, N'Cumbres de San Agustin', N'Monterrey', N'Nuevo Leon')
INSERT [dbo].[Direccion] ([idDireccion], [Calle], [NumeroCasa], [Colonia], [Ciudad], [Estado]) VALUES (3, N'Lacandon', 118, N'Azteca', N'Guadalupe', N'Nuevo Leon')
INSERT [dbo].[Direccion] ([idDireccion], [Calle], [NumeroCasa], [Colonia], [Ciudad], [Estado]) VALUES (4, N'Hacienda Santa Maria', 100, N'Hacienda El Palmar', N'Santa Catarina', N'Nuevo Leon')
INSERT [dbo].[Direccion] ([idDireccion], [Calle], [NumeroCasa], [Colonia], [Ciudad], [Estado]) VALUES (5, N'Santo Domingo', 454, N'Nicolas Bravo', N'San Nicolas de los Garza', N'Nuevo Leon')
INSERT [dbo].[Direccion] ([idDireccion], [Calle], [NumeroCasa], [Colonia], [Ciudad], [Estado]) VALUES (6, N'Constitucion', 321, N'Estanzuela Nueva', N'Monterrey', N'Nuevo leon')
INSERT [dbo].[Direccion] ([idDireccion], [Calle], [NumeroCasa], [Colonia], [Ciudad], [Estado]) VALUES (7, N'Cedro', 662, N'Olinala', N'San Pedro Garza Garcia', N'Nuevo Leon')
INSERT [dbo].[Direccion] ([idDireccion], [Calle], [NumeroCasa], [Colonia], [Ciudad], [Estado]) VALUES (8, N'Calle Decima', 671, N'Tolteca', N'Guadalupe', N'Nuevo Leon')
INSERT [dbo].[Direccion] ([idDireccion], [Calle], [NumeroCasa], [Colonia], [Ciudad], [Estado]) VALUES (9, N'Valle Grande', 821, N'Valles de las Brisas', N'Guadalupe', N'Nuevo Leon')
INSERT [dbo].[Direccion] ([idDireccion], [Calle], [NumeroCasa], [Colonia], [Ciudad], [Estado]) VALUES (10, N'Olmeca', 963, N'Zirandaro', N'Juarez', N'Nuevo Leon')
INSERT [dbo].[Empleado] ([idEmpleado], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email], [idDepartamento], [idTurno], [idDireccion]) VALUES (1, N'Cristian', N'Lopez', N'Robledo', N'Masculino', CAST(N'1996-09-24' AS Date), 82178136, N'crisrobledo@gmail.com', 1, 1, 1)
INSERT [dbo].[Empleado] ([idEmpleado], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email], [idDepartamento], [idTurno], [idDireccion]) VALUES (2, N'Georgina', N'Ramirez', N'Tellez', N'Femenino', CAST(N'1997-08-19' AS Date), 83259502, N'mtztellez@gmail.com', 2, 2, 2)
INSERT [dbo].[Empleado] ([idEmpleado], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email], [idDepartamento], [idTurno], [idDireccion]) VALUES (3, N'Gerardo', N'Avila', N'Sauceda', N'Masculino', CAST(N'1999-05-15' AS Date), 87334245, N'gera.avila@outlook.com', 3, 1, 3)
INSERT [dbo].[Empleado] ([idEmpleado], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email], [idDepartamento], [idTurno], [idDireccion]) VALUES (4, N'Alejandro', N'Moreno', N'Livas', N'Masculino', CAST(N'1998-07-26' AS Date), 83368603, N'morenoalejandro@gmail.com', 4, 2, 4)
INSERT [dbo].[Empleado] ([idEmpleado], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email], [idDepartamento], [idTurno], [idDireccion]) VALUES (5, N'Samuel', N'Padilla', N'Vite', N'Masculino', CAST(N'1996-01-08' AS Date), 85116083, N'samuelv@hotmail.com', 5, 1, 5)
INSERT [dbo].[Empleado] ([idEmpleado], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email], [idDepartamento], [idTurno], [idDireccion]) VALUES (6, N'Mayra', N'De la Torre', N'Salinas', N'Femenno', CAST(N'1995-03-16' AS Date), 88918256, N'mayradt@gmail.com', 6, 2, 6)
INSERT [dbo].[Empleado] ([idEmpleado], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email], [idDepartamento], [idTurno], [idDireccion]) VALUES (7, N'Alexander', N'Cavazos', N'Moreno', N'Masculino', CAST(N'1998-04-23' AS Date), 86644125, N'alexcvzs@outlook.com', 7, 1, 7)
INSERT [dbo].[Empleado] ([idEmpleado], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email], [idDepartamento], [idTurno], [idDireccion]) VALUES (8, N'Emiliano', N'Rojas', N'Hernandez', N'Masculino', CAST(N'1994-06-11' AS Date), 88380785, N'emilianorjs@outlook.com', 8, 2, 8)
INSERT [dbo].[Empleado] ([idEmpleado], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email], [idDepartamento], [idTurno], [idDireccion]) VALUES (9, N'Brandon', N'Mata', N'Lara', N'Masculino', CAST(N'1999-08-28' AS Date), 86873948, N'brandonlara@gmail.com', 9, 1, 9)
INSERT [dbo].[Empleado] ([idEmpleado], [Nombre], [aPaterno], [aMaterno], [Sexo], [FechaN], [Telefono], [Email], [idDepartamento], [idTurno], [idDireccion]) VALUES (10, N'Gael', N'Martinez', N'Govea', N'Masculino', CAST(N'2000-02-12' AS Date), 82275037, N'irwinmtz@gmail.com', 10, 1, 10)
INSERT [dbo].[Entrega] ([idEntrega], [FechaDeEntrega], [APagar], [idProveedor], [idMPagoE]) VALUES (1, CAST(N'2020-06-01' AS Date), 990, 1, 1)
INSERT [dbo].[Entrega] ([idEntrega], [FechaDeEntrega], [APagar], [idProveedor], [idMPagoE]) VALUES (2, CAST(N'2020-06-01' AS Date), 1068, 2, 2)
INSERT [dbo].[Entrega] ([idEntrega], [FechaDeEntrega], [APagar], [idProveedor], [idMPagoE]) VALUES (3, CAST(N'2020-06-02' AS Date), 712, 3, 2)
INSERT [dbo].[Entrega] ([idEntrega], [FechaDeEntrega], [APagar], [idProveedor], [idMPagoE]) VALUES (4, CAST(N'2020-06-02' AS Date), 580, 4, 1)
INSERT [dbo].[Entrega] ([idEntrega], [FechaDeEntrega], [APagar], [idProveedor], [idMPagoE]) VALUES (5, CAST(N'2020-06-03' AS Date), 801, 5, 2)
INSERT [dbo].[Entrega] ([idEntrega], [FechaDeEntrega], [APagar], [idProveedor], [idMPagoE]) VALUES (6, CAST(N'2020-06-03' AS Date), 312, 6, 1)
INSERT [dbo].[Entrega] ([idEntrega], [FechaDeEntrega], [APagar], [idProveedor], [idMPagoE]) VALUES (7, CAST(N'2020-06-04' AS Date), 1800, 7, 2)
INSERT [dbo].[Entrega] ([idEntrega], [FechaDeEntrega], [APagar], [idProveedor], [idMPagoE]) VALUES (8, CAST(N'2020-06-04' AS Date), 1140, 8, 2)
INSERT [dbo].[Entrega] ([idEntrega], [FechaDeEntrega], [APagar], [idProveedor], [idMPagoE]) VALUES (9, CAST(N'2020-06-04' AS Date), 420, 9, 1)
INSERT [dbo].[Entrega] ([idEntrega], [FechaDeEntrega], [APagar], [idProveedor], [idMPagoE]) VALUES (10, CAST(N'2020-06-04' AS Date), 60, 10, 1)
INSERT [dbo].[Establecimiento] ([idEstablecimiento], [Telefono], [Email], [idEmpleado], [idDireccion]) VALUES (1, 89998208, N'bar1@gmail.com', 1, 1)
INSERT [dbo].[Establecimiento] ([idEstablecimiento], [Telefono], [Email], [idEmpleado], [idDireccion]) VALUES (2, 83099829, N'bar2@gmail.com', 2, 2)
INSERT [dbo].[Establecimiento] ([idEstablecimiento], [Telefono], [Email], [idEmpleado], [idDireccion]) VALUES (3, 82918133, N'bar3@gmail.com', 3, 3)
INSERT [dbo].[Establecimiento] ([idEstablecimiento], [Telefono], [Email], [idEmpleado], [idDireccion]) VALUES (4, 82347451, N'bar4@gmail.com', 4, 4)
INSERT [dbo].[Establecimiento] ([idEstablecimiento], [Telefono], [Email], [idEmpleado], [idDireccion]) VALUES (5, 82025405, N'bar5@gmail.com', 5, 5)
INSERT [dbo].[Establecimiento] ([idEstablecimiento], [Telefono], [Email], [idEmpleado], [idDireccion]) VALUES (6, 87249503, N'bar6@gmail.com', 6, 6)
INSERT [dbo].[Establecimiento] ([idEstablecimiento], [Telefono], [Email], [idEmpleado], [idDireccion]) VALUES (7, 88858612, N'bar7@gmail.com', 7, 7)
INSERT [dbo].[Establecimiento] ([idEstablecimiento], [Telefono], [Email], [idEmpleado], [idDireccion]) VALUES (8, 86475003, N'bar8@gmail.com', 8, 8)
INSERT [dbo].[Establecimiento] ([idEstablecimiento], [Telefono], [Email], [idEmpleado], [idDireccion]) VALUES (9, 83924613, N'bar9@gmail.com', 9, 9)
INSERT [dbo].[Establecimiento] ([idEstablecimiento], [Telefono], [Email], [idEmpleado], [idDireccion]) VALUES (10, 86591864, N'bar10@gmail.com', 10, 10)
INSERT [dbo].[Factura] ([idFactura], [idDFactura]) VALUES (1, 1)
INSERT [dbo].[Factura] ([idFactura], [idDFactura]) VALUES (2, 2)
INSERT [dbo].[Factura] ([idFactura], [idDFactura]) VALUES (3, 3)
INSERT [dbo].[Factura] ([idFactura], [idDFactura]) VALUES (4, 4)
INSERT [dbo].[Factura] ([idFactura], [idDFactura]) VALUES (5, 5)
INSERT [dbo].[Factura] ([idFactura], [idDFactura]) VALUES (6, 6)
INSERT [dbo].[Factura] ([idFactura], [idDFactura]) VALUES (7, 7)
INSERT [dbo].[Factura] ([idFactura], [idDFactura]) VALUES (8, 8)
INSERT [dbo].[Factura] ([idFactura], [idDFactura]) VALUES (9, 9)
INSERT [dbo].[Factura] ([idFactura], [idDFactura]) VALUES (10, 10)
INSERT [dbo].[Mesa] ([idMesa], [idPedido], [idEmpleado]) VALUES (1, 5, 1)
INSERT [dbo].[Mesa] ([idMesa], [idPedido], [idEmpleado]) VALUES (2, 6, 2)
INSERT [dbo].[Mesa] ([idMesa], [idPedido], [idEmpleado]) VALUES (3, 7, 3)
INSERT [dbo].[Mesa] ([idMesa], [idPedido], [idEmpleado]) VALUES (4, 8, 4)
INSERT [dbo].[Mesa] ([idMesa], [idPedido], [idEmpleado]) VALUES (5, 5, 5)
INSERT [dbo].[Mesa] ([idMesa], [idPedido], [idEmpleado]) VALUES (6, 6, 6)
INSERT [dbo].[Mesa] ([idMesa], [idPedido], [idEmpleado]) VALUES (7, 7, 7)
INSERT [dbo].[Mesa] ([idMesa], [idPedido], [idEmpleado]) VALUES (8, 8, 8)
INSERT [dbo].[Mesa] ([idMesa], [idPedido], [idEmpleado]) VALUES (9, 5, 9)
INSERT [dbo].[Mesa] ([idMesa], [idPedido], [idEmpleado]) VALUES (10, 6, 10)
INSERT [dbo].[MetodoDePago] ([idMPago], [MetodoDePago]) VALUES (1, N'Efectivo')
INSERT [dbo].[MetodoDePago] ([idMPago], [MetodoDePago]) VALUES (2, N'Tarjeta de Debito')
INSERT [dbo].[MetodoDePago] ([idMPago], [MetodoDePago]) VALUES (3, N'Tarjeta de Credito')
INSERT [dbo].[Pedido] ([idPedido], [Fecha], [idEstablecimiento], [idCliente], [idEmpleado], [idPlatillo], [idBebida]) VALUES (1, CAST(N'2020-05-31' AS Date), 1, 1, 5, 1, 1)
INSERT [dbo].[Pedido] ([idPedido], [Fecha], [idEstablecimiento], [idCliente], [idEmpleado], [idPlatillo], [idBebida]) VALUES (2, CAST(N'2020-05-31' AS Date), 1, 2, 6, 2, 5)
INSERT [dbo].[Pedido] ([idPedido], [Fecha], [idEstablecimiento], [idCliente], [idEmpleado], [idPlatillo], [idBebida]) VALUES (3, CAST(N'2020-05-31' AS Date), 1, 3, 7, 3, 4)
INSERT [dbo].[Pedido] ([idPedido], [Fecha], [idEstablecimiento], [idCliente], [idEmpleado], [idPlatillo], [idBebida]) VALUES (4, CAST(N'2020-05-31' AS Date), 1, 4, 8, 4, 3)
INSERT [dbo].[Pedido] ([idPedido], [Fecha], [idEstablecimiento], [idCliente], [idEmpleado], [idPlatillo], [idBebida]) VALUES (5, CAST(N'2020-05-31' AS Date), 1, 5, 5, 6, 7)
INSERT [dbo].[Pedido] ([idPedido], [Fecha], [idEstablecimiento], [idCliente], [idEmpleado], [idPlatillo], [idBebida]) VALUES (6, CAST(N'2020-05-31' AS Date), 1, 6, 6, 8, 6)
INSERT [dbo].[Pedido] ([idPedido], [Fecha], [idEstablecimiento], [idCliente], [idEmpleado], [idPlatillo], [idBebida]) VALUES (7, CAST(N'2020-05-31' AS Date), 1, 7, 7, 9, 2)
INSERT [dbo].[Pedido] ([idPedido], [Fecha], [idEstablecimiento], [idCliente], [idEmpleado], [idPlatillo], [idBebida]) VALUES (8, CAST(N'2020-05-31' AS Date), 1, 8, 8, 10, 8)
INSERT [dbo].[Pedido] ([idPedido], [Fecha], [idEstablecimiento], [idCliente], [idEmpleado], [idPlatillo], [idBebida]) VALUES (9, CAST(N'2020-05-31' AS Date), 1, 9, 5, 7, 10)
INSERT [dbo].[Pedido] ([idPedido], [Fecha], [idEstablecimiento], [idCliente], [idEmpleado], [idPlatillo], [idBebida]) VALUES (10, CAST(N'2020-05-31' AS Date), 1, 10, 6, 4, 9)
INSERT [dbo].[Platillo] ([idPlatillo], [NomPlatillo], [Costo], [idProducto]) VALUES (1, N'Pizza Boneless', 89, 1)
INSERT [dbo].[Platillo] ([idPlatillo], [NomPlatillo], [Costo], [idProducto]) VALUES (2, N'Nachos Especiales', 69, 2)
INSERT [dbo].[Platillo] ([idPlatillo], [NomPlatillo], [Costo], [idProducto]) VALUES (3, N'Papas a la Francesa', 69, 3)
INSERT [dbo].[Platillo] ([idPlatillo], [NomPlatillo], [Costo], [idProducto]) VALUES (4, N'Alitas', 89, 4)
INSERT [dbo].[Platillo] ([idPlatillo], [NomPlatillo], [Costo], [idProducto]) VALUES (5, N'Boneless', 89, 5)
INSERT [dbo].[Platillo] ([idPlatillo], [NomPlatillo], [Costo], [idProducto]) VALUES (6, N'Aros de cebolla', 59, 6)
INSERT [dbo].[Platillo] ([idPlatillo], [NomPlatillo], [Costo], [idProducto]) VALUES (7, N'Orden de guacamole', 59, 7)
INSERT [dbo].[Platillo] ([idPlatillo], [NomPlatillo], [Costo], [idProducto]) VALUES (8, N'Carne Seca', 79, 8)
INSERT [dbo].[Platillo] ([idPlatillo], [NomPlatillo], [Costo], [idProducto]) VALUES (9, N'Aceitunas Preparadas', 59, 9)
INSERT [dbo].[Platillo] ([idPlatillo], [NomPlatillo], [Costo], [idProducto]) VALUES (10, N'Hamburguesa', 79, 10)
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (1, N'Harina de Trigo 20 kg', N'Espuma de Chapala', 489, 1, CAST(N'2021-03-03' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (2, N'Queso Cheddar 3kg', N'Ricos', 290, 2, CAST(N'2021-01-02' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (3, N'Papas para freir 1kg', N'McCain', 89, 8, CAST(N'2020-12-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (4, N'Alitas sazonadas 1kg', N'Bachoco', 99, 10, CAST(N'2020-07-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (5, N'Boneless naturales 1kg', N'Tyson', 89, 12, CAST(N'2020-07-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (6, N'Aros cebolla para freir 1kg', N'McCain', 120, 5, CAST(N'2020-07-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (7, N'Chiles jalapeños 3kg', N'Maxima', 60, 1, CAST(N'2020-12-05' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (8, N'Carne Seca 1kg', N'Machaca', 600, 3, CAST(N'2020-09-09' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (9, N'Aceitunas 1.7kg', N'Viander', 210, 2, CAST(N'2021-02-08' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (10, N'Carne hamburguesa 1kg', N'Grillers', 89, 8, CAST(N'2020-07-23' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (11, N'Tequila 990ml', N'Jose Cuervo', 195, 5, CAST(N'2050-01-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (12, N'Vodka 750ml', N'Absolut', 196, 5, CAST(N'2050-01-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (13, N'Salsa Inglesa 1.9l', N'Maggie', 420, 1, CAST(N'2021-02-22' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (14, N'Jugo de tomate 1.9l', N'Clamato', 69, 5, CAST(N'2021-05-02' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (15, N'Ron 990ml', N'Bacardi', 179, 4, CAST(N'2050-01-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (16, N'Ginebra 750ml', N'Henry Oliver', 407, 2, CAST(N'2050-01-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (17, N'Sangrita', N'Viuda de Sanchez', 68, 3, CAST(N'2050-01-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (18, N'Cerveza', N'Dos Equis Lager', 16, 192, CAST(N'2050-01-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (19, N'Cerveza', N'Dos Equis Ambar', 16, 108, CAST(N'2050-01-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (20, N'Cerveza', N'Indio', 12, 144, CAST(N'2050-01-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (21, N'Cerveza', N'Tecate Original', 12, 132, CAST(N'2050-01-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (22, N'Cerveza', N'Tecate Ligth', 12, 216, CAST(N'2050-01-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (23, N'Cerveza', N'Amstel Beer', 16, 168, CAST(N'2050-01-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (24, N'Cerveza', N'Heineken', 16, 120, CAST(N'2050-01-01' AS Date))
INSERT [dbo].[Productos] ([idProducto], [NomProducto], [Marca], [Costo], [Cantidad], [FechaVencimiento]) VALUES (25, N'Cerveza', N'Sol', 16, 132, CAST(N'2050-01-01' AS Date))
INSERT [dbo].[Proveedor] ([idProveedor], [NomProveedor], [idProducto]) VALUES (1, N'Chef Mart', 1)
INSERT [dbo].[Proveedor] ([idProveedor], [NomProveedor], [idProducto]) VALUES (2, N'Kesos y Kosas', 2)
INSERT [dbo].[Proveedor] ([idProveedor], [NomProveedor], [idProducto]) VALUES (3, N'McCain', 3)
INSERT [dbo].[Proveedor] ([idProveedor], [NomProveedor], [idProducto]) VALUES (4, N'Bachoco', 4)
INSERT [dbo].[Proveedor] ([idProveedor], [NomProveedor], [idProducto]) VALUES (5, N'Tyson', 5)
INSERT [dbo].[Proveedor] ([idProveedor], [NomProveedor], [idProducto]) VALUES (6, N'Alimentos Garza', 6)
INSERT [dbo].[Proveedor] ([idProveedor], [NomProveedor], [idProducto]) VALUES (7, N'Productos del Campo', 7)
INSERT [dbo].[Proveedor] ([idProveedor], [NomProveedor], [idProducto]) VALUES (8, N'El Pariente', 8)
INSERT [dbo].[Proveedor] ([idProveedor], [NomProveedor], [idProducto]) VALUES (9, N'Alimentos Garza', 9)
INSERT [dbo].[Proveedor] ([idProveedor], [NomProveedor], [idProducto]) VALUES (10, N'Grillers', 10)
INSERT [dbo].[Turno] ([idTurno], [Turno]) VALUES (1, N'Tarde')
INSERT [dbo].[Turno] ([idTurno], [Turno]) VALUES (2, N'Nocturno')
INSERT [dbo].[Venta] ([idVenta], [Total], [Cambio], [idPedido], [idMPago]) VALUES (1, 104, 96, 1, 1)
INSERT [dbo].[Venta] ([idVenta], [Total], [Cambio], [idPedido], [idMPago]) VALUES (2, 128, 72, 2, 2)
INSERT [dbo].[Venta] ([idVenta], [Total], [Cambio], [idPedido], [idMPago]) VALUES (3, 138, 62, 3, 3)
INSERT [dbo].[Venta] ([idVenta], [Total], [Cambio], [idPedido], [idMPago]) VALUES (4, 158, 42, 4, 1)
INSERT [dbo].[Venta] ([idVenta], [Total], [Cambio], [idPedido], [idMPago]) VALUES (5, 118, 82, 5, 2)
INSERT [dbo].[Venta] ([idVenta], [Total], [Cambio], [idPedido], [idMPago]) VALUES (6, 138, 62, 6, 3)
INSERT [dbo].[Venta] ([idVenta], [Total], [Cambio], [idPedido], [idMPago]) VALUES (7, 74, 26, 7, 1)
INSERT [dbo].[Venta] ([idVenta], [Total], [Cambio], [idPedido], [idMPago]) VALUES (8, 97, 103, 8, 2)
INSERT [dbo].[Venta] ([idVenta], [Total], [Cambio], [idPedido], [idMPago]) VALUES (9, 74, 26, 9, 3)
INSERT [dbo].[Venta] ([idVenta], [Total], [Cambio], [idPedido], [idMPago]) VALUES (10, 107, 93, 10, 1)
ALTER TABLE [dbo].[Bebida]  WITH CHECK ADD  CONSTRAINT [fk_prod1] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[Bebida] CHECK CONSTRAINT [fk_prod1]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [fk_venta] FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [fk_venta]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [fk_dep] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [fk_dep]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [fk_direc1] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([idDireccion])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [fk_direc1]
GO
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [fk_turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [fk_turno]
GO
ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [fk_idmpag] FOREIGN KEY([idMPagoE])
REFERENCES [dbo].[MetodoDePago] ([idMPago])
GO
ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [fk_idmpag]
GO
ALTER TABLE [dbo].[Entrega]  WITH CHECK ADD  CONSTRAINT [fk_prov] FOREIGN KEY([idProveedor])
REFERENCES [dbo].[Proveedor] ([idProveedor])
GO
ALTER TABLE [dbo].[Entrega] CHECK CONSTRAINT [fk_prov]
GO
ALTER TABLE [dbo].[Establecimiento]  WITH CHECK ADD  CONSTRAINT [fk_direc] FOREIGN KEY([idDireccion])
REFERENCES [dbo].[Direccion] ([idDireccion])
GO
ALTER TABLE [dbo].[Establecimiento] CHECK CONSTRAINT [fk_direc]
GO
ALTER TABLE [dbo].[Establecimiento]  WITH CHECK ADD  CONSTRAINT [fk_emplead] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Establecimiento] CHECK CONSTRAINT [fk_emplead]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [fk_dfact] FOREIGN KEY([idDFactura])
REFERENCES [dbo].[DetalleFactura] ([idDFactura])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [fk_dfact]
GO
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [fk_emplead1] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [fk_emplead1]
GO
ALTER TABLE [dbo].[Mesa]  WITH CHECK ADD  CONSTRAINT [fk_pedido] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedido] ([idPedido])
GO
ALTER TABLE [dbo].[Mesa] CHECK CONSTRAINT [fk_pedido]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [fk_bebida] FOREIGN KEY([idBebida])
REFERENCES [dbo].[Bebida] ([idBebida])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [fk_bebida]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [fk_cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [fk_cliente]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [fk_emplead2] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [fk_emplead2]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [fk_estab] FOREIGN KEY([idEstablecimiento])
REFERENCES [dbo].[Establecimiento] ([idEstablecimiento])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [fk_estab]
GO
ALTER TABLE [dbo].[Pedido]  WITH CHECK ADD  CONSTRAINT [fk_plato] FOREIGN KEY([idPlatillo])
REFERENCES [dbo].[Platillo] ([idPlatillo])
GO
ALTER TABLE [dbo].[Pedido] CHECK CONSTRAINT [fk_plato]
GO
ALTER TABLE [dbo].[Platillo]  WITH CHECK ADD  CONSTRAINT [fk_prod] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[Platillo] CHECK CONSTRAINT [fk_prod]
GO
ALTER TABLE [dbo].[Proveedor]  WITH CHECK ADD  CONSTRAINT [fk_product] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[Proveedor] CHECK CONSTRAINT [fk_product]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fk_idmpag1] FOREIGN KEY([idMPago])
REFERENCES [dbo].[MetodoDePago] ([idMPago])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fk_idmpag1]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [fk_pedido1] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedido] ([idPedido])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [fk_pedido1]
GO
USE [master]
GO
ALTER DATABASE [BARLBD] SET  READ_WRITE 
GO
