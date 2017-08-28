class Presentacion {
	var fecha
	var establecimiento
	var cantantes
	
	method fecha() = fecha
	method fecha(_fecha) {fecha = _fecha}
	method establecimiento() = establecimiento
	method establecimiento(_establecimiento) {establecimiento = _establecimiento}
	method cantantes() = cantantes
	method cantantes(_cantantes) {cantantes = _cantantes}
	method costoTotal() = cantantes.sum { cantante => cantante.ganancia(self) }
}