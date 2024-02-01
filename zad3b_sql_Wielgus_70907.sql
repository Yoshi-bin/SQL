
CREATE TABLE Festiwal (
    FestiwalID INT AUTO_INCREMENT PRIMARY KEY,
    Nazwa VARCHAR(255),
    DataRozpoczecia DATE,
    DataZakonczenia DATE,
    Miejsce VARCHAR(255)
);

CREATE TABLE Artysta (
    ArtystaID INT AUTO_INCREMENT PRIMARY KEY,
    Imie VARCHAR(255),
    Nazwisko VARCHAR(255),
    Pseudonim VARCHAR(255),
    KrajPochodzenia VARCHAR(255)
);

CREATE TABLE Scena (
    ScenaID INT AUTO_INCREMENT PRIMARY KEY,
    Nazwa VARCHAR(255),
    Pojemnosc INT,
    Lokalizacja VARCHAR(255)
);

CREATE TABLE Koncert (
    KoncertID INT AUTO_INCREMENT PRIMARY KEY,
    FestiwalID INT,
    ScenaID INT,
    DataRozpoczecia DATETIME,
    CzasTrwania INT,
    FOREIGN KEY (FestiwalID) REFERENCES Festiwal(FestiwalID),
    FOREIGN KEY (ScenaID) REFERENCES Scena(ScenaID)
);

CREATE TABLE Bilet (
    NumerBiletu INT AUTO_INCREMENT PRIMARY KEY,
    KoncertID INT,
    Cena DECIMAL(10, 2),
    RodzajBiletu VARCHAR(255),
    FOREIGN KEY (KoncertID) REFERENCES Koncert(KoncertID)
);

CREATE TABLE Uczestnik (
    NumerUczestnika INT AUTO_INCREMENT PRIMARY KEY,
    Imie VARCHAR(255),
    Nazwisko VARCHAR(255),
    DataUrodzenia DATE,
    KrajZamieszkania VARCHAR(255)
);

CREATE TABLE KategoriaMuzyczna (
    KategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    NazwaKategorii VARCHAR(255),
    Opis TEXT
);

CREATE TABLE PartnerFestiwalu (
    PartnerID INT AUTO_INCREMENT PRIMARY KEY,
    NazwaFirmy VARCHAR(255),
    Kontakt VARCHAR(255),
    Siedziba VARCHAR(255)
);

CREATE TABLE PracownikFestiwalu (
    NumerPracownika INT AUTO_INCREMENT PRIMARY KEY,
    Imie VARCHAR(255),
    Nazwisko VARCHAR(255),
    Stanowisko VARCHAR(255),
    DataZatrudnienia DATE
);

CREATE TABLE Media (
    MediaID INT AUTO_INCREMENT PRIMARY KEY,
    NazwaMedia VARCHAR(255),
    Kontakt VARCHAR(255),
    ObszarDzialania VARCHAR(255)
);

CREATE TABLE Parking (
    ParkingID INT AUTO_INCREMENT PRIMARY KEY,
    Lokalizacja VARCHAR(255),
    Pojemnosc INT,
    Oplata DECIMAL(10, 2)
);

CREATE TABLE Zakwaterowanie (
    ZakwaterowanieID INT AUTO_INCREMENT PRIMARY KEY,
    Nazwa VARCHAR(255),
    Adres VARCHAR(255),
    Cena DECIMAL(10, 2),
    Dostepnosc BOOLEAN
);

CREATE TABLE Sponsor (
    SponsorID INT AUTO_INCREMENT PRIMARY KEY,
    NazwaFirmy VARCHAR(255),
    Kontakt VARCHAR(255),
    KwotaSponsoringu DECIMAL(10, 2)
);

CREATE TABLE AtrakcjeDodatkowe (
    AtrakcjeID INT AUTO_INCREMENT PRIMARY KEY,
    NazwaAtrakcji VARCHAR(255),
    Opis TEXT,
    Lokalizacja VARCHAR(255)
);

CREATE TABLE GrafikPracownikow (
    GrafikID INT AUTO_INCREMENT PRIMARY KEY,
    NumerPracownika INT,
    DataPracy DATE,
    GodzinyPracy TIME,
    FOREIGN KEY (NumerPracownika) REFERENCES PracownikFestiwalu(NumerPracownika)
);

-- Wypełnienie tabeli Festiwal
INSERT INTO Festiwal (Nazwa, DataRozpoczecia, DataZakonczenia, Miejsce) VALUES 
('Summer Music Festival', '2024-07-15', '2024-07-17', 'Los Angeles'),
('Rocktoberfest', '2024-09-20', '2024-09-22', 'Berlin');

-- Wypełnienie tabeli Artysta
INSERT INTO Artysta (Imie, Nazwisko, Pseudonim, KrajPochodzenia) VALUES 
('John', 'Doe', 'JD', 'USA'),
('Anna', 'Smith', 'AS', 'UK');

-- Wypełnienie tabeli Scena
INSERT INTO Scena (Nazwa, Pojemnosc, Lokalizacja) VALUES 
('Main Stage', 10000, 'Central Park'),
('Rock Arena', 5000, 'Olympiastadion');

-- Wypełnienie tabeli Koncert
INSERT INTO Koncert (FestiwalID, ScenaID, DataRozpoczecia, CzasTrwania) VALUES 
(1, 1, '2024-07-15 18:00:00', 120),
(2, 2, '2024-09-20 19:00:00', 90);

-- Wypełnienie tabeli Bilet
INSERT INTO Bilet (KoncertID, Cena, RodzajBiletu) VALUES 
(1, 50.00, 'Standard'),
(1, 80.00, 'VIP'),
(2, 40.00, 'Standard'),
(2, 60.00, 'VIP');

-- Wypełnienie tabeli Uczestnik
INSERT INTO Uczestnik (Imie, Nazwisko, DataUrodzenia, KrajZamieszkania) VALUES 
('Michael', 'Johnson', '1990-05-10', 'USA'),
('Maria', 'Garcia', '1988-12-20', 'Spain');

-- Wypełnienie tabeli KategoriaMuzyczna
INSERT INTO KategoriaMuzyczna (NazwaKategorii, Opis) VALUES 
('Rock', 'Gatunek muzyczny charakteryzujący się mocnymi rytmami i intensywną grą gitarową.'),
('Pop', 'Popularna muzyka skierowana do masowego odbiorcy.');

-- Wypełnienie tabeli PartnerFestiwalu
INSERT INTO PartnerFestiwalu (NazwaFirmy, Kontakt, Siedziba) VALUES 
('MusicGear Inc.', 'contact@musicgear.com', 'New York'),
('SoundMasters Ltd.', 'info@soundmasters.com', 'London');

-- Wypełnienie tabeli PracownikFestiwalu
INSERT INTO PracownikFestiwalu (Imie, Nazwisko, Stanowisko, DataZatrudnienia) VALUES 
('Emily', 'Brown', 'Manager', '2024-06-01'),
('David', 'Wilson', 'Security', '2024-07-01');

-- Wypełnienie tabeli Media
INSERT INTO Media (NazwaMedia, Kontakt, ObszarDzialania) VALUES 
('MusicNews', 'editor@musicnews.com', 'Global'),
('RockTimes', 'info@rocktimes.com', 'Europe');

-- Wypełnienie tabeli Parking
INSERT INTO Parking (Lokalizacja, Pojemnosc, Oplata) VALUES 
('Parking A', 500, 10.00),
('Parking B', 300, 5.00);

-- Wypełnienie tabeli Zakwaterowanie
INSERT INTO Zakwaterowanie (Nazwa, Adres, Cena, Dostepnosc) VALUES 
('Hotel Central', '123 Main Street', 100.00, true),
('Hotel Riverside', '456 River Road', 120.00, true);

-- Wypełnienie tabeli Sponsor
INSERT INTO Sponsor (NazwaFirmy, Kontakt, KwotaSponsoringu) VALUES 
('TechSound Ltd.', 'info@techsound.com', 5000.00),
('LiveMusic Inc.', 'contact@livemusic.com', 8000.00);

-- Wypełnienie tabeli AtrakcjeDodatkowe
INSERT INTO AtrakcjeDodatkowe (NazwaAtrakcji, Opis, Lokalizacja) VALUES 
('Meet & Greet with Artists', 'Exclusive opportunity to meet your favorite artists!', 'Main Stage'),
('Food Trucks', 'Variety of delicious food options from local vendors.', 'Central Plaza');

-- Wypełnienie tabeli GrafikPracownikow
INSERT INTO GrafikPracownikow (NumerPracownika, DataPracy, GodzinyPracy) VALUES 
(1, '2024-07-15', '08:00-16:00'),
(2, '2024-07-15', '16:00-00:00');






--Funkcje

DELIMITER //

CREATE FUNCTION ObliczPrzychódZBiletów(KoncertID INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE totalRevenue DECIMAL(10, 2);
    SELECT SUM(Cena) INTO totalRevenue FROM Bilet WHERE KoncertID = KoncertID;
    RETURN totalRevenue;
END//

CREATE FUNCTION PobierzKrajPochodzeniaArtysty(ArtystaID INT) RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE country VARCHAR(255);
    SELECT KrajPochodzenia INTO country FROM Artysta WHERE ArtystaID = ArtystaID;
    RETURN country;
END//

CREATE FUNCTION SprawdźDostępnośćZakwaterowania(ZakwaterowanieID INT) RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    DECLARE isAvailable BOOLEAN;
    SELECT Dostepnosc INTO isAvailable FROM Zakwaterowanie WHERE ZakwaterowanieID = ZakwaterowanieID;
    RETURN isAvailable;
END//

CREATE FUNCTION PoliczLiczbeMediów() RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE mediaCount INT;
    SELECT COUNT(*) INTO mediaCount FROM Media;
    RETURN mediaCount;
END//

DELIMITER ;




--Procedury

DELIMITER //
CREATE PROCEDURE AktualizujCenęBiletu(IN KoncertID INT, IN RodzajBiletu VARCHAR(255), IN NowaCena DECIMAL(10, 2))
BEGIN
    UPDATE Bilet SET Cena = NowaCena WHERE KoncertID = KoncertID AND RodzajBiletu = RodzajBiletu;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ZarejestrujUczestnika(IN Imie VARCHAR(255), IN Nazwisko VARCHAR(255), IN DataUrodzenia DATE, IN KrajZamieszkania VARCHAR(255))
BEGIN
    INSERT INTO Uczestnik (Imie, Nazwisko, DataUrodzenia, KrajZamieszkania) VALUES (Imie, Nazwisko, DataUrodzenia, KrajZamieszkania);
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ZmieńStanowiskoPracownika(IN NumerPracownika INT, IN NoweStanowisko VARCHAR(255))
BEGIN
    UPDATE PracownikFestiwalu SET Stanowisko = NoweStanowisko WHERE NumerPracownika = NumerPracownika;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DodajMiejsceParkingowe(IN Lokalizacja VARCHAR(255), IN Pojemnosc INT, IN Oplata DECIMAL(10, 2))
BEGIN
    INSERT INTO Parking (Lokalizacja, Pojemnosc, Oplata) VALUES (Lokalizacja, Pojemnosc, Oplata);
END//
DELIMITER ;


