#!/usr/bin/env python3

# Crear una función que reciba un número entero y devuelva la lista de divisores, por ejemplo, 
# para el número 16, sus divisores son 1, 2, 4, 8, 16 (utilizar módulo). 

def getDividers(number):
	dividers = []

	for i in range(1, number + 1):
		if number % i == 0:
			dividers.append(i)
	
	return dividers

number1 = int(input("Número: "))

dividers1 = getDividers(number1)

# Iterando la lista por posición
for i in range(len(dividers1)):
	print(str(dividers1[i]))

# Iterando la lista por elemento
for i in dividers1:
	print(str(i))

# Simplemente imprimir la lista
print(dividers1)
