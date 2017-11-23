#!/usr/bin/env python3

# Dados tres números enteros distintos escriba un algoritmo para escribirlos
# ordenadamente de menor a mayor. 

number1 = int(input("Ingrese un número: "))
maximum = number1
minimum = number1

number2 = int(input("Ingrese un número: "))
if number2 > maximum:
	maximum = number2
else:
	minimum = number2

number3 = int(input("Ingrese un número: "))
if number3 > maximum:
	maximum = number3
elif number3 < minimum:
	minimum = number3

if number1 != maximum and number1 != minimum:
	middle = number1
elif number2 != maximum and number2 != minimum:
	middle = number2
else:
	middle = number3

print(str(maximum) + " " + str(middle) + " " + str(minimum))
