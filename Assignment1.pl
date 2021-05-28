telike_katastase([0,0,rightCoast,3,3]).
arxike_katastase([3,3,leftCoast,0,0]). 

/*LM=LeftCoastMissionaries  LC=LeftCoastCannibals RC=RightCoastCannibals  RM=RightCoastMissionaries */

/* Έλεγχος περιορισμών */
isLegal(LM,LC,RM,RC):-
	LM>=0,LC>=0,RM>=0,RC>=0,/* Έλεγχος αν το άθροισμα των ανθρώπων ειναι >=0 */
	(LM>=LC ; LM=0), /* Έλεγχος αν στην αριστερή όχθη οι ιεραπόστολοι είναι περισσότεροι απο του κανίβαλους ή δεν βρίσκονται ιεραπόστολοι καθόλου σε αυτή */
	(RM>=RC ; RM=0). /* Έλεγχος αν στην δεξία όχθη οι ιεραπόστολοι είναι περισσότεροι απο του κανίβαλους ή δεν βρίσκονται ιεραπόστολοι καθόλου σε αυτή */
	
/*2 ιεραπόστολοι περνούν απο την αριστερή στη δεξιά όχθη του ποταμού */

efarm_telesti([LM,LC,leftCoast,RM,RC],[LM1,LC,rightCoast,RM1,RC]):-
	LM1 is LM-2,
	RM1 is RM+2,
	isLegal(LM1,LC,RM1,RC).
	
/*2 κανίβαλοι περνούν απο την αριστερή στη δεξιά όχθη του ποταμού */
efarm_telesti([LM,LC,leftCoast,RM,RC],[LM,LC1,rightCoast,RM,RC1]):-
	LC1 is LC-2,
	RC1 is RC+2,
	isLegal(LM,LC1,RM,RC1).
	
/* 1 ιεραπόστολος και 1 κανίβαλος περνούν απο την αριστερή στη δεξιά όχθη του ποταμού */
efarm_telesti([LM,LC,leftCoast,RM,RC],[LM1,LC1,rightCoast,RM1,RC1]):-
	LC1 is LC-1,
	RC1 is RC+1,
	LM1 is LM-1,
	RM1 is RM+1,
	isLegal(LM1,LC1,RM1,RC1).

/* 1 ιεραπόστολος περνάει απο την αριστερή στη δεξιά όχθη του ποταμού */
efarm_telesti([LM,LC,leftCoast,RM,RC],[LM1,LC,rightCoast,RM1,RC]):-
	LM1 is LM-1,
	RM1 is RM+1,
	isLegal(LM1,LC,RM1,RC).
	
	
/* 1 κανίβαλος περνάει απο την αριστερή στη δεξιά όχθη του ποταμού */
efarm_telesti([LM,LC,leftCoast,RM,RC],[LM,LC1,rightCoast,RM,RC1]):-
	LC1 is LC-1,
	RC1 is RC+1,
	isLegal(LM,LC1,RM,RC1).
	
	

/* 2 ιεραπόστολοι περνούν απο τη δεξία στην αριστερή όχθη του ποταμού*/ 
efarm_telesti([LM,LC,rightCoast,RM,RC],[LM1,LC,leftCoast,RM1,RC]):-
	LM1 is LM+2,
	RM1 is RM-2,
	isLegal(LM1,LC,RM1,RC).
	
/* 2 κανίβαλοι περνούν απο τη δεξία στην αριστερή όχθη του ποταμού */
efarm_telesti([LM,LC,rightCoast,RM,RC],[LM,LC1,leftCoast,RM,RC1]):-
	LC1 is LC+2,
	RC1 is RC-2,
	isLegal(LM,LC1,RM,RC1).
	
/* 1 ιεραπόστολος και 1 κανίβαλος περνούν απο τη δεξία στην αριστερή όχθη του ποταμού */
efarm_telesti([LM,LC,rightCoast,RM,RC],[LM1,LC1,leftCoast,RM1,RC1]):-
	LC1 is LC+1,
	RC1 is RC-1,
	LM1 is LM+1,
	RM1 is RM-1,
	isLegal(LM1,LC1,RM1,RC1).

/* 1 ιεραπόστολος περνάει απο τη δεξία στην αριστερή όχθη του ποταμού */
efarm_telesti([LM,LC,rightCoast,RM,RC],[LM1,LC,leftCoast,RM1,RC]):-
	LM1 is LM+1,
	RM1 is RM-1,
	isLegal(LM1,LC,RM1,RC).
	
	
/* 1 κανίβαλος περνάει απο τη δεξία στην αριστερή όχθη του ποταμού */
efarm_telesti([LM,LC,rightCoast,RM,RC],[LM,LC1,leftCoast,RM,RC1]):-
	LC1 is LC+1,
	RC1 is RC-1,
	isLegal(LM,LC1,RM,RC1).	
	
	
	
find:-
	monopati([3,3,leftCoast,0,0],[0,0,rightCoast,3,3],R),
	printPath(R).
	
	
printPath([]).	
printPath([H|T]):-
	write(H),nl,
	printPath(T).
	
monopati(X,Y,Monopati):-
	monopati1(X,Y,[X],Monopati).
monopati1(X,X,Monopati,Monopati):-
	telike_katastase(X).
monopati1(X,Z,Monopati,Teliko_monopati):-
	efarm_telesti(X,Y),
	\+member(Y,Monopati),
	append(Monopati,[Y],Neo_monopati),
	monopati1(Y,Z,Neo_monopati,Teliko_monopati).
	
