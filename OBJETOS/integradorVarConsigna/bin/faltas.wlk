class Jugadas {
	var property equipo_goleador
	var property ultimo_jugador_pelota
	var property minuto_partido
	var property circunstancias = [ninguna]
}

object ninguna {}
object la_pelota_no_paso_completamente_la_linea {}
object jugador_adelantado {}
object fue_a_mano {}

class Tarjeta {
	var property minuto
}

class Falta_normal inherits Tarjeta {
	var property tipo = 1
	var property victima
	var property victimario
	var property intensidad
}

class Pelea_cancha inherits Tarjeta {
	var property tipo = 2
	const property problematicos = []
}

class Insulto inherits Tarjeta {
	var property tipo = 3
	var property victimario
	const insultos = []
}