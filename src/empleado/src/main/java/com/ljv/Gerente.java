package com.ljv.empleado;

import java.time.LocalDate;

public class Gerente extends Empleado {
	private String departamento;
	private static float bonoAntiguedad = 150;
	
	public Gerente(int dni, String nombre, int nroLegajo, LocalDate fechaIngreso, float sueldoBruto, String departamento) {
		super(dni, nombre, nroLegajo, fechaIngreso, sueldoBruto);
		
		this.departamento = departamento;
	}	
	
	public Gerente(int dni, String nombre, int nroLegajo, float sueldoBruto, String departamento) {
		super(dni, nombre, nroLegajo, sueldoBruto);
		
		this.departamento = departamento;
	}
	
	public String getDepartamento() {
		return departamento;
	}
	
	public void setDepartamento(String departamento) {
		this.departamento = departamento;
	}
	
	public void incrementarSueldo() {
		sueldoBruto *= 1.15;
	}
	
	public int getTributo() {
		return (int) (sueldoBruto * 0.10);
	}
	
	public float getBonoAntiguedad() {
		return getAntiguedad() * Gerente.bonoAntiguedad;
	}
	
	public static void setBonoAntiguedad(float bonoAntiguedad) {
		if(bonoAntiguedad > 0)
			Gerente.bonoAntiguedad = bonoAntiguedad;
	}
}
