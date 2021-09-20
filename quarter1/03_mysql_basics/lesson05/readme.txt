
-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными.
--    Заполните их текущими датой и временем.

-- добавляем столбцы
alter table users add created_at datetime null, add updated_at datetime null;

-- заполняем
update users u set u.created_at = NOW();
update users u set u.updated_at = NOW();



-- 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них
--    долгое время помещались значения в формате 20.10.2017 8:10.
--    Необходимо преобразовать поля к типу DATETIME, сохранив введённые ранее значения.

-- добавляем столбец и заполняем символьным форматом
alter table users
    add created_at_char varchar(20) null;
update users u set u.created_at_char = '20.10.2017 8:10';

-- Прямая замена выдает ошибку о неверном формате
-- Error: Incorrect datetime value
-- alter table users MODIFY created_at_char DATETIME;

-- Выполним в три этапа.
-- !!! На продакшене я бы так не рискнул, потому что таблица может быть залочена, и последствия могут быть печальными.
-- !!! То пользователи отвалятся и зайти не смогут, то база упадёт.
-- !!! Только тысячу раз проверив.

-- 1. добавляем столбцы
ALTER TABLE users ADD created_at_dt DATETIME, add updated_at_dt DATETIME;

-- 2. refresh values
UPDATE users
SET created_at_dt = STR_TO_DATE(created_at_char, '%d.%m.%Y %h:%i'),
    updated_at_dt = STR_TO_DATE(created_at_char, '%d.%m.%Y %h:%i');

-- 3. drop old columns and rename new
ALTER TABLE users
    DROP created_at, DROP updated_at,
    RENAME COLUMN created_at_dt TO created_at, RENAME COLUMN updated_at_dt TO updated_at;




-- 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры:
--   0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом,
--    чтобы они выводились в порядке увеличения значения value.
--    Однако нулевые запасы должны выводиться в конце, после всех записей.

-- Можно было бы воспользоваться UNION-оператором, сначала запрос ненулевых, затем нулевых.
-- Для сортировки вместо 0 использовать значение, заведомо большее, чем возможно value в реальности.
-- Воспользуемся хитростью - оператором побитовой инверсии. Для нуля, в нашем случае, он вернёт максимальное число.

select a.* from storehouses_products a order by if(a.value = 0, ~0, a.value);




-- 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае.
-- Месяцы заданы в виде списка английских названий (may, august)

select a.* from users a where lower(a.lastname) REGEXP 'may|august';




-- 5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса.
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

select a.* from users a where id IN (5, 1, 2)
order by (case when id = 5 then 1 when id = 1 then 2 else 3 end);





-- 1. Подсчитайте средний возраст пользователей в таблице users.

select avg(DATEDIFF(NOW(), a.birthday_at)/365.25) avg_age from users a;




-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

-- Поскольку подзапросы, операторы WITH, оконные функции и прочие радости мы не проходили, а так же в силу
-- ограниченности функций по сравнению с Oracle, будем городить и костылить.

-- Сначала вычленим день (DAYOFMONTH(a.birthday_at)) и месяц (MONTH(a.birthday_at)) из дня рождения в таблице
-- Год возьмем текущий: YEAR(NOW()).

-- Вычислим день рождения в текущем году, сначала возьмем первый день: MAKEDATE(YEAR(NOW()), 1), получим 2021-01-01.
-- Затем прибавим месяцы и дни как INTERVAL:
-- DATE_ADD( DATE_ADD( MAKEDATE(YEAR(NOW()), 1), INTERVAL (MONTH(a.birthday_at))-1 MONTH),
--   INTERVAL (DAYOFMONTH(a.birthday_at))-1 DAY)
-- Минус один для месяца и дня нужны так как мы прибавляем к Первому числу Первого месяца. И если мы прибавим
-- Первое число Второго месяца, то без "минус 1" мы получим 2021-03-02.

-- Определим день недели: DAYOFWEEK()

-- Выберем дни недели для таблицы users, посчитаем их количество и сгруппируем по дням недели:
select DAYOFWEEK(DATE_ADD(
         DATE_ADD(
            MAKEDATE(YEAR(NOW()), 1),
            INTERVAL (MONTH(a.birthday_at))-1 MONTH),
         INTERVAL (DAYOFMONTH(a.birthday_at))-1 DAY)) DayOfWeek,
       count(DAYOFWEEK(DATE_ADD(
         DATE_ADD(
            MAKEDATE(YEAR(NOW()), 1),
            INTERVAL (MONTH(a.birthday_at))-1 MONTH),
         INTERVAL (DAYOFMONTH(a.birthday_at))-1 DAY))) times
from users a
group by DAYOFWEEK(DATE_ADD(
         DATE_ADD(
            MAKEDATE(YEAR(NOW()), 1),
            INTERVAL (MONTH(a.birthday_at))-1 MONTH),
         INTERVAL (DAYOFMONTH(a.birthday_at))-1 DAY));




-- 3. (по желанию) Подсчитайте произведение чисел в столбце таблицы. 1, 2, 3, 4, 5

-- Призвав Интернет в помощь, нашел вариант с логарифмами, но он имеет целый ряд ограничений (числа должны быть > 0).
-- http://www.sql-tutorial.ru/ru/book_product_of_column_values.html
-- Для нашего случая вполне применим с некоторыми натяжками - значение получается не ровным

-- Воспользуемся следующим свойством логарифмов: логарифм произведения равен сумме логарифмов
-- ln(2*3*4*5) = ln(2) + ln(3) + ln(4) + ln(5)
-- Если применить обратную к натуральному логарифму (Ln) функцию экспоненты (exp), то получим
-- exp(ln(2*3*4*5)) = 2*3*4*5 = exp(ln(2) + ln(3) + ln(4) + ln(5))

select round(exp(SUM(log(a.value)))) summa from
    (select 1 value
    union all
    select 2 value
    union all
    select 3 value
    union all
    select 4 value
    union all
    select 5 value) a;


