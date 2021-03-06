
USE [GD1C2020]
GO
/****** Object:  Table [LOS_DATEROS].[ciudad]    Script Date: 06/06/2020 19:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 

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

IF OBJECT_ID('datosEmpresa','P') IS NOT NULL
	DROP PROCEDURE datosEmpresa

IF OBJECT_ID('datosPasaje','P') IS NOT NULL
	DROP PROCEDURE datosPasaje

IF OBJECT_ID('datosVentaHabitacion','P') IS NOT NULL
	DROP PROCEDURE datosVentaHabitacion

IF OBJECT_ID('datosCompraHabitacion','P') IS NOT NULL
	DROP PROCEDURE datosCompraHabitacion

IF OBJECT_ID('datosVentaPasaje','P') IS NOT NULL
	DROP PROCEDURE datosVentaPasaje

IF OBJECT_ID('datosCompraPasaje','P') IS NOT NULL
	DROP PROCEDURE datosCompraPasaje

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

IF OBJECT_ID('LOS_DATEROS.Dimension_Empresa', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Dimension_Empresa]			

IF OBJECT_ID('LOS_DATEROS.Dimension_Pasaje', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Dimension_Pasaje]			


IF OBJECT_ID('LOS_DATEROS.Hecho_VentaHabitacion', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Hecho_VentaHabitacion]			

IF OBJECT_ID('LOS_DATEROS.Hecho_CompraHabitacion', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Hecho_CompraHabitacion]	
		
IF OBJECT_ID('LOS_DATEROS.Hecho_VentaPasaje', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Hecho_VentaPasaje]						
			
IF OBJECT_ID('LOS_DATEROS.Hecho_CompraPasaje', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Hecho_CompraPasaje]						
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
			[HABITACION_NUMERO] [decimal](18, 0)  not NULL,
			[HABITACION_PISO] [decimal](18, 0) not NULL,
			[HABITACION_FRENTE] [nvarchar](50) not NULL,
			[HABITACION_PRECIO] [decimal](18, 2) not NULL,
			[HABITACION_COSTO] [decimal](18, 2) not NULL,
			[HABITACION_CAMAS] [TINYINT] not NULL,
			[ID_HOTEL][BIGINT] not null
	) ON [PRIMARY]

CREATE TABLE [LOS_DATEROS].[Dimension_Empresa](				
			[ID_Empresa] [bigint] not NULL,
			[EMPRESA_RAZON_SOCIAL] [nvarchar](255) not NULL,
	) ON [PRIMARY]

CREATE TABLE [LOS_DATEROS].[Dimension_Pasaje](				
			[id_pasaje] [bigint] NOT NULL,
			[PASAJE_CODIGO] [decimal](18, 0) NOT NULL,
			[PASAJE_PRECIO] [decimal](18, 2) NOT NULL,
			[PASAJE_COSTO] [decimal](18, 2) NOT NULL,
			[ID_VUELO] [decimal](19, 0) NOT NULL,
			[Cantidad_Butacas] [TinyINT] NOT NULL,
			[ID_AVION] [bigint] NOT NULL
	) ON [PRIMARY]

CREATE TABLE [LOS_DATEROS].[Hecho_VentaHabitacion](			
			[ID_COMPRA] [bigint] identity(1,1) not NULL,
			[ID_CLIENTE] [bigint] not NULL,
			[id_FECHA] [bigint] not null,
			[id_HABITACION] [bigint] not null,
			[dias_Hospedaje] [decimal](18,0) not null,
			[TOTAL_VENTA] [decimal](18,0) not null
	) ON [PRIMARY]

CREATE TABLE [LOS_DATEROS].[Hecho_CompraHabitacion](		
			[ID_COMPRA] [bigint] identity(1,1) not NULL,
			[ID_EMPRESA] [bigint] NULL,
			[id_FECHA] [bigint] not null,
			[id_HABITACION] [bigint] not null,
			[dias_Hospedaje] [decimal](18,0) not null,
			[TOTAL_COMPRA] [decimal](18,0) not null
	) ON [PRIMARY]

CREATE TABLE [LOS_DATEROS].[Hecho_VentaPasaje](			
			[ID_COMPRA] [bigint] identity(1,1) not NULL,
			[ID_CLIENTE] [bigint] not NULL,
			[id_FECHA] [bigint] not null,
			[id_pasaje] [bigint] not null,
			[TOTAL_COMPRA] [decimal](18,0) not null
	) ON [PRIMARY]


CREATE TABLE [LOS_DATEROS].[Hecho_CompraPasaje](		
			[ID_COMPRA] [bigint] identity(1,1) not NULL,
			[ID_EMPRESA] [bigint] not NULL,
			[id_FECHA] [bigint] not null,
			[id_pasaje] [bigint] not null,
			[TOTAL_COMPRA] [decimal](18,0) not null
	) ON [PRIMARY]
go

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

------------------ Procedures de llenado de tablas de dimension y de hechos ------------------

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
				select h.ID_HABITACION,h.HABITACION_NUMERO,h.HABITACION_PISO,h.HABITACION_FRENTE,h.HABITACION_PreciO,h.HABITACION_COSTO,t.CANT_CAMAS,h.id_hotel from [LOS_DATEROS].habitacion h join LOS_DATEROS.Dimension_TipoHabitaciones t on h.id_tipo_habitacion = t.ID_TIPO_HABITACION where h.ID_HABITACION != 1
			) dd
end
go

create Procedure  datosEmpresa
as
begin 	
		insert into [LOS_DATEROS].Dimension_Empresa( ID_Empresa ,EMPRESA_RAZON_SOCIAL) 
		 select
		dd.ID_Empresa,
		dd.EMPRESA_RAZON_SOCIAL
		from (
				select * from LOS_DATEROS.Dimension_Empresa
			) dd
end
go

create Procedure  datosPasaje 
as
begin 	
		insert into [LOS_DATEROS].Dimension_Pasaje(ID_Pasaje ,PASAJE_CODIGO,PASAJE_PRECIO,PASAJE_COSTO,ID_VUELO,Cantidad_Butacas,ID_AVION) 
		 select
		dd.id_pasaje,
		dd.PASAJE_CODIGO,
		dd.PASAJE_PRECIO,
		dd.PASAJE_COSTO,
		dd.ID_VUELO,
		dd.butacas,
		dd.avion
		from (
				select p.id_pasaje,p.PASAJE_CODIGO,p.PASAJE_PRECIO,p.PASAJE_COSTO,p.ID_VUELO, count(distinct b.BUTACA_NUMERO) as 'butacas',
				(select avi.ID_avion from LOS_DATEROS.Dimension_Aviones avi where avi.AVION_IDENTIFICADOR = a.AVION_IDENTIFICADOR) as 'avion'
				from LOS_DATEROS.pasajes p join LOS_DATEROS.butacas b on b.id_pasaje = p.id_pasaje and b.id_butaca != 1
				join LOS_DATEROS.avion a on a.id_avion = b.id_avion
				where p.id_pasaje != 1
				group by p.id_pasaje,p.PASAJE_CODIGO,p.PASAJE_COSTO,p.ID_VUELO,p.PASAJE_PRECIO,a.AVION_IDENTIFICADOR
				
		) dd
end
go

create Procedure  datosVentaHabitacion 
as
begin 	
		insert into [LOS_DATEROS].Hecho_VentaHabitacion( ID_Cliente,id_FECHA,id_Habitacion,dias_Hospedaje,TOTAL_VENTA) 
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
						group by c.ID_CLIENTE,COMPRA_FECHA,h.ID_HABITACION,es.ESTADIA_CANTIDAD_NOCHES,h.HABITACION_PRECIO
			) dd
end
go

create Procedure  datosCompraHabitacion 
as
begin 	
		insert into [LOS_DATEROS].Hecho_CompraHabitacion(ID_EMPRESA,id_FECHA,id_Habitacion,dias_Hospedaje,TOTAL_COMPRA) 
		 select
		dd.Empresa,
		dd.fecha,
		dd.ID_HABITACION,
		dd.ESTADIA_CANTIDAD_NOCHES,
		dd.total
		
		from (
				Select es.ID_EMPRESA as 'Empresa',
					   (Select ti.ID_TIEMPO from LOS_DATEROS.Dimension_Tiempo ti where com.COMPRA_FECHA = ti.FECHA) as 'fecha', 
					   h.ID_HABITACION, es.ESTADIA_CANTIDAD_NOCHES,HABITACION_COSTO*es.ESTADIA_CANTIDAD_NOCHES as 'total'
		 		from Los_dateros.estadia es join 
						LOS_DATEROS.empresa emp	on es.id_empresa = emp.ID_EMPRESA and es.ID_ESTADIA != 1 join
						LOS_DATEROS.compra com	on es.ID_ESTADIA = com.ID_ESTADIA and com.ID_COMPRA != 1 join 
						LOS_DATEROS.habitacion h on h.ID_HABITACION = es.id_habitacion and h.ID_HABITACION != 1
						where emp.ID_EMPRESA != 1
						group by es.ID_EMPRESA,COMPRA_FECHA,h.ID_HABITACION,es.ESTADIA_CANTIDAD_NOCHES,h.HABITACION_COSTO
			) dd
end
go

create Procedure  datosVentaPasaje --Funca mal :(
as
begin 	
		insert into [LOS_DATEROS].Hecho_VentaPasaje( ID_Cliente,id_FECHA,id_pasaje,TOTAL_COMPRA) 
		 select
		dd.cliente,
		dd.fecha,
		dd.pasaje,
		dd.total
		
		from (
				Select distinct(pa.PASAJE_CODIGO) as 'pasaje',
						c.ID_CLIENTE as 'cliente',
					   (Select ti.ID_TIEMPO from LOS_DATEROS.Dimension_Tiempo ti where com.COMPRA_FECHA = ti.FECHA) as 'fecha',
						pa.PASAJE_Precio as 'total'
				 from Los_dateros.butacas bu join 
						LOS_DATEROS.pasajes pa	on pa.id_pasaje = bu.id_pasaje join
						LOS_DATEROS.compra com	on bu.id_butaca = com.ID_BUTACA join 
						LOS_DATEROS.factura f on f.id_compra = com.COMPRA_NUMERO and f.ID_FACTURA != 1 join
						LOS_DATEROS.cliente c on c.ID_CLIENTE = f.id_cliente 
					where bu.id_butaca != 1
					group by bu.id_butaca, pa.id_pasaje,pa.PASAJE_CODIGO,c.ID_CLIENTE,com.COMPRA_FECHA,pa.PASAJE_PRECIO
					) dd
				
end
go



create Procedure  datosCompraPasaje
as
begin 	
		insert into [LOS_DATEROS].Hecho_CompraPasaje(ID_EMPRESA,id_FECHA,id_pasaje,TOTAL_COMPRA) 
		 select
		dd.Empresa,
		dd.fecha,
		dd.id_pasaje,
		dd.total
		
		from (
				Select distinct pa.PASAJE_CODIGO as 'pasaje', em.ID_EMPRESA as 'Empresa',
				(Select t.ID_TIEMPO from LOS_DATEROS.Dimension_Tiempo t where t.FECHA = com.COMPRA_FECHA) as 'Fecha',
				pa.id_pasaje,pa.PASAJE_COSTO as 'total'
				from Los_dateros.butacas bu join 
						LOS_DATEROS.pasajes pa	on pa.id_pasaje = bu.id_pasaje and pa.id_pasaje != 1 join
						LOS_DATEROS.compra com	on bu.id_butaca = com.ID_BUTACA and com.ID_COMPRA != 1 join
						LOS_DATEROS.empresa em on em.ID_EMPRESA = com.ID_EMPRESA and em.ID_EMPRESA != 1 
						where bu.id_butaca != 1
				
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
	exec datosEmpresa
	exec datosPasaje
	exec datosVentaHabitacion
	exec datosCompraHabitacion
	exec datosCompraPasaje
	
	-- exec datosVentaPasaje No se que le pasa a este que tarda un monton y genera millones de compras literalmente

------------------ Views de ejemplo ------------------
	
go
	create view calculosSobreMeses as
		select Year(t.FECHA) as 'A�o',MONTH(t.FECHA) as 'Mes',SUM(hc.TOTAL_COMPRA)as 'Total compra del mes',
		MAX(hc.Total_compra) 'Maximo de una compra',AVG(hc.Total_compra) 'Promedio de compras', SUM(hv.TOTAL_VENTA) 'Total ventas del mes', Max(hv.TOTAL_VENTA) 'M�xima venta del mes',
		Avg(hv.TOTAL_VENTA) 'Promedio de ventas',sum(hv.TOTAL_VENTA-hc.TOTAL_COMPRA)'Ganancia total', SUM(h.HABITACION_CAMAS*hv.dias_Hospedaje) 'Total de camas vendidas(x noche)', avg(h.HABITACION_CAMAS) 'Promedio camas(x estad�a)'
		from LOS_dateros.Hecho_CompraHabitacion  hc join LOS_DATEROS.Dimension_Tiempo t on hc.id_FECHA = t.ID_TIEMPO join 
		los_dateros.Hecho_VentaHabitacion hv on hc.id_HABITACION = hv.id_HABITACION join
		LOS_DATEROS.Dimension_Habitacion h on h.ID_HABITACION=hv.id_HABITACION
		group by Month(t.FECHA),YEAR(t.FECHA)
		order by 1,2 asc 
go
