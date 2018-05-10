
CREATE TABLE professor (
	dni                           integer UNIQUE REFERENCES person(dni),
	cuil                          text PRIMARY KEY,
	hiring_date                   date NOT NULL DEFAULT now(),
	salary                        double precision NOT NULL DEFAULT 0 CHECK (salary >= 0)
);
