# Практическое задание по теме “Транзакции, переменные, представления”
# 1. В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
#    Переместите запись id = 1 из таблицы shop.users в таблицу sample.users.
#    Используйте транзакции.
use sample;

delimiter !

create procedure sample.sp_copy_user_1()
begin
    declare cnt int;

    start transaction;

    -- проапдейтим поля на "новые"
    update sample.users su,
           (select id, name, birthday_at, created_at, updated_at from shop.users) as u
       set su.name = u.name,
           su.birthday_at = u.birthday_at,
           su.created_at = u.created_at,
           su.updated_at = u.updated_at
     where u.id = 1 and su.id = u.id;

    -- проверим, проапдейтилось ли нормально
    -- подсчитаем количество строк, где все поля одинаковые в разных БД для id = 1
    select count(su.id) into cnt
      from sample.users su
      join shop.users u on u.id = su.id and u.name = su.name and u.birthday_at = su.birthday_at and
                              u.created_at = su.created_at and u.updated_at = su.updated_at
     where su.id = 1;

    -- если проапдейтилось, удалим и закоммитим
    if cnt > 0 then
        delete from shop.users where id = 1;

        commit;
    else -- иначе откатим изменения
        rollback;
    end if;
end;

delimiter ;

# call sp_copy_user_1();

# select *
#   from sample.users
#   left join shop.users on shop.users.id = sample.users.id

# 2. Создайте представление, которое выводит название name товарной позиции из таблицы products и соответствующее
#    название каталога name из таблицы catalogs.

create view sample.v_prod_name as
select p.name prod_name, c.name cat_name
  from products p
  left join catalogs c on p.catalog_id = c.id;

# select * from sample.v_prod_name;

# 3. (по желанию) Пусть имеется таблица с календарным полем created_at.
#    В ней размещены разряженые календарные записи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и
#    2018-08-17. Составьте запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1,
#    если дата присутствует в исходном таблице и 0, если она отсутствует.
# 4. (по желанию) Пусть имеется любая таблица с календарным полем created_at.
#    Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.


################################################################################
# Практическое задание по теме “Хранимые процедуры и функции, триггеры"

# 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток.
#    С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу
#    "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

delimiter !

create procedure sample.hello()
begin
    select hour(now()) into @now_hour;

    if @now_hour between 6 and 11 then
        select 'Доброе утро';
    else
        if @now_hour between 12 and 17 then
            select 'Добрый день';
        else
            if @now_hour between 18 and 23 then
                select 'Добрый вечер';
            else
                select 'Доброй ночи';
            end if;
        end if;
    end if;
end;

delimiter ;

# call sample.hello();



# 2. В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
#    Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают неопределенное значение
#    NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
#    При попытке присвоить полям NULL-значение необходимо отменить операцию.
delimiter |

create trigger tr_products_before_update before update on sample.products
     for each row
begin
    if (new.name is null) and (new.description is null) then
        set new := old; -- вызовет ошибку
    end if;
end;

delimiter ;



delimiter |

create trigger tr_products_before_insert before insert on sample.products
     for each row
begin
    if (new.name is null) and (new.description is null) then
        set new := null; -- вызовет ошибку
    end if;
end;

delimiter ;


# 3. (по желанию) Напишите хранимую функцию для вычисления произвольного числа Фибоначчи.
#    Числами Фибоначчи называется последовательность в которой число равно сумме двух предыдущих чисел.
#    Вызов функции FIBONACCI(10) должен возвращать число 55.
