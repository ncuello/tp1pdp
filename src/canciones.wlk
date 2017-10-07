class Cancion {
	var titulo
	var duracion
	var letra
	var criterioParaComparar = new LargoDeLetra()
	var cancionRemix = new CancionRemix()
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
	
	method modificarCancion(_cancion){
		cancionRemix = _cancion
	}
	
	method transformarARemix(_cancion){
		self.modificarCancion(_cancion)
		cancionRemix.titulo(self.titulo() + " remix")
		cancionRemix.duracion(self.duracion() * 3)
		cancionRemix.letra("mueve tu cuelpo baby " + self.letra() + " yeah oh yeah")
//		titulo = self.titulo() + " remix"
//		duracion = self.duracion() * 3
//		letra = "mueve tu cuelpo baby " + self.letra() + " yeah oh yeah"
		return cancionRemix
	} 
}
class CancionRemix {
	var titulo
	var duracion
	var letra
	constructor()
	constructor(_titulo, _duracion, _letra){
		titulo = _titulo
		duracion = _duracion
		letra = _letra
	}
	
	method titulo() = titulo
	method duracion() = duracion
	method letra() = letra
	method titulo(_titulo){titulo = _titulo}
	method duracion(_duracion){duracion = _duracion}
	method letra(_letra){letra = _letra}
}
class LargoDeLetra {
	method comparaPor(_cancion) = _cancion.largoDeLetra()
}

class Duracion {
	method comparaPor(_cancion) = _cancion.duracion()
}