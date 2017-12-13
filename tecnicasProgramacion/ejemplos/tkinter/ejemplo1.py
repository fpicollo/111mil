#!/usr/bin/env python3

import tkinter as tk
from tkinter import messagebox as mb
from tkinter import simpledialog as sd

def mensajes():
	mb.showinfo("showinfo", "Ejemplo Show Info")
	mb.showerror("showerror", "Ejemplo Show Error")
	mb.showwarning("showwarning", "Ejemplo Show Warning")

def siNo():
	respuesta = mb.askokcancel("Ejemplo askokcancel","¿Desea Continuar?")
	mb.showinfo("Resultado de la respuesta", str(respuesta))
	
	respuesta = mb.askretrycancel("Ejemplo askretrycancel", "¿Desea volver a intentarlo?")
	mb.showinfo("Resultado de la respuesta", str(respuesta))
	
	respuesta = mb.askyesno("Ejemplo askyesno","¿Te gusta Python3?")
	mb.showinfo("Resultado de la respuesta", str(respuesta))
	
	respuesta = mb.askyesnocancel("Ejemplo askyesnocancel", "¿Continuar?")
	mb.showinfo("Resultado de la respuesta", str(respuesta))

def dialogos():
	respuesta = sd.askstring("Ejemplo askstring", "Ingrese su nombre")
	mb.showinfo("Respuesta", respuesta)
	
	respuesta = sd.askinteger("Ejemplo askinteger", "Ingrese su edad")
	mb.showinfo("Respuesta", str(respuesta))
	
	respuesta = sd.askfloat("Ejemplo askfloat", "Ingrese su altura")
	mb.showinfo("Respuesta", str(respuesta))

def agregarEtiqueta():
	tmpLabel = tk.Label(mainForm, text = "TD")
	tmpLabel.place(x = 10, y = 120)

mainForm = tk.Tk()
mainForm.title("Prueba TKInter")
mainForm.geometry("400x200")

mensajesButton = tk.Button(mainForm, text = "Mensajes", command = mensajes)
mensajesButton.place(x = 10, y = 10)

siNoButton = tk.Button(mainForm, text = "SI / NO", command = siNo)
siNoButton.place(x = 100, y = 10)

dialogButton = tk.Button(mainForm, text = "Dialogos", command = dialogos)
dialogButton.place(x = 180, y = 10)

labelButton = tk.Button(mainForm, text = "Prueba Label", command = agregarEtiqueta)
labelButton.place(x = 260, y = 10)

testLabel = tk.Label(mainForm, text = "Etiqueta de Ejemplo")
testLabel.place(x = 10, y = 160)

chauButton = tk.Button(mainForm, text = "Chau", command = quit)
chauButton.place(x = 330, y = 160)

mainForm.mainloop()
