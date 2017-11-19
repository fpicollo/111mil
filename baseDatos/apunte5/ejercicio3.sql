-- Crear una vista que concentre la siguiente información:
--     * Nombre y apellido del vendedor 
--     * Región.
--     * Cantidad de propiedades.
--     * Precio promedio de las propiedades por región y por vendedor.

CREATE VIEW vw_region_report AS
	SELECT
		concat(b.seller_surname,' ', b.seller_name) "Vendedor",
		c.region_name "Región",
		count(a.property_id) "Cantidad de Propiedades",
		round(avg(a.price::numeric))::money "Precio Promedio"
	FROM
		property a
		natural inner join seller b
		natural inner join region c
		natural inner join property_type d
	GROUP BY 1, 2
	ORDER BY 1 ASC, 3 DESC
;
