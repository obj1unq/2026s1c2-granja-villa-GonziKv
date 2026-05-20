import wollok.game.*

class Maiz {
	var property position
	var property image = estado.image()
	var estado = maizBebe
	method sembrarse(){
		game.addVisual(self)
	}
	method madurar(){
		estado = maizAdulto
	}
	method cosecharse(){
	}
}

class Trigo{
	var property position
	var property image = "wheat_" + etapa.toString() +".png"
	var etapa = 0
	method sembrarse(){
		game.addVisual(self)
	}
	method cosecharse(){
	}
	method madurar(){
		if (etapa == 3){
			etapa = 0
		} else {
			etapa += 1
		}
		image = "wheat_" + etapa.toString() +".png"
	}
}

class Tomaco{
	var property position 
	var property image = "tomaco.png"
	method sembrarse(){
		game.addVisual(self)
	}

	method madurar(){
		if (position.y() == game.height()-1){
			position = game.at(position.x(),0)
		} else{
			position = game.at(position.x(), position.y()+1)
		}
	}

	method cosecharse(){
	}
}

object maizBebe{
	method image(){
		return "corn_baby.png"
	}
}
object maizAdulto{
	method image(){
		return "corn_adult.png"
	}
}