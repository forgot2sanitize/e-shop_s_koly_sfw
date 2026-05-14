INSERT INTO UZIVATEL (jmeno, prijmeni, email, heslo, telefon, datum_registrace) VALUES
('Jan', 'Novák', 'jan.novak@email.cz', 'heslo123', '601111001', '2023-01-15'),
('Petra', 'Svobodová', 'petra.svoboda@email.cz', 'tajneheslo', '601111002', '2023-03-22'),
('Tomáš', 'Dvořák', 'tomas.dvorak@email.cz', 'tomas1', '601111003', '2023-05-10'),
('Lucie', 'Procházková', 'lucie.proch@email.cz', 'lucinka', '601111004', '2023-07-01'),
('Martin', 'Krejčí', 'martin.k@email.cz', 'martin99', '601111005', '2023-09-18'),
('Eva', 'Blažková', 'eva.b@email.cz', 'evik123', '601111006', '2024-01-05'),
('Ondřej', 'Marek', 'ondra.m@email.cz', 'hesloooo', '601111007', '2024-02-14'),
('Barbora', 'Čermáková', 'barca.c@email.cz', 'barunka', '601111008', '2024-04-30');

INSERT INTO KATEGORIE_KOL (nazev_kategorie, popis_kategorie, slug, aktivni, poradi_zobrazeni) VALUES
('Horská kola', 'Do terénu', 'horska-kola', 1, 1),
('Silniční kola', 'Na silnici', 'silnicni-kola', 1, 2),
('Trekingová kola', 'Na výlety', 'trekingova-kola', 1, 3),
('Elektrokola', 'S motorem', 'elektrokola', 1, 4),
('BMX', 'Pro triky', 'bmx', 1, 5),
('Dětská kola', 'Pro děti', 'detska-kola', 1, 6),
('Gravel kola', 'Štěrk a asfalt', 'gravel-kola', 1, 7),
('Skládací kola', 'Do města', 'skladaci-kola', 0, 8);

INSERT INTO ZAMESTNANEC (jmeno, prijmeni, pozice, datum_nastupu, plat) VALUES
('Karel', 'Horáček', 'Technik', '2020-03-01', 38000),
('Zdeněk', 'Pospíšil', 'Technik', '2021-06-15', 36500),
('Michaela', 'Součková', 'Vedoucí', '2019-01-10', 52000),
('Pavel', 'Fiala', 'Prodejce', '2022-04-01', 32000),
('Renata', 'Veselá', 'Prodejce', '2022-09-01', 31000),
('Jakub', 'Šimánek', 'Skladník', '2023-01-20', 28000),
('Lenka', 'Kopecká', 'Účetní', '2018-07-01', 44000),
('Roman', 'Tichý', 'Technik', '2023-08-01', 35000);

INSERT INTO SERVISNI_UKON (nazev_ukonu, popis_ukonu, cena_ukonu, odhadovana_doba) VALUES
('Seřízení brzd', 'Seřízení brzd', 250, '1 hodina'),
('Výměna duše', 'Výměna duše', 180, '30 minut'),
('Seřízení přehazovačky', 'Seřízení', 300, '1 hodina'),
('Servisní prohlídka', 'Kontrola', 500, '2 hodiny'),
('Výměna plášťů', 'Nové pláště', 400, '1,5 hodiny'),
('Oprava rámu', 'Oprava', 2500, '5 hodin'),
('Čištění', 'Čištění kola', 350, '1,5 hodiny'),
('Výměna řetězu', 'Nový řetěz', 220, '45 minut');

INSERT INTO KOLO (nazev, znacka, typ, cena, rok_vyroby, id_kategorie) VALUES
('Stumpjumper', 'Specialized', 'MTB', 89900, 2023, 1),
('Tarmac SL7', 'Specialized', 'Silnice', 124900, 2022, 2),
('Cross Country', 'Trek', 'MTB', 45000, 2023, 1),
('FX 3 Disc', 'Trek', 'Fitness', 28900, 2024, 3),
('Turbo Vado', 'Specialized', 'Elektro', 79900, 2023, 4),
('BMX Pro', 'Haro', 'BMX', 15900, 2022, 5),
('Precaliber', 'Trek', 'Dětské', 9900, 2024, 6),
('Topstone', 'Cannondale', 'Gravel', 69900, 2023, 7),
('Domane AL 2', 'Trek', 'Silnice', 32900, 2024, 2);

INSERT INTO OBJEDNAVKA (datum_vytvoreni, stav, zpusob_dopravy, celkova_cena, id_uzivatele) VALUES
('2024-02-10', 'dokončena', 'Osobní', 89900, 1),
('2024-02-15', 'dokončena', 'Pošta', 124900, 2),
('2024-03-01', 'dokončena', 'PPL', 73800, 3),
('2024-03-20', 'odeslána', 'DPD', 79900, 4),
('2024-04-05', 'rozpracována', 'Osobní', 28900, 5),
('2024-04-12', 'nová', 'Zásilkovna', 45800, 1),
('2024-05-01', 'dokončena', 'PPL', 32900, 6),
('2024-05-18', 'zrušena', 'DPD', 15900, 7);

INSERT INTO POLOZKA_OBJEDNAVKY (id_polozky, id_objednavky, id_kola, mnozstvi, cena_za_kus) VALUES
(1, 1, 1, 1, 89900),
(1, 2, 2, 1, 124900),
(1, 3, 3, 1, 45000),
(2, 3, 7, 1, 28800),
(1, 4, 5, 1, 79900),
(1, 5, 4, 1, 28900),
(1, 6, 3, 1, 45000),
(2, 6, 7, 1, 9900),
(1, 7, 9, 1, 32900);

INSERT INTO SERVISNI_OBJEDNAVKA (datum_prijmu, datum_dokonceni, status, poznamka, id_uzivatele, id_kola, id_zamestnance) VALUES
('2024-01-10', '2024-01-11', 'dokončeno', 'Zimní servis', 1, 1, 1),
('2024-02-05', '2024-02-06', 'dokončeno', 'Brzdy', 2, 2, 2),
('2024-03-12', '2024-03-14', 'dokončeno', 'Pláště', 3, 3, 1),
('2024-03-25', NULL, 'v opravě', 'Díly', 4, 5, 3),
('2024-04-02', '2024-04-03', 'dokončeno', 'Elektro', 5, 5, 2),
('2024-04-15', '2024-04-15', 'dokončeno', 'Defekt', 1, 1, 8),
('2024-05-05', NULL, 'přijato', 'Komplet', 6, 8, 3),
('2024-05-20', NULL, 'přijato', 'Řazení', 7, 4, 1);

INSERT INTO SERVISNI_DETAIL (id_detailu, id_servisu, id_ukonu, mnozstvi, fakturovana_cena, poznamka_ukonu) VALUES
(1, 1, 4, 1, 500, 'OK'),
(2, 1, 7, 1, 350, 'OK'),
(1, 2, 1, 1, 250, 'OK'),
(1, 3, 5, 1, 400, 'Zimní'),
(2, 3, 8, 1, 220, 'OK'),
(1, 4, 4, 1, 500, 'OK'),
(1, 5, 4, 1, 500, 'OK'),
(1, 6, 2, 1, 180, 'OK'),
(1, 7, 4, 1, 500, 'OK'),
(2, 7, 7, 1, 350, 'OK');