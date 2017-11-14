-- Determinar cuál es el vendedor que menos ganancias ha generado.

SELECT 
	b.seller_name "Apellido",
	b.seller_surname "Nombre",
	b.seller_dni "DNI",
	sum(price) "Ganancias Acumuladas"
FROM
	property a
	NATURAL INNER JOIN seller b
WHERE 
	selling_timestamp IS NOT NULL
GROUP BY 1, 2, 3
ORDER BY 4 ASC
LIMIT 1;