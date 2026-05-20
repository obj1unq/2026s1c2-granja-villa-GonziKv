import wollok.game.*
import direcciones.*
import cultivos.*
object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	method mover(direccion){
		position = direccion.siguiente(position)
	}
	method sembrar(cultivo){
		self.validarCultivo()
		cultivo.sembrarse()
	}
	method cosechar(cultivo){
		cultivo.cosecharse()
	}
	method regar(cultivo){
		cultivo.madurar()
	}
	method validarCultivo(){
		if (!(game.colliders(self).isEmpty())){
			self.error("No puedo cultivar donde ya esta cultivado")
		}
	}
}