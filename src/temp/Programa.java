public class Programa {
	public static void main(String[] args) {
		Perro miPerro = new Perro("Pichula", "rottweiler");
		
		System.out.println(miPerro.getNombre());
		System.out.println(miPerro.getRaza());
		System.out.println(miPerro.getCantPatas());
		
		Perro miPerro2 = new Perro("Muquenia", "Callejero Aleman");
		
		System.out.println(miPerro2.getNombre());
		System.out.println(miPerro2.getRaza());
		System.out.println(miPerro2.getCantPatas());
		
		Perro.setCantPatas(5);
		
		System.out.println(miPerro.getNombre());
		System.out.println(miPerro.getRaza());
		System.out.println(miPerro.getCantPatas());
		
		System.out.println(miPerro2.getNombre());
		System.out.println(miPerro2.getRaza());
		System.out.println(miPerro2.getCantPatas());
	}
}
