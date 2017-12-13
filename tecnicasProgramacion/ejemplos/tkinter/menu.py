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

# Al "metamenu" principal le agrego en cascada el submenu de archivo
mainMenu.add_cascade(label = "Archivo", menu = fileMenu)

# Le digo a mainForm que su menu va a ser mainMenu
mainForm.config(menu = mainMenu)

mainForm.mainloop()
