public class PetShop {
	public static void main(String args[]) {
		Dog myDog = new Dog("Pichula", "Orejero Aleman", 2);
		
		myDog.bark();
		
		System.out.println(myDog.getName());
		System.out.println(myDog.getRace());
		System.out.println(myDog.getAge());
		System.out.println(myDog.getWeigth());
		
		myDog.eat();
		myDog.age();
		myDog.bark();
		
		System.out.println(myDog.getName());
		System.out.println(myDog.getRace());
		System.out.println(myDog.getAge());
		System.out.println(myDog.getWeigth());
		
		myDog.poop(4);
		System.out.println(myDog.getWeigth());
	}
}
