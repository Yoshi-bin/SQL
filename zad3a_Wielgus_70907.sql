-- 28.1
DROP TABLE IF EXISTS pracownik2;

CREATE TABLE pracownik2(
    id_pracownik INT IDENTITY(1,1) PRIMARY KEY,
    imie VARCHAR(15) NOT NULL,
    nazwisko VARCHAR(20) NOT NULL,
    pesel CHAR(11) UNIQUE,
    data_zatr DATETIME DEFAULT GETDATE(),
    pensja MONEY CHECK(pensja>=1000)
);

-- 28.2
CREATE TABLE naprawa2 (
    id_naprawa INT IDENTITY(1,1) PRIMARY KEY,
    data_przyjecia DATETIME CHECK (data_przyjecia <= GETDATE()),
    opis_usterki VARCHAR(100) NOT NULL CHECK (LEN(opis_usterki) > 10),
    zaliczka MONEY CHECK (zaliczka >= 100 AND zaliczka <= 1000)
);

-- 28.3
CREATE TABLE wykonane_naprawy2 (
    id_pracownik INT,
    id_naprawa INT,
    data_naprawy DATETIME DEFAULT GETDATE(),
    opis_naprawy VARCHAR(100) NOT NULL,
    cena MONEY,
    FOREIGN KEY (id_pracownik) REFERENCES pracownik2(id_pracownik),
    FOREIGN KEY (id_naprawa) REFERENCES naprawa2(id_naprawa)
);

-- 29.1
ALTER TABLE student2 ALTER COLUMN nazwisko VARCHAR(20) NOT NULL;
ALTER TABLE student2 ADD CONSTRAINT unikatowy_nr_indeksu UNIQUE (nr_indeksu);
ALTER TABLE student2 ADD CONSTRAINT sprawdz_stypendium CHECK (stypendium>=1000);
ALTER TABLE student2 ADD imie VARCHAR(15) NOT NULL;

-- 29.2
ALTER TABLE dostawca2
ADD CONSTRAINT unikatowa_nazwa UNIQUE (nazwa);

ALTER TABLE towar2
ADD nazwa VARCHAR(30) NOT NULL,
ADD CONSTRAINT unikatowy_kod_kreskowy UNIQUE (kod_kreskowy),
ADD FOREIGN KEY (id_dostawca) REFERENCES dostawca2(id_dostawca);

-- 29.3
ALTER TABLE kraj2
ALTER COLUMN nazwa VARCHAR(30) NOT NULL;

ALTER TABLE gatunek2
ALTER COLUMN nazwa VARCHAR(30) NOT NULL;

ALTER TABLE zwierze2
ADD CONSTRAINT fk_gatunek FOREIGN KEY (id_gatunek) REFERENCES gatunek2(id_gatunek),
ADD CONSTRAINT fk_kraj FOREIGN KEY (id_kraj) REFERENCES kraj2(id_kraj);


-- 30.1
DROP TABLE IF EXISTS przedmiot2;
DROP TABLE IF EXISTS kategoria2;

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='przedmiot2')
    DROP TABLE przedmiot2;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='kategoria2')
    DROP TABLE kategoria2;

-- 30.2
ALTER TABLE osoba2
DROP COLUMN imie2;

-- 30.3

SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME = 'uczen2' AND CONSTRAINT_TYPE = 'UNIQUE';



-- 31.1
DROP TABLE IF EXISTS zwierze2;
DROP TABLE IF EXISTS wlasciciel2;

CREATE TABLE wlasciciel2(
    id_wlasciciel INT IDENTITY(1,1) PRIMARY KEY,
    imie VARCHAR(15) NOT NULL CHECK(LEN(imie)>2),
    nazwisko VARCHAR(15) NOT NULL CHECK(LEN(nazwisko)>2),
    data_ur DATE NOT NULL DEFAULT GETDATE(),
    ulica VARCHAR(50),
    numer VARCHAR(8),
    kod CHAR(6) NOT NULL CHECK(LEN(kod)=6),
    miejscowosc VARCHAR(30) NOT NULL CHECK(LEN(miejscowosc)>1)
);

-- 31.2
ALTER TABLE film2_gatunek2
DROP CONSTRAINT IF EXISTS fk_film2;

ALTER TABLE film2_gatunek2
ADD CONSTRAINT fk_film2
FOREIGN KEY (id_film)
REFERENCES film2(id_film)
ON DELETE CASCADE;

ALTER TABLE film2_gatunek2
DROP CONSTRAINT IF EXISTS fk_gatunek2;

ALTER TABLE film2_gatunek2
ADD CONSTRAINT fk_gatunek2
FOREIGN KEY (id_gatunek)
REFERENCES gatunek2(id_gatunek)
ON DELETE CASCADE;

-- 31.3
ALTER TABLE pracownik2
DROP CONSTRAINT IF EXISTS fk_stanowisko;

ALTER TABLE pracownik2
ADD CONSTRAINT fk_stanowisko
FOREIGN KEY (id_stanowisko)
REFERENCES stanowisko2(id_stanowisko)
ON DELETE SET NULL;


