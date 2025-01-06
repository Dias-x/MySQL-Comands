#Verbindung von Schueler auf Klasse
SELECT *
FROM Schueler
LEFT JOIN Klasse ON Schueler.Klasse = Klasse.KlassenID;


#Verbinden von Klasse auf Schueler
SELECT *
FROM Klasse
LEFT JOIN Schueler ON Klasse.KlassenID = Schueler.Klasse;

SELECT *
FROM Dozent
LEFT JOIN Bewertung ON Dozent.DozentenID = Bewertung.BewertetVon;

SELECT *
FROM Modul
LEFT JOIN Bewertung ON Modul.ModulID = Bewertung.ModulId;

SELECT *
FROM Schueler
LEFT JOIN Bewertung ON Schueler.SchuelerID = Bewertung.SchuelerId;

SELECT *
FROM Stundenplan
LEFT JOIN Dozent ON Stundenplan.StundenplanID = Dozent.DozentenID;

SELECT *
FROM Stundenplan
LEFT JOIN Klasse ON Stundenplan.StundenplanID = Klasse.KlassenID;

SELECT *
FROM Stundenplan
LEFT JOIN Modul ON Stundenplan.StundenplanID = Modul.ModulID;

SELECT *
FROM Stundenplan
LEFT JOIN Raum ON Stundenplan.StundenplanID = Raum.RaumID;

#Select-Query mit WHERE Statement

#Alle Schüler, welche keiner Klasse zugeordent sind
SELECT * FROM Schueler
         WHERE Klasse IS NULL;


#Alle Schüler aus Klasse 1 oder Klasse 2
SELECT * FROM Schueler
         WHERE Klasse = 1
                OR Klasse = 2
                OR Klasse = 5 AND Email like '%.com';


#Alternativ
SELECT * FROM Schueler
WHERE Klasse IN (1,2,5) AND Email like '%.com';

#Alternativ 2
    SELECT * FROM Schueler
            WHERE Klasse BETWEEN (1,2,5) AND Email like '%.com';


#Klasse mit Bezeichnung ILB A23, ILB A24, ILB A22 ausführen
SELECT * FROM Klasse WHERE Name IN ('ILB A23', 'ILB A24', 'ILB A22');


#Auswertung
select 1 or 0, #1
1 and 0, #0
1 and 0 or 1, #1
0 or 1 and 1,#1
1 or 1 and 0, #0
1 or 1 and 1 #1
from dual;


#Wildcard (beliebig kombiniert werden)
#- % 0 oder mehr beliebig kombiniert werden
#- _ extakt 1 beliebeges Zeichen
SELECT *
FROM Schueler
WHERE Email like '%__' #Email muss mit exakt 2 beliebige Zeichen beinhalten


#Gruppierung von Datensätze
SELECT Klasse AS KlassenID
FROM Schueler
GROUP BY Klasse;

SELECT Name,  StundenplanID
FROM Dozent
LEFT JOIN schulverwaltung.Stundenplan S on Dozent.DozentenID = S.DozentId;

#Aufzählen von Schüler in einer Klasse
SELECT COUNT(*) AS "Schüleranzahl", Klasse
FROM Schueler
GROUP BY Klasse;

#Tabellen Namen auswählen
SELECT CONCAT (Vorname, ' ', Name) "Vollständiger Name", Klasse AS KlassenID
FROM Schueler;

