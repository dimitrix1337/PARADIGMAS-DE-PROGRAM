auto(mcqueen, 5, 10, seguro).
auto(delorean, 4, 9, inseguro).
auto(troncomovil, 1, 2, seguro).

repuesto(tanquecombustible, 10).
repuesto(cubierta, 5).
repuesto(condensadorflujo, 9).

% creo repuesto para probar el predicado conviene en todos
repuesto(convieneentodos, 17).

% bujia es la descripcion del componte esencial
% en el enunciado se dice que sabemos el nombre, por eso lo hardcodee mas abajo
repuesto(bujia, 12).

coloco(mcqueen, tanquecombustible, 17).
coloco(mcqueen, cubierta, 50).
coloco(delorean, condensadorflujo, 365).

% Sabemos el dia actual
dia(150).

% PUNTO 1

% Completamente Inversible
% este caso contiene un IS, y la variable sin unificar no esta del lado del is, 
% por lo que sigiue siendo inversible,
% pero si la variable sin unificar estaria al lado derecho del IS, este predicado NO seria inversible.
% la diferencia de dia ahora se ejecuta en base que dice el enunciado que tenemos informacion del dia que es,
% por lo que asumo dia(150).
convieneColocarle(Auto, Repuesto):-
	auto(Auto, _, _, _),
	coloco(Auto, Repuesto, Dia),
	dia(DiaActual),
	Diferencia is DiaActual - Dia,
	Diferencia > 100.
	
% Completamente inversible
convieneColocarle(Auto, Repuesto):-
	auto(Auto, _, _, _),
	not(coloco(Auto, Repuesto, _)),
	repuesto(Repuesto, Magnitud),
	Magnitud =:= 17.

% Completamente inversible
convieneColocarle(Auto, Repuesto):-
	auto(Auto, _, _, Seguridad),
	Seguridad = inseguro,
	repuesto(Repuesto, _),
	Repuesto = bujia.

% Completamente inversible
convieneColocarle(Auto, Repuesto):-
	auto(Auto, Capacidad, CapacidadMax, _),
	Capacidad < CapacidadMax / 2,
	Repuesto = bujia.

% PUNTO 2

% Completamente inversible
unSoloComponente(Auto):-
	auto(Auto, _, _, _),
	coloco(Auto, Repuesto1, _),
	forall(coloco(Auto, Repuesto2, _), (Repuesto1 = Repuesto2)).



% Completamente inversible
% idem el de abajo, solo que quizas se ve medio repetitivo
% utilizar el predicado auto aca y lo mismo en unSoloComponente,
% pero si no unifico la variable Auto aca este predicado no seria inversible
% ya que el not no es inversible si la variable no esta unificada.
% este predicado simplemente es la negacion de un solo componente,
% ya que si no tiene uno solo, implica que tiene mas de 1.
masDeUnComponente(Auto):-
	auto(Auto, _, _, _),
	not(unSoloComponente(Auto)),
	not(ningunComponente(Auto)).


% este predicado es completamente inversible gracias al predicado auto(Auto...)
% ya que si no, el not no es inversible si la variable no esta unificada,
% y con el predicado auto, la unificamos.
ningunComponente(Auto):-
	auto(Auto, _, _, _),
	not(coloco(Auto, _, _)).

% PUNTO 3

% Completamente inversible
convieneEnTodos(Repuesto):-
	repuesto(Repuesto, _),
	forall(auto(Auto, _, _, _), convieneColocarle(Auto, Repuesto)).

% PUNTO 4
%inversibilidad: capacidad de un predicado de completar la variable que falta para
%que el hecho sea verdadero.
%ejemplo: 
%alumno(octavio, utn).
%alumno(octavio, X) -> X = utn, si X vale utn , esa relacion es verdadera.
