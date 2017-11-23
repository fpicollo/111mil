#!/usr/bin/env python3

# Programar un algoritmo recursivo cruzado que determine si un número 
# (distinto de cero) es positivo o es negativo.

def isPositive(number):
	if number > 0:
		return True
	else: 
		isNegative(number)

def isNegative(number):
	if number < 0:
		return False
	else:
		isPositive(number)

number = int(input("Numero: "))

if isPositive(number):
	print("Es positivo")
elif not isPositive(number):
	print("Es negativo")
