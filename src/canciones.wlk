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
	
	method letraContiene(palabra) = letra.toLowerCase().contains(palabra)
	method esCorta() = duracion < 180
	method contenidoDeLetra() = letra.length()
}