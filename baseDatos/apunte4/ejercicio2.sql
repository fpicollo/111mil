-- Determinar cuál es la propiedad de menor superficie.

SELECT 
	property_id,
	surface
FROM 
	property
WHERE
	surface = (SELECT min(surface) FROM property)
ORDER BY 1 ASC;