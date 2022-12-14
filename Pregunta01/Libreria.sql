USE [master]
GO
/****** Object:  Database [Libreria]    Script Date: 30/11/2022 11:54:57 ******/
CREATE DATABASE [Libreria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Libreria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Libreria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Libreria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Libreria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Libreria] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Libreria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Libreria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Libreria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Libreria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Libreria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Libreria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Libreria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Libreria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Libreria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Libreria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Libreria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Libreria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Libreria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Libreria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Libreria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Libreria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Libreria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Libreria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Libreria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Libreria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Libreria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Libreria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Libreria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Libreria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Libreria] SET  MULTI_USER 
GO
ALTER DATABASE [Libreria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Libreria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Libreria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Libreria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Libreria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Libreria] SET QUERY_STORE = OFF
GO
USE [Libreria]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Libreria]
GO
/****** Object:  Table [dbo].[Almacen]    Script Date: 30/11/2022 11:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacen](
	[idalmacen] [int] NOT NULL,
	[telefono] [int] NULL,
	[direccion] [varchar](100) NULL,
	[idLocalidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idalmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Almacena]    Script Date: 30/11/2022 11:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacena](
	[idalmacen] [int] NOT NULL,
	[idLibro] [int] NOT NULL,
	[stock] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Autor]    Script Date: 30/11/2022 11:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autor](
	[idAutor] [int] NOT NULL,
	[nombre] [varchar](80) NULL,
	[apellido] [varchar](80) NULL,
	[url] [varchar](100) NULL,
	[telefono] [int] NULL,
	[direccion] [varchar](100) NULL,
	[idLocalidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cesta]    Script Date: 30/11/2022 11:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cesta](
	[idCesta] [int] NOT NULL,
	[fechaCompra] [date] NULL,
	[idCliente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 30/11/2022 11:54:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[direccion] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[telefono] [int] NULL,
	[idLocalidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contiene]    Script Date: 30/11/2022 11:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contiene](
	[idCesta] [int] NOT NULL,
	[idLibro] [int] NOT NULL,
	[cantidad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[documento]    Script Date: 30/11/2022 11:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[documento](
	[iddoc] [int] NOT NULL,
	[tematica] [varchar](40) NULL,
	[nombre] [varchar](80) NULL,
	[idioma] [varchar](25) NULL,
	[ideditorial] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[iddoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ebook]    Script Date: 30/11/2022 11:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ebook](
	[idLibro] [int] NOT NULL,
	[tamano] [float] NULL,
	[precio] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Editorial]    Script Date: 30/11/2022 11:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editorial](
	[idEditorial] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[direccion] [varchar](100) NULL,
	[url] [varchar](100) NULL,
	[telefono] [int] NULL,
	[idLocalidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idEditorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[escribe]    Script Date: 30/11/2022 11:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[escribe](
	[idAutor] [int] NOT NULL,
	[idLibro] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 30/11/2022 11:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[idLibro] [int] NOT NULL,
	[titulo] [varchar](100) NULL,
	[descripcion] [varchar](200) NULL,
	[anio_publicacion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 30/11/2022 11:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[idLocalidad] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[idProvincia] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Papel]    Script Date: 30/11/2022 11:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Papel](
	[idLibro] [int] NOT NULL,
	[fecha_impresion] [date] NULL,
	[precio] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[idLibro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 30/11/2022 11:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[idProvincia] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[publica]    Script Date: 30/11/2022 11:54:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[publica](
	[idEditorial] [int] NOT NULL,
	[idLibro] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Almacen] ([idalmacen], [telefono], [direccion], [idLocalidad]) VALUES (1, 2443454, N'calle teniente oquendo', 2)
INSERT [dbo].[Almacen] ([idalmacen], [telefono], [direccion], [idLocalidad]) VALUES (2, 4342452, N'calle patino', 5)
INSERT [dbo].[Almacen] ([idalmacen], [telefono], [direccion], [idLocalidad]) VALUES (3, 3453254, N'calle rosendo gutierrez', 7)
INSERT [dbo].[Almacen] ([idalmacen], [telefono], [direccion], [idLocalidad]) VALUES (4, 2453323, N'calle tarija', 26)
INSERT [dbo].[Almacen] ([idalmacen], [telefono], [direccion], [idLocalidad]) VALUES (5, 2457687, N'calle chuquisaca', 34)
INSERT [dbo].[Almacen] ([idalmacen], [telefono], [direccion], [idLocalidad]) VALUES (6, 3958353, N'avenida del ejercito', 13)
INSERT [dbo].[Almacen] ([idalmacen], [telefono], [direccion], [idLocalidad]) VALUES (7, 4565465, N'avenida peru', 34)
INSERT [dbo].[Almacen] ([idalmacen], [telefono], [direccion], [idLocalidad]) VALUES (8, 2765447, N'avenida mariscal santa cruz', 11)
INSERT [dbo].[Almacen] ([idalmacen], [telefono], [direccion], [idLocalidad]) VALUES (9, 2946848, N'avenida villazon', 25)
INSERT [dbo].[Almacen] ([idalmacen], [telefono], [direccion], [idLocalidad]) VALUES (10, 2876574, N'avenida santiago segundo', 37)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (5, 1, 150)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (1, 5, 58)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (9, 9, 75)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (4, 16, 100)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (1, 21, 150)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (3, 12, 120)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (7, 4, 354)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (3, 8, 200)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (7, 20, 65)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (3, 31, 50)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (5, 25, 140)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (5, 27, 89)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (3, 17, 75)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (6, 15, 200)
INSERT [dbo].[Almacena] ([idalmacen], [idLibro], [stock]) VALUES (10, 13, 120)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (1, N'Major', N'Rodriguez', N'https://www.gravatar.com/avatar/d57a8be8cb9219609905da25d5f3e50a?d=identicon', 61410142, N'Bahía Blanca Buenos Aires', 2)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (2, N'Daphney', N'Torphy', N'https://www.gravatar.com/avatar/e74e87d40e55b9ff9791c78892e55cb7?d=identicon', 63033863, N'Barrio Covitre Puerto Madryn Chubut', 10)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (3, N'Tatyana', N'Von', N'https://www.gravatar.com/avatar/98c382edd93414c1649b9db866000f97?d=identicon', 74858178, N'Puerto Madryn Chubut 5528', 20)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (4, N'Maude', N'Effertz', N'https://www.gravatar.com/avatar/01d0de92ec9ca4fdfbb99edf6a1abfea?d=identicon', 73405471, N' 1054 San Martín Santa Cruz', 25)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (5, N'Breanna', N'Runolfsdottir', N'https://www.gravatar.com/avatar/684697e194c66d338c5ee91d030121cc?d=identicon', 70705147, N'Av J B Justo 3033 Mar del Plata', 15)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (7, N'Jan', N'Oberbrunner', N'https://www.gravatar.com/avatar/7a4de3ec254747b304a82a14270e72be?d=identicon', 62936149, N'Salta 336 Buenos Aires', 13)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (8, N'Kaelyn', N'Hoppe', N'https://www.gravatar.com/avatar/d5a91308668dd768e955e2efd0fcdb37?d=identicon', 79344820, N'Del. Miguel Hidalgo C.P. 11234 México CDMX', 17)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (9, N'Nova', N'Bergstrom', N'https://www.gravatar.com/avatar/e65037a095cfcc6aec56cad1a2128207?d=identicon', 78484945, N'Calle Tamarindos 24 Col. Polanco ', 7)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (10, N'Myrtle', N'Torphy', N'https://www.gravatar.com/avatar/03b84b35e3a31f091a07910da97ff46a?d=identicon', 64484408, N'Via Gustavo Baz No. 166 Col. San Jerónimo Tepetlacalco', 4)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (11, N'Pamela', N'Ritchie', N'https://www.gravatar.com/avatar/9ffc47916a084028d7a6436531077852?d=identicon', 63864008, N'Nezahualcoyotl 109 Piso 8', 5)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (12, N'Maynard', N'Huel', N'https://www.gravatar.com/avatar/eec9b2ede8a775989ff71b5308ff52d7?d=identicon', 74504771, N'Puerto Juarez 77520 CANCUN', 1)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (13, N'Devin', N'Bartell', N'https://www.gravatar.com/avatar/714a712dc155ccc6b0d825dbc258ec0d?d=identicon', 67565797, N'305 - 14th Ave. S. Suite 3B', 3)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (14, N'Antwan', N'Walker', N'https://www.gravatar.com/avatar/45273652dd6323b8a2378e3208436180?d=identicon', 64686901, N'Keskuskatu 45', 30)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (15, N'Kayla', N'McCullough', N'https://www.gravatar.com/avatar/97a40c4aa56899a85c07a94c247e6845?d=identicon', 75830064, N'ul. Filtrowa 68', 38)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (16, N'King', N'Hermiston', N'https://www.gravatar.com/avatar/c4779957b19b80438e651f6ca4c2107e?d=identicon', 70082353, N'Skagen 21', 33)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (17, N'Kitty', N'Watsica', N'https://www.gravatar.com/avatar/5c087ff01757d13eb9c4a5254ab775a9?d=identicon', 72257971, N'Av. Escaleritas 12 Las Palmas', 23)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (18, N'Henry', N'Kissinger', N'https://www.gravatar.com/avatar/575212144322f08e35ba9ab0b43089da?d=identicon', 74826557, N'Mesa y López 51 Las Palmas', 12)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (19, N'Maquiavelo', N'Maquiavelo', N'https://www.gravatar.com/avatar/0b7dc92c5cbcc2159b5ed9cb5d074867?d=identicon', 77309576, N'Gran Vía 71 Madrid Madrid', 22)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (20, N'Antoine', N'SaintExupery', N'https://www.gravatar.com/avatar/17c1b1c79e9dfcb34e45561f06d704e6?d=identicon', 77243076, N'Pío Baroja 23 Bilbao Vizcaya ', 18)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (21, N'William', N'Faulkner', N'https://www.gravatar.com/avatar/3725b48c55f614cd5e9466aa7c1101f8?d=identicon', 79687848, N'El Cid 45 Miranda de Ebro Burgos', 19)
INSERT [dbo].[Autor] ([idAutor], [nombre], [apellido], [url], [telefono], [direccion], [idLocalidad]) VALUES (22, N'Miguel', N'de Cervantes', N'https://www.gravatar.com/avatar/44962f9da66827c0896a1e567a9d9669?d=identicon', 73968748, N'Jaime I, 65 Alciria Valencia', 27)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (1, CAST(N'2019-01-01' AS Date), 1)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (2, CAST(N'2013-05-23' AS Date), 2)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (3, CAST(N'2020-02-02' AS Date), 4)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (4, CAST(N'2013-11-12' AS Date), 3)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (5, CAST(N'2014-07-03' AS Date), 3)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (6, CAST(N'2003-03-16' AS Date), 2)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (7, CAST(N'2016-10-13' AS Date), 6)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (8, CAST(N'2015-10-09' AS Date), 10)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (9, CAST(N'2019-09-28' AS Date), 1)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (10, CAST(N'2015-05-03' AS Date), 10)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (11, CAST(N'2010-12-25' AS Date), 10)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (12, CAST(N'2019-11-30' AS Date), 9)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (13, CAST(N'2019-12-23' AS Date), 4)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (14, CAST(N'2018-03-29' AS Date), 3)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (15, CAST(N'2020-02-21' AS Date), 1)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (16, CAST(N'2020-01-23' AS Date), 4)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (17, CAST(N'2019-08-19' AS Date), 4)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (18, CAST(N'2018-10-08' AS Date), 2)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (19, CAST(N'2020-03-17' AS Date), 5)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (20, CAST(N'2019-05-21' AS Date), 2)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (21, CAST(N'2017-04-23' AS Date), 7)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (22, CAST(N'2019-09-09' AS Date), 2)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (23, CAST(N'2015-08-23' AS Date), 7)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (24, CAST(N'2020-05-23' AS Date), 8)
INSERT [dbo].[Cesta] ([idCesta], [fechaCompra], [idCliente]) VALUES (25, CAST(N'2020-04-21' AS Date), 4)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (1, N'Carla', N'Perez', N'calle Belisario Salinas', N'carla123@gmail.com', 74534532, 1)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (2, N'Carlos', N'Flores', N'avenida Beni', N'cflores@hotmail.com', 65343425, 23)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (3, N'Pamela', N'Aliaga', N'calle Potosi', N'pamelita@gmail.com', 78654433, 21)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (4, N'Andres', N'Carrillo', N'avenida Hernando Siles', N'andy400@gmail.com', 76222333, 12)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (5, N'Emilia', N'Frias', N'avenida Cañoto', N'emi432@hotmail.com', 76534532, 2)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (6, N'Raul', N'Jimenez', N'calle Tarija', N'raul54@gmail.com', 65433211, 9)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (7, N'Juan', N'Trujillo', N'avenida mariscal Santa Cruz', N'juaniti@hotmail.com', 72121212, 18)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (8, N'Maria', N'Cabrera', N'avenida Siempre Viva', N'maria2@gmail,com', 72343432, 24)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (9, N'Patricio', N'Padilla', N'avenida Pando', N'patricio344@gmail.com', 74589652, 14)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (10, N'Jose', N'Sanchez', N'calle Calama', N'josep34@gmail.com', 75412222, 22)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (11, N'Reynaldo', N'Flores', N'calle illampu', N'reynaldowe@hotmail.com', 65285258, 4)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (12, N'Miguel', N'Potugal', N'calle sagarnaga', N'miki12@gmail.com', 78412536, 3)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (13, N'Hernan', N'Duran', N'calle tarija', N'hernando@gmail.com', 71425360, 8)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (14, N'Luis', N'Gutierrez', N'calle guachalla', N'luis55@gmail.com', 72014254, 36)
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apellido], [direccion], [email], [telefono], [idLocalidad]) VALUES (15, N'Mariel', N'Mendoza', N'calle jaimes freire', N'mrielita@gmail.com', 74121001, 20)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (25, 31, 2)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (1, 14, 1)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (2, 30, 3)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (3, 14, 1)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (5, 4, 3)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (7, 5, 2)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (22, 31, 2)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (3, 6, 3)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (3, 4, 3)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (4, 8, 4)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (2, 4, 3)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (10, 4, 1)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (14, 4, 1)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (4, 25, 2)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (15, 7, 2)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (1, 4, 1)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (20, 15, 2)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (2, 2, 1)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (21, 23, 5)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (22, 23, 1)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (3, 5, 1)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (2, 23, 4)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (8, 4, 3)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (13, 6, 2)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (2, 7, 3)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (9, 6, 3)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (5, 7, 4)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (4, 30, 3)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (25, 5, 5)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (5, 7, 1)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (19, 14, 1)
INSERT [dbo].[contiene] ([idCesta], [idLibro], [cantidad]) VALUES (18, 30, 1)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (2, 8.54, 25.41)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (5, 5.24, 41.75)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (7, 6.3, 48.25)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (9, 2.94, 20.84)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (10, 5.47, 65.41)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (11, 14.24, 100.41)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (12, 3.18, 35.4)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (13, 4.25, 36.57)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (14, 1.35, 68.55)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (15, 5.21, 95.53)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (16, 8.54, 53.14)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (17, 2.65, 42.85)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (18, 4.13, 34.52)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (20, 7.54, 24.51)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (23, 7.42, 55.14)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (24, 4.48, 74.14)
INSERT [dbo].[Ebook] ([idLibro], [tamano], [precio]) VALUES (30, 2.51, 24.51)
INSERT [dbo].[Editorial] ([idEditorial], [nombre], [direccion], [url], [telefono], [idLocalidad]) VALUES (1, N'Salamanca', N'calle Rosales', N'www.salamanca.com', 2321231, 23)
INSERT [dbo].[Editorial] ([idEditorial], [nombre], [direccion], [url], [telefono], [idLocalidad]) VALUES (2, N'Pinguin Random House', N'avenida Girasoles', N'www.pinguinrandomhouse.com', 3456543, 5)
INSERT [dbo].[Editorial] ([idEditorial], [nombre], [direccion], [url], [telefono], [idLocalidad]) VALUES (3, N'Zebra', N'calle Rio bamba', N'www.zebra.com', 2435456, 2)
INSERT [dbo].[Editorial] ([idEditorial], [nombre], [direccion], [url], [telefono], [idLocalidad]) VALUES (4, N'Atahuallpa', N'calle Constitucion', N'www.atahuallpasrl.com', 4332343, 7)
INSERT [dbo].[Editorial] ([idEditorial], [nombre], [direccion], [url], [telefono], [idLocalidad]) VALUES (5, N'Plural', N'calle Guachalla', N'www.pluraleditorial.com', 2343243, 9)
INSERT [dbo].[Editorial] ([idEditorial], [nombre], [direccion], [url], [telefono], [idLocalidad]) VALUES (6, N'De Bolsillo', N'calle Siles', N'www.debolsillo.com', 3465435, 25)
INSERT [dbo].[Editorial] ([idEditorial], [nombre], [direccion], [url], [telefono], [idLocalidad]) VALUES (7, N'Kantuta', N'calle siempre vivas', N'www.kantuta.com', 2345743, 6)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (22, 31)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (7, 5)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (4, 1)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (5, 1)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (7, 3)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (4, 9)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (20, 14)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (5, 25)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (14, 10)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (13, 4)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (7, 4)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (1, 3)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (3, 9)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (5, 6)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (4, 23)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (9, 31)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (20, 21)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (5, 8)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (7, 6)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (1, 17)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (10, 7)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (3, 19)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (21, 5)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (20, 7)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (13, 2)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (15, 25)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (2, 24)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (1, 7)
INSERT [dbo].[escribe] ([idAutor], [idLibro]) VALUES (7, 26)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (1, N'Don Quijote de La Mancha I', N'Caballeresco', 1991)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (2, N'Don Quijote de La Mancha II', N'Caballeresco', 1991)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (3, N'Historias de Nueva Orleans', N'Novela', 1985)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (4, N'El principito', N'Aventura', 1996)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (5, N'El príncipe', N'Político', 1995)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (6, N'Diplomacia', N'Político', 1997)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (7, N'Los Windsor', N'Biografías', 1998)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (8, N'El Último Emperador', N'Autobiografías', 1989)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (9, N'Fortunata y Jacinta', N'Novela', 1984)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (10, N'El Guardian en el centeno', N'Novela, Novela de aprendizaje, Ficción coming-of-age, Ficción adulto joven, Primera persona', 1951)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (11, N'Nueve historias', N'es una colección de relatos cortos del escritor estadounidense J. D. Salinger.', 1953)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (12, N'Franny y Zooey', N'Cuento, Novela, Ficción, Novela corta', 1961)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (13, N'El gran Gatsby', N'La historia hace referencia principalmente al joven y misterioso millonario Jay Gatsby, su pasión quijotesca y la obsesión por la hermosa ex debutante Daisy Buchanan.', 1925)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (14, N'Matilda', N'La ingeniosa y resuelta protagonista, Matilda, que por supuesto ama la lectura, superará muchas dificultades, incluso por encima de la más grande: sus propios padres.', 1965)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (15, N'Orgullo y prejuicio', N'Elizabeth Bennet y Fitzwilliam Darcy, cada uno a su manera deben madurar para superar algunas crisis y aprender de sus errores para poder encarar el futuro en común', 1813)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (16, N'Ensayo sobre la ceguera', N'Es una novela psicológica, contada por un narrador omnisciente que especialmente se centra en el personaje principal, que es la mujer del médico.', 1998)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (17, N'Hamlet', N'Es una tragedia del dramaturgo inglés William Shakespeare', 1603)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (18, N'Charlie y la fábrica de chocolate', N'Charlie Bucket, un niño muy bueno de una familia muy pobre, gana un concurso para disfrutar de una visita de un día a la gigantesca fábrica de chocolate del excéntrico Willy Wonka', 1965)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (19, N'Otelo', N'Shakespeare escribió Otelo probablemente después de Hamlet pero antes que las dos últimas.', 1609)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (20, N'Edipo rey', N' Edipo se ha convertido en rey de Tebas al mismo tiempo que, sin querer, cumplía una profecía de que mataría a su padre, Layo, y se casaría con su madre', 430)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (21, N'Los viajes de Gulliver', N'La obra se considera un clásico de la literatura universal y ha inspirado numerosas adaptaciones y versiones.', 1726)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (22, N'Guerra y paz', N'Invasión napoleónica de Rusia y zarismo', 1865)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (23, N'Ana Karenina', N'La novela está considerada una de las obras cumbres del realismo.', 1877)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (24, N'La muerte de Iván Ilich', N'Enfrentarse a una vida vacía, la soledad y la muerte', 1886)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (25, N'Las aventuras de Huckleberry Finn', N'	Esclavitud en Estados Unidos', 1884)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (26, N'Ramayana', N'Forma parte de los textos sagrados sm?ti (textos no revelados directamente por Dios, sino transmitidos por la tradición).', 300)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (27, N'Aventuras de la mano negra', N'Junto al relato de las aventuras de la inteligente pandilla hay dibujos en los que encontrar las diferentes pistas e ir avanzando en la historia.', 1965)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (28, N'Donde viven los monstruos', N'Su protagonista, Max, es un niño incomprendido y rebelde cuyo mayor deseo es ser un monstruo que aterrorice a cualquiera', 1963)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (29, N'Hojas de hierba', N'es un libro de poemas del poeta estadounidense Walt Whitman', 1855)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (30, N'La señora Dalloway', N'Detalla un día en la vida de Clarissa Dalloway, en la Inglaterra posterior a la Primera Guerra Mundial', 1925)
INSERT [dbo].[Libro] ([idLibro], [titulo], [descripcion], [anio_publicacion]) VALUES (31, N'El pequeño vampiro', N'La obra trata de la amistad entre el niño Anton y el pequeño vampiro Rüdiger von Schlotterstein: juntos viven inquietantes aventuras y dificultades', 1979)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (1, N'La Paz', 1)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (2, N'Santa Ana de Yacuma', 8)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (3, N'Sucre', 5)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (4, N'San Javier', 8)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (5, N'Cochabamba', 3)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (6, N'El Alto', 1)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (7, N'Coroico', 1)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (8, N'Copacabana', 1)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (9, N'Oruro', 7)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (10, N'Challapata', 7)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (11, N'Eucaliptus', 7)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (12, N'Potosi', 4)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (13, N'Tupiza', 4)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (14, N'Uyuni', 4)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (15, N'Villazon', 4)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (16, N'Pando', 9)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (17, N'Madre de Dios', 9)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (18, N'Porvenir', 9)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (19, N'Santa Cruz', 2)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (20, N'Samaipata', 2)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (21, N'Montero', 2)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (22, N'Vallegrande', 2)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (23, N'San Jose', 2)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (24, N'Tarija', 6)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (25, N'Yacuiba', 6)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (26, N'Entre Rios', 6)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (27, N'San Lorenzo', 6)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (28, N'Aiquile', 3)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (29, N'Sacaba', 3)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (30, N'Quillacollo', 3)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (31, N'Punata', 3)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (32, N'Tarabuco', 5)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (33, N'Azurduy', 5)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (34, N'Camargo', 5)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (35, N'Padilla', 5)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (36, N'Riberalta', 8)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (37, N'Beni', 8)
INSERT [dbo].[Localidad] ([idLocalidad], [nombre], [idProvincia]) VALUES (38, N'San Ignacio de Moxos', 8)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (1, CAST(N'1991-12-14' AS Date), 150)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (4, CAST(N'1996-04-16' AS Date), 230)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (5, CAST(N'1995-10-25' AS Date), 200)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (8, CAST(N'1989-06-03' AS Date), 135)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (9, CAST(N'1984-09-29' AS Date), 75)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (12, CAST(N'1961-05-27' AS Date), 180)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (13, CAST(N'1925-06-06' AS Date), 287)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (15, CAST(N'1813-09-08' AS Date), 258)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (16, CAST(N'1998-04-18' AS Date), 300)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (17, CAST(N'1609-05-17' AS Date), 156.75)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (20, CAST(N'0430-05-04' AS Date), 225)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (21, CAST(N'1726-02-15' AS Date), 240)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (25, CAST(N'1884-09-05' AS Date), 124)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (27, CAST(N'1965-08-25' AS Date), 476.2)
INSERT [dbo].[Papel] ([idLibro], [fecha_impresion], [precio]) VALUES (31, CAST(N'1979-12-18' AS Date), 235)
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (1, N'La Paz')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (2, N'Santa Cruz')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (3, N'Cochabamba')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (4, N'Potosi')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (5, N'Chuquisaca')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (6, N'Tarija')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (7, N'Oruro')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (8, N'Beni')
INSERT [dbo].[Provincia] ([idProvincia], [nombre]) VALUES (9, N'Pando')
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (7, 31)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (2, 4)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (1, 9)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (1, 8)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (2, 23)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (2, 30)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (5, 5)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (3, 22)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (4, 15)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (1, 12)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (7, 18)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (3, 16)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (3, 24)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (7, 10)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (6, 20)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (7, 25)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (1, 24)
INSERT [dbo].[publica] ([idEditorial], [idLibro]) VALUES (2, 29)
ALTER TABLE [dbo].[Almacen]  WITH CHECK ADD FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Localidad] ([idLocalidad])
GO
ALTER TABLE [dbo].[Almacena]  WITH CHECK ADD FOREIGN KEY([idalmacen])
REFERENCES [dbo].[Almacen] ([idalmacen])
GO
ALTER TABLE [dbo].[Almacena]  WITH CHECK ADD FOREIGN KEY([idLibro])
REFERENCES [dbo].[Papel] ([idLibro])
GO
ALTER TABLE [dbo].[Autor]  WITH CHECK ADD FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Localidad] ([idLocalidad])
GO
ALTER TABLE [dbo].[Cesta]  WITH CHECK ADD FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Localidad] ([idLocalidad])
GO
ALTER TABLE [dbo].[contiene]  WITH CHECK ADD FOREIGN KEY([idCesta])
REFERENCES [dbo].[Cesta] ([idCesta])
GO
ALTER TABLE [dbo].[contiene]  WITH CHECK ADD FOREIGN KEY([idLibro])
REFERENCES [dbo].[Libro] ([idLibro])
GO
ALTER TABLE [dbo].[documento]  WITH CHECK ADD FOREIGN KEY([ideditorial])
REFERENCES [dbo].[Editorial] ([idEditorial])
GO
ALTER TABLE [dbo].[Editorial]  WITH CHECK ADD FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Localidad] ([idLocalidad])
GO
ALTER TABLE [dbo].[escribe]  WITH CHECK ADD FOREIGN KEY([idAutor])
REFERENCES [dbo].[Autor] ([idAutor])
GO
ALTER TABLE [dbo].[escribe]  WITH CHECK ADD FOREIGN KEY([idLibro])
REFERENCES [dbo].[Libro] ([idLibro])
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD FOREIGN KEY([idProvincia])
REFERENCES [dbo].[Provincia] ([idProvincia])
GO
ALTER TABLE [dbo].[publica]  WITH CHECK ADD FOREIGN KEY([idEditorial])
REFERENCES [dbo].[Editorial] ([idEditorial])
GO
ALTER TABLE [dbo].[publica]  WITH CHECK ADD FOREIGN KEY([idLibro])
REFERENCES [dbo].[Libro] ([idLibro])
GO
USE [master]
GO
ALTER DATABASE [Libreria] SET  READ_WRITE 
GO
