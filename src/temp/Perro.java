public class Perro {
	
	private static int cantPatas = 4;
	
	public static int getCantPatas() {
		return cantPatas;
	}
	
	public static void setCantPatas(int cantPatas) {
		Perro.cantPatas = cantPatas;
	}
	
	private String nombre;
	private String raza;
	
	public Perro(String nombre, String raza) {
		this.nombre = nombre;
		this.raza = raza;
	}
	
	public String getNombre() {
		return nombre;
	}
	
	public String getRaza() {
		return raza;
	}
}
