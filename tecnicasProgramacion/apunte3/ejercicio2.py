#!/usr/bin/env python3

# Desarrollar un programa que le solicite al operador que ingrese su nombre 
# y contraseña. Las personas autorizadas a utilizarlo son Juan (identificado 
# con la contraseña 1234) y Pedro (identificado con la contraseña 5678). Si el 
# operador es un usuario autorizado, saludarlo por su nombre, sino, salir del 
# programa mostrando un mensaje de error.

from sys import exit 

userName = input("Ingrese nombre de usuario: ")
userPassword = input("Ingrese contraseña: ")

if (userName == "Juan" and userPassword == "1234") or \
  (userName == "Pedro" and userPassword == "5678"):
	print("Hola " + userName)
else:
	print("ERROR")
	exit(1)
