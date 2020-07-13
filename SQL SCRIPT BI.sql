
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
Create procedure clientesVentasHabitacion
AS
begin

Select c.ID_CLIENTE, c.CLIENTE_NOMBRE,c.CLIENTE_APELLIDO,MONTH(com.COMPRA_FECHA)as "Mes",Year(com.COMPRA_FECHA), SUM(h.HABITACION_PRECIO*es.ESTADIA_CANTIDAD_NOCHES) AS "Total vendido por habitaciones" 
from Los_dateros.cliente c join 
	LOS_DATEROS.factura f on f.id_cliente = c.ID_CLIENTE and f.id_cliente != 1 join
	LOS_DATEROS.compra com	on f.id_compra = com.COMPRA_NUMERO and com.ID_COMPRA != 1 join 
	LOS_DATEROS.estadia es	on es.ID_ESTADIA = com.ID_ESTADIA and es.ID_ESTADIA != 1 join
	LOS_DATEROS.habitacion h on h.ID_HABITACION = es.id_habitacion and h.ID_HABITACION != 1
	group by c.ID_CLIENTE,c.CLIENTE_NOMBRE,c.CLIENTE_APELLIDO
	order by 5 desc
end
go

go
create Procedure ClientesVentasPasajes
as
begin 
SELECT c.ID_CLIENTE, c.CLIENTE_NOMBRE,c.CLIENTE_APELLIDO,MonTH(com.COMPRA_FECHA) as "Mes",Year(com.COMPRA_FECHA), SUM(p.PASAJE_COSTO) as "Total vendido por pasajes" 
from Los_dateros.cliente c join 
	LOS_DATEROS.factura f on f.id_cliente = c.ID_CLIENTE and f.id_cliente != 1 join
	LOS_DATEROS.compra com	on f.id_compra = com.COMPRA_NUMERO and com.ID_COMPRA != 1 join
	Los_Dateros.butacas b on b.id_butaca = com.ID_BUTACA and b.id_butaca != 1 join
	LOS_DATEROS.pasajes p on p.id_pasaje = b.id_butaca and p.id_pasaje != 1 
	group by c.ID_CLIENTE, c.CLIENTE_NOMBRE,c.CLIENTE_APELLIDO, COM.COMPRA_FECHA
	order by 4 desc
end
go

CREATE TABLE [LOS_DATEROS].[DimVentasAClientes](				
			[ID_CLIENTE] [bigint] NULL,
			[CLIENTE_NOMBRE] [nvarchar](255) NULL,
			[CLIENTE_APELLIDO] [nvarchar](255) NULL,
			[VENTAS_PASAJES] [int] NULL,
			[VENTAS_HABITACIONES] [int] NULL,
			[MES] [int] NULL,
			[AÑO] [int] NULL
		) ON [PRIMARY]	

-- lo que quiero hacer es unir los dos procedures en esa "dimension"

exec clientesVentasHabitacion
exec ClientesVentasPasajes


--Select count(1), MONTH(C.COMPRA_FECHA) AS "MES" from LOS_DATEROS.compra C where c.ID_EMPRESA != 1 group by MONTH(C.COMPRA_FECHA) 