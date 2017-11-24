#!/usr/bin/env python3

# Desarrollar un algoritmo que lea 5 números por teclado y los guarde en un vector, los copie a otro 
# vector multiplicados por 2 y muestre el segundo vector.

vector1 = []
for i in range(5):
	vector1.append(int(input("Número: ")))


vector2 = []
for i in range(5):
	vector2.append(vector1[i] * 2)

for i in range(5):
	print(vector2[i])

print("Largo vector1: " + str(len(vector1)))

del vector1[4]

print("Largo vector1: " + str(len(vector1)))

for i in range(4):
	print(vector1[i])
