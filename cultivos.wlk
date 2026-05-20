import wollok.game.*

class Maiz {
	var property position
	var property image = estado.image()
	var estado = maizBebe
	method sembrarse(){
		game.addVisual(self)
	}
	method serRegado(){
		estado = maizAdulto
	}
	method serCosechada(){
		game.removeVisual(self)
	}
	method estaListoParaCosechar(){
		return estado == maizAdulto
	}
	method precio(){
		return 150
	}
}

class Trigo{
	var property position
	var property image = "wheat_" + etapa.toString() +".png"
	var etapa = 0
	method sembrarse(){
		game.addVisual(self)
	}
	method serCosechada(){
		game.removeVisual(self)
	}
	method serRegado(){
		if (etapa == 3){
			etapa = 0
		} else {
			etapa += 1
		}
		image = "wheat_" + etapa.toString() +".png"
	}
	method estaListoParaCosechar(){
		return etapa >= 2
	}
	method precio(){
		return (etapa -1) * 100
	}
}

class Tomaco{
	var property position 
	var property image = "tomaco.png"
	method sembrarse(){
		game.addVisual(self)
	}

	method serRegado(){
		if (position.y() == game.height()-1){
			position = game.at(position.x(),0)
		} else{
			position = game.at(position.x(), position.y()+1)
		}
	}

	method serCosechada(){
		game.removeVisual(self)
	}
	method estaListoParaCosechar(){
		return true
	}
	method precio(){
		return 80
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