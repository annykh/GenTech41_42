-- Урок 3

-- Используем базу данных
use gt41_42e;

-- Задачи
-- 1. Создать таблицу products
-- 		id первичный ключ автоинкремент
-- 		title строка 128
-- 		quantity от 0 до 10
create table products(
	id integer primary key auto_increment,
        	title varchar(128),
        	quantity integer check(quantity between 0 and 10)
);

-- 2. Добавить несколько строк
insert into products (title, quantity) 
values  ('Apple', 3), 
		('Orange', 2), 
		('Banana', 10), 
		('Pineapple', 7), 
		('Kiwi', 4);   
 
-- 3. Посмотреть результат 
select * from products;

-- Если таблица уже была ранее создана, и ее необходимо изменить, то для этого применяется команда ALTER TABLE. 

-- 4. Добавить поле price integer со значением по умолчанию 0
alter table products
add price integer default 0;

-- NUMERIC: хранит числа с фиксированной точностью. Данный тип может принимать два параметра precision и scale: NUMERIC (precision, scale).
-- Параметр precision представляет максимальное количество цифр, которые может хранить число. Это значение должно находиться в диапазоне от 1 до 65.
-- Параметр scale представляет максимальное количество цифр, которые может содержать число после запятой. 
-- Это значение должно находиться в диапазоне от 0 до значения параметра precision. По умолчанию оно равно 0.

-- 5. Изменить тип price на numeric(3, 2) 
alter table products
modify column price numeric(3,2);

-- 6. Изменить тип price обратно на integer
alter table products
modify column price integer;

-- 7. Переименовать поле на item_price
alter table products
change price item_price integer;

 
-- 8. Удалить поле item_price
alter table products
drop column item_price;

-- 9. Добавить поле quality типа numeric(3, 2) со значение по умолчанию 0
alter table products
add quality numeric(3, 2) default 0;

-- 10. Изменить тип quality на integer
alter table products
modify column quality integer;

-- Удаление из базы данных происходит с помощью команды "DELETE" (переводится с английского как "УДАЛИТЬ"). Функция удаляет не одну строку, а несколько, 
-- при этом выбирает для удаления строки по логике функции "SELECT". То есть чтобы удалить данные из базы, необходимо точно определить их.
-- Чтобы удалить или обновить данные нужно отключить режима безопасных обновлений 
set sql_safe_updates = 0;

-- О других способах исправления ошибки «Error Code: 1175» можно прочитать здесь: https://info-comp.ru/error-in-mysql-workbench-error-code-1175

-- 11. Удалить все продукты с количеством 10
delete from products
where quantity = 10;

-- Функция обновления "UPDATE" (переводится с английского как "ОБНОВИТЬ") довольно часто используется в проектах сайтов. Как и в случае с функцией "DELETE", 
-- функция обновления не успокоится до тех пор, пока не обновит все поля, которые подходят под условия, если нет лимита на выборку. 
-- Поэтому необходимо задавать однозначные условия, чтобы вместо одной строки нечаянно не обновить половину таблицы. 
-- 12. Изменить количество на 10 и качество на 0 для всех апельсинов
update products
set quantity = 10, quality = 0
where title = 'Orange';

-- 13. Удалить все данные 
delete from products;

-- 14. Создать таблицу students с полями
-- 		name строка (не null)
-- 		lastname строка (не null)
-- 		avg_mark целое число (от 0 до 5)
-- 		gender строка(128) (или “M” или “F”)
create table students(
	name varchar(128) not null,
   	lastname varchar(128) not null,
    	avg_mark integer check(avg_mark between 0 and 5),
    	gender varchar(128) check(gender in ('M', 'F'))
    );

-- 15. Добавить поле id integer primary key auto_increment 
alter table students
add id integer primary key auto_increment;

-- 16. Поменять тип у gender на char(1)
alter table students
modify column gender char(1);

 
-- 17. Поменять тип у avg_mark на numeric(2, 1)
alter table students
modify column avg_mark numeric(2, 1);

-- 18. Переименовать поле name на firstname
alter table students
change name firstname varchar(128);

-- 19. Заполнить таблицу
insert into students (firstname, lastname, avg_mark, gender)
	values('Олег', 'Петров', 4.3, 'M'),
	 ('Семен','Степанов', 3.1,'M'),
                ('Ольга','Семенова', 4.7, 'F'),
                ('Игорь','Романов', 3.1, 'M'),
                ('Ирина','Иванова', 2.2, 'F');


-- 20. Найти учеников, у которых оценка больше 4
select * from students
where avg_mark > 4;

-- 21. Найти учеников, у которых оценка не входит в диапазон от 3 до 4
select * from students
where avg_mark not between 3 and 4;

-- 22. Найти учеников, у которых имя начинается на И
select * from students
where firstname like 'И%';

 
-- 23. Найти учеников, у которых оценка 2.2 или 3.1 или 4.7
select * from students
where avg_mark in (2.2, 3.1, 4.7);

-- 24. Увеличить всем учащимся оценку в 0.5 раза
update students
set avg_mark = avg_mark * 0.5;

-- 25. Поменять у Олега Петрова фамилию на Сидоров
update students
set lastname = 'Сидоров'
where firstname = 'Олег'and lastname = 'Петров';


-- 26. Создать таблицу employees;
--  	employee_id целое число первичный ключ автоинкремент;
--  	fname строка не null,
--  	last_name строка не null,
--  	email строка не null,
--  	phone строка не null
create table employees(
            employee_id integer primary key auto_increment,
            fname varchar(128) not null,
            last_name varchar(128) not null,
            email varchar(128) not null,
            phone varchar(128) not null
            );
            
 
-- 27. Ой, забыли про зарплату)) Добавить поле salary numeric(9, 2),
alter table employees
add salary numeric(9, 2);

-- 28. Ойййй, нет, зарплата должна быть целым числом. Изменить тип salary на integer 
alter table employees
modify column salary integer;

-- 29. Переименовать поле fname на first_name
alter table employees
change fname first_name varchar(128);

--  30. Удалить поле phone
alter table employees
drop column phone;

-- 31. Добавить поле department строка не null 
alter table employees
add department varchar(128) not null;

-- 30. Заполнить таблицу  
insert into employees(first_name, last_name, email, salary, department) values("Steven", "King",	"SKING", 24000, "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
