import establecimientos.*
import canciones.*
import exceptions.*
import musicos.*
import albumes.*
import guitarras.*
import builders.*

class Musico{
	var tocaEnGrupo
	const habilidadBase
	const habilidadSiTocaEnGrupo
	const albumes = #{}
	constructor(_habilidadBase, _habilidadSiTocaEnGrupo, _tocaEnGrupo){
		habilidadBase = _habilidadBase
		habilidadSiTocaEnGrupo = _habilidadSiTocaEnGrupo
		tocaEnGrupo = _tocaEnGrupo
	}
	method tocaEnGrupo() = tocaEnGrupo
	method tocaEnGrupo(_tocaEnGrupo) {tocaEnGrupo = _tocaEnGrupo}
	method habilidadBase() = habilidadBase
	method habilidadSiTocaEnGrupo() = habilidadSiTocaEnGrupo
	method albumes() = albumes
	
	method habilidad() =
		if (tocaEnGrupo)
			return habilidadBase + habilidadSiTocaEnGrupo
		else
			return habilidadBase
		
	method interpretaBien(cancion) = 
		self.interpretaBienCancionDeSuAutoria(cancion) || self.habilidad() > 60 || self.interpretaBienParticular(cancion)
		
	method interpretaBienParticular(cancion)
		
	method ganancia(presentacion)
			 	
	method esMinimalista() = albumes.all {album => album.todasLasCancionesSonCortas()}
	
	method duracionDeObra() = 
		if(!albumes.isEmpty())
			albumes.sum {album => album.duracion()}
		else
			return 0
			
	method laPego() = albumes.all {album => album.buenaVenta()}
	method aplanarCancionesDeAlbum() = albumes.flatMap{album => album.canciones()}
	
	method cancionesContienenPalabra(palabra) = 
		self.aplanarCancionesDeAlbum().filter {cancion => cancion.letraContiene(palabra)}.asSet()
		
	method interpretaBienCancionDeSuAutoria(_cancion) = self.aplanarCancionesDeAlbum().contains(_cancion)
	
	method compusoAlMenosUnaCancion() = !albumes.isEmpty()
	
	method tieneLaCantidadDeCancionesParaTocarEnELPdpalooza(){
		if(!self.compusoAlMenosUnaCancion()){
			throw new NoTieneAlMenosUnaCancion("el musico no compuso ninguna cancion")
		}else{
			return true
		}
	}
	
	method tieneLaHabilidadSuficiente() = self.habilidad() > 69
	
	method tieneLaHabilidadParaTocarEnELPdpalooza(){
		if(!self.tieneLaHabilidadSuficiente()){
			throw new NoTiene70DeHabilidad("el musico no tiene 70 de habilidad")
		}else{
			return true
		}
	}
}

class MusicoDeGrupo inherits Musico{
	override method interpretaBienParticular(cancion) = cancion.duracion() > 300  
	override method ganancia(presentacion) =	
		 if (presentacion.esUnicoEnPresentacion(self))
		 	return 100
		 else 
		 	return 50		
}

class VocalistaPopular inherits Musico{
	const palabraMagica
	constructor(_habilidadBase, _habilidadSiTocaEnGrupo, _tocaEnGrupo, _palabraMagica) =
		super(_habilidadBase, _habilidadSiTocaEnGrupo, _tocaEnGrupo){
			palabraMagica = _palabraMagica
		}
	method palabraMagica() = palabraMagica
		
	override method interpretaBienParticular(cancion) = cancion.letraContiene(palabraMagica)
	override method ganancia(presentacion) = 
		if (presentacion.establecimiento().esConcurrido(presentacion.fecha()))
			return 500
		else
			return 400
}

object luisAlberto inherits Musico(8,0,false){
	var guitarra
	const fechaLimite = new Date(1,9,2017)
	method guitarra() = guitarra
	method guitarra(_guitarra) {guitarra = _guitarra}
	
	override method habilidad() = 100.min(habilidadBase * guitarra.valor()) 
	override method interpretaBienParticular(cancion) = true
	override method ganancia(presentacion) =
		if (presentacion.fecha() < fechaLimite)
			return 1000
		else
			return 1200
}