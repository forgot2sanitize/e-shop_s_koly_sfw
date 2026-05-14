SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS SERVISNI_DETAIL;
DROP TABLE IF EXISTS SERVISNI_OBJEDNAVKA;
DROP TABLE IF EXISTS POLOZKA_OBJEDNAVKY;
DROP TABLE IF EXISTS OBJEDNAVKA;
DROP TABLE IF EXISTS KOLO;
DROP TABLE IF EXISTS KATEGORIE_KOL;
DROP TABLE IF EXISTS SERVISNI_UKON;
DROP TABLE IF EXISTS ZAMESTNANEC;
DROP TABLE IF EXISTS UZIVATEL;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE UZIVATEL (
    id_uzivatele INT NOT NULL AUTO_INCREMENT,
    jmeno VARCHAR(50) NOT NULL,
    prijmeni VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    heslo VARCHAR(255) NOT NULL,
    telefon VARCHAR(20),
    datum_registrace DATE NOT NULL,
    PRIMARY KEY (id_uzivatele)
);

CREATE TABLE KATEGORIE_KOL (
    id_kategorie INT NOT NULL AUTO_INCREMENT,
    nazev_kategorie VARCHAR(80) NOT NULL,
    popis_kategorie TEXT,
    slug VARCHAR(80) NOT NULL,
    aktivni TINYINT(1) DEFAULT 1,
    poradi_zobrazeni INT DEFAULT 0,
    PRIMARY KEY (id_kategorie)
);

CREATE TABLE ZAMESTNANEC (
    id_zamestnance INT NOT NULL AUTO_INCREMENT,
    jmeno VARCHAR(50) NOT NULL,
    prijmeni VARCHAR(50) NOT NULL,
    pozice VARCHAR(80) NOT NULL,
    datum_nastupu DATE NOT NULL,
    plat DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_zamestnance)
);

CREATE TABLE SERVISNI_UKON (
    id_ukonu INT NOT NULL AUTO_INCREMENT,
    nazev_ukonu VARCHAR(100) NOT NULL,
    popis_ukonu TEXT,
    cena_ukonu DECIMAL(10,2) NOT NULL,
    odhadovana_doba VARCHAR(50),
    PRIMARY KEY (id_ukonu)
);

CREATE TABLE KOLO (
    id_kola INT NOT NULL AUTO_INCREMENT,
    nazev VARCHAR(120) NOT NULL,
    znacka VARCHAR(60) NOT NULL,
    typ VARCHAR(60) NOT NULL,
    cena DECIMAL(10,2) NOT NULL,
    rok_vyroby INT NOT NULL,
    id_kategorie INT NOT NULL,
    PRIMARY KEY (id_kola),
    FOREIGN KEY (id_kategorie) REFERENCES KATEGORIE_KOL(id_kategorie)
);

CREATE TABLE OBJEDNAVKA (
    id_objednavky INT NOT NULL AUTO_INCREMENT,
    datum_vytvoreni DATE NOT NULL,
    stav VARCHAR(30) NOT NULL,
    zpusob_dopravy VARCHAR(60) NOT NULL,
    celkova_cena DECIMAL(10,2) NOT NULL,
    id_uzivatele INT NOT NULL,
    PRIMARY KEY (id_objednavky),
    FOREIGN KEY (id_uzivatele) REFERENCES UZIVATEL(id_uzivatele)
);

-- Identifikační závislost
CREATE TABLE POLOZKA_OBJEDNAVKY (
    id_polozky INT NOT NULL,
    id_objednavky INT NOT NULL,
    id_kola INT NOT NULL,
    mnozstvi INT NOT NULL,
    cena_za_kus DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_polozky, id_objednavky),
    FOREIGN KEY (id_objednavky) REFERENCES OBJEDNAVKA(id_objednavky),
    FOREIGN KEY (id_kola) REFERENCES KOLO(id_kola)
);

CREATE TABLE SERVISNI_OBJEDNAVKA (
    id_servisu INT NOT NULL AUTO_INCREMENT,
    datum_prijmu DATE NOT NULL,
    datum_dokonceni DATE,
    status VARCHAR(30) NOT NULL,
    poznamka TEXT,
    id_uzivatele INT NOT NULL,
    id_kola INT NOT NULL,
    id_zamestnance INT NOT NULL,
    PRIMARY KEY (id_servisu),
    FOREIGN KEY (id_uzivatele) REFERENCES UZIVATEL(id_uzivatele),
    FOREIGN KEY (id_kola) REFERENCES KOLO(id_kola),
    FOREIGN KEY (id_zamestnance) REFERENCES ZAMESTNANEC(id_zamestnance)
);

-- Identifikační závislost
CREATE TABLE SERVISNI_DETAIL (
    id_detailu INT NOT NULL,
    id_servisu INT NOT NULL,
    id_ukonu INT NOT NULL,
    mnozstvi INT NOT NULL,
    fakturovana_cena DECIMAL(10,2) NOT NULL,
    poznamka_ukonu TEXT,
    PRIMARY KEY (id_detailu, id_servisu),
    FOREIGN KEY (id_servisu) REFERENCES SERVISNI_OBJEDNAVKA(id_servisu),
    FOREIGN KEY (id_ukonu) REFERENCES SERVISNI_UKON(id_ukonu)
);