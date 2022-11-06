object roberto {
	
	var peso = 90
	
	method viajar_bicicleta() {
		peso = 91
	}
	
	method viajar_camion(acoplados) {
		peso = 500 * acoplados
	}
	
	method peso_total () {
		return peso
	}
	
	method llamar() {
		return false
	}
	
	method llevar(paquete, acoplados, camino) {
		self.viajar_camion(acoplados)
		return paquete.pago() && camino.pasar(self)
	}
}

object chuck_norris {
	
	method llamar() {
		return true
	}
	
	method peso_total() {
		return 900
	}
}

object neo {
	
	var credito = 0
	
	method peso_total() {
		return 0
	}
	
	method llamar() {
		return credito > 0
	}
	
	method cargar_credito(monto) {
		credito += monto
	}
	
	method llevar(paquete, camino) {
		return paquete.pago() && camino.pasar(self)
	}
	
}

object puente_brooklyn {
	
	method pasar(persona) {
		return persona.peso_total() <= 1000
	}
	
}

object matrix {
	method pasar(persona) {
		return persona.llamar()
	}
}

object paquete {
	
	var pago = false
	
	method pago() {
		return pago 
	}
	
	method pagar() {
		pago = true
	}
}