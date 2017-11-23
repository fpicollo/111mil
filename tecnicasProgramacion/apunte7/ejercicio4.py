#!/usr/bin/env python3

# Desarrollar un algoritmo que lea números de forma indefinida hasta que se ingrese un cero.
# Mostrar la suma de todos los números ingresados.

summation = 0

while True:
	number = int(input("Número: "))

	if number == 0:
		break
	
	summation += number

print("La suma es: " + str(summation))
