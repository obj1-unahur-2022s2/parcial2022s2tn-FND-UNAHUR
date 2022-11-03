/*
 * En cantidadDePlantasEnParcela() te falto el return
 * La segunda condición en plantarUnaPlanta || self.tieneComplicaciones() no es la que se pedia en el enunciado
 * Faltaron las Parcelas Ecologias e Industriales con el metodo se asociaBien(planta)
 */
import plantas.*

class Parcela {
	var property ancho
	var property largo
	var property horasDeSol
	const property plantas = []
	
	method superficieParcela() {
		return ancho * largo
	}
	method cantidadMaximaParcela() {
		if (ancho > largo) 
		return	self.superficieParcela()/5 
		else 
		return	self.superficieParcela()/ (3 + largo)
	}
	method tieneComplicaciones() {
		return plantas.any({h => h.horasDeSolToleredas() < horasDeSol})
	}
	method plantarUnaPlanta(nuevaPlanta) {
		if(self.llegoAlMaximoDePlantas() || self.tieneComplicaciones() )
			self.error("No se puede plantar mas plantas")
		plantas.add(nuevaPlanta)
	}
	method llegoAlMaximoDePlantas() {
		return plantas.size() == self.cantidadMaximaParcela()
	}
	method condicionesIdealesSojaTransgenica() {
		return plantas.isEmpty()
	}
	method cantidadDePlantasEnParcela() {
		return plantas.size()
	}
}

