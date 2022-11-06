
object diccionario {

	var palabrasInaceptables = ["matar","asesinar","quemar"]
	
	method esInaceptable(unaPalabra){
		return palabrasInaceptables.contains(unaPalabra)
	}
	
}

class Agresion {
	var property victima
	var property lugar_hechos
	var property autor
	var property palabras
	
	method es_grave() {
		return palabras.any{palabra => diccionario.esInaceptable(palabra)}
	}
	
	method es_ignea() {
		return palabras.any{palabra => palabra == "fuego"}
	}
} 

class AgresionFisica inherits Agresion {
	var elemento
	
	override method es_grave() = true
	
	override method es_ignea() {
		return elemento == "combustible" or super()
	}
}