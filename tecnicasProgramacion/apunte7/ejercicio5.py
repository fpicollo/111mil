#!/usr/bin/env python3

# Desarrollar un algoritmo que lea números enteros positivos de forma indefinida hasta que se ingrese un cero. 
# Mostrar cual es el mayor.

greatest = 0

while True:
	number = int(input("Número: "))

	if number == 0:
		break
	elif number > greatest:
		greatest = number

print("El mayor número ingresado es: " + str(greatest))
