PSQL = psql 

.PHONY: agenda.sql clean popular drop 

all: crear

agenda.sql:
	touch agenda.sql
	cat setup.sql >> agenda.sql
	cat contacto.ddl >> agenda.sql
	cat contacto.sql >> agenda.sql


crear: agenda.sql
	$(PSQL) postgres < agenda.sql


popular:
	$(PSQL) agenda < datos_ejemplo.sql


drop:
	$(PSQL) -c "DROP DATABASE IF EXISTS agenda;" postgres


clean: 
	$(RM) agenda.sql
