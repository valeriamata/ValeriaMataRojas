USE [master]
GO
/****** Object:  Database [BARLBD]    Script Date: 02/06/2020 04:47:14 p. m. ******/
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
/****** Object:  Table [dbo].[Bebida]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Departamento]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Direccion]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Entrega]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Establecimiento]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Factura]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Mesa]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[MetodoDePago]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Pedido]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Platillo]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Productos]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Proveedor]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Turno]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
/****** Object:  Table [dbo].[Venta]    Script Date: 02/06/2020 04:47:15 p. m. ******/
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
