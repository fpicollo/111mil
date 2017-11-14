-- Determinar cuál es la propiedad de mayor superficie.
SELECT 
	property_id,
	surface
FROM 
	property
WHERE
	surface = (SELECT max(surface) FROM property)
ORDER BY 1 ASC;