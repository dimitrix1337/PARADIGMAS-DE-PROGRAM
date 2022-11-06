-- 1 PRACTICA

data Jugador = UnJugador {
    motivado::Bool,
    habilidad::Integer
} deriving (Show)

messi = UnJugador {
    motivado = False,
    habilidad = 100
}

practica_con_pelota (UnJugador motivado habilidad) = (UnJugador (not motivado) habilidad)

correr minutos jugador = jugador {habilidad = (habilidad jugador) + (minutos `div` 10)}

--2) VIDEOS

-- ASUMO DURACION DE VIDEOS EN MINUTOS
data Video = UnVideo {
    aparecen:: [String],
    duracion:: Integer
} deriving (Show)

apareceMaradona video = any ("maradona"==) (aparecen video)

cuantasVecesAparece videos = fromIntegral(length(filter (apareceMaradona) videos))

superaMilMinutos videos = sum(map (duracion) videos) >= 1000

verVideo jugador videos
    | (superaMilMinutos videos) =  ((aumentarHabilidad videos).motivarConDuracion) jugador 
    | hayUnVideoTrece videos = (
        (aumentarHabilidad videos).motivarConDuracion) (jugador {motivado = False, habilidad = 0 })
    | otherwise = aumentarHabilidad videos (jugador {motivado = False})

aumentarHabilidad videos jugador = jugador { habilidad = (habilidad jugador) + (cuantasVecesAparece videos)}

motivarConDuracion jugador = jugador {motivado = True}

crearVideoTrece = UnVideo {
    aparecen = ["maradona"],
    duracion = 13
} 

hayUnVideoTrece videos = any (videoTrece) videos

videoTrece video = (duracion video == 13) && (length (aparecen video) == 13)

-- EXPLICACION LISTA INFINITA --

-- Gracias a la evaluacion diferida de haskell, que esta se basa en calcular una expresion simplemente cuando se necesita, podemos crear una lista de videos infinitas.
-- Si la cantidad de videos fuese infinita, hay funciones que no se podrian ejecutar , todas las que iteren acumulando o registrando valores no se podran ejecutar ya que nunca terminaran. En cambio, las funciones como "hayUnVideoTrece" se podrna ejecutar siempre haya como minimo 1 video trece, ya que apenas encuentra un "videoTrece" haskell detiene la funcion, como es un "ANY" pide como minimo 1 solo video que cumpla true. 

-- LA PLAY
data Fifa = UnFifa {
    anio_fifa:: Int,
    jugadores::[String]
} deriving (Show)

fifa_2023 = UnFifa {
    anio_fifa = 2023,
    jugadores = ["messi", "haland"]
}

siEsModernoYTieneAMessiEnPsg fifa = (anio_fifa fifa) > 2021 && (any ("messi"==) (jugadores fifa))

motivarJugandoLaPlay fifa jugador
    | siEsModernoYTieneAMessiEnPsg fifa = jugador {motivado = True, habilidad = (habilidad jugador)+fromIntegral((anio_fifa fifa) `div` 1000)}
    | otherwise = jugador

-- 4) En condiciones
-- utilizo pattern matching para no usar guardas devuelta
enCondiciones (UnJugador True habilidad) = (habilidad + (habilidad `div` 2))
enCondiciones (UnJugador False habilidad) = habilidad

-- 5) El mejor
noHayMejorEjercicio jugador = jugador 

peorEjercicio jugador = jugador {motivado = False}
elMejor ejercicioA ejercicioB jugador
    | enCondiciones (ejercicioA jugador) > enCondiciones (ejercicioB jugador) = (ejercicioA jugador)
    | enCondiciones (ejercicioA jugador) < enCondiciones (ejercicioB jugador) = (ejercicioB jugador)
    | otherwise = jugador


-- Ejemplo de comparacion de ejericcios
{- 
Tenemos ElPeorEjercicio que es un ejercicio creado por mi para que no haga nada bueno en el jugador, asi comparamos con un ejercicio que si realmente afecta mucho, en este otro caso, Jugar a la play en el fifa_2023, y como jugador usamos a messi, que messi ya tiene habilidad > 100 pero esta desmotivado, por lo que jugar al fifa_2023 lo va a motivar y va a estar en condiciones para jugar el mundial.
Ademas usamos aplicacion parcial en el jugador, ya que este se va a pasar implicitamente a la funcion "elMejor", como el falta el 3er argumento que seria el jugador, este lo recibe por aplicacion parcial desde el "mejorEntreElPeorEjercicioYPlay".
-}
mejorEntreElPeorEjercicioYPlay jugador = elMejor peorEjercicio (motivarJugandoLaPlay fifa_2023)