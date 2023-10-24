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

mezczyzna(Osoba) :-
    osoba(Osoba, _, _, mezczyzna, _).

kobieta(Osoba) :-
    osoba(Osoba, _, _, kobieta, _).

rodzenstwo(Dzieciak1, Dzieciak2) :-
    osoba(Dzieciak1, Ojciec, Matka, _, _),
    osoba(Dzieciak2, Ojciec, Matka, _, _),
    Dzieciak1 \= Dzieciak2.

bracia(Brat1, Brat2) :-
    rodzenstwo(Brat1, Brat2),
    mezczyzna(Brat1),
    mezczyzna(Brat2).

siostry(Siostra1, Siostra2) :-
    rodzenstwo(Siostra1, Siostra2),
    kobieta(Siostra1),
    kobieta(Siostra2).

brat(Brat, Osoba) :-
    rodzenstwo(Brat, Osoba),
    mezczyzna(Brat).

siostra(Siostra, Osoba) :-
    rodzenstwo(Siostra, Osoba),
    kobieta(Siostra).

matka(Matka, Dziecko) :-
    osoba(Dziecko, _, Matka, _, _).

ojciec(Ojciec, Dziecko) :-
    osoba(Dziecko, Ojciec, _, _, _).

potomek(Dziecko, Rodzic) :-
    matka(Rodzic, Dziecko);
    ojciec(Rodzic, Dziecko).

syn(Syn, Rodzic) :-
    potomek(Syn, Rodzic),
    mezczyzna(Syn).

corka(Corka, Rodzic) :-
    potomek(Corka, Rodzic),
    kobieta(Corka).

rodzic(Rodzic, Dziecko) :-
    matka(Rodzic, Dziecko);
    ojciec(Rodzic, Dziecko).

babcia(Babcia, Wnuk) :-
    rodzic(Rodzic, Wnuk),
    matka(Babcia, Rodzic).

dziadek(Dziadek, Wnuk) :-
    rodzic(Rodzic, Wnuk),
    ojciec(Dziadek, Rodzic).

wujek(Wujek, Osoba) :-
    rodzic(Rodzic, Osoba),
    brat(Wujek, Rodzic).

ciocia(Ciocia, Osoba) :-
    rodzic(Rodzic, Osoba),
    siostra(Ciocia, Rodzic).

kuzyni(Kuzyn1, Kuzyn2) :-
    rodzic(Rodzic1, Kuzyn1),
    rodzic(Rodzic2, Kuzyn2),
    rodzenstwo(Rodzic1, Rodzic2),
    Kuzyn1 \= Kuzyn2.

kuzyn(Kuzyn, Osoba) :-
    kuzyni(Kuzyn, Osoba),
    mezczyzna(Kuzyn).

kuzynka(Kuzynka, Osoba) :-
    kuzyni(Kuzynka, Osoba),
    kobieta(Kuzynka).
