import establecimientos.*
import canciones.*
import exceptions.*
import musicos.*
import albumes.*
import guitarras.*
import builders.*
import criterioPresentaciones.*

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
	
	method esUnicoEnPresentacion(cantante) =
		self.cantantes().contains(cantante) && self.cantantes().size() == 1
		
	method agregarCantanteConRestriccion(_cantante){
		self.validar(_cantante)
		cantantes.add(_cantante)
	}
	method habilidadBaseParaTocar(_cantante) = _cantante.tieneLaHabilidadSuficiente()
	
	method compusoAlMenosUnaCancion(_cantante) = _cantante.compusoAlMenosUnaCancion()
		
	method debeInterpretarBienLaCancion(_cantante, _cancion) = _cantante.interpretaBien(_cancion)
	
	method agregarRestriccion(){
		
	}
	method validar(_cantante){
		const criterioHabilidadBase = new CriterioHabilidadBase(self, _cantante)
		const criterioCompusoAlMenosUnaCancion = new CriterioCompusoAlMenosUnaCancion(self, _cantante)
		const criterioInterpretaBienAlicia = new CriterioInterpretaBienUnaCancion(self, _cantante)
		
		criterioHabilidadBase.validar()
		criterioCompusoAlMenosUnaCancion.validar()
		criterioInterpretaBienAlicia.validar()
	}
}
