
CREATE TABLE student (
	dni                           integer UNIQUE REFERENCES person(dni),
	inscription_date              date NOT NULL DEFAULT now(),
	file_number                   serial PRIMARY KEY
);
