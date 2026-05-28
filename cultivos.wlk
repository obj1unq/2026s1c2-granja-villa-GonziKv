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
		image = estado.image()
	}
	method serCosechada(){
		game.removeVisual(self)
	}
	method estaListoParaCosechar(){
		return estado.listoParaCosechar()
	}
	method precio(){
		return 150
	}
	method esPlanta(){
		return true
	}
	method esMercado(){
        return false
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
	method esPlanta(){
		return true
	}
	method esMercado(){
        return false
    }
}

class Tomaco{
	var property position 
	var property image = "tomaco.png"
	method sembrarse(){
		game.addVisual(self)
	}
	method validarPosicionSiguiente(posicion){
		if (!(game.getObjectsIn(posicion).isEmpty())){
			self.error("No puedo moverme a la siguiente celda ya que esta ocupada")
		}
	}

	method serRegado(){
		if (position.y() == game.height()-1){
			const posicionSiguiente = game.at(position.x(),0)
			self.validarPosicionSiguiente(posicionSiguiente)
			position = posicionSiguiente
		} else{
			const posicionSiguiente =game.at(position.x(), position.y()+1)
			self.validarPosicionSiguiente(posicionSiguiente)
			position = posicionSiguiente
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
	method esPlanta(){
		return true
	}
	method esMercado(){
        return false
    }
}

object maizBebe{
	method image(){
		return "corn_baby.png"
	}

	method listoParaCosechar(){
		return false
	}
}
object maizAdulto{
	method image(){
		return "corn_adult.png"
	}

	method listoParaCosechar(){
		return true
	}
}