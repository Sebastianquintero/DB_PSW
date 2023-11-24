create database pswpap
use pswpap

--Creacion de tablas

create table ciudad(
idciudad int identity(1,1) primary key,
nomciudad varchar (50))

create table tipodoc(
idtipodoc int identity(1,1) primary key,
nomtipodoc varchar (50))

create table tipoprod(
idtipoprod int identity(1,1) primary key,
nomtipoprod varchar (50))

create table clientes(
idcliente int identity(1,1) primary key,
nombres varchar (150),
idciudad int,
direccion varchar (100),
telefono varchar (20),
idtipodoc int,
numdoc varchar(50))

create table vendedor(
idvendedor int identity(1,1) primary key,
nombres varchar(150),
idciudad int,
direccion varchar(100),
telefono varchar (20),
idtipodoc int,
numdoc varchar(50))

create table proveedor(
idproveedor int identity(1,1) primary key,
nomprov varchar(100),
idtipodoc int,
numdoc varchar(50),
contacto varchar(50),
idciudad int,
direccion varchar(100),
telefono varchar(20),
email varchar(120)
)

create table producto(
idproducto int identity(1,1) primary key,
numprod varchar(10),
idtipoprod int,
idproveedor int,
vunitario numeric)

create table ventas(
idventas int identity(1,1) primary key,
idproducto int,
idcliente int,
idvendedor int,
vunitario numeric,
cantidad numeric,
subtotal numeric,
iva numeric,
total numeric)

--Add Foreign key all tables


alter table clientes
add constraint clientes_ciudad foreign key (idciudad) references ciudad(idciudad)

alter table clientes 
add constraint fk_clientes_tipodoc foreign key (idtipodoc) references tipodoc(idtipodoc) 

alter table producto
add constraint fk_producto_tipoprod foreign key (idtipoprod) references tipoprod(idtipoprod)

alter table producto
add constraint fk_producto_proveedor foreign key (idproveedor) references proveedor(idproveedor)

alter table proveedor
add constraint fk_proveedor_tipodoc foreign key (idtipodoc) references tipodoc(idtipodoc)

alter table proveedor
add constraint fk_proveedor_ciudad foreign key (idciudad) references ciudad(idciudad)

alter table vendedor 
add constraint fk_vendedor_ciudad foreign key (idciudad) references ciudad(idciudad)

alter table vendedor
add constraint fk_vendedor_tipodoc foreign key (idtipodoc) references tipodoc(idtipodoc)

alter table ventas
add constraint fk_ventas_producto foreign key (idproducto) references producto(idproducto)

alter table ventas
add constraint fk_ventas_cliente foreign key (idcliente) references clientes(idcliente)

alter table ventas
add constraint fk_ventas_vendedor foreign key (idvendedor) references vendedor(idvendedor)

-- Insert data all tables

insert into ciudad
values('Bogota'),
('Cali'),
('Tunja'),
('Cucuta'),
('Manizales'),
('Bucaramanga'),
('Santa Marta'),
('Cartagena'),
('Barranquilla'),
('Paipa'),
('Medellin'),
('Villavicencio'),
('Ibague'),
('Pereira'),
('Valledupar'),
('San gil'),
('Pasto'),
('Monteria'),
('Palmira'),
('Popayan')

insert into tipodoc
values('Cedula Ciudadania'),
('Tarjeta identidad'),
('Registro Civil'),
('Pasaporte'),
('Licencia Conduccion'),
('PPT'),
('Pasaporte Extranjero')

insert into tipoprod
values('Comida China'),
('Comida Colombiana'),
('Comida Peruana'),
('Comida Venezolana'),
('Comida Brasilera'),
('Comida Argentina'),
('Comida Chilena'),
('Comida Italiana'),
('Comida Espanola'),
('Comida Francesa'),
('Comida Ecuatoriana'),
('Comida Panamena'),
('Comida Boliviana'),
('Comida Mexicana'),
('Comida Uruaguaya'),
('Comida Paraguaya'),
('Comida Cubena'),
('Comida Salvadorena'),
('Comida Hondurena'),
('Comida Alemana')

insert into clientes
values('Juan Gabriel Garrido',1,'CRA 1','3156945632',1,'2564892'),
('Maria Elvira Maroto',2,'CALLE 9','3205689045',2,'26354928'),
('Pedro Javier Santamaria',3,'Cra 5','3506942631',3,'8931035'),
('Emilia Valcarcel',4,'Diagonal 2','3205875123',4,'4521065'),
('Alvaro Cañas',5,'Transversal 12','3125684964',5,'4812131'),
('Soledad Blazquez',6,'Calle 4','3236945324',6,'8946520'),
('Hugo Valero',7,'Cra 7','3105864203',7,'82103547'),
('Andrea Fonseca',8,'Diagonal 13','3516489432',1,'16521823'),
('Juan Calvo',9,'Transversal 12','3105976403',2,'9465210'),
('Antonia Maria Arteaga',10,'Calle 20','3206494650',3,'9464263'),
('Noa Santamaria',11,'Cra 112','3215685124',4,'8561623'),
('Cristina Ibañez',12,'Calle 127','3259657456',5,'561623'),
('Eva Arias',13,'Diagonal 56','3569784301',6,'5879103'),
('Yolanda Fernandez',14,'Transversal 45','3469784610',7,'5861216'),
('Guillermo Moreno',15,'Calle 89','3021564951',1,'58761234'),
('Gloria Gallego',16,'Cra 45','3049658701',2,'8913512'),
('Jaime Iglesias',17,'Transversal 102','3026407913',3,'861263'),
('Josep Carmona',18,'Diagonal 78','3048943003',4,'84651312'),
('Sara Muñoz',19,'Calle 189','3124697531',5,'89461300'),
('Alvaro Lozano',20,'Transversal 56','3105489461',6,'89436136')

insert into vendedor
values('Carmen Lozano',1,'Cra 152','3105976459',1,'897162303'),
('Joan Crespo',2,'Calle 59','3102549762',2,'894305323'),
('Pilar Caballero',3,'Transversal 3','3125694723',3,'89626123'),
('María Luisa Jimenez',4,'Diagonal 60','3209456312',4,'87461023'),
('Agustin Molina',5,'Cra. 112','3046578943',5,'5945133'),
('Carmen Lozano',6,'Calle 56','3015296070',6,'89436133'),
('Sergio Suarez',7,'Transversal 56','3251513222',7,'9323301'),
('Jaime Lopez',8,'Diagonal 58','3014658643',1,'5897431'),
('Mariano Torres ',9,'Calle 52','3561311315',2,'5643616'),
('Julian Vicente',10,'Cra 26','3125670465',3,'59984123'),
('Jorge Parra',11,'Calle 116','3204658970',4,'894310302'),
('Pedro Vazquez',12,'Cra 123','3146578942',5,'846123478'),
('Ismael Martin',13,'Transversal 23','3164799542',6,'5043615'),
('Pilar Romero',14,'Diagonal 145','3124987561',7,'89412303'),
('Sonia Moreno',15,'Calle 127','3124975698',1,'5462303'),
('Verónica Martinez',16,'Cra 105','3156794652',2,'57962320'),
('Sonia Martinez',17,'Transversal 156','3102356415',3,'561510322'),
('Rosa María Diez',18,'Diagonal 49','3102465120',4,'626031250'),
('Yolanda Saez',19,'Calle 99','3105479430',5,'323120213'),
('Inés Reyes',20,'Cra 68','3204681314',6,'5623433')

insert into proveedor
values('Pepsi',1,'12462305','Facebook',2,'Cra 56','31264615','pepsi@gmail.com'),
('Colanta',2,'1221515','Instagram',3,'Cra 84','2322626','Colanta@gmail.com'),
('Cocacola',3,'212561','Telegram,',4,'Cra 4','2561351','coca@hotmail.com'),
('Pepsi',4,'82663236','Gmail',5,'Calle falsa','261513215','pepsi@hotmail.com'),
('RedBull',5,'26451251','Hotmail',6,'Transversal 56','2511035','redbull@gmail.com'),
('Monster',6,'5626452','Whatsapp',7,'Diagonal 68','65626589','monster@microsoft.es'),
('Nescafe',7,'68451613','Facebook',8,'Cra 89','89163103','nescafe@hotmail.com'),
('Gatorade',1,'23611461','Instagram',9,'Cra 23','2361633','gatorade@gmail.com'),
('Dr pepper',2,'89416163','Whatsapp',10,'Calle 98','461315','drpper@hotmail.com'),
('Sprite',3,'59751613','Telegram',11,'Transversal 21','4663234','sprite@microsoft.es'),
('Margarita',4,'566323621','Hotmail',12,'Diagonal 23','6563236','marga@hotmail.com'),
('Oreo',5,'5163030','Gmail',13,'Calle 89','2312512','oreo@gmail.com'),
('p&g',6,'2626142','Facebook',14,'Cra 4','26651584152','p&h@hotmail.com'),
('nestle',7,'9852303','Instagram',15,'Transversal 56','59231302','nestle@microsoft.es'),
('7up',1,'151321031','Hotmail',16,'Diagonal 45','622315515','sevenup@hotmail.com'),
('m&m',2,'79163123','Gmail',17,'Calle 145','626315152','mandm@gmail.com'),
('Doritos',3,'51134301','Facebook',18,'Cra 56','100215132','doritos@microsoft.es'),
('Trident',4,'792362323','Instagram',19,'Transversal 18','121515','trident@hotmail.com'),
('maggi',5,'124648626','Telegram',20,'Diagonal 26','24853132','maggi@gmail.com'),
('Fanta',1,'626323635','hotmail',1,'Cra 7','31248956','fanta@hotmail.com')

insert into producto
values('Banano',1,1,20),
('Manzana',2,2,10),
('Patilla',3,3,15),
('Zapote',4,4,7),
('Guanabana',5,5,12),
('Uvas',6,6,5),
('Pera',7,7,15),
('Durazno',8,8,17),
('Aguacate',9,9,20),
('Papaya',10,10,25),
('Melon',11,11,15),
('Mondongo',12,12,25),
('Chicharron',13,13,45),
('Chorizo',14,14,26),
('Arepas',15,15,20),
('Gaseosa',16,16,30),
('Dulces',17,17,6),
('Perro',18,18,60),
('Salchipapa',19,19,50),
('Granadilla',20,20,30)


insert into ventas
values(1,1,1,10,2,20,2,22),
(2,2,2,15,2,30,3,33),
(3,3,3,12,3,36,3,39),
(4,4,4,5,2,10,3,13),
(5,5,5,10,3,30,3,33),
(6,6,6,2,5,10,2,12),
(7,7,7,3,3,9,3,12),
(8,8,8,4,2,8,2,10),
(9,9,9,5,1,5,2,7),
(10,10,10,6,2,12,4,18),
(11,11,11,15,2,30,3,33),
(12,12,12,12,3,36,3,39),
(13,13,13,5,2,10,3,13),
(14,14,14,10,3,30,3,33),
(15,15,15,2,5,10,2,12),
(16,16,16,3,3,9,3,12),
(17,17,17,4,2,8,2,10),
(18,18,18,5,1,5,2,7),
(19,19,19,6,2,12,4,18),
(20,20,20,5,2,10,3,13)

select * from ciudad
select * from tipodoc
select * from tipoprod
select * from clientes
select * from producto
select * from proveedor
select * from vendedor
select * from ventas

 /*  -------------- CREANDO PROCEDIMIENTOS ALMACENADOS ------------------ */

 /*------- Consultar Ciudad ------ */
create procedure selectcity
(
@idcity int
)
as
begin
select
idciudad as [CODIGO CIUDAD],
nomciudad as [NOMBRE CIUDAD]
from ciudad
where @idcity=idciudad
end

exec selectcity 2

/* ------------Actualizar Ciudad ----------- */ 

create procedure updatecity2
(
@idcity int,
@nomciudad varchar(50)
)
as
begin
update ciudad
set nomciudad=@nomciudad
where idciudad=@idcity
end

exec updatecity2 7,'Cocoral'

select * from ciudad

/* ------------ Insertar  Ciudad ---------- */

create procedure insertcity
(
@nomciudad varchar(50)
)
as
begin
insert into ciudad values(@nomciudad)
end

exec insertcity 'Facatativa'

/* -------- Eliminar Ciudad ---------  */

create procedure elimiciudad
(
@idciudad int
)
as
begin
delete ciudad
where idciudad=@idciudad
end

exec elimiciudad 21

/* Consultar Clientes   -----------------    */

create procedure consulcli2
(
@idcliente int
)
as
begin
select
idcliente as [Codigo Cliente],
nombres as [Nombre Cliente],
direccion,
telefono
from clientes
where @idcliente=idcliente
end

exec consulcli2 15

/* ------------ INSERTAR CLIENTES  ------------ */
create procedure insetcli
(
@nombres varchar (50),
@idciudad int,
@direccion varchar(50),
@telefono varchar(50),
@idtipodoc int,
@numdoc varchar(50)
)
as
begin
insert into clientes values(@nombres,@idciudad,@direccion,@telefono,@idtipodoc,@numdoc)
end

exec insetcli 'Julio Alvarez',3,'Cra 115 no. 67-20','3125689465',1,'25616356'

select * from clientes

/* -------- UPDATE CLIENTES --------- */

create procedure updaclientes
(
@idcliente int,
@nombres varchar(50),
@idciudad int,
@direccion varchar(50),
@telefono varchar(50),
@idtipodoc int,
@numdoc varchar(50)
)
as
begin
update clientes set nombres=@nombres,idciudad=@idciudad,direccion=@direccion,telefono=@telefono,idtipodoc=@idtipodoc,numdoc=@numdoc
where idcliente=@idcliente
end

exec updaclientes 21,'Dora Alvarez',5,'Calle falsa 25','31563458',2,'1016559236'

/*--------  ELIMINAR CLIENTE  ----------- */

create procedure dropcliente
(
@idcliente int
)
as
begin
delete clientes
where idcliente=@idcliente
end

exec dropcliente 21

/* Consultar Producto   -----------------    */

create procedure consulprod
(
@idproducto int
)
as
begin
select
idproducto as [Codigo Producto],
nomprod as [Nombre Producto],
idtipoprod as [Codigo Tipo Producto],
idproveedor as [Codigo Proveedor],
vunitario as [Valor Unitario]
from producto
where @idproducto=idproducto
end

exec consulprod 2

/*   Insertar Producto  --- */

create procedure insertpro
(
@nomprod varchar(50),
@idtipoprod int,
@idproveedor int,
@vunitario numeric
)
as
begin
insert into producto values(@nomprod,@idtipoprod,@idproveedor,@vunitario)
end

exec insertpro 'teclado',2,3,30

/*------------- UPDATE PRODUCTO  ----------------*/

select * from producto

create procedure updaproducto
(
@idproducto int,
@nomprod varchar(50),
@idtipoprod int,
@idproveedor int,
@vunitario numeric
)
as
begin
update producto set nomprod=@nomprod,idtipoprod=@idtipoprod,idproveedor=@idproveedor,vunitario=@vunitario
where idproducto=@idproducto
end

exec updaproducto 21,'tecladito',4,5,25

/* ---------- DELETE PRODUCTO  ---------*/

create procedure dropproducto
(
@idproducto int
)
as
begin
delete producto
where idproducto=@idproducto
end

exec dropproducto 21

/* Consultar Proveedor   -----------------    */

create procedure consulprovee1
(
@idproveedor int
)
as
begin
select
idproveedor as [Codigo Proveedor],
nomprov as [Nombre Proveedor],
idtipodoc as [Codigo tipo documento],
numdoc as [Numero de documento],
idciudad as [Codigo Ciudadad],
direccion,
telefono,
email
from proveedor
where @idproveedor=idproveedor
end

exec consulprovee1 10

/* -----  Insertar Proveedor  ----- */
create procedure insertprovee
(
@nomprov varchar(50),
@idtipodoc int,
@numdoc varchar(50),
@contacto varchar(50),
@idciudad int,
@direccion varchar(100),
@telefono varchar(10),
@email varchar(50)
)
as
begin
insert into proveedor values(@nomprov,@idtipodoc,@numdoc,@contacto,@idciudad,@direccion,@telefono,@email)
end

exec insertprovee 'samsung',2,'10416215','521562',4,'Calle 89','3185964230','setv@gmail.com'

select * from proveedor

/* ----------- UPDATE PROVEEDOR ----------- */

create procedure updateprovee
(
@idproveedor int,
@nomprov varchar(50),
@idtipodoc int,
@numdoc varchar(50),
@contacto varchar(50),
@idciudad int,
@direccion varchar(100),
@telefono varchar(50),
@email varchar(50)
)
as
begin
update proveedor set nomprov=@nomprov,idtipodoc=@idtipodoc,numdoc=@numdoc,contacto=@contacto,idciudad=@idciudad,direccion=@direccion,telefono=@telefono,email=@email
where idproveedor=@idproveedor
end

exec updateprovee 21,'kmc',1,'10216512','Email','1','Cra 56','3156975946','kmc@outlook.es'

/*-----   DELETE PROVEEDOR  ---------*/

create procedure dropprovee
(
@idproveedor int
)
as
begin
delete proveedor
where idproveedor=@idproveedor
end

exec dropprovee 21

/*--------- Consultar tipodoc   -----------------    */


create procedure consultipodoc
(
@idtipodoc int
)
as
begin
select
idtipodoc as [Codigo Documento],
nomtipodoc as [Nombre De Documento]
from tipodoc
where @idtipodoc=idtipodoc
end

exec consultipodoc 5

/*--------- Insertar tipodoc   -----------------    */

select * from tipodoc

create procedure inserttipodoc
(
@nomtipodoc varchar(50)
)
as
begin
insert into tipodoc values(@nomtipodoc)
end

exec inserttipodoc 'DNI'

/*--------  UPDATE TIPODOC  -----------*/

create procedure updatetipodoc
(
@idtipodoc int,
@nomtipodoc varchar(50)
)
as
begin
update tipodoc set nomtipodoc=@nomtipodoc
where idtipodoc=@idtipodoc
end

exec updatetipodoc 8,'Samsung'

/*------ DELETE TIPODOC ------- */

create procedure droptipodoc
(
@idtipodoc int
)
as
begin
delete tipodoc
where idtipodoc=@idtipodoc
end

exec droptipodoc 8

/* -------- CONSULTAR TIPOPROD  -----------------    */

create procedure consultipoprod
(
@idtipoprod int
)
as
begin
select
idtipoprod [Codigo Tipo Producto],
nomtipoprod [Nombre Tipo Producto]
from tipoprod
where @idtipoprod=idtipoprod
end

exec consultipoprod 20

/* ----------Insertar Tipoprod  -----------------    */

create procedure inserttipoprod
(
@nomtipoprod varchar(50)
)
as
begin
insert into tipoprod values(@nomtipoprod)
end

exec inserttipoprod 'Choclitos'

select * from tipoprod

/*------------------  UPDATE TIPOPROD  -----------*/

create procedure updatetipoprod
(
@idtipoprod int,
@nomtipoprod varchar(50)
)
as
begin
update tipoprod set nomtipoprod=@nomtipoprod
where idtipoprod=@idtipoprod
end

exec updatetipoprod 21,'Celular'

/* ------------- DELETE TIPOPROD ------ */

create procedure droptipoprod
(
@idtipoprod int
)
as
begin
delete tipoprod
where idtipoprod=@idtipoprod
end

exec droptipoprod 21

/* ------ Consultar  Vendedor ----------    */

create procedure consulvende
(
@idvendedor int
)
as
begin
select
a.idvendedor as [Codigo Vendedor],
nombres,
b.nomciudad as [Ciudad],
a.direccion,
a.telefono,
c.nomtipodoc as [Tipo de Documento],
a.numdoc as [Numero Documento]
from vendedor as a
inner join ciudad as b on a.idciudad=b.idciudad
inner join tipodoc as c on a.idtipodoc=c.idtipodoc
where @idvendedor=idvendedor
end

exec consulvende 1

/* ----INSERTAR Vendedor ----  */

create procedure insertvende
(
@nombres varchar(50),
@idciudad int,
@direccion varchar(50),
@telefono varchar(50),
@idtipodoc int,
@numdoc varchar(50)
)
as
begin
insert into vendedor values(@nombres,@idciudad,@direccion,@telefono,@idtipodoc,@numdoc)
end

exec insertvende 'Pepe Andrade',2,'Cra. 234','3125689120',1,'56464151'

select * from vendedor

/*----- UPDATE VENDEDOR -------- */
create procedure updatevendedor
(
@idvendedor int,
@nombres varchar(50),
@idciudad int,
@direccion varchar(50),
@telefono varchar(50),
@idtipodoc int,
@numdoc varchar(50)
)
as
begin
update vendedor set nombres=@nombres,idciudad=@idciudad,direccion=@direccion,telefono=@telefono,idtipodoc=@idtipodoc,numdoc=@numdoc
where idvendedor=@idvendedor
end

exec updatevendedor 21,'Otro Pepe',3,'Calle falsa 123','310516303',2,'26263151323'

/* ----  DELETE VENDEDOR  ---------  */

create procedure deletevende
(
@idventedor int
)
as
begin
delete vendedor
where idvendedor=@idventedor
end

exec deletevende 21

/* ---- CONSULTAR VENTAS  ----  */

create procedure consulventas
(
@idventas int
)
as
begin
select
a.idventas [Codigo Venta],
b.nomprod [Nombre producto],
c.nombres [Nombre Cliente],
d.nombres [Nombre Vendedor],
a.vunitario,
a.cantidad,
a.subtotal,
a.iva,
a.total
from ventas as a
inner join producto as b on a.idproducto=b.idproducto
inner join clientes as c on a.idcliente=c.idcliente
inner join vendedor as d on a.idvendedor=d.idvendedor
where @idventas=idventas
end

exec consulventas 20

select * from ventas

/* ---- INSERTAR VENTAS  ----  */

create procedure insertventas
(
@idproducto int,
@idcliente int,
@idvendedor int,
@vunitario numeric,
@cantidad numeric,
@subtotal numeric,
@iva numeric,
@total numeric
)
as
begin
insert into ventas values(@idproducto,@idcliente,@idvendedor,@vunitario,@cantidad,@subtotal,@iva,@total)
end

exec insertventas 2,3,20,56,3,89,10,99

select * from ventas


/* -------------- ACTUALIZAR VENTAS -------------- */
create procedure updateventas
(
@idventas int,
@idproducto int,
@idcliente int,
@idvendedor int,
@vunitario numeric,
@cantidad numeric,
@subtotal numeric,
@iva numeric,
@total numeric
)
as
begin
update ventas set idproducto=@idproducto,idcliente=@idcliente,idvendedor=@idvendedor,vunitario=@vunitario,cantidad=@cantidad,subtotal=@subtotal,iva=@iva,total=@total
where idventas=@idventas
end

exec updateventas 21,5,2,3,10,2,20,3,23

/*----- DELETE VENTA ------ */

create procedure deleteventa
(
@idventas int
)
as
begin
delete ventas
where idventas=@idventas
end

exec deleteventa 21