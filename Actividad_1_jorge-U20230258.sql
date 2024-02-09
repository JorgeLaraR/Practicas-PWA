CREATE DATABASE actividadUno
go
use actividadUno
go

CREATE TABLE departamentos(
departamentoID INT PRIMARY KEY IDENTITY(1,1),
cirugia VARCHAR (50),
medicinaInterna VARCHAR (50),
oncologia VARCHAR (50),
)


CREATE TABLE personalMedico(
personalMedicoID INT PRIMARY KEY IDENTITY(1,1),
departamentoID INT,
doctores VARCHAR (50),
enfermeras VARCHAR (50),
FOREIGN KEY (departamentoID) REFERENCES departamentos(departamentoID)
)

CREATE TABLE administrativos(
administrativoID INT PRIMARY KEY IDENTITY(1,1),
departamentoID INT,
oficinistas VARCHAR (50),
gerentes VARCHAR (50),
FOREIGN KEY (departamentoID) REFERENCES departamentos(departamentoID)
)


CREATE TABLE pacientes(
pacienteID INT PRIMARY KEY IDENTITY(1,1),
personalMedicoID INT,
nombre VARCHAR (50),
apellido VARCHAR (50),
edad INT,
FOREIGN KEY (personalMedicoID) REFERENCES personalMedico(personalMedicoID)
)

CREATE TABLE historialMedico(
historialID INT PRIMARY KEY IDENTITY(1,1),
pacienteID INT,
consultaID INT,
procedimientosID INT,
diagnosticos VARCHAR (50),
tratamientos VARCHAR (50),
medicaciones VARCHAR (50),
FOREIGN KEY (pacienteID) REFERENCES pacientes(pacienteID),
FOREIGN KEY (consultaID) REFERENCES consultas(consultaID),
FOREIGN KEY (procedimientosID) REFERENCES procedimientosMedicos(procedimientosID)
)

CREATE TABLE consultas(
consultaID INT PRIMARY KEY IDENTITY(1,1),
pacienteID INT,
motivo VARCHAR (50),
fecha INT,
FOREIGN KEY (pacienteID) REFERENCES pacientes(pacienteID)
)

CREATE TABLE procedimientosMedicos(
procedimientosID INT PRIMARY KEY IDENTITY(1,1),
pacienteID INT,
ubicacionCorporal VARCHAR (50),
fechaRealizada INT,
FOREIGN KEY (pacienteID) REFERENCES pacientes(pacienteID)
)


  
INSERT INTO departamentos (cirugia, medicinaInterna, oncologia) VALUES ('R4 Dr. Ramirez', 'R4 Dr. Flores', 'R4 Dr. Maza');
INSERT INTO departamentos (cirugia, medicinaInterna, oncologia) VALUES ('R3 Dr. Roman', 'R3 Dr. Fauno', 'R3 Dra. Menendez');

INSERT INTO personalMedico (departamentoID, doctores, enfermeras) VALUES (1, 'Dr. Ramirez', 'Enfermera Dalia');
INSERT INTO personalMedico (departamentoID, doctores, enfermeras) VALUES (2, 'Dr. Ramirez', 'Enfermera Dalia');

INSERT INTO administrativos (departamentoID, oficinistas, gerentes) VALUES (1, 'Lic. Martinez', 'Gerente Santos');
INSERT INTO administrativos (departamentoID, oficinistas, gerentes) VALUES (2, 'Lic. Asturia', 'Gerente Lopez');

INSERT INTO pacientes (personalMedicoID, nombre, apellido, edad) VALUES (1, 'Jacobo', 'Amaya', 32);
INSERT INTO pacientes (personalMedicoID, nombre, apellido, edad) VALUES (2, 'Maria', 'Caceres', 17);

INSERT INTO historialMedico (pacienteID, consultaID, procedimientosID, diagnosticos, tratamientos, medicaciones) VALUES (1, 1, 1, 'Hepatitis tipo B', 'Transplante Hepatico', 'Entecavir');
INSERT INTO historialMedico (pacienteID, consultaID, procedimientosID, diagnosticos, tratamientos, medicaciones) VALUES (2, 2, 2, 'VIH - SIDA', 'Terapia antirretroviral', 'Truvada');

INSERT INTO consultas (pacienteID, motivo, fecha) VALUES (1, 'Jacobo', 'Dolor en boca estomacal', '2023-09-03');
INSERT INTO consultas (pacienteID, motivo, fecha) VALUES (2, 'Maria', 'Caceres', '2024-01-07');

INSERT INTO procedimientosMedicos (pacienteID, ubicacionCorporal, fechaRealizada) VALUES (1, 'Ileon izquierdo', '2024-01-10');
INSERT INTO procedimientosMedicos (pacienteID, ubicacionCorporal, fechaRealizada) VALUES (2, 'Torax - esternon', '2022-11-04');


SELECT * FROM procedimientosMedicos