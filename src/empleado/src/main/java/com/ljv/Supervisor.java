package com.ljv.empleado;

import java.time.LocalDate;

public class Supervisor extends Empleado {
	private int cantidadEmpleadosSupervisados;
	private static float bonoAntiguedad = 120;
	
	public Supervisor(int dni, String nombre, int nroLegajo, LocalDate fechaIngreso, float sueldoBruto, int cantidadEmpleadosSupervisados) {
		super(dni, nombre, nroLegajo, fechaIngreso, sueldoBruto);
		
		this.cantidadEmpleadosSupervisados = cantidadEmpleadosSupervisados;
	}	
	
	public Supervisor(int dni, String nombre, int nroLegajo, float sueldoBruto, int cantidadEmpleadosSupervisados) {
		super(dni, nombre, nroLegajo, sueldoBruto);
		
		this.cantidadEmpleadosSupervisados = cantidadEmpleadosSupervisados;
	}
	
	public int getCantidadEmpleadosSupervisados() {
		return cantidadEmpleadosSupervisados;
	}
	
	public void setCantidadEmpleadosSupervisados(int cantidadEmpleadosSupervisados) {
		if(cantidadEmpleadosSupervisados >= 0)
			this.cantidadEmpleadosSupervisados = cantidadEmpleadosSupervisados;
	}
	
	public void incrementarSueldo() {
		sueldoBruto *= 1.10;
	}
	
	public int getTributo() {
		return (int) (sueldoBruto * 0.08);
	}
	
	public float getBonoAntiguedad() {
		return getAntiguedad() * Supervisor.bonoAntiguedad;
	}
	
	public static void setBonoAntiguedad(float bonoAntiguedad) {
		if(bonoAntiguedad > 0)
			Supervisor.bonoAntiguedad = bonoAntiguedad;
	}
}
