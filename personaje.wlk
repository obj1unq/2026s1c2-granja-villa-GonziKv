import wollok.game.*
import direcciones.*
import cultivos.*
object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const bolsaConCultivo = []
	var cantOro = 0
	method mover(direccion){
		position = direccion.siguiente(position)
	}
	method sembrar(cultivo){
		self.validarCultivo()
		cultivo.sembrarse()
	}
	method cosechar(cultivo){
		if (cultivo.estaListoParaCosechar()){
			bolsaConCultivo.add(cultivo)
			cultivo.serCosechada()
			} 
	}
	method regar(cultivo){
		cultivo.serRegado()
	}
	method validarCultivo(){
		if (!(game.colliders(self).isEmpty())){
			self.error("No puedo cultivar donde ya esta cultivado")
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
	method colocarAspersor(aspersor){
		game.addVisual(aspersor)
	}
}

class Aspersor{
	var property position
	var property image = "aspersor.png"
	method regar(){
		
	}
	method serRegado(){}
}