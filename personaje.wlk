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
	/*method mover(direccion){
		position = direccion.siguiente(position)
	}
*/
	method sembrar(cultivo){
		self.validarPosicion()
		cultivo.sembrarse()
	}

	method cosechar(cultivo){
		if (cultivo.estaListoParaCosechar()){
			bolsaConCultivo.add(cultivo)
			cultivo.serCosechada()
			} 
	}

	method regar(cultivo){
		self.validarRegado()
		cultivo.serRegado()
	}

	method validarPosicion(){
		if (!(game.colliders(self).isEmpty())){
			self.error("Esta posicion esta ocupada")
		}
	}

	method vender(){
		cantOro += bolsaConCultivo.sum({cultivo => cultivo.precio()})
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
	
	method validarRegado(){
		if (!(game.colliders(self)).any({objeto => objeto.esPlanta()})){
			self.error("No tengo nada para regar")
		}
	}
	method esPlanta(){
		return false
	}
}
