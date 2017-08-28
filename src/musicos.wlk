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
		 if (presentacion.cantantes().contains(self) && presentacion.cantantes().size() == 1)
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
/* 
object fender {
	const valor = 10
	method valor() = valor
}
object gibsonSana {
	const valor = 15
	method valor() = valor
}
object gibsonNoSana {
	const valor = 5
	method valor() = valor
}
*/

/** 
* LOS OBJETOS DECLARADOS A CONTINUACIÓN SON DE PRUEBA

class Guitarra {
	var valor
	method valor() = valor
	method valor(_valor) {valor = _valor}
}

object cancion1 {
	const letra = "Familia Hoy el viento se abrió quedó vacío el aire una vez más y 
					el manantial brotó y nadie está aquí y puedo ver que solo 
					estallan las hojas al brillar"
	method letra() = letra
}

object cancion2 {
	const letra = "Quiero brindar
por mi gente sencilla, por el amor brindo por la familia"
	method letra() = letra
}

object presentacion1 {
	const fecha = new Date(26,9,2017)
	const lugar = lunaPark
	const cantantes = [joaquin]
	
	method cantantes() = cantantes
	method lugar() = lugar
	method fecha() = fecha
}

object lunaPark
{
	const capacidad = 29200
	
	method capacidadTotal() = capacidad 
	method esConcurrido() = capacidad > 500 
	
}
*/


/*class Musico {
	var grupo
	var habilidad
	var gananciaMusico

	method grupoMusico() = grupo 	//getter
	method grupoMusico(unGrupo) { 	//setter
		grupo = unGrupo
	}

	method habilidadMusico() = habilidad 	//getter
	method habilidadMusico(unaHabilidad) { 	//setter
		habilidad = unaHabilidad
	}

	method gananciaMusico() = gananciaMusico 	//getter
	method gananciaMusico(unaGananciaMusico) { 	//setter
		gananciaMusico = unaGananciaMusico
	}
} 
  
const joaquin = new Musico() 
const lucia = new Musico() 
const luisAlberto = new Musico()

object joaquin{
	
	var grupo = "Pimpinela"
	var habilidad = 20
	
	
	method habilidadMusico(){        //No sé si así estoy indicando que canta/toca solo
		if (comoToca != "solo"){
			return habilidad + 20
		}
		else{
			return habilidad
		}
	}
	
	method interpretaBien(cancion) = duracion.cancion > 300  //300 segundos
	
	method gananciaMusico(comoToca){
		if(comoToca == "solo"){		//No sé si así estoy indicando que canta/toca solo
			return 100
		} 
		else{
			return 50
		}
	
	}
	
}
	
object lucia{
	
	var grupo = "Pimpinela"
	var habilidad = 70
	
	method habilidadMusico(){
		if (comoToca == "solo"){
			return habilidad
		}
		else{
			return habilidad - 20
		}
	}
	
	method interpretaBien(cancion) = titulo.cancion == "familia" || titulo.cancion == "Familia" || titulo.cancion == "FAMILIA"
	
	method gananciaMusico(lugar) {
		if(esConcurrido(lugar) == true){
			return 500
		}
		else{
			return 400
		}
	}
	
}
	
	
object luisAlberto{
	
	const valorInstrumento
	var instrumento
	var habilidad
	
	method valorInstrumento(instrumento){
		if(instrumento == "Fender"){
			return 10
		}
		if(instrumento == "Gibson"){
			if(estaEnBuenEstado(instrumento) == true){
				return 15
			}
			else{
				return 5
			}
		}
	}
	
	method habilidadMusico(){
		habilidad = 8 * valorInstrumento(instrumento)
		if(habilidad > 100){
			return 100
		}
	}
	
	method interpretaBien(cancion) = true
	
	method gananciaMusico //Hay que poner fechas
}
*/	
	
	
	
	
	
