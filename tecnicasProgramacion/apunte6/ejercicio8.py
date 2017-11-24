#!/usr/bin/env python3

# Desarrollar un algoritmo que genere rectángulos similares a la siguiente imagen:

# XXXXXXXXXX
# XXXXXXXXXX
# XXXXXXXXXX
# XXXXXXXXXX

# Donde el usuario deba ingresar la base y la altura. Verificar que dichos datos sean mayores a cero.

from os import system

base = int(input("Base: "))

line = ""
for i in range(base):
	line += "X"

height = int(input("Altura: "))

system("clear")

print()

for i in range(height):
	print(line)

print()
