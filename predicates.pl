%1 Multiplication
mult(_,0,0).

mult(A, B, X):-
   B > 0,
   B1 is B-1,
   mult(A, B1, X1),
   X is X1+A. 
   
%2 Sum of all naturals between 1 and N
sum(0,0).

sum(N,X):-
	N > 0,
	N1 is N-1,
	sum(N1,X1),
	X is X1+N.

%3 Sum between N1 and N2 inclusive (N2>N1)
sum2(N1,N2,X):-
	N2>N1,
	LN2 is N2-1,
	sum2(N1,LN2,X1),
	X is X1+N2.

%4 Converting decimal to binary
bin(1,1).

bin(A, X):-
    A > 1,
	A1 is A // 2,
    A2 is A mod 2,
	bin(A1, X1),
	X is X1 * 10 + A2.
	
%5 Russian multiplication
russian_mult(0,_,0).

russian_mult(1,B,B).

russian_mult(A,B,X):-	%RC1: Is even
	A > 1,
	0 is A mod 2,
	A1 is A // 2,
	B1 is B*2,
	russian_mult(A1,B1,X).
		
russian_mult(A,B,X):-	%RC2: Is odd
	A > 1,
	1 is A mod 2,
	A1 is A // 2,
	B1 is B*2,
	russian_mult(A1,B1,X1),	
	X is X1+B.

%6 Sum lists
suma_L([Last],Last).

suma_L([H|T],X):-
	suma_L(T,X1),
	X is X1+H.
	
%7 Member
member(X,[X|_]).

member(X,[_|T]):-
	member(X,T).
	
%8 Position 1 --> Returns all matches
pos(X,[X|_],1).

pos(X,[_|T],P):-
	pos(X,T,P1),
	P is P1+1.
	
%9 Last
la([X],X).

la([_|T],X):-
	la(T,X).
	
%10 Replace
rep(_,_,[],[]).

rep(X,Y,[X|T],[Y|T2]):-
	rep(X,Y,T,T2).

rep(X,Y,[H|T],[H|T2]):-
	rep(X,Y,T,T2).
	
%11 Remove duplicates
% original list --> list without duplicates
rem_dupl([],[]).

rem_dupl([H|T],[H|T2]):- % CR1
	rem_dupl(T,T2),
	not(member(H,T2)).

rem_dupl([H|T],T2):- % CR2 
	rem_dupl(T,T2),
	member(H,T2).
	
%12 Minimum
min([H],H).

min([H|T],H):-
	min(T,X),
	H<X.

min([H|T],X):-
	min(T,X),
	H>=X.

%13 Number of elements
count([],_,0).

count([E|T],E,R):-
	count(T,E,RR),
	R is RR+1.

count([_|T],E,R):-
	count(T,E,R).

%14 Concatenate
concat([],L,L).

concat([H|L1],L2,[H|L12]):-
	concat(L1,L2,L12).