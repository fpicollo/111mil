#!/usr/bin/env python3

# Programar un algoritmo recursivo que calcule el máximo común divisor de dos números (método Euclidiano). 

def greatestCommonDivisor(number1, number2):
	if number1 < number2:
		greatestCommonDivisor(number2, number1)
	elif number2 == 0:
		return number1
	else:
		return greatestCommonDivisor(number2, (number1 % number2))
	
number1 = int(input("Número1: "))
number2 = int(input("Número2: "))

print("Máximo común divisor: " + str(greatestCommonDivisor(number1, number2)))
