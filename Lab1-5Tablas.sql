USE [Lab1]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 08/09/2018 0:35:27 ******/
DROP TABLE [dbo].[Receta]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 08/09/2018 0:35:27 ******/
DROP TABLE [dbo].[Paciente]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 08/09/2018 0:35:27 ******/
DROP TABLE [dbo].[Medicamento]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 08/09/2018 0:35:27 ******/
DROP TABLE [dbo].[Empleados]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 08/09/2018 0:35:27 ******/
DROP TABLE [dbo].[Doctor]
GO
USE [master]
GO
/****** Object:  Database [Lab1]    Script Date: 08/09/2018 0:35:27 ******/
DROP DATABASE [Lab1]
GO
/****** Object:  Database [Lab1]    Script Date: 08/09/2018 0:35:27 ******/
CREATE DATABASE [Lab1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Lab1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Lab1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Lab1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Lab1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Lab1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Lab1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Lab1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Lab1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Lab1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Lab1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Lab1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Lab1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Lab1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Lab1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Lab1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Lab1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Lab1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Lab1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Lab1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Lab1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Lab1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Lab1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Lab1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Lab1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Lab1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Lab1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Lab1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Lab1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Lab1] SET RECOVERY FULL 
GO
ALTER DATABASE [Lab1] SET  MULTI_USER 
GO
ALTER DATABASE [Lab1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Lab1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Lab1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Lab1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Lab1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Lab1', N'ON'
GO
ALTER DATABASE [Lab1] SET QUERY_STORE = OFF
GO
USE [Lab1]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 08/09/2018 0:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[NombreDoctor] [nvarchar](50) NULL,
	[Cedula] [uniqueidentifier] NOT NULL,
	[RFC] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Doctor] PRIMARY KEY CLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 08/09/2018 0:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[NombreEmpleado] [varchar](50) NOT NULL,
	[Puesto] [varchar](50) NOT NULL,
	[Sueldo] [money] NOT NULL,
	[NumeroTrabajador] [bit] NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[NumeroTrabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 08/09/2018 0:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicamento](
	[Medicamento] [nvarchar](50) NOT NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[Restricciones] [text] NOT NULL,
	[Precio] [money] NOT NULL,
	[Presentacion] [image] NULL,
 CONSTRAINT [PK_Medicamento] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 08/09/2018 0:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[Nombre] [nvarchar](max) NOT NULL,
	[Edad] [int] NOT NULL,
	[Peso] [float] NOT NULL,
	[Padecimiento] [ntext] NOT NULL,
	[Medicamento] [ntext] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receta]    Script Date: 08/09/2018 0:35:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receta](
	[NombrePaciente] [nvarchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
	[Diagnostico] [text] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[NombreDoctor] [nvarchar](50) NOT NULL,
	[Cedula] [uniqueidentifier] NOT NULL,
	[Tratamiento] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Lab1] SET  READ_WRITE 
GO
