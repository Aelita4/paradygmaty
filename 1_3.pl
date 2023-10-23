%     imie     , ojciec   , matka     , plec     , wiek
osoba(mikolaj  , wladyslaw, grazyna   , mezczyzna, 21).
osoba(grazyna  , jan      , krystyna  , kobieta  , 58).
osoba(wladyslaw, miroslaw , lucyna    , mezczyzna, 63).
osoba(krystyna , andrzej  , emilia    , kobieta  , 78).
osoba(jan      , kacper   , wiktoria  , mezczyzna, 83).
osoba(miroslaw , janusz   , barbara   , mezczyzna, 88).
osoba(lucyna   , krystian , aleksandra, kobieta  , 91).
osoba(michalina, wladyslaw, grazyna   , kobieta  , 35).
osoba(jakub    , wladyslaw, grazyna   , mezczyzna, 33).
osoba(krzysztof, gabriel  , michalina , mezczyzna,  7).
osoba(milosz   , pawel    , renata    , mezczyzna, 17).
osoba(milena   , pawel    , renata    , kobieta  , 15).
osoba(pawel    , jan      , krystyna  , mezczyzna, 44).

mezczyzna(X) :-
    osoba(X, _, _, mezczyzna, _).

kobieta(X) :-
    osoba(X, _, _, kobieta, _).

rodzenstwo(X, Y) :-
    osoba(X, O, M, _, _),
    osoba(Y, O, M, _, _),
    X \= Y.

bracia(X, Y) :-
    rodzenstwo(X, Y),
    mezczyzna(X),
    mezczyzna(Y).

siostry(X, Y) :-
    rodzenstwo(X, Y),
    kobieta(X),
    kobieta(Y).

brat(X, Y) :-
    rodzenstwo(X, Y),
    mezczyzna(X).

siostra(X, Y) :-
    rodzenstwo(X, Y),
    kobieta(X).

matka(X, Y) :-
    osoba(Y, _, X, _, _).

ojciec(X ,Y) :-
    osoba(Y, X, _, _, _).

potomek(X, Y) :-
    matka(Y, X);
    ojciec(Y, X).

syn(X, Y) :-
    potomek(X, Y),
    mezczyzna(X).

corka(X, Y) :-
    potomek(X, Y),
    kobieta(X).

rodzic(X, Y) :-
    matka(X, Y);
    ojciec(X, Y).

babcia(X, Y) :-
    rodzic(Z, Y),
    matka(X, Z).

dziadek(X, Y) :-
    rodzic(Z, Y),
    ojciec(X, Z).

wujek(X, Y) :-
    rodzic(Z, Y),
    brat(X, Z).

ciocia(X, Y) :-
    rodzic(Z, Y),
    siostra(X, Z).

kuzyni(X, Y) :-
    rodzic(A, X),
    rodzic(B, Y),
    rodzenstwo(A, B),
    X \= Y.

kuzyn(X, Y) :-
    kuzyni(X, Y),
    mezczyzna(X).

kuzynka(X, Y) :-
    kuzyni(X, Y),
    kobieta(X).
