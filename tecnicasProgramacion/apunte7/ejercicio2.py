#!/usr/bin/env python3

# Desarrollar un algoritmo que solicite al usuario dos números y muestre el resultado de la 
# suma de esos números por pantalla. Repetir esta operación mientras que el usuario así lo disponga.

goOn = "si"

while goOn == "si":
	number1 = int(input("Ingrese un número: "))
	number2 = int(input("Ingrese un número: "))

	print("La suma es: " + str(number1 + number2))

	goOn = input("Continuar? (si/no): ")
