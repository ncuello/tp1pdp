import establecimientos.*
import canciones.*
import exceptions.*
import musicos.*
import albumes.*
import guitarras.*
import builders.*

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
}

object pdpalooza inherits Presentacion(new Date(15,12,2017),lunaPark,#{})  {
	var cancionDeAlicia = new CancionesBuilder()
									.duracion(510)
									.letra("Quien sabe Alicia, este pais no estuvo hecho porque si. Te vas a ir, vas a salir pero te quedas, �donde mas vas a ir? Y es que aqui, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acabo ese juego que te hacia feliz.")
									.titulo("Cancion de Alicia en el pais")
									.build()
	method agregarMusico(musico){
		try{
			if(musico.tieneLaHabilidadParaTocarEnELPdpalooza() && 
			   musico.compusoAlMenosUnaCancion() &&
			   musico.interpretaBien(cancionDeAlicia) 
			   
			){
				cantantes.add(musico)
				console.println("El Musico se agrego Correctamente al evento")
			}else{
				console.println("el Musico no interpreta bien la cancion 'Cancion de Alicia en el pais'")
			}
			
		}catch e : NoTiene70DeHabilidad {
			console.println(e.getMessage())
		}catch e : NoTieneAlMenosUnaCancion{
			console.println(e.getMessage())
		}
	}
}