CREATE DATABASE ECOMMERCE_DB
GO

USE ECOMMERCE_DB
GO


--Creación de tablas.
CREATE TABLE DOMICILIOS(
	ID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
	,CALLE VARCHAR(50) NULL
	,NUMERO VARCHAR(5) NULL
	,PROVINCIA VARCHAR(50) NULL
	,ESTADO BIT NOT NULL DEFAULT(1)
)
GO


CREATE TABLE USUARIOS(
	ID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
	,USERNAME VARCHAR(50) NOT NULL
	,PASSWORD VARCHAR(50) NOT NULL
	,TIPO BIT NOT NULL DEFAULT(0) -- 0: Cliente / 1: Admin
	,NOMBRE VARCHAR(30) NULL
	,APELLIDO VARCHAR(30) NULL
	,EMAIL VARCHAR(100) NOT NULL
	,TELEFONO VARCHAR(50) NULL
	,ID_DOMICILIO INT NULL FOREIGN KEY REFERENCES DOMICILIOS(ID)
	,ESTADO BIT NOT NULL DEFAULT(1)
)
GO


CREATE TABLE MARCAS(
	ID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
	,NOMBRE VARCHAR(50) NOT NULL
	,ESTADO BIT NOT NULL DEFAULT(1)
)
GO


CREATE TABLE CATEGORIAS(
	ID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
	,NOMBRE VARCHAR(50) NOT NULL
	,ESTADO BIT NOT NULL DEFAULT(1)
)
GO


CREATE TABLE TALLES(
	ID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
	,MEDIDA VARCHAR(3) NOT NULL 
	,ESTADO BIT NOT NULL DEFAULT(1)
)
GO


CREATE TABLE ARTICULOS(
	ID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
	,CODIGO VARCHAR(4) NOT NULL UNIQUE
	,NOMBRE VARCHAR(100) NOT NULL
	,DESCRIPCION VARCHAR(500) NOT NULL
	,PRECIO MONEY NOT NULL CHECK(PRECIO > 0)
	,STOCK INT NOT NULL CHECK(STOCK > 0) DEFAULT(1)
	,IMG_URL VARCHAR(1000) NULL
	,IMG_URL2 VARCHAR(1000) NULL
	,ID_TALLE INT NULL FOREIGN KEY REFERENCES TALLES(ID)
	,ID_CATEGORIA INT NULL FOREIGN KEY REFERENCES CATEGORIAS(ID)
	,ID_MARCA INT NULL FOREIGN KEY REFERENCES MARCAS(ID)
	,ESTADO BIT NOT NULL DEFAULT(1)
)
GO


CREATE TABLE CLIENTES(
	ID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
	,NOMBRE VARCHAR(30) NULL
	,APELLIDO VARCHAR(30) NULL
	,EMAIL VARCHAR(100) NOT NULL
	,TELEFONO VARCHAR(50) NULL
	,ID_DOMICILIO INT NOT NULL FOREIGN KEY REFERENCES DOMICILIOS(ID)
	,ESTADO BIT NOT NULL DEFAULT(1)
)
GO


CREATE TABLE VENTAS(
	ID INT NOT NULL PRIMARY KEY IDENTITY(1,1)
	,FORMA VARCHAR(50) NOT NULL
	,MONTO MONEY NOT NULL
	,CUOTAS INT NULL
	,ID_USUARIO INT NULL FOREIGN KEY REFERENCES USUARIOS(ID)
	,ID_CLIENTE INT NULL FOREIGN KEY REFERENCES CLIENTES(ID)
	,ESTADO BIT NOT NULL DEFAULT(1)
)
GO


CREATE TABLE CARRITOS(
	ID INT NOT NULL IDENTITY(1,1)
	,ID_VENTA INT NOT NULL FOREIGN KEY REFERENCES VENTAS(ID)
	,ID_ARTICULO INT NOT NULL FOREIGN KEY REFERENCES ARTICULOS(ID)
	,ESTADO BIT NOT NULL DEFAULT(1)
	CONSTRAINT PK_CARRITOS PRIMARY KEY(ID,ID_VENTA)
)
GO




--Datos precargados inicialmente.
INSERT INTO USUARIOS(USERNAME, PASSWORD, EMAIL, TIPO) VALUES('admin','123','email@email.com',1)
INSERT INTO USUARIOS(USERNAME, PASSWORD, EMAIL, TIPO) VALUES('cliente','123','email@email.com',0)

INSERT INTO TALLES (MEDIDA) VALUES ('XS') --ID 1
INSERT INTO TALLES (MEDIDA) VALUES ('S')  --ID 2
INSERT INTO TALLES (MEDIDA) VALUES ('M')  --ID 3
INSERT INTO TALLES (MEDIDA) VALUES ('L')  --ID 4
INSERT INTO TALLES (MEDIDA) VALUES ('XL')  --ID 5
INSERT INTO TALLES (MEDIDA) VALUES ('XXL') --ID 6
INSERT INTO TALLES (MEDIDA) VALUES (34) --ID 7
INSERT INTO TALLES (MEDIDA) VALUES (35) --ID 8
INSERT INTO TALLES (MEDIDA) VALUES (36) --ID 9
INSERT INTO TALLES (MEDIDA) VALUES (37) --ID 10
INSERT INTO TALLES (MEDIDA) VALUES (38) --ID 11
INSERT INTO TALLES (MEDIDA) VALUES (39) --ID 12
INSERT INTO TALLES (MEDIDA) VALUES (40) --ID 13
INSERT INTO TALLES (MEDIDA) VALUES (41) --ID 14
INSERT INTO TALLES (MEDIDA) VALUES (42) --ID 15
INSERT INTO TALLES (MEDIDA) VALUES (43) --ID 16
INSERT INTO TALLES (MEDIDA) VALUES (44) --ID 17
INSERT INTO TALLES (MEDIDA) VALUES (45) --ID 18
INSERT INTO TALLES (MEDIDA) VALUES (46) --ID 19
INSERT INTO TALLES (MEDIDA) VALUES (47) --ID 20
INSERT INTO TALLES (MEDIDA) VALUES ('...') --ID 21

INSERT INTO CATEGORIAS (NOMBRE) VALUES ('Remera') --ID 1
INSERT INTO CATEGORIAS (NOMBRE) VALUES ('Pantalón') --ID 2
INSERT INTO CATEGORIAS (NOMBRE) VALUES ('Calzado') --ID 3
INSERT INTO CATEGORIAS (NOMBRE) VALUES ('Campera') --ID 4
INSERT INTO CATEGORIAS (NOMBRE) VALUES ('Buzo') --ID 5
INSERT INTO CATEGORIAS (NOMBRE) VALUES ('Accesorio') --ID 6

INSERT INTO MARCAS (NOMBRE) VALUES ('The North Face') --ID 1
INSERT INTO MARCAS (NOMBRE) VALUES ('Nike') --ID 2
INSERT INTO MARCAS (NOMBRE) VALUES ('Adidas') --ID 3
INSERT INTO MARCAS (NOMBRE) VALUES ('Puma') --ID 4
INSERT INTO MARCAS (NOMBRE) VALUES ('Vans') --ID 5


INSERT INTO ARTICULOS (CODIGO, NOMBRE, DESCRIPCION, PRECIO, STOCK, IMG_URL, IMG_URL2, ID_TALLE, ID_CATEGORIA, ID_MARCA)
VALUES (
	'ZA01'
	,'Calzado U Old Skool'
	,'Las Old Skool son las zapatillas clásicas de Vans y el primer modelo en lucir el icónico sidestripe de la marca. Nacieron como un calzado para skaters de los años 70´y con el correr de las décadas se transformó en un modelo básico de lifestyle.'
	,11900
	,12
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2021/10_2/0/108/78/7097954.jpg'
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2021/10_2/0/108/78/7097949.jpg'
	,12
	,3
	,5
);


INSERT INTO ARTICULOS (CODIGO, NOMBRE, DESCRIPCION, PRECIO, STOCK, IMG_URL, IMG_URL2, ID_TALLE, ID_CATEGORIA, ID_MARCA)
VALUES (
	'RA00'
	,'Campera M Classic FULL ZIP II'
	,'Campera canguro. Detalle de ribb en capucha y boca de bolsillos. Estampa VANS en el delantero y grifa en el lateral.'
	,9700
	,18
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2021/3_16/0/97/138/6392554.jpg'
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2021/3_16/0/97/138/6392544.jpg'
	,5
	,4
	,5
);


INSERT INTO ARTICULOS (CODIGO, NOMBRE, DESCRIPCION, PRECIO, STOCK, IMG_URL, IMG_URL2, ID_TALLE, ID_CATEGORIA, ID_MARCA)
VALUES (
	'ZA02'
	,'Calzado U SK8-HI'
	,'El legendario top alto con cordones inspirado en el clásico Old Skool de Vans, presenta una parte superior de lona reforzada, punteras reforzadas para resistir el desgaste repetido, suelas de caucho con gofres exclusivos y cuellos y talones acolchados para brindar soporte y flexibilidad.'
	,13500
	,5
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2018/1_23/0/38/86/2512509.jpg'
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2018/1_23/0/38/86/2512514.jpg'
	,10
	,3
	,5
);


INSERT INTO ARTICULOS (CODIGO, NOMBRE, DESCRIPCION, PRECIO, STOCK, IMG_URL, IMG_URL2, ID_TALLE, ID_CATEGORIA, ID_MARCA)
VALUES (
	'G10I'
	,'Accesorio Skate Sling Bag'
	,'Acampa y disfrutá tu tiempo al aire libre con esta gorra de estilo trucker. Hemos actualizado este popular diseño con una lona resistente, liviana y un mesh transpirable para una mejor ventilación. El lavado vintage le da un efecto gastado. Ajuste trasero a presión. MATERIAL: Lona 100% algodón. Mesh: 100% poliéster.'
	,5600
	,10
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2021/10_21/0/108/192/7127142.jpg'
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2021/10_21/0/108/192/7127132.jpg'
	,21
	,6
	,5
);


INSERT INTO ARTICULOS (CODIGO, NOMBRE, DESCRIPCION, PRECIO, STOCK, IMG_URL, IMG_URL2, ID_TALLE, ID_CATEGORIA, ID_MARCA)
VALUES (
	'RA0Q'
	,'Remera M Off The Wall Classic'
	,'Todo el mundo quiere la remera perfecta. Con la remera de manga corta Off The Wall Classic no tendrás que buscar más y podrás concentrarte en cosas más importantes. Esta nueva remera es de algodón 100%. CALCE: CLASSIC.'
	,7200
	,10
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2021/4_15/0/98/188/6470892.jpg'
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2021/4_15/0/98/188/6470882.jpg'
	,5
	,1
	,5
);


INSERT INTO ARTICULOS (CODIGO, NOMBRE, DESCRIPCION, PRECIO, STOCK, IMG_URL, IMG_URL2, ID_TALLE, ID_CATEGORIA, ID_MARCA)
VALUES (
	'AC0X'
	,'Calzado W Ultra Endurance'
	,'La zapatilla Ultra Endurance es un calzado de trail running diseñado para lograr la mejor tracción y el calce más confortable. Pensada especialmente para correr por los senderos por más tiempo. CAPELLADA: Tecnología Ultra Airmesh y FlashDry ™ para mantener tus pies frescos y secos. Soporte de TPU y gamuza para el apoyo en la zona media del pie.'
	,25700
	,5
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2018/2_27/0/39/31/2563979.jpg'
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2018/2_27/0/39/31/2563984.jpg'
	,11
	,3
	,1
);


INSERT INTO ARTICULOS (CODIGO, NOMBRE, DESCRIPCION, PRECIO, STOCK, IMG_URL, IMG_URL2, ID_TALLE, ID_CATEGORIA, ID_MARCA)
VALUES (
	'JA05'
	,'Remera W Super Fun BF'
	,'Remera escote redondo. Estampa en frente y espalda. Logo de Vans en el lateral. CALCE: BOYFRIEND TEE.'
	,3500
	,7
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2021/11_11/0/109/82/7164591.jpg'
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2021/11_11/0/109/82/7164586.jpg'
	,1
	,1
	,5
);


INSERT INTO ARTICULOS (CODIGO, NOMBRE, DESCRIPCION, PRECIO, STOCK, IMG_URL, IMG_URL2, ID_TALLE, ID_CATEGORIA, ID_MARCA)
VALUES (
	'KS03'
	,'Buzo W Classic V II Hoodie'
	,'La CLASSIC V II HOODIE, confeccionada en 60% algodón y 40% poliéster, destaca por su diseño de corte clásico, bolsillo frontal de tipo canguro y emblemático logotipo estampado en la parte delantera.'
	,9300
	,15
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2021/8_25/0/107/110/7040544.jpg'
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2021/8_25/0/107/110/7040534.jpg'
	,2
	,5
	,5
);


INSERT INTO ARTICULOS (CODIGO, NOMBRE, DESCRIPCION, PRECIO, STOCK, IMG_URL, IMG_URL2, ID_TALLE, ID_CATEGORIA, ID_MARCA)
VALUES (
	'ZX03'
	,'Calzado M Ultra Endurance'
	,'La zapatilla Ultra Endurance es un calzado de trail running diseñado para lograr la mejor tracción y el calce más confortable. Pensada especialmente para correr por los senderos por más tiempo. CAPELLADA: Tecnología Ultra Airmesh y FlashDry ™ para mantener tus pies frescos y secos. Soporte de TPU y gamuza para el apoyo en la zona media del pie.'
	,23700
	,14
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2017/5_18/0/27/167/1812325.jpg'
	,'https://grimoldimediamanager.grimoldi.com/MediaFiles/Grimoldi/2017/9_11/0/33/8/2164904.jpg'
	,17
	,3
	,1
);



--Consulta para probar que la db se creo correctamente (no borrar).
SELECT A.ID, A.CODIGO, A.NOMBRE, A.DESCRIPCION, A.PRECIO, A.STOCK, A.IMG_URL, A.IMG_URL2, T.MEDIDA AS TALLE, C.NOMBRE AS CATEGORIA, M.NOMBRE AS MARCA FROM ARTICULOS AS A JOIN TALLES AS T ON A.ID_TALLE = T.ID JOIN CATEGORIAS AS C ON A.ID_CATEGORIA = C.ID JOIN MARCAS AS M ON A.ID_MARCA = M.ID