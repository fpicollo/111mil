#!/usr/bin/env python3

from json import loads

agenda = loads(open("outfile.json").read())

print(agenda)

for persona in agenda:
	print(persona["nombre"] + " " + persona["apellido"])
