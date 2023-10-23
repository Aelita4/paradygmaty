%     imie   , wiek 
osoba(stefan , 21).
osoba(andrzej, 19).

%    imie   , co lubi
lubi(stefan , programowanie).
lubi(andrzej, ogladanie-filmow).

starszy(X, Y) :-
    osoba(X, A),
    osoba(Y, B),
    A > B.
