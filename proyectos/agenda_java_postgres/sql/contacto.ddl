
CREATE TABLE contacto (
	dni                           integer PRIMARY KEY,
	nombre                        text NOT NULL,
	apellido                      text NOT NULL,
	direccion                     text,
	telefono                      text,
	mail                          text
);

CREATE INDEX ON contacto(apellido);
