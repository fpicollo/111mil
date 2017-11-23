#!/usr/bin/env python3

# Escriba un algoritmo para mostrar por pantalla el nombre del día de acuerdo 
# a un número (del 1 al 7) que se pase como entrada.

import sys

dayNumber = int(input("Ingrese número de día: "))

if dayNumber == 1:
	print("Domingo")
elif dayNumber == 2:
	print("Lunes")
elif dayNumber == 3:
	print("Martes")
elif dayNumber == 4:
	print("Miércoles")
elif dayNumber == 5:
	print("Jueves")
elif dayNumber == 6:
	print("Viernes")
elif dayNumber == 7:
	print("Sábado")
else:
	print("ERROR")
	sys.exit(1)
