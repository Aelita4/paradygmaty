lubi(ala, koty).
lubi(ala, jablko).
lubi(marek, psy).
lubi(ala, psy).
lubi(jarek, ala).
lubi(jarek, rower).
lubi(joanna, wakacje).

kobieta(ala).
kobieta(joanna).

mezczyzna(marek).
mezczyzna(jarek).

lubi1(Y, X) :- 
    mezczyzna(X),
    lubi(X, koty),
    lubi(Y, psy).
