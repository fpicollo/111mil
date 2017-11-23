#!/usr/bin/env python3

# Crear una función que devuelva el valor lógico "verdadero" o "falso" según si el número que se indique como 
# parámetro es par o no lo es.

def isEven(number):
	if number % 2 == 0:
		return True
	else:
		return False

number = int(input("Número: "))

if isEven(number):
	print("Par")
else:
	print("Impar")
