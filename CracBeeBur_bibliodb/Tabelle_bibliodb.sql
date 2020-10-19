CREATE TABLE tblCittà (
    idCittà INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Città TEXT NOT NULL
);
CREATE TABLE tblRegione (
    idRegione INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Regione TEXT NOT NULL,
    idCittà INTEGER NOT NULL,
        FOREIGN KEY(idCittà) REFERENCES tblCittà(idCittà)
);

CREATE TABLE tblBiblioteca (
    idBiblioteca INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Indirizzo TEXT NOT NULL,
    idRegione INTEGER NOT NULL,
    Telefono TEXT NOT NULL,
    Email TEXT NOT NULL,
        FOREIGN KEY(idRegione) REFERENCES tblRegione(idRegione)
);

CREATE TABLE tblNazionalità (
    idNazionalità INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Nazionalità TEXT NOT NULL
);

CREATE TABLE tblTipoDocumento (
    idTipoDocumento INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    tipoDocumento TEXT NOT NULL
);

CREATE TABLE tblUtente (
    idUtente INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Cognome TEXT NOT NULL,
    Nome TEXT NOT NULL,
    dataNascita DATETIME NOT NULL,
    idNazionalità INTEGER NOT NULL,
    Indirizzo TEXT NOT NULL,
    idRegione INTEGER NOT NULL,
    Telefono TEXT NOT NULL,
    Email TEXT NOT NULL,
    numDocumento TEXT NOT NULL,
    idTipoDocumento INTEGER NOT NULL,
        FOREIGN KEY(idNazionalità) REFERENCES tblNazionalità(idNazionalità),
        FOREIGN KEY(idRegione) REFERENCES tblRegione(idRegione),
        FOREIGN KEY(idTipoDocumento) REFERENCES tblTipoDocumento(idTipoDocumento)
);

CREATE TABLE tblAutore (
    idAutore INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Autore TEXT NOT NULL
);

CREATE TABLE tblTipologia (
    idTipologia INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Tipologia TEXT NOT NULL
);

CREATE TABLE tblGenere (
    idGenere INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Genere TEXT NOT NULL
);

CREATE TABLE tblLingua (
    idLingua INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Lingua TEXT NOT NULL
);

CREATE TABLE tblCollana (
    idCollana INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Collana TEXT NOT NULL
);

CREATE TABLE tblEditore (
    idEditore INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Editore TEXT NOT NULL
);

CREATE TABLE tblLibro (
    idLibro INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    Titolo TEXT NOT NULL,
    idAutore INTEGER NOT NULL,
    idTipologia INTEGER NOT NULL,
    idGenere INTEGER NOT NULL,
    idLingua INTEGER NOT NULL,
    idCollana INTEGER NOT NULL,
    idEditore INTEGER NOT NULL,
    Anno INTEGER UNSIGNED NOT NULL,
        FOREIGN KEY(idAutore) REFERENCES tblAutore(idAutore),
        FOREIGN KEY(idTipologia) REFERENCES tblTipologia(idTipologia),
        FOREIGN KEY(idGenere) REFERENCES tblGenere(idGenere),
        FOREIGN KEY(idLingua) REFERENCES tblLingua(idLingua),
        FOREIGN KEY(idCollana) REFERENCES tblCollana(idCollana),
        FOREIGN KEY(idEditore) REFERENCES tblEditore(idEditore)
);

CREATE TABLE tblTessera (
    idTessera INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    dataEmissione DATETIME NOT NULL,
    dataScadenza DATETIME NOT NULL,
    Valida BOOLEAN NOT NULL,
    idUtente INTEGER UNSIGNED NOT NULL,
        FOREIGN KEY(idUtente) REFERENCES tblUtente(idUtente)
);

CREATE TABLE tblPrestito (
    idPrestito INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    inizioPrestito DATETIME NOT NULL,
    finePrestito DATETIME NOT NULL,
    inCorso BOOLEAN NOT NULL,
    idTessera INTEGER UNSIGNED NOT NULL,
    idLibro INTEGER UNSIGNED NOT NULL,  
        FOREIGN KEY(idTessera) REFERENCES tblTessera(idTessera),
        FOREIGN KEY(idLibro) REFERENCES tblLibro(idLibro)
);

CREATE TABLE tblCatalogo (
    idCatalogo INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    dataCatalogazione DATETIME NOT NULL,
    Piano INTEGER,
    Stanza TEXT NOT NULL,
    Scaffale TEXT NOT NULL,
    idBiblioteca INTEGER UNSIGNED NOT NULL,
    idLibro INTEGER UNSIGNED NOT NULL,  
        FOREIGN KEY(idBiblioteca) REFERENCES tblBiblioteca(idBiblioteca),
        FOREIGN KEY(idLibro) REFERENCES tblLibro(idLibro)
);