#!/usr/bin/env python3

import tkinter as tk
from tkinter import messagebox as mb

def otroFormulario(persona):
	def guardarDatos(nombre, edad, persona):
		persona["nombre"] = nombre
		persona["edad"] = int(edad)

		anotherForm.destroy()

	anotherForm = tk.Toplevel(mainForm)
	anotherForm.geometry("300x100")
	anotherForm.title("Este es otro formulario")
	
	nombreLabel = tk.Label(anotherForm, text = "Nombre:")
	nombreLabel.place(x = 10, y = 10)
	nombreEntry = tk.Entry(anotherForm, width = 20)
	nombreEntry.place(x = 10, y = 30)

	edadLabel = tk.Label(anotherForm, text = "Edad:")
	edadLabel.place (x = 10, y = 55)
	edadEntry = tk.Entry(anotherForm, width = 5)
	edadEntry.place(x = 10, y = 75)

	miBoton = tk.Button(anotherForm, text = "Tomar Datos", command = \
	  lambda: guardarDatos(nombreEntry.get(), edadEntry.get(), persona))
	miBoton.place(x = 150, y = 70)

persona = {}

mainForm = tk.Tk()
mainForm.geometry("300x100")
mainForm.title("Ejemplo Otro Formulario")

button = tk.Button(mainForm, text = "Abrir otro formulario", command = lambda: otroFormulario(persona))
button.place(x = 10, y = 10)

button2 = tk.Button(mainForm, text = "Mostrar los datos", command = lambda: print(persona))
button2.place(x = 10, y = 40)

mainForm.mainloop()
