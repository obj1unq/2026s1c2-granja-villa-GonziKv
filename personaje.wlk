import wollok.game.*
import direcciones.*
import cultivos.*
import aspersores.*
import mercados.*
object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const bolsaConCultivo = []
	var cantOro = 0
	/*method mover(direccion){ //No se si añadir esto o no, pq no lo necesita al tener al ser VisualCharacter
		position = direccion.siguiente(position)
	}*/
	//ACCIONES
	method sembrar(cultivo){
		self.validarPosicion()
		cultivo.sembrarse()
	}

	method cosechar(){
		self.validarCosecha()
		const cultivo = game.uniqueCollider(self)
		if (cultivo.estaListoParaCosechar()){
			bolsaConCultivo.add(cultivo)
			cultivo.serCosechada()
			} 
	}

	method regar(){
		self.validarRegado()
		game.uniqueCollider(self).serRegado()
	}

	
	method vender(){
		self.validarMercado()
		game.uniqueCollider(self).vender(bolsaConCultivo)
	}

	method recibirOro(cantidad){
		cantOro += cantidad
		bolsaConCultivo.clear()
	}

	method consultarOroYPlantasAVender(){
		game.say(self, "tengo " + cantOro + " monedas y " 
		        + bolsaConCultivo.size() + " plantas para vender")
	}

	method colocarAspersor(){
		self.validarPosicion()
		aspersores.colocarse(position)
	}

	method serRegado(){
	}
	
	//CONSULTAS
	method validarCosecha(){
		if (not(game.getObjectsIn(position).any({objeto => objeto.esPlanta()}))){
			self.error("No tengo nada para cosechar")
		}
	}

	method validarRegado(){
		if (not(game.getObjectsIn(position).any({objeto => objeto.esPlanta()}))){
			self.error("No tengo nada para regar")
		}
	}

	method esPlanta(){
		return false
	}
	
	method validarMercado(){
		if (!(game.getObjectsIn(position)).any({objeto => objeto.esMercado()})){
			self.error("No hay mercado")
		}
	}
	method validarPosicion(){
		if (!(game.colliders(self).isEmpty())){
			self.error("Esta posicion esta ocupada")
		}
	}

}
