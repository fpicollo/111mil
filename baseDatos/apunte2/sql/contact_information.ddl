
CREATE TABLE contact_information (
	dni                           integer PRIMARY KEY REFERENCES person(dni),
	address                       text NOT NULL,
	phone                         text,
	email                         text
);
