%Made by Mariia Synelnyk
%в аптеці є ліки(аптека(номер, адреса, телефон), ліки (код, назва, фармакологічна група), наявна кількість, ціна за одиницю, термін придатності).
%isExistsMedicine(pharmacy(PHARMACY_ID, ADDRESS, TEL), medicine(MEDICINE_ID, MEDICINE_NAME, GROUP), QUANTITY, PRICE, TERMIN).
isExistsMedicine(pharmacy(1,'Predslavynska, 9','0673489976'),medicine(01,'Citramon','Analgesic'),100, 15, 2021).
isExistsMedicine(pharmacy(1,'Predslavynska, 9','0673489976'),medicine(02,'Analgin','Analgesic'),100, 13, 2021).
isExistsMedicine(pharmacy(1,'Predslavynska, 9','0673489976'),medicine(03,'D-Panthenol','Tissue regeneration'),0, 38, 2025).
isExistsMedicine(pharmacy(1,'Predslavynska, 9','0673489976'),medicine(04,'Loratadin','Antihistamine'),1089, 32, 2023).

isExistsMedicine(pharmacy(2,'Friendship of Peoples, 30/1','044516456231'),medicine(01,'Citramon','Analgesic'),100, 15, 2021).
isExistsMedicine(pharmacy(2,'Friendship of Peoples, 30/1','044516456231'),medicine(02,'Analgin','Analgesic'),15, 13, 2021).
isExistsMedicine(pharmacy(2,'Friendship of Peoples, 30/1','044516456231'),medicine(03,'D-Panthenol','Tissue regeneration'),186, 37, 2021).
isExistsMedicine(pharmacy(2,'Friendship of Peoples, 30/1','044516456231'),medicine(04,'Loratadin','Antihistamine'),0, 32, 2023).
isExistsMedicine(pharmacy(2,'Friendship of Peoples, 30/1','044516456231'),medicine(05,'Citrine','Antihistamine'),111, 15, 2021).

isExistsMedicine(pharmacy(3,'Bohdan Khmelnytsky, 42','380784693435'),medicine(01,'Citramon','Analgesic'),678, 16, 2022).
isExistsMedicine(pharmacy(3,'Bohdan Khmelnytsky, 42','380784693435'),medicine(02,'Analgin','Analgesic'),45, 12, 2022).
isExistsMedicine(pharmacy(3,'Bohdan Khmelnytsky, 42','380784693435'),medicine(03,'D-Panthenol','Tissue regeneration'),1437, 38, 2021).
isExistsMedicine(pharmacy(3,'Bohdan Khmelnytsky, 42','380784693435'),medicine(04,'Loratadin','Antihistamine'),0, 31, 2021).

isExistsMedicine(pharmacy(4,'Yevhen Konovalets, 33/1','0661898173'),medicine(02,'Analgin','Analgesic'),0, 13, 2020).
isExistsMedicine(pharmacy(4,'Yevhen Konovalets, 33/1','0661898173'),medicine(03,'D-Panthenol','Tissue regeneration'),1985, 38, 2024).
isExistsMedicine(pharmacy(4,'Yevhen Konovalets, 33/1','0661898173'),medicine(04,'Loratadin','Antihistamine'),13473, 37, 2021).
isExistsMedicine(pharmacy(4,'Yevhen Konovalets, 33/1','0661898173'),medicine(05,'Citrine','Antihistamine'),2347, 67, 2022).

isExistsMedicine(pharmacy(5,'Velyka Vasylkivska, 71/6','0445410795'),medicine(01,'Citramon','Analgesic'),6945, 15, 2021).
isExistsMedicine(pharmacy(5,'Velyka Vasylkivska, 71/6','0445410795'),medicine(02,'Analgin','Analgesic'),132, 15, 2023).
isExistsMedicine(pharmacy(5,'Velyka Vasylkivska, 71/6','0445410795'),medicine(03,'D-Panthenol','Tissue regeneration'),2345, 13, 2023).
isExistsMedicine(pharmacy(5,'Velyka Vasylkivska, 71/6','0445410795'),medicine(04,'Loratadin','Antihistamine'),8765, 38, 2023).
isExistsMedicine(pharmacy(5,'Velyka Vasylkivska, 71/6','0445410795'),medicine(05,'Citrine','Antihistamine'),23, 32, 2023).

% телефон аптеки, де є потрібні ліки
pharmacy_tel(TEL, MEDICINE_NAME) :- isExistsMedicine(pharmacy(_, _, TEL), medicine(_, MEDICINE_NAME ,_), _, _, _).

% в якій аптеці ціна на задані ліки є меншою за визначену величину
pharmacy_price_med(PHARMACY_ID, MEDICINE_NAME, MY_PRICE) :- isExistsMedicine(pharmacy(PHARMACY_ID, _, _), medicine(_, MEDICINE_NAME ,_), _, PRICE, _),
                                                            MY_PRICE > PRICE.

%в яких ліків термін придатності перевищено
termin_out(PHARMACY_ID, MEDICINE_ID, MEDICINE_NAME, MY_TERMIN) :- isExistsMedicine((pharmacy(PHARMACY_ID,_,_), medicine(MEDICINE_ID, MEDICINE_NAME, _), _, _, TERMIN),
                                                    MY_TERMIN > TERMIN).

%кількість ліків у заданій аптеці
medicine_quantity(MEDICINE_NAME, PHARMACY_ID, QUANTITY) :- isExistsMedicine(pharmacy(PHARMACY_ID,_,_), medicine(_, MEDICINE_NAME,_), QUANTITY, _, _).

%ціна ліків у заданій аптеці
medecine_price(MEDICINE_NAME, PHARMACY_ID, PRICE) :- isExistsMedicine(pharmacy(PHARMACY_ID, _, _), medicine(_, MEDICINE_NAME, _), _, PRICE, _).

% номер та адреса аптеки з потрібним за групою препаратом
pharmacy_id_adress(PHARMACY_ID, PHARMACY_ADRESS, GROUP) :- isExistsMedicine(pharmacy(PHARMACY_ID, PHARMACY_ADRESS, _),  medicine(_, _, GROUP), _, _, _).
