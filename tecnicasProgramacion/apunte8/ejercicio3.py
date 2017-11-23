#!/usr/bin/env python3

# Crear una función que reciba tres números enteros y devuelva el valor del mayor de ellos. 
# Por ejemplo, para los números 5, 7 y 5, devolvería el valor 7.

def getMax(number1, number2, number3):
	maximum = number1

	if number2 > maximum:
		maximum = number2
	
	if number3 > maximum:
		maximum = number3
	
	return maximum

number1 = int(input("Número: "))
number2 = int(input("Número: "))
number3 = int(input("Número: "))

print("El máximo es: " + str(getMax(number1, number2, number3)))
