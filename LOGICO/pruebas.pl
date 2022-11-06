%ciudad(ciudad, AnioFundacion, provincia).

ciudad(mdq, 1876, bsas).
ciudad(bariloche, 1880, rionegro).
ciudad(viedma, 1776, rionegro).
ciudad(calafate, 1930, stacruz).
ciudad(lanus, 1888, bsas).
ciudad(xd, 1888, campana).

%alojamiento(ciudad, alojamiento, cantidad).

alojamiento(bariloche, camping, 2).
alojamiento(bariloche, hotel, 12).
alojamiento(bariloche, hosteria, 5).
alojamiento(mdq, hotel, 100).
alojamiento(mdq, camping, 10).
alojamiento(mdq, residencial, 5).
alojamiento(mdq, hosteria, 5).
alojamiento(viedma, camping, 3).
alojamiento(calafate, camping, 2).
alojamiento(calafate, hosteria, 3).

capacidad(hotel, 50).
capacidad(camping, 100).
capacidad(hosteria, 30).
capacidad(residencial, 10).

provinciaGrande(bsas,0.9).
provinciaPatagonica(rionegro,2010).
provinciaPatagonica(stacruz,2003).
provinciaComun(cordoba).

montoPorLugar(10).

coeficiente(comun, 1.1).
coeficiente(2010, 1.2).
coeficiente(2009, 1.4).
coeficiente(2008, 1.5).

ciudadEnProvincia(Ciudad, Provincia) :- ciudad(Ciudad, _, Provincia).


provinciasConCiudadesTuristicas(Siglo, Provincia) :-
	ciudadEnProvincia(Ciudad1, Provincia),
	ciudadEnProvincia(Ciudad2, Provincia),	
	InicioSiglo is (Siglo * 100) - 100,
	FinSiglo is (InicioSiglo) + 101,
	ciudad(Ciudad1, Fundacion1, Provincia),
	between(InicioSiglo, FinSiglo, Fundacion1), 
	ciudad(Ciudad2, Fundacion2, Provincia),
	between(InicioSiglo, FinSiglo, Fundacion2).	

provinciasSinAlojamiento() :-
	ciudadEnProvincia(Ciudad1, Provincia),
	not(alojamiento(Ciudad1, _, _)),
	write(Provincia).

ciudadesUnicaCategoria(Ciudad) :-
	ciudadEnProvincia(Ciudad, _),
	alojamiento(Ciudad, X, _),
	forall(alojamiento(Ciudad, Y, _), X == Y).

capacidadLugares(Ciudad, Camping, Capacidad):-
	ciudad(Ciudad, _, _),
	alojamiento(Ciudad, Camping, Cantidad),
	capacidad(Camping, CapacidadIndividual),
	Capacidad is Cantidad * CapacidadIndividual.
	
mayorCategoriaDeAlojamiento(Ciudad, Categoria) :-
	ciudad(Ciudad, _, _),
	capacidadLugares(Ciudad, Categoria, Capacidad1),
	forall(capacidadLugares(Ciudad, _, Capacidad2), Capacidad1 >= Capacidad2).

mayorCiudadCon(Ciudad, Categoria):-
	ciudad(Ciudad, _, _),
	alojamiento(Ciudad, Categoria, Cantidad1),
	forall(alojamiento(_, Categoria, Cantidad2), Cantidad1 >= Cantidad2).

coeficienteCiudad(Ciudad, Coeficiente):-
	ciudadEnProvincia(Ciudad, Provincia),
	provinciaPatagonica(Provincia,Incorporacion),
	coeficiente(Incorporacion, Coeficiente).

coeficienteCiudad(Ciudad, Coeficiente):-
	ciudadEnProvincia(Ciudad, Provincia),
	provinciaGrande(Provincia, Coeficiente).

coeficienteCiudad(Ciudad, Coeficiente):-
	ciudadEnProvincia(Ciudad, Provincia),
	provinciaComun(Provincia),
	coeficiente(comun, Coeficiente).

correspondenciaFondos(Ciudad, Categoria, Monto):-
	capacidadLugares(Ciudad, Categoria, Cantidad),
	coeficienteCiudad(Ciudad, Coeficiente),
	Monto is (Cantidad*10) *Coeficiente.


