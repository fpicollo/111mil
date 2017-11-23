#!/usr/bin/env python3

# Desarrollar un algoritmo que genere la siguiente imagen:

# X
# XX
# XXX
# XXXX
# XXXXX
# XXXX
# XXX
# XX
# X

SIZE = 5
line = ""

print()

for i in range(SIZE):
	line += "X"
	print(line)

for i in range(SIZE -1, 0, -1):
	line = ""

	for j in range(i):
		line += "X"
	
	print(line)

print()
