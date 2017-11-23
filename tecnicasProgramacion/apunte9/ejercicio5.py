#!/usr/bin/env python3

# Programar un algoritmo recursivo que calcule un número de la serie fibonacci.

def fibonacci(number):
	if number == 0 or number == 1:
		return number
	else:
		return fibonacci(number - 1 ) + fibonacci(number - 2)
	
number = int(input("Número: " ))

print("Fibonacci: " + str(fibonacci(number)))
