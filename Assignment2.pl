/* ---Βάση Γνώσης--- */
move(s1,s2). move(s1,s3). move(s1,s4).
move(s2,s5). move(s2,s6). move(s2,s7).
move(s3,s8).
move(s4,s9). move(s4,s10).
move(s6,s11). move(s6,s12).
move(s7,s13).
move(s9,s14). move(s9,s15).
goal(s8).
goal(s12).
goal(s15).

/* --- Πραξεις με Ουρές --- */
emptyQueue([]).
dequeue(X, [X|T], T).
get_elem_queue(X, [X|_]).
enqueue(X,[],[X]).
enqueue(X,[H|T1],[H|T2]):- 
	enqueue(X,T1,T2).
member_queue(X, Q):- 
	member(X,Q).
pushElementsToQueue([],Queue,Queue).
pushElementsToQueue([Elem|RestElements],Queue,FinalQueue):-
	enqueue(Elem,Queue,NewQueue),
	pushElementsToQueue(RestElements,NewQueue,FinalQueue).
	
/* --- Πραξεις με Σύνολα --- */	
empty_set([]).	
member_set(X, [H|_]):- 
	X = H.	
member_set(X, [H|T]):-
	X\=H,
	member_set(X, T).	
union([], S2, S2).	
union([H1|T1], S2, [H1|T3]):-
	\+ member_set(H1, S2),
	union(T1, S2, T3).
union([H1|T1], S2, S3):-	
	member_set(H1, S2),
	union(T1, S2, S3).

/* --- Breadth First Search--- */	

bfs(Start,Goal):-
	emptyQueue(Empty_openList_Queue),
	enqueue([Start,nil],Empty_openList_Queue,OpenList_queue),
	empty_set(ClosedList_set),
	path(OpenList_queue,ClosedList_set,Goal).
	
/* --- Μονοπάτι --- */		
path(OpenList_queue,_,_):-
	emptyQueue(OpenList_queue),
	write('No solution. ').

path(OpenList_queue,ClosedList_set,Goal):-
	get_elem_queue([State,Parent],OpenList_queue),
	goal(State),
	State=Goal,
	write('Path of Solution: '),nl,
	print_path([State,Parent],ClosedList_set).

path(OpenList_queue,ClosedList_set,Goal):-
	dequeue([State,Parent],OpenList_queue, Rest_openList_queue),
	get_children(State,Rest_openList_queue,ClosedList_set,Children),
	pushElementsToQueue(Children,Rest_openList_queue,New_openList_queue),
	union([[State,Parent]],ClosedList_set,New_closedList_set),
	path(New_openList_queue,New_closedList_set,Goal).
	
/* --- Επιτρεπτές κινήσεις --- */	
moves(State,Rest_openList_queue,ClosedList_set,[Next,State]):-
	move(State,Next),
	\+(unsafe(Next)),
	\+(member_queue([Next,_NodeX],Rest_openList_queue)),%check for cycles L1
	\+(member_set([Next,_NodeY],ClosedList_set)).%check for cycles L2
	
/* --- Ολα τα παιδία του τωρινού κόμβου --- */	
get_children(State,Rest_openList_queue, ClosedList_set,Children) :-
	bagof(Child, moves(State, Rest_openList_queue, ClosedList_set, Child),Children).
get_children(_,_,_,[]).

/* --- Εικονικός Κόμβος για τελείωμα --- */	
unsafe(s100).

/* --- Εκτυπώση Μονοπατίου --- */
print_path([State, nil], _) :-
	write(State).
print_path([State, Parent], ClosedList_set) :- 
	member_set([Parent, Grandparent], ClosedList_set),
	print_path([Parent, Grandparent], ClosedList_set),
	write(' --> '), 
	write(State) .
