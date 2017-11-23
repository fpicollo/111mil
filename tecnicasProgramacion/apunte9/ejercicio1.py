#!/usr/bin/env python3

# Escribir una función recursiva que devuelva la suma de los primeros N enteros positivos

def recursiveAdder(number):
	if number == 0:
		return number
	else:
		return number + recursiveAdder(number - 1)

while True:
	number = int(input("Número: "))
	if number > 0: 
		break

print(recursiveAdder(number))
