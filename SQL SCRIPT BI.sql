
USE [GD1C2020]
GO
/****** Object:  Table [LOS_DATEROS].[ciudad]    Script Date: 06/06/2020 19:39:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- c.ID_CLIENTE, c.CLIENTE_DNI
IF OBJECT_ID('clientesVentasHabitacion','P') IS NOT NULL
	DROP PROCEDURE clientesVentasHabitacion

IF OBJECT_ID('clientesVentasPasajes','P') IS NOT NULL
	DROP PROCEDURE clientesVentasPasajes

go

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

--IF OBJECT_ID('LOS_DATEROS.ciudad', 'U') IS NOT NULL
--			DROP TABLE LOS_DATEROS.[DimVentasAClientes]

--CREATE TABLE [LOS_DATEROS].[DimVentasAClientes](				
--			[ID_CLIENTE] [bigint] NULL,
--			[CLIENTE_NOMBRE] [nvarchar](255) NULL,
--			[CLIENTE_APELLIDO] [nvarchar](255) NULL,
--			[VENTAS_PASAJES] [int] NULL,
--			[VENTAS_HABITACIONES] [int] NULL,
--			[MES] [int] NULL,
--			[AÑO] [int] NULL
--		) ON [PRIMARY]	

-- lo que quiero hacer es unir los dos procedures en esa "dimension"

	--		exec clientesVentasHabitacion
	--		exec ClientesVentasPasajes


--select DATEDIFF(YEAR,cc.CLIENTE_FECHA_NAC,GETDATE()) from [LOS_DATEROS].cliente cc order by DATEDIFF(YEAR,cc.CLIENTE_FECHA_NAC,GETDATE()) where  cc.CLIENTE_DNI='1138084'

--select * from [LOS_DATEROS].cliente cc 


--Select count(1), MONTH(C.COMPRA_FECHA) AS "MES" from LOS_DATEROS.compra C where c.ID_EMPRESA != 1 group by MONTH(C.COMPRA_FECHA) 

IF OBJECT_ID('datosClientes','P') IS NOT NULL
	DROP PROCEDURE datosClientes

IF OBJECT_ID('datosCiudad','P') IS NOT NULL
	DROP PROCEDURE datosCiudad

IF OBJECT_ID('datosEmpresa','P') IS NOT NULL
	DROP PROCEDURE datosEmpresa




IF OBJECT_ID('LOS_DATEROS.Dimension_Cliente', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Dimension_Cliente]	
			

IF OBJECT_ID('LOS_DATEROS.Dimension_Ciudad', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Dimension_Ciudad]	
			

IF OBJECT_ID('LOS_DATEROS.Dimension_Empresa', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.[Dimension_Empresa]		
go

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

	
CREATE TABLE [LOS_DATEROS].[Dimension_Empresa](				
			[ID_EMPRESA] [bigint] not NULL,
			[EMPRESA_RAZON]  [nvarchar](255) NULL
	) ON [PRIMARY]

go

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

create Procedure  datosEmpresa
as
begin 

		insert into [LOS_DATEROS].Dimension_Empresa([ID_EMPRESA] ,[EMPRESA_RAZON]) 
		 select
		ee.ID_EMPRESA,
		ee.EMPRESA_RAZON_SOCIAL
		from [LOS_DATEROS].empresa ee  
end
go

	exec datosCiudad
	exec datosClientes
	exec datosEmpresa

--		select * from [LOS_DATEROS].Dimension_Cliente


--  select * from [LOS_DATEROS].Dimension_Empresa













