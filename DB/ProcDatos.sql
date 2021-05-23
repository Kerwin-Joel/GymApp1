USE BD_MatriculaGYM;
GO
--INSERTAR DISTRITO
CREATE PROCEDURE dbo.usp_InsertarDistrito
@nombre Nvarchar(30)
AS
declare @idDistrito Nchar(4)
declare @vcont int
set @vcont=(Select count(*) from Tb_DISTRITO)
if @vcont=0 
       set @idDistrito ='D001'
else
        set @idDistrito=(Select 'D' +Right(Max (Right(idDistrito,3)+ 1001 ),3) 
    From Tb_DISTRITO)
insert into Tb_DISTRITO values(@idDistrito, @nombre)
go

--CONSULTAR DISTRITO
CREATE PROC [dbo].[usp_ConsultarDistrito]
AS
SELECT * FROM Tb_DISTRITO
GO

--CONSULTAR DISTRITO POR ID
CREATE PROC [dbo].[usp_ConsultarDistritoId]
    @idDistrito Nchar(4)
AS
SELECT * FROM Tb_DISTRITO
WHERE idDistrito = @idDistrito
GO


--ELIMINAR DISTRITO
CREATE PROCEDURE [dbo].[usp_EliminarDistrito]
@idDistrito Nchar(4)
AS
BEGIN
  DELETE FROM  Tb_DISTRITO WHERE idDistrito = @idDistrito
 END
GO
----------------------------------------------------------
--CREAR ROLES
CREATE PROCEDURE dbo.usp_InsertarRol
@nombre Nvarchar(25)
AS
declare @idRol Nchar(4)
declare @vcont int
set @vcont=(Select count(*) from Tb_Roles)
if @vcont=0 
       set @idRol ='R001'
else
        set @idRol=(Select 'R' +Right(Max (Right(idRol,3)+ 1001 ),3) 
    From Tb_Roles)
insert into Tb_Roles values(@idRol, @nombre)
go
------------------------------------------------------------------------------
--INSERTAR USUARIO 
CREATE PROCEDURE dbo.usp_InsertarUsuario
	@usuario Nvarchar(25),
	@contrasena Nvarchar(25),
	@nombre Nvarchar(25),
	@apellido Nvarchar(25),
	@numDoc Nchar(8),
	@celular Nchar(9),
	@correo Nvarchar(30),
	@idRol Nchar(4),
	@usuRegistro Nvarchar(25),
	@estado bit
AS
declare @idUsuario Nchar(4)
declare @vcont int
set @vcont=(Select count(*) from Tb_USUARIO)
if @vcont=0 
       set @idUsuario ='U001'
else
        set @idUsuario=(Select 'U' +Right(Max (Right(idUsuario,3)+ 1001 ),3) 
    From Tb_USUARIO)
insert into Tb_USUARIO values(@idUsuario,@usuario, @contrasena,@nombre, @apellido, @numDoc, @celular, @correo, 
@idRol, @usuRegistro, GETDATE(), null, null, @estado)
GO

--ACTUALIZAR
CREATE PROCEDURE [dbo].[usp_ActualizarUsuario]
  @idUsuario Nchar(4),
  @usuario Nvarchar(20),
  @contrasena Nvarchar(99),
  @nombre Nchar(4),
  @apellido smallint,
  @numDoc Nchar(8),
  @celular Nchar(9),
  @correo Nvarchar(30),
  @idRol Nchar(4),
  @usuUltMod Nvarchar(25),
  @estado bit
  AS
  UPDATE Tb_Usuario SET
  usuario = @usuario,
  contraseña = @contrasena,
  nombre = @nombre,
  apellido = @apellido,
  numDoc = @numDoc,
  celular = @celular,
  correo = @correo,
  idRol = @idRol,
  fecUltMod = GETDATE(),
  usuUltMod = @usuUltMod,
  estado = @estado
  WHERE
  idUsuario = @idUsuario
GO

--CONSULTA dni
CREATE PROC [dbo].[usp_ConsultarUsuarioDni]
    @numDoc Nchar(8)
AS
SELECT * FROM Tb_Usuario
WHERE numDoc = @numDoc
GO

--Consulta usuario
CREATE PROC [dbo].[usp_ConsultarUsuario_nomUsuario]
    @usuario Nvarchar(25)
AS
SELECT * FROM Tb_Usuario
WHERE usuario = @usuario
GO

--LISTARUSUARIO:
CREATE PROC [dbo].[usp_ListarUsuario]
AS
SELECT usuario, nombre, apellido, numDoc, celular, correo, usuRegistro, fechaRegis FROM Tb_Usuario
order by idUsuario desc

-------------------INSERTAR CLIENTE------------------
--INSERTAR
GO
CREATE PROCEDURE dbo.usp_InsertarCliente
	@nombre Nvarchar(25),
	@apellido Nvarchar(25),
	@usuario Nvarchar(25),
	@sexo nchar(25),
	@nacimiento date,
	@numDoc Nchar(8),
	@celular Nchar(9),
	@correo Nvarchar(30),
	@idDistrito Nchar(4),
	@estado bit,
	@foto Nvarchar(max),
	@usuRegistro Nvarchar(25)
	--

	AS
declare @idUsuario Nchar(4)
declare @vcontU int
declare @vcontI int
set @vcontU=(Select count(*) from Tb_Usuario)
if @vcontU=0 
       set @idUsuario ='U001'
else
        set @idUsuario=(Select 'U' +Right(Max (Right(idUsuario,3)+ 1001 ),3) 
    From Tb_Usuario)
	insert into Tb_Usuario values(@idUsuario,@usuario, @numDoc,@nombre, @apellido, @numDoc, @celular, @correo, 
'R005', @usuRegistro, GETDATE(), null, null, 1)

declare @idCliente Nchar(4)
declare @vcont int
set @vcont=(Select count(*) from Tb_Cliente)
if @vcont=0 
       set @idCliente ='C001'
else
        set @idCliente=(Select 'C' +Right(Max (Right(idCliente,3)+ 1001 ),3) 
    From Tb_Cliente)
insert into Tb_Cliente values(@idCliente,@idUsuario, @nombre, @apellido, @sexo, @nacimiento, @numDoc,
@celular, @correo,@idDistrito,@estado,@foto, @usuRegistro,  GETDATE(), null, null)
GO
--ACTUALIZAR
CREATE PROCEDURE dbo.usp_ActualizarCliente
	@idCliente Nchar(4),
	@idUsuario Nchar(4),
	@nombre Nvarchar(25),
	@apellido Nvarchar(25),
	@sexo nchar(25),
	@nacimiento date,
	@numDoc Nchar(8),
	@celular Nchar(9),
	@correo Nvarchar(30),
	@idDistrito Nchar(4),
	@estado bit,
	@foto Nvarchar(max),
	@usuUltMod Nvarchar(25)
	AS
	 UPDATE Tb_Cliente SET
  idUsuario = @idUsuario,
  nombre = @nombre,
  apellido = @apellido,
  sexo = @sexo,
  numDoc = @numDoc,
  celular = @celular,
  correo = @correo,
  idDistrito = @idDistrito,
  estado = @estado,
  foto = @foto,
  fecUltMod = GETDATE(),
  usuUltMod = @usuUltMod
  
  WHERE
  idCliente = @idCliente

GO

--CONSULTA
CREATE PROC [dbo].[usp_ConsultarClienteDni]
    @numDoc Nchar(8)
AS
SELECT * FROM Tb_Cliente
WHERE numDoc = @numDoc
GO

--Listar Cliente
CREATE PROC [dbo].[usp_ListarCliente]
AS
SELECT usuario, Tb_Cliente.nombre +', '+ Tb_Cliente.apellido AS Cliente, Tb_Cliente.numDoc, Tb_Cliente.celular,
Tb_Cliente.correo, Tb_Distrito.nombre, Tb_Cliente.estado FROM Tb_Cliente
inner join Tb_Usuario on Tb_Cliente.idUsuario = Tb_Usuario.idUsuario
inner join Tb_Distrito on Tb_Cliente.idDistrito = Tb_Distrito.idDistrito

GO


-------------------INSERTAR INSTRUCTOR ------------------
GO 
CREATE PROCEDURE dbo.usp_InsertarInstructor
	@idDistrito Nchar(4),
	@usuario Nvarchar(25),
	@nombre Nvarchar(25),
	@apellido Nvarchar(25),
	@sexo nchar(25),
	@numDoc Nchar(8),
	@celular Nchar(9),
	@correo Nvarchar(30),
	@foto Nvarchar(max),
	@usuRegistro Nvarchar(25)
	--
AS
declare @idUsuario Nchar(4)
declare @idInstructor Nchar(4)
declare @vcontU int
declare @vcontI int
set @vcontU=(Select count(*) from Tb_Usuario)
if @vcontU=0 
       set @idUsuario ='U001'
else
        set @idUsuario=(Select 'U' +Right(Max (Right(idUsuario,3)+ 1001 ),3) 
    From Tb_Usuario)
	insert into Tb_Usuario values(@idUsuario,@usuario, @numDoc,@nombre, @apellido, @numDoc, @celular, @correo, 
'R003', @usuRegistro, GETDATE(), null, null, 1)

set @vcontI=(Select count(*) from Tb_Instructor)
if @vcontI=0 
       set @idInstructor ='I001'
else
        set @idInstructor=(Select 'I' +Right(Max (Right(idInstructor,3)+ 1001 ),3) 
    From Tb_Instructor)

insert into Tb_Instructor values(@idInstructor,@idUsuario, @idDistrito, @nombre, @apellido, @sexo, @numDoc,
@celular, @correo,@foto, @usuRegistro,  GETDATE(), null, null)
GO


--ACTUALIZAR
CREATE PROCEDURE dbo.usp_ActualizarInstructor
	@idInstructor Nchar(4),
	@idUsuario Nchar(4),
	@idDistrito Nchar(4),
	@nombre Nvarchar(25),
	@apellido Nvarchar(25),
	@sexo nchar(25),
	@numDoc Nchar(8),
	@celular Nchar(9),
	@correo Nvarchar(30),
	@foto Nvarchar(max),
	@usuRegistro Nvarchar(25)
	AS
	 UPDATE Tb_Instructor SET
  idDistrito = @idDistrito,
  nombre = @nombre,
  apellido = @apellido,
  sexo = @sexo,
  numDoc = @numDoc,
  celular = @celular,
  correo = @correo,
  foto = @foto,
  fecUltMod = GETDATE(),
  usuUltMod = usuRegistro
  
  WHERE
  idInstructor = @idInstructor
GO



----------------Sede-------------
----INSERTAR
GO 
CREATE PROCEDURE dbo.usp_InsertarSede
	@nombre Nvarchar(20),
	@direccion Nvarchar(99),
	@anexo smallint,	
	@idDistrito Nchar(4)
	--
AS
declare @idSede Nchar(4)
declare @vcont int
set @vcont=(Select count(*) from Tb_Sede)
if @vcont=0 
       set @idSede ='S001'
else
        set @idSede=(Select 'S' +Right(Max (Right(idSede,3)+ 1001 ),3) 
    From Tb_Sede)
insert into Tb_Sede values(@idSede,@nombre, @direccion, @anexo, @idDistrito)
GO

--CONSULTAR
CREATE PROCEDURE dbo.usp_ConsultaSede
AS
Select * from Tb_Sede
GO
--consulta por distrito 
CREATE PROCEDURE dbo.usp_ConsultaSede_Distrito
AS
Select Tb_Sede.nombre AS 'Sede',Tb_Distrito.nombre AS 'Distrito' From Tb_Sede
inner join Tb_Distrito on Tb_Sede.idDistrito= Tb_Distrito.idDistrito
GO

----------------Paquete-------------

GO 
CREATE PROCEDURE dbo.usp_InsertarPaquete
	@nombre Nvarchar(30),
	@descripcion Nvarchar(150),
	@precio money,
	@idSede Nchar(4),	
	@usuRegistro Nvarchar(25)
	--
AS
declare @idPaquete Nchar(4)
declare @vcont int
set @vcont=(Select count(*) from Tb_Paquete)
if @vcont=0 
       set @idPaquete ='P001'
else
        set @idPaquete=(Select 'P' +Right(Max (Right(idPaquete,3)+ 1001 ),3) 
    From Tb_Paquete)
insert into Tb_Paquete values(@idPaquete,@nombre, @descripcion, @precio, @idSede, @usuRegistro, GETDATE(),null, null)
GO


---CONSULTA 
CREATE PROCEDURE dbo.usp_ConsultaPaquete
AS
Select Tb_Paquete.nombre AS 'Nombre Paquete', descripcion, Tb_Sede.nombre AS 'Nombre Sede', Tb_Distrito.nombre AS 'NombreDistrito' From Tb_Paquete
inner join Tb_Sede on Tb_Paquete.idSede = Tb_Sede.idSede 
inner join Tb_Distrito on Tb_Sede.idDistrito = Tb_Distrito.idDistrito
GO

-----------------insertar matricula------------------
GO 
CREATE PROCEDURE dbo.usp_InsertarMatricula
	@idCliente Nchar(4),
	@idPaquete Nchar(4),
	@usuRegistro Nvarchar(25)
	--
AS
declare @idMatricula Nchar(4)
declare @vcont int
set @vcont=(Select count(*) from Tb_Matricula)
if @vcont=0 
       set @idMatricula ='M001'
else
		set @idMatricula=(Select 'M' +Right(Max (Right(idMatricula,3)+ 1001 ),3) 
    From Tb_Matricula)
insert into Tb_Matricula values(@idMatricula,@idCliente, @idPaquete, @usuRegistro, GETDATE(), null, null)
GO

--CONSULTA
CREATE PROCEDURE dbo.usp_ConsultaMatriculaDNI
	@numDoc Nchar(8)
AS 
Select Tb_Cliente.nombre + ', '+ Tb_Cliente.apellido AS Cliente, Tb_Paquete.nombre AS Paquete, Tb_Sede.nombre AS Sede  From Tb_Matricula
inner join Tb_Cliente on Tb_Matricula.idCliente = Tb_Cliente.idCliente
inner join Tb_Paquete on Tb_Matricula.idPaquete	= Tb_Paquete.idPaquete
inner join Tb_Sede on Tb_Paquete.idSede = Tb_Sede.idSede
where Tb_Cliente.numDoc = @numDoc
GO
--LISTAR MATRICULAS 
CREATE PROCEDURE dbo.usp_ListarMatricula
AS
SELECT * FROM Tb_Matricula
GO


------------------------------RUTINASDIETA-------------------
CREATE PROCEDURE dbo.usp_InsertarRutinaDieta
	@nomRutina Nvarchar(25),
	@fotoR Nvarchar(max),
	@nomDieta Nvarchar(25),
	@fotoD Nvarchar(max),
	@descripcion Nvarchar(100)

AS
declare @idRutinaD Nchar(4)
declare @vcont int
set @vcont=(Select count(*) from Tb_RutinaDieta)
if @vcont=0 
       set @idRutinaD ='Z001'
else
		set @idRutinaD=(Select 'Z' +Right(Max (Right(idRutinaD,3)+ 1001 ),3) 
    From Tb_RutinaDieta)
insert into Tb_RutinaDieta values(@idRutinaD,@nomRutina, @fotoR, @nomDieta,@fotoD,  @descripcion)
GO

--ACTUALIZAR

CREATE PROCEDURE dbo.usp_ActualizarRutinaDieta
	@idRutinaD Nchar(4),
	@nomRutina Nvarchar(25),
	@fotoR Nvarchar(max),
	@nomDieta Nvarchar(25),
	@fotoD Nvarchar(max),
	@descripcion Nvarchar(100)

	AS
	 UPDATE Tb_RutinaDieta SET
  nomRutina = @nomRutina,
  fotoR = @fotoR,
  nomDieta = @nomDieta,
  fotoD = @fotoD,
  descripcion = @descripcion

  WHERE
  idRutinaD = @idRutinaD
GO


--Consulta
CREATE PROCEDURE dbo.usp_ConsultaRutinaDieta
AS 
SELECT * FROM Tb_RutinaDieta
GO


---------------------------RUTINASCLIENTE-------------------
---INSERTAR 
CREATE PROCEDURE dbo.usp_InsertarRutinaCliente
	@idCliente Nchar(4),
	@idInstructor Nchar(4),
	@idRutinaD Nchar(4),
	@talla float,
	@peso float,
	@comentarios nvarchar(1999),
	@usuRegistro nvarchar(25)
AS
insert into Tb_RutinaCliente values(@idCliente,@idInstructor, @idRutinaD, @talla,@peso,  @comentarios, GETDATE(),
@usuRegistro, null, null)
GO

--ACTUALIZAR
CREATE PROCEDURE dbo.usp_ActualizarRutinaCliente
	@idCliente Nchar(4),
	@idInstructor Nchar(4),
	@idRutinaD Nchar(4),
	@talla float,
	@peso float,
	@comentarios nvarchar(1999),
	@usuUltMod nvarchar(25)

	AS
	 UPDATE Tb_RutinaCliente SET
  idInstructor = @idInstructor,
  idRutinaD = @idRutinaD,
  talla = @talla,
  peso = @peso,
  comentarios = @comentarios,
  usuUltMod = @usuUltMod,
  fechUltMod = GetDate()

  WHERE
  idCliente = @idCliente
GO

