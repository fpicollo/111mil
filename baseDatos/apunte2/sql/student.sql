
CREATE OR REPLACE FUNCTION student (
    IN p_dni                   integer,
    IN p_name                  text,
    IN p_surname               text,
    IN p_birthdate             date,
    IN p_address               text,
    IN p_phone                 text,
    IN p_email                 text,
    IN p_inscription_date      date
) RETURNS student AS
$$
  SELECT person(p_dni, p_name, p_surname, p_birthdate, p_address, p_phone, p_email);

  INSERT INTO student(dni, inscription_date)
    VALUES(p_dni,  p_inscription_date)
  RETURNING *;
$$ LANGUAGE sql VOLATILE;


CREATE OR REPLACE FUNCTION student_get_inscription_date(
    IN p_student               student
) RETURNS date AS
$$
  SELECT inscription_date(p_student);
$$ LANGUAGE sql IMMUTABLE STRICT;


CREATE OR REPLACE FUNCTION student_get_file_number (
  IN p_student                 student
) RETURNS integer AS
$$
  SELECT file_number(p_student);
$$ LANGUAGE sql IMMUTABLE STRICT;


CREATE OR REPLACE FUNCTION student_get_bill (
  IN p_student                 student
) RETURNS double precision AS
$$
  SELECT
    sum(c.price)
  FROM
    student s
    INNER JOIN is_student_of iso ON iso.student = s.file_number
    INNER JOIN course c ON c.code = iso.course
  WHERE
    s = p_student;
$$ LANGUAGE sql STABLE STRICT;
