#!/usr/bin/env python3

# Desarrollar un programa que cargue un vector con números aleatorios y ordenarlo utilizando bubble sort. 
# Comparar diferencias de rendimiento para vectores de 10, 100, 1000, y 10000 posiciones. Resolver en BASH y en Python.

import time
from random import randint

vector = []

_SIZE = int(input("Tamaño del vector: "))

for i in range(_SIZE):
	vector.append(randint(0, _SIZE))


for i in range(_SIZE):
	print(vector[i])
input("Vector desordenado (" + str(_SIZE) + " posiciones)...")

starting_point = time.time()

for i in range(_SIZE - 1):
	for j in range(i + 1, _SIZE):
		if vector[i] > vector[j]:
			auxiliary = vector[j]
			vector[j] = vector[i]
			vector[i] = auxiliary

elapsed_time = int(time.time() - starting_point)


for i in range(_SIZE):
	print(vector[i])
input("Vector ordenado, demoró " + str(elapsed_time) + " segundos...")
