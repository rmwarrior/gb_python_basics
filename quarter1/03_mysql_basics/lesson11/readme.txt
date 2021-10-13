# Практическое задание по теме “Оптимизация запросов”

# 1. Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и products
# в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор первичного ключа и
# содержимое поля name.
use gb_sample;

create table logs(
    created_at datetime,
    table_name varchar(255),
    id_value bigint,
    name_value  varchar(255)
)
comment = 'logs archive table'
engine = archive;

delimiter |

create trigger tr_users_after_update after update on users for each row
begin
    insert into logs(created_at, table_name, id_value, name_value)
    values (now(), 'USERS', new.id, new.name);
end;

delimiter ;

delimiter |

create trigger tr_catalogs_after_update after update on catalogs for each row
begin
    insert into logs(created_at, table_name, id_value, name_value)
    values (now(), 'CATALOGS', new.id, new.name);
end;

delimiter ;

delimiter |

create trigger tr_products_after_update after update on products for each row
begin
    insert into logs(created_at, table_name, id_value, name_value)
    values (now(), 'PRODUCTS', new.id, new.name);
end;

delimiter ;

# 2. (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.



# Практическое задание по теме “NoSQL”

# 1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.

# 1.1 Если бы нужно было хранить количество, где ip-адрес это ключ, то можно так:
127.0.0.1:6379> incr '192.168.0.1' # увеличим значение ключа, если его нет - он создастся
(integer) 1
127.0.0.1:6379> get '192.168.0.1' # получим значение
"1"

# 1.2 Но нам нужна коллекция, тогда так:
127.0.0.1:6379> keys * # проверим, что список ключей пуст
(empty array)
127.0.0.1:6379> hset ip_visits 192.168.0.1 1 # ключ хеша=ip_visits; ключ пары=192.168.0.1; значение=1
(integer) 1
127.0.0.1:6379> hget ip_visits 192.168.0.1 # проверим значение по ключу хеша=ip_visits и ключу пары=192.168.0.1
"1"
127.0.0.1:6379>


# 2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот,
# поиск электронного адреса пользователя по его имени.

# удобно создать две хэш-коллекции: почта-имя и имя-почта
127.0.0.1:6379> hset name_mail name1 name1@yandex.ru # ключ хеша=name_mail; ключ пары=name1; значение=name1@yandex.ru
(integer) 1
127.0.0.1:6379> hget name_mail name1
"name1@yandex.ru"

127.0.0.1:6379> hset mail_name name1@yandex.ru name1 # ключ хеша=mail_name; ключ пары=name1@yandex.ru; значение=name1
(integer) 1
127.0.0.1:6379> hget mail_name name1@yandex.ru
"name1"
127.0.0.1:6379>


# 3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.
shop.catalogs.insertMany( [
    { _id: 1, name: "Видеокарты"},
    { _id: 2, name: "Материнские платы"},
    { _id: 3, name: "Процессоры"}
  ] );

shop.products.insertOne({
    name: "Intel Core i5-9300H",
    description: "Процессор для ноутбуков, основанных на платформе Intel.",
    price: 18005.00,
    catalog: 3
})
