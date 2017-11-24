#!/usr/bin/env python3

# Desarrollar una calculadora que realice suma, resta, multiplicación, división y potencia. Repetir hasta que el usuario
# decida salir. Utilizar funciones.

from functionLibrary6 import *
from os import system

while True: 
	result = 0
	system("clear")
	
	number1 = float(input("Número: " ))
	
	operation = ""
	while operation not in ["s", "r", "m", "d", "p"]:
		operation = input("Operación (s, r, m, d, p): ")
	
	number2 = float(input("Número: " ))
	
	if operation == "s":
		result = add(number1, number2)
	elif operation == "r":
		result = substract(number1, number2)
	elif operation == "m":
		result = multiply(number1, number2)
	elif operation == "d":
		result = divide(number1, number2)
	elif operation == "p":
		result = pow(number1, number2)
	else:
		print("Opción incorrecta")

	print()
	print("Resultado: " + str(result))
	print()
	
	repeat = ""
	while repeat != "s" and repeat !="n":
		repeat = input("Realizar otro cálculo? (s/n): ")
	
	if repeat == "n":
		break
