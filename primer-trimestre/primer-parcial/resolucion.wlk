	
	method cantidad_biomasa() {
		return habitats.sum({habitat => habitat.total_biomasa()})
	}
	
	method almenos_un_habitat_sin_equilibrio() {
		return habitats.any({habitat => not habitat.esta_en_equilibrio()})
	}
	
	method esta_en_todos_los_habitats(especie) {
		return habitats.all({habitat => habitat.esta_en_alguno(especie)})
	}
	
	method agregar_habitat(habitat) {
		habitats.add(habitat)
	}
}

class Habitats {
	var property todos_los_seres_vivos
	
	method total_biomasa() {
		return todos_los_seres_vivos.sum({ser_vivo => ser_vivo.calcular_biomasa()}) 
	}
	
	method esta_en_equilibrio() {
		return (self.ejemplares_grandes() < 0.3*self.organismos_vivos()) and (self.organismos_vivos() > self.organismos_muertos())
	}
	
	method organismos_vivos() {
		return todos_los_seres_vivos.filter({organismo => organismo.vivo()}).size()
	}
	
	method organismos_muertos() {
		return todos_los_seres_vivos.filter({organismo => not organismo.vivo()}).size()
	}
	
	method esta_en_alguno(especie) {
		return todos_los_seres_vivos.contains(especie)
	}
	
	method ejemplares_grandes() {
		return todos_los_seres_vivos.filter({ser_vivo => ser_vivo.es_grande()}).size()
	}
	
	method ejemplares_pequenios() {
		return todos_los_seres_vivos.filter({ser_vivo => ser_vivo.es_pequenio()}).size()
	}
	
	method incendiar() {
		todos_los_seres_vivos.forEach({ser_vivo => ser_vivo.quemar()})
	}
	
}

class Especie {
	var property tipo
	var property edad
	var property vivo
	
	method calcular_biomasa() { return 0 }
	method es_grande() { return 0 }
	method es_pequenio() { return 0 }
	method quemar() {}
}

class Planta inherits Especie {
	var property altura
	
	override method calcular_biomasa() {
		if (vivo) {
			return edad	
		} else {
			return 0
		}
		
	}
	
	override method es_grande() {
		return altura > 10
	}
	
	override method es_pequenio() {
		return altura < 10
	}
	
	override method quemar() {
		if (self.es_grande()) {
			altura -= 5	
		} else {
			vivo = false
		}
	}
}

class Animal inherits Especie {
	var property peso
	var property forma_moverse
	
	override method calcular_biomasa() {
		if (vivo) {
			return peso+edad
		} else {
			return 0
		}
	}
	
	override method es_grande() {
		return peso > 60 and edad > 10
	}
	
	override method es_pequenio() {
		return peso < 30
	}
	
	override method quemar() {
		if (self.forma_moverse() == "quieto" or self.forma_moverse() == "correr" and (self.es_grande() or self.es_pequenio())) {
			vivo = false
		}
		peso = peso * 0.9
	}
	
} 


/* AGREGANDO HONGOS 
 * Si se agregan hongos como una especie similar a plantas pero sus metodos actuarian distintos haria =>
 * Crear una nueva especie llamada Hongos pero heredaria de la clase planta para obtener sus atributos y metodos
 * ya que los hongos son similares a las plantas, y si necesitaria cambiar algun comportamiento de un metodo de la planta, simplemente haria un override de la clase
 * padre planta en el metodo a cambiar.
 * 
 * 
 * */

class Hongo inherits Planta {
	override method calcular_biomasa() {
		if (vivo) {
			return edad*2
		} else {
			return 0
		}
	}
}
