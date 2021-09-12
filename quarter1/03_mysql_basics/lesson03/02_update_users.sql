-- select * from vk.users u order by u.firstname, u.lastname;

-- � ������ � �� sakila �������� e-mail ������:

-- SUSAN DAVIS ����������� ������, ������� ���������� ignore
update ignore vk.users u set email = concat(lower(u.firstname), '.', lower(u.lastname), '@sakila.db');

update ignore vk.users u set email = concat(lower(u.firstname), '.', lower(u.lastname), '@dca.it') where email is null;

update ignore vk.users u set phone =  substr(concat('79',
       ascii(substr(u.email,  4, 1)), ascii(substr(u.email,  5, 1)), ascii(substr(u.email,  6, 1)),
       ascii(substr(u.email,  7, 1)), ascii(substr(u.email,  8, 1)), ascii(substr(u.email,  9, 1)),
       ascii(substr(u.email, 10, 1)), ascii(substr(u.email, 11, 1)), ascii(substr(u.email, 12, 1))), 1, 11);

update ignore vk.users u set phone =  substr(concat('79',
       ascii(substr(u.email,  4, 1)), ascii(substr(u.email,  5, 1)), ascii(substr(u.email,  6, 1)),
       ascii(substr(u.email,  7, 1)), ascii(substr(u.email,  8, 1)), ascii(substr(u.email,  9, 1)),
       ascii(substr(u.email, 10, 1)), ascii(substr(u.email, 11, 1)), ascii(substr(u.email, 12, 1))), 4, 11)
 where length(phone) < 11;


-- ---------------------------------------------------------------------
-- ����� ������� ADAM GRANT � id=71
insert into vk.communities (name, admin_user_id) VALUES
	 ('�������� Official',71),
	 ('������ Official',71),
	 ('�������� Official',71),
	 ('����� Official',71),
	 ('������ Official',71),
	 ('���� Official',71),
	 ('������ �. Official',71);

	
-- ---------------------------------------------------------------------
-- �������� ���� �� ���� �����
insert into vk.users_communities 
select u.id, c.id from vk.users u, vk.communities c


-- ---------------------------------------------------------------------
insert ignore into vk.profiles
select u.id, 'F', DATE_ADD(sysdate(), INTERVAL -(18 + rand(24)) * 365 DAY), null, sysdate(), 'Moscow' from vk.users u


-- select * from vk.communities;
-- select * from vk.users_communities;
-- select * from vk.messages;
-- update vk.messages set to_user_id = id + 1;

-- ---------------------------------------------------------------------
-- ������� ���� liked_user_id � ������� vk.likes
ALTER TABLE vk.likes
ADD COLUMN liked_user_id BIGINT UNSIGNED NOT NULL;

ALTER TABLE vk.likes 
ADD CONSTRAINT liked_user_fk 
FOREIGN KEY (liked_user_id) REFERENCES vk.users(id);

-- ---------------------------------------------------------------------
-- �������� ������� �� ������
insert ignore into vk.friend_requests
select u.id, u.id + 30, 'approved', sysdate(), sysdate()
  from vk.users u
 where u.id between 0 and 30;

insert ignore into vk.friend_requests
select u.id, u.id + 30, 'requested', sysdate(), sysdate()
  from vk.users u
 where u.id between 31 and 60;

insert ignore into vk.friend_requests
select u.id, u.id + 30, 'declined', sysdate(), sysdate()
  from vk.users u
 where u.id between 61 and 90;


-- ---------------------------------------------------------------------
-- �������� ���� �����
insert ignore into vk.media_types (name,created_at,updated_at) values
	 ('Photo', sysdate(), sysdate()),
	 ('Video', sysdate(), sysdate()),
	 ('Audio', sysdate(), sysdate()),
	 ('Text', sysdate(), sysdate());


