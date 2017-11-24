#!/usr/bin/env python3

# Desarrollar un software que reciba como entrada una letra que corresponda a 
# un número romano y encontrar su valor en números decimales, en caso contrario 
# mostrar un mensaje de error que diga que no es un número romano válido.

import sys 

while True:
	character = input("Caracter: ")

	if len(character) == 1:
		break

if character == "I":
	print("1")
elif character == "V":
	print("5")
elif character == "X":
	print("10")
elif character == "L":
	print("50")
elif character == "C": 
	print("100")
elif character == "D":
	print("500")
elif character == "M": 
	print("1000")
else:
	print("ERROR")
	sys.exit(1)
