
CREATE OR REPLACE FUNCTION is_professor_from (
    IN p_professor             professor,
    IN p_course                course
) RETURNS is_professor_from AS
$$
  INSERT INTO is_professor_from(professor, course)
    VALUES (professor_get_cuil(p_professor), course_get_code(p_course))
  RETURNING *;
$$ LANGUAGE sql VOLATILE STRICT;


CREATE OR REPLACE FUNCTION is_professor_from_destroy(
  IN p_is_professor_from       is_professor_from
) RETURNS void AS
$$
  DELETE FROM is_professor_from ipf WHERE ipf = p_is_professor_from;
$$ LANGUAGE sql VOLATILE STRICT;
