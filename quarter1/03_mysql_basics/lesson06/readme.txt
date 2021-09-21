use vk;
-- 1. Проанализировать запросы, которые выполнялись на занятии, определить возможные корректировки и/или улучшения
-- (JOIN пока не применять).

-- вместо константы 2 в подзапросах:
select u.firstname, u.lastname,
       (select p.hometown from profiles p where p.user_id = 2) ht,
        (select m.filename from media m where m.id =
                (select p1.photo_id from profiles p1 where p1.user_id = 2)) fn
from users u
where u.id = 2;

-- укажем ссылку на внешний идентификатор пользователя u.id = 2:
select u.firstname, u.lastname,
       (select p.hometown from profiles p where p.user_id = u.id) ht,
       (select m.filename from media m where m.id =
                (select p1.photo_id from profiles p1 where p1.user_id = u.id)) fn
from users u
where u.id = 2;


-- 2. Пусть задан некоторый пользователь.
-- Из всех друзей этого пользователя найдите человека, который больше всех общался с нашим пользователем.

-- Не стал усложнять проверками друг/не друг. Пусть user_id = 15, тогда:
select i.cnt, i.user_id from (
    -- найдем количество сообщений присланных пользователю с user_id = 15
    select count(*) cnt, m.from_user_id user_id from messages m
    where m.to_user_id = 15
    group by m.from_user_id) i
order by i.cnt desc -- отсортируем по убыванию
limit 1; -- выберем одну строку


-- 3. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
select count(*) like_count
from likes l
where l.liked_user_id in
    (select youngest.user_id from
        (select p.user_id from profiles p order by p.birthday desc limit 10) youngest -- выберем 10 самых молодых
    );-- обёртка из-за ошибки doesn't yet support LIMIT... subquery


-- 4. Определить кто больше поставил лайков (всего) - мужчины или женщины?
select sum(a.likes) like_count, a.gender -- просуммируем и сгруппируем по полу
from ( -- вытащим пол и соберем количество лайков по каждому пользователю
    select p.gender, (select count(*) from likes l where l.user_id = p.user_id) likes
    from profiles p) a
group by gender
order by sum(a.likes) desc -- отсортируем по убыванию и возьмем первую строку
limit 1;


-- 5. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

-- Активность можно оценивать по разному.
-- Пусть будет в таком порядке: кол-во медиа, кол-во сообщений, кол-во лайков.
select u.lastname, u.firstname,
       (select count(*) from media      m where m.user_id = u.id) media_cnt,
       (select count(*) from messages msg where msg.from_user_id = u.id) msg_cnt,
       (select count(*) from likes      l where l.user_id = u.id) like_cnt
from users u
-- order by media_cnt desc, msg_cnt desc, like_cnt desc -- 10 самых активных
order by media_cnt, msg_cnt, like_cnt -- 10 самых пассивных
limit 10;
