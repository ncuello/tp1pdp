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
		self.interpretaBienCancionDeSuAutoria(cancion) || self.habilidad() > 60
		
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
}

class MusicoDeGrupo inherits Musico{
	override method interpretaBien(cancion) = super(cancion) || cancion.duracion() > 300  
	override method ganancia(presentacion) =	
		 if (presentacion.esUnicoEnPresentacion(self))
		 	return 100
		 else 
		 	return 50		
}

class MusicoDeGrupoBuilder {
	var habilidadBase
	var habilidadSiTocaEnGrupo
	var tocaEnGrupo
	
	method habilidadBase(_habilidadBase){
		habilidadBase = _habilidadBase
		return self
	}
	method habilidadSiTocaEnGrupo(_habilidadSiTocaEnGrupo) {
		habilidadSiTocaEnGrupo = _habilidadSiTocaEnGrupo
		return self
	}
	method tocaEnGrupo(_tocaEnGrupo) {
		tocaEnGrupo = _tocaEnGrupo
		return self
	}
	method build() {
		const musicoDeGrupo = new MusicoDeGrupo(habilidadBase, habilidadSiTocaEnGrupo, tocaEnGrupo)
		return musicoDeGrupo
	}
}

class VocalistaPopular inherits Musico{
	const palabraMagica
	constructor(_habilidadBase, _habilidadSiTocaEnGrupo, _tocaEnGrupo, _palabraMagica) =
		super(_habilidadBase, _habilidadSiTocaEnGrupo, _tocaEnGrupo){
			palabraMagica = _palabraMagica
		}
	method palabraMagica() = palabraMagica
		
	override method interpretaBien(cancion) = super(cancion) || cancion.letraContiene(palabraMagica)
	override method ganancia(presentacion) = 
		if (presentacion.establecimiento().esConcurrido(presentacion.fecha()))
			return 500
		else
			return 400
}

class VocalistaPopularBuilder inherits MusicoDeGrupoBuilder {
	var palabraMagica
	
	method palabraMagica(_palabraMagica){
		palabraMagica = _palabraMagica
		return self
	}
	override method build() {
		const vocalistaPopular = new VocalistaPopular(habilidadBase, habilidadSiTocaEnGrupo, tocaEnGrupo, palabraMagica)
		return vocalistaPopular
	}
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