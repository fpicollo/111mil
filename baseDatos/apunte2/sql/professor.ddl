
CREATE TABLE professor (
	dni                           integer PRIMARY KEY REFERENCES person(dni),
	cuil                          text NOT NULL UNIQUE,
	hiring_date                   date NOT NULL DEFAULT now(),
	salary                        double precision NOT NULL DEFAULT 0 CHECK (salary >= 0)
);
