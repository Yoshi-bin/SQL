--Wyzwalacze
1.
CREATE TRIGGER AktualizujDateZatrudnienia
BEFORE UPDATE ON PracownikFestiwalu
FOR EACH ROW
BEGIN
    SET NEW.DataZatrudnienia = NOW();
END;

2.
CREATE TRIGGER AktualizujLiczbeMiejscParkingowych
AFTER INSERT ON Parking
FOR EACH ROW
BEGIN
    UPDATE InformacjeOFestiwalu
    SET LiczbaMiejscParkingowych = LiczbaMiejscParkingowych + NEW.Pojemnosc;
END;

3.
CREATE TRIGGER UstawDostępnośćZakwaterowania
AFTER INSERT ON Zakwaterowanie
FOR EACH ROW
BEGIN
    UPDATE Zakwaterowanie
    SET Dostepnosc = true
    WHERE ZakwaterowanieID = NEW.ZakwaterowanieID;
END;

4.
CREATE TRIGGER KontrolaLimituMiejsc
BEFORE INSERT ON Bilet
FOR EACH ROW
BEGIN
    DECLARE soldTickets INT;
    SELECT COUNT(*) INTO soldTickets FROM Bilet WHERE KoncertID = NEW.KoncertID;
    IF soldTickets >= (SELECT Pojemnosc FROM Scena WHERE ScenaID = (SELECT ScenaID FROM Koncert WHERE KoncertID = NEW.KoncertID)) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Przekroczono limit miejsc na tym koncercie!';
    END IF;
END;
