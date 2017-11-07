-- Crear una solución para almacenar datos de automotores. Se deben tener en cuenta:
-- 
-- * Patente.
-- * Marca.
-- * Modelo.
-- * Cilindrada del motor.
-- * Tipo (Sedán o Coupe).
-- 
-- Cargar 20 registros. Escribir una consulta que me muestre las patentes de todos los vehículos 
-- cuya cilindrada sea superior a 1200cc.

CREATE TABLE vehicle (
	patent              text,
	vendor              text,
	model               text,
	motor_size          integer,
	kind                text
); 

INSERT INTO vehicle VALUES
	('AAA 111', 'Ford', 'Focus', '1600', 'Sedán'),
	('AAA 112', 'Ford', 'Fiesta', '1600', 'Sedán'),
	('AAA 112', 'Ford', 'Mondeo', '2000', 'Sedán'),
	('AAA 113', 'Ford', 'Ka', '1000', 'Coupé'),
	('AAA 114', 'Ford', 'Falcon', '2200', 'Sedán'),
	('AAJ 111', 'Ford', 'Orion', '1800', 'Sedán'),
	('ABA 111', 'Chevrolet', 'Corsa', '1200', 'Coupe'),
	('AAA 121', 'Renault', 'Megane', '1300', 'Sedán'),
	('ABB 101', 'Renault', 'Clio', '1600', 'Sedán'),
	('CWW 141', 'Citroën', 'C3', '1600', 'Sedán'),
	('IGJ 211', 'Citroën', 'Picasso', '1600', 'Sedán'),
	('ASA 999', 'Citroën', 'C4', '1800', 'Sedán'),
	('AIG 171', 'Fiat', 'Uno', '1600', 'Coupe'),
	('PWD 111', 'Fiat', 'Cubo', '1400', 'Sedán'),
	('FGG 111', 'Fiat', 'Argo', '1600', 'Sedán'),
	('AAA 125', 'Fiat', 'Mobi', '1300', 'Sedán'),
	('XDD 987', 'Fiat', 'Fiorino', '1300', 'Sedán'),
	('AAA 834', 'Fiat', 'Linea', '1800', 'Sedán'),
	('AXC 134', 'Fiat', 'Siena', '1600', 'Sedán'),
	('AAA 111', 'Fiat', 'Punto', '1800', 'Sedán');
	
SELECT
	patent
FROM 
	vehicle
WHERE 
	motor_size > 1200;
