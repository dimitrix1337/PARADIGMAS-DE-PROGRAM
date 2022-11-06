object delfina {

  var diversion = 0
  var consola_en_uso = play
  
  method jugar(videojuego) {
    diversion += videojuego.diversion(consola_en_uso.jugabilidad())
    consola_en_uso.usar()
  }
  
  method agarrar(consola) {
    consola_en_uso = consola
  }
  
  method diversion () {
    return diversion
  }
}

object play {
  
  method jugabilidad() {
    return 10
  }
  
  method usar() {
  }
}

object portatil {

  var bateria = 1
  
  method jugabilidad() {
    return 8**bateria
  }
  
  method usar() {
    bateria = 0
  }
}

object arkanoid {
  method diversion(jugabilidad) {
    return 50
  }
}

object mario {
  method diversion(jugabilidad) {
    if (jugabilidad > 5) {
      return 100    
    } else {
      return 15
    }
  }
}

object pokemon {
  method diversion(jugabilidad) {
    return jugabilidad*10
  }
}