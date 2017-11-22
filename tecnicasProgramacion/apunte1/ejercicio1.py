#!/usr/bin/env python3

# Desarrollar un software que le solicite al usuario que ingrese el nombre de 
# su barrio, la dirección postal de la comisaría más cercana, y las entrecalles. 
# Luego mostrar un mensaje por pantalla similar a “La comisaría de Banfield se 
# encuentra en la calle Maipú 133 entre Alsina y Belgrano”. 

city = input("Barrio: ")
address = input("Dirección: ")
street1 = input("Entrecalle 1: ")
street2 = input("Entrecalle 2: ")

text = "La comisaría de " + city + " está en " + address \
	+ " entre " + street1 + " y " + street2

print(text)
