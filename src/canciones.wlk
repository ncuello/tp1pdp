import builders.*

class Cancion {
	const titulo
	const duracion
	const letra

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

}

class Remix inherits Cancion{
	constructor(cancionOriginal){
		titulo = self.componerTituloRemix(cancionOriginal)
		duracion = self.componerDuracionRemix(cancionOriginal)
		letra = self.componerLetraRemix(cancionOriginal)
	}
	method componerTituloRemix(cancionOriginal) = cancionOriginal.titulo() + " remix"
	
	method componerDuracionRemix(cancionOriginal) = cancionOriginal.duracion() * 3
	
	method componerLetraRemix(cancionOriginal) = "mueve tu cuelpo baby " + cancionOriginal.letra() + " yeah oh yeah"
}

class CancionMashups inherits Cancion{
	constructor(listaDeCanciones) {
		titulo = self.armarTitulo(listaDeCanciones)
		duracion = self.establecerDuracion(listaDeCanciones)
		letra = self.armarLetra(listaDeCanciones)
	}
	
	method armarTitulo(canciones) = canciones.fold("", {titulo, cancion => titulo + cancion.titulo() + " "}).trim()
	method establecerDuracion(canciones) = canciones.max{cancion => cancion.duracion()}.duracion()
	method armarLetra(canciones) = canciones.fold("", {letra, cancion => letra + cancion.letra() + " "}).trim() 	
	
}

object criterioLargoDeLetra {
	method comparaPor(_cancion) = _cancion.largoDeLetra()
}

object criterioDuracion {
	method comparaPor(_cancion) = _cancion.duracion()
}

