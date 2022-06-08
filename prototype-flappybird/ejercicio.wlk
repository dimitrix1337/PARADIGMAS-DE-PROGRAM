object barrioDelta{
	var habitantes = [tito, dani, ana]
	method edadPromedio(){
		var sumaEdades = 0
		habitantes.forEach({personas=> sumaEdades = sumaEdades + personas.edad()})
		return sumaEdades/habitantes.size()
	}
	method nombreMasLargo(){
		return habitantes.max({personas => personas.nombre().size()})
	}
	method eleganteDelBarrio(){
		return habitantes.forEach({personas => personas.elegante()})
	}
}
object tito {
	var edad = 10
	const nombre= "Timoteo"
	method elegante()= edad >= 11 
	method cumplirAnios(){edad += 1}
	method edad()= return edad
	method nombre()= return nombre
	
}

object dani {
	const edad = 77 
	const nombre = "Daniel"
	method nombre() = return nombre
	method edad() = return edad
	method elegante() = return true 
}

object ana {
	const edad = 33
	var nombre = "ana"
	method elegante(){
		return nombre.reverse() == nombre
	}
	method setnombre(_nombre){
		nombre = _nombre
	}
	method nombre() = return nombre
	method edad() = return edad
}
