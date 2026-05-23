import wollok.game.*
class Mercado{
    var property position
    var property image = "market.png"
    var property cantMonedas = 0
    //ACCIONES

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