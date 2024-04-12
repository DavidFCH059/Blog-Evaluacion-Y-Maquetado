CREATE DATABASE Automotor

use Automotor;

CREATE TABLE LicenciaConduccion (
    NumeroLicencia INT PRIMARY KEY,
    AnoEmisionMatricula INT,
    FechaExpedicion DATE,
    TipoLicencia VARCHAR(50)
);

CREATE TABLE MatriculaVehiculo (
    NumeroMatricula INT PRIMARY KEY,
    FechaExpedicion DATE,
    TipoVehiculo VARCHAR(50)
);

CREATE TABLE Conductores (
    Cedula INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    LicenciaConduccion INT,
    FOREIGN KEY (LicenciaConduccion) REFERENCES LicenciaConduccion(NumeroLicencia)
);

CREATE TABLE Vehiculo (
    Matricula VARCHAR(20) PRIMARY KEY,
    Marca VARCHAR(100),
    Modelo VARCHAR(100),
    AnoFabricacion INT,
    KilometrajeActual FLOAT,
    CapacidadCarga FLOAT,
    NumeroMatricula INT,
    FOREIGN KEY (NumeroMatricula) REFERENCES MatriculaVehiculo(NumeroMatricula)
);

CREATE TABLE Viaticos (
    IdViaticos INT PRIMARY KEY,
    IdConductor INT,
    ValorViaticos DECIMAL(10, 2),
    FOREIGN KEY (IdConductor) REFERENCES Conductores(Cedula)
);

CREATE TABLE Monitoreo (
    IdMonitoreo INT PRIMARY KEY,
    IdMatricula VARCHAR(20),
    FechaInicio DATE,
    Hora TIME,
    Longitud DECIMAL(10, 6),
    Velocidad DECIMAL(10, 2),
    FOREIGN KEY (IdMatricula) REFERENCES Vehiculo(Matricula)
);

CREATE TABLE Ruta (
    IdRuta INT PRIMARY KEY,
    NombreRuta VARCHAR(100),
    DescripcionRuta VARCHAR(255),
    TiempoViajeEstimado TIME
);

CREATE TABLE Viajes (
    IdViaje INT PRIMARY KEY,
    Cedula INT,
    Matricula VARCHAR(20),
    FechaHoraInicio DATETIME,
    FechaHoraFin DATETIME,
    CiudadDestino VARCHAR(100),
    KilometrajeInicial FLOAT,
    KilometrajeFinal FLOAT,
    CostosViaje DECIMAL(10, 2),
    IdRutas INT,
    IdViaticos INT,
    FOREIGN KEY (Cedula) REFERENCES Conductores(Cedula),
    FOREIGN KEY (Matricula) REFERENCES Vehiculo(Matricula),
    FOREIGN KEY (IdRutas) REFERENCES Ruta(IdRuta),
    FOREIGN KEY (IdViaticos) REFERENCES Viaticos(IdViaticos)
);

CREATE TABLE MonitoreoXvehiculo (
    IdSeguimiento INT PRIMARY KEY,
    IdMatricula VARCHAR(20),
    IdMonitoreo INT,
    FechaInicio DATE,
    Descripcion TEXT,
    FinMonitoreo DATETIME,
    FOREIGN KEY (IdMatricula) REFERENCES Vehiculo(Matricula),
    FOREIGN KEY (IdMonitoreo) REFERENCES Monitoreo(IdMonitoreo)
);

CREATE TABLE ConductorXViatico (
    IdSeguimiento INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion TEXT,
    ValorViatico DECIMAL(10, 2),
    Cedula INT,
    IdViatico INT,
    FOREIGN KEY (Cedula) REFERENCES Conductores(Cedula),
    FOREIGN KEY (IdViatico) REFERENCES Viaticos(IdViaticos)
);



INSERT INTO LicenciaConduccion (NumeroLicencia, AnoEmisionMatricula, FechaExpedicion, TipoLicencia) 
VALUES 
(123456789, 2018, '2018-03-15', 'A2'),
(987654321, 2019, '2019-01-20', 'B1'),
(456789123, 2017, '2017-07-10', 'C'),
(789123456, 2020, '2020-02-05', 'A1'),
(321654987, 2016, '2016-05-18', 'B2'),
(654987321, 2015, '2015-11-30', 'A3'),
(987321654, 2022, '2022-09-22', 'C1'),
(321987654, 2019, '2019-08-14', 'B'),
(654321987, 2021, '2021-03-10', 'A'),
(123789456, 2018, '2018-06-25', 'D');

INSERT INTO MatriculaVehiculo (NumeroMatricula, FechaExpedicion, TipoVehiculo) 
VALUES 
(123456, '2020-05-10','Automóvil'),
(654321, '2019-08-20','Camión'),
(987654, '2021-02-15','Motocicleta'),
(456789, '2018-11-30','Camioneta'),
(321654, '2017-06-25','Automóvil'),
(789123, '2020-09-05','Camión'),
(951753, '2019-04-12','Motocicleta'),
(852369, '2022-03-28','Camioneta'),
(369852, '2016-10-15','Automóvil'),
(741258, '2021-07-01','Camión');

INSERT INTO Conductores (Cedula, Nombre, Direccion, Telefono, LicenciaConduccion) 
VALUES 
(123456789, 'Juan Pérez', 'Calle 123, Ciudad X', '1234567890', 123456789),
(987654321, 'María González', 'Avenida Principal, Ciudad Y', '9876543210', 987654321),
(456789123, 'Carlos Rodríguez', 'Carrera 456, Ciudad Z', '4567891230', 456789123),
(789123456, 'Ana Martínez', 'Calle Principal, Ciudad W', '7891234560', 789123456),
(321654987, 'Luis Hernández', 'Avenida 789, Ciudad V', '3216549870', 321654987),
(654987321, 'Laura Sánchez', 'Calle 654, Ciudad U', '6549873210', 654987321),
(987321654, 'Pedro López', 'Carrera 987, Ciudad T', '9873216540', 987321654),
(321987654, 'Sofía Ramírez', 'Avenida 321, Ciudad S', '3219876540', 321987654),
(654321987, 'Elena García', 'Calle 789, Ciudad R', '6543219870', 654321987),
(123789456, 'Daniel Cruz', 'Carrera 123, Ciudad Q', '1237894560', 123789456);

INSERT INTO Vehiculo (Matricula, Marca, Modelo, AnoFabricacion, KilometrajeActual, CapacidadCarga, NumeroMatricula) 
VALUES 
('ABC123', 'Toyota', 'Corolla', 2018, 50000, 500, 123456),
('DEF456', 'Ford', 'F-150', 2019, 40000, 1000, 654321),
('GHI789', 'Honda', 'Civic', 2017, 60000, 400, 987654),
('JKL012', 'Chevrolet', 'Spark', 2020, 30000, 300, 456789),
('MNO345', 'Nissan', 'Sentra', 2015, 70000, 600, 321654),
('PQR678', 'Hyundai', 'Tucson', 2016, 80000, 800, 789123),
('STU901', 'Kia', 'Rio', 2021, 20000, 200, 951753),
('VWX234', 'Mazda', 'CX-5', 2014, 90000, 700, 852369),
('YZA567', 'Volkswagen', 'Jetta', 2013, 100000, 900, 369852),
('BCD890', 'Subaru', 'Forester', 2018, 45000, 750, 741258);

INSERT INTO Viaticos (IdViaticos, IdConductor, ValorViaticos) 
VALUES 
(1, 123456789, 250.00),
(2, 987654321, 200.00),
(3, 456789123, 300.00),
(4, 789123456, 150.00),
(5, 321654987, 180.00),
(6, 654987321, 220.00),
(7, 987321654, 270.00),
(8, 321987654, 190.00),
(9, 654321987, 210.00),
(10, 123789456, 280.00);

INSERT INTO Monitoreo (IdMonitoreo, IdMatricula, FechaInicio, Hora, Longitud, Velocidad) 
VALUES 
(1, 'ABC123', '2024-04-09', '08:00:00', 45.6789, 60.5),
(2, 'DEF456', '2024-04-09', '08:30:00', 46.7891, 55.2),
(3, 'GHI789', '2024-04-09', '09:00:00', 47.8902, 70.3),
(4, 'JKL012', '2024-04-09', '09:30:00', 48.9013, 65.7),
(5, 'MNO345', '2024-04-09', '10:00:00', 49.0124, 62.8),
(6, 'PQR678', '2024-04-09', '10:30:00', 50.1235, 58.9),
(7, 'STU901', '2024-04-09', '11:00:00', 51.2346, 63.2),
(8, 'VWX234', '2024-04-09', '11:30:00', 52.3457, 68.4),
(9, 'YZA567', '2024-04-09', '12:00:00', 53.4568, 61.6),
(10, 'BCD890', '2024-04-09', '12:30:00', 54.5679, 67.8);

INSERT INTO Ruta (IdRuta, NombreRuta, DescripcionRuta, TiempoViajeEstimado) 
VALUES 
(1, 'Ruta 1', 'Ruta oriente', '02:30:00'),
(2, 'Ruta 2', 'Ruta Occidente', '01:45:00'),
(3, 'Ruta 3', 'Ruta Sur', '03:00:00'),
(4, 'Ruta 4', 'Ruta Norte', '02:00:00'),
(5, 'Ruta 5', 'Ruta montañosa', '02:15:00'),
(6, 'Ruta 6', 'Ruta oriente', '02:45:00'),
(7, 'Ruta 7', 'Ruta montañosa', '03:30:00'),
(8, 'Ruta 8', 'Ruta cafetera', '02:20:00'),
(9, 'Ruta 9', 'Ruta Sur', '02:10:00'),
(10, 'Ruta 10', 'Ruta occidente', '02:50:00');

INSERT INTO Viajes (IdViaje, Cedula, Matricula, FechaHoraInicio, FechaHoraFin, CiudadDestino, KilometrajeInicial, KilometrajeFinal, CostosViaje, IdRutas, IdViaticos) 
VALUES 
(1, 123456789, 'ABC123', '2024-04-09 08:00:00', '2024-04-09 10:30:00', 'Ciudad A', 50000, 50500, 120.00, 1, 1),
(2, 987654321, 'DEF456', '2024-04-09 09:30:00', '2024-04-09 11:45:00', 'Ciudad B', 40000, 40700, 150.00, 2, 2),
(3, 456789123, 'GHI789', '2024-04-09 10:45:00', '2024-04-09 13:15:00', 'Ciudad C', 60000, 60750, 130.00, 3, 3),
(4, 789123456, 'JKL012', '2024-04-09 12:00:00', '2024-04-09 14:30:00', 'Ciudad D', 30000, 30450, 110.00, 4, 4),
(5, 321654987, 'MNO345', '2024-04-09 13:30:00', '2024-04-09 16:00:00', 'Ciudad E', 70000, 70400, 140.00, 5, 5),
(6, 654987321, 'PQR678', '2024-04-09 15:00:00', '2024-04-09 17:45:00', 'Ciudad F', 80000, 80500, 125.00, 6, 6),
(7, 987321654, 'STU901', '2024-04-09 16:30:00', '2024-04-09 19:00:00', 'Ciudad G', 20000, 20500, 135.00, 7, 7),
(8, 321987654, 'VWX234', '2024-04-09 18:00:00', '2024-04-09 21:00:00', 'Ciudad H', 90000, 90550, 160.00, 8, 8),
(9, 654321987, 'YZA567', '2024-04-09 19:45:00', '2024-04-09 22:30:00', 'Ciudad I', 100000, 100500, 145.00, 9, 9),
(10, 123789456, 'BCD890', '2024-04-09 21:15:00', '2024-04-09 23:45:00', 'Ciudad J', 45000, 45400, 155.00, 10, 10);

INSERT INTO MonitoreoXvehiculo (IdSeguimiento, IdMatricula, IdMonitoreo, FechaInicio, Descripcion, FinMonitoreo) 
VALUES 
(1, 'ABC123', 1, '2024-04-10', 'Monitoreo de rutina', '2024-04-10 08:30:00'),
(2, 'DEF456', 2, '2024-04-10', 'Monitoreo de mantenimiento', '2024-04-10 09:00:00'),
(3, 'GHI789', 3, '2024-04-10', 'Prueba de rendimiento', '2024-04-10 09:30:00'),
(4, 'JKL012', 4, '2024-04-10', 'Inspección de seguridad', '2024-04-10 10:00:00'),
(5, 'MNO345', 5, '2024-04-10', 'Seguimiento de entrega', '2024-04-10 10:30:00'),
(6, 'PQR678', 6, '2024-04-10', 'Monitoreo de carga', '2024-04-10 11:00:00'),
(7, 'STU901', 7, '2024-04-10', 'Prueba de velocidad', '2024-04-10 11:30:00'),
(8, 'VWX234', 8, '2024-04-10', 'Monitoreo de consumo de combustible', '2024-04-10 12:00:00'),
(9, 'YZA567', 9, '2024-04-10', 'Seguimiento de trayectoria', '2024-04-10 12:30:00'),
(10, 'BCD890', 10, '2024-04-10', 'Monitoreo de temperatura', '2024-04-10 13:00:00');

INSERT INTO ConductorXViatico (IdSeguimiento, Nombre, Descripcion, ValorViatico, Cedula, IdViatico) 
VALUES 
(1, 'Juan Pérez', 'Viático por viaje de entrega', 200.00, 123456789, 1),
(2, 'María González', 'Viático por reunión de negocios', 150.00, 987654321, 2),
(3, 'Carlos Rodríguez', 'Viático por viaje de capacitación', 180.00, 456789123, 3),
(4, 'Ana Martínez', 'Viático por viaje de servicio técnico', 220.00, 789123456, 4),
(5, 'Luis Hernández', 'Viático por viaje de inspección', 170.00, 321654987, 5),
(6, 'Laura Sánchez', 'Viático por viaje de ventas', 190.00, 654987321, 6),
(7, 'Pedro López', 'Viático por viaje de promoción', 210.00, 987321654, 7),
(8, 'Sofía Ramírez', 'Viático por viaje de formación', 230.00, 321987654, 8),
(9, 'Elena García', 'Viático por viaje de consultoría', 240.00, 654321987, 9),
(10, 'Daniel Cruz', 'Viático por viaje de auditoría', 180.00, 123789456, 10);






/*consultas*/

SELECT * FROM Conductores;

SELECT * FROM Vehiculo WHERE KilometrajeActual > 70000;

SELECT * FROM Viajes WHERE FechaHoraInicio > '2024-04-09 15:00:00';

SELECT * FROM Viaticos WHERE ValorViaticos > 200.00;

SELECT * FROM Monitoreo WHERE Velocidad > 70.0;

SELECT * FROM Conductores WHERE Direccion LIKE '%Calle%';

SELECT * FROM Vehiculo WHERE Marca = 'Toyota';

SELECT * FROM Viajes WHERE CostosViaje > 150.00 AND CiudadDestino = 'Ciudad B';

SELECT * FROM Viaticos WHERE IdConductor = 987654321;

SELECT * FROM Monitoreo ORDER BY FechaInicio DESC, Hora DESC;

/*Subconsultas*/

SELECT * 
FROM Conductores 
WHERE LicenciaConduccion IN (SELECT NumeroLicencia FROM LicenciaConduccion WHERE TipoLicencia LIKE 'A%');

/**/

SELECT AVG(ValorViaticos) 
FROM Viaticos;

/**/

SELECT Cedula, Nombre, 
    (SELECT COUNT(*) FROM Viajes WHERE Viajes.Cedula = Conductores.Cedula) AS NumeroViajes
FROM Conductores;

/**/

SELECT * 
FROM Viajes 
WHERE CostosViaje > (SELECT AVG(CostosViaje) FROM Viajes);

/**/

SELECT * 
FROM Conductores 
WHERE Cedula IN (SELECT Cedula FROM Viajes WHERE CiudadDestino = 'Ciudad A');



/*Crear 5 consultas usando Inner Join, rigth Join y Left Join*/

SELECT Viajes.*, Conductores.Nombre AS NombreConductor
FROM Viajes
INNER JOIN Conductores ON Viajes.Cedula = Conductores.Cedula;

/**/

SELECT Vehiculo.*, Monitoreo.*
FROM Vehiculo
RIGHT JOIN Monitoreo ON Vehiculo.Matricula = Monitoreo.IdMatricula;

/**/

SELECT Conductores.*, Viaticos.ValorViaticos
FROM Conductores
LEFT JOIN Viaticos ON Conductores.Cedula = Viaticos.IdConductor;

/**/

SELECT Viajes.*, Ruta.NombreRuta, Ruta.DescripcionRuta
FROM Viajes
INNER JOIN Ruta ON Viajes.IdRutas = Ruta.IdRuta;

/**/

SELECT Viaticos.*, Conductores.Nombre AS NombreConductor
FROM Viaticos
RIGHT JOIN Conductores ON Viaticos.IdConductor = Conductores.Cedula;














































