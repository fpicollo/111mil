#!/usr/bin/env python3

import json

agenda = []

for i in range(3):
	persona = {}

	persona["nombre"] = input("Nombre: ")
	persona["apellido"] = input("Apellido: ")

	agenda.append(persona)

with open ("outfile.db", "w") as fout:
	json.dump(agenda, fout)
