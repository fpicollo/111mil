class Dog(object):
	def __init__(self, name, race, weigth, age = 0):
		self.__name = name
		self.__race = race
		
		if weigth < 1:
			self.__weigth = 1
		else:
			self.__weigth = weigth
		
		if age < 0:
			self.__age = 0
		else:
			self.__age = age
	
	def bark(self):
		print(self.__name + " dice: Guau Guau")
	
	def getName(self):
		return self.__name
	
	def getRace(self):
		return self.__race
	
	def getAge(self):
		return self.__age
	
	def age(self):
		self.__age += 1
	
	def getWeigth(self):
		return self.__weigth
	
	def eat(self, food = 1):
		if food > 0:
			self.__weigth += food
	
	def poop(self, shit = 1):
		if shit > 0 and self.__weigth > shit:
			self.__weigth -= shit
