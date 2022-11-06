import Data.List(nub, intersect, union, sort, group, subsequences)
import Data.Char(toUpper)

data Biblioteca = UnaBiblioteca {
    libros::[Libro],
    ubicacion::String
} deriving (Show)

data Libro = UnLibro {
    titulo::String,
    texto::String,
    generos::[String],
    cantPaginas::Int
} deriving (Show, Eq)

caracteres_validos = "abcdefgh"

-- PRUEBAS --

libro_dracula = UnLibro {
    titulo = "dracula",
    texto = "asd",
    generos = ["terror", "drama"],
    cantPaginas = 410
}

libro_berna = UnLibro {
    titulo = "berna",
    texto = "ad",
    generos = ["aventura", "amor", "drama"],
    cantPaginas = 410
}

biblioteca1 = UnaBiblioteca {
    libros = [libro_dracula, libro_berna],
    ubicacion = "Casa de berna"
}


biblioteca2 = UnaBiblioteca {
    libros = [libro_berna],
    ubicacion = "Casa de berna2"
}

-- ESTADISTICAS --

promedioPaginas :: Biblioteca -> Int
promedioPaginas biblioteca = sum (map (cantPaginas) (libros biblioteca)) `div` (length (libros biblioteca))

librosEnComun biblioteca1 biblioteca2 = filter (estaEnBiblioteca1) (libros biblioteca2)
estaEnBiblioteca1 libro = elem libro (libros biblioteca1)

-- Integridad de la biblioteca
simboloValido x = elem x caracteres_validos
libro_valido libro = (cantPaginas libro == 410) && all (simboloValido) (texto libro)

-- Géneros
tieneGenero genero libro = elem genero (generos libro)
librosDeGenero genero biblioteca = length (filter (tieneGenero genero) (libros biblioteca))

generosBiblioteca biblioteca = map (generos) (libros biblioteca)
generosRepetidos biblioteca = concat (generosBiblioteca biblioteca)
-------------- Obtener el conjunto de géneros diferentes de los cuales hay libros -----
-- Solucion 1
todosLosGeneros biblioteca =  nub (generosRepetidos biblioteca)

-- Solucion 2
todosLosGeneros2 biblioteca = foldl (union) [] (generosBiblioteca biblioteca)
---------------------------------------------------------------------------------

-----------------------------Obtener el género del cuál hay más libros en una biblioteca.----------------
gruposRepetidos biblioteca =  group (sort (generosRepetidos biblioteca))
generoMaximo biblioteca = maximum (map (length) (gruposRepetidos biblioteca))
cumple elemento biblioteca = (length elemento) == (generoMaximo biblioteca)
masPopular biblioteca = filter (flip(cumple) biblioteca) (gruposRepetidos biblioteca)
--------------------------------------------------------------

-- Problemas de registración

todosLosGenerosToUpper biblioteca = map (map (toUpper)) (todosLosGeneros biblioteca)

--Bibliotecas selectivas

 -------------- NUEVAS BIBLIOTECAS -------------
bibliotecaBerlin = UnaBiblioteca {
    libros = [],
    ubicacion = "Berlin"
}

bibliotecaAlejandria = UnaBiblioteca {
    libros = [],
    ubicacion = "Alejandria"
}

bibliotecaParis = UnaBiblioteca {
    libros = [],
    ubicacion = "Paris"
}

bibliotecaArgentina = UnaBiblioteca {
    libros = [],
    ubicacion = "Argentina"
}
-------------- -------------
------------ depuraciones ---------

-- simplemente llamamos a la depuracion propia de una biblioteca paraq ue se AUTOdepure

-- depuracion 1
depuracion1 biblioteca =  filter (libro_valido) (libros biblioteca)

libro_especifico genero libro = elem genero (generos libro)

verificadorAlejandria libro = length (texto libro) == (cantPaginas libro)

depuracion_generos genero libros = filter (libro_especifico genero) libros
depuracion biblioteca
    | (ubicacion biblioteca) == "Berlin" = (depuracion_generos "Policial").libros
    | (ubicacion biblioteca) == "Alejandria" = filter (verificadorAlejandria) .libros
    | (ubicacion biblioteca) == "Paris" = (depuracion_generos "Romantico").libros
    | (ubicacion biblioteca) == "Argentina" = (depuracion_generos "Corrupcion").libros

estaElLibro libro biblioteca = elem libro (libros biblioteca)
buscar_libro libro bibliotecas = filter (estaElLibro libro) bibliotecas

----------------------------------------

---------------- BIBLIOTECA DE BABEL ----------

-- lista caracteres validos para generar textos "pseudoaleatoria"

todos_los_textos = repeat( subsequences ['a'..'z'] )

--generarLibro texto = UnLibro{generos = [],texto = texto, cantPaginas = 410, titulo = "Babel" }
longMenor y= length y > 0
generarTexto n = (filter (longMenor) todos_los_textos) !! n

--generarLibrosAleatorios 0 n = [UnLibro { titulo = "Libro",texto = generarTexto n,generos = [""],cantPaginas = 410}]
generarLibrosAleatorios n =  UnLibro { titulo = "Libro",texto = generarTexto n,generos = [""],cantPaginas = 410}:(generarLibrosAleatorios (n+5))

bibliotecaBabel = UnaBiblioteca {
    libros = generarLibrosAleatorios 1,
    ubicacion = "Babel"
}

comienzaCon fragmento libro = take (length fragmento) (texto libro) == fragmento

primerLibroQueContiene fragmento = head (filter (comienzaCon fragmento) (libros bibliotecaBabel))

cuantosTienenFragmento fragmento libros = filter (comienzaCon fragmento) (libros bibliotecaBabel)

-- Evaluación diferida: propone que una expresión no es evaluada hasta que es necesario evaluarla para utilizar su información, ejemplos
-- si tenemos [1..] lista infinita de numeros naturales, podemos dejarla "quieta" sin llmarla y no va a haber problema
-- en cambio, cuando la llamemos se ejecutará , o sea va a ser "llamada" y va a imprimir los infinitos numeros.