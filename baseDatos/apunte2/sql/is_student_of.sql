
CREATE OR REPLACE FUNCTION is_student_of(
    IN p_student               student,
    IN p_course                course
) RETURNS is_student_of AS
$$
  INSERT INTO is_student_of(student, course)
    VALUES (student_get_cuil(p_student), course_get_code(p_course))
  RETURNING *;
$$ LANGUAGE sql VOLATILE STRICT;


CREATE OR REPLACE FUNCTION is_student_of_destroy(
  IN p_is_student_of       is_student_of
) RETURNS void AS
$$
  DELETE FROM is_student_of iso WHERE iso = p_is_student_of;
$$ LANGUAGE sql VOLATILE STRICT;
