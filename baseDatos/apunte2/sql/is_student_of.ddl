
CREATE TABLE is_student_of (
	student                       integer NOT NULL REFERENCES student(dni),
	course                        integer NOT NULL REFERENCES course(code),
	PRIMARY KEY                   (student, course)
);
