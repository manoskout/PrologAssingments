/* ΠΡΟΤΑΣΗ-->ΟΝΟΜΑΤΙΚΗ ΦΡΑΣΗ ΚΑΙ ΡΗΜΑΤΙΚΗ ΦΡΑΣΗ */
sentence --> noun_phrase,verb_phrase.

/* ΟΝΟΜΑΤΙΚΗ ΦΡΑΣΗ-->ΑΡΘΡΟ ΚΑΙ ΟΥΣΙΑΣΤΙΚΟ */
noun_phrase --> det,noun.

/* ΡΗΜΑΤΙΚΗ ΦΡΑΣΗ-->ΡΗΜΑ Ή ΡΗΜΑ ΚΑΙ ΟΝΟΜΑΤΙΚΗ ΦΡΑΣΗ */
verb_phrase -->verb,noun_phrase.
verb_phrase --> verb.


/* ΑΡΧΙΚΟΠΟΙΗΣΗ ΑΡΘΡΟΥ,ΡΗΜΑΤΟΣ ΚΑΙ ΟΥΣΙΑΣΤΙΚΟΥ */
det -->[the];[a];[].
noun --> [dog];[cat];[boy];[girl].
verb --> [chased];[saw];[said];[believed].

