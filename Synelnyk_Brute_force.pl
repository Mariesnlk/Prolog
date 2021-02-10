fill(-1) :- !.
fill(X) :- asserta(d(X)),X1 is X-1,fill(X1).

% 1. � ����������� ����i, ��i ����� ����� ����p�i, ���p������ ������� �����.
% ���������, �� ��p����� ��������� ����� � �i������� ���i����� �����. �����i�� ��i ���i ��������i �����.

threeNum(X) :- d(A),
               A>0,
               1 is A mod 2,
               d(B),
               1 is B mod 2,
               d(C),
               1 is C mod 2,
               X is A*100+B*10 +C,
               0 is X mod (A*10+C).


% 2. �����i�� ������������ �����, ��� � ������ ���������, � ����� ��i ����i ����� �������i �� ��i ������i ����� �������i.

exactSquare(X) :- d(A),
                  A>0,
                  d(B),
                  X is A*1000+A*100 + B*10 + B,
                  Y is round(sqrt(X)),
                  X is Y*Y.

% 3. ��i���� i��� �i��� ����� �i� 1 �� 1998, ��i �� �i������ �� ����� � ����� 6, 10, 15?

neeededNum(A, B, C):- A<1999,
			        (A mod 10) =\= 0,
			        (A mod 6) =\= 0,
			        (A mod 15) =\= 0,
                    B1 is B+1,
                    A1 is A+1,
                    neeededNum(A1, B1, C);
                    A<1999,
                    A1 is A+1,
                    neeededNum(A1, B, C);
                    A>1998,
                    C is B, !.

neeededNum(X):- neeededNum(1,0,X), !.


% 4. ������ �������� ���������� ����� M, ��� �� �������� �������i���: ���� �������i� ���������� ����i������ ����������� �����,
%��������� � M, � ������ ���������?

findM(X) :- findM(X, 1).
findM(X, Val):- X1 is Val**2,
                 X2 is (Val+1)**2,
                 X3 is (Val+2)**2,
                 X4 is (Val+3)**2,
                 X5 is (Val+4)**2,
                 X6 is (Val+5)**2,
                 X7 is (Val+6)**2,
                 X8 is (Val+7)**2,
                 X9 is (Val+8)**2,
                 X10 is (Val+9)**2,
                 X11 is (Val+10)**2,
                 Sum is X1+X2+X3+X4+X5+X6+X7+X8+X9+X10+X11,
                 ((round(sqrt(Sum)))**2 =:= Sum, X is Val, !; NewVal is Val+1, findM(X, NewVal)).



% 5. � ����i�������i 1998737... ������ �����, ��������� � �'���, ���i���� ������i� ����i ���� �������� ����p���i� ����.
%����� ��i���� ���� ����� �����i����� ��������� ����i���i� 1998 (����� ��i���� ���� � ���i��i)?

task5(X):- task5(1, 9, 9, 8, X, 0).
task5(1, 9, 9, 8, X, X):- X>0,!.
task5(A, B, C, D, X, T) :- A1 is B,
                            B1 is C,
                            C1 is D,
                            Sum is A+B+C+D,
                            D1 is (Sum mod 10),
                            T1 is T+1,
                            task5(A1, B1, C1 , D1, X, T1).

