CREATE SCHEMA customer;

CREATE TABLE customer.person (
	surname             text NOT NULL,
	name                text NOT NULL,
	cuit                text PRIMARY KEY,
	address             text NOT NULL
);

INSERT INTO customer.person VALUES
	('Perez', 'Juan', '20-23444555-2', 'Salta 123'),
	('Garcia', 'Pedro', '20-25666777-2', 'San Martín 342'),
	('Vazquez', 'Ramon', '20-20222333-4', 'Junín 5643'),
	('Rebolledo', 'Jaime', '22-18456282-1', 'Moreno 2464');


CREATE SCHEMA provider;

CREATE TABLE provider.person (
	name                text NOT NULL,
	cuit                text PRIMARY KEY,
	iibb                text UNIQUE,
	address             text NOT NULL
);

INSERT INTO provider.person VALUES
	('Juan Perez', '20-23444555-2', '34222123', 'Salta 123'),
	('Ramon Vazquez', '20-20222333-4', '12342178', 'San Martín 342'),
	('Gabriel Fuentes', '22-33444555-2', '45222333', 'Buenos Aires 1324'),
	('Dario Mosquera', '22-34323456-3', '892235678', 'Rivadavia 1333');


-- Nombre, CUIT y dirección de todas las personas involucradas en el sistema.

SELECT 
	(name || ' ' || surname) "Nombre",
	cuit "CUIT",
	address "Dirección",
	'Cliente' "Tipo"
FROM 
	customer.person
UNION
SELECT
	name,
	cuit,
	address,
	'Proveedor'
FROM 
	provider.person;


-- Qué personas son clientes y proveedores de forma simultánea (nombre y CUIT).
SELECT 
	(name || ' ' || surname) "Nombre",
	cuit "CUIT"
FROM 
	customer.person
INTERSECT
SELECT
	name,
	cuit
FROM 
	provider.person;


-- Qué personas son proveedores pero no clientes (nombre y CUIT).
SELECT
	name,
	cuit
FROM 
	provider.person
EXCEPT
SELECT 
	(name || ' ' || surname) "Nombre",
	cuit "CUIT"
FROM 
	customer.person;
