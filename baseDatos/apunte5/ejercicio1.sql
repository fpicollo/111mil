-- Crear una vista que concentre la siguiente información:
--     * ID de propiedad.
--     * Precio.
--     * Nombre y apellido del vendedor.
--     * Región en donde está ubicadada la propiedad. 

CREATE VIEW vw_property AS
	SELECT 
		a.property_id "ID Propiedad", 
		a.price "Precio",
		(b.seller_surname || ' ' || b.seller_name) "Vendedor", 
		c.region_name "Región"
	FROM
		property a
		NATURAL INNER JOIN seller b
		NATURAL INNER JOIN region c
	ORDER BY 2 ASC
;
