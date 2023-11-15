pisz_liste([_ | []]) :-
	write([]),
	!.

pisz_liste([G|O]) :-
	write(G),
	nl,
	pisz_liste(O).

nalezy(_, []) :- write('nie nalezy'), !.

nalezy(E, [G | O]) :-
	(E =:= G ->
	write('nalezy');
	nalezy(E, O)).

nalezy2(E, [E | _]) :- !.

nalezy2(E, [_, O]) :-
	nalezy(E, O).

dlugosc([], 0).
dlugosc([_ | O], A) :-
	dlugosc(O, A1),
	A is A1 + 1.

polacz([], [], []).
polacz([], X, X).
polacz([X | T1], L2, [X | L3]) :-
	polacz(T1, L2, L3).

dodaj(X, [], [X]).
dodaj(X, [G | O], [G | B]) :-
	dodaj(X, O, B).

usun(_, [], []) :- !.
usun(X, [X | O], L) :- usun(X, O, L), !.
usun(X, [Y | O], [Y | L]) :- usun(X, O, L), !.

ostatni(E, [E | []]) :- !.
ostatni(E, [_ | O]) :- ostatni(E, O).

poczatek([], _).
poczatek([X | O], [X | O1]) :- poczatek(O, O1).