
use BD_MatriculaGYM
GO

CREATE TABLE dbo.Tb_Cliente_Aud(
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
 [usuUltMod] Nvarchar(25) NULL,
 [Accion] [varchar](20) NULL,
 [FechaAccion] [smalldatetime] NULL
	)
 
 GO
 
CREATE TRIGGER [dbo].[TR_TB_Cliente1]
ON [dbo].[Tb_Cliente]
FOR INSERT 
AS
INSERT INTO Tb_Cliente_Aud 
SELECT [idCliente]
      ,[idUsuario]
      ,[nombre]
      ,[apellido]
      ,[sexo]
      ,[nacimiento]
      ,[numDoc]
      ,[celular]
      ,[correo]
      ,[idDistrito]
      ,[estado]
      ,[foto]
	  ,[usuRegistro]
	  ,[fechaRegis]
	  ,[fecUltMod]
	  ,[usuUltMod]
      ,'INSERTADO'
      ,GETDATE()

  FROM Inserted
GO

ALTER TABLE [dbo].[Tb_Cliente] ENABLE TRIGGER [TR_TB_Cliente1]
GO



CREATE TRIGGER [dbo].[TR_TB_Cliente2]
ON [dbo].[Tb_Cliente]
FOR UPDATE 
AS
INSERT INTO Tb_Cliente_Aud 
SELECT [idCliente]
      ,[idUsuario]
      ,[nombre]
      ,[apellido]
      ,[sexo]
      ,[nacimiento]
      ,[numDoc]
      ,[celular]
      ,[correo]
      ,[idDistrito]
      ,[estado]
      ,[foto]
	  ,[usuRegistro]
	  ,[fechaRegis]
	  ,[fecUltMod]
	  ,[usuUltMod]
      ,'NUEVO'
      ,GETDATE()

  FROM Inserted

  INSERT INTO Tb_Cliente_Aud 
SELECT [idCliente]
      ,[idUsuario]
      ,[nombre]
      ,[apellido]
      ,[sexo]
      ,[nacimiento]
      ,[numDoc]
      ,[celular]
      ,[correo]
      ,[idDistrito]
      ,[estado]
      ,[foto]
	  ,[usuRegistro]
	  ,[fechaRegis]
	  ,[fecUltMod]
	  ,[usuUltMod]
      ,'ANTERIOR'
      ,GETDATE()

  FROM Deleted

GO

ALTER TABLE [dbo].[Tb_Cliente] ENABLE TRIGGER [TR_TB_Cliente2]
GO

CREATE TRIGGER [dbo].[TR_TB_Cliente3]
ON [dbo].[Tb_Cliente]
FOR DELETE 
AS
INSERT INTO Tb_Cliente_Aud 
SELECT [idCliente]
      ,[idUsuario]
      ,[nombre]
      ,[apellido]
      ,[sexo]
      ,[nacimiento]
      ,[numDoc]
      ,[celular]
      ,[correo]
      ,[idDistrito]
      ,[estado]
      ,[foto]
	  ,[usuRegistro]
	  ,[fechaRegis]
	  ,[fecUltMod]
	  ,[usuUltMod]
      ,'ELIMINADO'
      ,GETDATE()

  FROM Deleted
GO

ALTER TABLE [dbo].[Tb_Cliente] ENABLE TRIGGER [TR_TB_Cliente2]
GO


-----RUTINA CLINETE---------------
CREATE TABLE dbo.Tb_RutinaCliente_Aud(
 [idCliente] Nchar(4) NOT NULL,
 [idInstructor] Nchar(4) NOT NULL,
 [idRutinaD] Nchar(4) NOT NULL,
 [talla] Float NOT NULL,
 [peso] Float NOT NULL,
 [comentarios] Nvarchar(1999) NULL,
 [fechaRegis] Date NOT NULL,
 [usuRegistro] Nvarchar(25) NOT NULL,
 [fechUltMod] Date  NULL,
 [usuUltMod] Nvarchar(25) NULL,
 [Accion] varchar(20) NULL,
 [FechaAccion] smalldatetime NULL
 )
 GO

CREATE TRIGGER [dbo].[TR_TB_RutinaCliente1]
ON [dbo].[Tb_RutinaCliente]
FOR INSERT 
AS
INSERT INTO Tb_RutinaCliente_Aud 
SELECT [idCliente]
      ,[idInstructor]
      ,[idRutinaD]
      ,[talla]
      ,[peso]
      ,[comentarios]
      ,[fechaRegis]
      ,[usuRegistro]
      ,[fechUltMod]
      ,[usuUltMod] 
      ,'INSERTADO'
      ,GETDATE()

  FROM Inserted

  
GO

ALTER TABLE [dbo].[Tb_RutinaCliente] ENABLE TRIGGER [TR_TB_RutinaCliente1]
GO



CREATE TRIGGER [dbo].[TR_TB_RutinaCliente2]
ON [dbo].[Tb_RutinaCliente]
FOR UPDATE 
AS
INSERT INTO Tb_RutinaCliente_Aud 
SELECT [idCliente]
      ,[idInstructor]
      ,[idRutinaD]
      ,[talla]
      ,[peso]
      ,[comentarios]
      ,[fechaRegis]
      ,[usuRegistro]
      ,[fechUltMod]
      ,[usuUltMod] 
      ,'NUEVO'
      ,GETDATE()

  FROM Inserted

 INSERT INTO Tb_RutinaCliente_Aud 
SELECT [idCliente]
      ,[idInstructor]
      ,[idRutinaD]
      ,[talla]
      ,[peso]
      ,[comentarios]
      ,[fechaRegis]
      ,[usuRegistro]
      ,[fechUltMod]
      ,[usuUltMod] 
      ,'ANTERIOR'
      ,GETDATE()

  FROM deleted


GO

ALTER TABLE [dbo].[Tb_RutinaCliente] ENABLE TRIGGER [TR_TB_RutinaCliente2]
GO

CREATE TRIGGER [dbo].[TR_TB_RutinaCliente3]
ON [dbo].[Tb_RutinaCliente]
FOR Delete 
AS
INSERT INTO Tb_RutinaCliente_Aud 
SELECT [idCliente]
      ,[idInstructor]
      ,[idRutinaD]
      ,[talla]
      ,[peso]
      ,[comentarios]
      ,[fechaRegis]
      ,[usuRegistro]
      ,[fechUltMod]
      ,[usuUltMod] 
      ,'ELIMINADO'
      ,GETDATE()

  FROM inserted

  
GO

ALTER TABLE [dbo].[Tb_RutinaCliente] ENABLE TRIGGER [TR_TB_RutinaCliente1]
GO

--------------------MATRICULA-------------------

CREATE TABLE dbo.Tb_Matricula_Aud(
 [IdMatricula] Nchar(4) NOT NULL PRIMARY KEY,
 [idCliente] Nchar(4) NOT NULL,
 [idPaquete] Nchar(4) NOT NULL,
 [usuResgistro] Nvarchar(25) NOT NULL,
 [fechaRegis] Date NOT NULL,
 [fecUltMod] Date NOT NULL,
 [usuUltMod] Nvarchar(25) NULL,
 [Accion] varchar(20) NULL,
 [FechaAccion] smalldatetime NULL
 )
 GO

 CREATE TRIGGER [dbo].[TR_Tb_Matricula1]
ON [dbo].[Tb_Matricula]
FOR Insert 
AS
INSERT INTO Tb_Matricula_Aud
SELECT [IdMatricula]
      ,[idCliente]
      ,[idPaquete]
      ,[usuResgistro]
	  ,[fechaRegis]
      ,[fecUltMod]
      ,[usuUltMod]     
      ,'INSERTADO'
      ,GETDATE()

  FROM deleted

GO

ALTER TABLE [dbo].[Tb_RutinaCliente] ENABLE TRIGGER [TR_TB_RutinaCliente3]
GO

 CREATE TRIGGER [dbo].[TR_Tb_Matricula2]
ON [dbo].[Tb_Matricula]
FOR UPDATE 
AS
INSERT INTO Tb_Matricula_Aud
SELECT [IdMatricula]
      ,[idCliente]
      ,[idPaquete]
      ,[usuResgistro]
	  ,[fechaRegis]
      ,[fecUltMod]
      ,[usuUltMod]     
      ,'NUEVO'
      ,GETDATE()

  FROM inserted

  INSERT INTO Tb_Matricula_Aud
SELECT [IdMatricula]
      ,[idCliente]
      ,[idPaquete]
      ,[usuResgistro]
	  ,[fechaRegis]
      ,[fecUltMod]
      ,[usuUltMod]     
      ,'ANTERIOR'
      ,GETDATE()

  FROM deleted

GO

ALTER TABLE [dbo].[Tb_RutinaCliente] ENABLE TRIGGER [TR_TB_RutinaCliente2]
GO

 CREATE TRIGGER [dbo].[TR_Tb_Matricula3]
ON [dbo].[Tb_Matricula]
FOR DELETE 
AS
  INSERT INTO Tb_Matricula_Aud
SELECT [IdMatricula]
      ,[idCliente]
      ,[idPaquete]
      ,[usuResgistro]
	  ,[fechaRegis]
      ,[fecUltMod]
      ,[usuUltMod]     
      ,'ELIMINADO'
      ,GETDATE()

  FROM deleted

GO

ALTER TABLE [dbo].[Tb_RutinaCliente] ENABLE TRIGGER [TR_TB_RutinaCliente3]
GO

