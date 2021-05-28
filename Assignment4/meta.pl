:- dynamic clause2/2.

clause2(monopati1(A, A, B, C), B=C).
clause2(monopati(A, B, C), monopati1(A, B, [A], C)).
clause2(monopati1(A, D, C, F),  (akme(A, B), \+member(B, C), append(C, [B], E), monopati1(B, D, E, F))).
clause2(member(A, [B|_]), A=B).
clause2(member(A, [B|C]),  (A\=B, member(A, C))).
clause2(append([], A, A), true).
clause2(append([A|B], C, [A|D]), append(B, C, D)).
clause2(akme(a, c), true).
clause2(akme(c, e), true).
clause2(akme(c, f), true).
clause2(akme(b, c), true).
clause2(akme(b, d), true).
clause2(akme(d, f), true).
clause2(akme(d, g), true).
clause2(akme(e, a), true).

:- dynamic solve/1.

solve(true) :- !.
solve((A, B)) :- !,
	solve(A),
	solve(B).
solve(A) :-
	\+ predicate_property(A, built_in),
	clause2(A, B),
	solve(B).
solve(A) :-
	predicate_property(A, built_in),
	call(A).
