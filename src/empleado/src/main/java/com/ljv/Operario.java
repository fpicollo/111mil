package com.ljv.empleado;

import java.time.LocalDate;

public class Operario extends Empleado {
	private String tipoMaquina;
	private static float bonoAntiguedad = 100;
	
	public Operario(int dni, String nombre, int nroLegajo, LocalDate fechaIngreso, float sueldoBruto, String tipoMaquina) {
		super(dni, nombre, nroLegajo, fechaIngreso, sueldoBruto);
		
		this.tipoMaquina = tipoMaquina;
	}	
	
	public Operario(int dni, String nombre, int nroLegajo, float sueldoBruto, String tipoMaquina) {
		super(dni, nombre, nroLegajo, sueldoBruto);
		
		this.tipoMaquina = tipoMaquina;
	}
	
	public String getTipoMaquina() {
		return tipoMaquina;
	}
	
	public void setTipoMaquina(String tipoMaquina) {
		this.tipoMaquina = tipoMaquina;
	}
	
	public void incrementarSueldo() {
		sueldoBruto *= 1.08;
	}
	
	public int getTributo() {
		return (int) (sueldoBruto * 0.05);
	}
	
	public float getBonoAntiguedad() {
		return getAntiguedad() * Operario.bonoAntiguedad;
	}
	
	public static void setBonoAntiguedad(float bonoAntiguedad) {
		if(bonoAntiguedad > 0)
			Operario.bonoAntiguedad = bonoAntiguedad;
	}
}
