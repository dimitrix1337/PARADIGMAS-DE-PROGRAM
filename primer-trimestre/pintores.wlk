object aldo {
	
	var ahorros = 6000
	
	method buscar_presupuesto(pintor,metros, _pintura) {
		
		var precio = pintor.presupuesto(metros, _pintura)
		
		return precio
		
	}
	
	method alcanza(precio) {
		 return precio <= self.presupuesto_maximo()
	}
	
	method ahorrar(monto) {
		ahorros += monto
	}
	
	method presupuesto_maximo() {
		return ahorros * 0.2
	}
	
}

object raul {
	method presupuesto(metros, _pintura) {
		return 25*metros + _pintura.costo(metros)
	}
}

object carlos {
	method presupuesto(metros, _pintura) {
		return (500 + (metros-20)*30).max(500)
	}
}

object venencio {
	method presupuesto(metros, _pintura) {
		return 220*(metros/10).roundUp(0) + _pintura.costo(metros)
	}
}

object pintura {
	
	var precio = 200
	
	method latas(metros) {
		return (metros/50).roundUp(0)
	}
	
	method costo(metros) {
		return self.latas(metros) * precio
	}
	
	method set_precio(_precio) {
		precio = _precio
	}
}

object pintura_granel {

	
	method costo(metros) {
		return metros * 3.5
	}
}

object superficie {
	method calcular(alto, largo, ancho) {
		return (largo + ancho) * 2 * alto
	}
}
