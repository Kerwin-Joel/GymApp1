Use BD_MatriculaGYM
GO
-------------------------DISTRITO------------------------
EXEC usp_InsertarDistrito 
@nombre = 'San Borja';
GO

EXEC usp_InsertarDistrito 
@nombre = 'Miraflores';
GO

EXEC usp_InsertarDistrito 
@nombre = 'San Isidro';
GO

EXEC usp_InsertarDistrito 
@nombre = 'Jesus María';
GO

EXEC usp_InsertarDistrito 
@nombre = 'Ancón';
GO

EXEC usp_InsertarDistrito 
@nombre = 'Lince'
GO

EXEC usp_InsertarDistrito 
@nombre = 'La Molina'
GO

EXEC usp_InsertarDistrito 
@nombre = 'Bellavista'
GO

EXEC usp_InsertarDistrito 
@nombre = 'La Perla'
GO

EXEC usp_InsertarDistrito 
@nombre = 'La Punta'
GO

EXEC usp_InsertarDistrito 
@nombre = 'Ventanilla'
GO

EXEC usp_InsertarDistrito 
@nombre = 'Lima'
GO

EXEC usp_InsertarDistrito 
@nombre = 'Ate'
GO

EXEC usp_InsertarDistrito 
@nombre = 'Barranco'
GO

EXEC usp_InsertarDistrito 
@nombre = 'Breña'
GO

EXEC usp_InsertarDistrito 
@nombre = 'Chorrillos'
GO

EXEC usp_InsertarDistrito 
@nombre = 'Chaclacayo'
GO

EXEC usp_InsertarDistrito 
@nombre = 'Cieneguilla'
GO

EXEC usp_InsertarDistrito 
@nombre = 'Surquillo'
GO

EXEC usp_InsertarDistrito 
@nombre = 'Magdalena del Mar'
GO

EXEC usp_InsertarDistrito 
@nombre = 'San Miguel'
GO

EXEC usp_InsertarDistrito 
@nombre = 'Santiago de Surco'
GO

EXEC usp_InsertarDistrito 
@nombre = 'Los Olivos'

EXEC usp_InsertarDistrito 
@nombre = 'La Victoria'
GO
-------------------------ROLES---------------------------

EXEC usp_InsertarRol
@nombre = Administrador

EXEC usp_InsertarRol
@nombre = Registrador

EXEC usp_InsertarRol
@nombre = Instructor

EXEC usp_InsertarRol
@nombre = Cliente

EXEC usp_InsertarRol
@nombre = Consultor

EXEC usp_InsertarRol
@nombre = Deudor

GO
------------------------SEDES
EXEC usp_InsertarSede
@nombre = 'GYMPlus Las Marinas',
@direccion = 'Calle Las marinas 374',
@anexo = 2548,
@idDistrito = 'D001'

EXEC usp_InsertarSede
@nombre = 'GYMPlus Las Bonitas',
@direccion = 'Calle Las bonitas 388',
@anexo = 2555,
@idDistrito = 'D002'

-------------------INSERTAR PAQUETE

EXEC usp_InsertarPaquete
@nombre = 'GOLD PLUS',
@descripcion= 'ACCESO A TODAS LAS MAQUINAS Y CLASES GRUPALES ',
@precio = 99.99,
@idSede = 'S001',
@usuRegistro= 'psuclla'

EXEC usp_InsertarPaquete
@nombre = 'SILVER ',
@descripcion= 'ACCESO A TODAS LAS MAQUINAS',
@precio = 69.99,
@idSede = 'S001',
@usuRegistro= 'psuclla'

EXEC usp_InsertarPaquete
@nombre = 'NUEVO COMIENZO',
@descripcion= 'ACCESO A TODAS LAS MAQUINAS SOLO 3 VECES POR SEMANA',
@precio = 49.99,
@idSede = 'S001',
@usuRegistro= 'psuclla'


EXEC usp_InsertarPaquete
@nombre = 'GOLD PLUS',
@descripcion= 'ACCESO A TODAS LAS MAQUINAS Y CLASES GRUPALES ',
@precio = 99.99,
@idSede = 'S002',
@usuRegistro= 'psuclla'

EXEC usp_InsertarPaquete
@nombre = 'SILVER ',
@descripcion= 'ACCESO A TODAS LAS MAQUINAS',
@precio = 69.99,
@idSede = 'S002',
@usuRegistro= 'psuclla'

EXEC usp_InsertarPaquete
@nombre = 'NUEVO COMIENZO',
@descripcion= 'ACCESO A TODAS LAS MAQUINAS SOLO 3 VECES POR SEMANA',
@precio = 49.99,
@idSede = 'S002',
@usuRegistro= 'psuclla'


-------------------------INSTRUCTOR
EXEC usp_InsertarInstructor
@idDistrito = 'D001',
@usuario = 'mfino',
@nombre = 'Marco',
@apellido = 'fino',
@sexo = 'M',
@numDoc = '10056777',
@celular = NULL,
@correo = 'mfino@gymplus.com',
@foto = NULL,
@usuRegistro= 'psuclla'

--------------------------CLIENTE

EXEC dbo.usp_InsertarCliente
@nombre = 'Patrick',
@apellido = 'Suclla',
@usuario = 'psuclla',
@sexo = 'M',
@nacimiento= '1999-02-08',
@numDoc = '74355548',
@celular = '922688165',
@correo = 'psuclla@gmail.com',
@idDistrito = 'D001',
@estado = 1,
@foto = NULL,
@usuRegistro = 'psuclla'

EXEC dbo.usp_InsertarCliente
@nombre = 'Jhamir',
@usuario = 'Jyncio',
@apellido = 'Yncio',
@sexo = 'M',
@nacimiento= '1998-02-25',
@numDoc = '46348682',
@celular = '992486973',
@correo = 'jyncio@gmail.com', 
@idDistrito = 'D001',
@usuRegistro = null,
@foto = NULL,
@estado = 1
go

EXEC dbo.usp_InsertarCliente
@usuario = 'Dmandamiento',
@nombre = 'Darcy',
@apellido = 'Mandamiento',
@sexo = 'M',
@nacimiento= '1998-10-25',
@numDoc = '46344782',
@celular = '996438971',
@correo = 'dmandamiento@gmail.com', 
@idDistrito = 'D001',
@usuRegistro = null,
@foto = NULL,
@estado = 1
go

-------------------- MATRICULA
EXEC usp_InsertarMatricula
@idCliente = 'C001',
@idPaquete = 'P002',
@usuRegistro = 'psuclla'

-------------------------RUTINA
EXEC usp_InsertarRutinaDieta
@nomRutina = 'Ganar Masa', 
@fotoR = null , 
@nomDieta = 'La Comelona',
@fotoD = null,
@descripcion = 'La comelona es una dieta exclusiva para kerwin'
GO

EXEC usp_InsertarRutinaCliente
@idCliente = 'C001',
@idInstructor = 'I001', 
@idRutinaD = 'Z001', 
@talla = 182.00,
@peso = 70.00, 
@comentarios=NULL,
@usuRegistro= 'I001'



----



-----------------------------------USUARIO ADMINISTRADOR-----------------
/*EXEC dbo.usp_InsertarUsuario

@usuario = 'Psuclla',
@contrasena = '74352215',
@nombre = 'Patrick',
@apellido = 'Suclla',
@numDoc = '74352215',
@celular = null,
@correo = 'psuclla@gymplus.com', 
@idRol = 'R001', 
@usuRegistro = null,
@estado = 1

-----------------------------------USUARIO INSTRUCTOR-----------------
EXEC dbo.usp_InsertarUsuario
@usuario = 'Psuclla',
@contrasena = '74352215',
@nombre = 'Patrick',
@apellido = 'Suclla',
@numDoc = '74352215',
@celular = null,
@correo = 'psuclla@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Jyncio',
@contrasena = 'JY123',
@nombre = 'Jhamir',
@apellido = 'Yncio',
@numDoc = '46348682',
@celular = '992486973',
@correo = 'jyncio@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Dmandamiento',
@contrasena = 'dm953',
@nombre = 'Darcy',
@apellido = 'Mandamiento',
@numDoc = '46344782',
@celular = '996438971',
@correo = 'dmandamiento@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'sflores',
@contrasena = 'sf953',
@nombre = 'Samuel',
@apellido = 'Flores',
@numDoc = '33464782',
@celular = '976632154',
@correo = 'sflores@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'racion',
@contrasena = 'ra876',
@nombre = 'rosa',
@apellido = 'acimet',
@numDoc = '43128464',
@celular = '976632154',
@correo = 'sflores@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'dalbusac',
@contrasena = 'da91385',
@nombre = 'Daniel',
@apellido = 'Albusac Tamargo',
@numDoc = '75098488',
@celular = '973156842',
@correo = 'dalbusac@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Jalonso',
@contrasena = 'jal64897',
@nombre = 'Jose',
@apellido = 'Alonso Becerra',
@numDoc = '78035832',
@celular = '934765821',
@correo = 'jalonso@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Samat',
@contrasena = 'susam9463',
@nombre = 'Susana',
@apellido = 'Amat Mena',
@numDoc = '45295530',
@celular = '964731852',
@correo = 'samat@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Iamate',
@contrasena = 'ireama84623',
@nombre = 'Irene',
@apellido = 'Amate Garrido',
@numDoc = '78035130',
@celular = '964782135',
@correo = 'iamate@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Maparicio',
@contrasena = 'map479',
@nombre = 'Magdalena',
@apellido = 'Aparicio Garcia',
@numDoc = '75238658',
@celular = '973218654',
@correo = 'maparicio@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Fbernabe',
@contrasena = 'berna6479',
@nombre = 'Francisco',
@apellido = 'Bernabe Casanova',
@numDoc = '75243008',
@celular = '946312765',
@correo = 'fbernabe@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Jcastillo',
@contrasena = 'castillo2021',
@nombre = 'Javier',
@apellido = 'Castillo Oller',
@numDoc = '52529108',
@celular = '946782531',
@correo = 'jcastillo@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Hfernandez',
@contrasena = 'HugFer946',
@nombre = 'Hugo',
@apellido = 'Fernandez Seguin',
@numDoc = '28915545',
@celular = '978631549',
@correo = 'hfernandez@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Mjimenez',
@contrasena = 'marjl4798',
@nombre = 'Maria',
@apellido = 'Jimenez Lopez',
@numDoc = '53706607',
@celular = '976315482',
@correo = 'mjimenez@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Jramos',
@contrasena = 'jesram679',
@nombre = 'Jesus',
@apellido = 'Ramos',
@numDoc = '75252068',
@celular = '93812795',
@correo = 'jramos@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Ltorres',
@contrasena = 'leto479',
@nombre = 'Leticia',
@apellido = 'Pari Torres',
@numDoc = '45589235',
@celular = '976482315',
@correo = 'ltorres@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Aortega',
@contrasena = 'aort7132',
@nombre = 'Ana',
@apellido = 'Ortega Casero',
@numDoc = '75250971',
@celular = '914456782',
@correo = 'aortega@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Mnavarro',
@contrasena = 'aort7132',
@nombre = 'Margarita',
@apellido = 'Navarro Martin',
@numDoc = '14627213',
@celular = '932165489',
@correo = 'mnavarro@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Mmoreno',
@contrasena = 'morob6548',
@nombre = 'Isabel',
@apellido = 'Moreno Robles',
@numDoc = '18113958',
@celular = '932165489',
@correo = 'imoreno@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

EXEC dbo.usp_InsertarUsuario
@usuario = 'Arodriguez',
@contrasena = 'Antoro9846',
@nombre = 'Antonio',
@apellido = 'Rodriguez Toro',
@numDoc = '48963124',
@celular = '996317856',
@correo = 'imoreno@gymplus.com', 
@idRol = 'R003', 
@usuRegistro = null,
@estado = 1
go

-----------------------------------USUARIO CLIENTE-----------------
EXEC dbo.usp_InsertarUsuario

@usuario = '123',
@contrasena = 'xd21',
@nombre = 'pato',
@apellido = 'gilberto',
@numDoc = '75819671', 
@celular = null,
@correo = 'patogilberto@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'kerwin',
@contrasena = 'baby123',
@nombre = 'kerwin',
@apellido = 'kanero',
@numDoc = '75814585', 
@celular = null,
@correo = 'kkerwin58@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'jhona',
@contrasena = 'juj123',
@nombre = 'jhona',
@apellido = 'fernandez',
@numDoc = '14526852', 
@celular = null,
@correo = 'jhonata123@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'myke',
@contrasena = 'towers123',
@nombre = 'Myke',
@apellido = 'Towers',
@numDoc = '65866625', 
@celular = null,
@correo = 'mtowers26@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'arca',
@contrasena = 'site485',
@nombre = 'arcangel',
@apellido = 'factory',
@numDoc = '66658236', 
@celular = null,
@correo = 'arkpa@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'neo',
@contrasena = 'neo123',
@nombre = 'neo',
@apellido = 'pistea',
@numDoc = '58208001', 
@celular = null,
@correo = 'neopistea452@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'rei',
@contrasena = 'rkiii47',
@nombre = 'rei',
@apellido = 'ssj',
@numDoc = '12545865', 
@celular = null,
@correo = 'reissj458@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'cazzu',
@contrasena = 'balvin23',
@nombre = 'cazzu',
@apellido = 'balvin',
@numDoc = '58625414', 
@celular = null,
@correo = 'cazzbvin@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'khea',
@contrasena = 'flex1558',
@nombre = 'khea',
@apellido = 'young',
@numDoc = '25863256', 
@celular = null,
@correo = 'youngflex@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'mauricio',
@contrasena = 'duk123',
@nombre = 'mauricio',
@apellido = 'santos',
@numDoc = '75863215', 
@celular = null,
@correo = 'dukmauri485@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'antonio',
@contrasena = 'pav3334',
@nombre = 'antonio',
@apellido = 'pavon',
@numDoc = '00825614', 
@celular = null,
@correo = 'pavaanto13@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'sheyla',
@contrasena = 'silla145',
@nombre = 'sheyla',
@apellido = 'rojas',
@numDoc = '25414563', 
@celular = null,
@correo = 'sheylarojas474@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'Paola',
@contrasena = 'futo8',
@nombre = 'Paolo',
@apellido = 'guerrero',
@numDoc = '35469521', 
@celular = null,
@correo = 'paolitofut12@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'Tini',
@contrasena = 'tnnn13',
@nombre = 'Tini',
@apellido = 'aguirre',
@numDoc = '02233645', 
@celular = null,
@correo = 'tiniagui186@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'maria23',
@contrasena = 'mari585',
@nombre = 'maria',
@apellido = 'becerra',
@numDoc = '22266620', 
@celular = null,
@correo = 'mariabecerra15@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'cro48',
@contrasena = 'tmbelc596',
@nombre = 'cristian',
@apellido = 'orosco',
@numDoc = '58914725', 
@celular = null,
@correo = 'tmbel12@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'litki58',
@contrasena = 'pit4586',
@nombre = 'Sergio',
@apellido = 'Ramirez',
@numDoc = '66658214', 
@celular = null,
@correo = 'sergiopit254@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------
EXEC dbo.usp_InsertarUsuario

@usuario = 'leon23',
@contrasena = 'daleu47',
@nombre = 'profe',
@apellido = 'leon',
@numDoc = '66625836', 
@celular = null,
@correo = 'ydaleu@gmail.com', 
@idRol = 'R005', 
@usuRegistro = null,
@estado = 1
------------------------------ INSERTAR SEDE-------------------
*/
