%Made by Mariia Synelnyk

% 1.Ділення з остачею (лише для додатніх цілих чисел)- ціла частина та остача від ділення (не використовувати вбудовані функції!). Використовувати оператори віднімання (-)

division(Divisor, Denominator, Res, Remainder) :- Divisor >= 0, Denominator > 0, division(Divisor, Denominator, 0, Res, Remainder), !.
division(Divisor, Denominator, Res, Res, Remainder) :- Divisor < Denominator, Remainder = Divisor, !.
division(Divisor, Denominator, Temp, Res, Remainder) :- D1 is Divisor - Denominator, Res1 is Temp + 1, division(D1, Denominator, Res1, Res, Remainder).

% 2.Піднесення до степеню (лінійне та логарифмічне)  - (не використовувати вбудовані функції!).  Використовувати оператори (*, +, -, mod)

powerLin(_, 0, 1) :- !.
powerLin(Num, Step, Res) :- Step1 is Step-1, powerLin(Num, Step1, Z1), Res is Z1*Num.

powerLog(_, 0, 1) :- !.
powerLog(Num, Step, Res) :- (Step mod 2) == 0, Step1 is Step/2, powerLin(Num, Step1, Z), Res is Z*Z.
powerLog(Num, Step, Res) :- Step1 is Step-1, powerLin(Num, Step1, Z), Res is Z*Num.

% 3.Числа Фібоначчі (рекурсія)

factorial(0, 1) :- !.
factorial(N, Res) :- N>0, N1 is N-1, factorial(N1, Res1), Res is N * Res1.

% 4.Розклад числа на прості множники (виведення всіх простих множників числа)

simpleMultipliers(X) :- X < 2, !.
simpleMultipliers(X) :- simpleMultipliersHelper(X, Res, 2), write(Res), write(' '), Res1 is div(X, Res), simpleMultipliers(Res1).

simpleMultipliersHelper(X, _, Z) :- X < Z, !.
simpleMultipliersHelper(X, Y, Z) :- X mod Z =:= 0, Y is Z, !.
simpleMultipliersHelper(X, Y, Z) :- Z1 is Z + 1, simpleMultipliersHelper(X, Y, Z1).

% 5.Обрахувати сумму 1/1! + 1/2! + 1/3! + ... 1/n! за допомогою рекурентних співвідношень

sumRec(N, Res) :- sumRec(N, Res, 1, 1, 1),!.
sumRec(N, Res, Sum, _, P) :- N is P, Res is Sum, !.
sumRec(N, Res, Sum, E, P) :- Pos is P+1, El is E/Pos, Temp is Sum + El, sumRec(N, Res, Temp, El, Pos).

% 6.Алгоритм Евкліда (пошуку НСД).

gcd(0, X, X) :- X > 0, !.
gcd(X, 0, X) :- X > 0, !.
gcd(X, Y, Res) :- X >= Y, X1 is X-Y, gcd(X1, Y, Res).
gcd(X, Y, Res) :- X < Y, X1 is Y-X, gcd(X1, X, Res).
