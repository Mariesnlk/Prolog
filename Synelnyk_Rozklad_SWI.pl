% 9 5 4
%lecture(LECTORE_ID, name(FIRST_NAME, SECOND_NAME, MIDDLE_NAME), birth(DAY, MONTH, YEAR), DEGREE, POSADA_ID, SALARY, WORK_PLACE, FACULTY_ID, CAFEDRA_ID).
lecture(1, name('N1', 'S1', 'M1'), birth(1, 1, 1994), 'd. t. n', 1, 15000, 'NaUKMA', 1, 1).
lecture(2, name('N2', 'S2', 'M2'), birth(2, 2, 1984), 'd. t. n', 1, 15000, 'NaUKMA', 1, 1).
lecture(3, name('N3', 'S3', 'M3'), birth(3, 3, 1988), 'd. t. n', 1, 15000, 'NaUKMA', 2, 1).
lecture(4, name('N4', 'S4', 'M4'), birth(4, 4, 1994), 'd. f. n', 2, 13000, 'NaUKMA', 2, 2).
lecture(5, name('N5', 'S5', 'M5'), birth(5, 5, 1991), 'd. f. n', 2, 13000, 'NaUKMA', 3, 2).
lecture(6, name('N6', 'S6', 'M6'), birth(6, 6, 1989), 'd. t. n', 1, 15000, 'KPI', 1, 1).
lecture(7, name('N7', 'S7', 'M7'), birth(7, 7, 1988), 'd. t. n', 1, 15000, 'KPI', 1, 2).
lecture(8, name('N8', 'S8', 'M8'), birth(8, 8, 1981), 'd. f. n', 2, 12000, 'KPI', 2, 1).
lecture(9, name('N9', 'S9', 'M9'), birth(9, 9, 1959), 'd. t. n', 1, 19000, 'KPI', 3, 2).
lecture(10, name('N10', 'S10', 'M10'), birth(10, 10, 1957), 'd. t. n', 1, 19000, 'KPI', 1, 2).

%subject(SUBJECT_ID, SUBJECT_NAME, SUBJECT_TIME, SUBJECT_TYPE, SUBJECT_PROGRAM).
subject(1, 'math', 140, 'n', 'bachelor').
subject(2, 'biology', 140, 'n', 'bachelor').
subject(3, 'biology 2.0', 120, 'n', 'master').
subject(4, 'algebra', 90, 'v', 'bachelor').
subject(5, 'new algebra', 115, 'n', 'master').
subject(6, 'law', 150, 'n', 'master').
subject(7, 'economics law', 140, 'v', 'master').


%group(GROUP_ID, CAFEDRA_ID, COURSE, PROGRAM, DIRECTION, STUDENT_CAPACITY).
group(1, 1, 1, 'master', 'IPZ', 15).
group(2, 1, 2, 'master','KN', 50).
group(3, 2, 3, 'bachelor', 'IPZ', 56).
group(4, 2, 4, 'bachelor', 'Law', 118).
group(5, 3, 1, 'bachelor', 'Law', 120).
group(6, 3, 1, 'master', 'IPZ', 60).

%rozklad(LECTORE_ID, SUBJECT_ID, GROUP_ID, DAY, PARA, AUDIENCE).
rozklad(1, 1, 1, 'mon', 1, 101).
rozklad(3, 2, 2, 'mon', 1, 102).
rozklad(2, 2, 3, 'mon', 1, 103).
rozklad(1, 3, 4, 'tue', 1, 104).
rozklad(3, 3, 5, 'tue', 2, 101).
rozklad(1, 3, 6, 'wed', 2, 102).
rozklad(4, 4, 1, 'wed', 3, 103).
rozklad(1, 5, 2, 'thur', 3, 101).
rozklad(5, 6, 3, 'thur', 4, 101).
rozklad(6, 7, 3, 'thur', 5, 101).
rozklad(9, 6, 3, 'fri', 1, 101).
rozklad(9, 7, 3, 'fri', 2, 102).
rozklad(10, 6, 3, 'fri', 1, 103).
rozklad(10, 7, 3, 'fri', 3, 102).


%cafedra(CAFEDRA_ID, CAFEDRA_NAME, LECTORE_ID).
cafedra(1, 'math', 1).
cafedra(2, 'information technologies', 2).
cafedra(3, 'network technologies', 3).
cafedra(4, 'multimedia systems', 4).
cafedra(5, 'private law', 5).
cafedra(6, 'biology', 6).
cafedra(7, 'economics', 7).
cafedra(8, 'social working', 8).

%posada(POSADA_ID, POSADA_NAME).
posada(1, 'profesor').
posada(2, 'lecturer').
posada(3, 'senior cientist employee').

%faculty(FACULTY_ID, FACULTY_NAME).
faculty(1, 'FI').
faculty(2, 'FEN').
faculty(3, 'FSNST').
faculty(4, 'FPRN').
faculty(5, 'FPVN').

% 9 5 4

%Скільки годин веде певний викладач по певній дисципліні?
%  ?- time_lect_subj('N1', 'S1', 'math', TIME).
% TIME = 140
time_lect_subj(FIRST_NAME, SECOND_NAME, SUBJECT_NAME, SUBJECT_TIME) :- 
                                        rozklad(LECTORE_ID, SUBJECT_ID, _, _, _, _),
                                        lecture(LECTORE_ID, name(FIRST_NAME, SECOND_NAME, _), _, _, _, _, _, _, _),
                                        subject(SUBJECT_ID, SUBJECT_NAME, SUBJECT_TIME, _, _).

%Визначити викладачів пенсійного віку (прізвище, науковий ступень, дата народження, організація; пенсійний вік >=60років), які не викладають певну дисципліну.
%  ?- ageMoreWorking(SECONDNAME, DEGREE, DAY, MONTH, YEAR, WORKPLACE, 'math').
%  DAY = MONTH, MONTH = 9,
%  DEGREE = 'd. t. n',
%  SECONDNAME = 'S9',
%  WORKPLACE = 'KPI',
%  YEAR = 1959
ageMoreWorking(SECOND_NAME, DEGREE, DAY, MONTH, YEAR, WORK_PLACE, SUBJECT_NAME) :- 
                                        lecture(LECTORE_ID, name(_, SECOND_NAME, _), birth(DAY, MONTH, YEAR), DEGREE, _, _, WORK_PLACE, _, _),
                                        2021 - YEAR >= 60,
                                        subject(SUBJECT_ID, SUBJECT_NAME, _, _, _),
                                        not(rozklad(LECTORE_ID, SUBJECT_ID, _, _, _, _)).

%Які викладачі (прізвище, кафедра) читають в усі ті дні (в усі ті та, можливо, і в інші), що і певний викладач?
% ?- the_same_day('S2', SURNAME, CAFEDRA).
%CAFEDRA = math,
%SURNAME = 'S1'
the_same_day(SURNAME1, SURNAME2, CAFEDRA_NAME) :- lecture(LECTORE_ID1, name(_, SURNAME1, _), birth(_, _, _), _, _, _, _, _, _),
                                            lecture(LECTORE_ID2, name(_, SURNAME2, _), birth(_, _, _), _, _, _, _, CAFEDRA_ID, _),
                                            LECTORE_ID1 \= LECTORE_ID2,
                                            cafedra(CAFEDRA_ID, CAFEDRA_NAME, _),
                                            forall(rozklad(LECTORE_ID1, _, _, DAY, _, _),
                                                   rozklad(LECTORE_ID2, _, _, DAY, _, _)).
                                            
%Які викладачі (прізвище, ставка, посада) читають по тим самих дням (усім тим і тільки тим), що і певний викладач?
% ?- the_same_dayы('S2', SURNAME, SALARY, DEGREE).
the_same_days(SURNAME1, SURNAME2, SALARY, DEGREE) :- the_same_day(SURNAME1, SURNAME2, CAFEDRA_NAME2), the_same_day(SURNAME2, SURNAME1, CAFEDRA_NAME1),
                                                     lecture(_, name(_, SURNAME2, _), birth(_, _, _), DEGREE, _, SALARY, _, _, _).


