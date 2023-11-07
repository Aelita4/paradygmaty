zatrudnienie(stefan,   kowalski,      rocket_fuel_goats, duza_firma, 3500).
zatrudnienie(anna,     nowak,         spcdm,             mala_firma, 2750).
zatrudnienie(karol,    wolodyjowski,  kremow_pc,         mala_firma, 2137).
zatrudnienie(gargamel, gargamelowski, smerfow_las,       duza_firma, 1000).

zadowolona(X) :-
    zatrudnienie(X, _, _, Y, Z),
    Y = mala_firma,
    Z > 2500.

sprawdz() :-
    zatrudnienie(X, _, _, Y, Z),
    Y = duza_firma,
    Z < 1500,
    print(X).
