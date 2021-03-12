/* 
   postavka(id_post, data_get, data_pay, quant_tov)
   tovar(id_tov, id_post, cost_per_one, name_tov,  cur_quant, num_stelag)
   tovar_v_cheku(id_tovar_v_cheku, id_check,  id_tov, quantity)
   check(id_check,  sum, id_card, discount, sum_discount)
   client(id_card, pib_cl, tel_cl, birth_cl, discount)
   feedback(id_feedback, id_check, text, data)
*/

%postavka(POSTAVKA_ID, receive_date(DAY, MONTH, YEAR), payment_date(DAY, MONTH, YEAR), QUANTITY_TOVAR).
postavka(1, receive_date(10, 01, 2021), payment_date(01, 01, 2021), 100).
postavka(2, receive_date(10, 01, 2021), payment_date(01, 01, 2021), 100).
postavka(3, receive_date(10, 01, 2021), payment_date(01, 01, 2021), 100).
postavka(4, receive_date(10, 01, 2021), payment_date(01, 01, 2021), 100).
postavka(5, receive_date(10, 01, 2021), payment_date(01, 01, 2021), 100).
postavka(6, receive_date(10, 01, 2021), payment_date(01, 01, 2021), 100).
postavka(7, receive_date(10, 01, 2021), payment_date(01, 01, 2021), 100).
postavka(8, receive_date(10, 01, 2021), payment_date(01, 01, 2021), 100).
postavka(9, receive_date(10, 01, 2021), payment_date(01, 01, 2021), 100).
postavka(10, receive_date(10, 01, 2021), payment_date(01, 01, 2021), 100).

%tovar(TOVAR_ID, POSTAVKA_ID, PRICE, TOVAR_NAME, QUANTITY, STELAGH_NUM).
tovar(01, 1, 63, "skirt", 3, 5).
tovar(02, 2, 90, "blouse", 6, 4).
tovar(03, 3, 50, "trousers", 5, 1).
tovar(04, 4, 63, "dress", 6, 1).
tovar(05, 5, 67, "coat", 6, 4).
tovar(06, 6, 130, "shorts", 2, 2).
tovar(07, 7, 80, "shirt", 8, 5).
tovar(08, 8, 76, "hoodie", 10, 1).
tovar(09, 9, 130, "swimsuit", 6, 1).
tovar(10, 10, 130, "bra", 6, 1).

%check(CHECK_ID, SUM, ID_CARD, DISCOUNT_PERCENT, DISCOUNT_SUM).
check(56789, 126, 12345, 20, 100).
check(56790, 67, 12345, 10, 60).
check(56791, 134, 12345, 10, 121).

check(56792, 126, 12346, 20, 100).
check(56793, 67, 12346, 10, 60).
check(56794, 134, 12346, 10, 121).
check(56795, 126, 12346, 20, 100).
check(56796, 67, 12346, 10, 60).

%check(56797, 126, 12347, 20, 100).
%check(56798, 67, 12347, 10, 60).
%check(56799, 134, 12347, 10, 121).
check(56800, 67, 12346, 10, 60).
check(56801, 134, 12346, 10, 121).
check(56802, 130, 12347, 20, 117).

check(56803, 126, 12348, 20, 100).
check(56804, 67, 12348, 10, 60).
check(56805, 134, 12348, 10, 121).
check(56806, 130, 12347, 20, 117).

check(56807, 160, 12345, 20, 128).

check(56808, 126, 12349, 20, 100).
check(56809, 67, 12349, 10, 60).
check(56810, 134, 12349, 10, 121).

check(56811, 80, 12350, 20, 64).

check(56812, 160, 12351, 20, 128).

%tovar_v_cheku(ID_TOVAR_V_CHEKU, CHECK_ID,  TOVAR_ID, QUANTITY_V_CHEKU).
tovar_v_cheku(101, 56789, 01, 2).
tovar_v_cheku(102, 56790, 05, 1).
tovar_v_cheku(103, 56791, 05, 2).

tovar_v_cheku(104, 56792, 01, 2).
tovar_v_cheku(105, 56793, 05, 1).
tovar_v_cheku(106, 56794, 05, 2).
tovar_v_cheku(107, 56795, 04, 2).
tovar_v_cheku(108, 56796, 04, 1).

tovar_v_cheku(109, 56800, 04, 1).
tovar_v_cheku(110, 56801, 04, 2).
tovar_v_cheku(111, 56802, 10, 1).

tovar_v_cheku(112, 56803, 01, 2).
tovar_v_cheku(113, 56804, 05, 1).
tovar_v_cheku(114, 56805, 05, 2).

tovar_v_cheku(115, 56806, 10, 1).

tovar_v_cheku(116, 56807, 07, 2).

tovar_v_cheku(117, 56808, 01, 2).
tovar_v_cheku(118, 56809, 05, 1).
tovar_v_cheku(119, 56810, 05, 2).

tovar_v_cheku(120, 56811, 07, 1).

tovar_v_cheku(121, 56812, 07, 2).

%client(ID_CARD, name(FIRST_NAME, SECOND_NAME, MIDDLE_NAME), phone_numbers([TEL1, TEL2]), emails(EMAIL1, EMAIL2), birth(DAY, MONTH, YEAR), DISCOUNT_PERCENT).
client(12345, name('Mariia', 'Synelnyk', 'Sergiivna'), phone_numbers(["0630011001", "0950011001"]), emails("test1@gmail.com", "test2@gmail.com"), birth(5, 5, 1999), 20).
client(12346, name('Veronika', 'Babii', 'Kostyantynivna'), phone_numbers(["0668924901", "0951111001"]), emails("test3@gmail.com", "test4@gmail.com"), birth(4, 5, 1998), 20).
client(12347, name('Valeria', 'Petrenko', 'Batkivna'), phone_numbers(["0247501479", "03456789423"]), emails("test5@gmail.com", "test6@gmail.com"), birth(5, 4, 1999), 20).
client(12348, name('Petro', 'Barabolya', 'Batkovych'), phone_numbers(["0648050286", "0987623541"]), emails("test7@gmail.com", "test8@gmail.com"), birth(8, 8, 1998), 20).
client(12349, name('Mykhailo', 'Debet', 'Vasylovych'), phone_numbers(["0648078586", "0983665541"]), emails("test9@gmail.com", "test10@gmail.com"), birth(9, 12, 1999), 20).
client(12350, name('Sasha', 'Fukra', 'Mykolaivna'), phone_numbers(["0234078586", "0983455541"]), emails("test11@gmail.com", "test12@gmail.com"), birth(12, 12, 1997), 20).
client(12351, name('Dasha', 'Syshkova', 'Svyatoslavivna'), phone_numbers(["0644078586", "0984665541"]), emails("test13@gmail.com", "test14@gmail.com"), birth(6, 11, 1996), 20).


%feedback(FEEDBACK_ID, CHECK_ID, FEEDBACK_TEXT, date(DAY, MONTH, YEAR)).
%decomposition table
feedback(1, 56789, "good", date(11, 02, 2021)).
feedback(2, 56790, "great", date(11, 02, 2021)).
feedback(3, 56791, "perfect", date(12, 02, 2021)).
feedback(4, 56793, "wow", date(13, 02, 2021)).
feedback(5, 56794, "incredible", date(13, 02, 2021)).
feedback(6, 56795, "will buy more", date(15, 02, 2021)).
feedback(7, 56796, "youre the best", date(16, 02, 2021)).


%         b. Мають бути три змістовні запити до БД (на власний розсуд, але не елементарні).


/* Вивести імена всіх товари, к-ть яких перевищує або дорівнює 5 та не знаходяться на 1 полиці
  ?- task1(TOVAR_ID, TOVAR_NAME, QUANTITY, STELAGH_NUM).
 
 QUANTITY = 6,
 STELAGH_NUM = 4,
 TOVAR_ID = 2,
 TOVAR_NAME = "blouse"

 QUANTITY = 6,
 STELAGH_NUM = 4,
 TOVAR_ID = 5,
 TOVAR_NAME = "coat"

 QUANTITY = 8,
 STELAGH_NUM = 5,
 TOVAR_ID = 7,
 TOVAR_NAME = "shirt"
*/

task1(TOVAR_ID, TOVAR_NAME, QUANTITY, STELAGH_NUM) :- tovar(TOVAR_ID, _,  _, TOVAR_NAME, QUANTITY, STELAGH_NUM),
                                                    QUANTITY >= 5,
                                                    STELAGH_NUM \= 1.

/* Скільки було продано певного товару(вказується його назва)?  
 ?- task2("coat", TotalCount). 
 TotalCount = 12   
*/ 

task2(TOVAR_NAME, TotalCount) :- tovar(TOVAR_ID, _, _, TOVAR_NAME, _, _),
                                findall(QUANTITY, tovar_v_cheku(_, _, TOVAR_ID, QUANTITY), List),
                                sum_list(List, TotalCount).  


/* Знайти усі фідбеки(вивести текст фідбеку і дату) про заданий товар, який купив заданий покупець (вказати його номер картки)
 ?- task3(12346, "dress", FEEDBACK_TEXT, date(DAY, MONTH, YEAR)). 
 DAY = 15,
 FEEDBACK_TEXT = "will buy more",
 MONTH = 2,
 YEAR = 2021

 DAY = 16,
 FEEDBACK_TEXT = "youre the best",
 MONTH = 2,
 YEAR = 2021
 false
*/
%check(CHECK_ID, TOVAR_ID, QUANTITY, PRICE, SUM, CARD_NUM, DISCOUNT_PERCENT, DISCOUNT_SUM).
task3(ID_CARD, TOVAR_NAME, FEEDBACK_TEXT, date(DAY, MONTH, YEAR)) :- 
                                        client(ID_CARD, name(_, _, _), phone_numbers([_, _]), emails(_, _),birth(_, _, _), _),
                                        tovar(TOVAR_ID, _, _, TOVAR_NAME, _, _), 
                                        tovar_v_cheku(_, CHECK_ID, TOVAR_ID, _), 
                                        check(CHECK_ID, _, ID_CARD, _, _),
                                        feedback(_, CHECK_ID, FEEDBACK_TEXT, date(DAY, MONTH, YEAR)).


/*     c. Має бути запит з сумуванням числових даних по стовпчику таблиці чи її частини (аналог Group by або після фільтрації where(умова)): 
     приклади: середня з/п по підрозділу, середній вік студентів групи або сумарна з/п по підрозділу тощо.

*/

% В данному прикладі використано предикат bagof (аналог Group by) для групування, може містити повтори, але так як назви товарів унікальні, повторів немає

/* Вивести список товарів, згрупованих за номерами стелажів
 ?- task4(Stelag, Results).
 
Results = [tovar(3, 3, 50, "trousers", 5, 1), tovar(4, 4, 63, "dress", 6, 1), tovar(8, 8, 76, "hoodie", 10, 1), tovar(9, 9, 130, "swimsuit", 6, 1), tovar(10, 10, 130, "bra", 6, 1)],
Stelag = 1

Results = [tovar(6, 6, 130, "shorts", 2, 2)],
Stelag = 2

Results = [tovar(2, 2, 90, "blouse", 6, 4), tovar(5, 5, 67, "coat", 6, 4)],
Stelag = 4

Results = [tovar(1, 1, 63, "skirt", 3, 5), tovar(7, 7, 80, "shirt", 8, 5)],
Stelag = 5
*/
tovar_by_stelag(tovar(A,B,C,D,E,Stelag),Stelag) :- tovar(A,B,C,D,E,Stelag).
task4(Stelag, Results) :- bagof(Tovar, tovar_by_stelag(Tovar, Stelag), Results).


/*   d. Мають бути запити (правила-запити) типу:
        i. «ті» (принаймні один та можливо і інші).  == task5
        ii. «тільки ті» (хоча б один, а інші ні).  == task6
        iii. «усі ті», можливо і інші.  == task7
        iv. «усі ті та тільки ті».  == task5
*/

/* Які покупці (прізвище) купили «ті» (принаймні один та можливо і інші) товари, що і певний покупець? 
 ?- task5('Syshkova', SECOND_NAME).
SECOND_NAME = 'Synelnyk'
SECOND_NAME = 'Fukra'
false
*/ 

task5(SECOND_NAME1, SECOND_NAME2) :- client(ID_CARD1, name(_, SECOND_NAME1, _), phone_numbers([_, _]), emails(_, _), birth(_, _, _), _),
                                    client(ID_CARD2, name(_, SECOND_NAME2, _), phone_numbers([_, _]), emails(_, _), birth(_, _, _), _),
                                    ID_CARD1 \= ID_CARD2,
                                    tovar_v_cheku(_, CHECK_ID1,  TOVAR_ID, _),
                                    tovar_v_cheku(_, CHECK_ID2,  TOVAR_ID, _),
                                    check(CHECK_ID1, _, ID_CARD1, _, _),
                                    check(CHECK_ID2, _, ID_CARD2, _, _).


/* Які покупці (прізвище) купили «тільки ті» (хоча б один, а інші ні) товари, що і певний покупець?
 ?- task6('Syshkova', SECOND_NAME).
 SECOND_NAME = 'Fukra'
 false
*/
task6(SECOND_NAME1, SECOND_NAME2) :- task7(SECOND_NAME2, SECOND_NAME1).


/* Які покупці (прізвищеб номер картки, номер чеку) купили усі ті товари (усі ті та, можливо, й інші), що і певний покупець?
 ?- task7('Barabolya', S).
 S = 'Synelnyk'
 S = 'Babii'
*/

% task7(SECOND_NAME1, SECOND_NAME2, ID_CARD2, CHECK_ID2) :- client(ID_CARD1, name(_, SECOND_NAME1, _), phone_numbers([_, _]), emails(_, _), birth(_, _, _), _),
%                                      client(ID_CARD2, name(_, SECOND_NAME2, _), phone_numbers([_, _]), emails(_, _), birth(_, _, _), _),
%                                      ID_CARD1 \= ID_CARD2,
%                                      check(CHECK_ID1, _, ID_CARD1, _, _),
%                                      check(CHECK_ID2, _, ID_CARD2, _, _),
%                                      forall(tovar_v_cheku(_, CHECK_ID1,  TOVAR_ID, _),
%                                             tovar_v_cheku(_, CHECK_ID2,  TOVAR_ID, _)).

task7(SECOND_NAME1, SECOND_NAME2 ) :- client(_, name(_, SECOND_NAME1, _), phone_numbers([_, _]), emails(_, _), birth(_, _, _), _),
                                      client(_, name(_, SECOND_NAME2, _), phone_numbers([_, _]), emails(_, _), birth(_, _, _), _),
                                      setof(TOVAR_ID, tovar_of_client(CLIENT_ID, TOVAR_ID), TOVAR1),
                                      setof(TOVAR_ID, tovar_of_client(CLIENT_ID, TOVAR_ID), TOVAR2),
                                      subset(TOVAR1, TOVAR2).
                                                        

%айди товаров, что купил айди клиент:
/* ?- tovar_of_client(12345, TOVAR_ID).
TOVAR_ID = 1
TOVAR_ID = 5
TOVAR_ID = 5
TOVAR_ID = 7
*/
tovar_of_client(CLIENT_ID, TOVAR_ID) :- check(CHECK_ID, _, CLIENT_ID, _, _), tovar_v_cheku(_, CHECK_ID,  TOVAR_ID, _).


/* Які покупці (прізвище, номер картки, відсоток знижки) купили ті самі товари (усі ті і тільки ті), що і певний покупець?
 ?- task8('Debet', SECOND_NAME, CARD_NUM, DISCOUNT_PERCENT).
 CARD_NUM = 12348,
 DISCOUNT_PERCENT = 20,
 SECOND_NAME = 'Barabolya'
 false
*/
task8(SECOND_NAME1, SECOND_NAME2, CARD_NUM, DISCOUNT_PERCENT ) :- task7(SECOND_NAME1, SECOND_NAME2), task7(SECOND_NAME2, SECOND_NAME1),
                                                                client(CARD_NUM, name(_, SECOND_NAME2, _), phone_numbers([_, _]), emails(_, _), birth(_, _, _), DISCOUNT_PERCENT).                                                                


/*   7. Визначити принаймні два оператори, щоб можна було звертатися так як у прикдаді:
   ?- Хто мешкає_у_місті київ на_вулиці крещатик.
   Іван мешкає_у_місті київ на_вулиці крещатик
   Ввести (визначити) не менше двох операторів (:- op) з різним пріоритетом.
*/

/* Хто з клієнтів народився у 1999 році?
 ?- Who was_born_in_year_ 1999.
 Who = name('Mariia', 'Synelnyk', 'Sergiivna')
 Who = name('Valeria', 'Petrenko', 'Batkivna')
 Who = name('Mykhailo', 'Debet', 'Vasylovych')
*/

was_born_in_year_(X, Y):-
    client(_, X, _, _, birth(_, _, Y), _).
:- op(500,xfy, was_born_in_year_). 


/* ?- Who buy_ "skirt".
Who = name('Mariia', 'Synelnyk', 'Sergiivna')
Who = name('Veronika', 'Babii', 'Kostyantynivna')
Who = name('Petro', 'Barabolya', 'Batkovych')
Who = name('Mykhailo', 'Debet', 'Vasylovych')
*/

  buy_(X, Y):-
   tovar(ID, _, _, Y, _, _),
   tovar_v_cheku(_, CHECK_ID,  ID, _),
   check(CHECK_ID, _, Cl_ID, _, _),
   client(Cl_ID, X, _, _, _, _).
:- op(500,yfx, buy_).


/* ?- Who buy_ "skirt" and_buy_ "coat".
Who = name('Mariia', 'Synelnyk', 'Sergiivna')
Who = name('Mariia', 'Synelnyk', 'Sergiivna')
Who = name('Veronika', 'Babii', 'Kostyantynivna')
Who = name('Veronika', 'Babii', 'Kostyantynivna')
Who = name('Petro', 'Barabolya', 'Batkovych')
Who = name('Petro', 'Barabolya', 'Batkovych')
Who = name('Mykhailo', 'Debet', 'Vasylovych')
Who = name('Mykhailo', 'Debet', 'Vasylovych')
*/

and_buy_(buy_(X, Y), Y1 ):-
    buy_(X, Y),
    buy_(X, Y1).
:- op(600,yfx, and_buy_).

