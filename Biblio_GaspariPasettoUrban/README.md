Analisi per la gestione della biblioteca.

OBIETTIVO:
Gestire il prelievo e la riconsegna dei libri da parte di utenti tesserati di una biblioteca, tenendo traccia dei tempi.

IPOTESI:
La biblioteca può avere più sedi.
Gli utenti possono prelevare un libro in una sede e riconsegnarlo in un'altra.
Il prestito ha una durata massima stabilito di volta in volta.

ENTITA:
-UTENTE
	idUtente
	nome
	cognome
	CF
	dataNascita
	telefono
	email

-PRESTITO
	idPrestito
	idUtente
	idLibro
	dataInizio
	dataFine
	durataMax
	sedeInizio
	sedeFine
-LIBRO
	idLibro
	titolo
	autore
	genere
	casaEditrice
	edizione
	note
	idSede
-SEDE
	idSede
	nome
	indirizzo
	telefono
	email

QUERY:
-CREAZIONE
