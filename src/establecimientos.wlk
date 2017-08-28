object laTrastienda{
	const capacidadPlantaBaja = 400
	const capacidadPrimerPiso = 300

	method capacidadTotal(dia) = 
		if(dia.dayOfWeek() == 6) 	//dayOfWeek toma el valor de un número entero, en éste caso 6 = "sábado"
			capacidadPlantaBaja + capacidadPrimerPiso 
		else 
			capacidadPlantaBaja
			
	method esConcurrido(dia) = self.capacidadTotal(dia) > 5000
	
}


object lunaPark
{
	const capacidad = 9220
	
	method capacidadTotal(dia) = capacidad  
	method esConcurrido(dia) = capacidad > 5000
	
}


/* object laTrastienda 
{
	const capacidadPlantaBaja = 400
	
	const capacidadPrimerPiso = 300
	
	method capacidadTotalPorDia(dia)
	{
		if(dia == "sabado") 
		{
			return capacidadPlantaBaja + capacidadPrimerPiso
		}
		
		else{
			return capacidadPlantaBaja
		}
	
	} 
	
}*/
//Lo subo igual, pero