rzeczownik(ala).
rzeczownik(kot).
rzeczownik(stefan).
rzeczownik(zaliczenie).
rzeczownik(jan).
rzeczownik(pies).
rzeczownik(slonce).
rzeczownik(rower).
rzeczownik(shrek).
rzeczownik(bagno).

czasownik(ma).
czasownik(pisze).
czasownik(jest).
czasownik(lubi).

przymiotnik(trudny).
przymiotnik(zielony).
przymiotnik(zardzewialy).
przymiotnik(cuchnace).

weryfikuj(X, Y, Z) :-
    rzeczownik(X),
    czasownik(Y),
    rzeczownik(Z),
    write('Zdanie poprawne'), nl,
    write(X), write(' '), write(Y), write(' '), write(Z).

weryfikuj(A, B, C, D, E) :-
    przymiotnik(A),
    rzeczownik(B),
    czasownik(C),
    przymiotnik(D),
    rzeczownik(E),
    write('Zdanie poprawne'), nl,
    write(A), write(' '), write(B), write(' '), write(C), write(' '), write(D), write(' '), write(E).



%silnia

silnia(0, 1).
silnia(N, A) :- 
    N > 0,
    No is N - 1,
    silnia(No, Na),
    A is N * Na.

%fibonacci
fib(0, 0).
fib(1, 1).
fib(X, A) :- 
    X >= 2,
    N1 is X - 1,
    N2 is X - 2,
    fib(N1, W1),
    fib(N2, W2),
    A is W1 + W2.

%wykladnicza
wykladnicza(_, 0, 1).
wykladnicza(A, N, W) :-
    N > 0,
    N1 is N - 1,
    wykladnicza(A, N1, W1),
    W is A * W1.

%hanoi
hanoi(N) :-
    hanoi2(N, _, _).

hanoi2(1, Zktorej, Naktora) :-
    write('przenosze krazek z wiezy '),
    write(Zktorej),
    write(' na wieze '),
    write(Naktora),
    nl.

hanoi2(N, _, _) :-
    N > 1,
    N1 is N - 1,
    hanoi2(N1, 1, 3),
    hanoi2(1, 1, 2),
    hanoi2(N1, 3, 2).
 
main :- hanoi(4).
