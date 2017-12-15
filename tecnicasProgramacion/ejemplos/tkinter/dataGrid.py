#!/usr/bin/env python3

import tkinter as tk
from tkinter import ttk

mainForm = tk.Tk()
mainForm.title("Ejemplo Grid")
mainForm.geometry("310x270")

def borrarDatos():
	dataGrid.delete(*dataGrid.get_children())

def cargarDatos():
	dataGrid.insert('', 'end', text = "Basisty", values=("German", 25969243))

dataGrid = ttk.Treeview(mainForm)
dataGrid["columns"]=("A", "B")
dataGrid.column("#0", width=100)
dataGrid.heading("#0", text='Apellido')
dataGrid.column("#1", width=100)
dataGrid.heading("#1", text="Nombre")
dataGrid.column("#2", width=100)
dataGrid.heading("#2", text="DNI")
dataGrid.place(x = 5, y = 5)

loadButton = tk.Button(mainForm, text = "Cargar Grid", command = cargarDatos)
loadButton.place(x = 10, y = 230)

loadButton = tk.Button(mainForm, text = "Borrar Grid", command = borrarDatos)
loadButton.place(x = 140, y = 230)

mainForm.mainloop()
