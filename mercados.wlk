import wollok.game.*
class Mercado{
    var property position
    var property image = "market.png"
    var property cantMonedas = 10000
    const mercado = []
    //ACCIONES
    method vender(plantasAVender){
        const cantOroAPagar = plantasAVender.sum({cultivo => cultivo.precio()})
        if (cantOroAPagar <= cantMonedas){
            game.uniqueCollider(self).recibirOro(cantOroAPagar)
            mercado.addAll(plantasAVender)
            cantMonedas -= cantOroAPagar
        } else {
            game.say(self, "No puedo costear esta venta")
        }
    }

    //CONSULTAS
    method esPlanta(){
		return false
	}

    method serRegado(){
	}

    method esMercado(){
        return true
    }
    method presupuesto(){
        return cantMonedas
    }

}

object mercadoFactory{
    method crearMercado(posicion){
        return new Mercado (position= posicion)
    }
}