#!/usr/bin/env python3

import json

agenda = json.loads(open("outfile.db").read())

print(agenda)

for persona in agenda:
	print(persona["nombre"] + " " + persona["apellido"])
