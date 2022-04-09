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
		if (metros < 20) {
			return 500
		} else {
			return 500 + (metros-20)*30
		}
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


/*Algunas pinturerías trabajan con el sistema de pintura “a granel”, 
 * que permite fraccionar la cantidad de litros que son necesarias para una superficie. 
 * El costo por litro es de 3,50, y cada litro cubre un metro cuadrado.
 */

object superficie {
	method calcular(alto, largo, ancho) {
		return (largo + ancho) * 2 * alto
	}
}
/*  Aldo necesita pintar su casa, para lo cual salió urgente a buscar presupuestos. Un amigo le recomendó a Raúl, 
 * quien trabaja desde hace años en el rubro, es prolijo y deja la casa en orden al terminar su actividad;
 *  cobra $25 por metro cuadrado, más el costo de la pintura (ver en próximos párrafos). 

También consiguió el dato de Carlos, que cobra como mínimo $500 hasta una superficie de hasta 20 metros cuadrados, y a partir de allí $30 por cada metro cuadrado adicional. Veamos entonces cómo es el cálculo del costo de mano de obra 
para pintar 15 m2 se debe considerar el monto mínimo: $ 500, 
para pintar 32 m2 se debe considerar $ 500 + ($30 x 12 que es el excedente de los 20 m2 ) = $ 860. 
El costo de la pintura corre por su cuenta, porque tiene sus propios arreglos con los empresarios. 

Y a último momento se sumó Venancio, que cobra $ 220 cada 10 m2 más el costo de la pintura. Esto significa que el costo de mano de obra para pintar una superficie de 32 m2 asume el costo de una superficie de 40 m2 (4 x $ 220 = $ 880).

Como todo el mundo sabe, una lata de pintura rinde 50 metros cuadrados y actualmente cuesta $200, pero es probable que el precio aumente. Las latas se compran enteras, no se pueden fraccionar.*/
