import wollok.game.*
import direcciones.*
import cultivos.*
object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	method mover(direccion){
		position = direccion.siguiente(position)
	}
	method sembrarMaiz(){
		const nuevoMaiz = new Maiz(position = self.position())
		game.addVisual(nuevoMaiz)
	}
	method sembrarTrigo(){
		const nuevoTrigo = new Trigo(position = self.position())
		game.addVisual(nuevoTrigo)
	}
	method sembrarTomaco(){
		const nuevoTomaco = new Tomaco(position = self.position())
		game.addVisual(nuevoTomaco)
	}
	method cosechar(cultivo){
		cultivo.cosecharse()
	}
	method regar(cultivo){
		cultivo.serRegado()
	}
}