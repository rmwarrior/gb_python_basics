####################################
-- Процедура получения списочного значения, по имени группы и коду значения
drop function if exists gb_curs_dnk.get_core_list_value;

delimiter //

create function gb_curs_dnk.get_core_list_value(
    p_list_name varchar(255),
    p_list_code varchar(255)) returns bigint deterministic
begin
    declare res_val bigint;
    select id into res_val
      from gb_curs_dnk.core_list_info
     where list_name = p_list_name
       and list_code = p_list_code;

    return res_val;
end//

delimiter ;

####################################
-- Процедура добавления нового пользователя, по дате рождения определяем тип
delimiter //

create procedure gb_curs_dnk.sp_add_user(
    in p_first_name varchar(255),
    in p_middle_name varchar(255),
    in p_last_name varchar(255),
    in p_login varchar(255),
    in p_password_hash varchar(100),
    in p_gender varchar(100),
    in p_birth_date date)
begin
    declare l_type_id bigint;

    -- если p_gender не указан, можно считать Юр.лицом или ИП..., TODO рассмотрим позднее
    set l_type_id = gb_curs_dnk.get_core_list_value('SYS.USER_TYPE', 'ADULT');
    if datediff(now(), p_birth_date) < 18*365.25 then -- молодёжь
        set l_type_id = gb_curs_dnk.get_core_list_value('SYS.USER_TYPE', 'YOUNG');
    else
        if datediff(now(), p_birth_date) > 65*365.25 then -- пенсионеры
            set l_type_id = gb_curs_dnk.get_core_list_value('SYS.USER_TYPE', 'AGED');
        end if;
    end if;

    insert into gb_curs_dnk.core_users (
                first_name, middle_name, last_name, type_id, status_id, login, password_hash, gender,
                birth_date, created_at, updated_at)
    values (p_first_name, p_middle_name, p_last_name, l_type_id, 0, p_login, p_password_hash, p_gender,
           p_birth_date, now(), now());

    select @last_id := last_insert_id();
    if p_gender is null then
        set l_type_id = gb_curs_dnk.get_core_list_value('SYS.PROFILE_TYPE', 'LEGAL_ENTITY');
    else
        set l_type_id = gb_curs_dnk.get_core_list_value('SYS.PROFILE_TYPE', 'PHYSICAL_PERSON');
    end if;

    insert into gb_curs_dnk.core_profiles (type_id, status_id, user_id, created_at, updated_at)
    values (l_type_id, 0, @last_id, now(), now());

    select @last_id := last_insert_id();
    insert into gb_curs_dnk.core_details (profile_id, dtl_index, name, info, media_id, look_id, created_at, updated_at)
    values (@last_id, 0, 'Адрес', '', 0, 0, now(), now());

end//

delimiter ;


####################################
# delete from gb_curs_dnk.core_users


call gb_curs_dnk.sp_add_user ('Иван', 'Иванович', 'Иванов',
    'IVANOV_II', '0xFFFFFFFF', 'M', STR_TO_DATE('29/02/1980', '%d/%m/%Y'));
call gb_curs_dnk.sp_add_user ('Анна', 'Петровна', 'Иванова',
    'IVANOVA_AP', '0xFFFFFFFF', 'F', STR_TO_DATE('31/12/1980', '%d/%m/%Y'));
call gb_curs_dnk.sp_add_user ('Андрей', 'Иванович', 'Иванов',
    'IVANOV_AI', '0xFFFFFFFF', 'M', STR_TO_DATE('23/02/2000', '%d/%m/%Y'));
call gb_curs_dnk.sp_add_user ('Ольга', 'Ивановна', 'Иванова',
    'IVANOVA_OI', '0xFFFFFFFF', 'F', STR_TO_DATE('08/03/2004', '%d/%m/%Y'));

-- Добавление команды проекта
insert into gb_curs_dnk.core_team (
            name, parent_id, type_id, status_id, profile_id, user_id, user_role_id, created_at, updated_at)
select 'Семья Ивановых' name, 0,
       gb_curs_dnk.get_core_list_value('SYS.TEAM_TYPE', 'PRIVATE'),
       gb_curs_dnk.get_core_list_value('SYS.TEAM_STATUS', 'NEW'),
       0, u.id, 0, -- user_role_id пока не используется, нужно переделать
       now(), now()
  from gb_curs_dnk.core_users u
 where u.login in ('IVANOV_II', 'IVANOVA_AP', 'IVANOV_AI', 'IVANOVA_OI');

####################################
-- Процедура добавления проекта
delimiter //

create procedure gb_curs_dnk.sp_add_project(
    in p_name varchar(255),
    in p_parent_id bigint,
    in p_type_code varchar(255),
    in p_priority_code varchar(255),
    in p_team_name varchar(255),
    in p_author_id bigint,
    in p_class_name varchar(255),
    in p_category_code varchar(255),
    in p_start_date date,
    in p_due_date date,
    in p_git_repo varchar(255),
    in p_notes varchar(255),
    in p_subject varchar(255),
    in p_description varchar(255))
begin
    select min(t.id) as id into @team_id
      from gb_curs_dnk.core_team t
     where t.name = p_team_name;

    insert into gb_curs_dnk.core_projects (
                name, parent_id, type_id, priority_id, status_id, team_id, author_id, class_id, category_id,
                fixed_version_id, start_date, due_date, git_repo, notes, subject, description, created_at, updated_at)
    values (p_name, p_parent_id,
           gb_curs_dnk.get_core_list_value('SYS.PROJECT_TYPE', p_type_code),
           gb_curs_dnk.get_core_list_value('SYS.PROJECT_PRIORITY', p_priority_code),
           gb_curs_dnk.get_core_list_value('SYS.PROJECT_STATUS', 'NEW'),
           @team_id, p_author_id,
           gb_curs_dnk.get_core_list_value('SYS.PROJECT_CLASS', p_class_name),
           gb_curs_dnk.get_core_list_value('SYS.PROJECT_CATEGORY',p_category_code),
           gb_curs_dnk.get_core_list_value('SYS.PROJECT_FIXED_VERSION', 'INITIALIZATION'),
           p_start_date, p_due_date, p_git_repo, p_notes, p_subject, p_description, now(), now());

end//

delimiter ;


####################################
-- Добавим проекты на текущий год
call gb_curs_dnk.sp_add_project('Семья-Здоровье-21', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'HEALTH', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Здоровье', '');
call gb_curs_dnk.sp_add_project('Семья-Отношения-21', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'RELATIONS', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Отношения', '');
call gb_curs_dnk.sp_add_project('Семья-Призвание-21', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'VOCATION', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Призвание', '');
call gb_curs_dnk.sp_add_project('Семья-Духовность-21', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'SPIRITUALITY', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Духовность', '');
call gb_curs_dnk.sp_add_project('Семья-Яркость жизни-21', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'LIFE_QUALITY', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Яркость жизни', '');
call gb_curs_dnk.sp_add_project('Семья-Имущество-21', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'INVENTORY', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Имущество', '');
call gb_curs_dnk.sp_add_project('Семья-Финансы-21', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'FINANCE', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Финансы', '');
call gb_curs_dnk.sp_add_project('Семья-Информация-21', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'IT', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Информация', '');


-- Сменим веху проекта с "Инициализация" на "Реализация"
update gb_curs_dnk.core_projects set
       fixed_version_id = gb_curs_dnk.get_core_list_value('SYS.PROJECT_FIXED_VERSION', 'REALIZATION')
 where id > 0;


-- Добавим проекты на следующий год
call gb_curs_dnk.sp_add_project('Семья-Здоровье-22', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'HEALTH', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Здоровье', '');
call gb_curs_dnk.sp_add_project('Семья-Отношения-22', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'RELATIONS', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Отношения', '');
call gb_curs_dnk.sp_add_project('Семья-Призвание-22', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'VOCATION', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Призвание', '');
call gb_curs_dnk.sp_add_project('Семья-Духовность-22', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'SPIRITUALITY', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Духовность', '');
call gb_curs_dnk.sp_add_project('Семья-Яркость жизни-22', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'LIFE_QUALITY', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Яркость жизни', '');
call gb_curs_dnk.sp_add_project('Семья-Имущество-22', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'INVENTORY', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Имущество', '');
call gb_curs_dnk.sp_add_project('Семья-Финансы-22', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'FINANCE', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Финансы', '');
call gb_curs_dnk.sp_add_project('Семья-Информация-22', 0, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 0, 'IT', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Информация', '');

####################################
-- Процедура добавления задачи
delimiter //

create procedure gb_curs_dnk.sp_add_issue(
    in p_name varchar(255),
    in p_parent_id bigint,
    in p_project_id bigint,
    in p_type_code varchar(255),
    in p_priority_code varchar(255),
    in p_team_name varchar(255),
    in p_author_id bigint,
    in p_assigned_to bigint,
    in p_category_code varchar(255),
    in p_start_date date,
    in p_due_date date,
    in p_notes varchar(255),
    in p_subject varchar(255),
    in p_description varchar(255))
begin
    insert into gb_curs_dnk.core_issue (
                name, parent_id, type_id, priority_id, category_id, status_id, project_id, author_id, team_name,
                fixed_version_id, start_date, due_date, assigned_to, notes, subject, description, created_at, updated_at)
    values (p_name, p_parent_id,
           gb_curs_dnk.get_core_list_value('SYS.ISSUE_TYPE', p_type_code),
           gb_curs_dnk.get_core_list_value('SYS.ISSUE_PRIORITY', p_priority_code),
           gb_curs_dnk.get_core_list_value('SYS.ISSUE_CATEGORY',p_category_code),
           gb_curs_dnk.get_core_list_value('SYS.ISSUE_STATUS', 'NEW'),
           p_project_id, p_author_id, p_team_name,
           gb_curs_dnk.get_core_list_value('SYS.PROJECT_FIXED_VERSION', 'INITIALIZATION'),
           p_start_date, p_due_date, p_assigned_to, p_notes, p_subject, p_description, now(), now());

end;

delimiter ;


####################################
call gb_curs_dnk.sp_add_issue('Собрать сведения о транспорте', 0, 14,
    'BUSINESS', 'NORMAL', '', 1, 1, 'TASK',
    STR_TO_DATE('10/10/2021', '%d/%m/%Y'), STR_TO_DATE('30/10/2021', '%d/%m/%Y'),
    'Транспорт', 'Собрать сведения об имуществе', '');

call gb_curs_dnk.sp_add_issue('Собрать сведения о недвижимости', 0, 14,
    'BUSINESS', 'NORMAL', '', 1, 1, 'TASK',
    STR_TO_DATE('10/10/2021', '%d/%m/%Y'), STR_TO_DATE('30/10/2021', '%d/%m/%Y'),
    'Недвижимость', 'Собрать сведения об имуществе', '');

call gb_curs_dnk.sp_add_issue('Собрать сведения об имуществе', 0, 14,
    'BUSINESS', 'NORMAL', '', 1, 1, 'TASK',
    STR_TO_DATE('10/10/2021', '%d/%m/%Y'), STR_TO_DATE('30/10/2021', '%d/%m/%Y'),
    'Имущество', 'Собрать сведения об имуществе', '');

####################################



