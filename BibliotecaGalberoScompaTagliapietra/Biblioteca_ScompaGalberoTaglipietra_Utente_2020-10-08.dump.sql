----
-- phpLiteAdmin database dump (https://www.phpliteadmin.org/)
-- phpLiteAdmin versione: 1.9.8.2
-- Esportato: 12:39 del 8 Oct, 2020 A.D. (CEST)
-- database file: db/Biblioteca_ScompaGalberoTaglipietra
----
BEGIN TRANSACTION;

----
-- Table struttura per Utente
----
CREATE TABLE 'Utente' ('id' INTEGER PRIMARY KEY NOT NULL, 
                      'id_biblioteca' INTEGER, 
                      'id_libro' INTEGER,  
                      'nome' TEXT, 
                      'cognome' TEXT NOT NULL,
                      'sesso' TEXT,
                      'datanascita' DATE,
                       
                      
                      FOREIGN KEY (id_biblioteca) REFERENCES biblioteca(id),
                      FOREIGN KEY (id_libro) REFERENCES Libro(id));

----
-- Dump dei dati per Utente, un totale di 0 righe
----
COMMIT;
