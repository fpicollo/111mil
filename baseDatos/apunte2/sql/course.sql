
CREATE OR REPLACE FUNCTION course (
  IN p_name                    text,
  IN p_description             text,
  IN p_price                   double precision
) RETURNS course AS
$$
  INSERT INTO course(name, description, price)
    VALUES(p_name, p_description, p_price)
  RETURNING *;
$$ LANGUAGE sql VOLATILE STRICT;


CREATE OR REPLACE FUNCTION course_get_code (
  IN p_course                  course
) RETURNS integer AS
$$
  SELECT code(p_course);
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION course_get_name (
  IN p_course                  course
) RETURNS text AS
$$
  SELECT name(p_course);
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION course_get_description (
  IN p_course                  course
) RETURNS text AS
$$
  SELECT description(p_course);
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION course_get_price (
  IN p_course                  course
) RETURNS double precision AS
$$
  SELECT price(p_course);
$$ LANGUAGE sql STABLE STRICT;


CREATE OR REPLACE FUNCTION course_set_name (
  IN p_course                  course,
  IN p_name                    text
) RETURNS void AS
$$
  UPDATE course c SET name = p_name
    WHERE c = p_course;
$$ LANGUAGE sql VOLATILE STRICT;


CREATE OR REPLACE FUNCTION course_set_description (
  IN p_course                  course,
  IN p_description             text
) RETURNS void AS
$$
  UPDATE course c SET description = p_description
    WHERE c = p_course;
$$ LANGUAGE sql VOLATILE STRICT;


CREATE OR REPLACE FUNCTION course_set_price (
  IN p_course                  course,
  IN p_price                   double precision
) RETURNS void AS
$$
  UPDATE course c SET price = p_price
    WHERE c = p_course;
$$ LANGUAGE sql VOLATILE STRICT;
