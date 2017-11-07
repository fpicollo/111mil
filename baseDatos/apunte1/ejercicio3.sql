-- Crear una solución para almacenar información de personas. Se debe tener en cuenta:
-- 
-- * Número de Pasaporte
-- * Nombre
-- * Apellido
-- * Nacionalidad
-- * Fecha de Nacimiento
-- 
-- Cargar 20 registros. Escribir una consulta que me muestre nombre, apellido y nacionalidad de todas 
-- las personas que no sean oriundas de Colombia y que hayan nacido entre los años 1995 y 2005.

CREATE TABLE person (
	passport            integer,
	name                text,
	surname             text,
	nationality         text,
	birthday            timestamp with time zone
);

INSERT INTO person VALUES
	(1334233, 'Juan', 'Perez', 'Colombiano/a', '1997-01-01'),
	(1334233, 'Carlos', 'Vazquez', 'Argentino/a', '1999-03-01'),
	(1334233, 'Bautista', 'Gonzalez', 'Colombiano/a', '1977-01-05'),
	(1334233, 'German', 'Cordoba', 'Argentino/a', '1992-01-01'),
	(1334233, 'Javier', 'Milan', 'Colombiano/a', '1998-01-01'),
	(1334233, 'Enzo', 'Lopez', 'Colombiano/a', '1993-01-01'),
	(1334233, 'Adrian', 'Martinez', 'Argentino/a', '1992-01-01'),
	(1334233, 'Maximiliano', 'Martinez', 'Colombiano/a', '1991-01-01'),
	(1334233, 'Federico', 'Perez', 'Argentino/a', '1991-04-04'),
	(1334233, 'Roberto', 'Maidana', 'Colombiano/a', '1986-12-12'),
	(1334233, 'Andrea', 'Maidana', 'Paruano/a', '1997-06-01'),
	(1334233, 'Micaela', 'Fuentes', 'Argentino/a', '1997-11-10'),
	(1334233, 'Morena', 'Gutierrez', 'Colombiano/a', '1945-01-01'),
	(1334233, 'Romina', 'Florimonte', 'Argentino/a', '1946-01-01'),
	(1334233, 'Elsa', 'Schtainer', 'Colombiano/a', '1997-11-01'),
	(1334233, 'Florencia', 'Ramirez', 'Argentino/a', '1992-01-01'),
	(1334233, 'Juana', 'Azurduy', 'Colombiano/a', '1967-01-01'),
	(1334233, 'Matilda', 'Romanos', 'Colombiano/a', '1968-01-01'),
	(1334233, 'Luciana', 'Castro', 'Argentino/a', '1969-01-01'),
	(1334233, 'Ariadna', 'Castro', 'Peruano/a', '1970-01-01');
	
SELECT 
	name,
	surname,
	nationality
FROM 
	person
WHERE 
	nationality = 'Colombiano/a'
	AND birthday BETWEEN '1995-01-01' AND '2005-12-31';
