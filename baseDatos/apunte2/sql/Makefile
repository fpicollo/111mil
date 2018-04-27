.PHONY: clean instituto.sql drop populate

all: instituto.sql

instituto.sql:
	# SETUP
	touch instituto.sql
	cat setup.sql >> instituto.sql
	
	# CREACION DE TABLAS
	cat person.ddl >> instituto.sql
	cat contact_information.ddl >> instituto.sql
	cat professor.ddl >> instituto.sql
	cat student.ddl >> instituto.sql
	cat course.ddl >> instituto.sql
	cat is_professor_from.ddl >> instituto.sql
	cat is_student_of.ddl >> instituto.sql
	
	# METODOS
	cat contact_information.sql >> instituto.sql
	cat person.sql >> instituto.sql
deploy: 
	psql postgres < instituto.sql

populate:
	psql instituto < sample_data.sql

drop:
	psql -c "DROP DATABASE IF EXISTS instituto;" postgres

clean:
	$(RM) instituto.sql
