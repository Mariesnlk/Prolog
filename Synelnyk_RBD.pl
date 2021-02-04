%Made by Mariia Synelnyk

%аптека (номер, адреса, телефон)
%pharmacy(PHARMACY_ID, ADDRESS, TEL)
pharmacy(1,'Predslavynska, 9','0673489976').
pharmacy(2,'Friendship of Peoples, 30/1','044516456231').
pharmacy(3,'Bohdan Khmelnytsky, 42','380784693435').
pharmacy(4,'Yevhen Konovalets, 33/1','0661898173').
pharmacy(5,'Velyka Vasylkivska, 71/6','0445410795').

%ліки (код, назва, фармакологічна група)
%medicine(MEDICINE_ID, MEDICINE_NAME, GROUP)
medicine(01,'Citramon','Analgesic').
medicine(02,'Analgin','Analgesic').
medicine(03,'D-Panthenol','Tissue regeneration').
medicine(04,'Loratadin','Antihistamine').
medicine(05,'Citrine','Antihistamine').

%в аптеці є ліки (номер аптеки, код ліків, наявна кількість, ціна за одиницю, термін придатності)
%isExistsMedicine(PHARMACY_ID, MEDICINE_ID, QUANTITY, PRICE, TERMIN)
isExistsMedicine(1, 01, 100, 15, 2021).
isExistsMedicine(1, 02, 100, 13, 2021).
isExistsMedicine(1, 03, 0, 38, 2025).
isExistsMedicine(1, 04, 1089, 32, 2023).
isExistsMedicine(2, 01, 100, 15, 2021).
isExistsMedicine(2, 02, 15, 13, 2021).
isExistsMedicine(2, 03, 186, 37, 2021).
isExistsMedicine(2, 04, 0, 32, 2023).
isExistsMedicine(2, 05, 111, 15, 2021).
isExistsMedicine(3, 01, 678, 16, 2022).
isExistsMedicine(3, 02, 45, 12, 2022).
isExistsMedicine(3, 03, 1437, 38, 2021).
isExistsMedicine(3, 04, 0, 31, 2021).
isExistsMedicine(4, 02, 0, 13, 2020).
isExistsMedicine(4, 03, 1985, 38, 2024).
isExistsMedicine(4, 04, 13473, 37, 2021).
isExistsMedicine(4, 05, 2347, 67, 2022).
isExistsMedicine(5, 01, 6945, 15, 2021).
isExistsMedicine(5, 02, 132, 15, 2023).
isExistsMedicine(5, 03, 2345, 13, 2023).
isExistsMedicine(5, 04, 8765, 38, 2023).
isExistsMedicine(5, 05, 23, 32, 2023).

% телефон аптеки, де є потрібні ліки
pharmacy_tel(TEL, MEDICINE_NAME) :- isExistsMedicine(PHARMACY_ID, MEDICINE_ID, _, _, _),
                                    pharmacy(PHARMACY_ID, _, TEL),
                                    medicine(MEDICINE_ID, MEDICINE_NAME ,_).

% в якій аптеці ціна на задані ліки є меншою за визначену величину
pharmacy_price_med(PHARMACY_ID, MEDICINE_NAME, MY_PRICE) :- isExistsMedicine(PHARMACY_ID, MEDICINE_ID, _, PRICE, _),
                                                            pharmacy(PHARMACY_ID, _, _),
                                                            medicine(MEDICINE_ID, MEDICINE_NAME ,_),
                                                            MY_PRICE > PRICE.

%в яких ліків термін придатності перевищено
termin_out(MEDICINE_ID, MEDICINE_NAME, MY_TERMIN) :- isExistsMedicine(_, MEDICINE_ID, _, _, TERMIN),
                                                    medicine(MEDICINE_ID, MEDICINE_NAME, _),
                                                    MY_TERMIN \= TERMIN.

%кількість ліків у заданій аптеці
medicine_quantity(MEDICINE_NAME, PHARMACY_ID, QUANTITY) :- isExistsMedicine(PHARMACY_ID, MEDICINE_ID, QUANTITY, _, _),
                                                          medicine(MEDICINE_ID, MEDICINE_NAME,_),
                                                          pharmacy(PHARMACY_ID,_,_).

%ціна ліків у заданій аптеці
medecine_price(MEDICINE_NAME, PHARMACY_ID, PRICE) :- isExistsMedicine(PHARMACY_ID, MEDICINE_ID, _, PRICE, _),
                                                    medicine(MEDICINE_ID, MEDICINE_NAME, _),
                                                    pharmacy(PHARMACY_ID, _, _).

% номер та адреса аптеки з потрібним за групою препаратом
pharmacy_id_adress(PHARMACY_ID, PHARMACY_ADRESS, GROUP) :- isExistsMedicine(PHARMACY_ID, MEDICINE_ID, _, _, _),
                                                        pharmacy(PHARMACY_ID, PHARMACY_ADRESS, _),
                                                        medicine(MEDICINE_ID, _, GROUP).
