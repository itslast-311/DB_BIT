----
-- phpLiteAdmin database dump (https://www.phpliteadmin.org/)
-- phpLiteAdmin versione: 1.9.8.2
-- Esportato: 12:29 del 6 Oct, 2020 A.D. (CEST)
-- database file: db/ScuoladiHokuto
----
BEGIN TRANSACTION;

----
-- Table struttura per studente
----
CREATE TABLE 'studente' ('IdStudente' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'Nome' TEXT, 'Cognome' TEXT, 'DataDiNascita' NUMERIC, 'DatiAnagrafici' TEXT);

----
-- Dump dei dati per studente, un totale di 0 righe
----

----
-- Table struttura per docente
----
CREATE TABLE 'docente' ('IdDocente' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'Nome' TEXT, 'Cognome' TEXT, 'DataDiNascita' NUMERIC, 'DatiAnagrafici' TEXT);

----
-- Dump dei dati per docente, un totale di 0 righe
----

----
-- Table struttura per materia
----
CREATE TABLE 'materia' ('IdMateria' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'Nome' TEXT, 'Descrizione' TEXT);

----
-- Dump dei dati per materia, un totale di 0 righe
----

----
-- Table struttura per calendario
----
CREATE TABLE 'calendario' ('IdCalendario' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 'Data' NUMERIC,'Descrizione' TEXT);

----
-- Dump dei dati per calendario, un totale di 0 righe
----
COMMIT;
