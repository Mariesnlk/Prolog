%1 change list to make negative number position list
% ?- changeList([-1,2,-3,2,3,-2], RES).
% RES = [0, 2, 5]
% ?- changeList([-1,-2,-3,-2,-3,-2] , RES).
% RES = [0, 1, 2, 3, 4, 5]
% ?- negative([1,2,3,2,3,2], RES).
% RES = []

changeList(List, Res) :- changeList(List, [], 0, Res).
changeList([], List, _, Res) :- reverse(List, Res).
changeList([Head|Tail], List, Pos, Res) :- P is Pos+1, Head<0, changeList(Tail, [Pos|List], P, Res); P is Pos+1, changeList(Tail, List, P, Res).

%2 replace all instances of specified element to symbol  'change_done'
% ?- changeDone([54, 8, 8, 1, 1, 8, 9, 78, 3,0], 8, RES).
% RES = [54,change_done,change_done,1,1,change_done,9,78,3,0]

appen([], List2, List2).
appen([Head|Tail], List2, [Head|TailResult]) :- appen(Tail, List2, TailResult).

changeDone(List, EL, Res) :- helper(List, EL, [], Res), !.
helper([], _, R, R) :- !.
helper([Head|Tail], E, R, Res) :-  Head=E, appen(R, [change_done], H1), helper(Tail, E, H1, Res).
helper([Head|Tail], E, R, Res) :-  Head\=E, appen(R, [Head], H1), helper(Tail, E, H1, Res).

%3 convert  list that consist of Arabic numerals(1-50) to Roman numerals
% ?- convert([1,12,15,52], RES).
% RES = ['I', 'XII', 'XV', 'LII']
convert(List, Res) :- helper3(List, [], Res),!.
helper3([], X, X).
helper3([Head|Tail], X, Res) :- arabicToRoman(Head, E), appen(X, [E], X1), helper3(Tail, X1, Res).
help(0, X, X).
help(N, X, Res) :- N>=50, N1 is N-50, atom_concat(X, 'L', X1), help(N1, X1, Res).
help(N, X, Res) :- N>=40, N1 is N-40, atom_concat(X, 'XL', X1), help(N1, X1, Res).
help(N, X, Res) :- N>=10, N1 is N-10, atom_concat(X, 'X', X1), help(N1, X1, Res).
help(N, X, Res) :- N>=9, N1 is N-9, atom_concat(X, 'IX', X1), help(N1, X1, Res).
help(N, X, Res) :- N>=5, N1 is N-5, atom_concat(X, 'V', X1), help(N1, X1, Res).
help(N, X, Res) :- N>=4, N1 is N-4, atom_concat(X, 'IV', X1), help(N1, X1, Res).
help(N, X, Res) :- N>=1, N1 is N-1, atom_concat(X, 'I', X1), help(N1, X1, Res).
arabicToRoman(A, R) :- help(A,'', R),!.

%4 cyclic shift for esch element to right
% ?- cyclicShift([1,2,3,4,5], RES).
% RES = [5, 1, 2, 3, 4]

cyclicShift(X, Res):- cyclicShift(X, [], Res).
cyclicShift([Head|[]], Temp, Res) :- Res=[Head|Temp].
cyclicShift([Head|Tail], Temp, Res) :- append(Temp,[Head], X), cyclicShift(Tail, X, Res).

%5 multiply matrix
% ?- multiplyMatrix([[1,2,3],[4,5,6],[7,8,9]], [10,11,12], Res).
% Res = [68, 167, 266]

multiplyMatrix(Matrix, Vector, Res):- multiplyMatrix(Matrix, Vector, [], Res).
multiplyMatrix([], _, Temp, Res) :- reverse(Temp, Res).
multiplyMatrix([X|Matrix], Vector, Temp, Res) :- multiplyRow(X, Vector, 0, R), multiplyMatrix(Matrix, Vector, [R|Temp], Res).
multiplyRow([], [], Res, Res) :- !.
multiplyRow([X|Row], [Y|Vector], T, Res) :- T1 is (X*Y)+T, multiplyRow(Row, Vector, T1, Res).



