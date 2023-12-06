poleKwadratu(Bok, Wynik) :-
    (Bok < 0 ->
        Wynik is 0,
        print("ujemna cepie")
        
        ;
        Wynik is Bok * Bok).

poleKola(Promien, Wynik) :-
    (Promien < 0 ->
        Wynik is 0,
        print("ujemna cepie")
        
        ;
        Wynik is pi * Promien * Promien).

sredniaArytmetyczna(A, B, Wynik) :-
    Wynik is (A + B) / 2.

figura(kwadrat,4).
figura(trojkat,3).
figura(trapez,4).
figura(pieciokat_foremny,5).
figura(szczesciokat_foremny,6).
figura(osmiokat_foremny,8).
figura(dziesieciokat_foremny,10).

wypiszNieWiecejNiz5() :-
    figura(X, Y),
    Y < 6,
    print(X),
    nl,
    fail.

klamie(lew, poniedzialek).
klamie(lew, wtorek).
klamie(lew, sroda).
klamie(nosorozec, czwartek).
klamie(nosorozec, piatek).
klamie(nosorozec, sobota).

prawde(lew, czwartek).
prawde(lew, piatek).
prawde(lew, sobota).
prawde(lew, niedziela).
prawde(nosorozec, poniedzialek).
prawde(nosorozec, wtorek).
prawde(nosorozec, sroda).
prawde(nosorozec, niedziela).

wczoraj(wtorek, poniedzialek).
wczoraj(sroda, wtorek).
wczoraj(czwartek, sroda).
wczoraj(piatek, czwartek).
wczoraj(sobota, piatek).
wczoraj(niedziela, sobota).
wczoraj(poniedzialek, niedziela).

zadanie4(Dzisiaj) :-
    klamie(nosorozec, X),
    wczoraj(DzisiajN, X),
    prawde(nosorozec, DzisiajN),

    ( klamie(lew, DzisiajN) ->
        Dzisiaj is DzisiajN, !;

        klamie(lew, Y),
        wczoraj(Dzisiaj, Y),
        prawde(lew, Dzisiaj)    
    ).

zadanie5([S,E,N,D,M,O,R,Y]) :-
    permutation([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [S, E, N, D, M, O, R, Y, _, _]),
    (1000 * S + 100 * E + 10 * N + D) + (1000 * M + 100 * O + 10 * R + E) =:=
        10000 * M + 1000 * O + 100 * N + 10 * E + Y.

delta(A, B, C, Wynik) :-
    Wynik is B * B - 4 * A * C.

rownanieKwadratowe(A, B, C, X1, X2) :-
    delta(A, B, C, Delta),
    (Delta < 0 ->
        X1 is 0,
        X2 is 0,
        print("brak rozwiazan")
        ;
        X1 is (-B - sqrt(Delta)) / (2 * A),
        X2 is (-B + sqrt(Delta)) / (2 * A)
    ).

zadanie6() :-
    rownanieKwadratowe(0.5, 1.5, -3.5, X1, X2),
    print(X1),
    nl,
    print(X2).