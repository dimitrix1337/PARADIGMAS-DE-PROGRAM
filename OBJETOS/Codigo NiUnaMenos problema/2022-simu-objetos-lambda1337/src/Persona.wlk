import Actitudes.*
import Policia.*
class Persona {
	var property actitud
	const agresiones = []
	const familiares = #{}
	
	method recibir_agresion(agresion) {
		self.denunciar(agresion)
		agresiones.add(agresion)			
		if (actitud == actitudAguerrida)
 		{
 			actitud.agresiones_previas(agresion)
 		}	
 }
	
	method agregar_familiar(persona) {
		familiares.add(persona)
	}
	
	method es_familiar(persona) {
		return familiares.any{familiar => familiar == persona}
	}
	
	method denunciar(agresion) {
		if (actitud.denunciar(agresion) == not false) {
			policia.agregar_denuncia(agresion)
		}
	}
	
	method participar_evento(evento) {
		if (evento.objetivo() == "defender victimas") {
			actitud = actitudMilitante
		}
	}
	
	method acompaniada(persona) {
		actitud = persona.actitud()
	}
	
	method amenazar_de_muerte() {
		if (actitud == actitudPaciente) {
			actitud.maximas_agresiones(actitud.maximas_agresiones()*2)
		}
		if (actitud == actitudAguerrida) {
			actitud = actitudPaciente
			actitud.maximas_agresiones(5)
		}
		if (actitud == actitudMilitante) {
			actitud = actitudAguerrida
		}
		
	}
}

class Evento {
	var property objetivo

}

class NoFamiliarExistsException inherits Exception {}