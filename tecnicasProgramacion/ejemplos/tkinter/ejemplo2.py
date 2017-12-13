#!/usr/bin/env python3

import tkinter as tk
from tkinter import simpledialog as sd

def loadData(dictionary, columnas):
	for nombreColumna in columnas: 
		dictionary[nombreColumna] = sd.askstring("Datos Personales", "Ingrese " + nombreColumna)

def showData(dictionary):
	yValue = 90
	
	for clave, valor in dictionary.items():
		label = tk.Label(mainForm, text = clave + ": " + str(valor))
		label.place(x = 10, y = yValue)
		
		yValue += 20

dictionary = {}
columnas = ("Nombre", "Apellido", "DNI", "Edad", "Fecha Nacimiento", "Telefono", "Direccion", "Correo Electronico")

mainForm = tk.Tk()
mainForm.title("Ejercicio 2")
mainForm.geometry("200x300")

loadButton = tk.Button(mainForm, text = "Cargar Datos", command = lambda: loadData(dictionary, columnas))
loadButton.place(x = 10, y = 10)

showButton = tk.Button(mainForm, text = "Mostrar Datos", command = lambda: showData(dictionary))
showButton.place(x = 10, y = 50)

mainForm.mainloop()
