package com.ljv.empleado;

import java.time.LocalDate;
import java.time.Period;

public abstract class Empleado {
	private int dni;
	private String nombre;
	private int nroLegajo;
	private LocalDate fechaIngreso;
	protected float sueldoBruto;
	
	public Empleado(int dni, String nombre, int nroLegajo, LocalDate fechaIngreso, float sueldoBruto) {
		this.dni = dni;
		this.nombre = nombre;
		this.nroLegajo = nroLegajo;
		this.fechaIngreso = fechaIngreso;
		this.sueldoBruto = sueldoBruto;
	}
	
	public Empleado(int dni, String nombre, int nroLegajo, float sueldoBruto) {
		this.dni = dni;
		this.nombre = nombre;
		this.nroLegajo = nroLegajo;
		this.sueldoBruto = sueldoBruto;
		
		fechaIngreso = LocalDate.now();
	}
	
	public int getDni() {
		return dni;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public int getNroLegajo() {
		return nroLegajo;
	}
	
	public int getAntiguedad() {
		LocalDate hoy = LocalDate.now();
		
		Period antiguedad = Period.between(fechaIngreso, hoy);
		
		return antiguedad.getYears();
	}
	
	public float getSueldoBruto() {
		return sueldoBruto;
	}
	
	public abstract void incrementarSueldo();
	
	public abstract int getTributo();
	
	public abstract float getBonoAntiguedad();
}
