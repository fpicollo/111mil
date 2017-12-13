
CREATE TYPE account_type AS ENUM('CAJA DE AHORROS', 'CUENTA CORRIENTE');
CREATE SCHEMA customer;
CREATE SCHEMA accounting;

CREATE TABLE customer.person(
	cuit                text PRIMARY KEY,
	iibb                text UNIQUE
);


CREATE OR REPLACE FUNCTION customer.person(
	IN p_cuit           text,
	IN p_iibb           text
) RETURNS boolean AS $$
DECLARE 
	cuit_count          integer;
	iibb_count          integer;
	
BEGIN
	cuit_count := count(1) FROM customer.person WHERE cuit = p_cuit;
	iibb_count := count(1) FROM customer.person WHERE iibb = p_iibb;
	
	IF cuit_count = 0 AND iibb_count = 0
	THEN 
		INSERT INTO customer.person VALUES(p_cuit, p_iibb);
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'CUIT O IIBB YA EXISTEN EN LA BASE DE DATOS';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.person(
	IN p_cuit           text
) RETURNS boolean AS $$
DECLARE 
	cuit_count          integer;
	
BEGIN
	cuit_count := count(1) FROM customer.person WHERE cuit = p_cuit;
	
	IF cuit_count = 0
	THEN 
		INSERT INTO customer.person(cuit) VALUES(p_cuit);
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'CUIT YA EXISTEN EN LA BASE DE DATOS';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;

CREATE TABLE customer.contact_information (
	contact_id          serial PRIMARY KEY,
	address             text,
	phone               text,
	email               text,
	cuit                text NOT NULL REFERENCES customer.person(cuit) ON DELETE CASCADE
);


CREATE OR REPLACE FUNCTION customer.contact_information (
	IN p_cuit           text,
	IN p_address        text DEFAULT NULL,
	IN p_phone          text DEFAULT NULL,
	IN p_email          text DEFAULT NULL
) RETURNS boolean AS $$
DECLARE 

BEGIN 
	IF NOT EXISTS (SELECT 1 FROM customer.person WHERE cuit = p_cuit)
	THEN 
		RAISE WARNING 'ERROR: LA PERSONA NO EXISTE';
		RETURN FALSE;
	END IF;
	
	IF p_address IS NULL AND p_phone IS NULL AND p_email IS NULL 
	THEN
		RAISE WARNING 'ERROR: NINGUN DATO SUMINISTRADO';
		RETURN FALSE;
	ELSE 
		INSERT INTO customer.contact_information (address, phone, email, cuit)
			VALUES(p_address, p_phone, p_email, p_cuit);
		
		RETURN TRUE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE
SET search_path FROM CURRENT;

CREATE TABLE customer.physical_person (
	dni                           text UNIQUE NOT NULL,
	surname                       text NOT NULL,
	name                          text NOT NULL,
	birthday                      timestamp with time zone NOT NULL,
	cuit                          text PRIMARY KEY REFERENCES customer.person(cuit) ON DELETE CASCADE
);


CREATE OR REPLACE FUNCTION customer.physical_person (
	IN p_dni                      text,
	IN p_surname                  text,
	IN p_name                     text,
	IN p_birthday                 timestamp with time zone,
	IN p_cuit                     text,
	IN p_iibb                     text DEFAULT NULL
) RETURNS boolean AS $$
DECLARE 
	dni_count           integer;
	person_ok           boolean;
	
BEGIN 
	dni_count = count(1) FROM customer.physical_person WHERE dni = p_dni;
	
	IF dni_count != 0
	THEN 
		RAISE WARNING 'YA EXISTE UNA PERSONA CON ESE DNI';
		RETURN FALSE;
	END IF;
	
	IF date_part('years', age(now(), p_birthday)) < 18
	THEN 
		RAISE WARNING 'ERROR: LA PERSONA ES MENOR DE EDAD';
		RETURN FALSE;
	END IF;
	
	IF p_iibb IS NOT NULL
	THEN
		person_ok := customer.person(p_cuit, p_iibb);
	ELSE 
		person_ok := customer.person(p_cuit);
	END IF;
	
	IF NOT person_ok 
	THEN
		RAISE WARNING 'ERROR: CUIT O IIBB YA EXISTE';
		RETURN FALSE;
	ELSE 
		INSERT INTO customer.physical_person VALUES (
			p_dni,
			p_surname,
			p_name,
			p_birthday,
			p_cuit
		);
		
		RETURN TRUE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.physical_person_identify_by_dni (
	IN p_dni                      text
) RETURNS customer.physical_person AS 
$$
	SELECT * FROM customer.physical_person WHERE dni = p_dni;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.physical_person_identify_by_cuit (
	IN p_cuit                     text
) RETURNS customer.physical_person AS 
$$
	SELECT * FROM customer.physical_person WHERE cuit = p_cuit;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.physical_person_lookup (
	IN p_surname                  text
) RETURNS SETOF customer.physical_person AS 
$$
	SELECT * FROM customer.physical_person WHERE surname = p_surname;
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.physical_person_lookup (
	IN p_name                     text,
	IN p_surname                  text
) RETURNS SETOF customer.physical_person AS 
$$
	SELECT * FROM customer.physical_person WHERE (name, surname) = (p_name, p_surname);
$$ LANGUAGE sql STRICT STABLE
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.physical_person_get_dni (
	IN p_physical_person          customer.physical_person
) RETURNS text AS
$$
	SELECT p_physical_person.dni;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.physical_person_get_surname (
	IN p_physical_person          customer.physical_person
) RETURNS text AS
$$
	SELECT p_physical_person.surname;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.physical_person_get_name (
	IN p_physical_person          customer.physical_person
) RETURNS text AS
$$
	SELECT p_physical_person.name;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.physical_person_get_birthday (
	IN p_physical_person          customer.physical_person
) RETURNS timestamp with time zone AS
$$
	SELECT p_physical_person.birthday;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.physical_person_get_cuit (
	IN p_physical_person          customer.physical_person
) RETURNS text AS
$$
	SELECT p_physical_person.cuit;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.physical_person_get_age (
	IN p_physical_person          customer.physical_person
) RETURNS integer AS
$$
	SELECT date_part('years', age(now(), p_physical_person.birthday))::integer;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.physical_person_get_iibb (
	IN p_physical_person          customer.physical_person
) RETURNS text AS
$$
	SELECT iibb FROM customer.person WHERE cuit = p_physical_person.cuit;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;

CREATE TABLE customer.legal_person (
	cuit                     text PRIMARY KEY REFERENCES customer.person(cuit) ON DELETE CASCADE,
	legal_name               text NOT NULL,
	fantasy_name             text,
	constitution_date        timestamp with time zone NOT NULL
);


CREATE OR REPLACE FUNCTION customer.legal_person ( 
	IN p_cuit                     text,
	IN p_legal_name               text,
	IN p_constitution_date        timestamp with time zone,
	IN p_iibb                     text,
	IN p_fantasy_name             text DEFAULT NULL
) RETURNS boolean AS $$
BEGIN
	IF EXISTS (SELECT 1 FROM customer.legal_person WHERE cuit = p_cuit)
	THEN 
		RAISE WARNING 'ERROR: YA EXISTE UNA PERSONA LEGAL CON ESE CUIT';
		RETURN FALSE;
	END IF;
	
	IF NOT customer.person(p_cuit, p_iibb)
	THEN 
		RAISE WARNING 'ERROR: YA EXISTE UNA PERSONA CON ESE CUIT';
		RETURN FALSE;
	ELSE 
		INSERT INTO customer.legal_person
			VALUES(p_cuit, p_legal_name, p_fantasy_name, p_constitution_date);
		
		RETURN TRUE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.legal_person_identify_by_cuit (
	IN p_cuit                     text
) RETURNS customer.legal_person AS 
$$
	SELECT * FROM customer.legal_person WHERE cuit = p_cuit;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.legal_person_identify_by_iibb (
	IN p_iibb                     text
) RETURNS customer.legal_person AS
$$
	SELECT a.* FROM customer.legal_person a NATURAL INNER JOIN customer.person b
		WHERE b.iibb = p_iibb;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.legal_person_lookup_by_legal_name (
	IN p_legal_name               text
)  RETURNS SETOF customer.legal_person AS
$$
	SELECT * FROM customer.legal_person WHERE legal_name = p_legal_name;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.legal_person_lookup_by_fantasy_name (
	IN p_fantasy_name             text
)  RETURNS SETOF customer.legal_person AS
$$
	SELECT * FROM customer.legal_person WHERE fantasy_name = p_fantasy_name;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.legal_person_get_cuit (
	IN p_legal_person             customer.legal_person
) RETURNS text AS 
$$
	SELECT p_legal_person.cuit;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 


CREATE OR REPLACE FUNCTION customer.legal_person_get_legal_name (
	IN p_legal_person             customer.legal_person
) RETURNS text AS 
$$
	SELECT p_legal_person.legal_name;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 


CREATE OR REPLACE FUNCTION customer.legal_person_get_fantasy_name (
	IN p_legal_person             customer.legal_person
) RETURNS text AS 
$$
	SELECT p_legal_person.fantasy_name;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 


CREATE OR REPLACE FUNCTION customer.legal_person_set_fantasy_name (
	IN p_legal_person             customer.legal_person,
	IN p_fantasy_name             text
) RETURNS boolean AS $$
BEGIN 
	IF EXISTS (SELECT 1 FROM customer.legal_person a WHERE a = p_legal_person)
	THEN 
		UPDATE customer.legal_person SET fantasy_name = p_fantasy_name
			WHERE cuit = p_legal_person.cuit;
		
		RETURN TRUE;
	ELSE 
		RAISE WARNING 'La persona legal ingresada NO EXISTE';
		RETURN FALSE;
	END IF;
END;
$$ LANGUAGE plpgsql VOLATILE STRICT
SET search_path FROM CURRENT;


CREATE OR REPLACE FUNCTION customer.legal_person_get_constitution_date (
	IN p_legal_person             customer.legal_person
) RETURNS timestamp with time zone AS 
$$
	SELECT p_legal_person.constitution_date;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 


CREATE OR REPLACE FUNCTION customer.legal_person_get_iibb (
	IN p_legal_person             customer.legal_person
) RETURNS text AS 
$$
	SELECT iibb FROM customer.person WHERE cuit = p_legal_person.cuit;
$$ LANGUAGE sql STABLE STRICT
SET search_path FROM CURRENT; 

CREATE TABLE accounting.account (
	account_id                         serial PRIMARY KEY,
	owner_cuit                         text NOT NULL REFERENCES customer.person(cuit) ON DELETE CASCADE,
	opening_date                       timestamp with time zone NOT NULL DEFAULT now(),
	account_type                       account_type NOT NULL DEFAULT 'CAJA DE AHORROS',
	authorized_uncovered_balance       double precision NOT NULL DEFAULT 0 CHECK (authorized_uncovered_balance <= 0),
	balance                            double precision NOT NULL DEFAULT 0 CHECK (balance >= authorized_uncovered_balance)
);

CREATE TABLE accounting.movement (
	movement_id              serial PRIMARY KEY,
	movement_timestamp       timestamp with time zone NOT NULL DEFAULT now(),
	movement_description     text NOT NULL,
	account_id               integer NOT NULL REFERENCES accounting.account(account_id) ON DELETE CASCADE,
	quantity                 double precision NOT NULL CHECK (quantity != 0)
);
