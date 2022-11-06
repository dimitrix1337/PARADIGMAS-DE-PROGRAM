object jerry {
  var peso = 3
  var posicion = 10

  method velocidad() {
    return (10 - peso)
  }

  method posicion() {
    return posicion
  }
}

object tom {
  var energia = 80
  var posicion = 0
  // TOM NO TIENE ATRIBUTO VELOCIDAD, LO TOMAMOS DEL METODO VELOCIDAD() ESTE RETORNA LA VELOCIDAD EN BASE AL ALGORITMO DE LA ENERGIA PEDIDO
  method velocidad() {
       // esto es para actualizar la velocidad de tom ya que la energia cambia y su velocidad posterior debe cambiar
       // por eso no se le pide atributo a tom
    return 5 + (energia/10)
  }

   method posicion() {
    return posicion
  }

  method esMasVeloz(raton) {
  // debemos llamar a la velocidad de tom con su metodo, tom.velocidad() ya que este es un metodo adentro de tom, no puede ser solamente velocidad() debe ser tom.velocidad()
    return tom.velocidad() > raton.velocidad()
  }

  method correrA(raton) {
  // le saque () a los atributos de tom, es decir antes estaba posicion() ahora posicion solo, en teoria es lo mismo pero bueno, wollok es medio rarito supongo o haria falta el Self que llamaria a la funcion posicion() adentro de TOM.
  
  // valor absoluto porque en la consigna dice que tom corre a robotRaton yluego a Jerry, por lo tanto cuando corre a robotRaton queda 2 posiciones mas ADELANTE qeu jerry, y al hacer la resta de posicion queda todo negativo, entonces le metemos el valor absoluto como .abs() para que SIEMPRE sea positivo
  // en este caso si pongo posicion solo porque no es un METODO es un atributo y los atributos si pueden ser llamados por su nombre y NO HACE FALTA poner tom.posicion .
     var distancia = (raton.posicion() - posicion).abs()
     // devuelta tom.velocidad() para obtener la velocidad de TOM mediante su metodo velocidad()
     var energia_consumida =  0.5 * tom.velocidad() * distancia
     // le sacamos la energia gastada a tom
     energia = energia - energia_consumida
     // actualizamos la posicion de tom a la misma del raton alcanzado
     posicion = raton.posicion()

  }

}

object robotRaton {
  var posicion = 12
  const velocidad = 8

  method velocidad() {
    return velocidad
  }

  method posicion() {
    return posicion
  }

}