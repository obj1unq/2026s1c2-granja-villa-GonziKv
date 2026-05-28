import wollok.game.*
class Aspersor{
	var property position
	var property image = "aspersor.png"
	//ACCIONES
	method regar(){
		self.regarHorizontal()
		self.regarVertical()
	}

	method regarHorizontal(){
		const objARegar = [self.position().left(1),self.position().right(1)]
		objARegar.forEach({posicion => self.regarHacia(posicion)})
	}

	method regarVertical(){
		const objARegar = [self.position().up(1),self.position().down(1)]
		objARegar.forEach({posicion => self.regarHacia(posicion)})
	}

	method regarHacia(posicion){
		game.getObjectsIn(posicion).forEach({objeto => objeto.serRegado()})
	}
	method serRegado(){}
	//CONSULTAS
	method esPlanta(){
		return false
	}
	method esMercado(){
        return false
    }
}

object aspersorFactory{
    method crearAspersor(posicion){
        return new Aspersor (position= posicion)
    }
    
}
object aspersores{
    const aspersoresEnMapa = []
    method colocarse(posicion){
        const aspersor = aspersorFactory.crearAspersor(posicion)
        aspersoresEnMapa.add(aspersor)
        game.addVisual(aspersor)
    }
    method regar(){
        aspersoresEnMapa.forEach({aspersor => aspersor.regar()})
    }
}