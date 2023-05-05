-- 1.	Использовать базу данных gt41_42e
use gt41_42e;

-- 2.	Вывести все таблицы из этой бд
show tables;

-- 3. Создать таблицу customers
-- id целое число первичный ключ автоинкремент, 
-- first_name строка не null,
-- last_name строка не null,
-- age целое число больше 18,
-- phone integer не null,
-- order_name строка не null,
-- delivery_status целое число 1 или 0

drop table customers;
create table customers(
	id integer primary key auto_increment,
    first_name varchar(128) not null,
    last_name varchar(128) not null,
    age integer check(age>18),
    phone integer not null,
    order_name varchar(128) not null,
    delivery_status integer check(delivery_status in (1, 0))
    );
    
select * from customers;

-- 4. Удалить поля first_name и last_name
alter table customers
drop column first_name,
drop column last_name;

-- 5. Добавить поле full_name строка не null
alter table customers
add full_name varchar(128) not null;

-- 6. Переименовать поле id на customer_id
alter table customers
change column id customer_id integer auto_increment;

-- 7. Добавить поле price целое число не null
alter table customers
add price integer not null;

-- 8. Изменить тип phone на строку
alter table customers
modify column phone varchar(128);

-- 9. Удалить поле phone
alter table customers
drop phone;

-- 10. Переименовать поле price на sum_price целое число не null
alter table customers
change price sum_price integer not null;

insert into customers(full_name, age, order_name, delivery_status, sum_price) 
			values( "Kris Krill" , 20 , "math_book, pen" , 0 , 9000 ) ,
				( "Kristin Brooks" , 50 , "notebook, pen, drawing_block" , 0 , 4500 ) ,
				( "Kristina Livshits" , 55 , "pencil, sharpener" , 1 , 2340 ) ,
				( "Kristina Nunez" , 43 , "math_book, eng_book, phil_book" , 1 , 18000 ) ,
				( "Kurtis Parham" , 19 , "pencil" , 1 , 350 ) ,
				( "Lai Kurtich" , 22 , "pen, sharpener" , 1 , 1200 ) ,
				( "Lakia Fitzen" , 21 , "notebook, pen" , 1 , 3500 ) ,
				( "Landon Neville" , 34 , "colored papers, pencil" , 1 , 2450 ) ,
				( "Latoria Siprasoeuth" , 32 , "pen, sharpener, rubber" , 1 , 4600 ) ,
				( "Laurice Goffredo" , 76 , "watercolors, drawing_block" , 1 , 1200 ) ,
				( "Laurice Grimstead" , 54 , "notebook" , 1 , 4500 ) ,
				( "Laurice Karl" , 19 , "colored papers" , 0 , 2250 ) ,
				( "Laveta Wida" , 34 , "pen, math_book" , 0 , 1170 ) ,
				( "Lecia Alvino" , 45 , "pencil, sharpener, notebook" , 1 , 9000 ) ,
				( "Lenore Sullivan" , 55 , "eng_book, notebook" , 1 , 175 ) ,
				( "Leon Schoepfer" , 67 , "notebook" , 0 , 600 ) ,
				( "Lexie Magee" , 54 , "watercolors, drawing_block, brushes" , 0 , 1750 ) ,
				( "Li Robleto" , 76 , "brushes, pencil, notebook" , 0 , 1225 ) ,
				( "Libby Krauss" , 78 , "brushes, watercolor" , 0 , 2300 ) ,
				( "Lillia Talbott" , 65 , "eng_book, pen, rubber" , 0 , 600 ) ,
				( "Linda Merida" , 54 , "notebook, pen, drawing_block" , 1 , 7700 ) ,
				( "Lisa Hughes" , 34 , "flag" , 1 , 5450 ) ,
				( "Lloyd Shackley" , 23 , "brushes, watercolor" , 1 , 4370 ) ,
				( "Lola Whitley" , 24 , "notebook" , 0 , 12200 ) ,
				( "Lonnie Colby" , 74 , "notepad" , 1 , 3375 ) ,
				( "Lorilee Bautista" , 24 , "pencil, sharpener" , 1 , 3800 ) ,
				( "Loris Thibadeau" , 54 , "notepad" , 1 , 4950 ) ,
				( "Lorita Koenig" , 59 , "flag" , 0 , 4425 ) ,
				( "Love Whistlehunt" , 47 , "notepad" , 1 , 5500 ) ,
				( "Lovie Ritacco" , 23 , "colored papers" , 1 , 3800 ) ,
				( "Loyd Huckeba" , 26 , "flag" , 0 , 300 ) ,
				( "Loyd Puchalla" , 25 , "notebook" , 1 , 3850 ) ,
				( "Luana Berends" , 38 , "pencil, sharpener, rubber" , 1 , 2725 ) ,
				( "Lucas Summerill" , 36 , "notepad, pen" , 0 , 2185 ) ,
				( "Luciano Lingenfelter" , 80 , "sharpener" , 1 , 6100 ) ,
				( "Lucila Heck" , 58 , "brushes, watercolor" , 1 , 1687.5 ) ,
				( "Luigi Nored" , 23 , "notepad" , 1 , 1900 ) ,
				( "Luis Pothoven" , 38 , "flag" , 1 , 2475 ) ,
				( "Luther Ardinger" , 49 , "notebook" , 1 , 2212.5 ) ,
				( "Mable Ballard" , 59 , "colored papers, pencil" , 1 , 2750 ) ,
				( "Maia Leggett" , 71 , "notepad" , 1 , 1900 ) ,
				( "Marc Domanski" , 58 , "rubber, pencil" , 1 , 4930 ) ,
				( "Marco Slivka" , 80 , "brushes, watercolor" , 1 , 2680 ) ,
				( "Margaret Bennett" , 82 , "pencil, sharpener, pen" , 1 , 1600 ) ,
				( "Marissa Pontius" , 69 , "notebook" , 1 , 9430 ) ,
				( "Markita Larner" , 58 , "notepad, flag" , 1 , 605 ) ,
				( "Martha Baker" , 38 , "colored papers, notebook" , 1 , 1030 ) ,
				( "Marvis Chou" , 27 , "pencil, sharpener" , 0 , 2180 ) ,
				( "Mary Barnes" , 28 , "brushes, watercolor" , 0 , 1655 ) ,
				( "Mary Wilson" , 78 , "notebook" , 0 , 2730 );
                
select * from customers;

-- 12. Найти тех покупателей, которым больше 30 лет, и они заказывали ручку(pen).
select * from customers
where age > 30 and (order_name like '%pen' or order_name like '%pen,%');

-- 13. Найти тех покупателей, которые заказывали и ручку(pen), и тетради (notebook), и у них статус доставки 0. 
select * from customers
where delivery_status = 0 and order_name like '%notebook%' and (order_name like '%pen' or order_name like '%pen,%');

-- 15. Увеличить сумму заказа на 100 у тех покупателей, которые заказали карандаши(pencil). 
set sql_safe_updates = 0;

update customers
set sum_price = sum_price + 100
where order_name like '%pencil%';

-- 18. Поменять статус заказа на 1 для тех покупателей, у которых сумма заказа больше 1200 и статус заказа 0.
update customers
set delivery_status = 1
where sum_price > 1200 and delivery_status = 0;

set sql_safe_updates = 1;

-- Д/З_1
-- 14. Найти тех покупателей, у которых сумма заказа больше 4000 и меньше 8000.
-- 16. Удалить записи тех покупателей, которые заказывали только тетради
-- 17. Найти тех покупателей, которые заказывали math_book, но не eng_book.
-- 19. Удалить записи тех покупателей, у которых имя начинается на букву L, а фамилия заканчивается на O.
-- 20.	Сделать скидку на 10% для тех покупателей, у которых статус заказа 0. 
-- 21.	Сделать скидку на столько процентов, сколько лет покупателю, если ему меньше 30.
-- 22.	Удалить записи тех покупателей, у которых статус доставки 0.
-- 23.	Увеличить сумму заказа на 5% для тех покупателей, которые заказывали цветные бумаги.
-- 24.	Удалить таблицу

create table phones(
id integer primary key auto_increment,
product_name varchar(128) not null,
product_count integer,
starting_price integer not null);

insert into Phones(Product_Name, Product_Count, Starting_Price) 
values('iPhone X', 3, 680),
 ('iPhone XR', 2, 700),
 ('iPhone XS', 10, 720),
 ('iPhone 11', 1, 790),
 ('iPhone 11 Pro', 12, 850),
 ('iPhone 11 Pro Max', 2, 890),
 ('iPhone SE', 1, 850),
 ('iPhone 12 Mini', 15, 890),
 ('iPhone 12', 20, 910),
 ('iPhone 12 Pro', 5, 950),
 ('iPhone 12 Pro Max', 13, 1000);
 
-- Оператор AS
--  С помощью оператора AS можно изменить название выходного столбца или определить его псевдоним:
select product_name as title, product_count
from phones; 

-- Вывести поле product_name как title, посчитать и вывести общую сумму заказов (product_count * starting_price) как total_sum 
select product_name as title, product_count * starting_price as total_sum
from phones;

-- Вывести поля product_name как name, product_count как count и starting_price как price.
select product_name as name, product_count as count, starting_price as price
from phones;


-- CASE
-- В MySQL оператор CASE имеет функциональность оператора IF-THEN-ELSE 

-- CASE
--     WHEN условие_1 THEN результат_1
--     WHEN условие_2 THEN результат_2
--     .................................
--     WHEN условие_N THEN условие_N
--     [ELSE альтернативный_результат]


-- select product_name, product_count,
-- case 
-- 	when условие1 then результат1..
--  when условие2 then результат2..
-- 	when условие3 then результат3..
-- 	else альт. результат
-- end as category
-- from phones;

-- Пример с CASE 
select product_name, product_count,
case 
	when product_count <= 2 then 'Товар заканчивается'
    when product_count <= 5 then 'Мало товара'
	when product_count <= 10 then 'Есть в наличии'
	else 'Много товара'
end as category
from phones;

-- Создать новое поле category, заполнить ее: 
-- Если Product_Count меньше/равно 2, category = 'Товар заканчивается',
-- Если Product_Count меньше/равно 5, category = 'Мало товара',
-- Если Product_Count меньше/равно 10, category = 'Есть в наличии',
-- В остальных случаях category ='Много товара';
alter table phones
add category varchar(128);

set sql_safe_updates = 0;

update phones
set category = 
case 
	when product_count <= 2 then 'Товар заканчивается'
    when product_count <= 5 then 'Мало товара'
	when product_count <= 10 then 'Есть в наличии'
	else 'Много товара'
end;


-- Создать новое поле tax целое число
-- Заполнить поле tax
-- Если начальная цена меньше 700, tax = null,
-- если больше либо равно 700 и меньше 850, tax = 15,
-- если больше или равно 850, tax = 25 

alter table phones
add tax integer;

update phones
set tax =
case
	when starting_price < 700 then null
    when starting_price < 850 then 15
    else 25
end;


-- Посчитать конечную цену и представить его как Final_price
select product_name, starting_price, tax, starting_price + starting_price * tax / 100 as final_price
from phones;

-- Создать новое поле для final_price numeric(7, 2)
-- if tax = null => starting_price
-- else => starting_price + starting_price * tax / 100
alter table phones
add final_price numeric(7, 2);

update phones
set final_price = 
case
	when tax is null
		then starting_price
	else
		starting_price + starting_price * tax / 100
end;

update phones
set final_price = coalesce(starting_price + starting_price * tax / 100, starting_price);

select * from phones;

-- Функции для работы с числами
select 1 as value;

select -1 as value;

select 1.23 as value;

-- ABS: возвращает абсолютное значение числа.
select abs(-23) as abs;

-- POW(m, n): возвращает m, возведенную в степень n.
select pow(4, 2) as pow;

-- ROUND: округляет число. В качестве первого параметра передается число. Второй параметр указывает на длину. 
-- Если длина представляет положительное число, то оно указывает, до какой цифры после запятой идет округление. 
-- Если длина представляет отрицательное число, то оно указывает, до какой цифры с конца числа до запятой идет округление

select round(1234.567, 2) as round_1;
select round(1234.567, -2) as round_2;

-- SQRT: получает квадратный корень числа.
select sqrt(225) as sqrt;

-- RAND: генерирует случайное число с плавающей точкой в диапазоне от 0 до 1.
select round(rand(), 2) as rand;

-- https://metanit.com/sql/mysql/6.2.php

-- Функции для работы со строками

-- CONCAT: объединяет строки. В качестве параметра принимает от 2-х и более строк, которые надо соединить:
select concat('Tom', ' ', 'Smith') as full_name;

-- CONCAT_WS: также объединяет строки, но в качестве первого параметра принимает разделитель, который будет соединять строки:
select concat_ws(' ', 'Tom', 'Smith', 'age', '34') as information;

-- LENGTH: возвращает количество символов в строке. В качестве параметра в функцию передается строка, для которой надо найти длину:
select length('Tom Smith') as lenght;

-- LTRIM: удаляет начальные пробелы из строки. В качестве параметра принимает строку:
select ltrim('    apple');

-- RTRIM: удаляет конечные пробелы из строки. В качестве параметра принимает строку:
select rtrim('apple    ');

-- TRIM: удаляет начальные и конечные пробелы из строки. В качестве параметра принимает строку:
select trim('   apple    ');

-- LEFT: вырезает с начала строки определенное количество символов. 
-- Первый параметр функции - строка, а второй - количество символов, которые надо вырезать сначала строки:
select left('apple', 3);

-- RIGHT: вырезает с конца строки определенное количество символов. 
-- Первый параметр функции - строка, а второй - количество символов, которые надо вырезать сконца строки:
select right('apple', 3);

-- SUBSTRING(str, start [, length]): вырезает из строки str подстроку, начиная с позиции start. 
-- Третий необязательный параметр передает количество вырезаемых символов:
select substring('galaxy S8 plus', 8);
select substring('galaxy S8 plus', 8, 2);

-- REPLACE(search, find, replace): заменяет в строке find подстроку search на подстроку replace. 
-- Первый параметр функции - строка, второй - подстрока, которую надо заменить, а третий подстрока, на которую надо заменить:
select replace('galaxy S8 plus', 'S8', 'A9');


-- LOCATE(find, search [, start]): возвращает позицию первого вхождения подстроки find в строку search.
-- Дополнительный параметр start позволяет установить позицию в строке search, с которой начинается поиск подстроки find. 
-- Если подстрока search не найдена, то возвращается 0:
select locate('a', 'Anna'); -- 1
select locate('a', 'Anna', 2); -- 4
select locate('a', 'Tom'); -- 0

-- REVERSE: переворачивает строку наоборот:
select reverse('Tom');
select reverse('12345');

-- LOWER: переводит строку в нижний регистр:
select lower('APPle');

-- UPPER: переводит строку в верхний регистр
select upper('APPle');

-- https://metanit.com/sql/mysql/6.1.php


-- Д/З_2 
-- 1.	Используем таблицу employees.
-- 	Нужно повысить зарплаты для отдела sales на 20%, для finance 15%, для shipping 10%, для marketing 25%, для HR 20% и для IT 35%. 
-- 	Записать данные в поле new_salary. Поле создавать не нужно, используем AS. 
-- 2.	Создать поле new_salary numeric(7, 2), заполнить.
-- 3.	Используем таблицу customers.
-- 	Создать поле sale integer. 
-- 4.	Заполнить поле:
-- 	Если sum_price < 5000 скидка null, если больше/равно 5000 и меньше 10000, скидка  5, если больше/равно 10000, скидка 10.
-- 5.	Создать поле final_price. Заполнить поле соответственно, сделав скидки.
-- 6.	В order_name поменять math_book на mathematics_book, eng_book на english_book.
-- 7.	Вывести случайные числа от 1 до 10.
-- 8.	Используем таблицу employees.
-- 	Имя и фамилию соединить в новое поле full_name.
-- 9.	Поле email перевести в нижний регистр.
-- 10. Используем бд sakila
-- 11. Используем таблицу film
-- В description слово beautiful заменить словом amazing.
-- 12. Вывести поле title_len (количество символов поле title).

