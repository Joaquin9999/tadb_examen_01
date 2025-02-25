CREATE TABLE `HistorialPago` (
  `id_Pago` int PRIMARY KEY NOT NULL,
  `id_Empleado` int,
  `id_Sprint` int
);

CREATE TABLE `Empleado` (
  `id_Empleado` int PRIMARY KEY NOT NULL,
  `id_Equipo` int,
  `id_Cargo` int
);

CREATE TABLE `Cargo` (
  `id_Cargo` int PRIMARY KEY NOT NULL,
  `nombreCargo` varchar(255),
  `salario` decimal
);

CREATE TABLE `PI` (
  `id_PI` int PRIMARY KEY NOT NULL,
  `nombre_PI` varchar(255)
);

CREATE TABLE `Equipo` (
  `id_Equipo` int PRIMARY KEY NOT NULL,
  `id_Departamento` int,
  `id_PI` int
);

CREATE TABLE `Departamento` (
  `id_Departamento` int PRIMARY KEY NOT NULL,
  `nombreDepartamento` varchar(255)
);

CREATE TABLE `Nomina` (
  `id_Nomina` int PRIMARY KEY NOT NULL,
  `totalPago` decimal,
  `id_Departamento` int,
  `id_Sprint` int
);

CREATE TABLE `Sprint` (
  `id_Sprint` int PRIMARY KEY NOT NULL,
  `nombreSprint` varchar(255),
  `fechaInicio` date,
  `fechaFin` date
);

ALTER TABLE `HistorialPago` ADD FOREIGN KEY (`id_Empleado`) REFERENCES `Empleado` (`id_Empleado`);

ALTER TABLE `Empleado` ADD FOREIGN KEY (`id_Equipo`) REFERENCES `Equipo` (`id_Equipo`);

ALTER TABLE `Empleado` ADD FOREIGN KEY (`id_Cargo`) REFERENCES `Cargo` (`id_Cargo`);

ALTER TABLE `Equipo` ADD FOREIGN KEY (`id_Departamento`) REFERENCES `Departamento` (`id_Departamento`);

ALTER TABLE `Nomina` ADD FOREIGN KEY (`id_Departamento`) REFERENCES `Departamento` (`id_Departamento`);

ALTER TABLE `Equipo` ADD FOREIGN KEY (`id_PI`) REFERENCES `PI` (`id_PI`);

ALTER TABLE `HistorialPago` ADD FOREIGN KEY (`id_Sprint`) REFERENCES `Sprint` (`id_Sprint`);

ALTER TABLE `Nomina` ADD FOREIGN KEY (`id_Sprint`) REFERENCES `Sprint` (`id_Sprint`);
