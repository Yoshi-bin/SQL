-- 22.1
SELECT imie, nazwisko, pensja
FROM pracownik
WHERE pensja = (SELECT MAX(pensja) FROM pracownik);

-- 22.2
SELECT imie, nazwisko, pensja
FROM pracownik
WHERE pensja > (SELECT AVG(pensja) FROM pracownik);

-- 22.3
SELECT id_samochod, marka, typ, data_prod
FROM samochod
WHERE data_prod = (SELECT MIN(data_prod) FROM samochod);

-- 23.1
SELECT marka, typ, data_prod
FROM samochod
WHERE id_samochod NOT IN (SELECT DISTINCT id_samochod FROM wypozyczenie);

-- 23.2
SELECT imie, nazwisko
FROM klient
WHERE id_klient NOT IN (SELECT DISTINCT id_klient FROM wypozyczenie);

-- 23.3
SELECT imie, nazwisko
FROM pracownik
WHERE id_pracownik NOT IN (SELECT DISTINCT id_pracownik FROM wypozyczenie);

-- 24.1
SELECT TOP 1 s.id_samochod, s.marka, s.typ
FROM samochod s
LEFT JOIN wypozyczenie w ON s.id_samochod = w.id_samochod
GROUP BY s.id_samochod, s.marka, s.typ
ORDER BY COUNT(w.id_wypozyczenie) DESC, s.marka, s.typ;


-- 24.2
SELECT TOP 1 k.id_klient, k.imie, k.nazwisko
FROM klient k
LEFT JOIN wypozyczenie w ON k.id_klient = w.id_klient
GROUP BY k.id_klient, k.imie, k.nazwisko
HAVING COUNT(w.id_wypozyczenie) > 0
ORDER BY COUNT(w.id_wypozyczenie), k.nazwisko, k.imie;


-- 24.3
SELECT TOP 1 p.id_pracownik, p.nazwisko, p.imie
FROM pracownik p
LEFT JOIN wypozyczenie w ON p.id_pracownik = p.id_pracownik
GROUP BY p.id_pracownik, p.nazwisko, p.imie
HAVING COUNT(w.id_wypozyczenie) > 0
ORDER BY COUNT(w.id_wypozyczenie), p.nazwisko, p.imie;


-- 25.1
UPDATE pracownik
SET pensja = pensja * 1.10
WHERE pensja < (SELECT AVG(pensja) FROM pracownik);

-- 25.2
UPDATE pracownik
SET dodatek = dodatek + 10
WHERE id_pracownik IN (SELECT DISTINCT id_pracownik FROM wypozyczenie WHERE MONTH(data_wyp) = 5);

-- 25.3
UPDATE pracownik
SET pensja = pensja * 0.95
WHERE id_pracownik NOT IN (SELECT DISTINCT id_pracownik FROM wypozyczenie WHERE YEAR(data_wyp) = 1999);

-- 26.1
SELECT COUNT(*) AS liczba_klientow_bez_wypozyczen
FROM klient
WHERE id_klient NOT IN (SELECT DISTINCT id_klient FROM wypozyczenie);

-- 26.2
DELETE FROM samochod
WHERE id_samochod NOT IN (SELECT DISTINCT id_samochod FROM wypozyczenie);

-- 26.3
DELETE FROM pracownik
WHERE id_pracownik NOT IN (SELECT DISTINCT id_pracownik FROM wypozyczenie);

