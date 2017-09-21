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
		
	method interpretaBien(cancion)
	method ganancia(presentacion)
		 	
	method esMinimalista() = albumes.all {album => album.todasLasCancionesSonCortas()}
	method duracionDeObra() = 
		if(!albumes.isEmpty())
			albumes.sum {album => album.duracion()}
		else
			return 0
	method laPego() = albumes.all {album => album.buenaVenta()}
	method aplanarCancionesDeAlbum() = albumes.map{album => album.canciones()}.flatten()
	method cancionesContienenPalabra(palabra) = 
		self.aplanarCancionesDeAlbum().filter {cancion => cancion.letraContiene(palabra)}.asSet()
	
	method agregarAutor() = albumes.forEach{album => album.autor(self)} 
	method agregarAutor2() = albumes.forEach{album => album.agregarAutor(self)} 
}

class MusicoDeGrupo inherits Musico{
//	constructor(_habilidadBase, _habilidadSiTocaEnGrupo, _tocaEnGrupo) =
//		super(_habilidadBase, _habilidadSiTocaEnGrupo, _tocaEnGrupo)
	override method interpretaBien(cancion) = cancion.duracion() > 300 
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
		
	override method interpretaBien(cancion) = cancion.letraContiene(palabraMagica)
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
	override method interpretaBien(cancion) = true
	override method ganancia(presentacion) =
		if (presentacion.fecha() < fechaLimite)
			return 1000
		else
			return 1200
}