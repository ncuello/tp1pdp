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
	method cancionMasLarga() = canciones.max {cancion => cancion.largoDeLetra()}
	
	method buenaVenta() = copiasVendidas > copiasEditadas * 0.75
	
	method cancionMasLargaPorCriterio(_criterio) = canciones.max {cancion => cancion.comparaPor(_criterio)}

}

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