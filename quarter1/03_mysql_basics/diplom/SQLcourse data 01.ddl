# delete from gb_curs_dnk.core_list_info;

####################################
insert into gb_curs_dnk.core_list_info(
            scope_id, object_type_id, list_name, value_type_id, object_id, list_index,
            list_code, value, created_at, updated_at, created_by, updated_by)
values -- системные типы (область действия: система, тип объекта: система)
       -- область действия
       (0, 0, 'SYS.SCOPE', 0, 0, 0, 'SYSTEM', 'Система', NOW(),  NOW(), 0, 0),
       (0, 0, 'SYS.SCOPE', 0, 0, 1, 'PROJECT', 'Проект', NOW(),  NOW(), 0, 0),
       (0, 0, 'SYS.SCOPE', 0, 0, 2, 'ISSUE', 'Задача', NOW(),  NOW(), 0, 0),
       -- тип объекта
       (0, 0, 'SYS.OBJECT_TYPE', 0, 0, 0, 'SYSTEM', 'Система', NOW(),  NOW(), 0, 0),
       (0, 0, 'SYS.OBJECT_TYPE', 0, 0, 1, 'PROJECT', 'Проект', NOW(),  NOW(), 0, 0),
       (0, 0, 'SYS.OBJECT_TYPE', 0, 0, 2, 'USER', 'Пользователь', NOW(),  NOW(), 0, 0),
       (0, 0, 'SYS.OBJECT_TYPE', 0, 0, 3, 'PROFILE', 'Профиль', NOW(),  NOW(), 0, 0),
       (0, 0, 'SYS.OBJECT_TYPE', 0, 0, 4, 'TEAM', 'Команда', NOW(),  NOW(), 0, 0),
       (0, 0, 'SYS.OBJECT_TYPE', 0, 0, 5, 'ISSUE', 'Задача', NOW(),  NOW(), 0, 0),
       -- тип значения
       (0, 0, 'SYS.VALUE_TYPE', 0, 0, 0, 'TEXT', 'Текст', NOW(),  NOW(), 0, 0),
       (0, 0, 'SYS.VALUE_TYPE', 0, 0, 1, 'MEDIA', 'Медиа', NOW(),  NOW(), 0, 0),
       (0, 0, 'SYS.VALUE_TYPE', 0, 0, 2, 'TAG', 'Тэг', NOW(),  NOW(), 0, 0),
       (0, 0, 'SYS.VALUE_TYPE', 0, 0, 3, 'LIST_REF', 'Ссылка на список', NOW(),  NOW(), 0, 0);


####################################
insert into gb_curs_dnk.core_list_info(
            scope_id, object_type_id, list_name, value_type_id, object_id, list_index,
            list_code, value, created_at, updated_at, created_by, updated_by)
values -- системные типы (область действия: система, тип объекта: проект)
       -- тип проекта
       (0, 1, 'SYS.PROJECT_TYPE', 0, 0, 0, 'BUSINESS', 'Бизнес', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_TYPE', 0, 0, 1, 'IT', 'IT-область', NOW(),  NOW(), 0, 0),
       -- статус проекта
       (0, 1, 'SYS.PROJECT_STATUS', 0, 0, 0, 'NEW', 'Новый', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_STATUS', 0, 0, 1, 'WIP', 'В работе', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_STATUS', 0, 0, 2, 'TEST', 'Тестирование', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_STATUS', 0, 0, 3, 'PAUSED', 'Приостановлен', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_STATUS', 0, 0, 4, 'CANCELLED', 'Отменен', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_STATUS', 0, 0, 5, 'COMPLETED', 'Выполнен', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_STATUS', 0, 0, 6, 'CLOSED', 'Закрыт', NOW(),  NOW(), 0, 0),
       -- приоритет проекта
       (0, 1, 'SYS.PROJECT_PRIORITY', 0, 0, 0, 'LOW', 'Низкий', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_PRIORITY', 0, 0, 1, 'NORMAL', 'Нормальный', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_PRIORITY', 0, 0, 2, 'HIGH', 'Высокий', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_PRIORITY', 0, 0, 3, 'CRITICAL', 'Критично', NOW(),  NOW(), 0, 0),
       -- класс проекта
       (0, 1, 'SYS.PROJECT_CLASS', 0, 0, 0, 'HEALTH', 'Здоровье', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_CLASS', 0, 0, 1, 'RELATIONS', 'Отношения', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_CLASS', 0, 0, 2, 'VOCATION', 'Призвание', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_CLASS', 0, 0, 3, 'SPIRITUALITY', 'Духовность', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_CLASS', 0, 0, 4, 'LIFE_QUALITY', 'Яркость жизни', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_CLASS', 0, 0, 5, 'INVENTORY', 'Имущество', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_CLASS', 0, 0, 6, 'FINANCE', 'Финансы', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_CLASS', 0, 0, 7, 'IT', 'Информация', NOW(),  NOW(), 0, 0),
       -- веха проекта
       (0, 1, 'SYS.PROJECT_FIXED_VERSION', 0, 0, 0, 'INITIALIZATION', 'Инициализация', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_FIXED_VERSION', 0, 0, 1, 'PLANNING', 'Планирование', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_FIXED_VERSION', 0, 0, 2, 'REALIZATION', 'Реализация', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_FIXED_VERSION', 0, 0, 3, 'FINISHING', 'Завершение', NOW(),  NOW(), 0, 0),
       -- категория проекта
       (0, 1, 'SYS.PROJECT_CATEGORY', 0, 0, 0, 'FINANCE', 'Финансы', NOW(),  NOW(), 0, 0),
       (0, 1, 'SYS.PROJECT_CATEGORY', 0, 0, 1, 'IT', 'Информация', NOW(),  NOW(), 0, 0);


####################################
insert into gb_curs_dnk.core_list_info(
            scope_id, object_type_id, list_name, value_type_id, object_id, list_index,
            list_code, value, created_at, updated_at, created_by, updated_by)
values -- системные типы (область действия: система, тип объекта: пользователь)
       -- тип пользователя
       (0, 2, 'SYS.USER_TYPE', 0, 0, 0, 'YOUNG', 'Подросток', NOW(),  NOW(), 0, 0),
       (0, 2, 'SYS.USER_TYPE', 0, 0, 1, 'ADULT', 'Взрослый', NOW(),  NOW(), 0, 0),
       (0, 2, 'SYS.USER_TYPE', 0, 0, 2, 'AGED', 'Пожилой', NOW(),  NOW(), 0, 0),
       (0, 2, 'SYS.USER_TYPE', 0, 0, 3, 'LEGAL_ENTITY', 'Юр.лицо, ИП', NOW(),  NOW(), 0, 0),
       -- статус пользователя
       (0, 2, 'SYS.USER_STATUS', 0, 0, 0, 'NEW', 'Новый', NOW(),  NOW(), 0, 0),
       (0, 2, 'SYS.USER_STATUS', 0, 0, 1, 'ACTIVE', 'Активный', NOW(),  NOW(), 0, 0),
       (0, 2, 'SYS.USER_STATUS', 0, 0, 2, 'INACTIVE', 'Неактивный', NOW(),  NOW(), 0, 0),
       (0, 2, 'SYS.USER_STATUS', 0, 0, 3, 'EXCLUDED', 'Исключен', NOW(),  NOW(), 0, 0);


####################################
insert into gb_curs_dnk.core_list_info(
            scope_id, object_type_id, list_name, value_type_id, object_id, list_index,
            list_code, value, created_at, updated_at, created_by, updated_by)
values -- системные типы (область действия: система, тип объекта: профиль)
       -- тип профиля
       (0, 3, 'SYS.PROFILE_TYPE', 0, 0, 0, 'PHYSICAL_PERSON', 'Физ. лицо', NOW(),  NOW(), 0, 0),
       (0, 3, 'SYS.PROFILE_TYPE', 0, 0, 1, 'LEGAL_ENTITY', 'Юр.лицо, ИП', NOW(),  NOW(), 0, 0),
       -- статус профиля
       (0, 3, 'SYS.PROFILE_STATUS', 0, 0, 0, 'NEW', 'Новый', NOW(),  NOW(), 0, 0),
       (0, 3, 'SYS.PROFILE_STATUS', 0, 0, 1, 'NOT_FILLED', 'Неполный', NOW(),  NOW(), 0, 0),
       (0, 3, 'SYS.PROFILE_STATUS', 0, 0, 2, 'FILLED', 'Полный', NOW(),  NOW(), 0, 0),
       (0, 3, 'SYS.PROFILE_STATUS', 0, 0, 3, 'ACTUALIZE', 'Актуализировать', NOW(),  NOW(), 0, 0);


####################################
insert into gb_curs_dnk.core_list_info(
            scope_id, object_type_id, list_name, value_type_id, object_id, list_index,
            list_code, value, created_at, updated_at, created_by, updated_by)
values -- системные типы (область действия: система, тип объекта: команда)
       -- тип команды
       (0, 4, 'SYS.TEAM_TYPE', 0, 0, 0, 'PRIVATE', 'Частная', NOW(),  NOW(), 0, 0),
       (0, 4, 'SYS.TEAM_TYPE', 0, 0, 1, 'COMMERCIAL', 'Коммерческая', NOW(),  NOW(), 0, 0),
       -- статус команды
       (0, 4, 'SYS.TEAM_STATUS', 0, 0, 0, 'NEW', 'Новая', NOW(),  NOW(), 0, 0),
       (0, 4, 'SYS.TEAM_STATUS', 0, 0, 1, 'ACTIVE', 'Активная', NOW(),  NOW(), 0, 0),
       (0, 4, 'SYS.TEAM_STATUS', 0, 0, 2, 'INACTIVE', 'Неактивная', NOW(),  NOW(), 0, 0),
       (0, 4, 'SYS.TEAM_STATUS', 0, 0, 3, 'EXCLUDED', 'Исключена', NOW(),  NOW(), 0, 0);


####################################
insert into gb_curs_dnk.core_list_info(
            scope_id, object_type_id, list_name, value_type_id, object_id, list_index,
            list_code, value, created_at, updated_at, created_by, updated_by)
values -- системные типы (область действия: система, тип объекта: задача)
       -- тип задачи
       (0, 5, 'SYS.ISSUE_TYPE', 0, 0, 0, 'BUSINESS', 'Бизнес', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_TYPE', 0, 0, 1, 'IT', 'IT-область', NOW(),  NOW(), 0, 0),
       -- категория задачи
       (0, 5, 'SYS.ISSUE_CATEGORY', 0, 0, 0, 'TASK', 'Задача', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_CATEGORY', 0, 0, 1, 'ERROR', 'Ошибка', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_CATEGORY', 0, 0, 2, 'TO_PROD', 'Установка на ПРОД', NOW(),  NOW(), 0, 0),
       -- статус задачи категории "Задача"
       (0, 5, 'SYS.ISSUE_TASK_STATUS', 0, 0, 0, 'NEW', 'Новая', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_TASK_STATUS', 0, 0, 1, 'CANCELLED', 'Отменено', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_TASK_STATUS', 0, 0, 2, 'ASSIGNED', 'Назначено', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_TASK_STATUS', 0, 0, 3, 'PAUSED', 'Ожидание', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_TASK_STATUS', 0, 0, 4, 'WIP', 'В разработке', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_TASK_STATUS', 0, 0, 5, 'COMPLETED', 'Выполнено', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_TASK_STATUS', 0, 0, 6, 'CLOSED', 'Завершено', NOW(),  NOW(), 0, 0),
       -- статус задачи категории "Ошибка"
       (0, 5, 'SYS.ISSUE_ERROR_STATUS', 0, 0, 0, 'NEW', 'Новая', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_ERROR_STATUS', 0, 0, 1, 'CANCELLED', 'Отменено', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_ERROR_STATUS', 0, 0, 2, 'ASSIGNED', 'Назначено', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_ERROR_STATUS', 0, 0, 3, 'PAUSED', 'Ожидание', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_ERROR_STATUS', 0, 0, 4, 'WIP', 'В разработке', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_ERROR_STATUS', 0, 0, 5, 'COMPLETED', 'Выполнено', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_ERROR_STATUS', 0, 0, 6, 'CLOSED', 'Завершено', NOW(),  NOW(), 0, 0),
       -- статус задачи категории "Установка на ПРОД"
       (0, 5, 'SYS.ISSUE_PROD_STATUS', 0, 0, 0, 'NEW', 'Новая', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_PROD_STATUS', 0, 0, 1, 'CANCELLED', 'Отменено', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_PROD_STATUS', 0, 0, 2, 'TO_TEST', 'Установке на ТЕСТ', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_PROD_STATUS', 0, 0, 3, 'TESTING', 'Тестирование', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_PROD_STATUS', 0, 0, 4, 'APPROVEMENT', 'Согласование установки', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_PROD_STATUS', 0, 0, 5, 'TO_PROD', 'Установка на ПРОД', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_PROD_STATUS', 0, 0, 6, 'COMPLETED', 'Выполнено', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_PROD_STATUS', 0, 0, 7, 'CLOSED', 'Завершено', NOW(),  NOW(), 0, 0),
       -- приоритет задачи
       (0, 5, 'SYS.ISSUE_PRIORITY', 0, 0, 0, 'LOW', 'Низкий', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_PRIORITY', 0, 0, 1, 'NORMAL', 'Нормальный', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_PRIORITY', 0, 0, 2, 'HIGH', 'Высокий', NOW(),  NOW(), 0, 0),
       (0, 5, 'SYS.ISSUE_PRIORITY', 0, 0, 3, 'CRITICAL', 'Критично', NOW(),  NOW(), 0, 0);
