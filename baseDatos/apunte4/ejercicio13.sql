-- Determinar cuál es la propiedad más cara de Lleida en venta.

SELECT
	b.region_name "Región",
	a.property_id "ID Propiedad",
	a.price "Precio"
FROM
	property a
	NATURAL INNER JOIN region b
WHERE 
	b.region_name = 'Lleida'
	and a.operation = 'Venta'
	AND a.selling_timestamp IS  NULL
ORDER BY 3 DESC
LIMIT 1;