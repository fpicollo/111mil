public class Cat extends Pet {
	private String eyeColor;
	
	public Cat(String name, String race, int age, int weigth, String eyeColor) {
		super(name, race, age, weigth);
		
		this.eyeColor = eyeColor;
	}
	
	public Cat(String name, String race, int weigth, String eyeColor) {
		super(name, race, weigth);
		
		this.eyeColor = eyeColor;
	}
	
	public String talk() {
		return getName() + " dice: Miau Miau!";
	}
	
	public String getEyeColor() {
		return eyeColor;
	}
}
