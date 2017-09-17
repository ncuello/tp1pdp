class Presentacion {
	const fecha
	const establecimiento
	var cantantes
	
	constructor(_fecha, _establecimiento, _cantantes){
		fecha = _fecha
		establecimiento = _establecimiento
		cantantes = _cantantes
	}
	method fecha() = fecha
	method establecimiento() = establecimiento
	method cantantes() = cantantes
	method cantantes(_cantantes) {cantantes = _cantantes}
	method costoTotal() = cantantes.sum { cantante => cantante.ganancia(self) }
	
	method esUnicoEnPresentacion(cantante) =
		self.cantantes().contains(cantante) && self.cantantes().size() == 1
}