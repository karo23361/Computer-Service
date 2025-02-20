  CREATE TABLE "AKTUALIZACJA_CENNIKA" 
   (	"ID_AKTUALIZACJA_CENNIKA" NUMBER NOT NULL ENABLE, 
	"DATA_AKTUALIZACJI_CENNIKA" DATE, 
	"CENNIK_ID_CENNIK" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "ID_AKTUALIZACJA_CENNIKA_PK" PRIMARY KEY ("ID_AKTUALIZACJA_CENNIKA")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "CENNIK" 
   (	"ID_CENNIK" NUMBER NOT NULL ENABLE, 
	"TYP_NAPRAWY" VARCHAR2(50), 
	"KOSZT_USLUGI" NUMBER, 
	 CONSTRAINT "ID_CENNIK_PK" PRIMARY KEY ("ID_CENNIK")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "CZESCI_ZAMIENNE" 
   (	"ID_CZESCI_ZAMIENNE" NUMBER NOT NULL ENABLE, 
	"MODEL" VARCHAR2(40), 
	"STAN_MAGAZYNOWY" NUMBER, 
	"CENA" NUMBER, 
	"TYP_CZESCI_ZAMIENNEJ_ID_TYP_CZESCI_ZAMIENNEJ" NUMBER NOT NULL ENABLE, 
	"DOSTAWCY_ID_DOSTAWCY" NUMBER NOT NULL ENABLE, 
	"TYP_CZESCI" VARCHAR2(50), 
	 CONSTRAINT "ID_CZESCI_ZAMIENNE_PK" PRIMARY KEY ("ID_CZESCI_ZAMIENNE")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "FAKTURY" 
   (	"ID_FAKTURY" NUMBER NOT NULL ENABLE, 
	"OPIS" VARCHAR2(300), 
	"NUMER_FAKTURY" VARCHAR2(30), 
	"DATA_WYSTAWIENIA" DATE, 
	"KWOTA" NUMBER, 
	"TYP_ZAPLATY_ID_TYP_ZAPLATY" NUMBER NOT NULL ENABLE, 
	"STATUS_FAKTURY" VARCHAR2(20) DEFAULT 'Nieopłacona', 
	 CONSTRAINT "ID_FAKTURY_PK" PRIMARY KEY ("ID_FAKTURY")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "KLIENCI" 
   (	"ID_KLIENTA" NUMBER NOT NULL ENABLE, 
	"IMIE" VARCHAR2(30), 
	"NAZWISKO" VARCHAR2(30), 
	"TELEFON" VARCHAR2(15), 
	"ADRES_EMAIL" VARCHAR2(60), 
	 CONSTRAINT "KLIENCI_PK" PRIMARY KEY ("ID_KLIENTA")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "PRACOWNICY" 
   (	"ID_PRACOWNIKA" NUMBER NOT NULL ENABLE, 
	"IMIE" VARCHAR2(50), 
	"NAZWISKO" VARCHAR2(50), 
	"ADRES_EMAIL" VARCHAR2(50), 
	"NR_TELEFONU" VARCHAR2(15), 
	"DATA_ZATRUDNIENIA" DATE, 
	"SPECJALIZACJA" VARCHAR2(30), 
	"LICZBA_AKTYWNYCH_USLUG" NUMBER DEFAULT 0, 
	 CONSTRAINT "ID_PRACOWNIKA_PK" PRIMARY KEY ("ID_PRACOWNIKA")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "SPRZET" 
   (	"ID_SPRZETU" NUMBER NOT NULL ENABLE, 
	"MODEL" VARCHAR2(40), 
	"NUMER_SERYJNY" VARCHAR2(50), 
	 CONSTRAINT "ID_SPRZETU_PK" PRIMARY KEY ("ID_SPRZETU")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "TYP_CZESCI_ZAMIENNEJ" 
   (	"ID_TYP_CZESCI_ZAMIENNEJ" NUMBER NOT NULL ENABLE, 
	"TYP_CZESCI_ZAMIENNEJ" VARCHAR2(30), 
	"USLUGA_ID_USLUGA" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "ID_TYP_CZESCI_ZAMIENNEJ_PK" PRIMARY KEY ("ID_TYP_CZESCI_ZAMIENNEJ")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "TYP_SPRZETU" 
   (	"ID_TYP_SPRZETU" NUMBER NOT NULL ENABLE, 
	"TYP_SPRZETU" VARCHAR2(30), 
	"ZGLOSZENIA_ID_ZGLOSZENIA" NUMBER NOT NULL ENABLE, 
	"SPRZET_ID_SPRZETU" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "ID_TYP_SPRZETU_PK" PRIMARY KEY ("ID_TYP_SPRZETU")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "TYP_USLUGI" 
   (	"ID_TYP_USLUGI" NUMBER NOT NULL ENABLE, 
	"RODZAJ_USLUGI" VARCHAR2(30), 
	"CENNIK_ID_CENNIK" NUMBER NOT NULL ENABLE, 
	"USLUGA_ID_USLUGA" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "ID_TYP_USLUGI_PK" PRIMARY KEY ("ID_TYP_USLUGI")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "TYP_ZAPLATY" 
   (	"ID_TYP_ZAPLATY" NUMBER NOT NULL ENABLE, 
	"TYP_ZAPLATY" VARCHAR2(50), 
	 CONSTRAINT "ID_TYP_ZAPLATY_PK" PRIMARY KEY ("ID_TYP_ZAPLATY")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "USLUGA" 
   (	"ID_USLUGI" NUMBER NOT NULL ENABLE, 
	"DATA_ROZPOCZECIA" DATE, 
	"DATA_ZAKONCZENIA" DATE, 
	"OPIS_PRACY" VARCHAR2(300), 
	"PRACOWNICY_ID_PRACOWNIKA" NUMBER NOT NULL ENABLE, 
	"ZGLOSZENIA_ID_ZGLOSZENIA" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "ID_USLUGI_PK" PRIMARY KEY ("ID_USLUGI")
  USING INDEX  ENABLE
   ) ;

  CREATE TABLE "ZGLOSZENIA" 
   (	"ID_ZGLOSZENIA" NUMBER NOT NULL ENABLE, 
	"DATA_ZGLOSZENIA" DATE, 
	"OPIS_PROBLEMU" VARCHAR2(300), 
	"STATUS_ZGLOSZENIA" VARCHAR2(20), 
	"KLIENCI_ID_KLIENTA" NUMBER NOT NULL ENABLE, 
	"FAKTURA_ID_FAKTURY" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "ID_ZGLOSZENIA_PK" PRIMARY KEY ("ID_ZGLOSZENIA")
  USING INDEX  ENABLE
   ) ;

  ALTER TABLE "AKTUALIZACJA_CENNIKA" ADD CONSTRAINT "AKTUALIZACJA_CENNIKA_CENNIK_FK" FOREIGN KEY ("CENNIK_ID_CENNIK")
	  REFERENCES "CENNIK" ("ID_CENNIK") ENABLE;

  ALTER TABLE "CZESCI_ZAMIENNE" ADD CONSTRAINT "CZESCI_ZAMIENNE_DOSTAWCY_FK" FOREIGN KEY ("DOSTAWCY_ID_DOSTAWCY")
	  REFERENCES "DOSTAWCY" ("ID_DOSTAWCY") ENABLE;
  ALTER TABLE "CZESCI_ZAMIENNE" ADD CONSTRAINT "CZESCI_ZAMIENNE_TYP_CZESCI_ZAMIENNEJ_FK" FOREIGN KEY ("TYP_CZESCI_ZAMIENNEJ_ID_TYP_CZESCI_ZAMIENNEJ")
	  REFERENCES "TYP_CZESCI_ZAMIENNEJ" ("ID_TYP_CZESCI_ZAMIENNEJ") ENABLE;

  ALTER TABLE "FAKTURY" ADD CONSTRAINT "FAKTURY_TYP_ZAPLATY_FK" FOREIGN KEY ("TYP_ZAPLATY_ID_TYP_ZAPLATY")
	  REFERENCES "TYP_ZAPLATY" ("ID_TYP_ZAPLATY") ENABLE;

  ALTER TABLE "TYP_CZESCI_ZAMIENNEJ" ADD CONSTRAINT "TYP_CZESCI_ZAMIENNEJ_USLUGA_FK" FOREIGN KEY ("USLUGA_ID_USLUGA")
	  REFERENCES "USLUGA" ("ID_USLUGI") ENABLE;

  ALTER TABLE "TYP_SPRZETU" ADD CONSTRAINT "TYP_SPRZETU_SPRZET_FK" FOREIGN KEY ("SPRZET_ID_SPRZETU")
	  REFERENCES "SPRZET" ("ID_SPRZETU") ENABLE;
  ALTER TABLE "TYP_SPRZETU" ADD CONSTRAINT "TYP_SPRZETU_ZGLOSZENIA_FK" FOREIGN KEY ("ZGLOSZENIA_ID_ZGLOSZENIA")
	  REFERENCES "ZGLOSZENIA" ("ID_ZGLOSZENIA") ENABLE;

  ALTER TABLE "TYP_USLUGI" ADD CONSTRAINT "TYP_USLUGI_CENNIK_FK" FOREIGN KEY ("CENNIK_ID_CENNIK")
	  REFERENCES "CENNIK" ("ID_CENNIK") ENABLE;
  ALTER TABLE "TYP_USLUGI" ADD CONSTRAINT "TYP_USLUGI_USLUGA_FK" FOREIGN KEY ("USLUGA_ID_USLUGA")
	  REFERENCES "USLUGA" ("ID_USLUGI") ENABLE;

  ALTER TABLE "USLUGA" ADD CONSTRAINT "USLUGA_PRACOWNICY_FK" FOREIGN KEY ("PRACOWNICY_ID_PRACOWNIKA")
	  REFERENCES "PRACOWNICY" ("ID_PRACOWNIKA") ENABLE;
  ALTER TABLE "USLUGA" ADD CONSTRAINT "USLUGA_ZGLOSZENIA_FK" FOREIGN KEY ("ZGLOSZENIA_ID_ZGLOSZENIA")
	  REFERENCES "ZGLOSZENIA" ("ID_ZGLOSZENIA") ENABLE;

  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_DECREMENT_USLUGA" 
AFTER UPDATE OF DATA_ZAKONCZENIA ON USLUGA
FOR EACH ROW
 WHEN (OLD.DATA_ZAKONCZENIA IS NULL AND NEW.DATA_ZAKONCZENIA IS NOT NULL) BEGIN
    UPDATE PRACOWNICY
    SET LICZBA_AKTYWNYCH_USLUG = LICZBA_AKTYWNYCH_USLUG - 1
    WHERE ID_PRACOWNIKA = :NEW.PRACOWNICY_ID_PRACOWNIKA;
END;
/
ALTER TRIGGER "TRG_DECREMENT_USLUGA" ENABLE;
  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_INCREMENT_USLUGA" 
AFTER INSERT ON USLUGA
FOR EACH ROW
 WHEN (NEW.DATA_ZAKONCZENIA IS NULL) BEGIN
    UPDATE PRACOWNICY
    SET LICZBA_AKTYWNYCH_USLUG = LICZBA_AKTYWNYCH_USLUG + 1
    WHERE ID_PRACOWNIKA = :NEW.PRACOWNICY_ID_PRACOWNIKA;
END;
/
ALTER TRIGGER "TRG_INCREMENT_USLUGA" ENABLE;

  ALTER TABLE "ZGLOSZENIA" ADD CONSTRAINT "ZGLOSZENIA_FAKTURA_FK" FOREIGN KEY ("FAKTURA_ID_FAKTURY")
	  REFERENCES "FAKTURY" ("ID_FAKTURY") ENABLE;
  ALTER TABLE "ZGLOSZENIA" ADD CONSTRAINT "ZGLOSZENIA_KLIENCI_FK" FOREIGN KEY ("KLIENCI_ID_KLIENTA")
	  REFERENCES "KLIENCI" ("ID_KLIENTA") ENABLE;
create or replace FUNCTION fn_faktury_piped(p_klient_id NUMBER)
RETURN tab_faktury PIPELINED
IS
BEGIN
    FOR r IN (
        SELECT 
            F.Id_faktury, 
            F.Numer_faktury,
            F.Data_wystawienia, 
            Z.Id_zgloszenia,
            U.Id_uslugi,
            C.Typ_naprawy,
            C.Koszt_uslugi,
            COALESCE(SUM(CZ.Cena), 0) AS Koszt_czesci, 
            (C.Koszt_uslugi + COALESCE(SUM(CZ.Cena), 0)) AS Kwota_Calkowita,
            F.Status_faktury
        FROM Faktury F
        JOIN Zgloszenia Z ON F.Id_faktury = Z.Faktura_id_faktury
        JOIN Usluga U ON Z.Id_zgloszenia = U.Zgloszenia_id_zgloszenia
        JOIN Typ_uslugi TU ON U.Id_uslugi = TU.Usluga_id_usluga
        JOIN Cennik C ON TU.Cennik_id_cennik = C.Id_cennik
        LEFT JOIN Typ_czesci_zamiennej TCZ ON U.Id_uslugi = TCZ.Usluga_id_usluga
        LEFT JOIN Czesci_zamienne CZ ON TCZ.Typ_czesci_zamiennej = CZ.Typ_czesci 
        JOIN Typ_zaplaty T ON F.Typ_zaplaty_id_typ_zaplaty = T.Id_typ_zaplaty
        WHERE Z.Klienci_id_klienta = p_klient_id
        GROUP BY F.Id_faktury, F.Numer_faktury, F.Data_wystawienia, F.Status_faktury, 
                 F.Kwota, T.Typ_zaplaty, Z.Id_zgloszenia, U.Id_uslugi, 
                 C.Typ_naprawy, C.Koszt_uslugi
        ORDER BY F.Data_wystawienia DESC
    ) LOOP
        
        PIPE ROW(typ_faktura(
            r.Id_faktury,
            r.Numer_faktury,
            r.Data_wystawienia,
            r.Status_faktury,
            r.Id_zgloszenia,
            r.Id_uslugi,
            r.Typ_naprawy,
            r.Koszt_uslugi,
            r.Koszt_czesci,
            r.Kwota_Calkowita
        ));
    END LOOP;
    
    RETURN;
END fn_faktury_piped;
/
create or replace FUNCTION fn_liczba_zgloszen_na_miesiac RETURN VARCHAR2 IS
    v_sql VARCHAR2(4000);
BEGIN
    v_sql := 'SELECT TO_CHAR(DATA_ZGLOSZENIA, ''YYYY-MM'') AS MIESIAC, COUNT(*) AS LICZBA 
              FROM ZGLOSZENIA 
              GROUP BY TO_CHAR(DATA_ZGLOSZENIA, ''YYYY-MM'') 
              ORDER BY MIESIAC';
    RETURN v_sql;
END fn_liczba_zgloszen_na_miesiac;
/
create or replace FUNCTION fn_lista_uslug RETURN VARCHAR2 IS
    v_sql VARCHAR2(4000);
BEGIN
    v_sql := 'SELECT U.DATA_ROZPOCZECIA, 
                     U.DATA_ZAKONCZENIA, 
                     U.OPIS_PRACY, 
                     P.IMIE || '' '' || P.NAZWISKO AS PRACOWNIK, 
                     Z.OPIS_PROBLEMU 
              FROM USLUGA U
              JOIN PRACOWNICY P ON U.PRACOWNICY_ID_PRACOWNIKA = P.ID_PRACOWNIKA
              JOIN ZGLOSZENIA Z ON U.ZGLOSZENIA_ID_ZGLOSZENIA = Z.ID_ZGLOSZENIA
              ORDER BY U.DATA_ROZPOCZECIA DESC';
    RETURN v_sql;
END fn_lista_uslug;
/
create or replace FUNCTION fn_najczestsze_typy_sprzetu RETURN VARCHAR2 IS
    v_sql VARCHAR2(4000);
BEGIN
    v_sql := 'SELECT TYP_SPRZETU.TYP_SPRZETU, COUNT(ZGLOSZENIA.ID_ZGLOSZENIA) AS LICZBA
              FROM ZGLOSZENIA
              JOIN TYP_SPRZETU ON ZGLOSZENIA.ID_ZGLOSZENIA = TYP_SPRZETU.ZGLOSZENIA_ID_ZGLOSZENIA
              GROUP BY TYP_SPRZETU.TYP_SPRZETU
              ORDER BY LICZBA DESC
              FETCH FIRST 10 ROWS ONLY';
    RETURN v_sql;
END fn_najczestsze_typy_sprzetu;
/
create or replace FUNCTION FN_POBIERZ_AKTUALIZACJE_CENNIKA
RETURN TY_AKTUALIZACJA_CENNIKA_TABLE PIPELINED AS
    CURSOR c_aktualizacje IS
        SELECT Cennik_id_cennik, Data_aktualizacji_cennika 
        FROM Aktualizacja_cennika;
BEGIN
    FOR rec IN c_aktualizacje LOOP
        PIPE ROW (TY_AKTUALIZACJA_CENNIKA(rec.Cennik_id_cennik, rec.Data_aktualizacji_cennika));
    END LOOP;
    RETURN;
END;
/
create or replace FUNCTION FN_POBIERZ_CENNIK
RETURN TY_CENNIK_TABLE PIPELINED AS
    CURSOR c_cennik IS
        SELECT Id_cennik, Typ_naprawy, Koszt_uslugi 
        FROM Cennik;
BEGIN
    FOR rec IN c_cennik LOOP
        PIPE ROW (TY_CENNIK(rec.Id_cennik, rec.Typ_naprawy, rec.Koszt_uslugi));
    END LOOP;
    RETURN;
END;
/
create or replace FUNCTION FN_POBIERZ_CZESCI_ZAMIENNE
RETURN TY_CZESCI_ZAMIENNE_TABLE PIPELINED AS
    CURSOR c_czesci IS
        SELECT Id_czesci_zamienne, Model, Stan_magazynowy, Cena 
        FROM Czesci_zamienne;
BEGIN
    FOR rec IN c_czesci LOOP
        PIPE ROW (TY_CZESCI_ZAMIENNE(rec.Id_czesci_zamienne, rec.Model, rec.Stan_magazynowy, rec.Cena));
    END LOOP;
    RETURN;
END;
/
create or replace FUNCTION FN_POBIERZ_ZGLOSZENIA_W_TRAKCIE
RETURN TY_ZGLOSZENIE_TABLE PIPELINED AS
    CURSOR c_zgloszenia IS
        SELECT Id_zgloszenia, Data_Zgloszenia, Opis_problemu, Status_zgloszenia
        FROM Zgloszenia
        WHERE Status_zgloszenia = 'W trakcie';
BEGIN
    FOR rec IN c_zgloszenia LOOP
        PIPE ROW (TY_ZGLOSZENIE(rec.Id_zgloszenia, rec.Data_Zgloszenia, rec.Opis_problemu, rec.Status_zgloszenia));
    END LOOP;
    RETURN;
END;
/
create or replace FUNCTION FN_USLUGI_KALENDARZ
RETURN TY_USLUGA_TABLE PIPELINED AS
    CURSOR c_uslugi IS
        SELECT 
            Id_uslugi AS ID, 
            Opis_pracy AS TITLE, 
            Data_zakonczenia AS END_DATE,  
            CASE 
                WHEN Data_zakonczenia IS NULL THEN '#ffcc00'  -- Żółty dla aktywnych usług
                ELSE '#00cc66'  -- Zielony dla zakończonych usług
            END AS COLOR
        FROM Usluga;
BEGIN
    FOR rec IN c_uslugi LOOP
        PIPE ROW (TY_USLUGA(rec.ID, rec.TITLE, rec.END_DATE, rec.COLOR));  
    END LOOP;
    RETURN;
END;
/
create or replace FUNCTION fn_wartosc_faktur_na_miesiac RETURN VARCHAR2 IS
    v_sql VARCHAR2(4000);
BEGIN
    v_sql := 'SELECT TO_CHAR(DATA_WYSTAWIENIA, ''YYYY-MM'') AS MIESIAC, 
                     SUM(KWOTA) AS WARTOSC 
              FROM FAKTURY 
              GROUP BY TO_CHAR(DATA_WYSTAWIENIA, ''YYYY-MM'') 
              ORDER BY MIESIAC';
    RETURN v_sql;
END fn_wartosc_faktur_na_miesiac;
/
create or replace FUNCTION fn_zgloszenia_piped
RETURN tab_zgloszenia PIPELINED
IS
BEGIN
    FOR r IN (
        SELECT 
            Z.Id_zgloszenia,
            Z.Data_zgloszenia,
            Z.Opis_problemu,
            Z.Status_zgloszenia,
            K.Imie || ' ' || K.Nazwisko AS Klient,
            F.Numer_faktury
        FROM 
            Zgloszenia Z
        JOIN 
            Klienci K ON Z.Klienci_id_klienta = K.Id_klienta
        LEFT JOIN 
            Faktury F ON Z.Faktura_id_faktury = F.Id_faktury
        ORDER BY 
            Z.Data_zgloszenia DESC
    ) LOOP
        -- Przekazanie wyniku do strumienia (pipeline)
        PIPE ROW(typ_zgloszenia(
            r.Id_zgloszenia,
            r.Data_zgloszenia,
            r.Opis_problemu,
            r.Status_zgloszenia,
            r.Klient,
            r.Numer_faktury
        ));
    END LOOP;
    
    RETURN;
END fn_zgloszenia_piped;
/
create or replace FUNCTION fn_znajdz_najmniej_obciazonego_pracownika
RETURN NUMBER
IS
    v_id_pracownika NUMBER;
BEGIN
    SELECT ID_PRACOWNIKA
    INTO v_id_pracownika
    FROM PRACOWNICY
    ORDER BY LICZBA_AKTYWNYCH_USLUG ASC, ID_PRACOWNIKA ASC
    FETCH FIRST 1 ROW ONLY;

    RETURN v_id_pracownika;
END fn_znajdz_najmniej_obciazonego_pracownika;
/
create or replace FUNCTION GetCennikPipelined
RETURN CennikTable PIPELINED IS
BEGIN
    FOR rec IN (SELECT Id_cennik, Typ_naprawy, Koszt_uslugi FROM Cennik) LOOP
        PIPE ROW(CennikRow(rec.Id_cennik, rec.Typ_naprawy, rec.Koszt_uslugi));
    END LOOP;
END;
/
create or replace function login (
    p_username in varchar2,
    p_password in varchar2 )
    return boolean
is
begin
    -- This sample app allows authentication for any username, no password
    return true;
end;
/




































































  CREATE UNIQUE INDEX "ID_ADRESY_DOSTAWCOW_PK" ON "ADRESY_DOSTAWCOW" ("ID_ADRESY_DOSTAWCOW") 
  ;

  CREATE UNIQUE INDEX "ID_ADRESY_KLIENTOW_PK" ON "ADRESY_KLIENTOW" ("ID_ADRESY_KLIENTOW") 
  ;

  CREATE UNIQUE INDEX "ID_ADRESY_PRACOWNIKOW_PK" ON "ADRESY_PRACOWNIKOW" ("ID_ADRESY_PRACOWNIKOW") 
  ;

  CREATE UNIQUE INDEX "ID_AKTUALIZACJA_CENNIKA_PK" ON "AKTUALIZACJA_CENNIKA" ("ID_AKTUALIZACJA_CENNIKA") 
  ;

  CREATE UNIQUE INDEX "ID_CENNIK_PK" ON "CENNIK" ("ID_CENNIK") 
  ;

  CREATE UNIQUE INDEX "ID_CZESCI_ZAMIENNE_PK" ON "CZESCI_ZAMIENNE" ("ID_CZESCI_ZAMIENNE") 
  ;

  CREATE UNIQUE INDEX "ID_DOSTAWCY_PK" ON "DOSTAWCY" ("ID_DOSTAWCY") 
  ;

  CREATE UNIQUE INDEX "ID_FAKTURY_PK" ON "FAKTURY" ("ID_FAKTURY") 
  ;

  CREATE UNIQUE INDEX "ID_PRACOWNIKA_PK" ON "PRACOWNICY" ("ID_PRACOWNIKA") 
  ;

  CREATE UNIQUE INDEX "ID_SPRZETU_PK" ON "SPRZET" ("ID_SPRZETU") 
  ;

  CREATE UNIQUE INDEX "ID_TYP_CZESCI_ZAMIENNEJ_PK" ON "TYP_CZESCI_ZAMIENNEJ" ("ID_TYP_CZESCI_ZAMIENNEJ") 
  ;

  CREATE UNIQUE INDEX "ID_TYP_SPRZETU_PK" ON "TYP_SPRZETU" ("ID_TYP_SPRZETU") 
  ;

  CREATE UNIQUE INDEX "ID_TYP_USLUGI_PK" ON "TYP_USLUGI" ("ID_TYP_USLUGI") 
  ;

  CREATE UNIQUE INDEX "ID_TYP_ZAPLATY_PK" ON "TYP_ZAPLATY" ("ID_TYP_ZAPLATY") 
  ;

  CREATE UNIQUE INDEX "ID_USLUGI_PK" ON "USLUGA" ("ID_USLUGI") 
  ;

  CREATE UNIQUE INDEX "ID_ZGLOSZENIA_PK" ON "ZGLOSZENIA" ("ID_ZGLOSZENIA") 
  ;

  CREATE UNIQUE INDEX "KLIENCI_PK" ON "KLIENCI" ("ID_KLIENTA") 
  ;
















































































































create or replace PROCEDURE AKTUALIZUJ_CENNIK (
    p_cennik_id INT,
    p_nowy_koszt INT
) IS
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM Cennik WHERE Id_cennik = p_cennik_id;
    
    IF v_count = 0 THEN
        RAISE NO_DATA_FOUND;
    END IF;

    UPDATE Cennik
    SET Koszt_uslugi = p_nowy_koszt
    WHERE Id_cennik = p_cennik_id;

    INSERT INTO Aktualizacja_cennika (
        Id_aktualizacja_cennika,
        Data_aktualizacji_cennika,
        Cennik_id_cennik
    ) VALUES (
        SEQ_AKTUALIZACJA_CENNIKA.NEXTVAL, 
        SYSDATE,
        p_cennik_id
    );

    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('BŁĄD: Nie znaleziono rekordu w tabeli Cennik dla ID: ' || p_cennik_id);
        ROLLBACK;
        
    WHEN DUP_VAL_ON_INDEX THEN
  
        DBMS_OUTPUT.PUT_LINE('BŁĄD: Próba wstawienia duplikatu w tabeli Aktualizacja_cennika.');
        ROLLBACK;

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Wystąpił nieoczekiwany błąd: ' || SQLERRM);
        ROLLBACK;
END AKTUALIZUJ_CENNIK;
/
create or replace PROCEDURE aktualizuj_kwote_faktur(p_klient_id NUMBER)
IS
BEGIN
    FOR r IN (
        SELECT Id_faktury, Kwota_Calkowita
        FROM TABLE(fn_faktury_piped(p_klient_id))
    ) LOOP
        UPDATE Faktury
        SET Kwota = r.Kwota_Calkowita
        WHERE Id_faktury = r.Id_faktury;
    END LOOP;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Błąd podczas aktualizacji faktur: ' || SQLERRM);
END aktualizuj_kwote_faktur;
/
create or replace PROCEDURE AKTUALIZUJ_STAN_MAGAZYNOWY(
    p_czesc_id IN INT, 
    p_ilosc IN INT     
) IS
    v_stan_magazynowy INT;
BEGIN
    SELECT Stan_magazynowy
    INTO v_stan_magazynowy
    FROM Czesci_zamienne
    WHERE Id_czesci_zamienne = p_czesc_id;

    IF v_stan_magazynowy < p_ilosc THEN
        RAISE_APPLICATION_ERROR(-20001, 'Brak wystarczającej ilości części na magazynie.');
    END IF;

    UPDATE Czesci_zamienne
    SET Stan_magazynowy = Stan_magazynowy - p_ilosc
    WHERE Id_czesci_zamienne = p_czesc_id;

    COMMIT;
END;
/
create or replace PROCEDURE CLEAR_PAGE2_FIELDS (
    p_imie OUT VARCHAR2,
    p_nazwisko OUT VARCHAR2,
    p_telefon OUT VARCHAR2,
    p_adres_email OUT VARCHAR2,
    p_opis_problemu OUT VARCHAR2,
    p_typ_sprzetu OUT VARCHAR2,
    p_model OUT VARCHAR2,
    p_numer_seryjny OUT VARCHAR2,
    p_typ_zaplaty OUT VARCHAR2
) IS
BEGIN
    p_imie := NULL;
    p_nazwisko := NULL;
    p_telefon := NULL;
    p_adres_email := NULL;
    p_opis_problemu := NULL;
    p_typ_sprzetu := NULL;
    p_model := NULL;
    p_numer_seryjny := NULL;
    p_typ_zaplaty := NULL;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Błąd podczas czyszczenia pól formularza na stronie 2: ' || SQLERRM);
END CLEAR_PAGE2_FIELDS;
/
create or replace PROCEDURE PROC_WSTAW_DANE_ZGLOSZ (
    p_imie           IN VARCHAR2,
    p_nazwisko       IN VARCHAR2,
    p_telefon        IN VARCHAR2,
    p_adres_email    IN VARCHAR2,
    p_opis_problemu  IN VARCHAR2,
    p_typ_sprzetu    IN VARCHAR2,
    p_model          IN VARCHAR2,
    p_numer_seryjny  IN VARCHAR2,
    p_typ_zaplaty_id IN INT
) IS
    v_klient_id      INT;
    v_zgloszenie_id  INT;
    v_faktura_id     INT;
    v_typ_sprzetu_id INT;
    v_sprzet_id      INT;
    v_numer_faktury  VARCHAR2(30);
BEGIN
    IF p_imie IS NULL OR p_nazwisko IS NULL OR p_telefon IS NULL OR p_adres_email IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'Błąd: Dane klienta nie mogą być puste.');
    END IF;
    
    INSERT INTO Klienci (Id_klienta, Imie, Nazwisko, Telefon, Adres_email)
    VALUES (SEQ_KLIENCI.NEXTVAL, p_imie, p_nazwisko, p_telefon, p_adres_email)
    RETURNING Id_klienta INTO v_klient_id;

    v_numer_faktury := 'F-' || TO_CHAR(SYSDATE, 'YYYYMMDDHH24MI') || '-' || v_klient_id;

    INSERT INTO Faktury (Id_faktury, Opis, Numer_faktury, Data_wystawienia, Kwota, Typ_zaplaty_id_typ_zaplaty)
    VALUES (SEQ_FAKTURY.NEXTVAL, 'Faktura za usługę', v_numer_faktury, SYSDATE, 0, p_typ_zaplaty_id)
    RETURNING Id_faktury INTO v_faktura_id;

    INSERT INTO Zgloszenia (Id_zgloszenia, Data_zgloszenia, Opis_problemu, Status_zgloszenia, Klienci_id_klienta, Faktura_id_faktury)
    VALUES (SEQ_ZGLOSZENIA.NEXTVAL, SYSDATE, p_opis_problemu, 'Nowe', v_klient_id, v_faktura_id)
    RETURNING Id_zgloszenia INTO v_zgloszenie_id;

    INSERT INTO Sprzet (Id_sprzetu, Model, Numer_seryjny)
    VALUES (SEQ_SPRZET.NEXTVAL, p_model, p_numer_seryjny)
    RETURNING Id_sprzetu INTO v_sprzet_id;

    INSERT INTO Typ_sprzetu (Id_typ_sprzetu, Typ_sprzetu, Zgloszenia_id_zgloszenia, Sprzet_id_sprzetu)
    VALUES (SEQ_TYP_SPRZETU.NEXTVAL, p_typ_sprzetu, v_zgloszenie_id, v_sprzet_id)
    RETURNING Id_typ_sprzetu INTO v_typ_sprzetu_id;

    przypisz_zgloszenie_automatycznie(v_zgloszenie_id);

    COMMIT;

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Błąd: Duplikat danych (unikalny indeks naruszony).');
        
    WHEN VALUE_ERROR THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Błąd: Nieprawidłowe wartości wejściowe.');

    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Błąd podczas wstawiania zgłoszenia: ' || SQLERRM);
        RAISE;
END PROC_WSTAW_DANE_ZGLOSZ;
/
create or replace PROCEDURE przypisz_zgloszenie_automatycznie (
    p_id_zgloszenia NUMBER
) AS
    v_id_pracownika NUMBER;
    v_count_zgloszenie NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count_zgloszenie FROM Zgloszenia WHERE Id_zgloszenia = p_id_zgloszenia;
    IF v_count_zgloszenie = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Błąd: Zgłoszenie o podanym ID nie istnieje.');
    END IF;

    v_id_pracownika := fn_znajdz_najmniej_obciazonego_pracownika;


    IF v_id_pracownika IS NOT NULL THEN
        INSERT INTO USLUGA (ID_USLUGI, DATA_ROZPOCZECIA, ZGLOSZENIA_ID_ZGLOSZENIA, PRACOWNICY_ID_PRACOWNIKA)
        VALUES (SEQ_USLUGA.NEXTVAL, SYSDATE, p_id_zgloszenia, v_id_pracownika);

        UPDATE ZGLOSZENIA
        SET STATUS_ZGLOSZENIA = 'W trakcie'
        WHERE ID_ZGLOSZENIA = p_id_zgloszenia;

        COMMIT;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Brak dostępnych pracowników do przypisania zgłoszenia.');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Błąd: Nie znaleziono zgłoszenia o ID: ' || p_id_zgloszenia);
        
    WHEN DUP_VAL_ON_INDEX THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Błąd: Próba wstawienia duplikatu w tabeli USLUGA.');

    WHEN VALUE_ERROR THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Błąd: Nieprawidłowe wartości wejściowe.');

    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Błąd podczas przypisywania zgłoszenia: ' || SQLERRM);
        RAISE;
END przypisz_zgloszenie_automatycznie;
/
create or replace PROCEDURE ZAKONCZ_ZGLOSZENIE(
    p_zgloszenie_id IN INT,
    p_opis_pracy IN VARCHAR2,
    p_typ_czesci_id IN INT,
    p_czesc_id IN INT,
    p_data_zakonczenia IN DATE,
    p_typ_uslugi IN VARCHAR2, 
    p_cennik_id IN INT
) IS
    v_usluga_id INT;
    v_czesc_id INT;
    v_typ_czesci VARCHAR2(100);
BEGIN
    UPDATE Zgloszenia
    SET Status_zgloszenia = 'Zakończone',
        Data_zgloszenia = p_data_zakonczenia
    WHERE Id_zgloszenia = p_zgloszenie_id;

    SELECT Id_uslugi
    INTO v_usluga_id
    FROM Usluga
    WHERE Zgloszenia_id_zgloszenia = p_zgloszenie_id;


    UPDATE Usluga
    SET Data_zakonczenia = p_data_zakonczenia,
        Opis_pracy = p_opis_pracy
    WHERE Id_uslugi = v_usluga_id;

    INSERT INTO Typ_uslugi (Id_typ_uslugi, Rodzaj_uslugi, Cennik_id_cennik, Usluga_id_usluga)
    VALUES (
        SEQ_TYP_USLUGI.NEXTVAL, 
        p_typ_uslugi, 
        p_cennik_id,
        v_usluga_id
    );

    SELECT Typ_czesci_zamiennej 
    INTO v_typ_czesci
    FROM Typ_czesci_zamiennej 
    WHERE Id_typ_czesci_zamiennej = p_typ_czesci_id;

    INSERT INTO Typ_czesci_zamiennej (Id_typ_czesci_zamiennej, Typ_czesci_zamiennej, Usluga_id_usluga)
    VALUES (
        SEQ_TYP_CZESCI_ZAMIENNEJ.NEXTVAL, 
        v_typ_czesci,
        v_usluga_id
    );

 
    SELECT Id_czesci_zamienne
    INTO v_czesc_id
    FROM CZESCI_ZAMIENNE
    WHERE TYP_CZESCI = v_typ_czesci
    FETCH FIRST 1 ROW ONLY;

  
    IF v_czesc_id IS NOT NULL THEN
        AKTUALIZUJ_STAN_MAGAZYNOWY(p_czesc_id => v_czesc_id, p_ilosc => 1);
    END IF;

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Błąd podczas zamykania zgłoszenia: ' || SQLERRM);
END ZAKONCZ_ZGLOSZENIE;
/
create or replace PROCEDURE ZAPLAC_FAKTURE (
    p_faktura_id IN INT,
    p_typ_zaplaty IN VARCHAR2
) IS
    v_licznik INT;
BEGIN

    SELECT COUNT(*) INTO v_licznik 
    FROM Faktury 
    WHERE Id_faktury = p_faktura_id 
      AND Status_faktury = 'Opłacona';

    IF v_licznik > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Faktura została już opłacona.');
    END IF;

    UPDATE Faktury
    SET Status_faktury = 'Opłacona'
    WHERE Id_faktury = p_faktura_id;

    UPDATE Faktury
    SET Typ_zaplaty_id_typ_zaplaty = (
        SELECT Id_typ_zaplaty FROM Typ_zaplaty WHERE Typ_zaplaty = p_typ_zaplaty
    )
    WHERE Id_faktury = p_faktura_id
      AND EXISTS (SELECT 1 FROM Typ_zaplaty WHERE Typ_zaplaty = p_typ_zaplaty);

    
    COMMIT;
END;
/











































   CREATE SEQUENCE  "SEQ_AKTUALIZACJA_CENNIKA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 29 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SEQ_CENNIK"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SEQ_CZESCI_ZAMIENNE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SEQ_FAKTURY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 45 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SEQ_KLIENCI"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 45 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SEQ_PRACOWNICY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SEQ_SPRZET"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 45 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SEQ_TYP_CZESCI_ZAMIENNEJ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 38 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SEQ_TYP_SPRZETU"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 45 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SEQ_TYP_USLUGI"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 37 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SEQ_TYP_ZAPLATY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SEQ_USLUGA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 43 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;

   CREATE SEQUENCE  "SEQ_ZGLOSZENIA"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 45 NOCACHE  NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;


































































create or replace TRIGGER TRG_DECREMENT_USLUGA
AFTER UPDATE OF DATA_ZAKONCZENIA ON USLUGA
FOR EACH ROW
WHEN (OLD.DATA_ZAKONCZENIA IS NULL AND NEW.DATA_ZAKONCZENIA IS NOT NULL)
BEGIN
    UPDATE PRACOWNICY
    SET LICZBA_AKTYWNYCH_USLUG = LICZBA_AKTYWNYCH_USLUG - 1
    WHERE ID_PRACOWNIKA = :NEW.PRACOWNICY_ID_PRACOWNIKA;
END;
/
create or replace TRIGGER TRG_INCREMENT_USLUGA
AFTER INSERT ON USLUGA
FOR EACH ROW
WHEN (NEW.DATA_ZAKONCZENIA IS NULL)
BEGIN
    UPDATE PRACOWNICY
    SET LICZBA_AKTYWNYCH_USLUG = LICZBA_AKTYWNYCH_USLUG + 1
    WHERE ID_PRACOWNIKA = :NEW.PRACOWNICY_ID_PRACOWNIKA;
END;
/















  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_DECREMENT_USLUGA" 
AFTER UPDATE OF DATA_ZAKONCZENIA ON USLUGA
FOR EACH ROW
 WHEN (OLD.DATA_ZAKONCZENIA IS NULL AND NEW.DATA_ZAKONCZENIA IS NOT NULL) BEGIN
    UPDATE PRACOWNICY
    SET LICZBA_AKTYWNYCH_USLUG = LICZBA_AKTYWNYCH_USLUG - 1
    WHERE ID_PRACOWNIKA = :NEW.PRACOWNICY_ID_PRACOWNIKA;
END;
/
ALTER TRIGGER "TRG_DECREMENT_USLUGA" ENABLE;
  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_INCREMENT_USLUGA" 
AFTER INSERT ON USLUGA
FOR EACH ROW
 WHEN (NEW.DATA_ZAKONCZENIA IS NULL) BEGIN
    UPDATE PRACOWNICY
    SET LICZBA_AKTYWNYCH_USLUG = LICZBA_AKTYWNYCH_USLUG + 1
    WHERE ID_PRACOWNIKA = :NEW.PRACOWNICY_ID_PRACOWNIKA;
END;
/
ALTER TRIGGER "TRG_INCREMENT_USLUGA" ENABLE;




































































create or replace TYPE CennikRow AS OBJECT (
    Id_cennik NUMBER,
    Typ_naprawy VARCHAR2(100),
    Koszt_uslugi NUMBER
)
/
create or replace TYPE CennikTable AS TABLE OF CennikRow
/
create or replace TYPE tab_zgloszenia AS TABLE OF typ_zgloszenia
/
create or replace TYPE typ_zgloszenia AS OBJECT (
    Id_zgloszenia NUMBER,
    Data_zgloszenia DATE,
    Opis_problemu VARCHAR2(300),
    Status_zgloszenia VARCHAR2(50),
    Klient VARCHAR2(100),
    Numer_faktury VARCHAR2(50)
)
/
create or replace TYPE TY_AKTUALIZACJA_CENNIKA AS OBJECT (
    Cennik_id_cennik NUMBER,
    Data_aktualizacji_cennika DATE
)
/
create or replace TYPE TY_AKTUALIZACJA_CENNIKA_TABLE AS TABLE OF TY_AKTUALIZACJA_CENNIKA
/
create or replace TYPE TY_CENNIK AS OBJECT (
    Id_cennik NUMBER,
    Typ_naprawy VARCHAR2(100),
    Koszt_uslugi NUMBER
)
/
create or replace TYPE TY_CENNIK_TABLE AS TABLE OF TY_CENNIK
/
create or replace TYPE TY_CZESCI_ZAMIENNE AS OBJECT (
    Id_czesci_zamienne NUMBER,
    Model VARCHAR2(100),
    Stan_magazynowy NUMBER,
    Cena NUMBER
)
/
create or replace TYPE TY_CZESCI_ZAMIENNE_TABLE AS TABLE OF TY_CZESCI_ZAMIENNE
/
create or replace TYPE TY_USLUGA AS OBJECT (
    ID NUMBER,
    TITLE VARCHAR2(300),
    START_DATE DATE,
    COLOR VARCHAR2(10)
)
/
create or replace TYPE TY_USLUGA_TABLE AS TABLE OF TY_USLUGA
/
create or replace TYPE TY_ZGLOSZENIE AS OBJECT (
    Id_zgloszenia NUMBER,
    Data_Zgloszenia DATE,
    Opis_problemu VARCHAR2(300),
    Status_zgloszenia VARCHAR2(50)
)
/
create or replace TYPE TY_ZGLOSZENIE_TABLE AS TABLE OF TY_ZGLOSZENIE
/

  CREATE UNIQUE INDEX "ID_AKTUALIZACJA_CENNIKA_PK" ON "AKTUALIZACJA_CENNIKA" ("ID_AKTUALIZACJA_CENNIKA") 
  ;

  CREATE UNIQUE INDEX "ID_CENNIK_PK" ON "CENNIK" ("ID_CENNIK") 
  ;

  CREATE UNIQUE INDEX "ID_CZESCI_ZAMIENNE_PK" ON "CZESCI_ZAMIENNE" ("ID_CZESCI_ZAMIENNE") 
  ;

  CREATE UNIQUE INDEX "ID_FAKTURY_PK" ON "FAKTURY" ("ID_FAKTURY") 
  ;

  CREATE UNIQUE INDEX "KLIENCI_PK" ON "KLIENCI" ("ID_KLIENTA") 
  ;

  CREATE UNIQUE INDEX "ID_PRACOWNIKA_PK" ON "PRACOWNICY" ("ID_PRACOWNIKA") 
  ;

  CREATE UNIQUE INDEX "ID_SPRZETU_PK" ON "SPRZET" ("ID_SPRZETU") 
  ;

  CREATE UNIQUE INDEX "ID_TYP_CZESCI_ZAMIENNEJ_PK" ON "TYP_CZESCI_ZAMIENNEJ" ("ID_TYP_CZESCI_ZAMIENNEJ") 
  ;

  CREATE UNIQUE INDEX "ID_TYP_SPRZETU_PK" ON "TYP_SPRZETU" ("ID_TYP_SPRZETU") 
  ;

  CREATE UNIQUE INDEX "ID_TYP_USLUGI_PK" ON "TYP_USLUGI" ("ID_TYP_USLUGI") 
  ;

  CREATE UNIQUE INDEX "ID_TYP_ZAPLATY_PK" ON "TYP_ZAPLATY" ("ID_TYP_ZAPLATY") 
  ;

  CREATE UNIQUE INDEX "ID_USLUGI_PK" ON "USLUGA" ("ID_USLUGI") 
  ;

  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_DECREMENT_USLUGA" 
AFTER UPDATE OF DATA_ZAKONCZENIA ON USLUGA
FOR EACH ROW
 WHEN (OLD.DATA_ZAKONCZENIA IS NULL AND NEW.DATA_ZAKONCZENIA IS NOT NULL) BEGIN
    UPDATE PRACOWNICY
    SET LICZBA_AKTYWNYCH_USLUG = LICZBA_AKTYWNYCH_USLUG - 1
    WHERE ID_PRACOWNIKA = :NEW.PRACOWNICY_ID_PRACOWNIKA;
END;
/
ALTER TRIGGER "TRG_DECREMENT_USLUGA" ENABLE;
  CREATE OR REPLACE EDITIONABLE TRIGGER "TRG_INCREMENT_USLUGA" 
AFTER INSERT ON USLUGA
FOR EACH ROW
 WHEN (NEW.DATA_ZAKONCZENIA IS NULL) BEGIN
    UPDATE PRACOWNICY
    SET LICZBA_AKTYWNYCH_USLUG = LICZBA_AKTYWNYCH_USLUG + 1
    WHERE ID_PRACOWNIKA = :NEW.PRACOWNICY_ID_PRACOWNIKA;
END;
/
ALTER TRIGGER "TRG_INCREMENT_USLUGA" ENABLE;

  CREATE UNIQUE INDEX "ID_ZGLOSZENIA_PK" ON "ZGLOSZENIA" ("ID_ZGLOSZENIA") 
  ;

































































































































































