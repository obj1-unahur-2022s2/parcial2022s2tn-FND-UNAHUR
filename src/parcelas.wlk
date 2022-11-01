import plantas.*

class Parcela {
	var property ancho
	var property largo
	const property horasDeSol
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
	method condicionesIdealesMentaYHierba() {
		return self.superficieParcela() > 6
	}
	method condicionesIdealesQuiona() {
		return plantas.all({h => h.alturaDePlanta() < 1.5})
	}
	method condicionesIdealesSoja(unaPlanta) {
		return horasDeSol == plantas.find({unaPlanta.horasDeSolToleredas()})
	}
	method condicionesIdealesSojaTransgenica() {
		return plantas.isEmpty()
	}
}

