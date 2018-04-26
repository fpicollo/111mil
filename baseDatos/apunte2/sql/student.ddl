
CREATE TABLE student (
	dni                           integer PRIMARY KEY REFERENCES person(dni),
	inscription_date              date NOT NULL DEFAULT now(),
	file_number                   serial NOT NULL UNIQUE
);
