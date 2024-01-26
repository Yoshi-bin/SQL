-- 17.1
SELECT s.id_samochod, s.marka, s.typ, w.data_wyp, w.data_odd
FROM samochod s
INNER JOIN wypozyczenie w ON s.id_samochod = w.id_samochod
WHERE w.data_odd IS NULL;

-- 17.2
SELECT k.imie, k.nazwisko, w.id_samochod, w.data_wyp
FROM klient k
INNER JOIN wypozyczenie w ON k.id_klient = w.id_klient
WHERE w.data_odd IS NULL
ORDER BY k.nazwisko, k.imie;

-- 17.3
SELECT k.imie, k.nazwisko, w.data_wyp AS data_wp�aty_kaucji, w.kaucja
FROM klient k
INNER JOIN wypozyczenie w ON k.id_klient = w.id_klient
WHERE w.kaucja IS NOT NULL;

-- 18.1
SELECT k.imie, k.nazwisko, w.data_wyp, s.marka, s.typ
FROM klient k
LEFT JOIN wypozyczenie w ON k.id_klient = w.id_klient
LEFT JOIN samochod s ON w.id_samochod = s.id_samochod
ORDER BY k.nazwisko, k.imie, s.marka, s.typ;

-- 18.2
SELECT CONCAT(m.ulica, ' ', m.numer, ', ', m.miasto, ' ', m.kod) AS adres, s.marka, s.typ
FROM miejsce m
LEFT JOIN wypozyczenie w ON m.id_miejsce = w.id_wypozyczenie
LEFT JOIN samochod s ON w.id_samochod = s.id_samochod
ORDER BY adres, s.marka, s.typ;


-- 18.3
SELECT s.id_samochod, s.marka, s.typ, k.imie, k.nazwisko
FROM samochod s
LEFT JOIN wypozyczenie w ON s.id_samochod = w.id_samochod
LEFT JOIN klient k ON w.id_klient = k.id_klient
ORDER BY s.id_samochod, k.nazwisko, k.imie;

-- 19.1
SELECT MAX(pensja) AS najwyzsza_pensja
FROM pracownik;

-- 19.2
SELECT AVG(pensja) AS srednia_pensja
FROM pracownik;

-- 19.3
SELECT MIN(data_prod) AS najwczesniejsza_data_produkcji
FROM samochod;

-- 20.1
SELECT k.imie, k.nazwisko, COUNT(w.id_wypozyczenie) AS liczba_wypozyczen
FROM klient k
LEFT JOIN wypozyczenie w ON k.id_klient = w.id_klient
GROUP BY k.imie, k.nazwisko
ORDER BY liczba_wypozyczen DESC;

-- 20.2
SELECT s.id_samochod, s.marka, s.typ, COUNT(w.id_wypozyczenie) AS liczba_wypozyczen
FROM samochod s
LEFT JOIN wypozyczenie w ON s.id_samochod = w.id_samochod
GROUP BY s.id_samochod, s.marka, s.typ
ORDER BY liczba_wypozyczen;

-- 20.3
SELECT p.imie, p.nazwisko, COUNT(w.id_wypozyczenie) AS liczba_wypozyczen
FROM pracownik p
LEFT JOIN wypozyczenie w ON p.id_pracownik = w.id_wypozyczenie
GROUP BY p.imie, p.nazwisko
ORDER BY liczba_wypozyczen DESC;

-- 21.1
SELECT k.imie, k.nazwisko, COUNT(w.id_wypozyczenie) AS liczba_wypozyczen
FROM klient k
LEFT JOIN wypozyczenie w ON k.id_klient = w.id_klient
GROUP BY k.imie, k.nazwisko
HAVING COUNT(w.id_wypozyczenie) >= 2
ORDER BY k.nazwisko, k.imie;

-- 21.2
SELECT s.id_samochod, s.marka, s.typ, COUNT(w.id_wypozyczenie) AS liczba_wypozyczen
FROM samochod s
LEFT JOIN wypozyczenie w ON s.id_samochod = w.id_samochod
GROUP BY s.id_samochod, s.marka, s.typ
HAVING COUNT(w.id_wypozyczenie) >= 5
ORDER BY s.marka, s.typ;

-- 21.3
SELECT p.imie, p.nazwisko, COUNT(w.id_wypozyczenie) AS liczba_wypozyczen
FROM pracownik p
LEFT JOIN wypozyczenie w ON p.id_pracownik = w.id_wypozyczenie
GROUP BY p.imie, p.nazwisko
HAVING COUNT(w.id_wypozyczenie) <= 20 OR COUNT(w.id_wypozyczenie) IS NULL
ORDER BY COUNT(w.id_wypozyczenie), p.nazwisko, p.imie;
