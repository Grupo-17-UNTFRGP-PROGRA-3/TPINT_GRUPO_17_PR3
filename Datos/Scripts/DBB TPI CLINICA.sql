USE [master]
GO
/****** Object:  Database [ClinicaDB]    Script Date: 13/7/2025 10:42:39 ******/
CREATE DATABASE [ClinicaDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClinicaDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ClinicaDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClinicaDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ClinicaDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ClinicaDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClinicaDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClinicaDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClinicaDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClinicaDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClinicaDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClinicaDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClinicaDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ClinicaDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClinicaDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClinicaDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClinicaDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClinicaDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClinicaDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClinicaDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClinicaDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClinicaDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClinicaDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClinicaDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClinicaDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClinicaDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClinicaDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClinicaDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClinicaDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClinicaDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ClinicaDB] SET  MULTI_USER 
GO
ALTER DATABASE [ClinicaDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClinicaDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClinicaDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClinicaDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClinicaDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClinicaDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ClinicaDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [ClinicaDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ClinicaDB]
GO
/****** Object:  Table [dbo].[Dias]    Script Date: 13/7/2025 10:42:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Eliminado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Especialidades]    Script Date: 13/7/2025 10:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Especialidades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Eliminado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horarios]    Script Date: 13/7/2025 10:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Horario] [time](7) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Eliminado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HorariosMedicos]    Script Date: 13/7/2025 10:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorariosMedicos](
	[IdDia] [int] NOT NULL,
	[Legajo] [int] NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[HoraFin] [time](7) NOT NULL,
	[Eliminado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDia] ASC,
	[Legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 13/7/2025 10:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[IdProvincia] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Eliminado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicos]    Script Date: 13/7/2025 10:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicos](
	[Legajo] [int] IDENTITY(0,1) NOT NULL,
	[Dni] [varchar](8) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Sexo] [bit] NOT NULL,
	[IdNacionalidad] [int] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[IdEspecialidad] [int] NOT NULL,
	[IdProvincia] [int] NOT NULL,
	[IdLocalidad] [int] NOT NULL,
	[Eliminado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nacionalidades]    Script Date: 13/7/2025 10:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nacionalidades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Eliminado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacientes]    Script Date: 13/7/2025 10:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacientes](
	[Dni] [varchar](8) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Sexo] [bit] NOT NULL,
	[IdNacionalidad] [int] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Telefono] [varchar](11) NOT NULL,
	[IdProvincia] [int] NOT NULL,
	[IdLocalidad] [int] NOT NULL,
	[Eliminado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 13/7/2025 10:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Eliminado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turnos]    Script Date: 13/7/2025 10:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turnos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LegajoMedico] [int] NOT NULL,
	[DniPaciente] [varchar](8) NOT NULL,
	[Fecha] [date] NOT NULL,
	[IdHorario] [int] NOT NULL,
	[Estado] [varchar](50) NOT NULL,
	[Observacion] [varchar](255) NULL,
	[Eliminado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/7/2025 10:42:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Usuario] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Legajo] [int] NOT NULL,
	[Eliminado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dias] ON 

INSERT [dbo].[Dias] ([Id], [Descripcion], [Eliminado]) VALUES (1, N'lunes', 0)
INSERT [dbo].[Dias] ([Id], [Descripcion], [Eliminado]) VALUES (2, N'martes', 0)
INSERT [dbo].[Dias] ([Id], [Descripcion], [Eliminado]) VALUES (3, N'miércoles', 0)
INSERT [dbo].[Dias] ([Id], [Descripcion], [Eliminado]) VALUES (4, N'jueves', 0)
INSERT [dbo].[Dias] ([Id], [Descripcion], [Eliminado]) VALUES (5, N'viernes', 0)
INSERT [dbo].[Dias] ([Id], [Descripcion], [Eliminado]) VALUES (6, N'sábado', 0)
SET IDENTITY_INSERT [dbo].[Dias] OFF
GO
SET IDENTITY_INSERT [dbo].[Especialidades] ON 

INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (1, N'Traumatología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (2, N'Ginecología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (3, N'Oftalmología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (4, N'Cardiología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (5, N'Dermatología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (6, N'Endocrinología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (7, N'Gastroenterología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (8, N'Hematología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (9, N'Infectología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (10, N'Nefrología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (11, N'Neumonología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (12, N'Neurología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (13, N'Nutrición', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (14, N'Oncología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (15, N'Otorrinolaringología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (16, N'Pediatría', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (17, N'Psiquiatría', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (18, N'Reumatología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (19, N'Urología', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (20, N'Medicina General', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (21, N'Medicina Familiar', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (22, N'Medicina del Deporte', 0)
INSERT [dbo].[Especialidades] ([Id], [Descripcion], [Eliminado]) VALUES (23, N'Cirugía General', 0)
SET IDENTITY_INSERT [dbo].[Especialidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Horarios] ON 

INSERT [dbo].[Horarios] ([Id], [Horario], [Descripcion], [Eliminado]) VALUES (1, CAST(N'07:00:00' AS Time), N'de 07:00hs a 08:00hs', 0)
INSERT [dbo].[Horarios] ([Id], [Horario], [Descripcion], [Eliminado]) VALUES (2, CAST(N'08:00:00' AS Time), N'de 08:00hs a 09:00hs', 0)
INSERT [dbo].[Horarios] ([Id], [Horario], [Descripcion], [Eliminado]) VALUES (3, CAST(N'09:00:00' AS Time), N'de 09:00hs a 10:00hs', 0)
INSERT [dbo].[Horarios] ([Id], [Horario], [Descripcion], [Eliminado]) VALUES (4, CAST(N'10:00:00' AS Time), N'de 10:00hs a 11:00hs', 0)
INSERT [dbo].[Horarios] ([Id], [Horario], [Descripcion], [Eliminado]) VALUES (5, CAST(N'11:00:00' AS Time), N'de 11:00hs a 12:00hs', 0)
INSERT [dbo].[Horarios] ([Id], [Horario], [Descripcion], [Eliminado]) VALUES (6, CAST(N'12:00:00' AS Time), N'de 12:00hs a 13:00hs', 0)
INSERT [dbo].[Horarios] ([Id], [Horario], [Descripcion], [Eliminado]) VALUES (7, CAST(N'13:00:00' AS Time), N'de 13:00hs a 14:00hs', 0)
INSERT [dbo].[Horarios] ([Id], [Horario], [Descripcion], [Eliminado]) VALUES (8, CAST(N'14:00:00' AS Time), N'de 14:00hs a 15:00hs', 0)
INSERT [dbo].[Horarios] ([Id], [Horario], [Descripcion], [Eliminado]) VALUES (9, CAST(N'15:00:00' AS Time), N'de 15:00hs a 16:00hs', 0)
INSERT [dbo].[Horarios] ([Id], [Horario], [Descripcion], [Eliminado]) VALUES (10, CAST(N'16:00:00' AS Time), N'de 16:00hs a 17:00hs', 0)
INSERT [dbo].[Horarios] ([Id], [Horario], [Descripcion], [Eliminado]) VALUES (11, CAST(N'17:00:00' AS Time), N'de 17:00hs a 18:00hs', 0)
INSERT [dbo].[Horarios] ([Id], [Horario], [Descripcion], [Eliminado]) VALUES (12, CAST(N'18:00:00' AS Time), N'de 18:00hs a 19:00hs', 0)
SET IDENTITY_INSERT [dbo].[Horarios] OFF
GO
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 1, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 2, CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 3, CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 4, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 5, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 6, CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 7, CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 8, CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 9, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 10, CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 11, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 12, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 13, CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 14, CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 15, CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 17, CAST(N'07:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 18, CAST(N'08:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 19, CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 20, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 21, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 22, CAST(N'07:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 23, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 24, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 25, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (1, 26, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 1, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 2, CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 3, CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 4, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 5, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 6, CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 7, CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 8, CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 9, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 10, CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 11, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 12, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 13, CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 14, CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 15, CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 17, CAST(N'07:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 18, CAST(N'08:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 19, CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 20, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 21, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 22, CAST(N'07:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 23, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 24, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 25, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (2, 26, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 1, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 2, CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 3, CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 4, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 5, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 6, CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 7, CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 8, CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 9, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 10, CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 11, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 12, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 13, CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 14, CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 15, CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 17, CAST(N'07:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 18, CAST(N'08:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 19, CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 20, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 21, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 22, CAST(N'07:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 23, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 24, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 25, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (3, 26, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 1, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 2, CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 3, CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 4, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 5, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 6, CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 7, CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 8, CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 9, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 10, CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 11, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 12, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 13, CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 14, CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 15, CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 17, CAST(N'07:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 18, CAST(N'08:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 19, CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 20, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 21, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 22, CAST(N'07:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 23, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 24, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 25, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (4, 26, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
GO
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 1, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 2, CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 3, CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 4, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 5, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 6, CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 7, CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 8, CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 9, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 10, CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 11, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 12, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 13, CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 14, CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 15, CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 17, CAST(N'07:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 18, CAST(N'08:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 19, CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 20, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 21, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 22, CAST(N'07:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 23, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 24, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 25, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (5, 26, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 1, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 2, CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 3, CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 4, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 5, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 6, CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 7, CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 8, CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 9, CAST(N'08:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 10, CAST(N'09:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 11, CAST(N'10:00:00' AS Time), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 12, CAST(N'11:00:00' AS Time), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 13, CAST(N'12:00:00' AS Time), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 14, CAST(N'13:00:00' AS Time), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 15, CAST(N'14:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 17, CAST(N'07:00:00' AS Time), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 18, CAST(N'08:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 19, CAST(N'09:00:00' AS Time), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 20, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 0)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 21, CAST(N'13:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 22, CAST(N'07:00:00' AS Time), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 23, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 24, CAST(N'07:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 25, CAST(N'15:00:00' AS Time), CAST(N'18:00:00' AS Time), 1)
INSERT [dbo].[HorariosMedicos] ([IdDia], [Legajo], [HoraInicio], [HoraFin], [Eliminado]) VALUES (6, 26, CAST(N'08:00:00' AS Time), CAST(N'15:00:00' AS Time), 1)
GO
SET IDENTITY_INSERT [dbo].[Localidades] ON 

INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (1, 1, N'Mar del Plata', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (1, 2, N'Bahía Blanca', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (1, 3, N'San Nicolás', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (1, 4, N'Pergamino', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (1, 5, N'Junín', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (2, 6, N'San Fernando del Valle de Catamarca', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (2, 7, N'Belén', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (2, 8, N'Andalgalá', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (2, 9, N'Santa María', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (2, 10, N'Tinogasta', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (3, 11, N'Comodoro Rivadavia', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (3, 12, N'Puerto Madryn', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (3, 13, N'Trelew', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (3, 14, N'Rawson', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (3, 15, N'Esquel', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (4, 16, N'Córdoba', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (4, 17, N'Villa Carlos Paz', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (4, 18, N'Río Cuarto', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (4, 19, N'San Francisco', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (4, 20, N'Villa María', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (5, 21, N'Corrientes', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (5, 22, N'Goya', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (5, 23, N'Paso de los Libres', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (5, 24, N'Mercedes', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (5, 25, N'Curuzú Cuatiá', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (6, 26, N'Paraná', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (6, 27, N'Concordia', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (6, 28, N'Gualeguaychú', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (6, 29, N'Concepción del Uruguay', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (6, 30, N'Victoria', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (7, 31, N'Formosa', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (7, 32, N'Clorinda', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (7, 33, N'Pirané', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (7, 34, N'El Colorado', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (7, 35, N'Laguna Blanca', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (8, 36, N'San Salvador de Jujuy', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (8, 37, N'Palpalá', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (8, 38, N'Perico', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (8, 39, N'Libertador General San Martín', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (8, 40, N'San Pedro de Jujuy', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (9, 41, N'Santa Rosa', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (9, 42, N'General Pico', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (9, 43, N'Toay', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (9, 44, N'Realicó', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (9, 45, N'Eduardo Castex', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (10, 46, N'La Rioja', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (10, 47, N'Chilecito', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (10, 48, N'Aimogasta', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (10, 49, N'Chamical', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (10, 50, N'Chepes', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (11, 51, N'Mendoza', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (11, 52, N'San Rafael', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (11, 53, N'Godoy Cruz', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (11, 54, N'Luján de Cuyo', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (11, 55, N'Maipú', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (12, 56, N'Posadas', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (12, 57, N'Oberá', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (12, 58, N'Eldorado', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (12, 59, N'Puerto Iguazú', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (12, 60, N'Leandro N. Alem', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (13, 61, N'Neuquén', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (13, 62, N'San Martín de los Andes', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (13, 63, N'Zapala', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (13, 64, N'Plottier', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (13, 65, N'Cutral Có', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (14, 66, N'Viedma', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (14, 67, N'San Carlos de Bariloche', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (14, 68, N'General Roca', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (14, 69, N'Cipolletti', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (14, 70, N'Villa Regina', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (15, 71, N'Salta', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (15, 72, N'San Ramón de la Nueva Orán', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (15, 73, N'Tartagal', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (15, 74, N'General Güemes', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (15, 75, N'Metán', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (16, 76, N'San Juan', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (16, 77, N'Rawson', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (16, 78, N'Chimbas', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (16, 79, N'Rivadavia', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (16, 80, N'Santa Lucía', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (17, 81, N'San Luis', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (17, 82, N'Villa Mercedes', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (17, 83, N'Merlo', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (17, 84, N'La Punta', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (17, 85, N'Justo Daract', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (18, 86, N'Río Gallegos', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (18, 87, N'Caleta Olivia', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (18, 88, N'El Calafate', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (18, 89, N'Pico Truncado', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (18, 90, N'Puerto Deseado', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (19, 91, N'Santa Fe', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (19, 92, N'Rosario', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (19, 93, N'Rafaela', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (19, 94, N'Venado Tuerto', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (19, 95, N'Reconquista', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (20, 96, N'Santiago del Estero', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (20, 97, N'La Banda', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (20, 98, N'Termas de Río Hondo', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (20, 99, N'Añatuya', 0)
GO
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (20, 100, N'Fernández', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (21, 101, N'Ushuaia', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (21, 102, N'Río Grande', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (21, 103, N'Tolhuin', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (21, 104, N'Puerto Almanza', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (21, 105, N'San Sebastián', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (22, 106, N'San Miguel de Tucumán', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (22, 107, N'Concepción', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (22, 108, N'Tafí Viejo', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (22, 109, N'Yerba Buena', 0)
INSERT [dbo].[Localidades] ([IdProvincia], [Id], [Descripcion], [Eliminado]) VALUES (22, 110, N'Monteros', 0)
SET IDENTITY_INSERT [dbo].[Localidades] OFF
GO
SET IDENTITY_INSERT [dbo].[Medicos] ON 

INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (0, N'00000000', N'0', N'0', 0, 1, CAST(N'2000-01-01' AS Date), N'0', N'0', N'0', 1, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (1, N'12345678', N'Lucía', N'Fernández', 1, 1, CAST(N'1980-03-15' AS Date), N'Calle Falsa 123', N'lucia.fernandez@example.com', N'1112345678', 2, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (2, N'87654321', N'Martín', N'Gómez', 0, 1, CAST(N'1975-07-22' AS Date), N'Av. Siempreviva 742', N'martin.gomez@example.com', N'1123456789', 3, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (3, N'11223344', N'Camila', N'López', 1, 1, CAST(N'1990-01-10' AS Date), N'Ruta 5 Km 12', N'camila.lopez@example.com', N'1134567890', 4, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (4, N'44332211', N'Javier', N'Pereyra', 0, 1, CAST(N'1982-05-09' AS Date), N'San Martín 1000', N'javier.pereyra@example.com', N'1145678901', 5, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (5, N'55667788', N'Natalia', N'Ramos', 1, 1, CAST(N'1988-11-03' AS Date), N'Alsina 334', N'natalia.ramos@example.com', N'1156789012', 6, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (6, N'99887766', N'Diego', N'Sosa', 0, 1, CAST(N'1972-04-14' AS Date), N'Belgrano 98', N'diego.sosa@example.com', N'1167890123', 7, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (7, N'33445566', N'Florencia', N'Acosta', 1, 1, CAST(N'1993-06-29' AS Date), N'Libertad 23', N'flor.acosta@example.com', N'1178901234', 8, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (8, N'66778899', N'Facundo', N'Medina', 0, 1, CAST(N'1985-12-18' AS Date), N'Mitre 56', N'facundo.medina@example.com', N'1189012345', 9, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (9, N'11224488', N'Brenda', N'Suárez', 1, 1, CAST(N'1991-09-05' AS Date), N'Independencia 75', N'brenda.suarez@example.com', N'1190123456', 10, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (10, N'77889900', N'Agustín', N'Ibarra', 0, 1, CAST(N'1986-02-21' AS Date), N'Rivadavia 45', N'agustin.ibarra@example.com', N'1101234567', 11, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (11, N'99001122', N'Julieta', N'Benítez', 1, 1, CAST(N'1994-08-30' AS Date), N'Moreno 200', N'julieta.benitez@example.com', N'1123451234', 12, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (12, N'22334455', N'Lucas', N'Vega', 0, 1, CAST(N'1983-10-17' AS Date), N'Dorrego 19', N'lucas.vega@example.com', N'1134562345', 13, 1, 5, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (13, N'44556677', N'Micaela', N'Castro', 1, 1, CAST(N'1979-03-02' AS Date), N'Pellegrini 678', N'micaela.castro@example.com', N'1145673456', 14, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (14, N'55664433', N'Tomás', N'Luna', 0, 1, CAST(N'1981-06-11' AS Date), N'San Juan 99', N'tomas.luna@example.com', N'1156784567', 15, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (15, N'66775544', N'Sol', N'Herrera', 1, 1, CAST(N'1992-12-25' AS Date), N'Laprida 321', N'sol.herrera@example.com', N'1167895678', 16, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (17, N'30300300', N'Carlos ', N'Sanchez', 0, 1, CAST(N'2000-10-20' AS Date), N'Saborido 1020', N'medicoloco@medloc.com.ar', N'123123321', 1, 1, 1, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (18, N'12312312', N'Martin ', N'Cabrera', 0, 1, CAST(N'1989-09-17' AS Date), N'Los Alerces 421', N'mcabrera@medinc.com.ar', N'65498745', 1, 1, 2, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (19, N'41638975', N'Sol', N'Sanabria', 1, 1, CAST(N'1982-10-27' AS Date), N'Trapiche 2020', N'solsana@medinc.com.ar', N'98798765', 5, 1, 2, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (20, N'41170965', N'Nicolas', N'Alfaro', 0, 1, CAST(N'1995-05-05' AS Date), N'Garzon 454', N'alfaalfa@medinc.com.ar', N'45984598', 15, 4, 17, 0)
INSERT [dbo].[Medicos] ([Legajo], [Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdEspecialidad], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (21, N'41529032', N'Lucrecia', N'Bueno', 1, 1, CAST(N'1999-01-01' AS Date), N'Jose Paz 1298', N'lucreb@medinc.com.ar', N'46791382', 16, 1, 3, 0)
SET IDENTITY_INSERT [dbo].[Medicos] OFF
GO
SET IDENTITY_INSERT [dbo].[Nacionalidades] ON 

INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (1, N'Argentina', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (2, N'Chilena', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (3, N'Uruguaya', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (4, N'Boliviana', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (5, N'Paraguaya', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (6, N'Peruana', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (7, N'Brasileña', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (8, N'Colombiana', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (9, N'Venezolana', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (10, N'Ecuatoriana', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (11, N'Mexicana', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (12, N'Cubana', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (13, N'Dominicana', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (14, N'Costarricense', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (15, N'Salvadoreña', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (16, N'Guatemalteca', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (17, N'Hondureña', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (18, N'Nicaragüense', 0)
INSERT [dbo].[Nacionalidades] ([Id], [Descripcion], [Eliminado]) VALUES (19, N'Panameña', 0)
SET IDENTITY_INSERT [dbo].[Nacionalidades] OFF
GO
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000001', N'María', N'Alvarez', 1, 1, CAST(N'1992-04-15' AS Date), N'Calle 123', N'maria.alvarez@example.com', N'1134567890', 1, 1, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000002', N'Juan', N'Pérez', 0, 1, CAST(N'1985-10-22' AS Date), N'Av. Siempreviva 555', N'juan.perez@example.com', N'1123456789', 1, 5, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000003', N'Sofía', N'Rodríguez', 1, 1, CAST(N'1990-07-30' AS Date), N'Libertad 74', N'sofia.rod@example.com', N'1145678901', 1, 4, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000004', N'Carlos', N'Fernández', 0, 1, CAST(N'1978-02-11' AS Date), N'Mitre 1089', N'carlos.fernandez@example.com', N'1156789012', 1, 3, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000005', N'Luciana', N'Ramírez', 1, 1, CAST(N'2000-06-05' AS Date), N'San Martín 234', N'luciana.ramirez@example.com', N'1167890123', 1, 4, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000006', N'Diego', N'Gómez', 0, 1, CAST(N'1995-03-28' AS Date), N'Rivadavia 44', N'diego.gomez@example.com', N'1178901234', 1, 1, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000007', N'Camila', N'Sánchez', 1, 1, CAST(N'1998-08-13' AS Date), N'Moreno 321', N'camila.sanchez@example.com', N'1189012345', 1, 1, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000008', N'Martín', N'Torres', 0, 1, CAST(N'1980-11-19' AS Date), N'Belgrano 50', N'martin.torres@example.com', N'1190123456', 1, 1, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000009', N'Julieta', N'López', 1, 1, CAST(N'1983-01-25' AS Date), N'Independencia 9', N'julieta.lopez@example.com', N'1101234567', 1, 1, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000010', N'Federico', N'Díaz', 0, 1, CAST(N'1991-09-09' AS Date), N'Alsina 222', N'federico.diaz@example.com', N'1112345678', 1, 1, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000011', N'Valentina', N'Vega', 1, 1, CAST(N'1993-12-17' AS Date), N'Laprida 543', N'valen.vega@example.com', N'1123451234', 2, 6, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000012', N'Leandro', N'Aguirre', 0, 1, CAST(N'1975-06-03' AS Date), N'Ruta 3 KM 88', N'leandro.aguirre@example.com', N'1134562345', 2, 7, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000013', N'Florencia', N'Molina', 1, 1, CAST(N'1987-05-11' AS Date), N'Pellegrini 777', N'flor.molina@example.com', N'1145673456', 2, 8, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000014', N'Tomás', N'Cruz', 0, 1, CAST(N'1996-02-02' AS Date), N'San Juan 66', N'tomas.cruz@example.com', N'1156784567', 2, 7, 0)
INSERT [dbo].[Pacientes] ([Dni], [Nombre], [Apellido], [Sexo], [IdNacionalidad], [FechaNacimiento], [Direccion], [Email], [Telefono], [IdProvincia], [IdLocalidad], [Eliminado]) VALUES (N'10000015', N'Milagros', N'Paz', 1, 1, CAST(N'2001-10-20' AS Date), N'Dorrego 14', N'milagros.paz@example.com', N'1167895678', 2, 6, 0)
GO
SET IDENTITY_INSERT [dbo].[Provincias] ON 

INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (1, N'Buenos Aires', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (2, N'Catamarca', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (3, N'Chubut', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (4, N'Córdoba', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (5, N'Corrientes', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (6, N'Entre Ríos', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (7, N'Formosa', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (8, N'Jujuy', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (9, N'La Pampa', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (10, N'La Rioja', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (11, N'Mendoza', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (12, N'Misiones', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (13, N'Neuquén', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (14, N'Río Negro', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (15, N'Salta', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (16, N'San Juan', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (17, N'San Luis', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (18, N'Santa Cruz', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (19, N'Santa Fe', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (20, N'Santiago del Estero', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (21, N'Tierra del Fuego', 0)
INSERT [dbo].[Provincias] ([Id], [Descripcion], [Eliminado]) VALUES (22, N'Tucumán', 0)
SET IDENTITY_INSERT [dbo].[Provincias] OFF
GO
SET IDENTITY_INSERT [dbo].[Turnos] ON 

INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (1, 1, N'10000001', CAST(N'2025-06-24' AS Date), 2, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (2, 2, N'10000002', CAST(N'2025-06-24' AS Date), 4, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (3, 3, N'10000003', CAST(N'2025-06-25' AS Date), 5, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (4, 4, N'10000004', CAST(N'2025-06-25' AS Date), 6, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (5, 5, N'10000005', CAST(N'2025-06-26' AS Date), 7, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (6, 6, N'10000006', CAST(N'2025-06-26' AS Date), 8, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (7, 7, N'10000007', CAST(N'2025-06-27' AS Date), 9, N'Ausente', N'', 1)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (8, 8, N'10000008', CAST(N'2025-06-27' AS Date), 10, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (9, 9, N'10000009', CAST(N'2025-07-01' AS Date), 3, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (10, 10, N'10000010', CAST(N'2025-07-01' AS Date), 4, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (11, 11, N'10000011', CAST(N'2025-07-02' AS Date), 5, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (12, 12, N'10000012', CAST(N'2025-07-02' AS Date), 6, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (13, 13, N'10000013', CAST(N'2025-07-03' AS Date), 7, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (14, 14, N'10000014', CAST(N'2025-07-03' AS Date), 8, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (15, 15, N'10000015', CAST(N'2025-07-04' AS Date), 9, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (16, 2, N'10000013', CAST(N'2025-07-01' AS Date), 4, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (17, 2, N'10000011', CAST(N'2025-07-18' AS Date), 11, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (18, 8, N'10000004', CAST(N'2025-07-02' AS Date), 6, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (19, 3, N'10000004', CAST(N'2025-07-27' AS Date), 1, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (20, 12, N'10000010', CAST(N'2025-07-24' AS Date), 7, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (21, 11, N'10000005', CAST(N'2025-07-14' AS Date), 3, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (22, 7, N'10000009', CAST(N'2025-07-20' AS Date), 2, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (23, 11, N'10000010', CAST(N'2025-07-13' AS Date), 3, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (24, 8, N'10000007', CAST(N'2025-07-30' AS Date), 6, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (25, 9, N'10000006', CAST(N'2025-07-24' AS Date), 10, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (26, 4, N'10000005', CAST(N'2025-07-07' AS Date), 5, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (27, 7, N'10000001', CAST(N'2025-07-27' AS Date), 12, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (28, 7, N'10000011', CAST(N'2025-07-02' AS Date), 2, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (29, 7, N'10000014', CAST(N'2025-07-07' AS Date), 12, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (30, 3, N'10000013', CAST(N'2025-07-08' AS Date), 1, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (31, 2, N'10000013', CAST(N'2025-07-31' AS Date), 11, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (32, 2, N'10000006', CAST(N'2025-07-29' AS Date), 4, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (33, 9, N'10000012', CAST(N'2025-07-04' AS Date), 10, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (34, 7, N'10000013', CAST(N'2025-07-16' AS Date), 2, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (35, 2, N'10000013', CAST(N'2025-07-08' AS Date), 11, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (36, 7, N'10000011', CAST(N'2025-07-04' AS Date), 2, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (37, 12, N'10000003', CAST(N'2025-07-24' AS Date), 6, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (38, 8, N'10000010', CAST(N'2025-07-24' AS Date), 6, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (39, 4, N'10000014', CAST(N'2025-07-29' AS Date), 8, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (40, 4, N'10000010', CAST(N'2025-07-02' AS Date), 8, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (41, 4, N'10000013', CAST(N'2025-07-31' AS Date), 5, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (42, 9, N'10000013', CAST(N'2025-07-22' AS Date), 10, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (43, 9, N'10000004', CAST(N'2025-07-17' AS Date), 3, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (44, 4, N'10000015', CAST(N'2025-07-03' AS Date), 8, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (45, 4, N'10000009', CAST(N'2025-07-14' AS Date), 5, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (46, 2, N'10000012', CAST(N'2025-07-24' AS Date), 11, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (47, 12, N'10000008', CAST(N'2025-07-23' AS Date), 7, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (48, 4, N'10000014', CAST(N'2025-07-24' AS Date), 5, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (49, 9, N'10000011', CAST(N'2025-07-17' AS Date), 10, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (50, 4, N'10000011', CAST(N'2025-07-08' AS Date), 8, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (51, 7, N'10000015', CAST(N'2025-07-02' AS Date), 12, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (52, 7, N'10000008', CAST(N'2025-07-16' AS Date), 12, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (53, 7, N'10000012', CAST(N'2025-07-03' AS Date), 2, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (54, 7, N'10000007', CAST(N'2025-07-08' AS Date), 2, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (55, 8, N'10000008', CAST(N'2025-07-17' AS Date), 8, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (56, 4, N'10000008', CAST(N'2025-07-24' AS Date), 6, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (57, 3, N'10000003', CAST(N'2025-07-08' AS Date), 2, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (58, 5, N'10000008', CAST(N'2025-07-16' AS Date), 5, N'Presente', N'Actualizado 2 veces
', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (59, 5, N'10000011', CAST(N'2025-07-16' AS Date), 6, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (60, 5, N'10000014', CAST(N'2025-07-10' AS Date), 5, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (61, 7, N'10000004', CAST(N'2025-07-17' AS Date), 8, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (62, 12, N'10000005', CAST(N'2025-07-14' AS Date), 5, N'Ausente', N'', 1)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (63, 13, N'10000013', CAST(N'2025-07-24' AS Date), 8, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (64, 15, N'10000011', CAST(N'2025-07-11' AS Date), 8, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (65, 9, N'10000011', CAST(N'2025-07-16' AS Date), 2, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (66, 3, N'10000011', CAST(N'2025-07-08' AS Date), 3, N'Ausente', N'', 0)
INSERT [dbo].[Turnos] ([Id], [LegajoMedico], [DniPaciente], [Fecha], [IdHorario], [Estado], [Observacion], [Eliminado]) VALUES (67, 3, N'10000011', CAST(N'2025-07-11' AS Date), 1, N'Ausente', N'', 1)
SET IDENTITY_INSERT [dbo].[Turnos] OFF
GO
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'17Sanchez', N'1234', 17, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'18Cabrera', N'1234', 18, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'19Sanabria', N'1234', 19, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'20Alfaro', N'1234', 20, 1)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'21Bueno', N'1234', 21, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'22Cuello Saavedra', N'1234', 22, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'23Guapo', N'1234', 23, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'24Cuello Saavedra', N'1234', 24, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'25Noriega', N'1234', 25, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'26b', N'1234', 26, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'Aibarra', N'docpass10', 10, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'Bsuarez', N'docpass09', 9, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'Clopez', N'docpass03', 3, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'Dsosa', N'docpass06', 6, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'ElianVarela', N'1312', 0, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'Facostamed', N'docpass07', 7, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'Fmedina', N'docpass08', 8, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'FrancoCuello', N'3333', 0, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'Jpereyra', N'docpass04', 4, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'JuBenitez', N'docpass11', 11, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'Lfernandez', N'docpass01', 1, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'LunaT', N'docpass14', 14, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'LuVegas', N'docpass12', 12, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'Mgomez', N'docpass02', 2, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'MicaCastro', N'docpass13', 13, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'Nramos', N'docpass05', 5, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'PabloPoliserpi', N'1111', 0, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'RodrigoMeren', N'4444', 0, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'SolHerrera', N'docpass15', 15, 0)
INSERT [dbo].[Usuarios] ([Usuario], [Password], [Legajo], [Eliminado]) VALUES (N'TomasMartinez', N'2222', 0, 0)
GO
ALTER TABLE [dbo].[Dias] ADD  DEFAULT ((0)) FOR [Eliminado]
GO
ALTER TABLE [dbo].[Especialidades] ADD  DEFAULT ((0)) FOR [Eliminado]
GO
ALTER TABLE [dbo].[Horarios] ADD  DEFAULT ((0)) FOR [Eliminado]
GO
ALTER TABLE [dbo].[HorariosMedicos] ADD  DEFAULT ((0)) FOR [Eliminado]
GO
ALTER TABLE [dbo].[Localidades] ADD  DEFAULT ((0)) FOR [Eliminado]
GO
ALTER TABLE [dbo].[Medicos] ADD  DEFAULT ((0)) FOR [Eliminado]
GO
ALTER TABLE [dbo].[Nacionalidades] ADD  DEFAULT ((0)) FOR [Eliminado]
GO
ALTER TABLE [dbo].[Pacientes] ADD  DEFAULT ((0)) FOR [Eliminado]
GO
ALTER TABLE [dbo].[Provincias] ADD  DEFAULT ((0)) FOR [Eliminado]
GO
ALTER TABLE [dbo].[Turnos] ADD  DEFAULT ((0)) FOR [Eliminado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  DEFAULT ((0)) FOR [Eliminado]
GO
ALTER TABLE [dbo].[HorariosMedicos]  WITH CHECK ADD FOREIGN KEY([IdDia])
REFERENCES [dbo].[Dias] ([Id])
GO
ALTER TABLE [dbo].[HorariosMedicos]  WITH CHECK ADD FOREIGN KEY([Legajo])
REFERENCES [dbo].[Medicos] ([Legajo])
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincias] ([Id])
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD FOREIGN KEY([IdProvincia], [IdLocalidad])
REFERENCES [dbo].[Localidades] ([IdProvincia], [Id])
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD FOREIGN KEY([IdEspecialidad])
REFERENCES [dbo].[Especialidades] ([Id])
GO
ALTER TABLE [dbo].[Medicos]  WITH CHECK ADD FOREIGN KEY([IdNacionalidad])
REFERENCES [dbo].[Nacionalidades] ([Id])
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD FOREIGN KEY([IdProvincia], [IdLocalidad])
REFERENCES [dbo].[Localidades] ([IdProvincia], [Id])
GO
ALTER TABLE [dbo].[Pacientes]  WITH CHECK ADD FOREIGN KEY([IdNacionalidad])
REFERENCES [dbo].[Nacionalidades] ([Id])
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD FOREIGN KEY([DniPaciente])
REFERENCES [dbo].[Pacientes] ([Dni])
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD FOREIGN KEY([IdHorario])
REFERENCES [dbo].[Horarios] ([Id])
GO
ALTER TABLE [dbo].[Turnos]  WITH CHECK ADD FOREIGN KEY([LegajoMedico])
REFERENCES [dbo].[Medicos] ([Legajo])
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([Legajo])
REFERENCES [dbo].[Medicos] ([Legajo])
GO
USE [master]
GO
ALTER DATABASE [ClinicaDB] SET  READ_WRITE 
GO
