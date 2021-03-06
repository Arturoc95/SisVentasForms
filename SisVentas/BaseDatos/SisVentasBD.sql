USE [master]
GO
/****** Object:  Database [SisVentas]    Script Date: 26/11/2018 1:23:59 p. m. ******/
CREATE DATABASE [SisVentas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SisVentas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SisVentas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SisVentas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\SisVentas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SisVentas] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SisVentas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SisVentas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SisVentas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SisVentas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SisVentas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SisVentas] SET ARITHABORT OFF 
GO
ALTER DATABASE [SisVentas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SisVentas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SisVentas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SisVentas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SisVentas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SisVentas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SisVentas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SisVentas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SisVentas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SisVentas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SisVentas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SisVentas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SisVentas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SisVentas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SisVentas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SisVentas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SisVentas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SisVentas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SisVentas] SET  MULTI_USER 
GO
ALTER DATABASE [SisVentas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SisVentas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SisVentas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SisVentas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SisVentas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SisVentas] SET QUERY_STORE = OFF
GO
USE [SisVentas]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 26/11/2018 1:24:02 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](256) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presentacion]    Script Date: 26/11/2018 1:24:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presentacion](
	[IdPresentacion] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](256) NULL,
 CONSTRAINT [PK_Presentacion] PRIMARY KEY CLUSTERED 
(
	[IdPresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 26/11/2018 1:24:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[IdArticulo] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](1024) NULL,
	[Imagen] [image] NULL,
	[IdCategoria] [int] NOT NULL,
	[IdPresentacion] [int] NOT NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[IdArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Vista 1]    Script Date: 26/11/2018 1:24:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Vista 1]
AS
SELECT        dbo.Articulo.IdArticulo, dbo.Articulo.Codigo, dbo.Articulo.Nombre, dbo.Articulo.Descripcion, dbo.Articulo.Imagen, dbo.Articulo.IdCategoria, dbo.Categoria.Nombre AS Expr1, dbo.Articulo.IdPresentacion, 
                         dbo.Presentacion.Nombre AS Expr2
FROM            dbo.Articulo INNER JOIN
                         dbo.Categoria ON dbo.Articulo.IdCategoria = dbo.Categoria.IdCategoria INNER JOIN
                         dbo.Presentacion ON dbo.Articulo.IdPresentacion = dbo.Presentacion.IdPresentacion
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 26/11/2018 1:24:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NULL,
	[Sexo] [varchar](1) NULL,
	[FechaNacimiento] [date] NOT NULL,
	[TipoDocumento] [varchar](20) NOT NULL,
	[NumDocumento] [varchar](20) NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleIngreso]    Script Date: 26/11/2018 1:24:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleIngreso](
	[IdDetalleIngreso] [int] IDENTITY(1,1) NOT NULL,
	[IdIngreso] [int] NOT NULL,
	[IdArticulo] [int] NOT NULL,
	[PrecioCompra] [money] NOT NULL,
	[PrecioVenta] [money] NOT NULL,
	[StockInicial] [int] NOT NULL,
	[StockActual] [int] NOT NULL,
	[FechaProduccion] [date] NOT NULL,
	[FechaVencimiento] [date] NOT NULL,
 CONSTRAINT [PK_DetalleIngreso] PRIMARY KEY CLUSTERED 
(
	[IdDetalleIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 26/11/2018 1:24:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[IdDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdVenta] [int] NOT NULL,
	[IdDetalleIngreso] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioVenta] [money] NOT NULL,
	[Descuento] [money] NOT NULL,
 CONSTRAINT [PK_DetalleVenta] PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingreso]    Script Date: 26/11/2018 1:24:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingreso](
	[IdIngreso] [int] IDENTITY(1,1) NOT NULL,
	[IdTrabajador] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[TipoComprobante] [varchar](20) NOT NULL,
	[Serie] [varchar](4) NOT NULL,
	[Correlativo] [varchar](50) NOT NULL,
	[IVA] [decimal](4, 2) NOT NULL,
	[Estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Ingreso] PRIMARY KEY CLUSTERED 
(
	[IdIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 26/11/2018 1:24:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[RazonSocial] [varchar](50) NOT NULL,
	[SectorComercial] [varchar](50) NOT NULL,
	[TipoDocumento] [varchar](20) NOT NULL,
	[NumDocumento] [varchar](20) NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[URL] [varchar](100) NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trabajador]    Script Date: 26/11/2018 1:24:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trabajador](
	[IdTrabajador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Sexo] [varchar](1) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[NumDocumento] [varchar](20) NOT NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
	[Email] [varchar](100) NULL,
	[Acceso] [varchar](20) NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[Password] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Trabajador] PRIMARY KEY CLUSTERED 
(
	[IdTrabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 26/11/2018 1:24:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdTrabajador] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[TipoComprobante] [varchar](20) NOT NULL,
	[Serie] [varchar](4) NOT NULL,
	[Correlativo] [varchar](10) NOT NULL,
	[IVA] [decimal](4, 2) NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Articulo] ON 
GO
INSERT [dbo].[Articulo] ([IdArticulo], [Codigo], [Nombre], [Descripcion], [Imagen], [IdCategoria], [IdPresentacion]) VALUES (3, N'1010', N'LECHE', N'Lacteos', 0x89504E470D0A1A0A0000000D4948445200000064000000500806000000EF09D0EF0000000467414D410000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B000000C249444154785EEDD1310100000CC3A0F937DDD9E00816B8855208A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC11442D91EADA78A45EA1D21110000000049454E44AE426082, 2, 1)
GO
INSERT [dbo].[Articulo] ([IdArticulo], [Codigo], [Nombre], [Descripcion], [Imagen], [IdCategoria], [IdPresentacion]) VALUES (4, N'1111', N'BONYOURT', N'Lacteos', 0x89504E470D0A1A0A0000000D4948445200000064000000500806000000EF09D0EF0000000467414D410000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B000000C249444154785EEDD1310100000CC3A0F937DDD9E00816B8855208A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC1148229045308A6104C2198423085600AC11442D91EADA78A45EA1D21110000000049454E44AE426082, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Articulo] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion]) VALUES (1, N'GASEOSAS', N'BEBIDAS')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion]) VALUES (2, N'LACTEOS', N'LECHE,QUESO,ETC')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion]) VALUES (3, N'DULCES', N'BOMBONES,GALLETAS,ETC')
GO
INSERT [dbo].[Categoria] ([IdCategoria], [Nombre], [Descripcion]) VALUES (4, N'PAPAS', N'PAPAS')
GO
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 
GO
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Sexo], [FechaNacimiento], [TipoDocumento], [NumDocumento], [Direccion], [Telefono], [Email]) VALUES (1, N'ARTURO ARMANDO', N'ARNEDO ANGARITA', N'M', CAST(N'1995-08-31' AS Date), N'Cedula Ciudadanía', N'1006554995', N'Calle 27', N'3209620987', N'Mantenimiento')
GO
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Sexo], [FechaNacimiento], [TipoDocumento], [NumDocumento], [Direccion], [Telefono], [Email]) VALUES (2, N'MARTHA', N'CECILIA ANGARITA', N'F', CAST(N'1984-07-11' AS Date), N'Cedula Ciudadanía', N'11111111', N'crr45', N'234234234', N'Mantenimiento')
GO
INSERT [dbo].[Cliente] ([IdCliente], [Nombre], [Apellidos], [Sexo], [FechaNacimiento], [TipoDocumento], [NumDocumento], [Direccion], [Telefono], [Email]) VALUES (3, N'JULIANA', N'GONZALEZ', N'M', CAST(N'2000-07-11' AS Date), N'Cedula Ciudadanía', N'124578', N'as', N'as', N'Mantenimiento')
GO
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleIngreso] ON 
GO
INSERT [dbo].[DetalleIngreso] ([IdDetalleIngreso], [IdIngreso], [IdArticulo], [PrecioCompra], [PrecioVenta], [StockInicial], [StockActual], [FechaProduccion], [FechaVencimiento]) VALUES (5, 2, 3, 12.0000, 14.0000, 12, 156, CAST(N'2016-12-12' AS Date), CAST(N'2016-12-12' AS Date))
GO
INSERT [dbo].[DetalleIngreso] ([IdDetalleIngreso], [IdIngreso], [IdArticulo], [PrecioCompra], [PrecioVenta], [StockInicial], [StockActual], [FechaProduccion], [FechaVencimiento]) VALUES (6, 9, 4, 12.0000, 12.0000, 12, 12, CAST(N'2018-11-16' AS Date), CAST(N'2018-11-16' AS Date))
GO
INSERT [dbo].[DetalleIngreso] ([IdDetalleIngreso], [IdIngreso], [IdArticulo], [PrecioCompra], [PrecioVenta], [StockInicial], [StockActual], [FechaProduccion], [FechaVencimiento]) VALUES (7, 10, 4, 12.0000, 23.0000, 12, 12, CAST(N'2018-11-16' AS Date), CAST(N'2018-11-16' AS Date))
GO
INSERT [dbo].[DetalleIngreso] ([IdDetalleIngreso], [IdIngreso], [IdArticulo], [PrecioCompra], [PrecioVenta], [StockInicial], [StockActual], [FechaProduccion], [FechaVencimiento]) VALUES (8, 10, 3, 12.0000, 123.0000, 12, 12, CAST(N'2018-11-16' AS Date), CAST(N'2018-11-16' AS Date))
GO
SET IDENTITY_INSERT [dbo].[DetalleIngreso] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingreso] ON 
GO
INSERT [dbo].[Ingreso] ([IdIngreso], [IdTrabajador], [IdProveedor], [Fecha], [TipoComprobante], [Serie], [Correlativo], [IVA], [Estado]) VALUES (2, 1, 2, CAST(N'2016-12-12' AS Date), N'12', N'12', N'12', CAST(18.00 AS Decimal(4, 2)), N'EMITIDO')
GO
INSERT [dbo].[Ingreso] ([IdIngreso], [IdTrabajador], [IdProveedor], [Fecha], [TipoComprobante], [Serie], [Correlativo], [IVA], [Estado]) VALUES (4, 1, 2, CAST(N'2018-11-16' AS Date), N'Factura', N'2', N'231', CAST(18.00 AS Decimal(4, 2)), N'EMITIDO')
GO
INSERT [dbo].[Ingreso] ([IdIngreso], [IdTrabajador], [IdProveedor], [Fecha], [TipoComprobante], [Serie], [Correlativo], [IVA], [Estado]) VALUES (9, 1, 2, CAST(N'2018-11-16' AS Date), N'Factura', N'12', N'2', CAST(18.00 AS Decimal(4, 2)), N'EMITIDO')
GO
INSERT [dbo].[Ingreso] ([IdIngreso], [IdTrabajador], [IdProveedor], [Fecha], [TipoComprobante], [Serie], [Correlativo], [IVA], [Estado]) VALUES (10, 1, 2, CAST(N'2016-12-12' AS Date), N'12', N'12', N'12', CAST(18.00 AS Decimal(4, 2)), N'EMITIDO')
GO
SET IDENTITY_INSERT [dbo].[Ingreso] OFF
GO
SET IDENTITY_INSERT [dbo].[Presentacion] ON 
GO
INSERT [dbo].[Presentacion] ([IdPresentacion], [Nombre], [Descripcion]) VALUES (1, N'UNIDADES', N'Unidades')
GO
INSERT [dbo].[Presentacion] ([IdPresentacion], [Nombre], [Descripcion]) VALUES (2, N'CAJAS', N'Cajas')
GO
SET IDENTITY_INSERT [dbo].[Presentacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 
GO
INSERT [dbo].[Proveedor] ([IdProveedor], [RazonSocial], [SectorComercial], [TipoDocumento], [NumDocumento], [Direccion], [Telefono], [Email], [URL]) VALUES (2, N'PAPAS RICAS', N'Alimentos', N'NIT', N'9999', N'cll 27 a 11', N'6351236', N'Mantenimiento', N'www.papas.com')
GO
INSERT [dbo].[Proveedor] ([IdProveedor], [RazonSocial], [SectorComercial], [TipoDocumento], [NumDocumento], [Direccion], [Telefono], [Email], [URL]) VALUES (3, N'LACTEOS DEL LLANO', N'Alimentos', N'NIT', N'123141', N'CLL 34', N'3423423', N'Mantenimiento', N'WWW.LACTEOS.COM')
GO
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[Trabajador] ON 
GO
INSERT [dbo].[Trabajador] ([IdTrabajador], [Nombre], [Apellidos], [Sexo], [FechaNacimiento], [NumDocumento], [Direccion], [Telefono], [Email], [Acceso], [Usuario], [Password]) VALUES (1, N'ARTURO', N'ARNEDO', N'M', CAST(N'1995-08-31' AS Date), N'1006554995', N'Calle27', N'3209620987', N'Mantenimiento', N'Administrador', N'admin', N'admin')
GO
INSERT [dbo].[Trabajador] ([IdTrabajador], [Nombre], [Apellidos], [Sexo], [FechaNacimiento], [NumDocumento], [Direccion], [Telefono], [Email], [Acceso], [Usuario], [Password]) VALUES (2, N'JULIANA', N'ANGARITA', N'M', CAST(N'1999-07-14' AS Date), N'123456', N'Bella vista', N'63521456', N'Mantenimiento', N'Vendedor', N'vendedor', N'vendedor')
GO
INSERT [dbo].[Trabajador] ([IdTrabajador], [Nombre], [Apellidos], [Sexo], [FechaNacimiento], [NumDocumento], [Direccion], [Telefono], [Email], [Acceso], [Usuario], [Password]) VALUES (3, N'MARIA CAMILA', N'GONZALEZ PEREZ', N'F', CAST(N'2018-11-26' AS Date), N'12341231', N'CLL34', N'6329292', N'Mantenimiento', N'Almacenista', N'maria', N'maria')
GO
SET IDENTITY_INSERT [dbo].[Trabajador] OFF
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Categoria]
GO
ALTER TABLE [dbo].[Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Presentacion] FOREIGN KEY([IdPresentacion])
REFERENCES [dbo].[Presentacion] ([IdPresentacion])
GO
ALTER TABLE [dbo].[Articulo] CHECK CONSTRAINT [FK_Articulo_Presentacion]
GO
ALTER TABLE [dbo].[DetalleIngreso]  WITH CHECK ADD  CONSTRAINT [FK_DetalleIngreso_Articulo] FOREIGN KEY([IdArticulo])
REFERENCES [dbo].[Articulo] ([IdArticulo])
GO
ALTER TABLE [dbo].[DetalleIngreso] CHECK CONSTRAINT [FK_DetalleIngreso_Articulo]
GO
ALTER TABLE [dbo].[DetalleIngreso]  WITH CHECK ADD  CONSTRAINT [FK_DetalleIngreso_Ingreso] FOREIGN KEY([IdIngreso])
REFERENCES [dbo].[Ingreso] ([IdIngreso])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetalleIngreso] CHECK CONSTRAINT [FK_DetalleIngreso_Ingreso]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_DetalleIngreso] FOREIGN KEY([IdDetalleIngreso])
REFERENCES [dbo].[DetalleIngreso] ([IdDetalleIngreso])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_DetalleIngreso]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Venta] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Venta]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Proveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Proveedor]
GO
ALTER TABLE [dbo].[Ingreso]  WITH CHECK ADD  CONSTRAINT [FK_Ingreso_Trabajador] FOREIGN KEY([IdTrabajador])
REFERENCES [dbo].[Trabajador] ([IdTrabajador])
GO
ALTER TABLE [dbo].[Ingreso] CHECK CONSTRAINT [FK_Ingreso_Trabajador]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Trabajador] FOREIGN KEY([IdTrabajador])
REFERENCES [dbo].[Trabajador] ([IdTrabajador])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Trabajador]
GO
/****** Object:  StoredProcedure [dbo].[pseliminar_venta]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[pseliminar_venta]
@idventa int
as
delete from Venta
where IdVenta=@idventa
GO
/****** Object:  StoredProcedure [dbo].[spanular_ingreso]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento anular ingreso
create proc [dbo].[spanular_ingreso]
@idingreso int
as
update Ingreso set Estado='ANULADO'
where IdIngreso=@idingreso
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_articulo_nombre]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento buscar articulo
create proc [dbo].[spbuscar_articulo_nombre]
@textobuscar varchar(50)
as
SELECT        dbo.Articulo.IdArticulo, dbo.Articulo.Codigo, dbo.Articulo.Nombre, dbo.Articulo.Descripcion, 
dbo.Articulo.Imagen, dbo.Articulo.IdCategoria, dbo.Categoria.Nombre AS Categoria, dbo.Articulo.IdPresentacion, 
                         dbo.Presentacion.Nombre AS Presentacion
FROM            dbo.Articulo INNER JOIN
                         dbo.Categoria ON dbo.Articulo.IdCategoria = dbo.Categoria.IdCategoria INNER JOIN
                         dbo.Presentacion ON dbo.Articulo.IdPresentacion = dbo.Presentacion.IdPresentacion
where dbo.Articulo.Nombre like @textobuscar + '%'
order by dbo.Articulo.IdArticulo desc
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_categoria]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_categoria]
@textobuscar varchar(50)
as
select * from Categoria
where Nombre like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_cliente_apellidos]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento buscar cliente apellidos
create proc [dbo].[spbuscar_cliente_apellidos]
@textobuscar varchar(50)
as
select *  from Cliente
where Apellidos like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_cliente_numdocumento]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento buscar cliente documento
create proc [dbo].[spbuscar_cliente_numdocumento]
@textobuscar varchar(50)
as
select *  from Cliente
where NumDocumento like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_presentacion_nombre]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_presentacion_nombre]
@textobuscar varchar(50)
as
select * from Presentacion
where Nombre like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_proveedor_num_documento]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_proveedor_num_documento]
@textobuscar varchar(20)
as 
select * from Proveedor
where NumDocumento like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_proveedor_razonsocial]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento buscar razon social
create proc [dbo].[spbuscar_proveedor_razonsocial]
@textobuscar varchar(50)
as 
select * from Proveedor
where RazonSocial like @textobuscar + '%'
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_trabajador_apellidos]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_trabajador_apellidos]
@textobuscar varchar(50)
as
select * from Trabajador
where Apellidos like @textobuscar + '%'
order by Apellidos asc
GO
/****** Object:  StoredProcedure [dbo].[spbuscar_trabajador_numdocumento]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscar_trabajador_numdocumento]
@textobuscar varchar(50)
as
select * from Trabajador
where NumDocumento like @textobuscar + '%'
order by Apellidos asc
GO
/****** Object:  StoredProcedure [dbo].[spbuscararticulo_venta_codigo]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spbuscararticulo_venta_codigo]
@textobuscar varchar(50)
as
select d.IdDetalleIngreso,a.Codigo,a.Nombre,
c.Nombre as Categoria, p.Nombre as Presentacion,
d.StockActual,d.PrecioCompra,d.PrecioVenta,
d.FechaVencimiento
from Articulo a inner join Categoria c
on a.IdCategoria=c.IdCategoria
inner join Presentacion p
on a.IdPresentacion=p.IdPresentacion
inner join DetalleIngreso d
on a.IdArticulo=d.IdArticulo
inner join Ingreso i
on d.IdIngreso=i.IdIngreso
where a.Codigo = @textobuscar + '%'
and d.StockActual>0 
and i.Estado<>'ANULADO'

GO
/****** Object:  StoredProcedure [dbo].[spbuscararticulo_venta_nombre]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscararticulo_venta_nombre]
@textobuscar varchar(50)
as
select d.IdDetalleIngreso,a.Codigo,a.Nombre,
c.Nombre as Categoria, p.Nombre as Presentacion,
d.StockActual,d.PrecioCompra,d.PrecioVenta,
d.FechaVencimiento
from Articulo a inner join Categoria c
on a.IdCategoria=c.IdCategoria
inner join Presentacion p
on a.IdPresentacion=p.IdPresentacion
inner join DetalleIngreso d
on a.IdArticulo=d.IdArticulo
inner join Ingreso i
on d.IdIngreso=i.IdIngreso
where a.Nombre like @textobuscar + '%'
and d.StockActual>0 
and i.Estado<>'ANULADO'

GO
/****** Object:  StoredProcedure [dbo].[spbuscaringreso_fecha]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento ingresos entre fechas
create proc [dbo].[spbuscaringreso_fecha]
@textobuscar varchar(50),
@textobuscar2 varchar(50)
as
select i.IdIngreso,(t.Apellidos+' '+t.Nombre) as Trabajador,
p.RazonSocial as Proveedor ,i.Fecha,i.TipoComprobante,
i.Serie,i.Correlativo,i.Estado,sum(d.PrecioCompra*d.StockInicial)as Total
from DetalleIngreso d inner join Ingreso i
on d.IdIngreso=i.IdIngreso
inner join Proveedor p 
on i.IdProveedor=p.IdProveedor
inner join Trabajador t
on i.IdTrabajador=t.IdTrabajador
group by 
i.IdIngreso,(t.Apellidos+' '+t.Nombre),
p.RazonSocial,i.Fecha,i.TipoComprobante,
i.Serie,i.Correlativo,i.Estado
having i.Fecha>=@textobuscar and i.Fecha<=@textobuscar2
GO
/****** Object:  StoredProcedure [dbo].[spbuscarventa_fecha]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spbuscarventa_fecha]
@textobuscar varchar (50),
@textobuscar2 varchar (50)
as
select v.IdVenta,
(t.Apellidos+ ' '+t.Nombre) as Trabajador,
(c.Apellidos+ ' '+c.Nombre) as Cliente,
v.Fecha,v.TipoComprobante,v.Serie,v.Correlativo,
sum((d.Cantidad*d.PrecioVenta)-d.Descuento) as Total
from DetalleVenta d inner join Venta v
on d.IdVenta=v.IdVenta
inner join Cliente c
on v.IdCliente=c.IdCliente
inner join Trabajador t
on v.IdTrabajador=t.IdTrabajador
group by v.IdVenta,
(t.Apellidos+ ' '+t.Nombre),
(c.Apellidos+ ' '+c.Nombre),
v.Fecha,v.TipoComprobante,v.Serie,v.Correlativo
having  v.Fecha>=@textobuscar and v.fecha<=@textobuscar2
GO
/****** Object:  StoredProcedure [dbo].[spdisminuirstock]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spdisminuirstock]
@iddetalleingreso int,
@cantidad int
as
update DetalleIngreso set StockActual=StockActual-@cantidad
where IdDetalleIngreso=@iddetalleingreso
GO
/****** Object:  StoredProcedure [dbo].[speditar_articulo]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento editar articulo
create proc [dbo].[speditar_articulo]
@idarticulo int ,
@codigo varchar(50),
@nombre varchar(50),
@descripcion varchar(1024),
@imagen image,
@idcategoria int,
@idpresentacion int 
as
update Articulo set Codigo=@codigo,Nombre=@nombre,Descripcion=@descripcion,
					Imagen=@imagen,IdCategoria=@idcategoria
where IdArticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[speditar_categoria]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speditar_categoria]
@idcategoria int,
@nombre varchar(50),
@descripcion varchar(256)
as
update Categoria set Nombre=@nombre,
Descripcion=@descripcion
where IdCategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[speditar_cliente]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speditar_cliente]
@idcliente int ,
@nombre varchar(50),
@apellidos varchar (50),
@sexo varchar(1),
@fechanacimiento date,
@tipodocumento varchar (20),
@numdocumento varchar(20),
@direccion varchar(50),
@telefono varchar(50),
@email varchar(50)
as
update Cliente set Nombre=@nombre,Apellidos=@apellidos,Sexo=@sexo,FechaNacimiento=@fechanacimiento
,TipoDocumento=@tipodocumento,NumDocumento=NumDocumento,Direccion=@direccion,
Telefono=@telefono,Email=@email
where IdCliente=@idcliente
GO
/****** Object:  StoredProcedure [dbo].[speditar_presentacion]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speditar_presentacion]
@idpresentacion int,
@nombre varchar(50),
@descripcion varchar(256)
as
update Presentacion set Nombre=@nombre,Descripcion=@descripcion
where IdPresentacion=@idpresentacion
GO
/****** Object:  StoredProcedure [dbo].[speditar_proveedor]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speditar_proveedor]
@idproveedor int ,
@razonsocial varchar(50),
@sectorcomercial varchar(50),
@tipodocumento varchar(20),
@numdocumento varchar(20),
@direccion varchar(50),
@telefono varchar (50),
@email varchar(50),
@url varchar(50)
as
update Proveedor set RazonSocial=@razonsocial,SectorComercial=@sectorcomercial,TipoDocumento=@tipodocumento,
NumDocumento=@numdocumento,Direccion=@direccion,Telefono=@telefono,Email=@email,URL=@url
where IdProveedor=@idproveedor
GO
/****** Object:  StoredProcedure [dbo].[speditar_trabajador]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speditar_trabajador]
@idtrabajador int,
@nombre varchar (50),
@apellidos varchar (50),
@sexo varchar(1),
@fechanacimiento date,
@numdocumento varchar (20),
@direccion varchar (100),
@telefono varchar (20),
@email varchar (100),
@acceso varchar (20),
@usuario varchar(20),
@password varchar (20)
as

update Trabajador set Nombre=@nombre,Apellidos=@apellidos,Sexo=@sexo,FechaNacimiento=@fechanacimiento,
						NumDocumento=@numdocumento,Direccion=@direccion,Telefono=@telefono,
						Email=@email,Acceso=@acceso,Usuario=@usuario,Password=@password
where IdTrabajador=@idtrabajador
GO
/****** Object:  StoredProcedure [dbo].[speliminar_articulo]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento eliminar articulo

create proc [dbo].[speliminar_articulo]
@idarticulo int 
as delete from Articulo
where IdArticulo=@idarticulo
GO
/****** Object:  StoredProcedure [dbo].[speliminar_categoria]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speliminar_categoria]
@idcategoria int
as
delete from Categoria
where IdCategoria=@idcategoria
GO
/****** Object:  StoredProcedure [dbo].[speliminar_cliente]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speliminar_cliente]
@idcliente int
as
delete from Cliente
where IdCliente=@idcliente
GO
/****** Object:  StoredProcedure [dbo].[speliminar_presentacion]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speliminar_presentacion]
@idpresentacion int
as
delete from Presentacion
where IdPresentacion=@idpresentacion
GO
/****** Object:  StoredProcedure [dbo].[speliminar_proveedor]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speliminar_proveedor]
@idproveedor int
as 
delete from Proveedor
where IdProveedor=@idproveedor
GO
/****** Object:  StoredProcedure [dbo].[speliminar_trabajador]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[speliminar_trabajador]
@idtrabajador int
as
delete from Trabajador
where IdTrabajador=@idtrabajador
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_articulo]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento insertar articulo
CREATE proc [dbo].[spinsertar_articulo]
@idarticulo int output,
@codigo varchar(50),
@nombre varchar(50),
@descripcion varchar(1024),
@imagen image,
@idcategoria int,
@idpresentacion int 
as
insert into Articulo(Codigo,Nombre,Descripcion,Imagen,IdCategoria,IdPresentacion)
values (@codigo,@nombre,@descripcion,@imagen,@idcategoria,@idpresentacion)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_categoria]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_categoria]
@idcategoria int output,
@nombre varchar(50),
@descripcion varchar(256)
as
insert into Categoria (Nombre,Descripcion)
values(@nombre,@descripcion)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_cliente]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_cliente]
@idcliente int output,
@nombre varchar(50),
@apellidos varchar (50),
@sexo varchar(1),
@fechanacimiento date,
@tipodocumento varchar (20),
@numdocumento varchar(20),
@direccion varchar(50),
@telefono varchar(50),
@email varchar(50)
as
insert into Cliente(Nombre,Apellidos,Sexo,FechaNacimiento,TipoDocumento,NumDocumento,Direccion
,Telefono,Email)
values (@Nombre,@Apellidos,@Sexo,@FechaNacimiento,@TipoDocumento,@NumDocumento,@Direccion
,@Telefono,@Email)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_ingreso]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spinsertar_ingreso]
@idingreso int= null output,
@idtrabajador int,
@idproveedor int,
@fecha date,
@tipocomprobante varchar (20),
@serie varchar(4),
@correlativo varchar(50),
@iva decimal(4,2),
@estado varchar(10) 
as
insert into Ingreso (IdTrabajador,IdProveedor,Fecha,TipoComprobante,
					Serie,Correlativo,IVA,Estado)
values(@idtrabajador,@idproveedor,@fecha,@tipocomprobante,
		@serie,@correlativo,@iva,@estado)
--obtener el codigo autogenerado
SET @idingreso=@@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_presentacion]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_presentacion]
@idpresentacion int output,
@nombre varchar(50),
@descripcion varchar(256)
as
insert into Presentacion (Nombre,Descripcion)
values(@nombre,@descripcion)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_proveedor]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_proveedor]
@idproveedor int output,
@razonsocial varchar(50),
@sectorcomercial varchar(50),
@tipodocumento varchar(20),
@numdocumento varchar(20),
@direccion varchar(50),
@telefono varchar (50),
@email varchar(50),
@url varchar(50)
as
insert into Proveedor (RazonSocial,SectorComercial,TipoDocumento,NumDocumento,
Direccion,Telefono,Email,URL)
values (@razonsocial,@sectorcomercial,@tipodocumento,@numdocumento,
		@direccion,@telefono,@email,@url)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_trabajador]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_trabajador]
@idtrabajador int output,
@nombre varchar (50),
@apellidos varchar (50),
@sexo varchar(1),
@fechanacimiento date,
@numdocumento varchar (20),
@direccion varchar (100),
@telefono varchar (20),
@email varchar (100),
@acceso varchar (20),
@usuario varchar(20),
@password varchar (20)
as
insert into Trabajador (Nombre,Apellidos,Sexo,FechaNacimiento,NumDocumento,Direccion,
						Telefono,Email,Acceso,Usuario,Password)
values (@nombre,@apellidos,@sexo,@fechanacimiento,@numdocumento,@direccion,@telefono,@email,
		@acceso,@usuario,@password)
GO
/****** Object:  StoredProcedure [dbo].[spinsertar_venta]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertar_venta]
@idventa int output,
@idcliente int,
@idtrabajador int,
@fecha date,
@tipocomprobante varchar(20),
@serie varchar(4),
@correlativo varchar(10),
@IVA decimal (4,2)
as
insert into Venta (IdCliente,IdTrabajador,Fecha,TipoComprobante,Serie,Correlativo,IVA)
values (@idcliente,@idtrabajador,@fecha,@tipocomprobante,@serie,@correlativo,@IVA)
--Obtenemos el codigo generado
set @idventa=@@IDENTITY
GO
/****** Object:  StoredProcedure [dbo].[spinsertardetalle_ingreso]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spinsertardetalle_ingreso]
@iddetalleingreso int output,
@idingreso int,
@idarticulo int,
@preciocompra money,
@precioventa money,
@stockinicial int,
@stockactual int,
@fechaproduccion date,
@fechavencimiento date
as 
insert into DetalleIngreso (IdIngreso,IdArticulo,PrecioCompra,PrecioVenta,StockInicial,StockActual,
				FechaProduccion,FechaVencimiento)
values(@idingreso,@idarticulo,@preciocompra,@precioventa,@stockinicial,@stockactual,
		@fechaproduccion,@fechavencimiento)
GO
/****** Object:  StoredProcedure [dbo].[spinsertardetalle_venta]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spinsertardetalle_venta]
@iddetalleventa int output,
@idventa int,
@iddetalleingreso int,
@cantidad int,
@precioventa money,
@descuento money
as
insert into DetalleVenta (IdVenta,IdDetalleIngreso,Cantidad,PrecioVenta,Descuento)
values(@idventa,@iddetalleingreso,@cantidad,@precioventa,@descuento)
GO
/****** Object:  StoredProcedure [dbo].[splogin]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[splogin]
@usuario varchar (20),
@password varchar (20)
as
select IdTrabajador,Apellidos,Nombre,Acceso
from Trabajador
where Usuario=@usuario and  Password=@password
GO
/****** Object:  StoredProcedure [dbo].[spmostar_proveedor]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento mostrar proveedor
create proc [dbo].[spmostar_proveedor]
as
select top 100 * from Proveedor
order by RazonSocial asc
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_articulo]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Mostrar Articulo
create proc [dbo].[spmostrar_articulo]
as
SELECT  top 100  dbo.Articulo.IdArticulo, dbo.Articulo.Codigo, dbo.Articulo.Nombre, 
dbo.Articulo.Descripcion, dbo.Articulo.Imagen, dbo.Articulo.IdCategoria, dbo.Categoria.Nombre 
AS Categoria, dbo.Articulo.IdPresentacion, 
                         dbo.Presentacion.Nombre AS Presentacion
FROM            dbo.Articulo INNER JOIN
                         dbo.Categoria ON dbo.Articulo.IdCategoria = dbo.Categoria.IdCategoria INNER JOIN
                         dbo.Presentacion ON dbo.Articulo.IdPresentacion = dbo.Presentacion.IdPresentacion
order by dbo.Articulo.IdArticulo desc
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_categoria]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento Mostrar
create proc [dbo].[spmostrar_categoria]
as
select top 200 * from Categoria
order by IdCategoria desc
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_cliente]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Procedimiento mostrar cliente
create proc [dbo].[spmostrar_cliente]
as
select top 100 * from Cliente
order by Apellidos asc 
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_ingreso]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spmostrar_ingreso]
as
select top 100 i.IdIngreso,(t.Apellidos+' '+t.Nombre) as Trabajador,
p.RazonSocial as Proveedor ,i.Fecha,i.TipoComprobante,
i.Serie,i.Correlativo,i.Estado,sum(d.PrecioCompra*d.StockInicial)as Total
from DetalleIngreso d inner join Ingreso i
on d.IdIngreso=i.IdIngreso
inner join Proveedor p 
on i.IdProveedor=p.IdProveedor
inner join Trabajador t
on i.IdTrabajador=t.IdTrabajador
group by 
i.IdIngreso,(t.Apellidos+' '+t.Nombre),
p.RazonSocial,i.Fecha,i.TipoComprobante,
i.Serie,i.Correlativo,i.Estado
order by IdIngreso desc
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_presentacion]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Procedimiento mostrar presentaciones
create proc [dbo].[spmostrar_presentacion]
as
select top 100 * from Presentacion
order by IdPresentacion desc
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_trabajador]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmostrar_trabajador]
as
select top 100 * from Trabajador
order by Apellidos asc
GO
/****** Object:  StoredProcedure [dbo].[spmostrar_venta]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmostrar_venta]
as
select top 100 v.IdVenta,
(t.Apellidos+ ' '+t.Nombre) as Trabajador,
(c.Apellidos+ ' '+c.Nombre) as Cliente,
v.Fecha,v.TipoComprobante,v.Serie,v.Correlativo,
sum((d.Cantidad*d.PrecioVenta)-d.Descuento) as Total
from DetalleVenta d inner join Venta v
on d.IdVenta=v.IdVenta
inner join Cliente c
on v.IdCliente=c.IdCliente
inner join Trabajador t
on v.IdTrabajador=t.IdTrabajador
group by v.IdVenta,
(t.Apellidos+ ' '+t.Nombre),
(c.Apellidos+ ' '+c.Nombre),
v.Fecha,v.TipoComprobante,v.Serie,v.Correlativo
order by v.IdVenta desc
GO
/****** Object:  StoredProcedure [dbo].[spmostrardetalle_ingreso]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--mostrar detalle ingreso
create proc [dbo].[spmostrardetalle_ingreso]
@textobuscar int
as
select d.IdArticulo,a.Nombre as Articulo , d.PrecioCompra,
d.PrecioVenta,d.StockInicial,d.FechaProduccion,
d.FechaVencimiento,(d.StockInicial*d.PrecioCompra) as SubTotal
from DetalleIngreso d inner join Articulo a
on d.IdArticulo	=a.IdArticulo
where d.IdIngreso=@textobuscar
GO
/****** Object:  StoredProcedure [dbo].[spmostrardetalle_venta]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spmostrardetalle_venta]
@textobuscar int
as
select d.IdDetalleIngreso,a.Nombre as Articulo,
d.Cantidad,d.PrecioVenta,d.Descuento,
((d.PrecioVenta*d.Cantidad)-d.Descuento) as Subtotal
from DetalleVenta d inner join DetalleIngreso di
on d.IdDetalleIngreso=di.IdDetalleIngreso
inner join Articulo a
on di.IdArticulo=a.IdArticulo
where d.IdVenta=@textobuscar
GO
/****** Object:  Trigger [dbo].[treestablecer_stock]    Script Date: 26/11/2018 1:24:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[treestablecer_stock]
on [dbo].[DetalleVenta]
for delete 
as
update di set di.StockActual=di.StockActual+dv.Cantidad
from DetalleIngreso as di inner join 
deleted as dv on di.IdDetalleIngreso=dv.IdDetalleIngreso
GO
ALTER TABLE [dbo].[DetalleVenta] ENABLE TRIGGER [treestablecer_stock]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[2] 2[34] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Articulo"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 195
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categoria"
            Begin Extent = 
               Top = 15
               Left = 319
               Bottom = 128
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Presentacion"
            Begin Extent = 
               Top = 135
               Left = 524
               Bottom = 248
               Right = 694
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vista 1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Vista 1'
GO
USE [master]
GO
ALTER DATABASE [SisVentas] SET  READ_WRITE 
GO
