USE MASTER;

IF EXISTS ( SELECT name FROM sysdatabases WHERE name = 'BD_MatriculaGYM' )
	DROP DATABASE BD_MatriculaGYM;

CREATE DATABASE BD_MatriculaGYM
GO
USE BD_MatriculaGYM;

GO
CREATE TABLE dbo.Tb_Distrito(
	[idDistrito] Nchar(4) NOT NULL PRIMARY KEY,
	[nombre] Nvarchar(30) NOT NULL
)

CREATE TABLE dbo.Tb_Roles(
 [idRol] Nchar(4) NOT NULL PRIMARY KEY,
 [nombre] Nvarchar(25) NOT NULL
)
CREATE TABLE dbo.Tb_Usuario
(
 [idUsuario] Nchar(4) NOT NULL PRIMARY KEY,
 [usuario] Nvarchar(25) NOT NULL,
 [contraseña] Nvarchar(25) NOT NULL,
 [nombre] Nvarchar(25) NOT NULL,
 [apellido] Nvarchar(25) NOT NULL,
 [numDoc] Nchar(8) NOT NULL,
 [celular] Nchar(9) NULL,
 [correo] Nvarchar(99) NOT NULL,
 [idRol] Nchar(4) NULL,
 [usuRegistro] Nvarchar(25) NULL,
 [fechaRegis] Date NOT NULL,
 [fecUltMod] Date  NULL,
 [usuUltMod] Nvarchar(25) NULL,
 [estado] bit not null

 CONSTRAINT "FK_Usuario_Roles" FOREIGN KEY 
	("idRol") REFERENCES "dbo"."Tb_Roles" ("idRol")
)

CREATE TABLE dbo.Tb_Administrador(
 [idAdmin] Nchar(4) NOT NULL PRIMARY KEY,
 [idUsuario] Nchar(4) NULL
 CONSTRAINT "FK_Administrador_Usuario" FOREIGN KEY 
	("idUsuario") REFERENCES "dbo"."Tb_Usuario" ("idUsuario")
)

CREATE TABLE dbo.Tb_Instructor(
  [idInstructor] Nchar(4) NOT NULL PRIMARY KEY,
 [idUsuario] Nchar(4) NULL,
 [idDistrito] Nchar(4) NOT NULL,
 [nombre] Nvarchar(30) NOT NULL,
 [apellido] Nvarchar(30) NOT NULL,
 [sexo] Nchar(1) NOT NULL,
 [numDoc] Nchar(8) NOT NULL,
 [celular] Nchar(9) NULL,
 [correo] Nvarchar(30) NOT NULL,
 [foto] Nvarchar(max) NULL,
 [usuRegistro] Nvarchar(25) NOT NULL,
 [fechaRegis] Date NOT NULL,
 [fecUltMod] Date NULL,
 [usuUltMod] Nvarchar(25) NULL

	CONSTRAINT "FK_Instructor_Usuario" FOREIGN KEY 
	("idUsuario") REFERENCES "dbo"."Tb_Usuario" ("idUsuario"),
	CONSTRAINT "FK_Instructor_Distrito" FOREIGN KEY 
	("idDistrito") REFERENCES "dbo"."Tb_Distrito" ("idDistrito")
)

CREATE TABLE dbo.Tb_Sede(
 [idSede] Nchar(4) NOT NULL PRIMARY KEY,
 [nombre] Nvarchar(20) NOT NULL,
 [direccion] Nvarchar(99) NOT NULL,
 [anexo] Smallint NOT NULL,
 [idDistrito] Nchar(4) NOT NULL

 CONSTRAINT "FK_Sede_Distrito" FOREIGN KEY 
	("idDistrito") REFERENCES "dbo"."Tb_Distrito" ("idDistrito")
)

CREATE TABLE dbo.Tb_Paquete(
 [idPaquete] Nchar(4) NOT NULL PRIMARY KEY,
 [nombre] Nvarchar(30) NOT NULL,
 [descripcion] Nvarchar(150) NOT NULL,
 [precio] Money NOT NULL,
 [idSede] Nchar(4) NULL,
 [usuRegistro] Nvarchar(25) NULL,
 [fechaRegis] Date NOT NULL,
 [fecUltMod] Date NULL,
 [usuUltMod] Nvarchar(25) NULL

 CONSTRAINT "FK_Paquete_Sede" FOREIGN KEY 
	("idSede") REFERENCES "dbo"."Tb_Sede" ("idSede")
)

CREATE TABLE dbo.Tb_Cliente(
 [idCliente] Nchar(4) NOT NULL PRIMARY KEY,
 [idUsuario] Nchar(4) NULL,
 [nombre] Nvarchar(25) NOT NULL,
 [apellido] Nvarchar(25) NOT NULL,
 [sexo] Nchar(1) NOT NULL,
 [nacimiento] Date NOT NULL,
 [numDoc] Nchar(8) NOT NULL,
 [celular] Nchar(9) NOT NULL,
 [correo] Nvarchar(30) NOT NULL,
 [idDistrito] Nchar(4) NULL,
 [estado] Bit NOT NULL,
 [foto] Varchar(max) NULL,
 [usuRegistro] Nvarchar(25) NULL,
 [fechaRegis] Date NOT NULL,
 [fecUltMod] Date NULL,
 [usuUltMod] Nvarchar(25) NULL

 CONSTRAINT "FK_Cliente_Usuario" FOREIGN KEY 
	("idUsuario") REFERENCES "dbo"."Tb_Usuario" ("idUsuario"),
	CONSTRAINT "FK_Cliente_Distrito" FOREIGN KEY 
	("idDistrito") REFERENCES "dbo"."Tb_Distrito" ("idDistrito")
)

CREATE TABLE dbo.Tb_Matricula(
 [IdMatricula] Nchar(4) NOT NULL PRIMARY KEY,
 [idCliente] Nchar(4) NOT NULL,
 [idPaquete] Nchar(4) NOT NULL,
 [usuResgistro] Nvarchar(25) NOT NULL,
 [fechaRegis] Date NOT NULL,
 [fecUltMod] Date NULL,
 [usuUltMod] Nvarchar(25) NULL

 CONSTRAINT "FK_Matricula_Cliente" FOREIGN KEY 
	("idCliente") REFERENCES "dbo"."Tb_Cliente" ("idCliente"),
	CONSTRAINT "FK_Matricula_Paquete" FOREIGN KEY 
	("idPaquete") REFERENCES "dbo"."Tb_Paquete" ("idPaquete")
)
------------------------
CREATE TABLE dbo.Tb_RutinaDieta(
 [idRutinaD] Nchar(4) NOT NULL PRIMARY KEY,
 [nomRutina] Nvarchar(25) NOT NULL,
 [fotoR] Nvarchar(max) null,
 [nomDieta] Nvarchar(25) NOT NULL,
 [fotoD] Nvarchar(max) null,
 [descripcion] Nvarchar(1000) NULL
)
-------------------------
CREATE TABLE dbo.Tb_RutinaCliente(
 [idCliente] Nchar(4) NOT NULL,
 [idInstructor] Nchar(4) NOT NULL,
 [idRutinaD] Nchar(4) NOT NULL,
 [talla] Float NOT NULL,
 [peso] Float NOT NULL,
 [comentarios] Nvarchar(1999) NULL,
 [fechaRegis] Date NOT NULL,
 [usuRegistro] Nvarchar(25) NOT NULL,
 [fechUltMod] Date  NULL,
 [usuUltMod] Nvarchar(25) NULL

 CONSTRAINT "FK_RutinaCliente_Cliente" FOREIGN KEY 
	("idCliente") REFERENCES "dbo"."Tb_Cliente" ("idCliente"),
 CONSTRAINT "FK_RutinaCliente_Instructor" FOREIGN KEY 
	("idInstructor") REFERENCES "dbo"."Tb_Instructor" ("idInstructor"),
 CONSTRAINT "FK_RutinaCliente_RutinaDieta" FOREIGN KEY 
	("idRutinaD") REFERENCES "dbo"."Tb_RutinaDieta" ("idRutinaD")
)


