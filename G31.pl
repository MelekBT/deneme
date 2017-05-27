gcd(X, 0, X):- !.
gcd(0, X, X):- !.
gcd(X, Y, R):-
  X > Y, !,
  Z is X mod Y,
  gcd(Y, Z, R).

gcd(X, Y, R):-
  Z is Y mod X,
  gcd(X, Z, R).

extendedloop(_,0,_,_,LX,LY,P,S):-
  P is LX,
  S is LY.

extendedloop(A,B,X,Y,LX,LY,P,S):-
  B > 0,
  Q is A // B,
  R is A mod B,
  A2 is B,
  B2 is R,
  T1 is X,
  X2 is LX - Q*X,
  LX2 is T1,
  T2 is Y,
  Y2 is LY - Q*Y,
  LY2 is T2,
  extendedloop(A2,B2,X2,Y2,LX2,LY2,P,S).

extendedEuclideanHelper(A,B,P,S,R):-
  X is 0,
  Y is 1,
  LX is 1,
  LY is 0,
  gcd(A,B,R),
  extendedloop(A,B,X,Y,LX,LY,P,S).

extendedEuclidean(A, B):-
  extendedEuclideanHelper(A,B,P,S,R),
  write('R : '),write(R),nl,
  write('P : '),write(P),nl,
  write('S : '),write(S),nl.
