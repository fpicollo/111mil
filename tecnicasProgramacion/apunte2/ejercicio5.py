#!/usr/bin/env python3

# Desarrollar un programa que determine si un usuario es de género masculino y es mayor de edad.

gender = input("Ingrese su género (m/f): ")
age = int(input("Ingrese su edad: "))

if gender == "m" and age >= 18:
	print("Masculino mayor de edad")
