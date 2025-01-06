/*Create DATABASE*/
CREATE DATABASE IF NOT EXISTS Schulverwaltung;

/* Set Schulverwaltung Databse as active Databse*/
USE Schulverwaltung;



DROP TABLE IF EXISTS Stundenplan;
DROP TABLE IF EXISTS Bewertung;
DROP TABLE IF EXISTS Dozent;
DROP TABLE IF EXISTS Raum;
DROP TABLE IF EXISTS Schueler;
DROP TABLE IF EXISTS Klasse;
DROP TABLE IF EXISTS Modul;

/*Create Table = Eine Tabelle Erstellen*/
CREATE TABLE IF NOT EXISTS Klasse (
    KlassenID INT PRIMARY KEY AUTO_INCREMENT,
    `Name` CHAR (20) NOT NULL,
    Jahrgang INT (4) NOT NULL
);

CREATE TABLE IF NOT EXISTS Schueler(
    SchuelerID INT PRIMARY KEY AUTO_INCREMENT,
    `Name`CHAR (20) NOT NULL,
    `Vorname`CHAR (20) NOT NULL,
    Email CHAR (255) NOT NULL UNIQUE,
    Klasse INT,

    /* Feld Schueler.Klasse referenziert Klasse.KlasseID --> Foreign Key Constraint hat den Namen FK_SCHUELER_KLASSE*/
    /*           Name               Key     Table auswahl, Reference = Verbindung von Table zur spalte KlassenID*/
    CONSTRAINT FK_SCHUELER_KLASSE FOREIGN KEY (Klasse) REFERENCES Klasse(KlassenID)

);


CREATE TABLE IF NOT EXISTS Dozent(
    DozentenID INT PRIMARY KEY AUTO_INCREMENT,
    `Name`CHAR (20) NOT NULL,
    Email CHAR (255) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Raum (
    RaumID INT PRIMARY KEY AUTO_INCREMENT,
    Bezeichnung CHAR (10) NOT NULL UNIQUE,
    Stockwerk INT NOT NULL,
    EDV BIT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS Modul(
    ModulID INT PRIMARY KEY AUTO_INCREMENT,
    ModulNr CHAR (5) NOT NULL,
    Bezeichnung CHAR (150) NOT NULL
);

CREATE TABLE IF NOT EXISTS Bewertung(
    BewertungID INT PRIMARY KEY AUTO_INCREMENT,
    Punkte INT (5) NOT NULL,
    MAXPunkte INT (5) NOT NULL,
    ModulId INT,
    BewertetVon INT,
    SchuelerId INT,
    CONSTRAINT FK_BEWERTUNG_MODUL FOREIGN KEY (ModulId) REFERENCES Modul(ModulID),
    CONSTRAINT FK_BEWERTUNG_DOZENT FOREIGN KEY (BewertetVon) REFERENCES Dozent(DozentenID),
    CONSTRAINT FK_BEWERTUNG_SCHUELER FOREIGN KEY (SchuelerId) REFERENCES Schueler(SchuelerID)
);

CREATE TABLE IF NOT EXISTS Stundenplan (
    StundenplanID INT PRIMARY KEY AUTO_INCREMENT,
    DozentId INT,
    ModulId INT,
    KlasseId INT,
    RaumId INT,
    Von DATETIME NOT NULL,
    Bis DATETIME NOT NULL,
    CONSTRAINT FK_STUNDENPLAN_DOZENT FOREIGN KEY (DozentId) REFERENCES Dozent(DozentenID),
    CONSTRAINT FK_STUNDENPLAN_MODUL FOREIGN KEY (ModulId) REFERENCES Modul(ModulID),
    CONSTRAINT FK_STUNDENPLAN_KLASSE FOREIGN KEY (KlasseId) REFERENCES Klasse(KlassenID),
    CONSTRAINT FK_STUNDENPLAN_RAUM FOREIGN KEY (RaumId) REFERENCES Raum (RaumID)
);


/* Rename vorhandene Name in ausgewählten Namen*/
-- RENAME TABLE Klasse TO Klassen;




/*Insert Row into Klass-Table*/
INSERT INTO Klasse (Name, Jahrgang) VALUES ('ILB A24' , 2024);
INSERT INTO Klasse (Name, Jahrgang) VALUES ('ILB A23' , 2023);
INSERT INTO Klasse (Name, Jahrgang) VALUES ('ILB A22' , 2022);
INSERT INTO Klasse (Name, Jahrgang) VALUES ('ILB A21' , 2022);

/* Insert Row into Schueler-Table*/
insert into Schueler (Name, Vorname, Email, Klasse) values ('Jacquest', 'Elva', 'ejacquest0@a8.net', 3);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Kmicicki', 'Kevina', 'kkmicicki1@i2i.jp', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Grestie', 'Tiebold', 'tgrestie2@blinklist.com', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Pichmann', 'Holli', 'hpichmann3@wikimedia.org', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Billin', 'Harli', 'hbillin4@google.cn', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Ferretti', 'Wittie', 'wferretti5@slideshare.net', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Fylan', 'Thekla', 'tfylan6@creativecommons.org', 3);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Baldam', 'Farrell', 'fbaldam7@domainmarket.com', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Canto', 'Carie', 'ccanto8@ted.com', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Kristufek', 'Axel', 'akristufek9@scientificamerican.com', 4);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Marmion', 'Pen', 'pmarmiona@freewebs.com', 3);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Schettini', 'Vin', 'vschettinib@symantec.com', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Rashleigh', 'Livvyy', 'lrashleighc@uiuc.edu', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Hanshawe', 'Hedvige', 'hhanshawed@netvibes.com', 4);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Radleigh', 'Gerta', 'gradleighe@sphinn.com', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Reglar', 'Rhonda', 'rreglarf@imdb.com', 4);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Busfield', 'Kriste', 'kbusfieldg@statcounter.com', 3);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Rayburn', 'Vite', 'vrayburnh@samsung.com', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Simmings', 'Jemima', 'jsimmingsi@boston.com', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Van Halle', 'Blake', 'bvanhallej@studiopress.com', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Attenborrow', 'Brody', 'battenborrowk@blogtalkradio.com', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Schneidar', 'Mac', 'mschneidarl@bravesites.com', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Seywood', 'Alexia', 'aseywoodm@cdbaby.com', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Omrod', 'Cassie', 'comrodn@behance.net', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Jury', 'Darcy', 'djuryo@archive.org', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Sacase', 'Torrence', 'tsacasep@google.es', 3);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Juett', 'Pen', 'pjuettq@1688.com', 3);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Minchella', 'Julian', 'jminchellar@globo.com', 3);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Spires', 'Henri', 'hspiress@kickstarter.com', 4);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Burry', 'Corbin', 'cburryt@columbia.edu', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Baudin', 'Robinet', 'rbaudinu@examiner.com', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Fairpo', 'Vitoria', 'vfairpov@npr.org', 3);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Inde', 'Kathe', 'kindew@mysql.com', 3);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Pickance', 'Khalil', 'kpickancex@kickstarter.com', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('McClaren', 'Judye', 'jmcclareny@usa.gov', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Ceresa', 'Wallis', 'wceresaz@wix.com', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Imloch', 'Bambi', 'bimloch10@ow.ly', 3);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Gjerde', 'Tammy', 'tgjerde11@earthlink.net', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Tolan', 'Melony', 'mtolan12@sakura.ne.jp', 4);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Wackley', 'Lane', 'lwackley13@hud.gov', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Salasar', 'Fraze', 'fsalasar14@accuweather.com', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Ketley', 'Klarrisa', 'kketley15@craigslist.org', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Congdon', 'Glynn', 'gcongdon16@phpbb.com', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Rockcliffe', 'Ringo', 'rrockcliffe17@cisco.com', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Sergison', 'Winn', 'wsergison18@altervista.org', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Astling', 'Nydia', 'nastling19@addthis.com', 3);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Hosburn', 'Loretta', 'lhosburn1a@mapy.cz', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Bunclark', 'Yank', 'ybunclark1b@intel.com', 2);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Stainer', 'Aida', 'astainer1c@nature.com', 1);
insert into Schueler (Name, Vorname, Email, Klasse) values ('Micklewright', 'Ricca', 'rmicklewright1d@icio.us', 1);


/*Insert Row into Dozenten-Table*/
insert into Dozent (Name, Email) values ('McKevitt', 'smckevitt0@cam.ac.uk');
insert into Dozent (Name, Email) values ('Schinetti', 'aschinetti1@nature.com');
insert into Dozent (Name, Email) values ('Kilmary', 'kkilmary2@senate.gov');
insert into Dozent (Name, Email) values ('Yard', 'cyard3@yelp.com');


/*Insert Row into Raum-Table*/
insert into Raum (Bezeichnung, Stockwerk) values ('Volkswagen', 1);
insert into Raum (Bezeichnung, Stockwerk) values ('Chevrolet', 2);
insert into Raum (Bezeichnung, Stockwerk) values ('Dodge', 3);


/*Insert Row into Modul-Table*/
insert into Modul (ModulNr, Bezeichnung) values (18, 'vel sem sed sagittis nam');
insert into Modul (ModulNr, Bezeichnung) values (2, 'donec posuere metus vitae ipsum aliquam non mauris');
insert into Modul (ModulNr, Bezeichnung) values (45, 'vivamus vel nulla eget eros elementum pellentesque quisque porta');
insert into Modul (ModulNr, Bezeichnung) values (34, 'vitae nisl aenean lectus pellentesque eget nunc donec');
insert into Modul (ModulNr, Bezeichnung) values (58, 'ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna');
insert into Modul (ModulNr, Bezeichnung) values (7, 'porta volutpat erat quisque erat eros viverra eget congue eget');


/*Insert Row into Bewertung-Table*/
insert into Bewertung (Punkte, MaxPunkte) values (82, 100);
insert into Bewertung (Punkte, MaxPunkte) values (15, 100);
insert into Bewertung (Punkte, MaxPunkte) values (40, 100);
insert into Bewertung (Punkte, MaxPunkte) values (18, 100);
insert into Bewertung (Punkte, MaxPunkte) values (26, 100);
insert into Bewertung (Punkte, MaxPunkte) values (14, 100);
insert into Bewertung (Punkte, MaxPunkte) values (66, 100);
insert into Bewertung (Punkte, MaxPunkte) values (54, 100);
insert into Bewertung (Punkte, MaxPunkte) values (93, 100);
insert into Bewertung (Punkte, MaxPunkte) values (75, 100);
insert into Bewertung (Punkte, MaxPunkte) values (58, 100);
insert into Bewertung (Punkte, MaxPunkte) values (60, 100);
insert into Bewertung (Punkte, MaxPunkte) values (25, 100);
insert into Bewertung (Punkte, MaxPunkte) values (14, 100);
insert into Bewertung (Punkte, MaxPunkte) values (56, 100);
insert into Bewertung (Punkte, MaxPunkte) values (56, 100);
insert into Bewertung (Punkte, MaxPunkte) values (100, 100);
insert into Bewertung (Punkte, MaxPunkte) values (19, 100);
insert into Bewertung (Punkte, MaxPunkte) values (55, 100);
insert into Bewertung (Punkte, MaxPunkte) values (26, 100);
insert into Bewertung (Punkte, MaxPunkte) values (99, 100);
insert into Bewertung (Punkte, MaxPunkte) values (54, 100);
insert into Bewertung (Punkte, MaxPunkte) values (3, 100);
insert into Bewertung (Punkte, MaxPunkte) values (79, 100);
insert into Bewertung (Punkte, MaxPunkte) values (31, 100);
insert into Bewertung (Punkte, MaxPunkte) values (85, 100);
insert into Bewertung (Punkte, MaxPunkte) values (52, 100);
insert into Bewertung (Punkte, MaxPunkte) values (40, 100);
insert into Bewertung (Punkte, MaxPunkte) values (97, 100);
insert into Bewertung (Punkte, MaxPunkte) values (39, 100);
insert into Bewertung (Punkte, MaxPunkte) values (19, 100);
insert into Bewertung (Punkte, MaxPunkte) values (71, 100);
insert into Bewertung (Punkte, MaxPunkte) values (97, 100);
insert into Bewertung (Punkte, MaxPunkte) values (80, 100);
insert into Bewertung (Punkte, MaxPunkte) values (21, 100);
insert into Bewertung (Punkte, MaxPunkte) values (75, 100);
insert into Bewertung (Punkte, MaxPunkte) values (30, 100);
insert into Bewertung (Punkte, MaxPunkte) values (62, 100);
insert into Bewertung (Punkte, MaxPunkte) values (100, 100);
insert into Bewertung (Punkte, MaxPunkte) values (44, 100);
insert into Bewertung (Punkte, MaxPunkte) values (12, 100);
insert into Bewertung (Punkte, MaxPunkte) values (22, 100);
insert into Bewertung (Punkte, MaxPunkte) values (94, 100);
insert into Bewertung (Punkte, MaxPunkte) values (12, 100);
insert into Bewertung (Punkte, MaxPunkte) values (20, 100);
insert into Bewertung (Punkte, MaxPunkte) values (47, 100);
insert into Bewertung (Punkte, MaxPunkte) values (37, 100);
insert into Bewertung (Punkte, MaxPunkte) values (15, 100);
insert into Bewertung (Punkte, MaxPunkte) values (64, 100);
insert into Bewertung (Punkte, MaxPunkte) values (95, 100);


/*Insert Row into Stundenplan-Table = Klasse ILB21*/
insert into Stundenplan (Von, Bis) values ('8:29 AM', '11:49 AM');
insert into Stundenplan (Von, Bis) values ('2:19 PM', '4:59 PM');
insert into Stundenplan (Von, Bis) values ('8:31 AM', '5:00 PM');
insert into Stundenplan (Von, Bis) values ('8:37 AM', '2:40 PM');
insert into Stundenplan (Von, Bis) values ('10:02 AM', '1:39 PM');
insert into Stundenplan (Von, Bis) values ('1:39 PM', '5:00 PM');


/*Insert Row into Stundenplan-Table = Klasse ILB22*/
insert into Stundenplan (Von, Bis) values ('1:53 PM', '4:02 PM');
insert into Stundenplan (Von, Bis) values ('3:34 PM', '5:00 AM');
insert into Stundenplan (Von, Bis) values ('11:07 AM', '4:08 PM');
insert into Stundenplan (Von, Bis) values ('10:38 AM', '4:27 PM');
insert into Stundenplan (Von, Bis) values ('8:43 AM', '1:18 PM');
insert into Stundenplan (Von, Bis) values ('9:13 AM', '3:45 PM');


/*Insert Row into Stundenplan-Table = Klasse ILB23*/


insert into Stundenplan (Von, Bis) values ('1:18 PM', '3:47 PM');
insert into Stundenplan (Von, Bis) values ('9:56 AM', '1:55 PM');
insert into Stundenplan (Von, Bis) values ('12:44 PM', '4:30 PM');
insert into Stundenplan (Von, Bis) values ('11:44 AM', '2:04 PM');
insert into Stundenplan (Von, Bis) values ('8:53 AM', '11:03 AM');
insert into Stundenplan (Von, Bis) values ('11:01 AM', '3:51 PM');


/*Insert Row into Stundenplan-Table = Klasse ILB24*/
insert into Stundenplan (Von, Bis) values ('2:54 PM', '4:01 PM');
insert into Stundenplan (Von, Bis) values ('9:01 AM', '2:02 PM');
insert into Stundenplan (Von, Bis) values ('8:29 AM', '1:22 PM');
insert into Stundenplan (Von, Bis) values ('8:26 AM', '1:16 PM');
insert into Stundenplan (Von, Bis) values ('1:09 PM', '4:50 PM');
insert into Stundenplan (Von, Bis) values ('10:39 AM', '3:06 PM');





/*Insert Row into Raum-Table*/
/*INSERT INTO Raum(Bezeichnung, Stockwerk) VALUES ('Rom', 3);

/*Select all entries with all columns = Zeigt alle spalten von der Tabelle "Klasse"
-Wenn es die LETZTE Zeile des Codes ist, bracuht es keinen ";" aber wenn es noch weitere Codes kommt,
braucht es ein ";" damit es kein ERROR gibt.*/
SELECT * FROM Klasse;

/* Select all entries with all columns*/
SELECT * FROM Raum;

/* Update Raum-Table = Aktualisieren*/
UPDATE Raum SET Stockwerk = 13 WHERE RaumID = 1;

/* Delete Raum-Table die RaumId 1*/
DELETE FROM Raum WHERE RaumId = 1;
/*
/* DDL (Data Definition Language)*/
/*CREATE TABLE xy (TableColumn int not null); --Create Table
ALTER TABLE xy ADD COLUMN TableColumn2 char (10) null; --Alters Table
DROP TABLE xy -- Remove Table

/* DML (Data Manipulation Language)*/
/*INSERT ... -- Daten Einfügen
UPDATE ... -- vorhandene Daten ändern
SELECT * FROM ... WHERE -- Auswählen von Daten
DELETE -- Daten löschen*/


