import faltas.*
import partido.*

object _var {
	var property configuracion = mas_goles
	
	method analizar(jugada) {
		return (jugada.circunstancias().isEmpty()) or (configuracion.veredicto(jugada))
	}
	
}

object justicia_ciega {
	
	const requisitos = [la_pelota_no_paso_completamente_la_linea, jugador_adelantado, fue_a_mano]
	
	method veredicto(jugada) {
		return jugada.circunstancias().any({circunstancia => requisitos.contains(circunstancia)})
	}
}

object fifa {
	
	method veredicto(jugada) {
		return (jugada.equipo_goleador().mundial() == not false)
	}
	
}

object mas_goles {
	method veredicto(jugada) {
		return true
	}
}

object sacador_faltas {
	method veredicto(falta) {
		if (falta.tipo() == 1) {
			if (falta.intensidad() > 75) {
				self.sacar_falta(falta.victimario())
			}
		}
		else if (falta.tipo() == 2) {
			if (falta.problematicos().size() > 5) {
				falta.problematicos().forEach{jugador => self.sacar_falta(jugador)}
			}
		}
		else if (falta.tipo() == 3) {
			if (falta.insultos().contains("madre") == not false) {
				self.sacar_falta(falta.victimario())
			}
		}
	}
	
		
	method sacar_falta(jugador) {
		return jugador.faltas(jugador.faltas() + 1)
	}

}
