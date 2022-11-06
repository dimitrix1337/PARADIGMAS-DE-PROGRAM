import mensajeros.*

object empresa {
	
	var empleados = #{}
	var ultimo = null
	var primero = null
	method contratar(empleado) {
		empleados.add(empleado)
		ultimo = empleado
		if (primero == null) {
			primero = empleado
		}


		
	}
	
	method cantidad_empleados() {
		return empleados.size()
	}
	
	method ver_empleados() {
		return empleados
	}
	
	method ultimo() {
		return ultimo
	}
	 
	method primero() {
		return primero
	}

	method despedir(empleado) {
		if (primero == empleado) {
			primero = null
			empleados.remove(empleado)
			if (empleados.size() > 0) {
				empleados.forEach({emp => if (primero == null) { primero = emp }})
			}

		} else if (ultimo == empleado) {
			ultimo = null
			empleados.remove(empleado)
			if (empleados.size() > 0) {
				empleados.forEach({emp => if (ultimo == null) { ultimo = emp}})
			}

		}
		else { empleados.remove(empleado) }

	}

	method grande() {
		return empleados.size() > 2
	}
	
	method despedir_todos() {
		empleados = #{}
		primero = null
		ultimo = null
	}
	
	method entregar(empleado, camino) {
		return camino.pasar(empleado)
	}
	
	method peso_ultimo() {
		return ultimo.peso_total()
	}
	
	method primero_entregar(pack) {
		return (puente_brooklyn.pasar(primero) || matrix.pasar(primero)) && pack.pago()
	}
	
}
