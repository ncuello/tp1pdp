class MusicoDeGrupo{
	var habilidad = 20
	var grupo = "Pimpinela"
	var tocaEnGrupo
	
	method grupo() = grupo
	method grupo(_grupo) {grupo = _grupo}
	 
	method habilidad() =       
		if (grupo != null)
			return habilidad + 5
		else
			return habilidad
		
	method interpretaBien(cancion) = cancion.duracion() > 300  //300 segundos
	 
	method ganancia(presentacion) =	
		 if (presentacion.esUnicoEnPresentacion(self))
		 	return 100
		 else 
		 	return 50		
}

object joaquin{
	var habilidad = 20
	var grupo = "Pimpinela"
	
	method grupo() = grupo
	method grupo(_grupo) {grupo = _grupo}
	 
	method habilidad() =       
		if (grupo != null)
			return habilidad + 5
		else
			return habilidad
		
	method interpretaBien(cancion) = cancion.duracion() > 300  //300 segundos
	 
	method ganancia(presentacion) =	
		 if (presentacion.esUnicoEnPresentacion(self))
		 	return 100
		 else 
		 	return 50		 
}

object lucia {
	var habilidad = 70
	var grupo = "Pimpinela"
	
	method grupo() = grupo
	method grupo(_grupo) {grupo = _grupo}
	
	method habilidad() =
		if (grupo != null)
			return habilidad - 20
		else
			return habilidad
		
	method interpretaBien(cancion) = cancion.letra().toLowerCase().contains("familia")
	method ganancia(presentacion) = 
		if (presentacion.establecimiento().esConcurrido(presentacion.fecha()))
			return 500
		else
			return 400 //ncuello
}

object luisAlberto {
	var guitarra
	var fechaLimite = new Date(1,9,2017)
	method guitarra() = guitarra
	method guitarra(_guitarra) {guitarra = _guitarra}
	
	method habilidad() = 100.min(8 * guitarra.valor()) 
	method interpretaBien(cancion) = true
	method ganancia(presentacion) =
		if (presentacion.fecha() < fechaLimite)
			return 1000
		else
			return 1200
}

	
	
	
	
