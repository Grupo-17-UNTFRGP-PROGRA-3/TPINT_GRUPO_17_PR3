CREATE DATABASE ClinicaDB;
GO

USE ClinicaDB;
GO

-- Tabla 1 Provincias
CREATE TABLE Provincias (
    Id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
	Eliminado BIT DEFAULT 0
);
GO

INSERT INTO Provincias (Descripcion)
VALUES ('Buenos Aires'),
	   ('Catamarca'),
	   ('Chubut'),
	   ('C�rdoba'),
	   ('Corrientes'),
	   ('Entre R�os'),
	   ('Formosa'),
	   ('Jujuy'), 
	   ('La Pampa'), 
	   ('La Rioja'), 
	   ('Mendoza'), 
	   ('Misiones'), 
	   ('Neuqu�n'), 
	   ('R�o Negro'), 
	   ('Salta'), 
	   ('San Juan'), 
	   ('San Luis'), 
	   ('Santa Cruz'), 
	   ('Santa Fe'),  
	   ('Santiago del Estero'), 
	   ('Tierra del Fuego'), 
	   ('Tucum�n');
GO

-- Tabla 2 Localidades
CREATE TABLE Localidades (
    IdProvincia INT NOT NULL,
	Id INT IDENTITY (1,1) NOT NULL,    
    Descripcion VARCHAR(50) NOT NULL,
	Eliminado BIT DEFAULT 0,
	PRIMARY KEY (IdProvincia, Id),
    FOREIGN KEY (IdProvincia) REFERENCES Provincias(Id)
);
GO

INSERT INTO Localidades (IdProvincia, Descripcion)
 VALUES -- Buenos Aires
		 (1, 'El Talar'), 
		 (1, 'Pacheco'),
		 (1, 'Los Troncos'),
		 (1, 'Lomas de Zamora'),
		 (1, 'Tigre'),
		 -- Misiones
		 (12, 'Garupa'),
		 (12, 'Puerto Iguazu'),
		 (12, 'Obera'),
		 (12, 'Panambi'),
		 (12, 'Garuhape'),
		 -- Neuquen
		 (13, 'Alumine'),
		 (13, 'Pic�n Leuf�'),
		 (13, 'Confluencia'),
		 (13, 'Pehuenches'),
		 (13, 'Chos Malal'),
		 -- Tierra del Fuego
		 (21, 'Ushuaia'),
		 (21, 'Tolhuin '),
		 (21, 'R�o Grande'),
		 -- Tucuman
		 (22, 'Famaill�'),
		 (22, 'Yerba Buena');
GO

-- Tabla 3 Nacionalidades
CREATE TABLE Nacionalidades (
    Id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
	Eliminado BIT DEFAULT 0
);
GO

INSERT INTO Nacionalidades(Descripcion)
VALUES ('Argentina'),
	   ('Chilena'),
	   ('Uruguaya'),
	   ('Boliviana'),
	   ('Paraguaya'),
	   ('Peruana'),
	   ('Brasile�a'),
	   ('Colombiana'),
	   ('Venezolana'),
	   ('Ecuatoriana'),
	   ('Mexicana'),
	   ('Cubana'),
	   ('Dominicana'),
	   ('Costarricense'),
	   ('Salvadore�a'),
	   ('Guatemalteca'),
	   ('Hondure�a'),
	   ('Nicarag�ense'),
	   ('Paname�a');
GO

-- Tabla 4 Especialidades
CREATE TABLE Especialidades (
    Id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
	Eliminado BIT DEFAULT 0
);
GO

INSERT INTO Especialidades(Descripcion)
VALUES ('Traumatolog�a'),
	   ('Ginecolog�a'),
	   ('Oftalmolog�a'),
	   ('Cardiolog�a'),
	   ('Dermatolog�a'),
	   ('Endocrinolog�a'),
	   ('Gastroenterolog�a'),
	   ('Hematolog�a'),
	   ('Infectolog�a'),
	   ('Nefrolog�a'),
	   ('Neumonolog�a'),
	   ('Neurolog�a'),
	   ('Nutrici�n'),
	   ('Oncolog�a'),
	   ('Otorrinolaringolog�a'),
	   ('Pediatr�a'),
	   ('Psiquiatr�a'),
	   ('Reumatolog�a'),
	   ('Urolog�a'),
	   ('Medicina General'),
	   ('Medicina Familiar'),
	   ('Medicina del Deporte'),
	   ('Cirug�a General');
GO

-- Tabla 5 Medicos
CREATE TABLE Medicos (
    Legajo VARCHAR(4) PRIMARY KEY NOT NULL,
    Dni VARCHAR(8) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Sexo BIT NOT NULL,
    IdNacionalidad INT NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Telefono VARCHAR(50) NOT NULL,
    IdEspecialidad INT NOT NULL,
    IdProvincia INT NOT NULL,
    IdLocalidad INT NOT NULL,
	Eliminado BIT DEFAULT 0,
    FOREIGN KEY (IdNacionalidad) REFERENCES Nacionalidades(Id),
    FOREIGN KEY (IdEspecialidad) REFERENCES Especialidades(Id),
    FOREIGN KEY (IdProvincia, IdLocalidad) REFERENCES Localidades(IdProvincia, Id)
);
GO

INSERT INTO Medicos (Legajo, Dni, Nombre, Apellido,
					 Sexo, IdNacionalidad, FechaNacimiento, Direccion,
					 Email, Telefono, IdEspecialidad, IdProvincia, IdLocalidad)
VALUES ('0000',	'00000000',	'0', '0', 0, 1, '1-1-2000', '0', '0', '0', 1, 1, 1),
	   ('0001', '12345678', 'Luc�a', 'Fern�ndez', 1, 1, '1980-03-15', 'Calle Falsa 123', 'lucia.fernandez@example.com', '1112345678', 2, 1, 1),
	   ('0002', '87654321', 'Mart�n', 'G�mez', 0, 1, '1975-07-22', 'Av. Siempreviva 742', 'martin.gomez@example.com', '1123456789', 3, 12, 6),
	   ('0003', '11223344', 'Camila', 'L�pez', 1, 1, '1990-01-10', 'Ruta 5 Km 12', 'camila.lopez@example.com', '1134567890', 4, 13, 11),
	   ('0004', '44332211', 'Javier', 'Pereyra', 0, 1, '1982-05-09', 'San Mart�n 1000', 'javier.pereyra@example.com', '1145678901', 5, 13, 11),
	   ('0005', '55667788', 'Natalia', 'Ramos', 1, 1, '1988-11-03', 'Alsina 334', 'natalia.ramos@example.com', '1156789012', 6, 13, 12),
	   ('0006', '99887766', 'Diego', 'Sosa', 0, 1, '1972-04-14', 'Belgrano 98', 'diego.sosa@example.com', '1167890123', 7, 21, 16),
	   ('0007', '33445566', 'Florencia', 'Acosta', 1, 1, '1993-06-29', 'Libertad 23', 'flor.acosta@example.com', '1178901234', 8, 21, 17),
	   ('0008', '66778899', 'Facundo', 'Medina', 0, 1, '1985-12-18', 'Mitre 56', 'facundo.medina@example.com', '1189012345', 9, 22, 19),
	   ('0009', '11224488', 'Brenda', 'Su�rez', 1, 1, '1991-09-05', 'Independencia 75', 'brenda.suarez@example.com', '1190123456', 10, 22, 20),
	   ('0010', '77889900', 'Agust�n', 'Ibarra', 0, 1, '1986-02-21', 'Rivadavia 45', 'agustin.ibarra@example.com', '1101234567', 11, 13, 12),
	   ('0011', '99001122', 'Julieta', 'Ben�tez', 1, 1, '1994-08-30', 'Moreno 200', 'julieta.benitez@example.com', '1123451234', 12, 12, 9),
	   ('0012', '22334455', 'Lucas', 'Vega', 0, 1, '1983-10-17', 'Dorrego 19', 'lucas.vega@example.com', '1134562345', 13, 1, 5),
	   ('0013', '44556677', 'Micaela', 'Castro', 1, 1, '1979-03-02', 'Pellegrini 678', 'micaela.castro@example.com', '1145673456', 14, 1, 3),
	   ('0014', '55664433', 'Tom�s', 'Luna', 0, 1, '1981-06-11', 'San Juan 99', 'tomas.luna@example.com', '1156784567', 15, 21, 17),
	   ('0015', '66775544', 'Sol', 'Herrera', 1, 1, '1992-12-25', 'Laprida 321', 'sol.herrera@example.com', '1167895678', 16, 21, 18);
GO

-- Tabla 6 Pacientes
CREATE TABLE Pacientes (
    Dni VARCHAR(8) PRIMARY KEY NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Sexo BIT NOT NULL,
    IdNacionalidad INT NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Telefono VARCHAR(11) NOT NULL,
    IdProvincia INT NOT NULL,
    IdLocalidad INT NOT NULL,
	Eliminado BIT DEFAULT 0,
    FOREIGN KEY (IdNacionalidad) REFERENCES Nacionalidades(Id),
    FOREIGN KEY (IdProvincia, IdLocalidad) REFERENCES Localidades(IdProvincia, Id)
);
GO

INSERT INTO Pacientes (Dni, Nombre, Apellido, Sexo,
					   IdNacionalidad, FechaNacimiento,
					   Direccion, Email, Telefono,
					   IdProvincia, IdLocalidad)
VALUES ('10000001', 'Mar�a', 'Alvarez', 1, 1, '1992-04-15', 'Calle 123', 'maria.alvarez@example.com', '1134567890', 1, 1),
	   ('10000002', 'Juan', 'P�rez', 0, 1, '1985-10-22', 'Av. Siempreviva 555', 'juan.perez@example.com', '1123456789', 1, 5),
	   ('10000003', 'Sof�a', 'Rodr�guez', 1, 1, '1990-07-30', 'Libertad 74', 'sofia.rod@example.com', '1145678901', 1, 4),
	   ('10000004', 'Carlos', 'Fern�ndez', 0, 1, '1978-02-11', 'Mitre 1089', 'carlos.fernandez@example.com', '1156789012', 1, 3),
	   ('10000005', 'Luciana', 'Ram�rez', 1, 1, '2000-06-05', 'San Mart�n 234', 'luciana.ramirez@example.com', '1167890123', 12, 8),
	   ('10000006', 'Diego', 'G�mez', 0, 1, '1995-03-28', 'Rivadavia 44', 'diego.gomez@example.com', '1178901234', 12, 10),
	   ('10000007', 'Camila', 'S�nchez', 1, 1, '1998-08-13', 'Moreno 321', 'camila.sanchez@example.com', '1189012345', 13, 11),
	   ('10000008', 'Mart�n', 'Torres', 0, 1, '1980-11-19', 'Belgrano 50', 'martin.torres@example.com', '1190123456', 13, 15),
	   ('10000009', 'Julieta', 'L�pez', 1, 1, '1983-01-25', 'Independencia 9', 'julieta.lopez@example.com', '1101234567', 21, 16),
	   ('10000010', 'Federico', 'D�az', 0, 1, '1991-09-09', 'Alsina 222', 'federico.diaz@example.com', '1112345678', 22, 19),
	   ('10000011', 'Valentina', 'Vega', 1, 1, '1993-12-17', 'Laprida 543', 'valen.vega@example.com', '1123451234', 22, 20),
	   ('10000012', 'Leandro', 'Aguirre', 0, 1, '1975-06-03', 'Ruta 3 KM 88', 'leandro.aguirre@example.com', '1134562345', 21, 17),
	   ('10000013', 'Florencia', 'Molina', 1, 1, '1987-05-11', 'Pellegrini 777', 'flor.molina@example.com', '1145673456', 21, 18),
	   ('10000014', 'Tom�s', 'Cruz', 0, 1, '1996-02-02', 'San Juan 66', 'tomas.cruz@example.com', '1156784567', 12, 7),
	   ('10000015', 'Milagros', 'Paz', 1, 1, '2001-10-20', 'Dorrego 14', 'milagros.paz@example.com', '1167895678', 12, 6);
GO

-- Tabla 7 Usuarios
CREATE TABLE Usuarios (
    Usuario VARCHAR(50) PRIMARY KEY NOT NULL,
    [Password] VARCHAR(50) NOT NULL,
    Legajo VARCHAR(4) NOT NULL,
	Eliminado BIT DEFAULT 0,
    FOREIGN KEY (Legajo) REFERENCES Medicos(Legajo)
);
GO

INSERT INTO Usuarios (Usuario, [Password], Legajo)
VALUES -- Admins
	   ('ElianVarela', '1312', '0000'),
	   ('PabloPoliserpi', '1111', '0000'),
	   ('TomasMartinez', '2222', '0000'),
	   ('FrancoCuello', '3333', '0000'),
	   ('RodrigoMeren', '4444', '0000'),
	   -- Doctores
	   ('Lfernandez', 'docpass01', '0001'),
	   ('Mgomez', 'docpass02', '0002'),
	   ('Clopez', 'docpass03', '0003'),
	   ('Jpereyra', 'docpass04', '0004'),
	   ('Nramos', 'docpass05', '0005'),
	   ('Dsosa', 'docpass06', '0006'),
	   ('Facostamed', 'docpass07', '0007'),
	   ('Fmedina', 'docpass08', '0008'),
	   ('Bsuarez', 'docpass09', '0009'),
	   ('Aibarra', 'docpass10', '0010');
GO

-- Tabla 8 Dias
CREATE TABLE Dias (
    Id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
	Eliminado BIT DEFAULT 0
);
GO

INSERT INTO Dias (Descripcion)
VALUES ('lunes'),
	   ('martes'),
	   ('mi�rcoles'), 
	   ('jueves'),
	   ('viernes'),
	   ('s�bado');
GO

-- Tabla 9 Horarios
CREATE TABLE Horarios (
    Id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    Horario TIME NOT NULL,
    Descripcion VARCHAR(50) NOT NULL,
	Eliminado BIT DEFAULT 0
);
GO

INSERT INTO Horarios (Horario, Descripcion)
VALUES ('07:00', 'de 07:00hs a 08:00hs'),
	   ('08:00', 'de 08:00hs a 09:00hs'),
	   ('09:00', 'de 09:00hs a 10:00hs'),
	   ('10:00', 'de 10:00hs a 11:00hs'),
	   ('11:00', 'de 11:00hs a 12:00hs'),
	   ('12:00', 'de 12:00hs a 13:00hs'),
	   ('13:00', 'de 13:00hs a 14:00hs'),
	   ('14:00', 'de 14:00hs a 15:00hs'),
	   ('15:00', 'de 15:00hs a 16:00hs'),
	   ('16:00', 'de 16:00hs a 17:00hs'),
	   ('17:00', 'de 17:00hs a 18:00hs'),
	   ('18:00', 'de 18:00hs a 19:00hs');
GO

-- Tabla 10 HorariosMedicos
CREATE TABLE HorariosMedicos (
    IdDia INT NOT NULL,
    Legajo VARCHAR(4) NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
	Eliminado BIT DEFAULT 0,
	PRIMARY KEY (IdDia, Legajo),
    FOREIGN KEY (IdDia) REFERENCES Dias(Id),
    FOREIGN KEY (Legajo) REFERENCES Medicos(Legajo)
);
GO

INSERT INTO HorariosMedicos (IdDia, Legajo, HoraInicio, HoraFin)
VALUES (1, '0001', '08:00', '12:00'),
	   (3, '0001', '14:00', '18:00'),
	   (5, '0001', '09:00', '13:00'),
	   (2, '0002', '07:00', '11:00'),
	   (4, '0002', '13:00', '16:00'),
	   (1, '0003', '10:00', '14:00'),
	   (2, '0004', '09:00', '12:00'),
	   (3, '0004', '15:00', '18:00'),
	   (5, '0005', '07:00', '10:00'),
	   (6, '0005', '08:00', '11:00'),
	   (3, '0006', '10:00', '13:00'),
	   (1, '0007', '13:00', '17:00'),
	   (4, '0007', '08:00', '11:00'),
	   (2, '0008', '14:00', '17:00'),
	   (3, '0009', '07:00', '09:00'),
	   (5, '0009', '10:00', '13:00'),
	   (6, '0010', '08:00', '12:00'),
	   (1, '0011', '15:00', '18:00'),
	   (2, '0012', '09:00', '12:00'),
	   (5, '0013', '07:00', '11:00'),
	   (4, '0014', '08:00', '13:00');
GO

-- Tabla 11 Turnos
CREATE TABLE Turnos (
    Id INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    LegajoMedico VARCHAR(4) NOT NULL,
    DniPaciente VARCHAR(8) NOT NULL,
    Fecha DATE NOT NULL,
    IdHorario INT NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    Observacion VARCHAR(255),
	Eliminado BIT DEFAULT 0,
    FOREIGN KEY (LegajoMedico) REFERENCES Medicos(Legajo),
    FOREIGN KEY (DniPaciente) REFERENCES Pacientes(Dni),
    FOREIGN KEY (IdHorario) REFERENCES Horarios(Id)
);
GO

INSERT INTO Turnos (LegajoMedico, DniPaciente, Fecha, IdHorario, Estado)
VALUES
('0001', '10000001', '2025-06-24', 2, 'Pendiente'),
('0002', '10000002', '2025-06-24', 4, 'Confirmado'),
('0003', '10000003', '2025-06-25', 5, 'Pendiente'),
('0004', '10000004', '2025-06-25', 6, 'Confirmado'),
('0005', '10000005', '2025-06-26', 7, 'Pendiente'),
('0006', '10000006', '2025-06-26', 8, 'Cancelado'),
('0007', '10000007', '2025-06-27', 9, 'Confirmado'),
('0008', '10000008', '2025-06-27', 10, 'Pendiente'),
('0009', '10000009', '2025-07-01', 3, 'Confirmado'),
('0010', '10000010', '2025-07-01', 4, 'Pendiente'),
('0011', '10000011', '2025-07-02', 5, 'Confirmado'),
('0012', '10000012', '2025-07-02', 6, 'Pendiente'),
('0013', '10000013', '2025-07-03', 7, 'Pendiente'),
('0014', '10000014', '2025-07-03', 8, 'Confirmado'),
('0015', '10000015', '2025-07-04', 9, 'Pendiente');
GO