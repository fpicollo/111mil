#!/usr/bin/env python3

# Desarrollar un software que reciba como entrada un carácter cualquiera. 
# Determinar si es una vocal, una consonante o un número.

while True:
	character = input("Ingrese un caracter: ")

	if len(character) == 1:
		break

if character in ["a", "e", "i", "o", "u"]:
	print("Vocal")
elif character in ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]:
	print("Dígito")
else:
	print("Consonante")
