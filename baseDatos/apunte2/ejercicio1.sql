-- Crear una base de datos relacional para un instituto de formación profesional. 
-- Se debe registrar alumnos, docentes y cursos. 
-- Determinar qué alumnos está inscritos en cada curso, y qué docentes están dictando cada curso. 
-- 
-- Respecto a los alumnos se desea saber:
--  - Nombre (obligatorio)
--  - Apellido (obligatorio)
--  - DNI (obligatorio y único)
--  - Fecha de Nacimiento (obligatorio)
--  - Dirección (obligatorio)
--  - Teléfono 
--  - eMail
--  - Fecha de Inscripción (obligatorio)
--  - Número de legajo (obligatorio y único)
--  - Qué curso está realizando
-- 
-- Respecto a los docentes se desea saber:
--  - Nombre (obligatorio)
--  - Apellido (obligatorio)
--  - DNI (obligatorio y único)
--  - Fecha de Nacimiento (obligatorio)
--  - Dirección (obligatorio)
--  - Teléfono 
--  - eMail
--  - Fecha de contratación (obligatorio)
--  - CUIL (obligatorio y único)
--  - Honorarios (obligatorio, y debe ser mayor que cero)
--  - De qué curso es docente
-- 
-- Respecto a los cursos se desea saber:
--  - Nombre del curso (obligatorio y único)
--  - Descripción (obligatorio)
--  - Código del curso (obligatorio y único)
--  - Costo del curso (obligatorio, y debe ser mayor que cero)

CREATE TABLE course (
	course_id           text PRIMARY KEY,
	name                text UNIQUE,
	description         text NOT NULL,
	price               double precision NOT NULL CHECK(price >= 0)
);

CREATE TABLE person (
	dni                 integer PRIMARY KEY,
	name                text NOT NULL,
	surname             text NOT NULL,
	birthday            timestamp with time zone NOT NULL
);

CREATE TABLE contact_information (
	dni                 integer NOT NULL REFERENCES person(dni),
	postal_address      text NOT NULL,
	phone_number        text,
	email               text
);

CREATE TABLE student (
	dni                 integer UNIQUE REFERENCES person(dni),
	student_id          text PRIMARY KEY,
	inscription_date    timestamp with time zone NOT NULL
);

CREATE TABLE is_student_of (
	student_id          text NOT NULL REFERENCES student(student_id),
	course_id           text NOT NULL REFERENCES course(course_id),
	PRIMARY KEY (student_id, course_id)
);

CREATE TABLE professor (
	dni                 integer UNIQUE REFERENCES person(dni),
	cuil                text PRIMARY KEY,
	salary              double precision NOT NULL CHECK (salary > 0),
	signing_in_date     timestamp with time zone NOT NULL
);

CREATE TABLE is_proffesor_of (
	cuil                text NOT NULL REFERENCES professor(cuil),
	course_id           text NOT NULL REFERENCES course(course_id),
	PRIMARY KEY (cuil, course_id)
);
