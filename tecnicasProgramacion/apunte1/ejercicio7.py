#!/usr/bin/env python3

# Desarrollar un software que le solicite al usuario el ingreso de 2 números 
# y le muestre al usuario el resultado de la división de esos números.

number1 = int(input("Ingrese un número: "))
number2 = int(input("Ingrese un número: "))

if number2 != 0:
	result = str(number1 / number2)
	print("El resultado de la división es: " + result)
else:
	print("No se puede dividir por 0")
