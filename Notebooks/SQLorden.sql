
-- En la tabla 'eventos'

ALTER TABLE `eventos`
PRIMARY KEY (`eventos_id`)



-- En la tabla 'residentes'
ALTER TABLE `no_residentes`
PRIMARY KEY (`no_residentes_id`),
INDEX `eventos_id_idx` (`eventos_id` ASC) VISIBLE,
ADD CONSTRAINT `fk_evento_id`
FOREIGN KEY (`evento_id`) REFERENCES `eventos`(`evento_id`);


-- En la tabla 'no_residentes'
ALTER TABLE `no_residentes`
PRIMARY KEY (`residentes_id`),
INDEX `eventos_id_idx` (`eventos_id` ASC) VISIBLE,
ADD CONSTRAINT `fk_evento_id`
FOREIGN KEY (`evento_id`) REFERENCES `eventos`(`evento_id`);



-- En la tabla 'asistencia'

ALTER TABLE `asistencia`
PRIMARY KEY (`asistencia(2021-2022)_id`),
INDEX `residentes_id_idx` (`residentes_id` ASC) VISIBLE,
INDEX `no_residentes_id_idx` (`no_residentes_id` ASC) VISIBLE,
INDEX `eventos_id_idx` (`eventos_id` ASC) VISIBLE,

ADD CONSTRAINT `f_residentes_id`
    FOREIGN KEY (`residentes_id`)
    REFERENCES `residentes` (`residentes_id`)

ADD CONSTRAINT `f_no_residentes_id`
    FOREIGN KEY (`no_residentes_id`)
    REFERENCES `no_residentes` (`no_residentes_id`)

ADD CONSTRAINT `f_eventos_id`
    FOREIGN KEY (`eventos_id`)
    REFERENCES `eventos` (`eventos_id`)