use gb_shop;

-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

-- insert into orders (user_id) SELECT id from users where id <> 3;
-- insert into orders_products (order_id, product_id, total)  SELECT id, id, 1 from orders;

select distinct u.id, u.name
from users u
join orders o on o.user_id = u.id;



-- 2. Выведите список товаров products и разделов catalogs, который соответствует товару.

select *
from products p
join catalogs c on c.id = p.catalog_id;



-- 3.	(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name).
-- Поля from, to и label содержат английские названия городов, поле name — русское.
-- Выведите список рейсов flights с русскими названиями городов.

select flights.id, city_from.name, city_to.name
from flights
left join cities city_from on city_from.label = flights.from
left join cities city_to   on city_to.label=flights.to;

/*
-- можно было создать реальные таблицы, но чтобы не высылать дамп - заменил на запросы
-- получилось громоздко
-- выборки (select cities.label, cities.name from cities) сделал для наглядности, что можно сделать алиасы для таблиц

select flights.id, city_from.name, city_to.name
from
    (select 1 id, 'Moscow' `from`, 'Omsk' `to` -- начало таблицы flights
    union all
    select 2 id, 'Novgorod' `from`, 'Kazan' `to`
    union all
    select 3 id, 'Irkutsk' `from`, 'Moscow' `to`
    union all
    select 4 id, 'Omsk' `from`, 'Irkutsk' `to`
    union all
    select 5 id, 'Moscow' `from`, 'Kazan' `to`) flights -- конец таблицы flights
left join
    (select cities.label, cities.name from
        (select 'Moscow' `label`, 'Москва' `name` -- начало таблицы cities
        union all
        select 'Novgorod' `label`, 'Новгород' `name`
        union all
        select 'Irkutsk' `label`, 'Иркутск' `name`
        union all
        select 'Omsk' `label`, 'Омск' `name`
        union all
        select 'Kazan' `from`, 'Казань' `to`) cities -- конец таблицы cities
    ) city_from on city_from.label=flights.from
left join
    (select cities.label, cities.name from
        (select 'Moscow' `label`, 'Москва' `name` -- начало таблицы cities
        union all
        select 'Novgorod' `label`, 'Новгород' `name`
        union all
        select 'Irkutsk' `label`, 'Иркутск' `name`
        union all
        select 'Omsk' `label`, 'Омск' `name`
        union all
        select 'Kazan' `from`, 'Казань' `to`) cities -- конец таблицы cities
    ) city_to on city_to.label=flights.to;
*/