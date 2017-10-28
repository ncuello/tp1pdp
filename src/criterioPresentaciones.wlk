import canciones.*
import builders.*

class Criterio {
	var presentacion
	var cantante
	constructor(_presentacion, _cantante){
		presentacion = _presentacion
		cantante = _cantante
	}
	method validar() = self.validarCriterio()
	
	method validarCriterio()
}
class CriterioHabilidadBase inherits Criterio{
	override method validarCriterio() =
		if(!presentacion.habilidadBaseParaTocar(cantante))
			error.throwWithMessage("No tiene la habilidad para tocar en la presentación")   		
}

class CriterioCompusoAlMenosUnaCancion inherits Criterio{
	override method validarCriterio() =
		if(!presentacion.compusoAlMenosUnaCancion(cantante))
			error.throwWithMessage("No cumple la condición de componer al menos una canción")
}

class CriterioInterpretaBienUnaCancion inherits Criterio {
	var cancionDeAlicia = new CancionesBuilder()
									.duracion(510)
									.letra("Quien sabe Alicia, este pais no estuvo hecho porque si. Te vas a ir, vas a salir pero te quedas, �donde mas vas a ir? Y es que aqui, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acabo ese juego que te hacia feliz.")
									.titulo("Cancion de Alicia en el pais")
									.build()
	
	override method validarCriterio() =
		if(!presentacion.debeInterpretarBienLaCancion(cantante, cancionDeAlicia))
			error.throwWithMessage("No cumple la condición de interpretar una canción")
}