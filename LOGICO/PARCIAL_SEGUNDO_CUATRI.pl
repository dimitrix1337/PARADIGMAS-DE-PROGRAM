nombre(messi).
nombre(haland).
habilidad(messi, 100).
habilidad(haland, 98).
motivado(messi, nomotivado).
motivado(haland, pocomotivado).

% VIDEOS

duracion(video1, 99).
titulo(video1, elmejorvideo).
personaPrincipal(video1, maradona).

duracion(video1, 500).
titulo(video1, elmejorvideo).
personaPrincipal(video1, maradona).

vioVideo(messi, video1).
vioVideo(haland, video2).

leAyuda1(Jugador, Video):-
    personaPrincipal(Video, maradona).

leAyuda2(Jugador, Video) :-
    motivado(Jugador, pocomotivado),
    duracion(Video, Duracion),
    (Duracion > 100).

leAyuda3(Jugador, Video):-
    not(motivado(Jugador, nomotivado)),
    habilidad(Jugador, Habilidad),
    (Habilidad > 200).

lesAyudoTodos(Jugador):-
    leAyuda1(Jugador, Video),
    leAyuda2(Jugador, Video),
    leAyuda3(Jugador, Video).

leAyudaVideo(Jugador, Video):-
    leAyuda1(Jugador, Video);
    leAyuda2(Jugador, Video);
    leAyuda3(Jugador, Video).

leAyudaATodos(Video):-
    forall(nombre(Jugador),leAyudaVideo(Jugador, Video) ).

recomendaciones(Jugador, Video):-
    leAyudaVideo(Jugador, Video),
    not(vioVideo(Jugador, Video)).

% Inversibilidad: es la capacidad
% para decir que valores cumplirian esa relacion.
% ejemplo, ama(romeo, julieta). es una relacion y si ponemos ama(romeo, X). prolog nos va a devolver los X con los que esa relacion es cierta, lo cual devolveria X = julieta.