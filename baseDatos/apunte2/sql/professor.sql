
CREATE OR REPLACE FUNCTION professor (
    IN p_dni                   integer,
    IN p_name                  text,
    IN p_surname               text,
    IN p_birthdate             date,
    IN p_address               text,
    IN p_phone                 text,
    IN p_email                 text,
    IN p_cuil                  text,
    IN p_hiring_date           date,
    IN p_salary                double precision
) RETURNS professor AS
$$
  SELECT person(p_dni, p_name, p_surname, p_birthdate, p_address, p_phone, p_email);

  INSERT INTO professor(dni, cuil, hiring_date, salary)
    VALUES(p_dni, p_cuil, p_hiring_date, p_salary)
  RETURNING *;
$$ LANGUAGE sql VOLATILE;


CREATE OR REPLACE FUNCTION professor_get_cuil(
  IN p_professor               professor
) RETURNS text AS
$$
  SELECT cuil(p_professor);
$$ LANGUAGE sql IMMUTABLE STRICT;


CREATE OR REPLACE FUNCTION professor_get_hiring_date (
    IN p_professor             professor
) RETURNS date AS
$$
  SELECT hiring_date(p_professor);
$$ LANGUAGE sql IMMUTABLE STRICT;


CREATE OR REPLACE FUNCTION professor_get_salary (
    IN p_professor             professor
) RETURNS double precision AS
$$
  SELECT salary(p_professor);
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION professor_set_salary (
    IN p_professor             professor,
    IN p_new_salary            double precision
) RETURNS void AS
$$
  UPDATE professor p SET salary = p_new_salary
    WHERE p = p_professor;
$$ LANGUAGE sql VOLATILE STRICT;
