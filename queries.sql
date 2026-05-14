-- Q1: Seznam kol v kategorii Horská kola seřazený od nejdražšího

SELECT KOLO.nazev, KOLO.znacka, KOLO.cena, KATEGORIE_KOL.nazev_kategorie
FROM KOLO
JOIN KATEGORIE_KOL ON KOLO.id_kategorie = KATEGORIE_KOL.id_kategorie
WHERE KATEGORIE_KOL.nazev_kategorie = 'Horská kola'
ORDER BY KOLO.cena DESC;

-- Q2: Uživatelé, jejichž příjmení začíná na Nov

SELECT *
FROM UZIVATEL
WHERE prijmeni LIKE 'Nov%';

-- Q3: Tři nejlevnější kola

SELECT *
FROM KOLO
ORDER BY cena ASC
LIMIT 3;

-- Q4: Počet kol v každé kategorii, kde je více než 1 kolo

SELECT KATEGORIE_KOL.nazev_kategorie, COUNT(*) AS pocet_kol
FROM KOLO
JOIN KATEGORIE_KOL ON KOLO.id_kategorie = KATEGORIE_KOL.id_kategorie
GROUP BY KATEGORIE_KOL.nazev_kategorie
HAVING COUNT(*) > 1;

-- Q5: Přehled servisu se jménem zákazníka a technika

SELECT SERVISNI_OBJEDNAVKA.id_servisu, UZIVATEL.prijmeni, ZAMESTNANEC.prijmeni
FROM SERVISNI_OBJEDNAVKA
JOIN UZIVATEL ON SERVISNI_OBJEDNAVKA.id_uzivatele = UZIVATEL.id_uzivatele
JOIN ZAMESTNANEC ON SERVISNI_OBJEDNAVKA.id_zamestnance = ZAMESTNANEC.id_zamestnance
WHERE SERVISNI_OBJEDNAVKA.status = 'dokončeno';

-- Q6: Servisní úkony obsahující slovo Výměna

SELECT nazev_ukonu, cena_ukonu
FROM SERVISNI_UKON
WHERE nazev_ukonu LIKE '%Výměna%';

-- Q7: Výpočet ceny položky (množství krát cena)

SELECT id_objednavky, id_kola, (mnozstvi * cena_za_kus) AS celkova_cena_polozky
FROM POLOZKA_OBJEDNAVKY
JOIN KOLO ON POLOZKA_OBJEDNAVKY.id_kola = KOLO.id_kola;

-- Q8: Všichni uživatelé a jejich objednávky (i ti co neobjednali)

SELECT UZIVATEL.prijmeni, OBJEDNAVKA.id_objednavky
FROM UZIVATEL
LEFT JOIN OBJEDNAVKA ON UZIVATEL.id_uzivatele = OBJEDNAVKA.id_uzivatele;

-- Q9: Poslední 2 vytvořené objednávky

SELECT id_objednavky, datum_vytvoreni, celkova_cena
FROM OBJEDNAVKA
WHERE stav != 'zrušena'
ORDER BY datum_vytvoreni DESC
LIMIT 2;

-- Q10: Kola značky Trek

SELECT nazev, znacka, cena
FROM KOLO
WHERE znacka = 'Trek'

-- Q11: Výpočet ceny s 21% DPH

SELECT nazev, cena, (cena * 1.21) AS cena_s_dph
FROM KOLO
WHERE cena > 10000;

-- Q12: Všechny úkony a kolikrát byly v servisu (i nepoužité)

SELECT SERVISNI_UKON.nazev_ukonu, COUNT(SERVISNI_DETAIL.id_ukonu) AS pocet_ukonu
FROM SERVISNI_DETAIL
RIGHT JOIN SERVISNI_UKON ON SERVISNI_DETAIL.id_ukonu = SERVISNI_UKON.id_ukonu
GROUP BY SERVISNI_UKON.nazev_ukonu;

-- Q13: Položky konkrétní objednávky č. 3

SELECT OBJEDNAVKA.id_objednavky, KOLO.nazev, POLOZKA_OBJEDNAVKY.mnozstvi
FROM POLOZKA_OBJEDNAVKY
JOIN OBJEDNAVKA ON POLOZKA_OBJEDNAVKY.id_objednavky = OBJEDNAVKA.id_objednavky
JOIN KOLO ON POLOZKA_OBJEDNAVKY.id_kola = KOLO.id_kola
WHERE OBJEDNAVKA.id_objednavky = 3;

-- Q14: Průměrná cena kola v e-shopu

SELECT AVG(cena) AS prumerna_cena_vsech_kol
FROM KOLO;

-- Q15: Zaměstnanci s platem nad 35000

SELECT jmeno, prijmeni, plat
FROM ZAMESTNANEC
WHERE plat > 35000;