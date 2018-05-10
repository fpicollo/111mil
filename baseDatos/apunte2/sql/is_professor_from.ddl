
CREATE TABLE is_professor_from (
	professor                     text NOT NULL REFERENCES professor(cuil),
	course                        integer NOT NULL REFERENCES course(code),
	PRIMARY KEY                   (professor, course)
);
