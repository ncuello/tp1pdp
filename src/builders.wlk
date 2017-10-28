/**
Se mantienen todos los builders de todas las clases.
*/
import albumes.*
import canciones.*
import musicos.*

class AlbumBuilder {
	var fecha
	var copiasEditadas
	var copiasVendidas
	var canciones = #{}
	
	method fecha(dia, mes, anio){
		fecha = new Date(dia, mes, anio)
		return self
	}
	method copiasEditadas(_copiasEditadas){
		copiasEditadas = _copiasEditadas
		return self
	}
	method copiasVendidas(_copiasVendidas){
		copiasVendidas = _copiasVendidas
		return self
	}
	method agregarCancion(_cancion){
		canciones.add(_cancion)
		return self
	}
	method build(){
		const album = new Album(fecha, copiasEditadas, copiasVendidas, canciones)
		return album
	}
}

class CancionesBuilder {
	var titulo
	var duracion
	var letra
	
	method titulo(_titulo){
		titulo = _titulo
		return self
	}
	method duracion(_duracion){
		duracion = _duracion
		return self
	}
	method letra(_letra){
		letra = _letra
		return self
	}
	
	method build(){
		const cancion = new Cancion(titulo, duracion, letra)
		return cancion
	}
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
