#!/usr/bin/env python3

# Escribir un programa que pida por teclado la base y la altura de un rectángulo. Verificar que tanto
# la base como la altura sean mayores que cero, y en caso contrario, repetir el ingreso de datos hasta 
# que el valor sea correcto. Mostrar el área del rectángulo (base * altura).

base = 0
height = 0

while base <= 0:
	base = int(input("Base: "))

while height <= 0:
	height = int(input("Altura: "))

print("El área del rectangulo es: " + str(base * height))
