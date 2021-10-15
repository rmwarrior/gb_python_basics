# delete from gb_curs_dnk.core_list_info;

####################################
insert into gb_curs_dnk.core_list_info(
            scope_id, object_type_id, list_name, value_type_id, object_id, list_index,
            list_code, value, created_at, updated_at, created_by, updated_by)
values -- системные типы (область действия: система, тип объекта: система)
       -- область действия
       (1, 1, 'SYS.SCOPE', 1, 0, 0, 'SYSTEM', 'Система', NOW(),  NOW(), 0, 0),
       (1, 1, 'SYS.SCOPE', 1, 0, 1, 'PROJECT', 'Проект', NOW(),  NOW(), 0, 0),
       (1, 1, 'SYS.SCOPE', 1, 0, 2, 'ISSUE', 'Задача', NOW(),  NOW(), 0, 0),
       -- тип объекта
       (1, 1, 'SYS.OBJECT_TYPE', 1, 0, 0, 'SYSTEM', 'Система', NOW(),  NOW(), 0, 0),
       (1, 1, 'SYS.OBJECT_TYPE', 1, 0, 1, 'PROJECT', 'Проект', NOW(),  NOW(), 0, 0),
       (1, 1, 'SYS.OBJECT_TYPE', 1, 0, 2, 'USER', 'Пользователь', NOW(),  NOW(), 0, 0),
       (1, 1, 'SYS.OBJECT_TYPE', 1, 0, 3, 'PROFILE', 'Профиль', NOW(),  NOW(), 0, 0),
       (1, 1, 'SYS.OBJECT_TYPE', 1, 0, 4, 'TEAM', 'Команда', NOW(),  NOW(), 0, 0),
       (1, 1, 'SYS.OBJECT_TYPE', 1, 0, 5, 'ISSUE', 'Задача', NOW(),  NOW(), 0, 0),
       -- тип значения
       (1, 1, 'SYS.VALUE_TYPE', 1, 0, 0, 'TEXT', 'Текст', NOW(),  NOW(), 0, 0),
       (1, 1, 'SYS.VALUE_TYPE', 1, 0, 1, 'MEDIA', 'Медиа', NOW(),  NOW(), 0, 0),
       (1, 1, 'SYS.VALUE_TYPE', 1, 0, 2, 'TAG', 'Тэг', NOW(),  NOW(), 0, 0),
       (1, 1, 'SYS.VALUE_TYPE', 1, 0, 3, 'LIST_REF', 'Ссылка на список', NOW(),  NOW(), 0, 0);


####################################
insert into gb_curs_dnk.core_list_info(
            scope_id, object_type_id, list_name, value_type_id, object_id, list_index,
            list_code, value, created_at, updated_at, created_by, updated_by)
values -- системные типы (область действия: система, тип объекта: проект)
       -- тип проекта
       (1, 2, 'SYS.PROJECT_TYPE', 1, 0, 0, 'BUSINESS', 'Бизнес', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_TYPE', 1, 0, 1, 'IT', 'IT-область', NOW(),  NOW(), 0, 0),
       -- статус проекта
       (1, 2, 'SYS.PROJECT_STATUS', 1, 0, 0, 'NEW', 'Новый', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_STATUS', 1, 0, 1, 'WIP', 'В работе', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_STATUS', 1, 0, 2, 'TEST', 'Тестирование', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_STATUS', 1, 0, 3, 'PAUSED', 'Приостановлен', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_STATUS', 1, 0, 4, 'CANCELLED', 'Отменен', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_STATUS', 1, 0, 5, 'COMPLETED', 'Выполнен', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_STATUS', 1, 0, 6, 'CLOSED', 'Закрыт', NOW(),  NOW(), 0, 0),
       -- приоритет проекта
       (1, 2, 'SYS.PROJECT_PRIORITY', 1, 0, 0, 'LOW', 'Низкий', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_PRIORITY', 1, 0, 1, 'NORMAL', 'Нормальный', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_PRIORITY', 1, 0, 2, 'HIGH', 'Высокий', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_PRIORITY', 1, 0, 3, 'CRITICAL', 'Критично', NOW(),  NOW(), 0, 0),
       -- класс проекта
       (1, 2, 'SYS.PROJECT_CLASS', 1, 0, 0, 'HEALTH', 'Здоровье', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_CLASS', 1, 0, 1, 'RELATIONS', 'Отношения', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_CLASS', 1, 0, 2, 'VOCATION', 'Призвание', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_CLASS', 1, 0, 3, 'SPIRITUALITY', 'Духовность', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_CLASS', 1, 0, 4, 'LIFE_QUALITY', 'Яркость жизни', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_CLASS', 1, 0, 5, 'INVENTORY', 'Имущество', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_CLASS', 1, 0, 6, 'FINANCE', 'Финансы', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_CLASS', 1, 0, 7, 'IT', 'Информация', NOW(),  NOW(), 0, 0),
       -- веха проекта
       (1, 2, 'SYS.PROJECT_FIXED_VERSION', 1, 0, 0, 'INITIALIZATION', 'Инициализация', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_FIXED_VERSION', 1, 0, 1, 'PLANNING', 'Планирование', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_FIXED_VERSION', 1, 0, 2, 'REALIZATION', 'Реализация', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_FIXED_VERSION', 1, 0, 3, 'FINISHING', 'Завершение', NOW(),  NOW(), 0, 0),
       -- категория проекта
       (1, 2, 'SYS.PROJECT_CATEGORY', 1, 0, 0, 'FINANCE', 'Финансы', NOW(),  NOW(), 0, 0),
       (1, 2, 'SYS.PROJECT_CATEGORY', 1, 0, 1, 'IT', 'Информация', NOW(),  NOW(), 0, 0);


####################################
insert into gb_curs_dnk.core_list_info(
            scope_id, object_type_id, list_name, value_type_id, object_id, list_index,
            list_code, value, created_at, updated_at, created_by, updated_by)
values -- системные типы (область действия: система, тип объекта: пользователь)
       -- тип пользователя
       (1, 3, 'SYS.USER_TYPE', 1, 0, 0, 'YOUNG', 'Подросток', NOW(),  NOW(), 0, 0),
       (1, 3, 'SYS.USER_TYPE', 1, 0, 1, 'ADULT', 'Взрослый', NOW(),  NOW(), 0, 0),
       (1, 3, 'SYS.USER_TYPE', 1, 0, 2, 'AGED', 'Пожилой', NOW(),  NOW(), 0, 0),
       (1, 3, 'SYS.USER_TYPE', 1, 0, 3, 'LEGAL_ENTITY', 'Юр.лицо, ИП', NOW(),  NOW(), 0, 0),
       -- статус пользователя
       (1, 3, 'SYS.USER_STATUS', 1, 0, 0, 'NEW', 'Новый', NOW(),  NOW(), 0, 0),
       (1, 3, 'SYS.USER_STATUS', 1, 0, 1, 'ACTIVE', 'Активный', NOW(),  NOW(), 0, 0),
       (1, 3, 'SYS.USER_STATUS', 1, 0, 2, 'INACTIVE', 'Неактивный', NOW(),  NOW(), 0, 0),
       (1, 3, 'SYS.USER_STATUS', 1, 0, 3, 'EXCLUDED', 'Исключен', NOW(),  NOW(), 0, 0);


####################################
insert into gb_curs_dnk.core_list_info(
            scope_id, object_type_id, list_name, value_type_id, object_id, list_index,
            list_code, value, created_at, updated_at, created_by, updated_by)
values -- системные типы (область действия: система, тип объекта: профиль)
       -- тип профиля
       (1, 4, 'SYS.PROFILE_TYPE', 1, 0, 0, 'PHYSICAL_PERSON', 'Физ. лицо', NOW(),  NOW(), 0, 0),
       (1, 4, 'SYS.PROFILE_TYPE', 1, 0, 1, 'LEGAL_ENTITY', 'Юр.лицо, ИП', NOW(),  NOW(), 0, 0),
       -- статус профиля
       (1, 4, 'SYS.PROFILE_STATUS', 1, 0, 0, 'NEW', 'Новый', NOW(),  NOW(), 0, 0),
       (1, 4, 'SYS.PROFILE_STATUS', 1, 0, 1, 'NOT_FILLED', 'Неполный', NOW(),  NOW(), 0, 0),
       (1, 4, 'SYS.PROFILE_STATUS', 1, 0, 2, 'FILLED', 'Полный', NOW(),  NOW(), 0, 0),
       (1, 4, 'SYS.PROFILE_STATUS', 1, 0, 3, 'ACTUALIZE', 'Актуализировать', NOW(),  NOW(), 0, 0);


####################################
insert into gb_curs_dnk.core_list_info(
            scope_id, object_type_id, list_name, value_type_id, object_id, list_index,
            list_code, value, created_at, updated_at, created_by, updated_by)
values -- системные типы (область действия: система, тип объекта: команда)
       -- тип команды
       (1, 5, 'SYS.TEAM_TYPE', 1, 0, 0, 'PRIVATE', 'Частная', NOW(),  NOW(), 0, 0),
       (1, 5, 'SYS.TEAM_TYPE', 1, 0, 1, 'COMMERCIAL', 'Коммерческая', NOW(),  NOW(), 0, 0),
       -- статус команды
       (1, 5, 'SYS.TEAM_STATUS', 1, 0, 0, 'NEW', 'Новая', NOW(),  NOW(), 0, 0),
       (1, 5, 'SYS.TEAM_STATUS', 1, 0, 1, 'ACTIVE', 'Активная', NOW(),  NOW(), 0, 0),
       (1, 5, 'SYS.TEAM_STATUS', 1, 0, 2, 'INACTIVE', 'Неактивная', NOW(),  NOW(), 0, 0),
       (1, 5, 'SYS.TEAM_STATUS', 1, 0, 3, 'EXCLUDED', 'Исключена', NOW(),  NOW(), 0, 0);


####################################
insert into gb_curs_dnk.core_list_info(
            scope_id, object_type_id, list_name, value_type_id, object_id, list_index,
            list_code, value, created_at, updated_at, created_by, updated_by)
values -- системные типы (область действия: система, тип объекта: задача)
       -- тип задачи
       (1, 6, 'SYS.ISSUE_TYPE', 1, 0, 0, 'BUSINESS', 'Бизнес', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_TYPE', 1, 0, 1, 'IT', 'IT-область', NOW(),  NOW(), 0, 0),
       -- категория задачи
       (1, 6, 'SYS.ISSUE_CATEGORY', 1, 0, 0, 'TASK', 'Задача', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_CATEGORY', 1, 0, 1, 'ERROR', 'Ошибка', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_CATEGORY', 1, 0, 2, 'TO_PROD', 'Установка на ПРОД', NOW(),  NOW(), 0, 0),
       -- статус задачи категории "Задача"
       (1, 6, 'SYS.ISSUE_TASK_STATUS', 1, 0, 0, 'NEW', 'Новая', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_TASK_STATUS', 1, 0, 1, 'CANCELLED', 'Отменено', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_TASK_STATUS', 1, 0, 2, 'ASSIGNED', 'Назначено', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_TASK_STATUS', 1, 0, 3, 'PAUSED', 'Ожидание', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_TASK_STATUS', 1, 0, 4, 'WIP', 'В разработке', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_TASK_STATUS', 1, 0, 5, 'COMPLETED', 'Выполнено', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_TASK_STATUS', 1, 0, 6, 'CLOSED', 'Завершено', NOW(),  NOW(), 0, 0),
       -- статус задачи категории "Ошибка"
       (1, 6, 'SYS.ISSUE_ERROR_STATUS', 1, 0, 0, 'NEW', 'Новая', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_ERROR_STATUS', 1, 0, 1, 'CANCELLED', 'Отменено', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_ERROR_STATUS', 1, 0, 2, 'ASSIGNED', 'Назначено', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_ERROR_STATUS', 1, 0, 3, 'PAUSED', 'Ожидание', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_ERROR_STATUS', 1, 0, 4, 'WIP', 'В разработке', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_ERROR_STATUS', 1, 0, 5, 'COMPLETED', 'Выполнено', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_ERROR_STATUS', 1, 0, 6, 'CLOSED', 'Завершено', NOW(),  NOW(), 0, 0),
       -- статус задачи категории "Установка на ПРОД"
       (1, 6, 'SYS.ISSUE_PROD_STATUS', 1, 0, 0, 'NEW', 'Новая', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_PROD_STATUS', 1, 0, 1, 'CANCELLED', 'Отменено', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_PROD_STATUS', 1, 0, 2, 'TO_TEST', 'Установке на ТЕСТ', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_PROD_STATUS', 1, 0, 3, 'TESTING', 'Тестирование', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_PROD_STATUS', 1, 0, 4, 'APPROVEMENT', 'Согласование установки', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_PROD_STATUS', 1, 0, 5, 'TO_PROD', 'Установка на ПРОД', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_PROD_STATUS', 1, 0, 6, 'COMPLETED', 'Выполнено', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_PROD_STATUS', 1, 0, 7, 'CLOSED', 'Завершено', NOW(),  NOW(), 0, 0),
       -- приоритет задачи
       (1, 6, 'SYS.ISSUE_PRIORITY', 1, 0, 0, 'LOW', 'Низкий', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_PRIORITY', 1, 0, 1, 'NORMAL', 'Нормальный', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_PRIORITY', 1, 0, 2, 'HIGH', 'Высокий', NOW(),  NOW(), 0, 0),
       (1, 6, 'SYS.ISSUE_PRIORITY', 1, 0, 3, 'CRITICAL', 'Критично', NOW(),  NOW(), 0, 0);

####################################
ALTER TABLE core_system ADD CONSTRAINT fk_system_user_id FOREIGN KEY (user_id) REFERENCES core_users(id);
ALTER TABLE core_system ADD CONSTRAINT fk_system_project_id FOREIGN KEY (project_id) REFERENCES core_projects(id);
ALTER TABLE core_system ADD CONSTRAINT fk_system_profile_id FOREIGN KEY (profile_id) REFERENCES core_profiles(id);

ALTER TABLE core_projects ADD CONSTRAINT fk_projects_parent_id FOREIGN KEY (parent_id) REFERENCES core_projects(id);
ALTER TABLE core_projects ADD CONSTRAINT fk_projects_type_id FOREIGN KEY (type_id) REFERENCES core_list_info(id);
ALTER TABLE core_projects ADD CONSTRAINT fk_projects_status_id FOREIGN KEY (status_id) REFERENCES core_list_info(id);
ALTER TABLE core_projects ADD CONSTRAINT fk_projects_priority_id FOREIGN KEY (priority_id) REFERENCES core_list_info(id);
ALTER TABLE core_projects ADD CONSTRAINT fk_projects_team_id FOREIGN KEY (team_id) REFERENCES core_team(id);
ALTER TABLE core_projects ADD CONSTRAINT fk_projects_author_id FOREIGN KEY (author_id) REFERENCES core_users(id);
ALTER TABLE core_projects ADD CONSTRAINT fk_projects_class_id FOREIGN KEY (class_id) REFERENCES core_list_info(id);
ALTER TABLE core_projects ADD CONSTRAINT fk_projects_category_id FOREIGN KEY (category_id) REFERENCES core_list_info(id);

ALTER TABLE core_users ADD CONSTRAINT fk_users_type_id FOREIGN KEY (type_id) REFERENCES core_list_info(id);
ALTER TABLE core_users ADD CONSTRAINT fk_users_status_id FOREIGN KEY (status_id) REFERENCES core_list_info(id);

ALTER TABLE core_profiles ADD CONSTRAINT fk_profiles_type_id FOREIGN KEY (type_id) REFERENCES core_list_info(id);
ALTER TABLE core_profiles ADD CONSTRAINT fk_profiles_status_id FOREIGN KEY (status_id) REFERENCES core_list_info(id);
ALTER TABLE core_profiles ADD CONSTRAINT fk_profiles_user_id FOREIGN KEY (user_id) REFERENCES core_users(id);

ALTER TABLE core_details ADD CONSTRAINT fk_details_profile_id FOREIGN KEY (profile_id) REFERENCES core_profiles(id);
# ALTER TABLE core_details ADD CONSTRAINT fk_details_media_id FOREIGN KEY (media_id) REFERENCES core_media(id);
# ALTER TABLE core_details ADD CONSTRAINT fk_details_look_id FOREIGN KEY (look_id) REFERENCES core_looks(id);

ALTER TABLE core_team ADD CONSTRAINT fk_team_parent_id FOREIGN KEY (parent_id) REFERENCES core_team(id);
ALTER TABLE core_team ADD CONSTRAINT fk_team_type_id FOREIGN KEY (type_id) REFERENCES core_list_info(id);
ALTER TABLE core_team ADD CONSTRAINT fk_team_status_id FOREIGN KEY (status_id) REFERENCES core_list_info(id);
ALTER TABLE core_team ADD CONSTRAINT fk_team_profile_id FOREIGN KEY (profile_id) REFERENCES core_profiles(id);
ALTER TABLE core_team ADD CONSTRAINT fk_team_user_id FOREIGN KEY (user_id) REFERENCES core_users(id);
# ALTER TABLE core_team ADD CONSTRAINT fk_team_user_role_id FOREIGN KEY (user_role_id) REFERENCES core_list_info(id);

ALTER TABLE core_issue ADD CONSTRAINT fk_issue_parent_id FOREIGN KEY (parent_id) REFERENCES core_issue(id);
ALTER TABLE core_issue ADD CONSTRAINT fk_issue_project_id FOREIGN KEY (project_id) REFERENCES core_projects(id);
ALTER TABLE core_issue ADD CONSTRAINT fk_issue_type_id FOREIGN KEY (type_id) REFERENCES core_list_info(id);
ALTER TABLE core_issue ADD CONSTRAINT fk_issue_category_id FOREIGN KEY (category_id) REFERENCES core_list_info(id);
ALTER TABLE core_issue ADD CONSTRAINT fk_issue_status_id FOREIGN KEY (status_id) REFERENCES core_list_info(id);
ALTER TABLE core_issue ADD CONSTRAINT fk_issue_priority_id FOREIGN KEY (priority_id) REFERENCES core_list_info(id);
ALTER TABLE core_issue ADD CONSTRAINT fk_issue_author_id FOREIGN KEY (author_id) REFERENCES core_users(id);
ALTER TABLE core_issue ADD CONSTRAINT fk_issue_assigned_to FOREIGN KEY (assigned_to) REFERENCES core_users(id);
ALTER TABLE core_issue ADD CONSTRAINT fk_issue_fixed_version_id FOREIGN KEY (fixed_version_id) REFERENCES core_list_info(id);

ALTER TABLE core_list_info ADD CONSTRAINT fk_core_list_scope_id FOREIGN KEY (scope_id) REFERENCES core_list_info(id);
ALTER TABLE core_list_info ADD CONSTRAINT fk_core_list_object_type_id FOREIGN KEY (object_type_id) REFERENCES core_list_info(id);
ALTER TABLE core_list_info ADD CONSTRAINT fk_core_list_value_type_id FOREIGN KEY (value_type_id) REFERENCES core_list_info(id);
# ALTER TABLE core_list_info ADD CONSTRAINT fk_core_list_object_id FOREIGN KEY (object_id) REFERENCES core_list_info(id);

ALTER TABLE custom_list_info ADD CONSTRAINT fk_custom_list_scope_id FOREIGN KEY (scope_id) REFERENCES core_list_info(id);
ALTER TABLE custom_list_info ADD CONSTRAINT fk_custom_list_object_type_id FOREIGN KEY (object_type_id) REFERENCES core_list_info(id);
ALTER TABLE custom_list_info ADD CONSTRAINT fk_custom_list_value_type_id FOREIGN KEY (value_type_id) REFERENCES core_list_info(id);
# ALTER TABLE core_list_info ADD CONSTRAINT fk_custom_list_object_id FOREIGN KEY (object_id) REFERENCES core_list_info(id);

ALTER TABLE journal ADD CONSTRAINT fk_journal_user_id FOREIGN KEY (user_id) REFERENCES core_users(id);

