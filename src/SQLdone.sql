
-- Creo el esquema:
CREATE SCHEMA `entradas_web` ;


-- En cada una de las tablas, genero su PRIMARY KEY.
ALTER TABLE `eventos`
ADD PRIMARY KEY (`eventos_id`);

ALTER TABLE `residentes`
ADD PRIMARY KEY (`residentes_id`);

ALTER TABLE `no_residentes`
ADD PRIMARY KEY (`no_residentes_id`);

ALTER TABLE `asistencia`
ADD PRIMARY KEY (`asistencia_id`);


-- Cambio en 'eventos'
ALTER TABLE `entradas_web`.`eventos` 
CHANGE COLUMN `eventos_id` `eventos_id` INT NOT NULL ,
CHANGE COLUMN `artista` `artista` VARCHAR(100) NULL DEFAULT NULL ,
CHANGE COLUMN `eventos` `eventos` VARCHAR(15) NULL DEFAULT NULL ,
CHANGE COLUMN `dia` `dia` INT NULL DEFAULT NULL ,
CHANGE COLUMN `mes` `mes` INT NULL DEFAULT NULL ,
CHANGE COLUMN `año` `año` INT NULL DEFAULT NULL ,
CHANGE COLUMN `precios` `precios` VARCHAR(30) NULL DEFAULT NULL ,
CHANGE COLUMN `enlaces` `enlaces` VARCHAR(200) NULL DEFAULT NULL ;


-- Cambio del formato de columnas en 'residentes'
ALTER TABLE `entradas_web`.`residentes` 
CHANGE COLUMN `residentes_id` `residentes_id` INT NOT NULL ,
CHANGE COLUMN `comunidad` `comunidad` VARCHAR(50) NULL DEFAULT NULL ,
CHANGE COLUMN `residencia` `residencia` VARCHAR(30) NULL DEFAULT NULL ,
CHANGE COLUMN `viajeros` `viajeros` VARCHAR(10) NULL DEFAULT NULL ,
CHANGE COLUMN `pernoctaciones` `pernoctaciones` VARCHAR(10) NULL DEFAULT NULL ,
CHANGE COLUMN `año` `año` INT NULL DEFAULT NULL ,
CHANGE COLUMN `mes` `mes` INT NULL DEFAULT NULL ,
CHANGE COLUMN `total` `total` VARCHAR(20) NULL DEFAULT NULL ;


-- Cambio del formato de columnas 'no_residentes'
ALTER TABLE `entradas_web`.`no_residentes` 
CHANGE COLUMN `no_residentes_id` `no_residentes_id` INT NOT NULL ,
CHANGE COLUMN `comunidad` `comunidad` VARCHAR(50) NULL DEFAULT NULL ,
CHANGE COLUMN `residencia` `residencia` VARCHAR(30) NULL DEFAULT NULL ,
CHANGE COLUMN `viajeros` `viajeros` VARCHAR(10) NULL DEFAULT NULL ,
CHANGE COLUMN `pernoctaciones` `pernoctaciones` VARCHAR(10) NULL DEFAULT NULL ,
CHANGE COLUMN `año` `año` INT NULL DEFAULT NULL ,
CHANGE COLUMN `mes` `mes` INT NULL DEFAULT NULL ,
CHANGE COLUMN `total` `total` VARCHAR(20) NULL DEFAULT NULL ;


-- Cambio del formato de columnas en 'no_residentes'
ALTER TABLE `entradas_web`.`asistencia` 
CHANGE COLUMN `asistencia_id` `asistencia_id` INT NOT NULL ,
CHANGE COLUMN `comunidad` `comunidad` VARCHAR(30) NULL DEFAULT NULL ,
CHANGE COLUMN `asistencia(2021-2022)` `asistencia(2021-2022)` VARCHAR(50) NULL DEFAULT NULL ,
CHANGE COLUMN `conciertos` `conciertos` VARCHAR(50) NULL DEFAULT NULL ,
CHANGE COLUMN `clasica` `clasica` VARCHAR(30) NULL DEFAULT NULL ,
CHANGE COLUMN `actual` `actual` VARCHAR(30) NULL DEFAULT NULL ;



-- En la tabla 'no_residentes' añado la columna de `eventos_id` y la pongo como foreign key.
ALTER TABLE `residentes`
ADD COLUMN `eventos_id` INT,
ADD CONSTRAINT `fk_eventos_id`
FOREIGN KEY (`eventos_id`) REFERENCES `eventos`(`eventos_id`);


-- En la tabla 'no_residentes' añado la columna de `eventos_id` y la pongo como foreign key.
ALTER TABLE `no_residentes`
ADD COLUMN `eventos_id` INT,
ADD CONSTRAINT `f_eventos_id`
FOREIGN KEY (`eventos_id`) REFERENCES `eventos`(`eventos_id`);


-- En la tabla 'asistencia' añado las columnas de `eventos_id`, `residentes_id` y `no_residentes_id`, y las pongo como foreign keys.
ALTER TABLE `asistencia`
ADD COLUMN `residentes_id` INT,
ADD CONSTRAINT `fk_residentes_id`
    FOREIGN KEY (`residentes_id`)
    REFERENCES `residentes` (`residentes_id`),
ADD COLUMN `no_residentes_id` INT,
ADD CONSTRAINT `fk_no_residentes_id`
    FOREIGN KEY (`no_residentes_id`)
    REFERENCES `no_residentes` (`no_residentes_id`),
ADD COLUMN `eventos_id` INT,
ADD CONSTRAINT `fky_eventos_id`
    FOREIGN KEY (`eventos_id`)
    REFERENCES `eventos` (`eventos_id`);


