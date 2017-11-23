#!/bin/bash

# Desarrollar un software que reciba como entrada una letra que corresponda a 
# un número romano y encontrar su valor en números decimales, en caso contrario 
# mostrar un mensaje de error que diga que no es un número romano válido.

declare character=""
read -p "Caracter: " character

if [ $character == "I" ]
then
	echo "1"
elif [ $character == "V" ]
then
	echo "5"
elif [ $character == "X" ]
then
	echo "10"
elif [ $character == "L" ]
then 
	echo "50"
elif [ $character == "C" ] 
then
	echo "100"
elif [ $character == "D" ]
then
	echo "500"
elif [ $character == "M" ]
then
	echo "1000"
else
	echo "ERROR"
	exit 1
fi

exit 0
