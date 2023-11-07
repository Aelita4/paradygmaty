rodzic(zofia, marcin).
rodzic(andrzej, marcin).
rodzic(andrzej, kasia).
rodzic(marcin, ania).
rodzic(marcin, krzyś).
rodzic(krzyś, mikołaj).

poprzednik(X, Y) :-
    rodzic(X, Y).

poprzednik(X, Z) :-
    rodzic(X, Y),
    poprzednik(Y, Z).
