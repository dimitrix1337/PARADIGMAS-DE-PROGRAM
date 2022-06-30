import varGol.*
import faltas.*

class Partido {
	const jugadas = []
	var property local
	var property visitante
	var property goles_local
	var property goles_visitante
	var property var_configuracion
	var property finalizado
	var property ganador
	var property perdedor
	var property jugadas_primer_tiempo = []
	var property jugadas_segundo_tiempo = []
	var property minuto
	
	method meter_gol(jugada) {
		if (var_configuracion.analizar(jugada) == not false) {
			if (jugada.equipo_goleador() == self.visitante()) {
				self.goles_visitante(self.goles_visitante() + 1)
			} else {
				self.goles_local(self.goles_local() + 1)
			}
			if (minuto > 45) {
				jugadas_segundo_tiempo.add(jugada)
			} else {
				jugadas_primer_tiempo.add(jugada)
			}
			return "Gol!"
		} else {
			return "No fue gol."
		}
	}
	
	method faltas_totales_por_equipo() {
		const faltas_local = local.jugadores().sum{jugador => jugador.faltas()}
		const faltas_visitante = visitante.jugadores().sum{jugador => jugador.faltas()}
		return [faltas_local, faltas_visitante]
	}
	
	method resultado_final() {
		if (finalizado) {
			if (goles_local > goles_visitante) {
				ganador = local
				perdedor = visitante
			}
			else if (goles_local < goles_visitante) {
				ganador = visitante
				perdedor = local
			}
			else {
				ganador = null
				perdedor = null
			}
		}
	}
	
	method puntos_por_equipo(equipo) {
		if (equipo == ganador) {
			return 3
		} else if (equipo == perdedor) {
			return 0
		} else {
			return 1
		}
	}
	
	method mas_jugadas_segundo_tiempo() {
		return jugadas_segundo_tiempo.size() > jugadas_primer_tiempo.size()
	}
}

class Equipo {
	var property nombre
	var property mundial
	var property jugadores = []
}

class Jugador {
	var property nombre
	var property faltas
	var property equipo
}

