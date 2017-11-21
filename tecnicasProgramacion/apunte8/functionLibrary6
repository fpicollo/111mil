# Biblioteca de funciones apunte 8, ejercicio6

function add() {
	declare -i number1=$1
	declare -i number2=$2
	
	echo $((number1 + number2))
}

function substract() {
	declare -i number1=$1
	declare -i number2=$2
	
	echo $((number1 - number2))
}

function multiply() {
	declare -i number1=$1
	declare -i number2=$2
	
	echo $((number1 * number2))
}

function divide() {
	declare -i number1=$1
	declare -i number2=$2
	
	if ((number2 != 0))
	then
		echo $((number1 / number2))
	else
		echo "ERROR! no se puede dividir por cero"
	fi
}

function pow() {
	declare -i number1=$1
	declare -i number2=$2
	
	declare result=$number1
	
	for ((i = 1; i < number2; i++)) {
		result=$((result * number1))
	}

	echo $result
}
