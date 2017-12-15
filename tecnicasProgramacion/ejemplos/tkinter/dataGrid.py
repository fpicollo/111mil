#!/usr/bin/env python3

import tkinter as tk
from tkinter import ttk
from tkinter import messagebox as mb
from tkinter import simpledialog as sd

mainForm = tk.Tk()
mainForm.title("Ejemplo Grid")
mainForm.geometry("310x270")

def cargarDatos():
	persona = {}
	
	persona["apellido"] = sd.askstring("Datos Personales", "Ingrese Apellido")
	persona["nombre"] = sd.askstring("Datos Personales", "Ingrese Nombre")
	persona["telefono"] = sd.askstring("Datos Personales", "Ingrese Teléfono")
	
	agenda.append(persona)
	
	dataGrid.delete(*dataGrid.get_children())
	
	for persona in agenda:
		dataGrid.insert('', 'end', text = persona["apellido"], values=(persona["nombre"], persona["telefono"]))

agenda = []

dataGrid = ttk.Treeview(mainForm)
dataGrid["columns"]=("A", "B")
dataGrid.column("#0", width=100)
dataGrid.heading("#0", text='Apellido')
dataGrid.column("#1", width=100)
dataGrid.heading("#1", text="Nombre")
dataGrid.column("#2", width=100)
dataGrid.heading("#2", text="Teléfono")
dataGrid.place(x = 5, y = 5)

loadButton = tk.Button(mainForm, text = "Cargar Datos", command = cargarDatos)
loadButton.place(x = 100, y = 230)

mainForm.mainloop()
