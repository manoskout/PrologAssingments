/* ΠΡΟΤΑΣΗ-->ΟΝΟΜΑΤΙΚΗ ΦΡΑΣΗ ΚΑΙ ΡΗΜΑΤΙΚΗ ΦΡΑΣΗ ΣΕ ΕΝΙΚΟ Ή ΠΛΗΘΥΝΤΙΚΟΥ ΑΡΙΘΜΟΥ*/
sentence --> noun_phrase(N),verb_phrase(N).

/* ΟΝΟΜΑΤΙΚΗ ΦΡΑΣΗ-->ΑΡΘΡΟ ΚΑΙ ΟΥΣΙΑΣΤΙΚΟ */
noun_phrase(N) --> det,noun(N).


/* ΡΗΜΑΤΙΚΗ ΦΡΑΣΗ-->ΡΗΜΑ Ή ΡΗΜΑ ΚΑΙ ΟΝΟΜΑΤΙΚΗ ΦΡΑΣΗ */
verb_phrase(N) --> verb(N),noun_phrase(_Anything).
verb_phrase(N) --> verb(N).
/* ΑΡΧΙΚΟΠΟΙΗΣΗ ΑΡΘΡΟΥ */
det -->[a];[the];[].

/* ΑΡΧΙΚΟΠΟΙΗΣΗ ΕΝΙΚΟΥ ΚΑΙ ΠΛΗΘΥΝΤΙΚΟΥ ΟΥΣΙΑΣΤΙΚΟΥ */
noun(singular) --> [dog];[cat];[boy];[girl].
noun(plural) --> [dogs];[cats];[boys];[girls].

/* ΑΡΧΙΚΟΠΟΙΗΣΗ ΕΝΙΚΟΥ ΚΑΙ ΠΛΗΘΥΝΤΙΚΟΥ ΡΗΜΑΤΟΣ */
verb(singular) --> [chases];[sees];[says];[believes].
verb(plural) -->[chase];[see];[say];[believe].