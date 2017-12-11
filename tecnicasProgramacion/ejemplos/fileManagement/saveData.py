#!/usr/bin/env python3

from json import dump

agenda = []

for i in range(3):
	persona = {}

	persona["nombre"] = input("Nombre: ")
	persona["apellido"] = input("Apellido: ")

	agenda.append(persona)

with open("outfile.json", "w") as fout:
	dump(agenda, fout)
