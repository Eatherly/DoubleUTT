# DoubleUTT
В первом поле можно вводить номер контракта ( 011 , 012 , 021, 023и т.д.) или его id (1,2,3 и т.д.);
В это поле проводится валидация на цифры (ввод литер не возможен);
Во втором поле можно вводиь имя или его id их в базе данніх только два (Andrii и Leonid / 1 и 2);
При предварительном выставлении предпочтений в "чекбокс" в ответе идет фильтрация по статусу сервиса(можно комбинировать);
При вводе несуществующих данных на странице появляется соответствующая информация
TASK:
Необходимо реализовать  класс, который  будет использоваться для печати документов. На вход передается id_contract, по которому нужно найти привязанного клиента и привязанные сервисы.

У нас есть 3 таблицы в mysql:
obj_contracts;
obj_customers;
obj_services.

Структура obj_contracts следующая:
 id_contract ( int 11  IA );
id_customer ( int 11 );
number ( varchar 100 );
date_sign ( date );
staff_number( varchar 100 ).

Структура obj_customers следующая:
 id_customer( int 11  IA );
name_customer( varchar 250 );
company ( enum('company_1','company_2','company_3') ).

Структура obj_services следующая:
 id_service( int 11  IA );
id_contract(  int 11 );
title_service( varchar 250 );
status ( enum('work','connecting','disconnected') ).

Связанны таблицы следующим образом:
 `obj_customers`.`id_customer` = `obj_contracts`.`id_customer`,
 ` obj_services`.`id_contract` = `obj_contracts`.`id_contract`.
