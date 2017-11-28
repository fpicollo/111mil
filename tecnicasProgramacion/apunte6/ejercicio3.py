#!/usr/bin/env python3

# Desarrollar un algoritmo que muestre la tabla de multiplicar de un número dado.

from os import system

number = int(input("\nNúmero: "))

system("clear")

print("Tabla del: " + str(number))
print("===== ===")
print()

for i in range(1, 10):
	print(str(number) + " x " + str(i) + " = " + str(number * i))

print()
