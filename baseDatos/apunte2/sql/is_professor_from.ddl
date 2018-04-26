
CREATE TABLE is_professor_from (
	professor                     integer NOT NULL REFERENCES professor(dni),
	course                        integer NOT NULL REFERENCES course(code),
	PRIMARY KEY                   (professor, course)
);
