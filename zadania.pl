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

% ?- zadanie5([S,E,N,D,M,O,R,Y]).
% %%% zadanie zwraca wiele wynikow bedacych przykladowymi cyframi podstawionymi za konkretne wartosci

zadanie5_samwynik(Wynik) :-
    findall([S, E, N, D, M, O, R, Y],
        (permutation([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [S, E, N, D, M, O, R, Y, _, _]),
        (1000 * S + 100 * E + 10 * N + D) + (1000 * M + 100 * O + 10 * R + E) =:=
            10000 * M + 1000 * O + 100 * N + 10 * E + Y),
        List), % zapisujemy kazdy wynik ktory przeszedl warunek do listy za pomoca findall/3
    length(List, Temp), % dlugosc wynikowej listy
    Wynik is Temp / 2. % wynika to z tego bledu z permutacja z dwoma zmiennymi anonimowymi

% ?- zadanie5_samwynik(W).
% W = 25.

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
    rownanieKwadratowe(2, -5, -9, X11, X12),
    print(X11),
    nl,
    print(X12),
    nl, nl,
    rownanieKwadratowe(-1, 8, 2, X21, X22),
    print(X21),
    nl,
    print(X22).

% ?- zadanie6.
% -1.212214450449026
% 3.712214450449026
% 
% 8.242640687119284
% -0.24264068711928477
% true.


zona(andzia, 2).
zona(beata, 3).
zona(celina, 4).
zona(danusia, 5).

zadanie7(A, B, C, D) :-
    permutation([2, 3, 4, 5], [Andrzej, Bogumil, Cezary, Damian]),
    Andrzej + Andrzej +
    Bogumil + 2 * Bogumil +
    Cezary + 3 * Cezary +
    Damian + 4 * Damian =:= 44,
    zona(A, Andrzej),
    zona(B, Bogumil),
    zona(C, Cezary),
    zona(D, Damian).

% ?- zadanie7(Andrzej, Bogumil, Cezary, Damian).
% Andrzej = danusia,
% Bogumil = celina,
% Cezary = beata,
% Damian = andzia ;
% false.
