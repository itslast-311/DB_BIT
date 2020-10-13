----
-- phpLiteAdmin database dump (https://www.phpliteadmin.org/)
-- phpLiteAdmin versione: 1.9.8.2
-- Esportato: 12:10 del 13 Oct, 2020 A.D. (CEST)
-- database file: db/EmaSimoMattia_bliblio
----
BEGIN TRANSACTION;

----
-- Table struttura per Biblioteca
----
CREATE TABLE Biblioteca (
    idBiblioteca TEXT PRIMARY KEY NOT NULL,
    nome TEXT NOT NULL,
    città TEXT NOT NULL,
    indirizzo TEXT NOT NULL,
    email TEXT NOT NULL,
    telefono TEXT NOT NULL
);

----
-- Dump dei dati per Biblioteca, un totale di 3 righe
----
INSERT INTO "Biblioteca" ("idBiblioteca","nome","città","indirizzo","email","telefono") VALUES ('asdfg','Biblioteca','Napoli','Via brombeis 42','bibliotecadinapoli@libri.com','3401234567');
INSERT INTO "Biblioteca" ("idBiblioteca","nome","città","indirizzo","email","telefono") VALUES ('qwert','Biblioteca Comunale','Verona','Via Cavour 12','bibliotecadiverona@studia.com','3402345678');
INSERT INTO "Biblioteca" ("idBiblioteca","nome","città","indirizzo","email","telefono") VALUES ('zxcvb','Biblioteca bella','Bari','via Giuseppe Garibaldi 7','bibliotecastrabella@bari.com','0459876543');

----
-- Table struttura per Utenti
----
CREATE TABLE Utenti (
    idUtenti TEXT PRIMARY KEY NOT NULL,
    idBiblioteca TEXT NOT NULL,
    nome TEXT NOT NULL,
    cognome TEXT NOT NULL,
    CF TEXT NOT NULL,
    dataNascita TEXT NOT NULL,
    residenza TEXT NOT NULL,
    email TEXT NOT NULL,
    telefono TEXT NOT NULL,
    FOREIGN KEY (idBiblioteca) REFERENCES Biblioteca(idBiblioteca)
);

----
-- Dump dei dati per Utenti, un totale di 6 righe
----
INSERT INTO "Utenti" ("idUtenti","idBiblioteca","nome","cognome","CF","dataNascita","residenza","email","telefono") VALUES ('cv001','asdfg','Mario','Rossi','RSSMRA80A01F839W','01/01/1980','Napoli','mariorossi@gmail.com','0444435676');
INSERT INTO "Utenti" ("idUtenti","idBiblioteca","nome","cognome","CF","dataNascita","residenza","email","telefono") VALUES ('cv002','asdfg','Banana','Jo','RSSMRA80A01F839W','01/01/1980','Napoli','aa@gmail.com','32');
INSERT INTO "Utenti" ("idUtenti","idBiblioteca","nome","cognome","CF","dataNascita","residenza","email","telefono") VALUES ('cs333','qwert','Albarto','Rossi','aaaa','12-12-1970','Vicenza','aa@gmail.com','45');
INSERT INTO "Utenti" ("idUtenti","idBiblioteca","nome","cognome","CF","dataNascita","residenza","email","telefono") VALUES ('abcde','qwert','Paolo','Violi','PLAVLI80A01F839M','01/01/1980','zsjhgvdfk','sdvasfg','sdfaertg');
INSERT INTO "Utenti" ("idUtenti","idBiblioteca","nome","cognome","CF","dataNascita","residenza","email","telefono") VALUES ('ggggg','zxcvb','Lorenzo','Lorenzini','c23e726rtfyuhsf2','12/02/1998','asdgf','sdfghhjyrt','xcvbnbvfd');
INSERT INTO "Utenti" ("idUtenti","idBiblioteca","nome","cognome","CF","dataNascita","residenza","email","telefono") VALUES ('cd444','zxcvb','Paolo','Maruca','MRCPLA80A01L781L','23-03-1998','verona','paolo@gmail.com','3456656789');

----
-- Table struttura per Libri
----
CREATE TABLE Libri (
	idLibri TEXT PRIMARY KEY NOT NULL, 
	idBiblioteca TEXT NOT NULL, 
	titolo TEXT NOT NULL,
	genere TEXT NOT NULL, 
	autore TEXT NOT NULL, 
	edizione TEXT NOT NULL,
	disponibilita BOOLEAN DEFAULT 1, 
	FOREIGN KEY (idBiblioteca) REFERENCES Biblioteca(idBiblioteca) 
);

----
-- Dump dei dati per Libri, un totale di 9 righe
----
INSERT INTO "Libri" ("idLibri","idBiblioteca","titolo","genere","autore","edizione","disponibilita") VALUES ('ssd00','asdfg',' L UOMO CHE GUARDA','horror','Mario','a','1');
INSERT INTO "Libri" ("idLibri","idBiblioteca","titolo","genere","autore","edizione","disponibilita") VALUES ('aaqww','asdfg','7 NOTTI DI SANGUE','horror','Mario','a','1');
INSERT INTO "Libri" ("idLibri","idBiblioteca","titolo","genere","autore","edizione","disponibilita") VALUES ('qqwwe','qwert','743 GIORNI LONTANO DA CASA','comico','Tony','q','1');
INSERT INTO "Libri" ("idLibri","idBiblioteca","titolo","genere","autore","edizione","disponibilita") VALUES ('ssdrr','zxcvb','900 CAPOLAVORI DELLA NARRATIVA CONTEMPORANEA','fantasy','Tony','w','1');
INSERT INTO "Libri" ("idLibri","idBiblioteca","titolo","genere","autore","edizione","disponibilita") VALUES ('L0000','asdfg','100 ANNI DI MAFIA','Fantasy','Loschiavo Giuseppe','1234567890','1');
INSERT INTO "Libri" ("idLibri","idBiblioteca","titolo","genere","autore","edizione","disponibilita") VALUES ('zxxcx','zxcvb','GIOVANE DI BUONE SPERANZE','fantasy','Alfonso','asadew','1');
INSERT INTO "Libri" ("idLibri","idBiblioteca","titolo","genere","autore","edizione","disponibilita") VALUES ('L0001','qwert','A CENA COL COMMENDATORE','Giallo','Soldati Mario','123456789','0');
INSERT INTO "Libri" ("idLibri","idBiblioteca","titolo","genere","autore","edizione","disponibilita") VALUES ('12345','qwert','MUGLIERA CA PRIMM E SPUSA','horror','Mario','deuhfvcuie','1');
INSERT INTO "Libri" ("idLibri","idBiblioteca","titolo","genere","autore","edizione","disponibilita") VALUES ('4567y','qwert','A QUALE TRIBU APPARTIENI LETTERE DAL SAHARA','letterario','Alberta','nfrfnier','1');

----
-- Table struttura per Storico
----
CREATE TABLE Storico (
    idStorico TEXT PRIMARY KEY NOT NULL,
    idUtenti TEXT NOT NULL,
    idLibri TEXT NOT NULL,
    dataRitiro DATE NOT NULL,
    dataConsegna DATE,
    FOREIGN KEY (idUtenti) REFERENCES Utenti(idUtenti),
    FOREIGN KEY (idLibri) REFERENCES Libri(idLibri) 
    );

----
-- Dump dei dati per Storico, un totale di 17 righe
----
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('S0000','abcde','L0001','01/01/1903',NULL);
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('123fg','cs333','ssd00','10/01/2010',NULL);
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('dfgty','cv001','aaqww','12/12/2020','18/12/2020');
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('S0002','cv001','ssdrr','12/09/2019','24/09/2019');
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('hjkgl','cs333','aaqww','1/10/2019','10/10/2019');
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('S0003','ggggg','12345','15/08/2020','31/08/2020');
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('S0004','cv001','L0000','07/05/2008','07/08/2011');
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('lkasz','cv001','4567y','20/02/2018','23/02/2018');
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('S0005','cs333','zxxcx','20/04/2020','03/05/2020');
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('bhgvc','abcde','12345','5/04/2018','15/04/2018');
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('zsxdc','ggggg','aaqww','3/06/2019','20/06/2019');
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('mknjh','ggggg','ssd00','30/05/2019',NULL);
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('nbvcq','cd444','12345','9/10/2018','17/10/2018');
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('S0006','abcde','aaqww','17/02/2019','10/09/2019');
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('S0007','abcde','L0001','01/07/2014 ','27/04/2019');
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('S0008','abcde','12345','03/06/2015',' 12/10/2015');
INSERT INTO "Storico" ("idStorico","idUtenti","idLibri","dataRitiro","dataConsegna") VALUES ('S0009','abcde','4567y','28/11/2012 ','23/08/2015');

----
-- struttura per index sqlite_autoindex_Biblioteca_1 Sulla tabella Biblioteca
----
;

----
-- struttura per index sqlite_autoindex_Utenti_1 Sulla tabella Utenti
----
;

----
-- struttura per index sqlite_autoindex_Libri_1 Sulla tabella Libri
----
;

----
-- struttura per index sqlite_autoindex_Storico_1 Sulla tabella Storico
----
;
COMMIT;
