USE [master]
GO
/****** Object:  Database [kalum_test]    Script Date: 09/07/2022 12:19:27 ******/
CREATE DATABASE [kalum_test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kalum_test', FILENAME = N'/var/opt/mssql/data/kalum_test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kalum_test_log', FILENAME = N'/var/opt/mssql/data/kalum_test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [kalum_test] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kalum_test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kalum_test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kalum_test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kalum_test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kalum_test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kalum_test] SET ARITHABORT OFF 
GO
ALTER DATABASE [kalum_test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [kalum_test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kalum_test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kalum_test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kalum_test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kalum_test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kalum_test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kalum_test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kalum_test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kalum_test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [kalum_test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kalum_test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kalum_test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kalum_test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kalum_test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kalum_test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kalum_test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kalum_test] SET RECOVERY FULL 
GO
ALTER DATABASE [kalum_test] SET  MULTI_USER 
GO
ALTER DATABASE [kalum_test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kalum_test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kalum_test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kalum_test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kalum_test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kalum_test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'kalum_test', N'ON'
GO
ALTER DATABASE [kalum_test] SET QUERY_STORE = OFF
GO
USE [kalum_test]
GO
/****** Object:  UserDefinedFunction [dbo].[LPAD]    Script Date: 09/07/2022 12:19:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[LPAD](
	@string varchar(max), 
	@length int, 
	@pad char
)
returns varchar(max)
as
begin
	return replicate(@pad, @length -len(@string)) + @string
end
GO
/****** Object:  UserDefinedFunction [dbo].[RPAD]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[RPAD](
	@string varchar(max), 
	@length int, 
	@pad char
)
returns varchar(max)
as
begin
	return @string + replicate(@pad, @length -len(@string))
end
GO
/****** Object:  Table [dbo].[ExamenAdmision]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamenAdmision](
	[ExamenId] [varchar](128) NOT NULL,
	[FechaExamen] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarreraTecnica]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarreraTecnica](
	[CarreraId] [varchar](128) NOT NULL,
	[Nombre] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CarreraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Aspirante]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aspirante](
	[NoExpediente] [varchar](128) NOT NULL,
	[Apellidos] [varchar](128) NOT NULL,
	[Nombres] [varchar](128) NOT NULL,
	[Direccion] [varchar](128) NOT NULL,
	[Telefono] [varchar](64) NOT NULL,
	[Email] [varchar](128) NOT NULL,
	[Estatus] [varchar](32) NULL,
	[CarreraId] [varchar](128) NOT NULL,
	[ExamenId] [varchar](128) NOT NULL,
	[JornadaId] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NoExpediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_ListarAspirantesPorFechaExamen]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_ListarAspirantesPorFechaExamen]
as
select
NoExpediente,
Apellidos,
Nombres,
FechaExamen,
CarreraTecnica,
Estatus
from Aspirante a
inner join ExamenAdmision ea on a.ExamenId = ea.ExamenId
inner join CarreraTecnica ct on a.CarreraId = ct.CarreraId
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[Carne] [varchar](8) NOT NULL,
	[Apellidos] [varchar](128) NOT NULL,
	[Nombres] [varchar](128) NOT NULL,
	[Direccion] [varchar](128) NOT NULL,
	[Telefono] [varchar](64) NOT NULL,
	[Email] [varchar](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Carne] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[CargoId] [varchar](128) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
	[Prefijo] [varchar](64) NOT NULL,
	[Monto] [decimal](10, 2) NULL,
	[GeneraMora] [bit] NULL,
	[PorcentajeMora] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaxCobrar]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaxCobrar](
	[NombreCargo] [varchar](128) NOT NULL,
	[Anio] [varchar](4) NOT NULL,
	[Carne] [varchar](8) NOT NULL,
	[CargoId] [varchar](128) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
	[FechaCargo] [datetime] NOT NULL,
	[FechaAplica] [datetime] NOT NULL,
	[Monto] [decimal](10, 2) NULL,
	[Mora] [decimal](10, 2) NULL,
	[Descuento] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[NombreCargo] ASC,
	[Anio] ASC,
	[Carne] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[InscripcionId] [varchar](128) NOT NULL,
	[Carne] [varchar](8) NOT NULL,
	[CarreraId] [varchar](128) NOT NULL,
	[JornadaId] [varchar](128) NOT NULL,
	[Ciclo] [varchar](4) NOT NULL,
	[FechaInscripcion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InscripcionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InscripcionPago]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InscripcionPago](
	[BoletaPago] [varchar](128) NOT NULL,
	[NoExpediente] [varchar](128) NOT NULL,
	[Anio] [varchar](4) NOT NULL,
	[FechaPago] [datetime] NOT NULL,
	[Monto] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[BoletaPago] ASC,
	[NoExpediente] ASC,
	[Anio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InversionCarreraTecnica]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InversionCarreraTecnica](
	[InversionId] [varchar](128) NOT NULL,
	[CarreraId] [varchar](128) NOT NULL,
	[MontoInscripcion] [decimal](10, 2) NULL,
	[NumeroPagos] [int] NULL,
	[MontoPago] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[InversionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jornada]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jornada](
	[JornadaId] [varchar](128) NOT NULL,
	[Nombre] [varchar](2) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[JornadaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResultadoExamenAdmision]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultadoExamenAdmision](
	[NoExpediente] [varchar](128) NOT NULL,
	[Anio] [varchar](4) NOT NULL,
	[Descripcion] [varchar](128) NOT NULL,
	[Nota] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NoExpediente] ASC,
	[Anio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Aspirante] ADD  DEFAULT ('NO ASIGNADO') FOR [Estatus]
GO
ALTER TABLE [dbo].[Cargo] ADD  DEFAULT ((0)) FOR [Monto]
GO
ALTER TABLE [dbo].[Cargo] ADD  DEFAULT ((1)) FOR [GeneraMora]
GO
ALTER TABLE [dbo].[Cargo] ADD  DEFAULT ((0)) FOR [PorcentajeMora]
GO
ALTER TABLE [dbo].[CuentaxCobrar] ADD  DEFAULT ((0)) FOR [Monto]
GO
ALTER TABLE [dbo].[CuentaxCobrar] ADD  DEFAULT ((0)) FOR [Mora]
GO
ALTER TABLE [dbo].[CuentaxCobrar] ADD  DEFAULT ((0)) FOR [Descuento]
GO
ALTER TABLE [dbo].[InscripcionPago] ADD  DEFAULT ((0)) FOR [Monto]
GO
ALTER TABLE [dbo].[InversionCarreraTecnica] ADD  DEFAULT ((0)) FOR [MontoInscripcion]
GO
ALTER TABLE [dbo].[InversionCarreraTecnica] ADD  DEFAULT ((0)) FOR [NumeroPagos]
GO
ALTER TABLE [dbo].[InversionCarreraTecnica] ADD  DEFAULT ((0)) FOR [MontoPago]
GO
ALTER TABLE [dbo].[ResultadoExamenAdmision] ADD  DEFAULT ((0)) FOR [Nota]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_ASPIRANTE_CARRERA_TECNICA] FOREIGN KEY([CarreraId])
REFERENCES [dbo].[CarreraTecnica] ([CarreraId])
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_ASPIRANTE_CARRERA_TECNICA]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_ASPIRANTE_EXAMEN_ADMISION] FOREIGN KEY([ExamenId])
REFERENCES [dbo].[ExamenAdmision] ([ExamenId])
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_ASPIRANTE_EXAMEN_ADMISION]
GO
ALTER TABLE [dbo].[Aspirante]  WITH CHECK ADD  CONSTRAINT [FK_ASPIRANTE_JORNADA] FOREIGN KEY([JornadaId])
REFERENCES [dbo].[Jornada] ([JornadaId])
GO
ALTER TABLE [dbo].[Aspirante] CHECK CONSTRAINT [FK_ASPIRANTE_JORNADA]
GO
ALTER TABLE [dbo].[CuentaxCobrar]  WITH CHECK ADD  CONSTRAINT [FK_ALUMNO_CUENTA_X_COBRAR] FOREIGN KEY([Carne])
REFERENCES [dbo].[Alumno] ([Carne])
GO
ALTER TABLE [dbo].[CuentaxCobrar] CHECK CONSTRAINT [FK_ALUMNO_CUENTA_X_COBRAR]
GO
ALTER TABLE [dbo].[CuentaxCobrar]  WITH CHECK ADD  CONSTRAINT [FK_CARGO_CUENTA_X_COBRAR] FOREIGN KEY([CargoId])
REFERENCES [dbo].[Cargo] ([CargoId])
GO
ALTER TABLE [dbo].[CuentaxCobrar] CHECK CONSTRAINT [FK_CARGO_CUENTA_X_COBRAR]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_ALUMNO_INSCRIPCION] FOREIGN KEY([Carne])
REFERENCES [dbo].[Alumno] ([Carne])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_ALUMNO_INSCRIPCION]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_CARRERA_TECNICA_INSCRIPCION] FOREIGN KEY([CarreraId])
REFERENCES [dbo].[CarreraTecnica] ([CarreraId])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_CARRERA_TECNICA_INSCRIPCION]
GO
ALTER TABLE [dbo].[Inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_JORNADA_INSCRIPCION] FOREIGN KEY([JornadaId])
REFERENCES [dbo].[Jornada] ([JornadaId])
GO
ALTER TABLE [dbo].[Inscripcion] CHECK CONSTRAINT [FK_JORNADA_INSCRIPCION]
GO
ALTER TABLE [dbo].[InscripcionPago]  WITH CHECK ADD  CONSTRAINT [FK_PAGO_INSCRIPCION_ASPIRANTE] FOREIGN KEY([NoExpediente])
REFERENCES [dbo].[Aspirante] ([NoExpediente])
GO
ALTER TABLE [dbo].[InscripcionPago] CHECK CONSTRAINT [FK_PAGO_INSCRIPCION_ASPIRANTE]
GO
ALTER TABLE [dbo].[InversionCarreraTecnica]  WITH CHECK ADD  CONSTRAINT [FK_INVERSION_CARRERA_TECNICA_CARRERA_TECNICA] FOREIGN KEY([CarreraId])
REFERENCES [dbo].[CarreraTecnica] ([CarreraId])
GO
ALTER TABLE [dbo].[InversionCarreraTecnica] CHECK CONSTRAINT [FK_INVERSION_CARRERA_TECNICA_CARRERA_TECNICA]
GO
ALTER TABLE [dbo].[ResultadoExamenAdmision]  WITH CHECK ADD  CONSTRAINT [FK_RESULTADO_EXAMEN_ADMISION_ASPIRANTE] FOREIGN KEY([NoExpediente])
REFERENCES [dbo].[Aspirante] ([NoExpediente])
GO
ALTER TABLE [dbo].[ResultadoExamenAdmision] CHECK CONSTRAINT [FK_RESULTADO_EXAMEN_ADMISION_ASPIRANTE]
GO
/****** Object:  StoredProcedure [dbo].[sp_EnrollmentProcess]    Script Date: 09/07/2022 12:19:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_EnrollmentProcess]    
@NoExpediente varchar(112),    
@Ciclo varchar(4),    
@MesInicioPago int,    
@CarreraId varchar(128)    
as    
begin    
	declare @Apellidos varchar(128)    
	declare @Nombres varchar(128)    
	declare @Direccion varchar(128)    
	declare @Telefono varchar(64)    
	declare @Email varchar(64)    
	declare @JornadaId varchar(128)    
	-- Variables para generar número de carné    
	declare @Exists int    
	declare @Carne varchar(12)    
	-- Variables para el proceso de pago    
	declare @MontoInscripcion numeric(10,2)    
	declare @NumeroPagos int    
	declare @MontoPago numeric(10,2)    
	declare @Descripcion varchar(128)    
	declare @Prefijo varchar(6)    
	declare @CargoId varchar(128)    
	declare @Monto numeric(10,2)    
	declare @CorrelativoPagos int    
    
	--Inicio transacción    
	begin transaction    
	begin try    
		select @Apellidos = Apellidos, @Nombres = Nombres, @Direccion = Direccion, @Telefono = Telefono, @Email = Email, @JornadaId = JornadaId    
		from Aspirante where NoExpediente = @NoExpediente    
    
		set @Exists = (select top 1 a.Carne from Alumno a where SUBSTRING(a.Carne,1,4) = @Ciclo order by a.Carne desc)    
		if @Exists is null    
		begin    
		set @Carne = (@Ciclo * 10000) + 1    
		end    
		else    
		begin    
		set @Carne = (select top 1 a.Carne from Alumno a where SUBSTRING(a.Carne,1,4) = @Ciclo order by a.Carne desc) + 1    
		end    
		--Proceso inscripción    
		insert into Alumno values (@Carne, @Apellidos, @Nombres, @Direccion, @Telefono, CONCAT(@Carne,@Email) )    
		insert into Inscripcion values (NEWID(), @Carne, @CarreraId, @JornadaId, @Ciclo, GETDATE())    
		update Aspirante set Estatus = 'INSCRITO CICLO ' + @Ciclo where NoExpediente = @NoExpediente    
		--proceso de cargos    
		--cargo de inscripcion    
		select @MontoInscripcion = ict.MontoInscripcion, @NumeroPagos = ict.NumeroPagos, @MontoPago = ict.MontoPago    
		from InversionCarreraTecnica ict    
		where ict.CarreraId = @CarreraId    
      
		select @CargoId = CargoId, @Descripcion = c2.Descripcion     
		from Cargo c2     
		where c2.CargoId = 'DB684F6D-01D1-4063-B5AA-D17440F12B1C'    
    
		insert into CuentaxCobrar     
		values    
		(CONCAT(@Prefijo,SUBSTRING(@Ciclo,3,2),dbo.LPAD('1',2,'0')), @Ciclo, @Carne, @CargoId, @Descripcion, GETDATE(), GETDATE(), @MontoInscripcion, 0, 0)    
      
		--cargo pago de carne    
		select @CargoId = CargoId, @Descripcion = Descripcion, @Prefijo = Prefijo, @Monto = Monto    
		from Cargo c2     
		where c2.CargoId = '5486F72F-0792-47CE-80D2-F6C4213B7F5B'    
    
		insert into CuentaxCobrar     
		values    
		(CONCAT(@Prefijo,SUBSTRING(@Ciclo,3,2),dbo.LPAD('1',2,'0')), @Ciclo, @Carne, @CargoId, @Descripcion, GETDATE(), GETDATE(), @Monto, 0, 0)    
    
		--cargos mensuales    
		set @CorrelativoPagos = 1    
		select @CargoId = c2.CargoId, @Descripcion = c2.Descripcion, @Prefijo = c2.Prefijo, @MontoPago = Monto    
		from Cargo c2     
		where c2.CargoId = '60E270F8-F600-40A1-B283-F05D7881619F'    
    
		while @CorrelativoPagos <= @NumeroPagos    
		begin    
		insert into CuentaxCobrar     
		values    
		(CONCAT(@Prefijo,SUBSTRING(@Ciclo,3,2),dbo.LPAD(@CorrelativoPagos,2,'0')), @Ciclo, @Carne, @CargoId, @Descripcion, GETDATE(), CONCAT(@Ciclo,'-',dbo.LPAD(@MesInicioPago,2,'0'),'-','05'), @MontoPago, 0, 0)    
    
		set @MesInicioPago = @MesInicioPago + 1    
		set @CorrelativoPagos = @CorrelativoPagos + 1    
		end    
    
		commit transaction    
		select 'TRANSACTION SUCCESS' as status, @Carne as carne    
	end try    
	begin catch    
		SELECT    
		ERROR_NUMBER() AS ErrorNumber    
		,ERROR_SEVERITY() AS ErrorSeverity    
		,ERROR_STATE() AS ErrorState    
		,ERROR_PROCEDURE() AS ErrorProcedure    
		,ERROR_LINE() AS ErrorLine    
		,ERROR_MESSAGE() AS ErrorMessage;    
		rollback transaction    
		select 'TRANSACTION ERROR' as status    
	end catch    
    
end    
GO
USE [master]
GO
ALTER DATABASE [kalum_test] SET  READ_WRITE 
GO
