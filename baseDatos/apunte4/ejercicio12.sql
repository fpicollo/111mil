-- Determinar cuál es el vendedor que más ventas realizó en la zona de Barcelona.

SELECT 
	b.seller_name "Nombre",
	b.seller_surname "Apellido",
	b.seller_dni "DNI",
	c.region_name "Región",
	count(1) "Cantidad de Ventas"
FROM
	property a
	NATURAL INNER JOIN seller b
	NATURAL INNER JOIN region c
WHERE 
	c.region_name = 'Barcelona'
	and a.operation = 'Venta'
	AND a.selling_timestamp IS NOT NULL
GROUP BY 1, 2, 3, 4
ORDER BY 5 DESC
LIMIT 1;