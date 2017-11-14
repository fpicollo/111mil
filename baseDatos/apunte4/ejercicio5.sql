-- Determinar la sumatoria de los precios de todas las propiedades que están en venta y aún no han sido vendidas.

SELECT 
	sum(price)
FROM
	property
WHERE 
	operation = 'Venta'
	AND selling_timestamp IS NULL;