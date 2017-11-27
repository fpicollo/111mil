
CREATE TYPE account_type AS ENUM('CAJA DE AHORROS', 'CUENTA CORRIENTE');
CREATE SCHEMA customer;
CREATE SCHEMA accounting;

CREATE TABLE customer.person(
	cuit                text PRIMARY KEY,
	iibb                text UNIQUE
);

CREATE TABLE customer.contact_information (
	contact_id          serial PRIMARY KEY,
	address             text,
	phone               text,
	email               text,
	cuit                text NOT NULL REFERENCES customer.person(cuit)
);

CREATE TABLE customer.physical_person (
	dni                 text UNIQUE NOT NULL,
	surname             text NOT NULL,
	name                text NOT NULL,
	birthday            timestamp with time zone NOT NULL,
	cuit                text PRIMARY KEY REFERENCES customer.person(cuit)
);

CREATE TABLE customer.legal_person (
	cuit                text PRIMARY KEY REFERENCES customer.person(cuit),
	legal_name          text NOT NULL,
	fantasy_name        text,
	constitution_date   timestamp with time zone NOT NULL
);

CREATE TABLE accounting.account (
	account_id                         serial PRIMARY KEY,
	owner_cuit                         text NOT NULL REFERENCES customer.person(cuit),
	opening_date                       timestamp with time zone NOT NULL DEFAULT now(),
	account_type                       account_type NOT NULL DEFAULT 'CAJA DE AHORROS',
	authorized_uncovered_balance       double precision NOT NULL DEFAULT 0 CHECK (authorized_uncovered_balance <= 0),
	balance                            double precision NOT NULL DEFAULT 0 CHECK (balance >= authorized_uncovered_balance)
);

CREATE TABLE accounting.movement (
	movement_id              serial PRIMARY KEY,
	movement_timestamp       timestamp with time zone NOT NULL DEFAULT now(),
	movement_description     text NOT NULL,
	account_id               integer NOT NULL REFERENCES accounting.account(account_id),
	quantity                 double precision NOT NULL CHECK (quantity != 0)
);
