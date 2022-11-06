object georginho {
    var peso = 70
    var rendimiento
    var inercia = 490
    
  method consumir(cantidad, sustancia) {
    rendimiento = sustancia.rendimiento(cantidad)
  }
  method velocidad() {
    return (rendimiento * inercia) / peso
  }
}

object whisky {
  method rendimiento(cantidad) {
    return 0.9 ** cantidad
  }
}

object terere {
  method rendimiento(cantidad) {
    var rendimiento = cantidad*0.1
    return rendimiento.max(1)
  }
}

object cianuro {
  method rendimiento(cantidad) {
    return 0
  }
}