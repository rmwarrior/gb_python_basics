DROP DATABASE IF EXISTS gb_curs_dnk;
CREATE DATABASE gb_curs_dnk;
USE gb_curs_dnk;

# ALTER TABLE core_profiles DROP FOREIGN KEY profile_id;
# ALTER TABLE core_users DROP FOREIGN KEY user_id;
# ALTER TABLE core_projects DROP FOREIGN KEY project_id;

####################################
DROP TABLE IF EXISTS core_system;

CREATE TABLE core_system (
  user_id    bigint, -- Суперпользователь
  project_id bigint, -- Основной проект (родительский для всех остальных, по умолчанию)
  profile_id bigint) COMMENT 'Стартовая конфигурация системы';

####################################
DROP TABLE IF EXISTS core_projects;

CREATE TABLE core_projects (
  id               bigint NOT NULL AUTO_INCREMENT,
  name             varchar(255), -- название проекта
  parent_id        bigint, -- ссылка на родительский проект
  type_id          bigint NOT NULL, -- тип проекта (1. Бизнес; 2. IT-область)
  status_id        bigint NOT NULL, -- статус (1. Новый; 2. В работе; 3. Тестирование (для IT); 4. Приостановлен;
                                    -- 5. Отменен; 6. Выполнен; 7. Закрыт...)
  priority_id      bigint NOT NULL, -- приоритет (1. Желательно; 2. Нормальный; 3. Важно; 4. Критично)
  team_id          bigint NOT NULL, -- группа пользователей (со своими ролями: автор, назначено, наблюдатель)
  author_id        bigint NOT NULL, -- автор
  class_id         bigint NOT NULL, -- класс проекта (почти "Колесо жизни" в LeaderTask), и так как проект должен быть
                                    -- ограничен по времени, то мы можем классифицировать по сферам и по годам
                                    -- (кварталам, полугодиям...):
                                    -- 1. Семья - Здоровье 2022       -- 2. Семья - Отношения 2022
                                    -- 3. Семья - Призвание 2022      -- 4. Семья - Духовность 2022
                                    -- 5. Семья - Яркость жизни 2022  -- 6. Семья - Имущество 2022
                                    -- финансы и IT-часть являются частью каждого класса, поэтому не вынесены в
                                    -- отдельный проект (отделены как неотъемлемая часть - "категория")
  category_id      bigint NOT NULL, -- 1. Финансы; 2. Информация
  start_date       date, -- Дата начала
  due_date         date, -- Дата планового завершения
  completion_date  date, -- Дата фактического завершения
  fixed_version_id bigint, -- Веха проекта (1. Инициализация; 2. Планирование; 3. Реализация; 4. Завершение)
  git_repo         varchar(255), -- git-репозиторий
  notes            varchar(255), -- Комментарии
  subject          varchar(255), -- Тема
  description      varchar(255), -- Описание
  created_at       date, 
  updated_at       date, 
  created_by       bigint,
  updated_by       bigint,
  valid_from       date,
  valid_to         date, 
  PRIMARY KEY (id)
) COMMENT 'Проекты системы';

####################################
DROP TABLE IF EXISTS core_users;

CREATE TABLE core_users (
  id            bigint NOT NULL AUTO_INCREMENT,
  first_name    varchar(255), -- имя (название юр. лица - дочки)
  middle_name   varchar(255), -- отчество
  last_name     varchar(255), -- фамилия (название родительской компании)
  type_id       bigint, -- 1. Взрослый; 2. Подросток; 3. Ребенок; 4. Младенец; 5. Пожилой; 6. Юр.лицо, ИП…
  status_id     bigint, -- 1. Новый; 2. Активный; 3. Неактивный; 4. Исключен
  login         varchar(255), -- Логин
  password_hash varchar(100), -- 123456 => 24l5456345t
  gender        varchar(100),
  birth_date    date,
  profile_id    bigint, -- Профиль
  created_at    date,
  updated_at    date,
  created_by    bigint,
  updated_by    bigint,
  valid_from    date,
  valid_to      date,
  PRIMARY KEY (id)
) COMMENT 'Пользователи системы, контрагенты';

####################################
DROP TABLE IF EXISTS core_profiles;

CREATE TABLE core_profiles (
  id         bigint NOT NULL AUTO_INCREMENT, 
  type_id    bigint, -- 1. Физ. лицо; 2. Юр.лицо, ИП…
  status_id  bigint, -- 1. Новый; 2. Неполный; 3. Полный; 4. Актуализировать
  details_id bigint, -- ссылка на детали профиля
  created_at date, 
  updated_at date, 
  created_by bigint,
  updated_by bigint,
  valid_from date,
  valid_to   date, 
  PRIMARY KEY (id)
) COMMENT 'Профили пользователей системы';

####################################
DROP TABLE IF EXISTS core_details;

CREATE TABLE core_details (
  id         bigint NOT NULL AUTO_INCREMENT, 
  profile_id bigint NOT NULL, -- ссылка на профиль
  dtl_index  bigint, -- индекс для сортировки, первая подробность, вторая...
  name       varchar(255), -- название подробностей, для именованного доступа ("адрес", "реквизиты"...)
  info       varchar(255), -- детальная информация, адрес, реквизиты...
  media_id   bigint, -- ссылка на файл (фото, документ)
  look_id    bigint, -- возможность задать внешний вид (фон, шрифт..., если не rtf-формат)
  created_at date, 
  updated_at date, 
  created_by bigint,
  updated_by bigint,
  valid_from date,
  valid_to   date, 
  PRIMARY KEY (id)
) COMMENT 'Подробности профиля пользователей системы';

####################################
DROP TABLE IF EXISTS core_team;

CREATE TABLE core_team (
  id           bigint NOT NULL AUTO_INCREMENT, 
  name         varchar(255), -- название команды
  parent_id    bigint, -- ссылка на родительскую группу
  type_id      bigint, -- 1. Частная; 2. Коммерческая (не знаю зачем, но пока так. может быть изменено)
  status_id    bigint, -- 1. Новый; 2. Активный; 3. Неактивный; 4. Исключен
  profile_id   bigint, -- ссылка на профиль
  user_id      bigint, -- ссылка на пользователя
  user_role_id bigint, -- ссылка на роль пользователя в команде: 1. Автор; 2. Исполнитель; 3. Наблюдатель; 4. Админ-тор
  created_at   date, 
  updated_at   date, 
  created_by   bigint,
  updated_by   bigint,
  valid_from   date,
  valid_to     date, 
  PRIMARY KEY (id)
) COMMENT 'Команды (группы) пользователей системы';

####################################
DROP TABLE IF EXISTS core_issue;

CREATE TABLE core_issue (
  id               bigint NOT NULL AUTO_INCREMENT, 
  name             varchar(255), -- название задачи
  parent_id        bigint, -- ссылка на родительскую задачу
  project_id       bigint, -- ссылка на проект
  type_id          bigint, -- тип (1. Бизнес-область; 2. IT-область)
  category_id      bigint, -- 1. Задача; 2. Ошибка; 3. Установка на ПРОД
  status_id        bigint, -- зависит от категории (
                           -- Задача: 1. Новая; 2. Отменено; 3.Назначено; 4. Ожидание; 5. В разработке; 6. Выполнено)
                           -- Ошибка: 1. Новая; 2. Отменено; 3. Назначено; 4. Ожидание; 5. В разработке; 6. Выполнено)
                           -- Установка на ПРОД: 1. Новая; 2. Отменено; 3. Установке на ТЕСТ; 4. Тестирование;
                           --   5. Согласование установки; 6. Установка на ПРОД; 7. Выполнено; 8. Завершено)
  priority_id      bigint, -- приоритет (1. Низкий; 2. Нормальный; 3. Высокий; 4. Срочно)
  author_id        bigint, -- ссылка на автора
  assigned_to      bigint, -- ссылка на исполнителя
  team_name        varchar(255), -- ссылка на команду (если автора и исполнителя недостаточно)
  start_date       date, -- дата начала
  due_date         date, -- дата планового завершения
  completion_date  date, -- дата фактического завершения
  email_to         varchar(255), -- адрес для уведомлений
  email_cc         varchar(255), -- адрес для копии уведомления
  spent_time       numeric(19, 4), -- затрачено времени, ч. (сумма из журнала)
  done_ratio       bigint, -- процент выполнения (0-100%)
  fixed_version_id bigint, -- веха проекта (1. Инициализация; 2. Планирование; 3. Реализация; 4. Завершение)
  notes            varchar(255), -- комментарии
  subject          varchar(255), -- тема
  description      varchar(255), -- описание
  created_at       date, 
  updated_at       date, 
  created_by       bigint,
  updated_by       bigint,
  valid_from       date,
  valid_to         date, 
  PRIMARY KEY (id)
) COMMENT 'Задачи проекта';

####################################
DROP TABLE IF EXISTS core_list_info;

CREATE TABLE core_list_info (
  id             bigint NOT NULL AUTO_INCREMENT, 
  scope_id       bigint, -- область действия: система, проект, задача...
  object_type_id bigint, -- тип объекта: проект, задача, тэг, группа проектов, группа задач
  list_name      varchar(255), -- название списка
  value_type_id  bigint, -- тип значения: текст, медиа, тэг, ссылка на другой список...
  object_id      bigint, -- объект: конкретный проект или задача
  list_index     bigint, -- индекс в списке
  list_code      varchar(255), -- код в списке
  value          varchar(255), -- значение
  created_at     date, 
  updated_at     date, 
  created_by     bigint,
  updated_by     bigint,
  valid_from     date,
  valid_to       date, 
  PRIMARY KEY (id)
) COMMENT 'Списки системных настроек, сгруппированных и упорядоченных (недоступно для изменения)';

####################################
DROP TABLE IF EXISTS custom_list_info;

CREATE TABLE custom_list_info (
  id             bigint NOT NULL AUTO_INCREMENT, 
  scope_id       bigint, -- область действия: система, проект, задача...
  object_type_id bigint, -- тип объекта: проект, задача, тэг, группа проектов, группа задач
  list_name      varchar(255), -- название списка
  value_type_id  bigint, -- тип значения: текст, медиа, тэг, ссылка на другой список...
  object_id      bigint, -- объект: конкретный проект или задача
  list_index     bigint, -- индекс в списке
  list_code      varchar(255), -- код в списке
  value          varchar(255), -- значение
  created_at     date, 
  updated_at     date, 
  created_by     bigint,
  updated_by     bigint,
  valid_from     date,
  valid_to       date, 
  PRIMARY KEY (id)
) COMMENT 'Списки системных настроек, сгруппированных и упорядоченных (недоступно для изменения)';

####################################
DROP TABLE IF EXISTS journal;

CREATE TABLE journal (
  id             bigint NOT NULL AUTO_INCREMENT, 
  object_type_id bigint, -- тип объекта: проект, задача, тэг, группа проектов, группа задач
  object_id      bigint, -- объект: конкретный проект или задача
  user_id        bigint, -- пользователь
  spent_time     numeric(19, 4), -- затрачено времени, ч.
  notes          varchar(255), -- комментарии
  created_at     date,
  PRIMARY KEY (id));

####################################
delimiter |

create trigger tr_issue_before_update before update on core_issue
     for each row
begin
  declare msg varchar(1000);
  declare l_spent_time numeric(19, 4);
  if old.name <> new.name then set msg = 'name=' + new.name; end if;
  if old.parent_id <> new.parent_id then set msg = msg + ' parent_id=' + old.parent_id; end if;
  if old.project_id <> new.project_id then set msg = msg + ' project_id=' + old.project_id; end if;
  if old.type_id <> new.type_id then set msg = msg + ' type_id=' + old.type_id; end if;
  if old.category_id <> new.category_id then set msg = msg + ' category_id=' + old.category_id; end if;
  if old.status_id <> new.status_id then set msg = msg + ' status_id=' + old.status_id; end if;
  if old.priority_id <> new.priority_id then set msg = msg + ' priority_id=' + old.priority_id; end if;
  if old.author_id <> new.author_id then set msg = msg + ' author_id=' + old.author_id; end if;
  if old.assigned_to <> new.assigned_to then set msg = msg + ' assigned_to=' + old.assigned_to; end if;
  if old.team_name <> new.team_name then set msg = msg + ' team_name=' + old.team_name; end if;
  if old.start_date <> new.start_date then set msg = msg + ' start_date=' + old.start_date; end if;
  if old.due_date <> new.due_date then set msg = msg + ' due_date=' + old.due_date; end if;
  if old.completion_date <> new.completion_date then set msg = msg + ' completion_date=' + old.completion_date; end if;
#   if old.email_to <> new.email_to then set msg = msg + ' email_to=' + old.email_to; end if;
#   if old.email_cc <> new.email_cc then set msg = msg + ' email_cc=' + old.email_cc; end if;
  if old.spent_time <> new.spent_time then
      set msg = msg + ' spent_time=' + old.spent_time;
      select sum(spent_time) into l_spent_time
        from journal
       where object_id = old.id;
      set l_spent_time = l_spent_time + old.spent_time;
  end if;
  if old.done_ratio <> new.done_ratio then set msg = msg + ' done_ratio=' + old.done_ratio; end if;
#   if old.fixed_version_id <> new.fixed_version_id then set msg = msg + ' fixed_version_id=' + old.fixed_version_id;
#   if old.notes <> new.notes then set msg = msg + ' notes=' + old.notes;
#   if old.subject <> new.subject then set msg = msg + ' subject=' + old.subject;
#   if old.description <> new.description then set msg = msg + ' description=' + old.description;

  insert into journal (object_type_id, object_id, user_id, spent_time, notes, created_at)
  values (0, old.id, new.updated_by, l_spent_time, msg, now());

end;

delimiter ;

####################################
# ALTER TABLE core_profiles ADD CONSTRAINT profile_id FOREIGN KEY () REFERENCES core_system ();
# ALTER TABLE core_users ADD CONSTRAINT user_id FOREIGN KEY () REFERENCES core_system ();
# ALTER TABLE core_projects ADD CONSTRAINT project_id FOREIGN KEY () REFERENCES core_system ();
