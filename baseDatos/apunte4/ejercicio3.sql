-- Determinar el promedio de superficie de las propiedades.

SELECT 
	round(avg(surface)::numeric, 2)
FROM
	property;