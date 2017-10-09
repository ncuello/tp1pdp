class Cancion {
	var titulo
	var duracion
	var letra
	var criterioParaComparar
	constructor()
	constructor(_titulo, _duracion, _letra){
		titulo = _titulo
		duracion = _duracion
		letra = _letra
	}
	method titulo() = titulo
	method duracion() = duracion
	method letra() = letra
	
	method letraContiene(palabra) = self.letra().toLowerCase().contains(palabra)
	method esCorta() = duracion < 180
	method largoDeLetra() = letra.length()
	
	method criterioParaComparar(_criterio) {
		criterioParaComparar = _criterio
	}
	method comparaPor(_criterio) {
		self.criterioParaComparar(_criterio)
		return criterioParaComparar.comparaPor(self)
	}
	
	method transformarARemix() {
		var tituloRemix
		var duracionRemix
		var letraRemix
		tituloRemix = self.titulo() + " remix"
		duracionRemix = self.duracion() * 3
		letraRemix = "mueve tu cuelpo baby " + self.letra() + " yeah oh yeah"
		return new Cancion(tituloRemix, duracionRemix, letraRemix)
	}
}

class CancionMashups inherits Cancion{
	const canciones = []
	method agregarCancion(_cancion) = canciones.add(_cancion)
	
	method armarTitulo() = canciones.fold("", {titulo, cancion => titulo + cancion.titulo() + " "}).trim()
	method establecerDuracion() = canciones.max{cancion => cancion.duracion()}.duracion()
	method armarLetra() = canciones.fold("", {letra, cancion => letra + cancion.letra() + " "}).trim() 	
	method crearCancionMashup() {
		titulo = self.armarTitulo()
		duracion = self.establecerDuracion()
		letra = self.armarLetra()
	}
}

object criterioLargoDeLetra {
	method comparaPor(_cancion) = _cancion.largoDeLetra()
}

object criterioDuracion {
	method comparaPor(_cancion) = _cancion.duracion()
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