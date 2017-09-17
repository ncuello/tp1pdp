class Cancion {
	const titulo
	const duracion
	var letra
	constructor(_titulo, _duracion){
		titulo = _titulo
		duracion = _duracion
	}
	method titulo() = titulo
	method duracion() = duracion
	method letra() = letra
	method letra(_letra) {letra = _letra}
}