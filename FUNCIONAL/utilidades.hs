import Data.List(nub, intersect, union, sort, group, subsequences)
import Data.Char(toUpper, toLower)

instance Show (a -> b) where
         show a= "funcion"

instance Eq Cazador where
        (UnCazador nombre _ _ _) == (UnCazador nombre2 _ _ _) = nombre == nombre2

data Cazador = UnCazador {
    nombre :: String,
    cantidadMedalla :: Int,
    puntajeAcumulado :: Float,
    especialidad :: (Integer -> Bool)
} deriving (Show)

cazador1 = UnCazador {
    nombre = "octavio",
    cantidadMedalla=0,
    puntajeAcumulado=0,
        especialidad = (\x -> x > 3)
}


cazador2 = UnCazador {
    nombre = "octavios",
    cantidadMedalla=0,
    puntajeAcumulado=0,
        especialidad = (\x -> x > 3)
}

alfabeto :: [Char]
alfabeto = ['a'..'z']
numeros :: [Integer]
numeros = [0..9]

todasLasCombinacionesAlfabeto = subsequences alfabeto
todasLasCombinacionesAlfabeto :: [[Char]]
todasLasCombinacionesNumeros :: [[Integer]]
todasLasCombinacionesNumeros = subsequences numeros

verSiAestaenB :: Eq a => [a] -> [a] -> Bool
verSiAestaenB conjuntoA conjuntoB = intersect  conjuntoA conjuntoB /= []

verSiAnotienenadadeB :: Eq a => [a] -> [a] -> Bool
verSiAnotienenadadeB conjuntoA conjuntoB = intersect  conjuntoA conjuntoB == []

verSitieneAunqueseaUno :: Eq a => [a] -> [a] -> Bool
verSitieneAunqueseaUno conjuntoA conjuntoB = length (intersect  conjuntoA conjuntoB) > 0

laSumaDeLosConjuntos :: Eq a => [a] -> [a] -> [a]
laSumaDeLosConjuntos conjuntoA conjuntoB = union conjuntoA conjuntoB

borrarRepetidos :: Eq a => [a] -> [a]
borrarRepetidos conjunto = nub conjunto

ordenar :: Ord a => [a] -> [a]
ordenar conjunto = sort conjunto

pasarAMayuscula :: [Char] -> [Char]
pasarAMayuscula texto = map (toUpper) texto
pasarTodoMayuscula :: [[Char]] -> [[Char]]
pasarTodoMayuscula conjunto = map (pasarAMayuscula) conjunto

pasarAMinuscula :: [Char] -> [Char]
pasarAMinuscula texto = map (toLower) texto
pasarTodoMinuscula :: [[Char]] -> [[Char]]
pasarTodoMinuscula conjunto = map (pasarAMinuscula) conjunto

agruparPorSemejanza :: Eq a => [a] -> [[a]]
agruparPorSemejanza conjunto = group conjunto

aplicarMuchasFuncionesEnUnElemento :: Foldable t => a -> t (a -> a) -> a
aplicarMuchasFuncionesEnUnElemento elemento funciones = foldr ($) elemento funciones

frecuenciaDeUnElemento :: Eq a => [a] -> a -> Int
frecuenciaDeUnElemento lista elemento = length (filter (elemento==) lista)
