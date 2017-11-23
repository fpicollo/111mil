#!/usr/bin/env python3

# Crear una función que reciba un número y lo devuelva elevado al cubo. 

pow3 = lambda number: number * number * number

number1 = int(input("Número: "))

print(str(number1) + " al cubo: " + str(pow3(number1)))
