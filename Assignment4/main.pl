%orismos telestwn
:-dynamic clause2/2.
:-dynamic solve/1.

menu :-
		['meta.pl'],
		choice.

choice:-
		write('dwse epiloges apo 1 ews 3'),nl,
		write('1 : Enhmerwsh tou programmatos-antikeimeno'),nl,
		write('2 : Gia klhsh tou diermineuth solve gia na treksei stoxous'),nl,
		write('3 : Gia eksodo apo to metaprogramma'),nl,
		read(X),
	f(X).

f(X):-
	X=:=1,!,
    write('Epelekses enhmerwsh tou programatos dwse mia apo tis parakatw epiloges (a,b,c,d)'),nl,
		write('a : Gia allagi kapoias protasis tou programmatos'),nl,
		write('b : Gia eisagwgh kapoias neas protasis apo to programma-antikeimeno'),nl,
		write('c : Gia diagrafh kapoias protasis apo to programma'),nl,
    write('d : Gia eksodo apo thn diadikasia enhmerwshs'),nl,
		read(K),
  g(K).
f(X):-
	X=:=2,!,
    write('Epelekses enhmerwsh tou programatos dwse mia apo tis parakatw epiloges (a,b,c,d)'),nl,
		write('a : Gia eisagwgh tou stoxou'),nl,
		write('b : Gia eksodo apo thn diadikasia ekteleshs stoxwn tou programmatos'),nl,
    read(L),
  h(L).
f(X):-
	X=:=3,
  halt.

g(a):-
  !,
	write('Dwste thn protash pros allagi : '),nl,
	read(Protasi),
	Protasi = (Kefali_edit,Swma_edit),
	clause2(Kefali_edit,(Swma_edit)),
	write('Yparxei, Dwse tis allages pou thes na kaneis : '),nl,
	read(Protasi_Alagmeni),
	Protasi_Alagmeni = (Kefali_Alagmeni,(Swma_Alagmeno)),
	tell('meta.pl'),
		retract(clause2(Kefali_edit,(Swma_edit))),
		asserta(clause2(Kefali_Alagmeni,(Swma_Alagmeno))),
		listing(clause2/2),
		listing(solve/1),
	told,
	write('Epituxia Allagis.'),nl.

g(b):-
  !,
	write('Dwse ta stoixeia ths protasis pros eisagwgh : '),nl,
	write('Kefali protasis : '),nl,
	read(New_Head),nl,
	write('Swma protasis : '),nl,
	read(New_Body),nl,
	tell('meta.pl'),
		assertz(clause2(New_Head,(New_Body))),
		listing(clause2/2),
		listing(solve/1),
	told,
	write('H eisagwgh pragmatopoihthike me epituxia'),nl.


g(c):-
	!,
	write('Dwse thn protasi pros diagrafi : '),nl,
	write('Kefali protasis : '),nl,
	read(Head_del),
	write('Swma protasis : '),nl,
	read(Body_del),
	tell('meta.pl'),
		retract(clause2(Head_del,(Body_del))),
		listing(clause2/2),
		listing(solve/1),
	told,
	write('Epituxia diagrafis protasis'),nl.


g(d):-
  !,
  menu.



h(a):-
    	write('Dwse ton stoxo'),nl,
			read(Go),
			monopati(Arxikos,Telikos,Path) = Go,
			setof(Path,solve(monopati(Arxikos,Telikos,Path))^solve(monopati(Arxikos,Telikos,Path)),Go_Path),
			write('To monopati : '),
			write(Go_Path).

h(b):-
  !,
  menu.
