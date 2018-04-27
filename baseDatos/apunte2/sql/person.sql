
CREATE OR REPLACE FUNCTION person (
	IN p_dni                      integer, 
	IN p_name                     text,
	IN p_surname                  text,
	IN p_birthdate                date,
	IN p_address                  text,
	IN p_phone                    text,
	IN p_email                    text
) RETURNS person AS
$$
	INSERT INTO person (dni, name, surname, birthdate)
		VALUES (p_dni, p_name, p_surname, p_birthdate);
	
	INSERT INTO contact_information (dni, address, phone, email)
		VALUES(p_dni, p_address, p_phone, p_email);
	
	SELECT * FROM person WHERE dni = p_dni;
$$ LANGUAGE sql VOLATILE;


CREATE OR REPLACE FUNCTION person_get_dni (
	IN p_person                   person
) RETURNS integer AS
$$
	SELECT dni(p_person);
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION person_get_name (
	IN p_person                   person
) RETURNS text AS
$$
	SELECT name(p_person);
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION person_get_surname (
	IN p_person                   person
) RETURNS text AS
$$
	SELECT surname(p_person);
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION person_get_birthdate (
	IN p_person                   person
) RETURNS date AS
$$
	SELECT birthdate(p_person);
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION person_get_age (
	IN p_person                   person
) RETURNS integer AS
$$
	SELECT date_part('year', age(person_get_birthdate(p_person)))::integer;
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION person_get_address (
	IN p_person                   person
) RETURNS text AS 
$$
	SELECT contact_information_get_address(dni(p_person));
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION person_get_phone (
	IN p_person                   person
) RETURNS text AS 
$$ 
	SELECT contact_information_get_phone(dni(p_person));
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION person_get_email (
	IN p_person                   person
) RETURNS text AS
$$
	SELECT contact_information_get_email(dni(p_person));
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION person_set_address (
	IN p_person                   person,
	IN p_new_address              text
) RETURNS void AS
$$
	SELECT contact_information_set_address(dni(p_person), p_new_address);
$$ LANGUAGE sql VOLATILE STRICT;


CREATE OR REPLACE FUNCTION person_set_phone (
	IN p_person                   person,
	IN p_new_phone                text
) RETURNS void AS
$$
	SELECT contact_information_set_phone(dni(p_person), p_new_phone);
$$ LANGUAGE sql VOLATILE STRICT;


CREATE OR REPLACE FUNCTION person_set_email (
	IN p_person                   person,
	IN p_new_email                text
) RETURNS void AS
$$
	SELECT contact_information_set_email(dni(p_person), p_new_email);
$$ LANGUAGE sql VOLATILE STRICT;


CREATE OR REPLACE FUNCTION person_search_by_surname (
	IN p_surname                  text DEFAULT '%',
	OUT dni                       integer,
	OUT name                      text,
	OUT surname                   text,
	OUT birthdate                 date,
	OUT age                       integer,
	OUT address                   text,
	OUT phone                     text,
	OUT email                     text
) RETURNS SETOF record AS
$$
	SELECT 
		p.dni,
		p.name,
		p.surname,
		p.birthdate,
		person_get_age(p),
		ci.address,
		ci.phone,
		ci.email
	FROM 
		person p
		NATURAL INNER JOIN contact_information ci
	WHERE 
		unaccent(p.surname) ILIKE unaccent(p_surname) || '%';
$$ LANGUAGE sql STABLE;


CREATE OR REPLACE FUNCTION person_lookup_by_surname (
	IN p_surname                  text,
	OUT dni                       integer,
	OUT name                      text,
	OUT surname                   text,
	OUT birthdate                 date,
	OUT age                       integer,
	OUT address                   text,
	OUT phone                     text,
	OUT email                     text
) RETURNS SETOF record AS
$$
	SELECT 
		p.dni,
		p.name,
		p.surname,
		p.birthdate,
		person_get_age(p),
		ci.address,
		ci.phone,
		ci.email
	FROM 
		person p
		NATURAL INNER JOIN contact_information ci
	WHERE 
		p.surname = p_surname;
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION person_identify_by_dni (
	IN p_dni                      integer
) RETURNS person AS
$$
	SELECT * FROM person WHERE dni = p_dni;
$$ LANGUAGE sql STABLE STRICT;
