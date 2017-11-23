#!/usr/bin/env python3

# Desarrollar un programa que le solicite al usuario que ingrese un número entero. 
# Determinar si el número ingresado es múltiplo de 2 o no (utilizar el operador de 
# módulo).

number = int(input("Ingrese un numero: "))

if number % 2 == 0:
	print("Es par")
else:
	print("Es impar")
