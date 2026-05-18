import wollok.game.*

class Maiz {
	var property position
	var property image = "corn_baby.png"
	var adultez = false
	method sembrarse(posicion){
	}
	method madurar(){
	}
	method cosecharse(){
	}
	method serRegado(){
		if (!adultez){
			adultez = true
			image = "corn_adult.png"
		} 
	}
}

class Trigo{
	var property position
	var property image = "wheat_" + etapa.toString() +".png"
	var etapa = 0
	method sembrarse(posicion){
	}
	method madurar(){
	}
	method cosecharse(){
	}
	method serRegado(){
		if (etapa == 3){
			etapa = 0
			image = "wheat_" + etapa.toString() +".png"
		} else {
			etapa += 1
			image = "wheat_" + etapa.toString() +".png"
		}
	}
}

class Tomaco{
	var property position 
	var property image = "tomaco_baby.png"
	method sembrarse(posicion){
	}
	method madurar(){
	}
	method cosecharse(){
	}
	method serRegado(){}
}
