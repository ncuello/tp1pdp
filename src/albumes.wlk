import canciones.*
class Album{
	const fecha
	const copiasEditadas
	const copiasVendidas
	const canciones
	var autor
	constructor(_fecha, _copiasEditadas, _copiasVendidas, _canciones){
		fecha = _fecha
		copiasEditadas = _copiasEditadas
		copiasVendidas = _copiasVendidas
		canciones = _canciones
	}
	method fecha() = fecha
	method copiasEditadas() = copiasEditadas
	method copiasVendidas() = copiasVendidas	
	method canciones() = canciones
	
	method todasLasCancionesSonCortas() = canciones.all {cancion => cancion.esCorta()}
	method duracion() = canciones.sum {cancion => cancion.duracion()}
	method cancionMasLarga() = canciones.max {cancion => cancion.contenidoDeLetra()}.titulo()
//	method cancionMasLarga() = self.cancionMasLarga2().titulo()
	method buenaVenta() = copiasVendidas > copiasEditadas * 0.75
	method contienePalabra(palabra) = canciones.filter {cancion => cancion.letraContiene(palabra)}
	
	method autor() = autor
	method autor(_autor) { autor = _autor }
	
	method agregarAutorACancion() = self.canciones().forEach {cancion => cancion.autor(self.autor())}
	
	method agregarAutor(musico) = self.canciones().forEach {cancion => cancion.autor(musico)}
								 
}