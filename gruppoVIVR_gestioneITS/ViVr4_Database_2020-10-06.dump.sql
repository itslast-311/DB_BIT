----
-- phpLiteAdmin database dump (https://www.phpliteadmin.org/)
-- phpLiteAdmin versione: 1.9.8.2
-- Esportato: 11:51 del 6 Oct, 2020 A.D. (CEST)
-- database file: db/ViVr4_Database
----
BEGIN TRANSACTION;

----
-- Table struttura per Classi
----
CREATE TABLE Classi(
	idClasse INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT
);

----
-- Dump dei dati per Classi, un totale di 0 righe
----

----
-- Table struttura per Docenti
----
CREATE TABLE Docenti(
	idDocente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    cognome TEXT,
    CF TEXT,
    materia TEXT
);

----
-- Dump dei dati per Docenti, un totale di 0 righe
----

----
-- Table struttura per Studenti
----
CREATE TABLE Studenti(
	idStudente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    cognome TEXT,
    CF TEXT,
    corso TEXT,
    cod_classe INTEGER,
    FOREIGN KEY (cod_classe) REFERENCES Classi(idClasse)
);

----
-- Dump dei dati per Studenti, un totale di 0 righe
----

----
-- Table struttura per Lezioni
----
CREATE TABLE Lezioni(
	idLezione INTEGER PRIMARY KEY AUTOINCREMENT,
    materia TEXT,
    cod_docente INTEGER,
    cod_classe INTEGER,
    FOREIGN KEY (cod_docente) REFERENCES Docenti(idDocente),
    FOREIGN KEY (cod_classe) REFERENCES Classi(idClasse)
);

----
-- Dump dei dati per Lezioni, un totale di 0 righe
----

----
-- Table struttura per Calendario
----
CREATE TABLE Calendario(
	idCalendario INTEGER PRIMARY KEY AUTOINCREMENT,
    data TEXT,
    inizioLezione INTEGER,
    fineLezione INTEGER,
    cod_lezione INTEGER,
    FOREIGN KEY (cod_lezione) REFERENCES Lezioni(idLezione)
);

----
-- Dump dei dati per Calendario, un totale di 0 righe
----
COMMIT;
