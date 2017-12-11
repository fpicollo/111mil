#!/usr/bin/env python3

import tkinter as tk
from tkinter import messagebox as mb
from tkinter import simpledialog as sd

def saludar():
	mb.showinfo("saludar", "Hola!!")

def chau():
	nombre = sd.askstring("Nombre", "Ingrese su nombre:")
	mb.showinfo("Saludar", nombre)

mainForm = tk.Tk()
mainForm.title("Primer Programa TKINTER")
mainForm.geometry("400x200")

button = tk.Button(mainForm, text = "HOLA", command = saludar)
button.place(x = 10, y = 10)

button2 = tk.Button(mainForm, text = "CHAU", command = chau)
button2.place(x = 100, y = 10)

label = tk.Label(mainForm, text = "Hola Mundo")
label.place(x = 200, y = 100)

mainForm.mainloop()
