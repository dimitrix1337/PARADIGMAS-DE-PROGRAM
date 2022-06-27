class Denuncia{

	var property numero
	var property agresion
	var property autor
	var property victima 
		
}

object policia{
	const denuncias_registradas = []
	
	// creo un metodo agregar_denuncia que agregue al listado de las denuncias de los policias la nueva agresion
	method agregar_denuncia(agresiones) {
		denuncias_registradas.add(new Denuncia(
			agresion = agresiones, autor = agresiones.autor(),
			 numero= denuncias_registradas.size() + 1,
			  victima = agresiones.victima()
		))
	}
	
	// Para saber si la denuncia quedo registrada, creo un metodo que me edvuelva un booleano si existe una denuncia donde cumple la victima
	method denuncia_registrada_por(victima) {
		return denuncias_registradas.any{denuncia => denuncia.victima() == victima}
	} 
	
}
