import canciones.*

class Presentacion {
	const fecha
	const establecimiento
	const cantantes = #{}
	
	constructor(_fecha, _establecimiento){
		fecha = _fecha
		establecimiento = _establecimiento
	}
	constructor(_fecha, _establecimiento, _cantantes){
		fecha = _fecha
		establecimiento = _establecimiento
		cantantes = _cantantes
	}
	method fecha() = fecha
	method establecimiento() = establecimiento
	method cantantes() = cantantes
	method costoTotal() = cantantes.sum { cantante => cantante.ganancia(self) }
	method agregarCantante(cantante) = cantantes.add(cantante)
	method eliminarCantante(cantante) = cantantes.remove(cantante)
	
	method agregarCantanteConRestriccion(_cantante){
		self.validar(_cantante)
		cantantes.add(_cantante)
	}
	method habilidadBaseParaTocar(_cantante) = _cantante.habilidad() > 69 
	
//	method compusoAlMenosUnaCancion(_cantante) = _cantante.compusoAlMenosUnaCancion()
//	
//	method debeInterpretarBienLaCancion(_cantante) = _cantante.interpretaBien(new Cancion("Canción de Alicia en el país", 510, "Quién sabe Alicia, este país no estuvo hecho porque sí. Te vas a ir, vas a salir pero te quedas, ¿dónde más vas a ir? Y es que aquí, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acabó ese juego que te hacía feliz."))
	
	method agregarRestriccion(){
		
	}
	method validar(_cantante){
		if(!self.habilidadBaseParaTocar(_cantante)){
			self.error("No tiene la habilidad para tocar en la presentación")
		}
//		if(!self.compusoAlMenosUnaCancion(_cantante)){
//			self.error("No cumple la condición de componer al menos una canción")
//		}
//		if(!self.debeInterpretarBienLaCancion(_cantante)){
//			self.error("No cumple la condición de interpretar una canción")
//		}
	}
	
	method esUnicoEnPresentacion(cantante) =
		self.cantantes().contains(cantante) && self.cantantes().size() == 1
}

class PresentacionBuilder {
	var fecha
	var establecimiento
	var cantantes = #{}
	method fecha(dia, mes, anio){
		fecha = new Date(dia, mes, anio)
		return self
	}
	method establecimiento(_establecimiento){
		establecimiento = _establecimiento
		return self
	}
	method agregarCantanteConRestriccion(_cantante){
		self.validar(_cantante)
		cantantes.add(_cantante)
		return self
	}
	method habilidadBaseParaTocar(_cantante) = _cantante.habilidad() > 69 
	
	method compusoAlMenosUnaCancion(_cantante) = _cantante.compusoAlMenosUnaCancion()
	
	method debeInterpretarBienLaCancion(_cantante) = _cantante.interpretaBien(new Cancion("Canción de Alicia en el país", 510, "Quién sabe Alicia, este país no estuvo hecho porque sí. Te vas a ir, vas a salir pero te quedas, ¿dónde más vas a ir? Y es que aquí, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acabó ese juego que te hacía feliz."))
	
	method agregarRestriccion(){
		
	}
	method validar(_cantante){
		if(!self.habilidadBaseParaTocar(_cantante)){
			self.error("No tiene la habilidad para tocar en la presentación")
		}
		if(!self.compusoAlMenosUnaCancion(_cantante)){
			self.error("No cumple la condición de componer al menos una canción")
		}
		if(!self.debeInterpretarBienLaCancion(_cantante)){
			self.error("No cumple la condición de interpretar una canción")
		}
	}
	method build(){
		const presentacion = new Presentacion(fecha, establecimiento, cantantes)
		return presentacion
	}
	
}