#!/usr/bin/env python3

# Desarrollar un programa que solicite el ingreso de cuatro números. 
# Determinar si el primero y el segundo son iguales, o el tercero y 
# el cuarto son iguales.

number1 = int(input("Ingrese un número: "))
number2 = int(input("Ingrese un número: "))
number3 = int(input("Ingrese un número: "))
number4 = int(input("Ingrese un número: "))

if number1 == number2 or number3 == number4:
	print("Hay coincidencia")
