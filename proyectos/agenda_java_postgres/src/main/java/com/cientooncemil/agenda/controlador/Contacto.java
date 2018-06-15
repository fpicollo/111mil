package com.cientooncemil.agenda.controlador;

public class Contacto {
	private Integer dni;
	private String nombre;
	private String apellido;
	private String direccion;
	private String telefono;
	private String mail;
	
	
	public Contacto (Integer dni, String nombre, String apellido, String direccion, String telefono, String mail) {
		this.dni = dni;
		this.nombre = nombre;
		this.apellido = apellido;
		this.direccion = direccion;
		this.telefono = telefono;
		this.mail = mail;
	}
	
	
	public Integer getDni() {
		return dni;
	}
	
	
	public String getNombre() {
		return nombre;
	}
	
	
	public String getApellido() {
		return apellido;
	}
	
	
	public String getDireccion() {
		return direccion;
	}
	
	
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	
	
	public String getTelefono() {
		return telefono;
	}
	
	
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	
	public String getMail() {
		return mail;
	}
	
	
	public void setMail(String mail) {
		this.mail = mail;
	}
}
