#!/usr/bin/env python3

# Crear un programa que pida dos número enteros al usuario y diga si alguno de ellos es múltiplo del otro. 
# Desarrollar una función que ayude a que el proceso principal sea legible.

def areMultiples(number1, number2):
	if number1 % number2 == 0 or number2 % number1 == 0:
		return True
	else:
		return False

number1 = int(input("Número: "))
number2 = int(input("Número: "))

if areMultiples(number1, number2):
	print("Son múltiplos")
else:
	print("No son múltiplos")
