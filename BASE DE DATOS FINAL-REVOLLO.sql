GO

USE master

GO

DROP DATABASE REVOLLO_DB

GO

CREATE DATABASE REVOLLO_DB




GO


USE REVOLLO_DB


GO

CREATE TABLE Tipos_Usuarios(

	ID int not null primary key identity (1,1),
	Nombre varchar(50) not null,
	Activo bit not null,
)

GO

CREATE TABLE Paises(

	ID int not null primary key identity (1,1),
	Nombre varchar(50) not null,
	Activo bit not null,
)



GO

CREATE TABLE Provincias(

	ID int not null primary key identity (1,1),
	IDpais int not null foreign key references Paises(ID),
	Nombre varchar(50) not null,
	Activo bit not null,
)

GO





CREATE TABLE Usuarios(

	ID int not null primary key identity (1,1),
	Dni int not null,	
	Apellido varchar(50) not null,
	Nombre varchar(50) not null,
	Nick_Name varchar(50) not null,
	Contraseña varchar(50)not null,
	Email varchar(50) unique,
	Sexo varchar(1)  null,
	telefono int not null,

	
	IDprovincia int not null foreign key references Provincias(ID),
	IDtipo int not null foreign key references Tipos_Usuarios(ID),
	
	F_nacimiento date not null,
	
	Activo bit not null,


)

GO

CREATE TABLE Direcciones(

	ID int not null primary key identity (1,1),
	IDusuario int not null foreign key references Usuarios(ID),
	IDprovincia int not null foreign key references Provincias(ID),
	Localidad varchar(50) not null,
	CP int not null,
	Calle varchar(50) not null,
	Altura int null,
	Entrecalle1 varchar(50) null,
	Entrecalle2 varchar(50)null,
	Activo bit not null,

)
GO



CREATE TABLE Tipo_Edades(

	ID int not null primary key identity (1,1),
	Nombre varchar(50) not null,
	Activo bit not null,
)

GO

CREATE TABLE Tipo_Animales(

	ID int not null primary key identity (1,1),
	Nombre varchar(50) not null,
	Activo bit not null,
)

GO

CREATE TABLE Marcas(

	ID int not null primary key identity (1,1),
	Nombre varchar(50) not null,
	Activo bit not null,
)

GO

CREATE TABLE Tipo_Razas(

	ID int not null primary key identity (1,1),
	Nombre varchar(50) not null,
	Activo bit not null,
)

GO
CREATE TABLE  Articulos(

	ID int not null primary key identity (1,1),
	Codigo varchar (50) not null,
	Nombre varchar (100) not null,
	Descripcion varchar (200) null,
	IDmarca int foreign key references Marcas(ID),
	IDanimal int null foreign key references Tipo_Animales(ID),
	IDraza int null foreign key references Tipo_Razas(ID),
	IDedades int null foreign key references Tipo_Edades(ID),
	Imagen_Url varchar(1000) null,
	
	Activo bit not null,
)

GO

CREATE TABLE PrecioyStock
(
	IDarticulo  int primary key,
	
	Stock int not null,
	PrecioVenta money not null,
	PrecioCompra money not null,
	Activo bit not null,
	
)

GO



CREATE TABLE Envios(
	
	IDventas int primary key ,
	
	IDprovincia int not null foreign key references Provincias(ID),
	Localidad varchar(50)not null,
	Cp int not null,
	Calle varchar(50)not null,
	Altura int null,
	Entrecalle1 varchar(50) null,
	Entrecalle2 varchar(50)null,
	Activo bit not null,

	
)
GO



create table Ventas(

	ID int not null primary key identity (1,1),
	IDusuario int not null foreign key references Usuarios(ID),
	Fecha_Venta date not null,
	Total int not null,
	Pagado bit not null,
	
)

go

CREATE TABLE ArticulosxVenta(

	IDventa int not null foreign key references Ventas(ID),
	IDarticulos int not null foreign key references Articulos(ID),
	Precio money not null,
	Cantidad_vendida int not null,
	Activo bit not null,
	primary key (IDventa, IDarticulos),
)

GO 
 

 go
Alter Table PrecioyStock
Add constraint FK_PyS_ Foreign Key (IDarticulo) references Articulos(ID)
go


go
Alter Table Envios
Add constraint FK_Envios_ Foreign Key (IDventas) references Ventas(ID)
go


--------------------------------------------------------------------------------------------
--INSERT


go
USE [REVOLLO_DB]
GO
SET IDENTITY_INSERT [dbo].[Tipos_Usuarios] ON 

INSERT [dbo].[Tipos_Usuarios] ([ID], [Nombre],[Activo]) VALUES (1, N'Administrador',1)
INSERT [dbo].[Tipos_Usuarios] ([ID], [Nombre],[Activo]) VALUES (2, N'Usuario',1)


SET IDENTITY_INSERT [dbo].[Tipos_Usuarios] OFF

GO

SET IDENTITY_INSERT [dbo].[Tipo_Razas] ON 

INSERT [dbo].[Tipo_Razas] ([ID], [Nombre], [Activo]) VALUES (1, N'Pequeñas',1)
INSERT [dbo].[Tipo_Razas] ([ID], [Nombre], [Activo]) VALUES (2, N'Medianas',1)
INSERT [dbo].[Tipo_Razas] ([ID], [Nombre], [Activo]) VALUES (3, N'Grandes',1)
INSERT [dbo].[Tipo_Razas] ([ID], [Nombre], [Activo]) VALUES (4, N'Todas las razas',1)


SET IDENTITY_INSERT [dbo].[Tipo_Razas] OFF

GO


SET IDENTITY_INSERT [dbo].[Tipo_Edades] ON 

INSERT [dbo].[Tipo_Edades] ([ID], [Nombre], [Activo]) VALUES (1, N'Cachorros',1)
INSERT [dbo].[Tipo_Edades] ([ID], [Nombre], [Activo]) VALUES (2, N'Adultos',1)
INSERT [dbo].[Tipo_Edades] ([ID], [Nombre], [Activo]) VALUES (3, N'Mayores',1)
INSERT [dbo].[Tipo_Edades] ([ID], [Nombre], [Activo]) VALUES (4, N'Todas las edades',1)


SET IDENTITY_INSERT [dbo].[Tipo_Edades] OFF

GO

SET IDENTITY_INSERT [dbo].[Tipo_Animales] ON 

INSERT [dbo].[Tipo_Animales] ([ID], [Nombre], [Activo]) VALUES (1, N'Perros',1)
INSERT [dbo].[Tipo_Animales] ([ID], [Nombre], [Activo]) VALUES (2, N'Gatos',1)
INSERT [dbo].[Tipo_Animales] ([ID], [Nombre], [Activo]) VALUES (3, N'Aves',1)
INSERT [dbo].[Tipo_Animales] ([ID], [Nombre], [Activo]) VALUES (4, N'Peces',1)
INSERT [dbo].[Tipo_Animales] ([ID], [Nombre], [Activo]) VALUES (5, N'Todo tipo de animales',1)


SET IDENTITY_INSERT [dbo].[Tipo_Animales] OFF

GO

SET IDENTITY_INSERT [dbo].[Paises] ON 

INSERT [dbo].[Paises] ([ID], [Nombre], [Activo]) VALUES (1, N'Argentina',1)
INSERT [dbo].[Paises] ([ID], [Nombre], [Activo]) VALUES (2, N'Brasil',1)
INSERT [dbo].[Paises] ([ID], [Nombre], [Activo]) VALUES (3, N'Uruguay',1)
INSERT [dbo].[Paises] ([ID], [Nombre], [Activo]) VALUES (4, N'Chile',1)


SET IDENTITY_INSERT [dbo].[Paises] OFF

GO

SET IDENTITY_INSERT [dbo].[Provincias] ON 

INSERT [dbo].[Provincias] ([ID], [IDpais], [Nombre], [Activo]) VALUES (1,1, N'Buenos Aires',1)
INSERT [dbo].[Provincias] ([ID], [IDpais], [Nombre], [Activo]) VALUES (2,1, N'Entre Rios',1)
INSERT [dbo].[Provincias] ([ID], [IDpais], [Nombre], [Activo]) VALUES (3,1, N'Santa Fe',1)
INSERT [dbo].[Provincias] ([ID], [IDpais], [Nombre], [Activo]) VALUES (4,1, N'Cordoba',1)
INSERT [dbo].[Provincias] ([ID], [IDpais], [Nombre], [Activo]) VALUES (5,1, N'La Pampa',1)

INSERT [dbo].[Provincias] ([ID], [IDpais], [Nombre], [Activo]) VALUES (6,2, N'Santa Catarina',1)
INSERT [dbo].[Provincias] ([ID], [IDpais], [Nombre], [Activo]) VALUES (7,2, N'Goias',1)
INSERT [dbo].[Provincias] ([ID], [IDpais], [Nombre], [Activo]) VALUES (8,2, N'Sau Paulo',1)
INSERT [dbo].[Provincias] ([ID], [IDpais], [Nombre], [Activo]) VALUES (9,2, N'Paraiba',1)
								   

SET IDENTITY_INSERT [dbo].[Provincias] OFF

GO

SET IDENTITY_INSERT [dbo].[Marcas] ON 

INSERT [dbo].[Marcas] ([ID], [Nombre], [Activo]) VALUES (1, N'Vital Can',1)
INSERT [dbo].[Marcas] ([ID], [Nombre], [Activo]) VALUES (2, N'Dog Chow',1)
INSERT [dbo].[Marcas] ([ID], [Nombre], [Activo]) VALUES (3, N'Pro Plan',1)
INSERT [dbo].[Marcas] ([ID], [Nombre], [Activo]) VALUES (4, N'Sabrocitos',1)
INSERT [dbo].[Marcas] ([ID], [Nombre], [Activo]) VALUES (5, N'Wiskas',1)
INSERT [dbo].[Marcas] ([ID], [Nombre], [Activo]) VALUES (6, N'Juguetes Mordida',1)
INSERT [dbo].[Marcas] ([ID], [Nombre], [Activo]) VALUES (7, N'Perla Blanca',1)


SET IDENTITY_INSERT [dbo].[Marcas] OFF

GO


--INSERT A TABLA DE ARTICULOS

insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('VTC','Vital Can Balanced','Kiten,bolsa 8kg',1,2,2,1,'https://s3-sa-east-1.amazonaws.com/mispichos.com.ar/mp_images/desktop_vital-can-balanced-gato-kitten_237',1)


insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('VTC','Vital Can Balanced','Kiten,bolsa 8kg',1,2,2,2,'https://s3-sa-east-1.amazonaws.com/mispichos.com.ar/mp_images/desktop_vital-can-balanced-gato-adult_238',1)


insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('VTC','Vital Can Balanced','Senior,bolsa 20kg',1,1,2,3,'https://d26lpennugtm8s.cloudfront.net/stores/068/331/products/vitalcan-balanced-perro-senior-mediana-x-3-kg1-42e8f3cadab6727b0115254435346886-480-0.jpg',1)


insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('VTC','Vital Can Balanced','Medium, bolsa 20kg',1,1,2,1,'https://http2.mlstatic.com/vital-can-balanced-cachorro-medium-x-20kg-zona-norte-il-cane-D_NQ_NP_661733-MLA31123050936_062019-F.jpg',1)


insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('DGC','Dog Chow','Digestion Sana,bolsa 20kg',2,1,3,2,'https://www.monamour.com.ar/wp-content/uploads/2019/01/dog-chow-adulto-raza-mediana-8kg.jpg',1)


insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('DGC','Dog Chow','Nutricion Temprana,bolsa 20kg',2,1,2,1,'https://www.balanceadosmendoza.com/wp-content/uploads/2017/07/dog-chow-cachorros-razas-medianas-y-grandes-alimento-para-perro-mendoza-balanceados-mendoza.jpg',1)


insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('DGC','Dog Chow','Sano y en forma,bolsa 20kg',2,1,4,2,'https://d26lpennugtm8s.cloudfront.net/stores/124/618/products/sanoyforma1-b151f3c5febc66a6eb15279483254591-320-0.png',1)


insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('SBR','Sabrocitos Complex','Hierro y vitaminas, bolsa 20kg',4,1,3,2,'https://www.petsonline.com.ar/wp-content/uploads/Optimizadas/sabrositos-mix-adultos-perro-a.jpg',1)


insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('SBR','Sabrocitos Complete','Cerdo y arroz, bolsa 20kg',4,1,2,2,'https://www.lineadecompras.com/imagenes/productos/f3177foto1.jpg',1)


insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('SBR',N'Sabrocitos Kiten',N'30% Proteinas, bolas 4kg',4,2,2,2,'https://walmartar.vteximg.com.br/arquivos/ids/801637-1000-1000/0779807317037-1.jpg?v=636240413290370000',1)

insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('JM','Ide Pet Mordillo','Limpiador de dientes molares',6,1,4,4,'https://ae01.alicdn.com/kf/HTB1wJg_aG1s3KVjSZFAq6x_ZXXaU/Juguetes-para-perros-limpiador-de-dientes-molares-para-mascotas-palo-de-cepillado-juguete-para-masticar-perros.jpg',1)

insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('JM','Pelota antiestres','Pelota de goma dura',6,1,4,4,'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQxKmIPulotCz315C5dYdpZ6v9_9LPQggIZqg&usqp=CAU',1)

insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('JM','Pelota blanda','Pelota suave',6,1,4,4,'https://cdn.palbin.com/users/20575/images/juguetes-perros-pelotas-goma-sonido-originales-baratas-colores-1490267379.jpg',1)

insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('JM','Soga Reforzada','Soga reforzada para morder',6,1,4,4,'https://trapillo.com/blog/wp-content/uploads/2014/03/Juguete-para-mascotas-con-trapillo.jpg',1)


insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('JM','Estacion de juego','Set con pisos y desniveles',6,2,4,4,'https://http2.mlstatic.com/rascador-gato-gimnasio-cama-hilo-sisal-juguetes-palo-D_NQ_NP_813804-MLA42460250131_072020-V.webp',1)

insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('PB','Transportadora atlas','Para perros y gatos',7,5,4,4,'https://http2.mlstatic.com/transportadora-atlas-jet-10-italiana-gatos-y-perros-il-cane-D_NQ_NP_620345-MLA40463965729_012020-V.webp',1)

insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('PB','Set Tunel y Almohada','Tunel interactivo y cojin alcolchonado',7,2,4,4,'https://http2.mlstatic.com/D_NQ_NP_607614-MLA31085685178_062019-V.webp',1)

insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('PB','Varita ate','Viene con peluche y pluma',7,2,4,4,'https://http2.mlstatic.com/varita-con-peluche-y-pluma-para-gatos-trixie-D_NQ_NP_826866-MLA31019730201_062019-V.webp',1)

insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('PB','Raton a cuerda','Incluye felpudo y cascabel',7,2,4,4,'https://http2.mlstatic.com/rata-ratita-a-cuerda-juguete-para-gatos-muy-divertido-D_NQ_NP_651448-MLA31788002663_082019-V.webp',1)

insert into Articulos(Codigo,Nombre,Descripcion,IDmarca,IDanimal,IDraza,IDedades,Imagen_Url,Activo)
values('PB','Pelotas fux','Multicoleresy con sonido',7,2,4,4,'https://http2.mlstatic.com/juguetes-pelotas-gatos-gatitos-multicolor-diversion-cancat-D_NQ_NP_819882-MLA41542266698_042020-V.webp',1)


go

----INSERT A TABLA PRECIO Y SOTCK
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(1,90,3200,800,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(2,90,2500,800,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(3,90,2400,1000,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(4,90,2000,800,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(5,90,1700,800,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(6,90,1600,800,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(7,90,1200,800,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(8,90,1500,800,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(9,90,1200,800,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(10,90,1900,800,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(11,90,350,80,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(12,90,250,50,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(13,90,150,50,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(14,90,600,200,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(15,90,4500,1200,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(16,90,5400,1200,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(17,90,2400,1000,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(18,90,1700,300,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(19,90,200,40,1)
insert into PrecioyStock(IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo) values(20,90,110,40,1)




go

--INSERT A TABLA USUARIOS

--ADMIN

insert into Usuarios (Dni,Apellido,Nombre,Nick_Name,Contraseña,Email,Sexo,telefono,IDprovincia,IDtipo,F_nacimiento,Activo)
values(36915472,'Revollo','Nahuel','Revo7','river1','revollonahuel@hotmail.com','M','1567994044',1,1,cast('05/08/1992' as date),1)

-- USUARIOS

insert into Usuarios (Dni,Apellido,Nombre,Nick_Name,Contraseña,Email,Sexo,telefono,IDprovincia,IDtipo,F_nacimiento,Activo)
values(34234321,'Revollo','Rocio','Rochi','papa1','culi@hotmail.com','F','1522334455',1,2,cast('21/10/1999' as date),1)

insert into Usuarios (Dni,Apellido,Nombre,Nick_Name,Contraseña,Email,Sexo,telefono,IDprovincia,IDtipo,F_nacimiento,Activo)
values(34567098,'Revollo','Ambar','Ambaricia','roco1','asrevollo@hotmail.com','F','1588776655',1,2,cast('24/04/1993' as date),1)

insert into Usuarios (Dni,Apellido,Nombre,Nick_Name,Contraseña,Email,Sexo,telefono,IDprovincia,IDtipo,F_nacimiento,Activo)
values(18344009,'Gudino','Monica','abumoni','ambu1','mornis@hotmail.com','F','1512436578',1,2,cast('10/10/1966' as date),1)



--INSERT TABLA DIRECIONES

insert into Direcciones (IDusuario,IDprovincia,Localidad,CP,Calle,Altura,Entrecalle1,Entrecalle2,Activo)
values(2,1,'TIGRE',1618,'Marconi',398,'Almirante Brown','Lujan',1)

insert into Direcciones (IDusuario,IDprovincia,Localidad,CP,Calle,Altura,Entrecalle1,Entrecalle2,Activo)
values(2,1,'TIGRE',1618,'Bolivia',549,'Gelly obes','Vivaldi',1)

insert into Direcciones (IDusuario,IDprovincia,Localidad,CP,Calle,Altura,Entrecalle1,Entrecalle2,Activo)
values(3,1,'San Isidro',1617,'Francia',498,'lope de vega','Lacar',1)

insert into Direcciones (IDusuario,IDprovincia,Localidad,CP,Calle,Altura,Entrecalle1,Entrecalle2,Activo)
values(3,1,'TIGRE',1618,'Roca',1238,'3 de febrero','Lincon',1)

insert into Direcciones (IDusuario,IDprovincia,Localidad,CP,Calle,Altura,Entrecalle1,Entrecalle2,Activo)
values(3,1,'San Fernando',1615,'Suipacha',789,'Esq. Aguado','',1)

insert into Direcciones (IDusuario,IDprovincia,Localidad,CP,Calle,Altura,Entrecalle1,Entrecalle2,Activo)
values(4,1,'TIGRE',1618,'Alberti',540,'Entre Rios','Cuba',1)


--INSERT TABLA VENTAS

---Usuario 2
INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (2,cast('10/08/2019' as date),1400,1)

INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (2,cast('28/09/2019' as date),5400,1)

INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (2,cast('5/10/2019' as date),4100,1)

INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (2,cast('15/02/2020' as date),5400,1)

INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (2,cast('10/03/2020' as date),2800,1)

INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (2,cast('01/07/2020' as date),5400,1)

INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (2,cast('06/07/2020' as date),1200,1)

INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (2,cast('12/07/2020' as date),3200,0)

----

--usuario 3

INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (3,cast('02/07/2020' as date),5400,0)

INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (3,cast('07/07/2020' as date),1200,0)

INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (3,cast('11/07/2020' as date),3200,1)

--usuario 4

INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (4,cast('03/07/2020' as date),5400,1)

INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (4,cast('08/07/2020' as date),1200,1)

INSERT	into Ventas (IDusuario,Fecha_Venta,Total,Pagado)
values (4,cast('13/07/2020' as date),3200,0)

--INSERT TABLA ARTICULOS X VENTAS

--Usuario 2
--venta 1

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (1,1,1200,1,1)

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (1,19,200,1,1)

-- venta 2

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (2,4,2000,1,1)

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (2,5,1700,2,1)

--venta 3

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (3,17,2400,1,1)

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (3,18,1700,1,1)

-- venta 4

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (4,4,2000,1,1)

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (4,5,1700,2,1)

-- venta 5

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (5,6,1600,1,1)

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (5,11,350,2,1)

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (5,12,250,2,1)

--venta 6

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (6,4,2000,1,1)

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (6,5,1700,2,1)


-- venta 7


insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (7,11,350,2,1)

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (7,12,250,2,1)

-- venta 8


insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (8,1,3200,1,1)
---
--usuario 3

--venta 1

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (9,4,2000,1,1)

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (9,5,1700,2,1)


-- venta 2


insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (10,11,350,2,1)

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (10,12,250,2,1)

-- venta 3


insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (11,1,3200,1,1)

--usuario4


--venta 1

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (12,4,2000,1,1)

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (12,5,1700,2,1)


-- venta 2


insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (13,11,350,2,1)

insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (13,12,250,2,1)

-- venta 3


insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
values (14,1,3200,1,1)


--INSERT TABLA ENVIOS

--envio venta 1

insert into Envios(IDventas,IDprovincia,Localidad,Cp,Calle,Altura,Entrecalle1,Entrecalle2,Activo)
values(1,1,'TIGRE',1618,'Marconi',398,'Almirante Brown','Lujan',1)

--envio venta 3

insert into Envios(IDventas,IDprovincia,Localidad,Cp,Calle,Altura,Entrecalle1,Entrecalle2,Activo)
values(3,1,'TIGRE',1618,'Bolivia',549,'Gelly obes','Vivaldi',1)

--envio venta 6

insert into Envios(IDventas,IDprovincia,Localidad,Cp,Calle,Altura,Entrecalle1,Entrecalle2,Activo)
values(6,1,'TIGRE',1618,'Marconi',398,'Almirante Brown','Lujan',1)


-- venta 8

insert into Envios(IDventas,IDprovincia,Localidad,Cp,Calle,Altura,Entrecalle1,Entrecalle2,Activo)
values(8,1,'TIGRE',1618,'Marconi',398,'Almirante Brown','Lujan',1)


-- venta 12

insert into Envios(IDventas,IDprovincia,Localidad,Cp,Calle,Altura,Entrecalle1,Entrecalle2,Activo)
values(12,1,'TIGRE',1618,'Alberti',540,'Entre Rios','Cuba',1)

-- venta 13

insert into Envios(IDventas,IDprovincia,Localidad,Cp,Calle,Altura,Entrecalle1,Entrecalle2,Activo)
values(13,1,'TIGRE',1618,'Alberti',540,'Entre Rios','Cuba',1)

-- venta 14

insert into Envios(IDventas,IDprovincia,Localidad,Cp,Calle,Altura,Entrecalle1,Entrecalle2,Activo)
values(14,1,'TIGRE',1618,'Alberti',540,'Entre Rios','Cuba',1)

----------------------------------------------------------------------------------------------------------------

--------------------------------------VIEWS----------------------------------------

go

create view VW_MisCompras 


as 

select v.ID,v.IDusuario,v.Fecha_Venta,v.Total,

case
when v.Pagado=0 then 'Por Pagar'
when v.Pagado=1 then 'Pagado'

end as Estado
,

(select COUNT(*) from ArticulosxVenta as axv
where v.ID=axv.IDventa) as cantidadVendida


from ventas as v

go


create view VW_InfoVentasMensual

as


select distinct

(select distinct MONTH(v.Fecha_Venta)as MesActual from Ventas as v
where MONTH(v.Fecha_Venta) = MONTH(GETDATE()) and YEAR(v.Fecha_Venta)= YEAR(GETDATE())) as mes,

(select distinct YEAR(v.Fecha_Venta)as AnioActual from Ventas as v
where YEAR(v.Fecha_Venta)= YEAR(GETDATE()))as anio,

(select COUNT(*) as ventasMes from Ventas as v
where MONTH(v.Fecha_Venta)=MONTH(GETDATE()) and YEAR(v.Fecha_Venta)= YEAR(GETDATE()) ) as'Ventas del mes',


(select COUNT(*)as Enviosdelmes from Envios as e
inner join Ventas as v on e.IDventas=v.ID
where  MONTH(v.Fecha_Venta)= MONTH(GETDATE()) and YEAR(v.Fecha_Venta)= YEAR(GETDATE()))as'envios del mes',


(select COUNT(v.ID)as RetiraLocalDelMes from ventas as v
where v.ID not in(select e.IDventas from Envios as e) and MONTH(v.Fecha_Venta)= MONTH(GETDATE()) and YEAR(v.Fecha_Venta)= YEAR(GETDATE()))as'retiros del local ',

(select sum(v.Total)as totalvendido from Ventas as v
where MONTH(v.Fecha_Venta)= MONTH(GETDATE()) and YEAR(v.Fecha_Venta)= YEAR(GETDATE()))as'total vendido'


from ventas as v 


go






--------------------------------------------------------------------------------------------

------------------------------------SP-----------------------------------------------------



create procedure SP_ObtenerPrecio
(@IDarticulo int)

as
begin

select * from PrecioyStock
where IDarticulo= @IDarticulo

end

go


create procedure SP_UltimoArticulo

as
begin

select max(ID) from Articulos

end

go

create procedure SP_AgregarPyS
(
	@ID int,
	@Stock int,
	@Pventa money,
	@Pcompra money,
	@Activo bit

)
as

begin

insert into PrecioyStock (IDarticulo,Stock,PrecioVenta,PrecioCompra,Activo)
values(@ID, @Stock, @Pventa, @Pcompra, @Activo)


end

go


create procedure SP_EliminarPrecio
(
	@IDarticulo int
)

as
begin

update PrecioyStock set Activo=0 where IDarticulo=@IDarticulo


end

go

create procedure SP_Guardar_Usuario
(
	@Dni varchar(8),
	@Apellido varchar (50),
	@Nombre varchar (50),
	@Nick_Name varchar(50),
	@Contraseña varchar(50),
	@Email varchar(50),
	@Sexo char(1),
	@Telefono int,
	
	@IDprovincia int,
	@F_nacimiento date,

	-- datos de direccion--

	
	@Localidad varchar(50),
	@CP int,
	@Calle varchar (50),
	@Altura int,
	@Entrecalle1 varchar(50),
	@Entrecalle2 varchar(50)
	)
	as 
	BEGIN
	begin transaction
	insert into Usuarios(Dni,Apellido,Nombre,Nick_Name,Contraseña,Email,Sexo,telefono,IDprovincia,IDtipo,F_nacimiento,Activo)

	values(@Dni,@Apellido,@Nombre,@Nick_Name,@Contraseña,@Email,@Sexo,@telefono,@IDprovincia,2,@F_nacimiento,1)

	declare @IDusuario bigint

	set @IDusuario=@@IDENTITY

	insert into Direcciones(IDusuario,IDprovincia,Localidad,CP,Calle,Altura,Entrecalle1,Entrecalle2,Activo)

	values(@IDusuario,@IDprovincia,@Localidad,@CP,@Calle,@Altura,@Entrecalle1,@Entrecalle2,1)

	commit transaction

	END

	go

	
	create procedure SP_Guardar_Admin
(
	@Dni varchar(8),
	@Apellido varchar (50),
	@Nombre varchar (50),
	@Nick_Name varchar(50),
	@Contraseña varchar(50),
	@Email varchar(50),
	@Sexo char(1),
	@Telefono int,
	
	@IDprovincia int,
	@F_nacimiento date


	)
	as 
	BEGIN
	begin transaction
	insert into Usuarios(Dni,Apellido,Nombre,Nick_Name,Contraseña,Email,Sexo,telefono,IDprovincia,IDtipo,F_nacimiento,Activo)

	values(@Dni,@Apellido,@Nombre,@Nick_Name,@Contraseña,@Email,@Sexo,@telefono,@IDprovincia,1,@F_nacimiento,1)

	
	commit transaction

	END



	go

	create procedure SP_Nueva_Direccion
(
	@IDusuario int,
	@IDprovincia int,
	@Localidad varchar(50),
	@CP int,
	@Calle varchar(50),
	@Altura int,
	@Entrecalle1 varchar(50),
	@Entrecalle2 varchar(50)
	
)

as 
	BEGIN

	insert into Direcciones(IDusuario,IDprovincia,Localidad,CP,Calle,Altura,Entrecalle1,Entrecalle2,Activo)

	values(@IDusuario,@IDprovincia,@Localidad,@CP,@Calle,@Altura,@Entrecalle1,@Entrecalle2,1)

	END

	go

	



create procedure SP_UltimoUsuario

as
begin

select max(ID) from Usuarios

end

go


create procedure SP_UltimaVenta

as
begin

select max(ID) from Ventas

end

go

create procedure SP_ValidarUsuario
(@Nick_Name varchar(50))
as

begin

select * from Usuarios as u
where @Nick_Name=u.Nick_Name

end

go


create procedure SP_ValidarMail
(@mail varchar (50))
as

begin

select * from Usuarios as u
where @mail=u.Email

end


go

create procedure SP_LogIn
(
	@Nick_Name varchar(50),
	@Password varchar(50))

as
begin

select u.ID,u.Dni,u.Apellido,u.Nombre,u.Nick_Name,u.Contraseña,u.Email,u.Sexo,u.telefono,u.IDprovincia,u.IDtipo,u.F_nacimiento,u.Activo,prov.Nombre,pa.Nombre,pa.ID from Usuarios as u
inner join Provincias as prov on u.IDprovincia=prov.ID
inner join Paises as pa on prov.IDpais=pa.ID
where u.Contraseña=@Password and u.Nick_Name=@Nick_Name
end

go

create procedure SP_ListarDirecciones

(@IDusuario int)
as 
begin

select pa.Nombre,pa.ID,d.IDprovincia,p.Nombre,u.id,d.Localidad,d.CP,d.Calle,d.Altura,d.Entrecalle1,d.Entrecalle2,d.ID from Direcciones as d
inner join Usuarios as u on d.IDusuario=u.ID
inner join Provincias as p on d.IDprovincia=p.ID
inner join Paises as pa on p.IDpais=pa.ID


where d.IDusuario=@IDusuario and d.Activo=1

end

go





create procedure SP_Guardar_VentayEnvio
(
	@IDusuario int,
	@Fecha_venta date,
	@Total money,
	
	-- datos de envio--
	@IDprovincia int,
	@Localidad varchar(50),
	@CP int,
	@Calle varchar (50),
	@Altura int,
	@Entrecalle1 varchar(50),
	@Entrecalle2 varchar(50)
	)
	as 
	BEGIN
	begin transaction
	insert into Ventas(IDusuario,Fecha_Venta,Total,Pagado)

	values(@IDusuario,@Fecha_venta,@Total,0)

	declare @IDventa bigint

	set @IDventa=@@IDENTITY

	insert into Envios(IDventas,IDprovincia,Localidad,Cp,Calle,Altura,Entrecalle1,Entrecalle2,Activo)

	values(@IDventa,@IDprovincia,@Localidad,@CP,@Calle,@Altura,@Entrecalle1,@Entrecalle2,1)

	commit transaction


	END

	go

	create procedure SP_Guardar_Venta
(
	@IDusuario int,
	@Fecha_venta date,
	@Total money
	
	
	)
	as 
	BEGIN
	
	insert into Ventas(IDusuario,Fecha_Venta,Total,Pagado)

	values(@IDusuario,@Fecha_venta,@Total,0)

	end
	
	go

	create procedure SP_GuardarArticulosxVenta
	(
		@IDventa int,
		@IDarticulo int,
		@Precio money,
		@Cantidad_vendida int
		
	)
	as
	begin
	begin transaction

	insert into ArticulosxVenta(IDventa,IDarticulos,Precio,Cantidad_vendida,Activo)
	values(@IDventa,@IDarticulo,@Precio,@Cantidad_vendida,1)


	update PrecioyStock
	set Stock=(Stock-@Cantidad_vendida) where IDarticulo=@IDarticulo

	commit transaction
	end


go





create procedure SP_ModificarDatos_Personales
(
	@ID int,
	@Dni int,
	@Apellido varchar (50),
	@Nombre varchar(50),
	@Nick_Name varchar(50),
	@Email varchar(50),
	@Sexo varchar(1),
	@Telefono int,
	@IDprovincia int,
	@F_naciemiento date
)
as
begin

update Usuarios 
set Dni=@Dni,Apellido=@Apellido,Nombre=@Nombre,Nick_Name=@Nick_Name,Email=@Email,Sexo=@Sexo,telefono=@Telefono,IDprovincia=@IDprovincia,F_nacimiento=@F_naciemiento
where ID=@ID

end

go


create procedure SP_ModificarDireccion
(
	@ID int,
	@IDusuario int,
	@IDprovincia int,
	@Localidad varchar(50),
	@CP int,
	@Calle varchar(50),
	@Altura int,
	@Entrecalle1 varchar(50),
	@Entrecalle2 varchar(50)
)
as
begin

update Direcciones
set IDprovincia=@IDprovincia,Localidad=@Localidad,CP=@CP,Calle=@Calle,Altura=@Altura,Entrecalle1=@Entrecalle1,Entrecalle2=@Entrecalle2
where ID=@ID and IDusuario=@IDusuario

end

go


create procedure SP_VentasUsuario

(
	@IDusuario int

)
as 
begin

select * from VW_MisCompras as VW
where VW.IDusuario =@IDusuario



end

go

create procedure SP_Listar_ArtxVenta
(
	@IDventa int
)

as 
begin

select a.Nombre,m.Nombre,ta.Nombre,tr.Nombre,te.Nombre,a.Descripcion,axv.Cantidad_vendida,axv.Precio from Articulos as a
inner join Marcas as m on a.IDmarca =m.ID
inner join Tipo_Animales as ta on a.IDanimal=ta.ID
inner join Tipo_Razas as tr on a.IDraza=tr.ID
inner join Tipo_Edades as te on a.IDedades=te.ID

inner join ArticulosxVenta as axv on a.ID=axv.IDarticulos
where axv.IDventa=@IDventa

end

go

create procedure SP_BuscarEnvio
(
	@IDventa int
)
as 
begin

select e.IDprovincia,pa.Nombre,p.Nombre,e.Localidad,e.Cp,e.Calle,e.Altura,e.Entrecalle1,e.Entrecalle2 from Envios as e
inner join Provincias as p on e.IDprovincia=p.ID
inner join Paises as pa on p.IDpais=pa.ID
where e.IDventas=@IDventa

end


go


create procedure SP_ReporteMensual

as
begin

select * from VW_InfoVentasMensual
end

go

create procedure SP_VentaGenerales
as 
begin

select * from VW_MisCompras

end

go

create procedure SP_BuscarUsuario
(@IDusurio int)
as

begin

select * from Usuarios as u
where u.ID= @IDusurio


end

go