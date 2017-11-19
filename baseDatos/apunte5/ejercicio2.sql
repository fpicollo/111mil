-- Crear una vista que facilite informar todas las propiedades han sido vendidas. Considerar: 
--     * ID de propiedad.
--     *  Tipo de propiedad.
--     *  Precio.
--     *  Fecha de registro en el sistema.
--     *  Fecha de venta.
--     *  Vendedor.
--     *  Intervalo de tiempo entre el registro en el sistema y la venta.
--     *  Ordenar por el intervalo de tiempo de forma descendente.

CREATE VIEW vw_selling_report AS
	SELECT
		a.property_id "ID Propiedad",
		d.property_type_name "Tipo de Propiedad",
		a.price "Precio",
		a.creation_timestamp "Fecha de Ingreso",
		a.selling_timestamp "Fecha de Venta",
		concat(b.seller_surname,' ',b.seller_name) "Vendedor",
		date_part('day', a.selling_timestamp - a.creation_timestamp) "Período de Venta en Días"
	FROM
		property a
		natural inner join seller b
		natural inner join property_type d
	WHERE
		operation ='Venta'
	ORDER BY 7 DESC
;



-- Crear una consulta que determine cuál es el tipo de propiedad más fácil de vender.

SELECT  
	"Tipo de Propiedad",
	round(avg("Período de Venta en Días"))
FROM
	vw_selling_report
GROUP BY 1
ORDER BY 2 ASC
LIMIT 1; 
