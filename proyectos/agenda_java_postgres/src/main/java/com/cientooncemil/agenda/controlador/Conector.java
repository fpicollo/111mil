package com.cientooncemil.agenda.controlador;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class Conector {
	private Connection dbConnection = null;
	private String url;
	private String username;
	private String password;
	
	public Conector(String host, String database, String username, String password) {
		url = "jdbc:postgresql://" + host + ":5432/" + database;
		this.username = username;
		this.password = password;
	}
	
	public void ejecutar(String queryString) {
		try {
			Class.forName("org.postgresql.Driver");
			dbConnection = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			System.out.println("ERROR: " + e);
		}
		
		Statement query = null;
			
		try {
			query = dbConnection.createStatement();
			query.execute(queryString);
			query.close();
		} catch (Exception e) {
			System.out.println("ERROR: " + e);
		}
		
		try { dbConnection.close(); } catch(Exception e) {}
	}
	
	
	public void crearContacto(Contacto contacto) {
		String queryString = "SELECT contacto ("
				+ contacto.getDni().toString() + ", "
				+ "'" + contacto.getNombre() + "', "
				+ "'" + contacto.getApellido() + "', "
				+ "'" + contacto.getDireccion() + "', "
				+ "'" + contacto.getTelefono() + "', "
				+ "'" + contacto.getMail() + "'"
			+")";
		
		ejecutar(queryString);
	}
	
	
	public void borrarContacto(Contacto contacto) {
		String queryString = "SELECT contacto_eliminar(contacto_identificar_por_dni(" + contacto.getDni().asString() "))";
		
		ejecutar(queryString);
	}
	
	
	public void actualizarDireccion(Contacto contacto) {
		String queryString = "SELECT contacto_set_direccion(" 
			+ "contacto_identificar_por_dni(" + contacto.getDni().asString() "), "
			+ "'" + contacto.getDireccion() + "'"
		+ ")";
		
		ejecutar(queryString);
	}
		
	
	public void actualizarTelefono(Contacto contacto) {
		String queryString = "SELECT contacto_set_telefono(" 
			+ "contacto_identificar_por_dni(" + contacto.getDni().asString() "), "
			+ "'" + contacto.getTelefono() + "'"
		+ ")";
		
		ejecutar(queryString);
	}
		
	
	public void actualizarMail(Contacto contacto) {
		String queryString = "SELECT contacto_set_mail(" 
			+ "contacto_identificar_por_dni(" + contacto.getDni().asString() "), "
			+ "'" + contacto.getMail() + "'"
		+ ")";
		
		ejecutar(queryString);
	}
	
	
	public ArrayList<Contacto> buscarContacto(String nombre, String apellido) {
		if(nombre.equals(""))
			nombre = "%";
		
		if(apellido.equals(""))
			apellido = "%";
			
		String queryString = "SELECT contacto_buscar(p_nombre := '" + nombre + "', p_apellido := '" + apellido "')";
	}
}
