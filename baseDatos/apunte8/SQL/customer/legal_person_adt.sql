
CREATE TABLE customer.legal_person (
	cuit                text PRIMARY KEY REFERENCES customer.person(cuit),
	legal_name          text NOT NULL,
	fantasy_name        text,
	constitution_date   timestamp with time zone NOT NULL
);


CREATE OR REPLACE FUNCTION customer.legal_person ( 
	IN p_cuit                text,
	IN p_legal_name          text,
	IN p_constitution_date   timestamp with time zone,
	IN p_iibb                text,
	IN p_fantasy_name        text DEFAULT NULL
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
	END IF;
END;
$$ LANGUAGE plpgsql
SET search_path FROM CURRENT;
