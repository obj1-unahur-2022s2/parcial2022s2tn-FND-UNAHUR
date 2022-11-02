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
		plantas.size()
	}
}

