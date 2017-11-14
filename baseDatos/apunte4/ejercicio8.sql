-- Determinar cuál es el vendedor que menos propiedades ha vendido.

SELECT 
	b.seller_name "Apellido",
	b.seller_surname "Nombre",
	b.seller_dni "DNI",
	count(1) "Cant. Propiedades Vendidas"
FROM
	property a
	NATURAL INNER JOIN seller b
WHERE 
	a.operation = 'Venta'
	AND selling_timestamp IS NOT NULL
GROUP BY 1, 2, 3
ORDER BY 4 ASC
LIMIT 1;