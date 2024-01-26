-- 1.1
SELECT * FROM pracownik; 

-- 1.2
SELECT imie FROM pracownik;

-- 1.3
SELECT  imie, nazwisko , dzial 
FROM pracownik;

-- 2.1
SELECT imie, nazwisko, pensja 
FROM pracownik 
ORDER BY pensja DESC;

-- 2.2
SELECT imie, nazwisko
FROM pracownik 
ORDER BY nazwisko, imie asc;

-- 2.3
SELECT nazwisko, dzial, stanowisko
FROM pracownik
ORDER BY dzial ASC, stanowisko DESC;

-- 3.1
SELECT DISTINCT dzial
FROM pracownik;

-- 3.2
SELECT DISTINCT dzial, stanowisko
FROM pracownik;

-- 3.3
SELECT DISTINCT dzial, stanowisko
FROM pracownik
ORDER BY dzial DESC, stanowisko DESC;

-- 4.1
SELECT imie, nazwisko
FROM pracownik
WHERE imie = 'Jan';

-- 4.2
SELECT imie, nazwisko
FROM pracownik
WHERE stanowisko = 'sprzedawca';

-- 4.3
SELECT imie, nazwisko, pensja
FROM pracownik
WHERE pensja > 1500
ORDER BY pensja DESC;

-- 5.1
SELECT imie, nazwisko, dzial, stanowisko
FROM pracownik
WHERE dzial = 'obsluga klienta' 
AND stanowisko = 'sprzedawca';

-- 5.2
SELECT imie, nazwisko, dzial, stanowisko
FROM pracownik
WHERE dzial = 'techniczny' AND (stanowisko = 'kierownik' OR stanowisko = 'sprzedawca');

-- 5.3
SELECT *
FROM samochod
WHERE marka NOT IN ('Fiat', 'Ford');

-- 6.1
SELECT marka 
FROM samochod
WHERE marka in ('mercedes','seat', 'opel');

-- 6.2
SELECT imie, nazwisko, stanowisko
FROM pracownik
WHERE imie in ('Anna','Marzena','Alicja');

-- 6.3 
SELECT imie, nazwisko, miasto
FROM klient
WHERE miasto NOT IN ('Warszawa', 'Wroclaw');

-- 7.1
SELECT imie, nazwisko
FROM klient
WHERE nazwisko LIKE '%K%';

-- 7.2
SELECT imie, nazwisko
FROM klient
WHERE nazwisko LIKE 'D%SKI';

-- 7.3
SELECT imie, nazwisko
FROM klient
WHERE nazwisko LIKE '_O%' OR nazwisko LIKE '_A%';

-- 8.1
SELECT *
FROM samochod
WHERE poj_silnika BETWEEN 1100 AND 1600;

-- 8.2
SELECT *
FROM pracownik
WHERE data_zatr BETWEEN '1997-01-01' 
AND '1997-12-31';

-- 8.3
SELECT *
FROM samochod
WHERE przebieg BETWEEN 10000 
AND 20000 OR przebieg 
BETWEEN 30000 AND 40000;

-- 9.1
SELECT *
FROM pracownik
WHERE dodatek IS NULL;

-- 9.2
SELECT *
FROM klient
WHERE nr_karty_kredyt IS NOT NULL;

-- 9.3
SELECT imie, nazwisko, COALESCE(dodatek, 0)
AS wysokosc_dodatku
FROM pracownik;

-- 10.1
SELECT imie, nazwisko, pensja, COALESCE(dodatek, 0) AS dodatek, (pensja + COALESCE(dodatek, 0)) AS do_zaplaty
FROM pracownik;

-- 10.2
SELECT imie, nazwisko, pensja, (pensja * 1.5) AS nowa_pensja
FROM pracownik;

-- 10.3
SELECT imie, nazwisko, (pensja + COALESCE(dodatek, 0)) * 0.01 AS procent_zarobkow
FROM pracownik
ORDER BY procent_zarobkow ASC;

-- 11.1
SELECT TOP 1 imie, nazwisko
FROM pracownik
ORDER BY data_zatr ASC;

-- 11.2
SELECT TOP 4 imie, nazwisko
FROM pracownik
ORDER BY nazwisko, imie;

-- 11.3
SELECT TOP 1 *
FROM wypozyczenie
ORDER BY data_wyp DESC;

-- 12.1
SELECT imie, nazwisko, data_zatr
FROM pracownik
WHERE MONTH(data_zatr) = 5
ORDER BY nazwisko, imie;

-- 12.2
SELECT imie, nazwisko, DATEDIFF(day, data_zatr, GETDATE()) AS dni_pracy
FROM pracownik
ORDER BY dni_pracy DESC;

-- 12.3
SELECT marka, typ, DATEDIFF(year, data_prod, GETDATE()) AS lata_od_produkcji
FROM samochod
ORDER BY lata_od_produkcji DESC;

-- 13.1
SELECT imie, nazwisko, UPPER(LEFT(imie, 1) + LEFT(nazwisko, 1)) AS inicjaly
FROM klient
ORDER BY inicjaly, nazwisko, imie;

-- 13.2
SELECT UPPER(LEFT(imie, 1)) + LOWER(RIGHT(imie, LEN(imie) - 1)) AS imie, UPPER(LEFT(nazwisko, 1)) + LOWER(RIGHT(nazwisko, LEN(nazwisko) - 1)) AS nazwisko
FROM klient;

-- 13.3
SELECT imie, nazwisko, STUFF(nr_karty_kredyt, LEN(nr_karty_kredyt) - 5 + 1, 6, 'xxxxxx') AS ukryty_numer_karty
FROM klient;

-- 14.1
UPDATE pracownik
SET dodatek = 50
WHERE dodatek IS NULL;

-- 14.2
UPDATE klient
SET imie = 'Jerzy', nazwisko = 'Nowak'
WHERE id_klient = 10;

-- 14.3
UPDATE pracownik
SET dodatek = dodatek + 100
WHERE pensja < 1500;

-- 15.1
DELETE FROM klient
WHERE id_klient = 17;

-- 15.2
DELETE FROM wypozyczenie
WHERE id_klient = 17;

-- 15.3
DELETE FROM samochod
WHERE przebieg > 60000;

-- 16.1
INSERT INTO klient (id_klient, imie, nazwisko, ulica, numer, kod, miasto, telefon)
VALUES (121, 'Adam', 'Cichy', 'ul. Korzenna ','12', '00-950', 'Warszawa', '123-454-321');

-- 16.2
INSERT INTO samochod (id_samochod, kolor, marka, model, pojemnosc_silnika, data_produkcji, przebieg_km)
VALUES (50, 'srebrna', 'Skoda', 'Octavia', 1896, '2012-09-01', 5000);

-- 16.3
INSERT INTO pracownik (id_pracownik, imie, nazwisko, data_zatrudnienia, stanowisko, pensja, dodatek, telefon, ulica, kod_pocztowy, miasto)
VALUES (NULL, 'Alojzy', 'Mikos', '2010-08-11', 'magazynier', 3000, 50, '501-501-501', 'ul. Lewartowskiego 12', '00-950', 'Warszawa');
