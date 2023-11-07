rodzic(zofia, marcin).
rodzic(andrzej, marcin).
rodzic(andrzej, kasia).
rodzic(marcin, ania).
rodzic(marcin, krzyś).
rodzic(krzyś, mikołaj).

kobieta(zofia).
kobieta(kasia).
kobieta(ania).

mezczyzna(marcin).
mezczyzna(andrzej).
mezczyzna(krzyś).
mezczyzna(mikołaj).

szczesliwy(X) :-
    rodzic(X, _).

siostra(X, Y) :-
    rodzic(Z, X),
    rodzic(Z, Y),
    kobieta(X).

dwoje_dzieci(X) :-
    rodzic(X, Y),
    siostra(Y, _).

przodek(X, Y) :- rodzic(X, Y).
przodek(X, Y) :-
    rodzic(X, Z),
    przodek(Z, Y).

ciotka(X, Y) :-
    siostra(X, Z),
    rodzic(Z, Y).

wnuk(X, Y) :-
    rodzic(Y, Z),
    rodzic(Z, X).

nastepca(X, Y) :- rodzic(Y, X).
nastepca(X, Y) :-
    rodzic(Y, Z),
    nastepca(X, Z).
