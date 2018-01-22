public abstract class Pet {
	private String name;
	private String race;
	private int age;
	private int weigth;
	
	public Pet(String name, String race, int age, int weigth) {
		this.name = name;
		this.race = race;
		
		if(age < 0) {
			this.age = 0;
		} else {
			this.age = age;
		}
		
		if(weigth < 1) {
			this.weigth = 1;
		} else {
			this.weigth = weigth;
		}
	}
	
	public Pet(String name, String race, int weigth) {
		this.name = name;
		this.race = race;
		
		age = 0;
		
		if(weigth < 1) {
			this.weigth = 1;
		} else {
			this.weigth = weigth;
		}
	}
	
	public abstract String talk();
	
	public String getName() {
		return name;
	}
	
	public String getRace() {
		return race;
	}
	
	public int getAge() {
		return age;
	}
	
	public void age() {
		age++;
	}
	
	public int getWeigth() {
		return weigth;
	}
	
	public void eat() {
		weigth++;
	}
	
	public void eat(int food) {
		if(food > 0)
			weigth += food;
	}
	
	public void poop() {
		if(weigth > 1)
			weigth--;
	}
	
	public void poop(int shit) {
		if(shit > 0 && weigth > shit)
			weigth -= shit;
	}
}
