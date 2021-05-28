sentence --> noun_phrase(Num),verb_phrase(Num).

noun_phrase(N) --> det,noun(N).

verb_phrase(N) --> verb(N),noun_phrase(_Anything).
verb_phrase(N) --> verb(N).

noun(singular) -->[Word],{noun_lexicon(Word)}.

noun(plural) -->[Word],{noun_lexicon(W),
name(W,Temp),append(Temp,"s",NewWord),name(Word,NewWord)
}.

verb(singular) --> [Word],{verb_lexicon(W,_X,_Y),
	name(W,L1),append(L1,"s",L2),name(Word,L2)}.
	
verb(plural) -->[Word],{verb_lexicon(Word,_X,_Y)}.

det -->[a];[the];[].

noun_lexicon(dog).
noun_lexicon(cat).
noun_lexicon(boy).
noun_lexicon(girl).


verb_lexicon(see,saw,seen).
verb_lexicon(chase,chased,chased).
verb_lexicon(say,said,said).
verb_lexicon(believe,believed,believed).

