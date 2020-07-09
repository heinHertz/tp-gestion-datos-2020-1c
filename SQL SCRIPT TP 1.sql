
		USE [GD1C2020]
		GO
		/****** Object:  Table [LOS_DATEROS].[ciudad]    Script Date: 06/06/2020 19:39:57 ******/
		SET ANSI_NULLS ON
		GO
		SET QUOTED_IDENTIFIER ON
		GO


----------------------------------------------DROP DE TABLES SI EXISTEN---------------------------------------
if exists (select * from sys.schemas where name =  'LOS_DATEROS')
begin
			IF OBJECT_ID('LOS_DATEROS.ciudad', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.ciudad

			IF OBJECT_ID('LOS_DATEROS.avion', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.avion

			IF OBJECT_ID('LOS_DATEROS.butacas', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.butacas
			
			IF OBJECT_ID('LOS_DATEROS.tipo_butacas', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.tipo_butacas
			
			IF OBJECT_ID('LOS_DATEROS.habitacion', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.habitacion
						
			IF OBJECT_ID('LOS_DATEROS.tipo_habitacion', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.tipo_habitacion
		
			IF OBJECT_ID('LOS_DATEROS.compra', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.compra

			IF OBJECT_ID('LOS_DATEROS.tipo_compra', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.tipo_compra

			IF OBJECT_ID('LOS_DATEROS.factura', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.factura

			IF OBJECT_ID('LOS_DATEROS.empresa', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.empresa

			IF OBJECT_ID('LOS_DATEROS.pasajes', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.pasajes

			IF OBJECT_ID('LOS_DATEROS.ruta_aerea', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.ruta_aerea

			IF OBJECT_ID('LOS_DATEROS.vuelo', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.vuelo
			
			IF OBJECT_ID('LOS_DATEROS.hotel', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.hotel
			
			IF OBJECT_ID('LOS_DATEROS.estadia', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.estadia
			
			IF OBJECT_ID('LOS_DATEROS.cliente', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.cliente
			
			IF OBJECT_ID('LOS_DATEROS.sucursal', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.sucursal

------------------------------------------------	DROP AUXILIARES--------------------------
			IF OBJECT_ID('LOS_DATEROS.ciudadBACKUP', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.ciudadBACKUP

			IF OBJECT_ID('LOS_DATEROS.vueloBACKUP', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.vueloBACKUP

			IF OBJECT_ID('LOS_DATEROS.avionBACKUP', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.avionBACKUP

			IF OBJECT_ID('LOS_DATEROS.butacasBACKUP', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.butacasBACKUP

			IF OBJECT_ID('LOS_DATEROS.habitacionBACKUP', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.habitacionBACKUP

			IF OBJECT_ID('LOS_DATEROS.facturaBACKUP', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.facturaBACKUP

			IF OBJECT_ID('LOS_DATEROS.clienteBACKUP', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.clienteBACKUP

			
			IF OBJECT_ID('LOS_DATEROS.compraBACKUP', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.clienteBACKUP

			
			IF OBJECT_ID('LOS_DATEROS.estadiaBACKUP', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.estadiaBACKUP
			
			IF OBJECT_ID('LOS_DATEROS.estadiaBACKUP2', 'U') IS NOT NULL
			DROP TABLE LOS_DATEROS.estadiaBACKUP2
--------------------------------------------------FIN AUXILIARES----------------------------------------------
end
else
begin
	exec ('create schema [LOS_DATEROS]')
	print 'Esquema [LOS_DATEROS] creado'
end
go
---------------------------------------------------DROP TRIGGERS------------------------------------------------
			
		if exists (select name from sysindexes   where name = 'llenador_Compra_estadia')   drop trigger [LOS_DATEROS].llenador_Compra_estadia
		
		if exists (select name from sysindexes   where name = 'llenador_Compra_butacas')   drop trigger [LOS_DATEROS].llenador_Compra_butacas
			
		if exists (select name from sysindexes   where name = 'llenador_Compra_factura')   drop trigger [LOS_DATEROS].llenador_Compra_factura
	
---------------------------------------------------	CIUDAD-------------------------------------------------

			CREATE TABLE [LOS_DATEROS].[ciudad](
				[id_ciudad] [bigint] IDENTITY(1,1) NOT NULL,
				[nombre] [nvarchar](255) NULL )
			--CREO LA TABLA ciudad 
------------------------------------------------------COMPRA--------------------------------------------------------------------


				CREATE TABLE [LOS_DATEROS].[compra](
					[ID_COMPRA] [bigint] IDENTITY(1,1) NOT NULL,
					[COMPRA_NUMERO] [decimal](18, 0) NULL,
					[COMPRA_FECHA] [datetime2](3) NULL,
					[ID_EMPRESA] [bigint] NULL,
					[ID_ESTADIA] [bigint] NULL,
					[ID_BUTACA] [bigint] NULL,
					[ID_TIPO_COMPRA] [bigint] NULL,
					[NRO_FACTURA] decimal(18,0) null
				) ON [PRIMARY]



 ------------------------------------EMPRESA--------------------------------------------------------

		CREATE TABLE [LOS_DATEROS].[empresa](
			[ID_EMPRESA] [bigint] identity(1,1) not NULL,
			[EMPRESA_RAZON_SOCIAL] [nvarchar](255) NULL
		) ON [PRIMARY]
-----------------------------------------BUTACAS-------------------------------------------------------

			CREATE TABLE [LOS_DATEROS].[butacas](
				[id_butaca] [bigint] identity(1,1) not NULL,
				[ID_BUTACA_TIPO] [nvarchar](255) NULL,
				[BUTACA_NUMERO] [decimal](18, 0) NULL,
				[id_pasaje] [bigint] NULL,
				[id_avion] [bigint] NULL
			) ON [PRIMARY]


			
----------------------------------------------------TIPO  BUTACA---------------------------------------------------------------------------------

		 CREATE TABLE [LOS_DATEROS].tipo_butacas(
			[id_tipo_butaca] [bigint] identity(1,1) not NULL,
			[BUTACA_TIPO] [nvarchar](255) NULL 
			)
--------------------------------------------HABITACION-------------------------------------------------------------


				CREATE TABLE [LOS_DATEROS].[habitacion](
					[ID_HABITACION] [bigint] identity(1,1) not NULL,
					[HABITACION_NUMERO] [decimal](18, 0) NULL,
					[HABITACION_PISO] [decimal](18, 0) NULL,
					[HABITACION_FRENTE] [nvarchar](50) NULL,
					[HABITACION_PRECIO] [decimal](18, 2) NULL,
					[HABITACION_COSTO] [decimal](18, 2) NULL,
					[id_hotel] [bigint] NULL,
					[id_tipo_habitacion] [bigint] NULL

					)ON [PRIMARY]

----------------------------------------------TIPO HABITACION-------------------------------------------------------


							CREATE TABLE [LOS_DATEROS].[tipo_habitacion](
								[ID_TIPO_HABITACION] [bigint] identity(1,1) not NULL,
								[TIPO_HABITACION_DESC] [nvarchar](50) NULL,
								[TIPO_HABITACION_CODIGO] [decimal](18, 0) NULL
							) ON [PRIMARY]
-------------------------------------------------AVION----------------------------------------------------------

		USE [GD1C2020]
		GO

		CREATE TABLE [LOS_DATEROS].[avion](
			[id_avion] [bigint] IDENTITY(1,1) not NULL,
			[AVION_MODELO] [nvarchar](50) NULL,
			[AVION_IDENTIFICADOR] [nvarchar](50) NULL
		) ON [PRIMARY]
				-- CREO LA TABLA avion

-------------------------------------RUTA AEREA-------------------------------------------------------------------------

		CREATE TABLE [LOS_DATEROS].[ruta_aerea](
			[id_ruta_aerea] [bigint] IDENTITY(1,1) not NULL,
			[RUTA_AEREA_CODIGO] [decimal](18, 0) NULL,
			[idorig] [bigint] NOT NULL,
			[iddest] [bigint] NOT NULL
		) ON [PRIMARY]
		-- CREO LA TABLA ruta_aerea-
		

 ---------------------------------------------VUELO ---------------------------------------------------------


		 CREATE TABLE [LOS_DATEROS].[vuelo](
			[id_vuelo] [bigint] identity(1,1) not NULL,
			[VUELO_CODIGO] [decimal](19, 0) NULL,
			[VUELO_FECHA_LLEGADA] [datetime2](3) NULL,
			[VUELO_FECHA_SALUDA] [datetime2](3) NULL,
			[id_ruta_aerea] [bigint] NULL
		) ON [PRIMARY]
--------------------------------PASAJES-------------------------------------------------------


		CREATE TABLE [LOS_DATEROS].[pasajes](
			[id_pasaje] [bigint] IDENTITY(1,1)NOT NULL,
			[PASAJE_CODIGO] [decimal](18, 0) NULL,
			[PASAJE_PRECIO] [decimal](18, 2) NULL,
			[PASAJE_COSTO] [decimal](18, 2) NULL,
			[ID_VUELO] [decimal](19, 0) NULL
		) ON [PRIMARY]
		
		
			
---------------------------------------------FACTURA-----------------------------------------------------------------------------


					CREATE TABLE [LOS_DATEROS].[factura](
						[ID_FACTURA] [bigint] identity(1,1) not NULL,
						[FACTURA_NRO] [decimal](18, 0) NULL,
						[FACTURA_FECHA] [datetime2](3) NULL,
						[id_cliente] [bigint] NULL,
						[idsucursal] [bigint] NULL,
						[id_compra] [bigint] NULL
					) ON [PRIMARY]

-------------------------------------HOTEL---------------------------------------------------------------

						CREATE TABLE [LOS_DATEROS].[hotel](
							[ID_HOTEL] [bigint] identity(1,1) not NULL,
							[HOTEL_CALLE] [nvarchar](50) NULL,
							[HOTEL_NRO_CALLE] [decimal](18, 0) NULL,
							[HOTEL_CANTIDAD_ESTRELLAS] [decimal](18, 0) NULL
						) ON [PRIMARY]

------------------------------------SUCURSAL----------------------------------------------------------

	
								CREATE TABLE [LOS_DATEROS].[sucursal](
									[id_sucursal] [bigint] identity(1,1) not NULL,
									[SUCURSAL_DIR] [nvarchar](255) NULL,
									[SUCURSAL_MAIL] [nvarchar](255) NULL,
									[SUCURSAL_TELEFONO] [decimal](18, 0) NULL
								) ON [PRIMARY]


------------------------------------------------------ESTADIA--------------------------------------------------------------



					CREATE TABLE [LOS_DATEROS].[estadia](			
						[ID_ESTADIA] [bigint] identity(1,1) not NULL,
						[ESTADIA_CODIGO] [decimal](18, 0) NULL,
						[ESTADIA_FECHA_INI] [datetime2](3) NULL,
						[ESTADIA_CANTIDAD_NOCHES] [decimal](18, 0) NULL,
						[id_empresa] [bigint] NULL,
						[id_habitacion] [bigint] NULL
					) ON [PRIMARY]


------------------------------------------------------CLIENTE--------------------------------------------------------------------------

							CREATE TABLE [LOS_DATEROS].[cliente](				
								[ID_CLIENTE] [bigint] identity(1,1) not NULL,
								[CLIENTE_DNI] [decimal](18, 0) NULL,
								[CLIENTE_NOMBRE] [nvarchar](255) NULL,
								[CLIENTE_APELLIDO] [nvarchar](255) NULL,
								[CLIENTE_FECHA_NAC] [datetime2](3) NULL,
								[CLIENTE_TELEFONO] [int] NULL,
								[CLIENTE_MAIL] [nvarchar](255) NULL
							) ON [PRIMARY]


						

----------------------------------------------------------TIPO DE COMPRA--------------------------------------------------------------------------

									CREATE TABLE [LOS_DATEROS].tipo_compra(
										[ID_TIPO_COMPRA] [bigint] identity(1,1) not NULL,
										[TIPO_COMPRA] [nvarchar](15) NULL
									) ON [PRIMARY]

									--	SOLAMENTE DOS TIPOS DE COMPRA,  AL PROVEEDOR QUIEN ME VENDE LAS ESTADIAS O PASAJES
									--  Y EL CLIENTE, QUIEN ME COMPRA A MI LAS ESTADIAS O PASAJES
									-- ESTA FORMA DIFERENCIO LA VENTA DE UNA COMPRA AL SEPARARLOS POR EL TIPO DE CLIENTE , 
									---TENIENDO UNA ENTIDAD COMPRA SOLA PARA SIMPLICIDAD DEL SISTEMA

									insert into [LOS_DATEROS].tipo_compra(TIPO_COMPRA)  values('PROVEEDOR')

									insert into [LOS_DATEROS].tipo_compra(TIPO_COMPRA)  values('CLIENTE')
--------------------------------------------------------------------------------------------------------------


				if exists (select name from sysindexes   where name = 'ix_pasaje_codigo')   drop index ix_pasaje_codigo ON gd_esquema.Maestra	
				CREATE INDEX ix_pasaje_codigo	ON gd_esquema.Maestra (	PASAJE_CODIGO, EMPRESA_RAZON_SOCIAL)
						



----------------------------------------------------------CREAMOS TRIGGER SOBRE PASAJE---------------select * from compra---------------
			/*		go
					create trigger llenador_Compra_pasaje      
						on pasajes 
						after insert
		
					as
						begin 

						INSERT INTO compra(COMPRA_NUMERO, COMPRA_FECHA, ID_EMPRESA,  ID_ESTADIA, ID_BUTACA, ID_TIPO_COMPRA	) SELECT  
						( SELECT TOP 1 COMPRA_NUMERO from gd_esquema.Maestra LL where LL.PASAJE_CODIGO=inx.PASAJE_CODIGO	),
						 ( SELECT top 1 mm.COMPRA_FECHA FROM gd_esquema.Maestra mm WHERE mm.PASAJE_CODIGO=inx.PASAJE_CODIGO),
						 ( SELECT top 1 epp.ID_EMPRESA FROM  gd_esquema.Maestra ff join empresa epp on inx.PASAJE_CODIGO=ff.PASAJE_CODIGO and epp.EMPRESA_RAZON_SOCIAL=ff.EMPRESA_RAZON_SOCIAL ),
							1,
						 ( select b.id_butaca from butacas b where b.id_pasaje=inx.id_pasaje  ) as dd,
						 1
						  FROM inserted  inx where inx.PASAJE_CODIGO is not null
		
						end
		
		
	
					go
					*/
--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------CREAMOS TRIGGER SOBRE BUTACAS---------------select * from compra---------------
					go
					create trigger llenador_Compra_butacas      
						on [LOS_DATEROS].butacas 
						after insert
		
					as
						begin 

						INSERT INTO [LOS_DATEROS].compra(COMPRA_NUMERO, COMPRA_FECHA, ID_EMPRESA,  ID_ESTADIA, ID_BUTACA, ID_TIPO_COMPRA	) SELECT  
						( SELECT TOP 1 COMPRA_NUMERO from gd_esquema.Maestra LL join [LOS_DATEROS].pasajes ss on LL.PASAJE_CODIGO=ss.PASAJE_CODIGO and ss.id_pasaje=inx.id_pasaje	),
						 ( SELECT top 1 mm.COMPRA_FECHA FROM gd_esquema.Maestra mm join [LOS_DATEROS].pasajes ss on mm.PASAJE_CODIGO=ss.PASAJE_CODIGO and ss.id_pasaje=inx.id_pasaje),
						 ( SELECT top 1 epp.ID_EMPRESA FROM  gd_esquema.Maestra ff join [LOS_DATEROS].empresa epp on  epp.EMPRESA_RAZON_SOCIAL=ff.EMPRESA_RAZON_SOCIAL join pasajes ps on ps.PASAJE_CODIGO=ff.PASAJE_CODIGO and inx.id_pasaje=ps.id_pasaje ),
							1,
						inx.id_butaca, -- ( select b.id_butaca from butacas b where b.id_butaca =inx.id_butaca  ) as dd,
						 1
						  FROM inserted  inx where inx.BUTACA_NUMERO is not null
		
						end
		
		
	
					go
					
-------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------CREAMOS TRIGGER SOBRE ESTADIA---------------select * from compra---------------
					go
					create trigger llenador_Compra_estadia      
						on [LOS_DATEROS].estadia 
						after insert
		
					as
						begin 

						INSERT INTO [LOS_DATEROS].compra(COMPRA_NUMERO, COMPRA_FECHA, ID_EMPRESA,  ID_ESTADIA, ID_BUTACA, ID_TIPO_COMPRA	) SELECT  
						( SELECT TOP 1 COMPRA_NUMERO from gd_esquema.Maestra LL where LL.ESTADIA_CODIGO=inx.ESTADIA_CODIGO and inx.ESTADIA_FECHA_INI=LL.ESTADIA_FECHA_INI 	),
						 ( SELECT top 1 LL.COMPRA_FECHA FROM gd_esquema.Maestra LL where LL.ESTADIA_CODIGO=inx.ESTADIA_CODIGO and inx.ESTADIA_FECHA_INI=LL.ESTADIA_FECHA_INI    ),
						  inx.id_empresa, -- ( SELECT top 1 epp.ID_EMPRESA FROM  gd_esquema.Maestra ff join empresa epp on  epp.EMPRESA_RAZON_SOCIAL=ff.EMPRESA_RAZON_SOCIAL join pasajes ps on ps.PASAJE_CODIGO=ff.PASAJE_CODIGO and inx.id_pasaje=ps.id_pasaje ),
							inx.ID_ESTADIA ,--( select b.id_butaca from butacas b where b.id_butaca =inx.id_butaca  ) as dd,
							1,
							1
						  FROM inserted  inx where inx.ESTADIA_CODIGO is not null
		
						end
		
		
	
					go


-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------					
-------------------------------------------------------------------------------------------------------------------------------------------------------					
					
				if exists (select name from sysindexes   where name = 'ix_estadia')   drop index ix_estadia ON [LOS_DATEROS].estadia
				CREATE INDEX ix_estadia ON [LOS_DATEROS].estadia (	ESTADIA_CODIGO)
				
					
				if exists (select name from sysindexes   where name = 'ix_factura')   drop index ix_factura ON gd_esquema.Maestra	
				CREATE INDEX ix_factura ON gd_esquema.Maestra	 (	FACTURA_NRO)

				
				if exists (select name from sysindexes   where name = 'ix_factura_ES')   drop index ix_factura_ES ON gd_esquema.Maestra	
				CREATE INDEX ix_factura_ES ON gd_esquema.Maestra (PASAJE_CODIGO) 

				
				if exists (select name from sysindexes   where name = 'ix__butacasES')   drop index ix__butacasES ON [LOS_DATEROS].butacas
				CREATE INDEX  ix__butacasES ON [LOS_DATEROS].butacas ( id_pasaje )

				if exists (select name from sysindexes   where name = 'ix__pasajeES')   drop index ix__pasajeES ON [LOS_DATEROS].pasajes
				CREATE INDEX ix__pasajeES ON [LOS_DATEROS].pasajes (  PASAJE_CODIGO )


-------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------CREAMOS TRIGGER SOBRE FACTURA---------------select * from compra---------------
					go
					create trigger llenador_Compra_factura      
						on [LOS_DATEROS].factura
						after insert
		
					as
						begin 

					
						INSERT INTO compra(COMPRA_NUMERO, COMPRA_FECHA, ID_EMPRESA,  ID_ESTADIA, ID_BUTACA, ID_TIPO_COMPRA, NRO_FACTURA	) SELECT  
					bss.COMPRA_NUMERO 	, --( SELECT TOP 1 COMPRA_NUMERO from gd_esquema.Maestra LL where LL.FACTURA_NRO=inx.FACTURA_NRO and inx.FACTURA_FECHA=LL.FACTURA_FECHA  	),
					bss.COMPRA_FECHA	  , --( SELECT top 1 LL1.COMPRA_FECHA FROM gd_esquema.Maestra LL1  where LL1.FACTURA_NRO=inx.FACTURA_NRO and inx.FACTURA_FECHA=LL1.FACTURA_FECHA  	 ),
					 ( SELECT top 1 epp.ID_EMPRESA FROM [LOS_DATEROS].empresa epp where  epp.EMPRESA_RAZON_SOCIAL=bss.EMPRESA_RAZON_SOCIAL  )  ,
					 isnull( 	( select es.ID_ESTADIA as re from  [LOS_DATEROS].estadia es where  bss.ESTADIA_CODIGO=es.ESTADIA_CODIGO and es.ESTADIA_CODIGO is not null and es.ESTADIA_FECHA_INI=bss.ESTADIA_FECHA_INI ), 1)  ,
						isnull(  (select  bu.id_butaca from [LOS_DATEROS].butacas bu  join [LOS_DATEROS].pasajes pss on pss.PASAJE_CODIGO=bss.PASAJE_CODIGO and bu.id_pasaje=pss.id_pasaje  ), 1) ,
							2,
							( bss.FACTURA_NRO) 
						  FROM [LOS_DATEROS].factura  inx join  gd_esquema.Maestra bss on inx.FACTURA_NRO=bss.FACTURA_NRO and inx.FACTURA_NRO is not null -- FROM inserted  inx where inx.FACTURA_NRO is not null
						
					
						--obligaFmos al la tabla factura a actualizarse
						
						UPDATE [LOS_DATEROS].factura set [LOS_DATEROS].factura.id_compra = com.ID_COMPRA  from [LOS_DATEROS].compra com 
						where [LOS_DATEROS].factura.FACTURA_NRO=com.NRO_FACTURA and  com.ID_COMPRA  is not null
						
					--	ALTER TABLE compra  drop column NRO_FACTURA 
		
						

						--UPDATE [LOS_DATEROS].factura  set [LOS_DATEROS].factura.id_compra= com.ID_COMPRA  from [LOS_DATEROS].compra com  join gd_esquema.Maestra gd
						--on 
						--where gd.PASAJE_CODIGO is not null
						


						end
			
					go

-----------------------------------------CUERPO DE CIUDAD-----------------------------------------
			SELECT * INTO [LOS_DATEROS].ciudadBACKUP
				from (
					Select RUTA_AEREA_CIU_ORIG from  gd_esquema.Maestra
				union
					Select  RUTA_AEREA_CIU_DEST from  gd_esquema.Maestra
					 ) f
			--CREO LA TABLA CIUDADBACKUP, ME SIRVE PARA GUARDAR TEMPORALMENTE LOS VALORES DE ciudad
			-- ESTE EXTRAE LA CIUDAD DE LAS DOS RUTAS HACIENDO UNA UNION ENTRE LAS DOS TABLAS PARA UTILIZAR TODAS LAS ciudad


			--  RELLENO LA TABLA ciudad VACIA DE LOS DATOS QUE ALMACENE EN LA TABLA CIUDADBAKUP
			insert into [LOS_DATEROS].ciudad(nombre)  select * from [LOS_DATEROS].ciudadBACKUP FF


			-- BORRO LA TABLA CIUDADBAKUP
			drop table [LOS_DATEROS].ciudadBACKUP   


			
------------------------------------------cuerpo de empresa---------------------------------------

						INSERT  INTO [LOS_DATEROS].empresa SELECT *
							from (
									select EMPRESA_RAZON_SOCIAL from gd_esquema.Maestra
									GROUP BY EMPRESA_RAZON_SOCIAL
									order by EMPRESA_RAZON_SOCIAL
									offset 0 rows
							) ff

						--select * from empresa
------------   eMPRESA_RAZON_SOCIAL NO ES NULO



		if exists (select name from sysindexes   where name = 'ix_empresa')   drop index ix_empresa ON [LOS_DATEROS].empresa
		CREATE INDEX ix_empresa ON [LOS_DATEROS].empresa (	EMPRESA_RAZON_SOCIAL)


-----------------------------------------------------CUERPO DE AVION------------------------------------------
		SELECT * INTO [LOS_DATEROS].avionBACKUP
			from (
				  select  AVION_MODELO, AVION_IDENTIFICADOR from gd_esquema.Maestra 
				  group by AVION_MODELO, AVION_IDENTIFICADOR  
				 --- order by AVION_MODELO
				 ) f

		--  RELLENO LA TABLA a VACIA DE LOS DATOS QUE ALMACENE EN LA TABLA CIUDADBAKUP
		insert into [LOS_DATEROS].avion  select AVION_MODELO, AVION_IDENTIFICADOR 
		from 
				(  select top 50 * from [LOS_DATEROS].avionBACKUP order by AVION_MODELO  --- borrar el top
		 ) f
	
		drop table [LOS_DATEROS].avionBACKUP
		-- BORRAMOS LA TABLA TEMPORAL	 




--------------------------------------------------CUERPO DE RUTA AEREA-----------------------------------------------------------------------

		 insert into [LOS_DATEROS].ruta_aerea( RUTA_AEREA_CODIGO, idorig , iddest )  values( 1,1,1)  
		--		INICIALIZO LOS ID DE CADA TABLA POR ESO 1 CON TODOS 1
		 --		 LA IDEA ES QUE CADA ID INICIAL DE CADA TABLA SEA UNO, ESTO ES PORQUE NUESTRA ESTRATEGIA ADMITE NULOS, NO ASI SUS ID, PERO ESTOS TIENEN
		 ---  QUE EXISTIR Y SIMPLEMENTE LES ASIGNAMOS 1 POR COMODIDAD Y SIMPLICIDAD



		insert into [LOS_DATEROS].ruta_aerea select  *
		from (
		SELECT DISTINCT RUTA_AEREA_CODIGO 
			,(  select id_ciudad from [LOS_DATEROS].ciudad s where s.nombre=RUTA_AEREA_CIU_ORIG ) as 'RUTA_AEREA_CODIGO1'
			,(  select id_ciudad from [LOS_DATEROS].ciudad s where s.nombre=RUTA_AEREA_CIU_DEST ) as 'RUTA_AEREA_CIU_DEST1'
		 FROM gd_esquema.Maestra
		 WHERE PASAJE_CODIGO IS NOT NULL
		 ORDER BY RUTA_AEREA_CODIGO
		 OFFSET 0 ROWS  -- ESTE ES PARA QUE ME AGREGUE  LOS DATOS ORDENADOS
		  ) ff


	  ----  LA ESTRATEGIA SEGUIDA ES LA SIGUIENTE: EXTRAIGO DE LA TABLA MAESTRA LA RUTA AEREA Y DE CADA CIUDAD ORIGEN Y DESTINO , CONVIERTO
	  --LA CIUDAD ORIGEN EN UN ID DE ESA CIUDAD DE LA TABLA CREADA ciudad, Y TAMBIEN CON LA CIUDAD DESTINO EN UN ID DE ESA CIUDAD DESTINO 
	  --EN LA TABLA ciudad


-----------------------------------------------------CUERPO DE VUELO---------------------------------------------------------------
		SELECT * INTO [LOS_DATEROS].vueloBACKUP
			from (
		--insert into vuelo(VUELO_CODIGO, VUELO_FECHA_LLEGADA, VUELO_FECHA_SALUDA)
		  --select  * from (
  			select VUELO_CODIGO, VUELO_FECHA_LLEGADA, VUELO_FECHA_SALUDA,RUTA_AEREA_CODIGO
	 
			 from gd_esquema.Maestra t where VUELO_CODIGO is NOT null and RUTA_AEREA_CIU_ORIG is not null

			GROUP BY  VUELO_CODIGO, VUELO_FECHA_LLEGADA, VUELO_FECHA_SALUDA,RUTA_AEREA_CODIGO -- RUTA_AEREA_CIU_ORIG,RUTA_AEREA_CIU_DEST

			order by VUELO_CODIGO
			OFFSET 0 ROWS  -- ESTE ES PARA QUE ME AGREGUE  LOS DATOS ORDENADOS
			) fff




		insert into [LOS_DATEROS].vuelo( VUELO_CODIGO, VUELO_FECHA_LLEGADA , VUELO_FECHA_SALUDA, id_ruta_aerea )  values( null, null,null,1)  
		-- INICIALIZO LA TABLA VUELO


		insert into [LOS_DATEROS].vuelo select  *
		from (
  				select VUELO_CODIGO, VUELO_FECHA_LLEGADA, VUELO_FECHA_SALUDA, 
				 ( 
					select top 1 cast(s.id_ruta_aerea as bigint) from  [LOS_DATEROS].ruta_aerea s join gd_esquema.Maestra m on m.VUELO_CODIGO=vv.VUELO_CODIGO AND s.RUTA_AEREA_CODIGO=s.RUTA_AEREA_CODIGO
				  join [LOS_DATEROS].ciudad c on s.idorig=c.id_ciudad and c.nombre= m.RUTA_AEREA_CIU_ORIG --and s.iddest=m.RUTA_AEREA_CIU_DEST
				join [LOS_DATEROS].ciudad cc on s.iddest=cc.id_ciudad and cc.nombre=m.RUTA_AEREA_CIU_DEST
				
		
				) as gge from [LOS_DATEROS].vueloBACKUP   vv 
				order by abs(VUELO_CODIGO)   
				 OFFSET 0 ROWS  -- ESTE ES PARA QUE ME AGREGUE  LOS DATOS ORDENADOS
		) ff

		drop table [LOS_DATEROS].vueloBACKUP
		-- BORRAMOS LA TABLA TEMPORAR vueloBACKUP

		if exists (select name from sysindexes   where name = 'ix_vuelo')   drop index ix_vuelo ON [LOS_DATEROS].vuelo	
		CREATE INDEX ix_vuelo	ON [LOS_DATEROS].vuelo (	VUELO_CODIGO)
	--	select * from vuelo
---------------------------------------------------------------------------------------------
-----------------------------------------------CUERPO TIPO DE BUTACA---------------------------------------------------------------------------------
							insert into [LOS_DATEROS].tipo_butacas select  *
									from (
							 select distinct BUTACA_TIPO
							  from gd_esquema.Maestra 
							  order by   BUTACA_TIPO
							  OFFSET 0 ROWS  -- ESTE ES PARA QUE ME AGREGUE  LOS DATOS ORDENADOS
							 ) ff

		
					--	select * from butacas
		
-----------------------------	CUERPO DE --PASAJES-------------------------------------------------------

 
					 insert into [LOS_DATEROS].pasajes select * 
						 from (
							 select PASAJE_CODIGO, PASAJE_PRECIO, PASAJE_COSTO,
 
							  ( select top 1 id_vuelo from [LOS_DATEROS].vuelo v where v.VUELO_CODIGO=m.VUELO_CODIGO )  as id_vuelo
 
							 from gd_esquema.Maestra m
 
							 group by PASAJE_CODIGO, PASAJE_PRECIO, PASAJE_COSTO, VUELO_CODIGO

							 order  by PASAJE_CODIGO
							 OFFSET 0 ROWS  -- ESTE ES PARA QUE ME AGREGUE  LOS DATOS ORDENADOS
						) ff

					

-----------------------------------------------------CUERPO DE BUTACAS--------------------------------------------------------------------

							SELECT * INTO [LOS_DATEROS].butacasBACKUP
								from (

								select BUTACA_NUMERO , BUTACA_TIPO, PASAJE_CODIGO , AVION_IDENTIFICADOR,AVION_MODELO from gd_esquema.Maestra  where BUTACA_NUMERO IS NOT NULL
	
								group by BUTACA_NUMERO , BUTACA_TIPO, PASAJE_CODIGO,  AVION_IDENTIFICADOR,AVION_MODELO   order by abs(PASAJE_CODIGO)
								  OFFSET 0 ROWS 
								) vv

								insert into [LOS_DATEROS].butacas( ID_BUTACA_TIPO, BUTACA_NUMERO, id_pasaje, id_avion) values(null, null,1,1)

									insert into [LOS_DATEROS].butacas select * 
										from (
											select	 ( select bb.id_tipo_butaca from [LOS_DATEROS].tipo_butacas bb where b.BUTACA_TIPO=bb.BUTACA_TIPO )  as iditipobutaca,
											b.BUTACA_NUMERO,
											( select p.id_pasaje from [LOS_DATEROS].pasajes p where p.PASAJE_CODIGO=b.PASAJE_CODIGO ) as idpasaje,
											( select a.id_avion from [LOS_DATEROS].avion a where b.AVION_IDENTIFICADOR=a.AVION_IDENTIFICADOR and a.AVION_MODELO=b.AVION_MODELO ) AS ffe  
											  from [LOS_DATEROS].butacasBACKUP b  order by abs(PASAJE_CODIGO)
											  OFFSET 0 ROWS
										) ff	  


									drop table [LOS_DATEROS].butacasBACKUP
									-- BORRO butacasBACKUP PORQUE ES TEMPORAL

--------------------------------------------------------------------------------------------------------------------------------------------------
					 if exists (select name from sysindexes   where name = 'ix_butacas')   drop index ix_butacas ON [LOS_DATEROS].butacas	
							CREATE INDEX  ix_butacas ON [LOS_DATEROS].butacas	 ( ID_BUTACA_TIPO, BUTACA_NUMERO)

--------------------------------------------------CUERPO DE SUCURSAL------------------------------------------------------
							insert into [LOS_DATEROS].sucursal select *
								from ( 
									select SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TELEFONO from gd_esquema.Maestra
									group by SUCURSAL_DIR, SUCURSAL_MAIL, SUCURSAL_TELEFONO
									order by  SUCURSAL_MAIL
									OFFSET 0 ROWS
									) ff



----------------------------------------------CUERPO DE TIPO HABITACION--------------------------------------------------------------------------

							insert INTO [LOS_DATEROS].tipo_habitacion select *
								 from (
										SELECT TIPO_HABITACION_DESC, TIPO_HABITACION_CODIGO FROM gd_esquema.Maestra
										GROUP BY  TIPO_HABITACION_DESC, TIPO_HABITACION_CODIGO
										 ORDER BY TIPO_HABITACION_CODIGO
										OFFSET 0 ROWS
								 ) ff


-------------------------------------------CUERPO DE HOTEL--------------------------------------------------------------------

						insert INTO [LOS_DATEROS].hotel select *
						from (
								select HOTEL_CALLE, HOTEL_NRO_CALLE, HOTEL_CANTIDAD_ESTRELLAS from gd_esquema.Maestra
								group by HOTEL_CALLE, HOTEL_NRO_CALLE, HOTEL_CANTIDAD_ESTRELLAS 
								order by HOTEL_CANTIDAD_ESTRELLAS
								OFFSET 0 ROWS
							) ff


-----------------------------------------CUERPO HABITACION--------------------------------------------------------------------------------------

						SELECT * INTO [LOS_DATEROS].habitacionBACKUP
						from (
							select  HABITACION_NUMERO, HABITACION_PISO, HABITACION_FRENTE, HABITACION_PRECIO, HABITACION_COSTO ,HOTEL_NRO_CALLE, TIPO_HABITACION_CODIGO
							 from gd_esquema.Maestra 
								where HABITACION_NUMERO IS NOT NULL
							 GROUP BY  HABITACION_NUMERO, HABITACION_PISO, HABITACION_FRENTE, HABITACION_PRECIO, HABITACION_COSTO ,HOTEL_NRO_CALLE, TIPO_HABITACION_CODIGO
						) ff


		
						insert into [LOS_DATEROS].habitacion( HABITACION_NUMERO, HABITACION_PISO, HABITACION_FRENTE, HABITACION_PRECIO, HABITACION_COSTO, id_hotel,id_tipo_habitacion) values(null,null,null,null, null,1,1)
		
						insert INTO [LOS_DATEROS].habitacion select *
							 from (
											select HABITACION_NUMERO, HABITACION_PISO, HABITACION_FRENTE, HABITACION_PRECIO, HABITACION_COSTO, 
											( select h1.ID_HOTEL from [LOS_DATEROS].hotel h1 where h1.HOTEL_NRO_CALLE=hh.HOTEL_NRO_CALLE )  as id_hotel,
											(select t.ID_TIPO_HABITACION from [LOS_DATEROS].tipo_habitacion t where hh.TIPO_HABITACION_CODIGO=t.TIPO_HABITACION_CODIGO  ) as id_habitacion
							from [LOS_DATEROS].habitacionBACKUP hh 
								--select * from habitacion
				
							) tt




						drop table [LOS_DATEROS].habitacionBACKUP    --	drop table habitacion



---------------------------------------------CUERPO DE---ESTADIA------------------------------------------------------------------------------------

		


					SELECT * INTO [LOS_DATEROS].estadiaBACKUP
						from (
						select ESTADIA_CODIGO, ESTADIA_FECHA_INI, ESTADIA_CANTIDAD_NOCHES, EMPRESA_RAZON_SOCIAL, HABITACION_NUMERO,HABITACION_PISO ,HABITACION_FRENTE,   HOTEL_NRO_CALLE , TIPO_HABITACION_CODIGO
						 from gd_esquema.Maestra
						  group by ESTADIA_CODIGO, ESTADIA_FECHA_INI, ESTADIA_CANTIDAD_NOCHES, EMPRESA_RAZON_SOCIAL, HABITACION_NUMERO,HABITACION_PISO ,HABITACION_FRENTE,   HOTEL_NRO_CALLE , TIPO_HABITACION_CODIGO
	
					) ff

	
						SELECT * INTO [LOS_DATEROS].estadiaBACKUP2
							from (
									select e.ESTADIA_CODIGO , e.ESTADIA_FECHA_INI , e.ESTADIA_CANTIDAD_NOCHES, 
									( select  em.ID_EMPRESA from [LOS_DATEROS].empresa em where em.EMPRESA_RAZON_SOCIAL=e.EMPRESA_RAZON_SOCIAL) as id_empresa,
	
									e.HABITACION_NUMERO,e.HABITACION_PISO, e.HABITACION_FRENTE,  
			
  
									( select  htl.ID_HOTEL from [LOS_DATEROS].hotel htl where e.HOTEL_NRO_CALLE=htl.HOTEL_NRO_CALLE  ) as id_hotel ,
									( select th.ID_TIPO_HABITACION from [LOS_DATEROS].tipo_habitacion th where th.TIPO_HABITACION_CODIGO=e.TIPO_HABITACION_CODIGO ) as id_tipo_habitacion
			 						from [LOS_DATEROS].estadiaBACKUP e
							) fff
						 	
	
	
							insert into [LOS_DATEROS].estadia(id_empresa ,id_habitacion) values(1,1)
		
	 
							insert INTO [LOS_DATEROS].estadia select *
								 from (
									 select  est2.ESTADIA_CODIGO, est2.ESTADIA_FECHA_INI, est2.ESTADIA_CANTIDAD_NOCHES, est2.id_empresa,
	 
											 (  select  ht.ID_HABITACION from [LOS_DATEROS].habitacion ht where  est2.HABITACION_NUMERO=ht.HABITACION_NUMERO and 

												est2.HABITACION_PISO=ht.HABITACION_PISO and est2.HABITACION_FRENTE=ht.HABITACION_FRENTE and est2.id_hotel=ht.id_hotel
		
												  and	  est2.id_tipo_habitacion=ht.id_tipo_habitacion  
	  
											  ) as id_habitacion
	 
									from [LOS_DATEROS].estadiaBACKUP2 est2
									order by ESTADIA_CODIGO
									offset 0 ROWS
								) fff


								UPDATE [LOS_DATEROS].estadia set id_habitacion=1 where id_habitacion is null


								drop table [LOS_DATEROS].estadiaBACKUP
				
								drop table [LOS_DATEROS].estadiaBACKUP2


		

---------------------------------------------------CUERPO DE CLIENTE-------------------------------------------------------------------------------------
							SELECT * INTO [LOS_DATEROS].clienteBACKUP
								from (
									SELECT CLIENTE_DNI,CLIENTE_NOMBRE, CLIENTE_APELLIDO, CLIENTE_FECHA_NAC,CLIENTE_TELEFONO,CLIENTE_MAIL FROM gd_esquema.Maestra
									GROUP BY   CLIENTE_DNI,CLIENTE_NOMBRE, CLIENTE_APELLIDO, CLIENTE_FECHA_NAC,CLIENTE_TELEFONO,CLIENTE_MAIL
									ORDER BY CLIENTE_DNI
									OFFSET 0 ROWS
								) FF
			
					
	 
						insert INTO [LOS_DATEROS].cliente select *
							 from (
							select * from [LOS_DATEROS].clienteBACKUP
							) ff
			
							drop  table [LOS_DATEROS].clienteBACKUP


							
			-- HAY DNI DUPLICADOS ENTONCES ASUMO QUE EL DNI NO ASIRVE SOLAMENTE PARA AGRUPAR

			
-------------------------------------------------------INDICES--DE CLIENTEr------------------------------------------------------------			
				if exists (select name from sysindexes   where name = 'ix_cliente')   drop index ix_cliente ON [LOS_DATEROS].cliente	
				CREATE INDEX ix_cliente	ON [LOS_DATEROS].cliente (CLIENTE_DNI	, CLIENTE_APELLIDO)
------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------CUERPO DE FACTURA----------------------------------------------------------------------------------			
				
				
				
				SELECT * INTO [LOS_DATEROS].facturaBACKUP
						from (
								SELECT FACTURA_NRO, FACTURA_FECHA, CLIENTE_DNI, CLIENTE_APELLIDO , CLIENTE_NOMBRE, SUCURSAL_DIR FROM gd_esquema.Maestra
							group by  FACTURA_NRO, FACTURA_FECHA, CLIENTE_DNI, CLIENTE_APELLIDO , CLIENTE_NOMBRE, SUCURSAL_DIR
							ORDER BY FACTURA_NRO
							OFFSET 0 ROWS
						) vv
				--CONSULTA RAPIDA

		
------------------------------------------------------------------------------------------------------------------------------------

				if exists (select name from sysindexes   where name = 'ix_facturaBACKUP')   drop index ix_facturaBACKUP ON [LOS_DATEROS].facturaBACKUP	
				CREATE INDEX ix_facturaBACKUP	ON [LOS_DATEROS].facturaBACKUP (FACTURA_NRO	,CLIENTE_DNI )
			
				if exists (select name from sysindexes   where name = 'ix_sucursal')   drop index ix_sucursal ON [LOS_DATEROS].sucursal	
				CREATE INDEX ix_sucursal ON [LOS_DATEROS].sucursal (id_sucursal,SUCURSAL_DIR )   
------------------------------------------------------------------------------------------------------------------------------------------				

			--	insert into factura(id_cliente, idsucursal) values(1 ,1)

				insert INTO [LOS_DATEROS].factura select *
					 from (
						select fa.FACTURA_NRO, fa.FACTURA_FECHA , 
								( select  c.ID_CLIENTE  from [LOS_DATEROS].cliente c where c.CLIENTE_DNI=fa.CLIENTE_DNI and c.CLIENTE_APELLIDO=fa.CLIENTE_APELLIDO  and fa.CLIENTE_NOMBRE=c.CLIENTE_NOMBRE )
								as id_cliente,
								( select s.id_sucursal  from [LOS_DATEROS].sucursal s where s.SUCURSAL_DIR=fa.SUCURSAL_DIR  ) as idsucursal,
					 null  as ID_COMPRA
						 from [LOS_DATEROS].facturaBACKUP fa
						 order by abs(fa.FACTURA_NRO)
						 offset 0 rows
						) DD
						--CONSULTA MUY LENTA
			
					drop index ix_cliente  ON [LOS_DATEROS].cliente    --BORRO EL INDICE PARA MANTENER LIMPIA LA BASE DE DATOS, PERO LA RALENTIZA
					drop table [LOS_DATEROS].facturaBACKUP				-- BORRO LA TABLA AUXILIAR FACTURABACKUP
				 
				
				 ALTER TABLE [LOS_DATEROS].compra  drop column NRO_FACTURA 
				 
------------------------------------------------------------------------------------------------------------------------------------------------
				 ---		  create  cliente     factura    ingresar suscursal   pasaje  hotel   butaca 
				-- create function LOS_DATEROS.hotelTieneReserva
				-- comprobar estadia   comprobar butaca      comprobar vuelo 
				--  buscar cliente     buscar hotel     buscar  
































