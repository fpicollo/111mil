
CREATE OR REPLACE FUNCTION contact_information_get_address (
	IN p_dni                   integer
) RETURNS text AS 
$$
	SELECT address FROM contact_information 
		WHERE dni = p_dni;
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION contact_information_get_phone (
	IN p_dni                   integer
) RETURNS text AS 
$$ 
	SELECT phone FROM contact_information
		WHERE dni = p_dni;
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION contact_information_get_email (
	IN p_dni                   integer
) RETURNS text AS
$$
	SELECT email FROM contact_information
		WHERE dni = p_dni;
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION contact_information_set_address (
	IN p_dni                      integer,
	IN p_new_address              text
) RETURNS void AS
$$
	UPDATE contact_information SET address = p_new_address
		WHERE dni = p_dni;
$$ LANGUAGE sql VOLATILE STRICT;


CREATE OR REPLACE FUNCTION contact_information_set_phone (
	IN p_dni                      integer,
	IN p_new_phone                text
) RETURNS void AS
$$
	UPDATE contact_information SET phone = p_new_phone
		WHERE dni = p_dni;
$$ LANGUAGE sql VOLATILE STRICT;


CREATE OR REPLACE FUNCTION contact_information_set_email (
	IN p_dni                      integer,
	IN p_new_email                text
) RETURNS void AS
$$
	UPDATE contact_information SET email = p_new_email
		WHERE dni = p_dni;
$$ LANGUAGE sql VOLATILE STRICT;
