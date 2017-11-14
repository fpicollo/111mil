-- Determinar cuál es la región en donde hay más actividad del vendedor Luisa Estevez.

SELECT 
	c.region_name "Región",
	count(1) "Cantidad de Operaciones"
FROM
	property a
	NATURAL INNER JOIN seller b
	NATURAL INNER JOIN region c
WHERE 
	b.seller_name = 'Luisa'
	AND b.seller_surname = 'Estevez'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;