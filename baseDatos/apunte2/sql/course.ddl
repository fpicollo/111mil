
CREATE TABLE course (
	code                          serial PRIMARY KEY,
	name                          text NOT NULL UNIQUE,
	description                   text NOT NULL,
	price                         double precision NOT NULL DEFAULT 0 CHECK (price >= 0)
);
