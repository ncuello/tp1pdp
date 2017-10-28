import canciones.*
import builders.*

class Album{
	const fecha
	const copiasEditadas
	const copiasVendidas
	const canciones
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
	method cancionMasLarga() = canciones.max {cancion => criterioLargoDeLetra.comparaPor(cancion)}
	
	method buenaVenta() = copiasVendidas > copiasEditadas * 0.75
	
	method cancionMasLargaPorCriterio(_criterio) = canciones.max {cancion => _criterio.comparaPor(cancion)}	
}

