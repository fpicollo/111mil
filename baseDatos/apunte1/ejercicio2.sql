-- Crear una solución para almacenar información de productos. Se debe tener en cuenta:
-- 
-- * Código.
-- * Rubro.
-- * Nombre del producto.
-- * Descripción.
-- * Unidad de medida.
-- * Precio unitario.
-- 
-- Cargar 20 registros. Escribir una consulta que me muestre los registros completos de todos los productos del rubro “almacen” 
-- cuyo precio sea inferior a $100.

CREATE TABLE product (
	code                integer,
	product_family      text,
	name                text,
	description         text,
	masurement_unit     text,
	unitary_price       double precision
);

INSERT INTO product VALUES
	(1, 'Almacen', 'Fideos', 'Pastas', 'kg', 25),
	(2, 'Almacen', 'Capeletis', 'Pastas', 'kg', 50.33),
	(3, 'Almacen', 'Ravioles', 'Pastas', 'kg', 42.10),
	(4, 'Almacen', 'Salame', 'Fiambre', 'kg', 235),
	(5, 'Almacen', 'Jamon Cocido', 'Fiambre', 'kg', 250.33),
	(6, 'Almacen', 'Jamon Crudo', 'Fiambre', 'kg', 390.65),
	(7, 'Almacen', 'Queso Maquina', 'Fiambre', 'kg', 250.20),
	(8, 'Limpieza', 'Detergente', 'Detergente líquido', 'lt', 25),
	(9, 'Limpieza', 'Lavandina', 'Agua Lavandina', 'lt', 17),
	(10, 'Limpieza', 'Jabon en Polvo', 'Jabon para lavar la ropa', 'kg', 75),
	(11, 'Lipieza', 'Desengrasante Horno', 'Desengrasante', 'lt', 80),
	(12, 'Limpieza', 'Esponja', 'Esponja Lava vajilla', 'unidad', 52),
	(13, 'Perfumeria', 'Desodorante', 'Desodorante Hombre', 'unidad', 80),
	(14, 'Perfumeria', 'Colinia', 'Perfume', 'lt', 2500),
	(15, 'Perfumeria', 'Pasta Dentifrica', 'Pasta dental', 'unidad', 35.50),
	(16, 'Perfumeria', 'Talco', 'talco', 'unidad', 59),
	(17, 'Verduleria', 'Esparragos', 'Esparragos', 'kg', 25),
	(18, 'Verduleria', 'Tomates', 'tomate peritia', 'kg', 35),
	(19, 'Verduleria', 'Lechuga', 'Lechga mantecosa', 'kg', 25),
	(20, 'Conservas', 'Arvejas', 'Arvejas Lata', 'unidad', 43.20);
	
SELECT 
	*
FROM 
	product
WHERE 
	product_family = 'Almacen'
	and unitary_price < 100;
