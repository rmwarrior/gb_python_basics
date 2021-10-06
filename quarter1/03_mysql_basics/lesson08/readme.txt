use vk;
-- 1. Пусть задан некоторый пользователь.
-- Из всех пользователей соц. сети найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений).

-- Пусть user_id = 15, тогда:
select count(m.id) cnt, u.id -- найдем количество сообщений...
  from users u
  join messages m on m.to_user_id = u.id -- ...присланных пользователю...
 where u.id = 15 -- ...с user_id = 15
 group by u.id
 order by count(m.id) desc -- отсортируем по убыванию
 limit 1; -- выберем одну строку


-- 2. Подсчитать общее количество лайков, которые получили пользователи младше 10 лет.
select count(l.id) like_count
  from likes l
  join vk.profiles p on p.user_id = l.liked_user_id
 where p.birthday < ADDDATE(now(), interval -10 year);


-- 3. Определить кто больше поставил лайков (всего): мужчины или женщины?
select count(l.id) like_count, p.gender -- просуммируем и сгруппируем по полу
  from likes l
  join profiles p on l.user_id = p.user_id
 group by gender
 order by count(l.id) desc
 limit 1;