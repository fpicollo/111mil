#!/usr/bin/env python3

# Crear una función que reciba un número entero y devuelva la cantidad de divisores, por ejemplo, 
# para el número 16, sus divisores son 1, 2, 4, 8, 16, por lo que la respuesta debería ser 5 (utilizar módulo). 

def getDividers(number):
	dividers = 0

	for i in range(1, number + 1):
		if number % i == 0:
			dividers += 1
									
	return dividers

number1 = int(input("Número: "))

dividers1 = getDividers(number1)

print(str(number1) + " tiene " + str(dividers1) + " divisores")
