-- Determinar cuál es la propiedad en venta de mayor valor a cargo del vendedor Pedro Iriarte.

SELECT 
	property_id,
	price
FROM
	property a
	NATURAL INNER JOIN seller b
WHERE 
	a.operation = 'Venta'
	AND b.seller_name = 'Pedro'
	AND b.seller_surname = 'Iriarte'
ORDER BY price DESC
LIMIT 1;