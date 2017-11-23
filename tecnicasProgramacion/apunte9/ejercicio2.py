#!/usr/bin/env python3

# Escribir un programa que encuentre la suma de los enteros positivos pares desde N hasta 2. 
# Chequear que si N es impar se imprima un mensaje de error. 

def recursiveAdd(number):
	if number == 2:
		return number
	else:
		return number + recursiveAdd( number - 2)

while True:
	number =  int(input("Número par y positivo: "))
	
	if number % 2 == 0 and number > 0:
		break

print(recursiveAdd(number))
