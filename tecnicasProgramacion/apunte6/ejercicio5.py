#!/usr/bin/env python3

# Desarrollar un algoritmo que imprima la suma de todos los números que van del 1 al 100.

summation = 0

for i in range(1, 101):
	summation += i

print("Sumatoria 1 al 100: " + str(summation))
