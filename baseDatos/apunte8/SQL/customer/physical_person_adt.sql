
CREATE TABLE customer.physical_person (
	dni                 text UNIQUE NOT NULL,
	surname             text NOT NULL,
	name                text NOT NULL,
	birthday            timestamp with time zone NOT NULL,
	cuit                text PRIMARY KEY REFERENCES customer.person(cuit)
);
