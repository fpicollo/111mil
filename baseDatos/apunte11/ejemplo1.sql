CREATE TABLE  persona (
	dni         integer,
    nombre      text
);

CREATE OR REPLACE FUNCTION trg_alta_persona()
RETURNS TRIGGER AS $$
BEGIN
	RAISE NOTICE 'agregamos a %, cuyo dni es %', NEW.nombre, NEW.dni;
    
    RETURN NEW;
END;
$$ LANGUAGE PLpgSQL;
CREATE TRIGGER trg_alta_persona AFTER INSERT ON persona FOR EACH ROW EXECUTE PROCEDURE trg_alta_persona();

CREATE OR REPLACE FUNCTION trg_baja_persona()
RETURNS TRIGGER AS $$
BEGIN
	raise notice 'eliminamos a %, cuyo dni era %', OLD.nombre, OLD.dni;
    
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_baja_persona AFTER DELETE ON persona FOR EACH ROW EXECUTE PROCEDURE trg_baja_persona();
