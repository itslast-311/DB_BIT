-- 1. Tutti i libri prestati ad un utente specifico in ordine cronologico.
SELECT tblUtente.Cognome, tblUtente.Nome, inizioPrestito FROM tblPrestito
INNER JOIN tblTessera ON tblTessera.idTessera = tblPrestito.idTessera
INNER JOIN tblUtente ON tblUtente.idUtente = tblTessera.idUtente
WHERE tblUtente.idUtente
ORDER BY inizioPrestito ASC;

-- 2. Individua i primi tre lettori che hanno letto più libri.
SELECT tblUtente.Cognome, tblUtente.Nome, COUNT(idPrestito) AS Prestiti FROM tblPrestito
INNER JOIN tblLibro ON tblLibro.idLibro = tblPrestito.idLibro
INNER JOIN tblTessera ON tblTessera.idTessera = tblPrestito.idTessera
INNER JOIN tblUtente ON tblUtente.idUtente = tblTessera.idUtente
GROUP BY tblUtente.idUtente
ORDER BY Prestiti DESC
LIMIT 0,3;

-- 3. Individua tutti i possessori dei libri non ancora rientrati e il titolo degli stessi.
SELECT tblUtente.Cognome, tblUtente.Nome, tblLibro.Titolo FROM tblPrestito
INNER JOIN tblTessera ON tblTessera.idTessera = tblPrestito.idTessera
INNER JOIN tblUtente ON tblUtente.idUtente = tblTessera.idUtente
INNER JOIN tblLibro ON tblLibro.idLibro = tblPrestito.idLibro
WHERE inCorso IS "TRUE";

-- 4. Dare lo storico dei libri chiesti in prestito da un utente indicando il periodo.
SELECT tblUtente.Cognome, tblUtente.Nome, tblLibro.Titolo, inizioPrestito, finePrestito FROM tblPrestito
INNER JOIN tblTessera ON tblTessera.idTessera = tblPrestito.idTessera
INNER JOIN tblUtente ON tblUtente.idUtente = tblTessera.idUtente
INNER JOIN tblLibro ON tblLibro.idLibro = tblPrestito.idLibro
WHERE tblTessera.idTessera = 1;

-- 5. Fai la classifica dei libri maggiormente prestati.
SELECT tblLibro.Titolo, COUNT(tblPrestito.idLibro) AS n°Prestiti FROM tblPrestito
INNER JOIN tblLibro ON tblLibro.idLibro = tblPrestito.idLibro
GROUP BY tblLibro.Titolo ORDER BY n°Prestiti DESC;

-- 6. Individua prestiti la cui durata supera i 15gg.
SELECT tblUtente.Cognome, tblUtente.Nome, tblLibro.Titolo, inizioPrestito FROM tblPrestito
INNER JOIN tblTessera ON tblTessera.idTessera = tblPrestito.idTessera
INNER JOIN tblUtente ON tblUtente.idUtente = tblTessera.idUtente
INNER JOIN tblLibro ON tblLibro.idLibro = tblPrestito.idLibro
WHERE finePrestito = "-" AND (CURRENT_DATE - inizioPrestito) > 15;