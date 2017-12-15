#!/usr/bin/env python3

import tkinter as tk

mainForm = tk.Tk()
mainForm.geometry("400x200")
mainForm.title("Ejemplo Menú")

# Menú principal, es un metamenu. Solo sirve para contener los submenús
mainMenu = tk.Menu(mainForm)

# Submenú de archivo
fileMenu = tk.Menu(mainMenu, tearoff = 0)
fileMenu.add_command(label = "Salir", command = quit) # le agrego un comando al menu (comando para salir)
mainMenu.add_cascade(label = "Archivo", menu = fileMenu)

personMenu = tk.Menu(mainMenu, tearoff = 0)
personMenu.add_command(label = "Agregar Persona")
personMenu.add_separator()
personMenu.add_command(label = "Mostrar Persona")
mainMenu.add_cascade(label = "Persona", menu = personMenu)


# Le digo a mainForm que su menu va a ser mainMenu
mainForm.config(menu = mainMenu)

mainForm.mainloop()
