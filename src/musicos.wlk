import albumes.*
import canciones.*
class Musico{
	
}

class MusicoDeGrupo{
	var tocaEnGrupo
	const habilidadBase
	const habilidadSiTocaEnGrupo
	const albumes
	constructor(_habilidadBase, _habilidadSiTocaEnGrupo, _tocaEnGrupo, _albumes){
		habilidadBase = _habilidadBase
		habilidadSiTocaEnGrupo = _habilidadSiTocaEnGrupo
		tocaEnGrupo = _tocaEnGrupo
		albumes = _albumes
	}
	method tocaEnGrupo() = tocaEnGrupo
	method tocaEnGrupo(_tocaEnGrupo) {tocaEnGrupo = _tocaEnGrupo}
	
	method habilidadBase() = habilidadBase
	method habilidadSiTocaEnGrupo() = habilidadSiTocaEnGrupo
	
	method habilidad() =
		if (tocaEnGrupo)
			return habilidadBase + habilidadSiTocaEnGrupo
		else
			return habilidadBase
		
	method interpretaBien(cancion) = cancion.duracion() > 300  //300 segundos
	 
	method ganancia(presentacion) =	
		 if (presentacion.esUnicoEnPresentacion(self))
		 	return 100
		 else 
		 	return 50		
		 	
	method esMinimalista() = albumes.all {album => album.todasLasCancionesSonCortas()}
	method duracionDeObra() = 
		if(albumes != null)
			albumes.sum {album => album.duracion()}
		else
			return 0
	method laPego() = albumes.all {album => album.buenaVenta()}
	method cancionesContienenPalabra(palabra) = albumes.filter {album => album.contienePalabra(palabra)}
}

class VocalistaPopular{
	var tocaEnGrupo
	const habilidadBase
	const habilidadSiTocaEnGrupo
	const palabraMagica
	const albumes
	constructor(_habilidadBase, _habilidadSiTocaEnGrupo, _tocaEnGrupo, _palabraMagica, _albumes){
		habilidadBase = _habilidadBase
		habilidadSiTocaEnGrupo = _habilidadSiTocaEnGrupo
		tocaEnGrupo = _tocaEnGrupo
		palabraMagica = _palabraMagica
		albumes = _albumes
	}
	method tocaEnGrupo() = tocaEnGrupo
	method tocaEnGrupo(_tocaEnGrupo) {tocaEnGrupo = _tocaEnGrupo}
	
	method habilidadBase() = habilidadBase	
	method habilidadSiTocaEnGrupo() = habilidadSiTocaEnGrupo	
	method palabraMagica() = palabraMagica
	method albumes() = albumes
			
	method habilidad() =
		if (tocaEnGrupo)
			return habilidadBase + habilidadSiTocaEnGrupo
		else
			return habilidadBase
		
	method interpretaBien(cancion) = cancion.letraContiene(palabraMagica)
	method ganancia(presentacion) = 
		if (presentacion.establecimiento().esConcurrido(presentacion.fecha()))
			return 500
		else
			return 400 
	
	method esMinimalista() = albumes.all {album => album.todasLasCancionesSonCortas()}
	method duracionDeObra() = albumes.sum {album => album.duracion()}
	method laPego() = albumes.all {album => album.buenaVenta()}
	method cancionesContienenPalabra(palabra) =
		albumes.canciones().filter {cancion => cancion.letraContiene(palabra)}
		
}

object joaquin{
	var habilidad = 20
	var grupo = "Pimpinela"
	
	method grupo() = grupo
	method grupo(_grupo) {grupo = _grupo}
	 
	method habilidad() =       
		if (grupo != null)
			return habilidad + 5
		else
			return habilidad
		
	method interpretaBien(cancion) = cancion.duracion() > 300  //300 segundos
	 
	method ganancia(presentacion) =	
		 if (presentacion.esUnicoEnPresentacion(self))
		 	return 100
		 else 
		 	return 50		 
}

object lucia {
	var habilidad = 70
	var grupo = "Pimpinela"
	
	method grupo() = grupo
	method grupo(_grupo) {grupo = _grupo}
	
	method habilidad() =
		if (grupo != null)
			return habilidad - 20
		else
			return habilidad
		
//	method interpretaBien(cancion) = cancion.letra().toLowerCase().contains("familia")
	method interpretaBien(cancion) = cancion.letraContiene("familia")
	method ganancia(presentacion) = 
		if (presentacion.establecimiento().esConcurrido(presentacion.fecha()))
			return 500
		else
			return 400 //ncuello
}

object luisAlberto {
	var guitarra
	var fechaLimite = new Date(1,9,2017)
	method guitarra() = guitarra
	method guitarra(_guitarra) {guitarra = _guitarra}
	
	method habilidad() = 100.min(8 * guitarra.valor()) 
	method interpretaBien(cancion) = true
	method ganancia(presentacion) =
		if (presentacion.fecha() < fechaLimite)
			return 1000
		else
			return 1200
}

	
	
	
	
