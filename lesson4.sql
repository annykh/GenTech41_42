-- 1.	Создать базу данных lesson4
create database lesson4;

-- 2.	Удалить ее
drop database lesson4;

-- 3.	Использовать базу данных sakila
use sakila;

-- 4.	Посмотреть какие есть таблицы в ней
show tables;

-- 5.	Из таблицы address вывести столбцы address, district, city_id, phone и postal_code
select address, district, city_id, phone, postal_code
from address;

-- 6.	Вывести те адреса, у которых district либо QLD, либо Alberta
select * from address
where district in ('QLD', 'Alberta');

-- 7.	Вывести те адреса, у которых city_id меньше либо равно 300, или больше либо равно 560
select * from address
where (city_id <= 300 or city_id >= 560);

-- 8.	Вывести те адреса, у которых postal_code пустое значение
select * from address
where postal_code = '';

-- 9.	Вывести те адреса, у которых phone начинается с 8 и заканчивается на 1
select * from address
where phone like '8%1';

-- 10.	Из таблицы film вывести столбцы title, description и special_features
select title, description, special_features
from film;
 
-- 11.	Вывести те фильмы, названия которых начинаются на буквы A, B, E
select * from film
where (title like 'A%' or title like 'B%' or title like 'E%');

-- 12.	Вывести те фильмы, в описании которых есть слово girl.
select * from film
where description like '%girl%';

-- 13.	Вывести те фильмы, в описании которых нет слов unbelieavable, но есть слово drama, и в special_features есть trailers.
select * from film
where description not like '%unbelieavable%' and description like '%drama%' and special_features like '%trailers%';

-- 14.	Из таблицы customer вывести столбцы first_name, last_name, address_id и active
select first_name, last_name, address_id, active 
from customer;

-- 15.	Вывести тех покупателей, у которых active 0
select * from customer
where active = 0;

-- 16.	Вывести тех покупателей, у которых address_id не находится в интервале [10, 15]
select * from customer
where address_id not between 0 and 15;

-- 17.	Вывести тех покупателей, у которых имя начинается с букв An, а фамилия заканчивается на букву L.
select * from customer
where first_name like 'an%' and last_name like '%l';

-- 18.	Из таблицы country найти и вывести id Германии.
select country_id from country
where country = 'germany';

-- 19.	Из таблицы city найти все города Германии и вывести их.
select * from city
where country_id = 38;

-- 20.	Из таблицы city вывести все города с country_id 3, 5, 13, 46 и 107.
select * from city
where country_id in (3, 5, 13, 46, 107);

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