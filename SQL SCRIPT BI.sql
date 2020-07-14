
USE [GD1C2020]
GO
/****** Object:  Table [LOS_DATEROS].[ciudad]    Script Date: 06/06/2020 19:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--create procedure clientesVentasHabitacion
--AS
--begin

--Select c.ID_CLIENTE, c.CLIENTE_NOMBRE,c.CLIENTE_APELLIDO,MONTH(com.COMPRA_FECHA)as "Mes",Year(com.COMPRA_FECHA), SUM(h.HABITACION_PRECIO*es.ESTADIA_CANTIDAD_NOCHES) AS "Total vendido por habitaciones" 
--from Los_dateros.cliente c join 
--	LOS_DATEROS.factura f on f.id_cliente = c.ID_CLIENTE and f.id_cliente != 1 join
--	LOS_DATEROS.compra com	on f.compra_Numero = com.COMPRA_NUMERO and com.ID_COMPRA != 1 join 
--	LOS_DATEROS.estadia es	on es.ID_ESTADIA = com.ID_ESTADIA and es.ID_ESTADIA != 1 join
--	LOS_DATEROS.habitacion h on h.ID_HABITACION = es.id_habitacion and h.ID_HABITACION != 1
--	group by c.ID_CLIENTE,c.CLIENTE_NOMBRE,c.CLIENTE_APELLIDO
--	order by 5 desc
--end
--go

--go
--create Procedure ClientesVentasPasajes
--as
--begin 
--SELECT c.ID_CLIENTE, c.CLIENTE_NOMBRE,c.CLIENTE_APELLIDO,MonTH(com.COMPRA_FECHA) as "Mes",Year(com.COMPRA_FECHA), SUM(p.PASAJE_COSTO) as "Total vendido por pasajes" 
--from Los_dateros.cliente c join 
--	LOS_DATEROS.factura f on f.id_cliente = c.ID_CLIENTE and f.id_cliente != 1 join
--	LOS_DATEROS.compra com	on f.compra_Numero = com.COMPRA_NUMERO and com.ID_COMPRA != 1 join
--	Los_Dateros.butacas b on b.id_butaca = com.ID_BUTACA and b.id_butaca != 1 join
--	LOS_DATEROS.pasajes p on p.id_pasaje = b.id_butaca and p.id_pasaje != 1 
--	group by c.ID_CLIENTE, c.CLIENTE_NOMBRE,c.CLIENTE_APELLIDO, COM.COMPRA_FECHA
--	order by 4 desc
--end
--go

--select DATEDIFF(YEAR,cc.CLIENTE_FECHA_NAC,GETDATE()) from [LOS_DATEROS].cliente cc order by DATEDIFF(YEAR,cc.CLIENTE_FECHA_NAC,GETDATE()) where  cc.CLIENTE_DNI='1138084'

--Select count(1), MONTH(C.COMPRA_FECHA) AS "MES" from LOS_DATEROS.compra C where c.ID_EMPRESA != 1 group by MONTH(C.COMPRA_FECHA) 

------------------ Drops de Procedures y Tablas ------------------

IF OBJECT_ID('datosClientes','P') IS NOT NULL
	DROP PROCEDURE datosClientes

IF OBJECT_ID('datosCiudad','P') IS NOT NULL
	DROP PROCEDURE datosCiudad

IF OBJECT_ID('datosProveedores','P') IS NOT NULL
	DROP PROCEDURE datosProveedores

IF OBJECT_ID('datosTiempo','P') IS NOT NULL
	DROP PROCEDURE datosTiempo

IF OBJECT_ID('datosTipoHabitacion','P') IS NOT NULL
	DROP PROCEDURE datosTipoHabitacion

IF OBJECT_ID('datosAvion','P') IS NOT NULL
	DROP PROCEDURE datosAvion

IF OBJECT_ID('datosHabitacion','P') IS NOT NULL
	DROP PROCEDURE datosHabitacion

IF OBJECT_ID('datosVentaHabitacion','P') IS NOT NULL
	DROP PROCEDURE datosVentaHabitacion

IF OBJECT_ID('LOS_DATEROS.Dimension_Cliente', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Dimension_Cliente]	
			
IF OBJECT_ID('LOS_DATEROS.Dimension_Ciudad', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Dimension_Ciudad]				

IF OBJECT_ID('LOS_DATEROS.Dimension_Proveedores', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Dimension_Proveedores]		
						
IF OBJECT_ID('LOS_DATEROS.Dimension_Tiempo', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Dimension_Tiempo]		

IF OBJECT_ID('LOS_DATEROS.Dimension_TipoHabitaciones', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Dimension_TipoHabitaciones]		

IF OBJECT_ID('LOS_DATEROS.Dimension_Aviones', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Dimension_Aviones]
					
IF OBJECT_ID('LOS_DATEROS.Dimension_Habitacion', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Dimension_Habitacion]			

IF OBJECT_ID('LOS_DATEROS.Hecho_VentaHabitacion', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Hecho_VentaHabitacion]			
go

------------------ Creacion de tablas de dimension de hechos ------------------ 

CREATE TABLE [LOS_DATEROS].[Dimension_Cliente](				
			[ID_CLIENTE] [bigint] not NULL,
			[CLIENTE_DNI] [decimal](18, 0) NULL,
			[CLIENTE_NOMBRE] [nvarchar](255) NULL,
			[CLIENTE_APELLIDO] [nvarchar](255) NULL,
			[EDAD] TINYINT null,
			[CLIENTE_TELEFONO] [int] NULL,
			[CLIENTE_MAIL] [nvarchar](255) NULL
	) ON [PRIMARY]

CREATE TABLE [LOS_DATEROS].[Dimension_Ciudad](				
			[ID_CIUDAD] [bigint] not NULL,
			[NOMBRE_CIUDAD]  [nvarchar](255) NULL
) ON [PRIMARY]

CREATE TABLE [LOS_DATEROS].[Dimension_Proveedores](			
			[ID_EMPRESA] [bigint] not NULL,
			[EMPRESA_RAZON]  [nvarchar](255) NULL
	) ON [PRIMARY]

CREATE TABLE [LOS_DATEROS].[Dimension_Tiempo](				
			[ID_TIEMPO] [bigint] identity(1,1) not NULL,
			[FECHA] [datetime2](3)  NULL,
			[MES] [TINYINT]  NULL,
			[ANIO] smallint  NULL,
			[DIA] [TINYINT] null
	) ON [PRIMARY]

CREATE TABLE [LOS_DATEROS].[Dimension_TipoHabitaciones](	
			[ID_TIPO_HABITACION] [bigint] not NULL,
			[TIPO_HABITACION_DESC] [nvarchar](50)  NULL,
			[TIPO_HABITACION_CODIGO] [decimal](18,0),
			[CANT_CAMAS] [TINYINT] null
	) ON [PRIMARY]

CREATE TABLE [LOS_DATEROS].[Dimension_Aviones](				
			[ID_avion] [bigint] not NULL,
			[Avion_modelo] [nvarchar](50)  NULL,
			[AVION_IDENTIFICADOR][nvarchar](50) null ,
	) ON [PRIMARY]

CREATE TABLE [LOS_DATEROS].[Dimension_Habitacion](			
			[ID_HABITACION] [bigint] not NULL,
			[HABITACION_NUMERO] [decimal](18, 0) NULL,
			[HABITACION_PISO] [decimal](18, 0) NULL,
			[HABITACION_FRENTE] [nvarchar](50) NULL,
			[HABITACION_PRECIO] [decimal](18, 2) NULL,
			[HABITACION_COSTO] [decimal](18, 2) NULL,
			[HABITACION_CAMAS] [TINYINT] NULL,
			[ID_HOTEL][BIGINT] not null
	) ON [PRIMARY]

CREATE TABLE [LOS_DATEROS].[Hecho_VentaHabitacion](			
			[ID_COMPRA] [bigint] identity(1,1) not NULL,
			[ID_CLIENTE] [bigint] not NULL,
			[id_FECHA] [bigint] not null,
			[id_HABITACION] [bigint] not null,
			[dias_Hospedaje] [decimal](18,0) not null,
			[TOTAL_COMPRA] [decimal](18,0) not null
	) ON [PRIMARY]

---------------------------------------------------------------
go
create Function cantCamas (@tipo nvarchar(50)) returns Integer
as
begin 
	if(@tipo = 'Base Simple') return 1
	else if(@tipo = 'Base Doble') return 2
	else if(@tipo = 'Base Triple') return 3
	else if(@tipo = 'Base Cuadruple') return 4
	else if(@tipo = 'King') return 5
	return 0
end

go
---------------------------------------------------------------

------------------ Llenado de tablas de dimension y de hechos ------------------

create Procedure datosClientes
as
begin 

		insert into [LOS_DATEROS].Dimension_Cliente([ID_CLIENTE] ,[CLIENTE_DNI] ,[CLIENTE_NOMBRE] ,	[CLIENTE_APELLIDO] ,[EDAD] ,[CLIENTE_TELEFONO] ,[CLIENTE_MAIL] ) 
		 select
		cc.ID_CLIENTE,
		cc.CLIENTE_DNI,
		cc.CLIENTE_NOMBRE,
		cc.CLIENTE_APELLIDO,
		(select DATEDIFF(YEAR,cc.CLIENTE_FECHA_NAC,GETDATE()) ),
		cc.CLIENTE_TELEFONO,
		cc.CLIENTE_MAIL
		from [LOS_DATEROS].cliente cc  
end
go

create Procedure  datosCiudad
as
begin 

		insert into [LOS_DATEROS].Dimension_Ciudad([ID_CIUDAD] ,[NOMBRE_CIUDAD]) 
		 select
		cc.id_ciudad,
		cc.nombre
		from [LOS_DATEROS].ciudad cc  
end
go

create Procedure  datosProveedores
as
begin 
		insert into [LOS_DATEROS].Dimension_Proveedores([ID_EMPRESA] ,[EMPRESA_RAZON]) 
		 select
		ee.ID_EMPRESA,
		ee.EMPRESA_RAZON_SOCIAL
		from [LOS_DATEROS].empresa ee  
end
go

create Procedure  datosTiempo
as
begin 	
		insert into [LOS_DATEROS].Dimension_Tiempo( FECHA , ANIO, MES, DIA) 
		 select
		dd.COMPRA_FECHA ,
		datepart(year, dd.COMPRA_FECHA),
		DATEPART(MONTH, dd.COMPRA_FECHA),
		DATEPART(DAY, dd.COMPRA_FECHA)
		from (
				select cc.COMPRA_FECHA from [LOS_DATEROS].compra cc group by cc.COMPRA_FECHA order by cc.COMPRA_FECHA offset 0 rows
			) dd
end
go

create Procedure  datosTipoHabitacion 
as
begin 	
		insert into [LOS_DATEROS].Dimension_TipoHabitaciones( ID_TIPO_HABITACION ,TIPO_HABITACION_DESC,TIPO_HABITACION_CODIGO, CANT_CAMAS) 
		 select
		dd.ID_TIPO_HABITACION,
		dd.TIPO_HABITACION_DESC,
		dd.TIPO_HABITACION_CODIGO,
		dbo.cantCamas(dd.tipo_habitacion_desc)
		from (
				select * from [LOS_DATEROS].tipo_habitacion th 
			) dd
end
go

create Procedure  datosAvion 
as
begin 	
		insert into [LOS_DATEROS].Dimension_Aviones( ID_avion ,Avion_modelo,AVION_IDENTIFICADOR) 
		 select
		dd.id_avion,
		dd.AVION_MODELO,
		dd.AVION_IDENTIFICADOR
		from (
				select * from [LOS_DATEROS].avion 
			) dd
end
go

create Procedure  datosHabitacion 
as
begin 	
		insert into [LOS_DATEROS].Dimension_Habitacion( ID_HABITACION ,HABITACION_NUMERO,HABITACION_PISO,HABITACION_FRENTE,HABITACION_PRECIO,HABITACION_COSTO,HABITACION_CAMAS,ID_HOTEL) 
		 select
		dd.ID_HABITACION,
		dd.HABITACION_NUMERO,
		dd.HABITACION_PISO,
		dd.HABITACION_FRENTE,
		dd.HABITACION_PRECIO,
		dd.HABITACION_COSTO,
		dd.CANT_CAMAS,
		dd.id_hotel
		from (
				select h.ID_HABITACION,h.HABITACION_NUMERO,h.HABITACION_PISO,h.HABITACION_FRENTE,h.HABITACION_PreciO,h.HABITACION_COSTO,t.CANT_CAMAS,h.id_hotel from [LOS_DATEROS].habitacion h join LOS_DATEROS.Dimension_TipoHabitaciones t on h.id_tipo_habitacion = t.ID_TIPO_HABITACION
			) dd
end
go

create Procedure  datosVentaHabitacion 
as
begin 	
		insert into [LOS_DATEROS].Hecho_VentaHabitacion( ID_Cliente,id_FECHA,id_Habitacion,dias_Hospedaje,TOTAL_COMPRA) 
		 select
		dd.cliente,
		dd.fecha,
		dd.ID_HABITACION,
		dd.ESTADIA_CANTIDAD_NOCHES,
		dd.total
		
		from (
				Select (Select cli.ID_CLIENTE from Los_dateros.Dimension_cliente cli where c.ID_CLIENTE = cli.ID_CLIENTE) as 'cliente',
					   (Select ti.ID_TIEMPO from LOS_DATEROS.Dimension_Tiempo ti where com.COMPRA_FECHA = ti.FECHA) as 'fecha', 
					   h.ID_HABITACION, es.ESTADIA_CANTIDAD_NOCHES,HABITACION_PRECIO*es.ESTADIA_CANTIDAD_NOCHES as 'total'
					from Los_dateros.cliente c join 
						LOS_DATEROS.factura f on f.id_cliente = c.ID_CLIENTE and f.id_cliente != 1 join
						LOS_DATEROS.compra com	on f.id_compra = com.COMPRA_NUMERO and com.ID_COMPRA != 1 join 
						LOS_DATEROS.estadia es	on es.ID_ESTADIA = com.ID_ESTADIA and es.ID_ESTADIA != 1 join
						LOS_DATEROS.habitacion h on h.ID_HABITACION = es.id_habitacion and h.ID_HABITACION != 1
						group by c.ID_CLIENTE,COMPRA_FECHA,h.ID_HABITACION,es.ESTADIA_CANTIDAD_NOCHES,h.HABITACION_COSTO
			) dd
end
go

------------------ Ejecucion de los procedures anteriores ------------------
	
	exec datosCiudad
	exec datosClientes
	exec datosProveedores
	exec datosTiempo
	exec datosTipoHabitacion
	exec datosAvion
	exec datosHabitacion
	exec datosVentaHabitacion


