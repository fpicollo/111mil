public class Dog extends Pet {
	private String hairLength;
	
	public Dog(String name, String race, int age, int weigth, String hairLength) {
		super(name, race, age, weigth);
		
		this.hairLength = hairLength;
	}
	
	public Dog(String name, String race, int weigth, String hairLength) {
		super(name, race, weigth);
		
		this.hairLength = hairLength;
	}
	
	public String talk() {
		return getName() + " dice: Guau Guau!";
	}
	
	public String getHairLength() {
		return hairLength;
	}
}
