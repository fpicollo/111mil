.PHONY: clean instituto.sql drop

all: instituto.sql

instituto.sql:
	touch instituto.sql
	cat setup.sql >> instituto.sql
	cat person.ddl >> instituto.sql
	cat contact_information.ddl >> instituto.sql
	cat professor.ddl >> instituto.sql
	cat student.ddl >> instituto.sql
	cat course.ddl >> instituto.sql
	cat is_professor_from.ddl >> instituto.sql
	cat is_student_of.ddl >> instituto.sql

deploy: 
	psql postgres < instituto.sql

drop:
	psql -c "DROP DATABASE IF EXISTS instituto;" postgres

clean:
	$(RM) instituto.sql
