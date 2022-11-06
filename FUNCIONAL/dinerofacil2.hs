------ DECLARACIONES ----

data Persona = UnaPersona {
    nombre::String,
    monedas::[(Float, String)],
    satisfaccion::Int
} deriving (Show)

data Producto = UnProducto {
    descripcion::String,
    precio::Float,
    moneda::String
} deriving (Show)

cotizaciones :: [(Float,String)]
cotizaciones = [(1, "peso"), (9, "dolar"), (4, "real"), (8,"euro")]

------

------ 1) PARA ENTRAR EN CALOR

-- a) Obtener tipo de cambio de una moneda
sacarMoneda moneda cotizacion = snd cotizacion == moneda
tipoCambio moneda =  fst (head (filter (sacarMoneda moneda) cotizaciones))

-- b) Convertir un cierto importe ed una moneda a otra
-- Cuanto vale 1 moneda A en moneda B
proporcion monedaA monedaB = monedaA / monedaB
-- monedaSalida es la moneda que vamos a obtener luego
-- monedaEntrada es la moneda que vamos a meter para cambiar
-- el algoritmo es simple:
{-

    1 - sacamos la cantidad de monedas que vamos a meter (fst monedaEntrada)
    2 - sacamos la proporcion entre la monedaEntrada y la monedaSalida, esto nos va a decir cuantas monedasEntrada son las monedasSalida
    3 - esa proporcion la multiplicamos por la cantidad de monedas en entrada

-}
convertirA monedaSalida monedaEntrada = (fst monedaEntrada) * (proporcion (tipoCambio (snd monedaEntrada)) (tipoCambio monedaSalida))

-- c) Obtener cantidad de dinero que tiene una persona en una moneda dada

cacho = UnaPersona {
    nombre = "Cacho",
    monedas = [(100, "dolar"), (50, "peso"), (1, "real")],
    satisfaccion = 1
}

cantidadDe moneda persona = fst ((filter (sacarMoneda moneda) (monedas persona)) !! 0)

-- d) Calcular el total de ahorro de una persona, expresado en pesos.
totalAhorro persona = sum (map (convertirA "peso") (monedas persona))

-- 2) Transacciones

taza = UnProducto {
    descripcion="taza",
    precio=5.0,
    moneda="dolar"
}

tazaArgentina = UnProducto {
    descripcion="taza",
    precio=6.0,
    moneda="peso"
}

vender :: Integer
vender = 1
comprar :: Integer
comprar = -1

--transaccion producto persona accion =