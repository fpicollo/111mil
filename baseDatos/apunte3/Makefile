.phony: clean

JC = javac
JFLAGS = -cp
CLASSPATH = .

all: jdbcExample.class

jdbcExample.class: jdbcExample.java
	$(JC) $(JFLAGS) $(CLASSPATH) jdbcExample.java

clean:
	$(RM) jdbcExample.class
