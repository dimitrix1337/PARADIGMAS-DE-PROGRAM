/*  RECOMIENDO LEER JUNTAMENTE ESTO: 
 *  Objetos => https://www.wollok.org/documentacion/conceptos/#objetos-autodefinidos
 *  Clases => https://www.wollok.org/documentacion/conceptos/#objetos-autodefinidos
 *  Colecciones y conjuntos => https://www.wollok.org/documentacion/conceptos/#objetos-autodefinidos
 * 
 * 	PARADIGMA PROGRAMACION ORIENTADO A OBJETOS
 * 
 *  ¿ QUE ES ? ES UN PARADIGMA DE PROGRAMACIÓN DONDE NOS ENFOCAMOS EN VER TODO COMO UN OBJETO.
 *  
 *  ES DECIR, UN OBJETO CONTIENE ATRIBUTOS O PROPIEDADES Y METODOS O FUNCIONES.
 * 
 *  LOS OBJETOS SE ENVIAN MENSAJES ENTRE SI, ESTOS SON LOS LLAMADOS A SUS METODOS.
 *  EJEMPLO => miNumero.sumar(otroNumero), al objeto miNumero le ENVIO el mensaje SUMATE con este otroNumero.
 *  
 *  CONTAR MENSAJES =>
 *  var A = miNumero
 *  var B = (A + 5)-(A*2)
 *  ACA HAY 3 MENSAJES, A SUMATE CON 5, (A+5) RESTATE CON (A*2) Y A MULTIPLICATE CON 2.
 * 
 *  Dicho por la documentacion =>
 *  "Uno de los conceptos más importantes de la programación orientada a objetos son los mensajes. En Wollok, (casi) todo lo que uno hace es enviar mensajes a objetos."
 */
 
 
 /*
   * OBJETO = un objeto es un modelo referenciado a algo que nosotros querramos, codificado y que se comporte como eso.
   * 
   * LOS OBJETOS CONTIENEN 2 GRANDES APARTADOS 
   * 1) ATRIBUTOS, VARIABLES DE LA INSTANCIA "COMO ES EL OBJETO? QUE PROPIEDADES FISICAS TIENE? QUE CONTIENE?"
   * 2) METODOS O FUNCIONES, FUNCIONES DE LA INSTANCIA "QUE HACE EL OBJETO? PARA QUE SIRVE?"
   * 
   * TIPS:
   * 1) un objeto puede heredar una clase.
   * 
   * 2) los objetos no pueden heredarse entre si.
   * 
   * 3) los objetos son solo 1 y no pueden instanciarse.
   * 
   * 4) si varios punteros apuntan al objeto este siempre sera el mismo objeto, si queremos una variante deberiamos hacer una clase
   * o crear otro objeto similar pero con otro nombre.
   * 
   * 5) los objetos pueden intercambiarse entre si en una variable, ejemplo =>
   * var mi_objeto = objeto1
   * mi_objeto = objeto2
   * 
   * 6) los objetos pueden sobreescribir metodos de clase padre.
   * 
   * 7) para acceder desde un objeto a un metodo padre debemos utilizar SUPER().
   * 
   * 8) los objetos no tienen constructor.
   */
  
 /*
  * CLASE = una clase es como un modelo a seguir , un molde para generar objetos derivada de esta clase.
  * 
  * LAS CLASES TAMBIEN CONTIENEN PROPIEDADES Y METODOS.
  * 
  * TIPS:
  * 1) una clase puede heredar de otra clase.
  * 
  * 2) una clase NO puede heredar de un objeto.
  * 
  * 3) en los herederos se pueden sobreescribir metodos de la clase padre utilizando el keyword OVERRIDE
  * 
  * 4) una clase puede contener infinitas instancias o hijos.
  * 
  * 5) las clases pueden tener constructor.
  * 
  * 6) las clases NO pueden cambiarse. ejemplo =>
  * var mi_clase = clase1
  * INVALIDO => mi_clase = clase2 (NO SE PUEDE!!)
  * 
  * 7) las clases deben inicializar el nombre con mayuscula por convención.
  * 
  * 8) las clases abstractas son clases que contienen metodos sin implementarse, osea sin escribir codigo adentro.
  */
  
	 /*
	* EXCEPCIONES
	* 
	* ¿QUE ES? UNA EXCEPCION ES UN ERROR QUE LANZA EL PROGRAMA AL EJECUTAR UNA OPERACIÓN NO VALIDA
	* 
	* COMO SE MANEJA? A ESTO SE LE LLAMA HANDLING EXCEPTIONS, SIRVE PARA MANEJAR ERRORES Y MOSTRARLOS DE MANERA MAS AMIGABLE PARA EL USUARIO O
	* PARA REALIZAR OTRAS COSAS AL SUCEDER Y NO FINALIZAR LA EJECUCION DEL PROGRAMA.
	* 
	* UN ERROR DEBE MOSTRARSE CORRECTAMENTE, SER LEGIBLE Y A TIEMPO.
	* 
	* SE PUEDEN CREAR DERIVACIONES DE EXCEPCIONES HEREDEANDO EXCEPTIONS =>
	* 
	* COMO CONVENCION SE UTILIZA CAMEL CASE Y EXCEPTION AL FINAL!
	* 
	* class MiNombreException inherits Exception{}
	* 
	* luego para lanzar utilizo el keyword THROW MiErrorException
	* 
	* => Throw MiNombreException(message="Aca va el mensaje del error")
	* 
	* ¿QUE ES EL STACK TRACE? Es la traza del error, es decir su recorrido previamente antes de lanzar el error y hasta donde llego.
	* Para que me sirve? para identificar cual es la potencial ubicacion del error.
	* 
	* Los errores BURBUJEAN para arriba, y estos se pueden atrapar con el CATCH, utilizando Try {} Catch error {}
	* 
	* Try sirve para utilizar un bloque de codigo y decirle "Intentá hacer esto"
	* y el Catch es como "Si no podes realizar el try y lanzaste un error veni para aca"
	*/
  
  /*
   * GLOSARIO GENERAL =>
   * ¿Cual es la diferencia entre clase y objeto? En wollok, la diferencia es que una clase es un modelo a seguir para las instancias generadas
   * o los herederos, y un objeto es una instancia de una clase.
   * Tabla de diferencias -
   * -				 					CLASE          - OBJETO
   *   Puede heredarse			  		  SI			   NO
   *   Puede sobreescribir metodos		  SI               SI 
   *   Puede instanciarse				  SI			   NO
   *   Puede ser creado en ejecucion      SI			   NO
   *   Puede usar Super() y Self	      SI			   SI	
   * -------------------------------------------------------------------------------------------------
   * ¿Que es una propiedad? una propiedad es una cualidad o caracteristica de un objeto o clase.
   * ¿Que es un metodo? Un metodo es una accion que puede realizar una clase o un objeto.
   * ¿Que es un getter? Un getter es una funcion que retorna el valor de una variable deseada.
   * ¿Que es un setter? Un setter es una funcion que asigna el valor a una variable deseada.
   * ¿Como obtengo un getter y un setter de una variable implicitamente? Utilizando el keyword PROPERTY luego del tipo variable y antes del nombre (var property mi_nombre).
   * ¿Que hace Super()? Super() llama al mismo metodo pero en la clase padre.
   * ¿Que hace Self? Self hace referencia al objeto mismo.
   * ¿Que diferencia hay entre una coleccion y un conjunto? Que la coleccion pueden repetirse los datos, en cambio el conjunto no puede repetirse y no tienen orden.
   * ¿Como importo un .wlk ? Simplemente utilizo arriba de todo "Import nombre_archivo.*"
   * 
   *
   *  METODO == FUNCION
   *  ATRIBUTO == PROPIEDAD (AUNQUE SEGUN WOLLOK UNA PROPIEDAD ES UN ATRIBUTO CON EL KEYWORD PROPERTY)
   */

 
