import parcelas.*

class Planta {
	var property anoDeObtencion
	var property alturaDePlanta
	//var horasDeSolToleradas
	
	method horasDeSolToleredas() 
	method esFuerte() {return self.horasDeSolToleredas() > 10}
	method daNuevasSemillas() {return self.esFuerte()}
	method esParcelaIdeal(unaParcela)
	method espacioQueOcupa()
}

class Menta inherits Planta {
	
	override method horasDeSolToleredas() { return 6}
	
	override method daNuevasSemillas() {
		return super() || alturaDePlanta > 0.4
	}
	override method espacioQueOcupa() {
		return alturaDePlanta * 3
	}
	override method esParcelaIdeal(unaParcela) {
		return unaParcela.superficieParcela() > 6
	}
}
class Soja inherits Planta {
	
	override method horasDeSolToleredas() {
		if (alturaDePlanta < 0.5) 
			return 6
		else if (alturaDePlanta.between(0.5,1))
			return 7
		else 
			return 9
	}
	override method daNuevasSemillas() {
		return super() || self.mayorA2007() && alturaDePlanta > 1
	}
	method mayorA2007() {
		return anoDeObtencion > 2007 
	}
	override method espacioQueOcupa() {
		return alturaDePlanta / 2
	}
	override method  esParcelaIdeal(unaParcela) {
		return unaParcela.horasDeSol() == self.horasDeSolToleradas()
	}
}
class Quinoa inherits Planta {
	var property horasDeCadaPlantaAndina
	
	override method horasDeSolToleredas() {
		return horasDeCadaPlantaAndina
	}
	
	override method espacioQueOcupa() {
		return 0.5
	}
	
	override method daNuevasSemillas() {
		return super() || self.menorA2005()
	}
	
	method menorA2005() {
		return anoDeObtencion < 2005 
	}
	
	override method esParcelaIdeal(unaParcela) {
		return unaParcela.all({h => h.alturaDePlanta() < 1.5})
	}
}
}
class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() {
		return false
	}
	override method esParcelaIdeal(unaParcela) {
		unaParcela.cantidadDePlantasEnParcela() == 1
	}
}
class HierbaBuena inherits Menta {
	override method espacioQueOcupa() {
		return super() * 2
	}
}
