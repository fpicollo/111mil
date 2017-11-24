#!/usr/bin/env python3

# En la consola, cada carácter es exactamente el doble de alto que de ancho.  
# Desarrollar un programa que genere cuadrados donde el usuario deba ingresar la base. Ejemplo:

# XXXXXXXXXXX
# XXXXXXXXXXX
# XXXXXXXXXXX
# XXXXXXXXXXX
# XXXXXXXXXXX

# Verificar que el dato ingresado sea mayor a cero y múltiplo de 2.

from os import system

while True:
	side = int(input("Lado: "))

	if side > 0 and side % 2 == 0:
		break

line = ""

for i in range(side):
	line += "X"

system("clear")

print()

for i in range(int(side / 2)):
	print(line)

print()
