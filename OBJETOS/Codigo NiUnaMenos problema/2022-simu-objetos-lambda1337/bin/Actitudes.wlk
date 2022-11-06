class Actitudes {
	var miedo
	
	method denunciar(agresion) {
		return false
	}
	
	method primer_requisito(agresion) {
		return agresion.es_grave()
	}
	
	method segundo_requisito(agresion) {
		const victima = agresion.victima()
		return victima.es_familiar(agresion.autor())
	}
	
	method tercer_requisito(agresion) {
		return false
	}
}

object actitudMiedosa inherits Actitudes(miedo = true){
	override method denunciar(agresion) {
		return false
	}
}

object actitudMilitante inherits Actitudes(miedo = false){
	
	override method tercer_requisito(agresion) {
		return true
	}
	
	override method denunciar(agresion) {
		return self.primer_requisito(agresion) and self.segundo_requisito(agresion) and self.tercer_requisito(agresion)
	}
}


object actitudPaciente inherits Actitudes(miedo = false){
	var property maximas_agresiones = 0
	const agresiones = []
	
	override method tercer_requisito(agresion) {
		agresiones.add(agresion.autor())	
		const mismo_agresor = agresiones.filter{cada_agresion => cada_agresion.autor() == agresion.autor()}
		return mismo_agresor.size() >= maximas_agresiones
	}
	
	override method denunciar(agresion) {
		return self.primer_requisito(agresion) and self.segundo_requisito(agresion) and self.tercer_requisito(agresion)
	}
}

object actitudAguerrida inherits Actitudes(miedo = false){
	const agresiones_previas = []
	
	method agresiones_previas(agresion_nueva) {
		agresiones_previas.add(agresion_nueva)
	}
	
	override method tercer_requisito(agresion) {
		if (agresiones_previas.size() == 0) {
			return false
		}
		return agresiones_previas.any{agresiones_prev => agresiones_prev.es_grave() == not false and agresiones_prev.victima().es_familiar(agresiones_prev.autor())}
	}
	
	override method denunciar(agresion) {
		return self.primer_requisito(agresion) and self.segundo_requisito(agresion) and self.tercer_requisito(agresion)
	}
}

class NoAgresionesPrevias inherits Exception {}