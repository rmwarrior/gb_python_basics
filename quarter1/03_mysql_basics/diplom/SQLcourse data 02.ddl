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
drop procedure if exists gb_curs_dnk.sp_add_user;

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
    values (p_first_name, p_middle_name, p_last_name, l_type_id,
           gb_curs_dnk.get_core_list_value('SYS.USER_STATUS', 'NEW'),
           p_login, p_password_hash, p_gender,
           p_birth_date, now(), now());

    select @last_id := last_insert_id();
    if p_gender is null then
        set l_type_id = gb_curs_dnk.get_core_list_value('SYS.PROFILE_TYPE', 'LEGAL_ENTITY');
    else
        set l_type_id = gb_curs_dnk.get_core_list_value('SYS.PROFILE_TYPE', 'PHYSICAL_PERSON');
    end if;

    insert into gb_curs_dnk.core_profiles (type_id, status_id, user_id, created_at, updated_at)
    values (l_type_id,
           gb_curs_dnk.get_core_list_value('SYS.PROFILE_STATUS', 'NEW'),
           @last_id, now(), now());

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
select 'Семья Ивановых' name, null,
       gb_curs_dnk.get_core_list_value('SYS.TEAM_TYPE', 'PRIVATE'),
       gb_curs_dnk.get_core_list_value('SYS.TEAM_STATUS', 'NEW'),
       null, u.id, 0, -- user_role_id пока не используется, нужно переделать
       now(), now()
  from gb_curs_dnk.core_users u
 where u.login in ('IVANOV_II', 'IVANOVA_AP', 'IVANOV_AI', 'IVANOVA_OI');

####################################
drop procedure if exists gb_curs_dnk.sp_add_project;

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
call gb_curs_dnk.sp_add_project('Семья-Здоровье-21', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'HEALTH', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Здоровье', '');
call gb_curs_dnk.sp_add_project('Семья-Отношения-21', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'RELATIONS', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Отношения', '');
call gb_curs_dnk.sp_add_project('Семья-Призвание-21', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'VOCATION', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Призвание', '');
call gb_curs_dnk.sp_add_project('Семья-Духовность-21', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'SPIRITUALITY', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Духовность', '');
call gb_curs_dnk.sp_add_project('Семья-Яркость жизни-21', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'LIFE_QUALITY', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Яркость жизни', '');
call gb_curs_dnk.sp_add_project('Семья-Имущество-21', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'INVENTORY', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Имущество', '');
call gb_curs_dnk.sp_add_project('Семья-Финансы-21', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'FINANCE', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Финансы', '');
call gb_curs_dnk.sp_add_project('Семья-Информация-21', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'IT', 'IT',
    STR_TO_DATE('01/01/2021', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2021', '%d/%m/%Y'),
    'http://github.com', '2021', 'Семья-Информация', '');


-- Сменим веху проекта с "Инициализация" на "Реализация"
update gb_curs_dnk.core_projects set
       fixed_version_id = gb_curs_dnk.get_core_list_value('SYS.PROJECT_FIXED_VERSION', 'REALIZATION')
 where id > 0;


-- Добавим проекты на следующий год
call gb_curs_dnk.sp_add_project('Семья-Здоровье-22', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'HEALTH', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Здоровье', '');
call gb_curs_dnk.sp_add_project('Семья-Отношения-22', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'RELATIONS', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Отношения', '');
call gb_curs_dnk.sp_add_project('Семья-Призвание-22', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'VOCATION', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Призвание', '');
call gb_curs_dnk.sp_add_project('Семья-Духовность-22', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'SPIRITUALITY', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Духовность', '');
call gb_curs_dnk.sp_add_project('Семья-Яркость жизни-22', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'LIFE_QUALITY', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Яркость жизни', '');
call gb_curs_dnk.sp_add_project('Семья-Имущество-22', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'INVENTORY', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Имущество', '');
call gb_curs_dnk.sp_add_project('Семья-Финансы-22', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'FINANCE', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Финансы', '');
call gb_curs_dnk.sp_add_project('Семья-Информация-22', null, 'BUSINESS', 'NORMAL',
    'Семья Ивановых', 1, 'IT', 'IT',
    STR_TO_DATE('01/01/2022', '%d/%m/%Y'),
    STR_TO_DATE('31/12/2022', '%d/%m/%Y'),
    'http://github.com', '2022', 'Семья-Информация', '');

####################################
drop procedure if exists gb_curs_dnk.sp_add_issue;

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
    declare l_status bigint;

    if p_category_code = 'TASK' then
        select gb_curs_dnk.get_core_list_value('SYS.ISSUE_TASK_STATUS', 'NEW') into l_status;
    end if;
    if p_category_code = 'ERROR' then
        select gb_curs_dnk.get_core_list_value('SYS.ISSUE_ERROR_STATUS', 'NEW') into l_status;
    end if;
    if p_category_code = 'TO_PROD' then
        select gb_curs_dnk.get_core_list_value('SYS.ISSUE_PROD_STATUS', 'NEW') into l_status;
    end if;

    insert into gb_curs_dnk.core_issue (
                name, parent_id, type_id, priority_id, category_id, status_id, project_id, author_id, team_name,
                fixed_version_id, start_date, due_date, assigned_to, notes, subject, description, created_at, updated_at)
    values (p_name, p_parent_id,
           gb_curs_dnk.get_core_list_value('SYS.ISSUE_TYPE', p_type_code),
           gb_curs_dnk.get_core_list_value('SYS.ISSUE_PRIORITY', p_priority_code),
           gb_curs_dnk.get_core_list_value('SYS.ISSUE_CATEGORY',p_category_code),
           l_status, p_project_id, p_author_id, p_team_name,
           gb_curs_dnk.get_core_list_value('SYS.PROJECT_FIXED_VERSION', 'INITIALIZATION'),
           p_start_date, p_due_date, p_assigned_to, p_notes, p_subject, p_description, now(), now());

end;

delimiter ;


####################################
delimiter |

create trigger gb_curs_dnk.tr_issue_before_update before update on gb_curs_dnk.core_issue
     for each row
begin
  declare msg varchar(1000);
  declare l_spent_time numeric(19, 4);
  if (old.name is null) or (old.name <> new.name) then set msg = concat('name=', new.name); end if;
  if (old.parent_id is null) or (old.parent_id <> new.parent_id) then set msg = concat(msg, ' parent_id=', old.parent_id); end if;
  if (old.project_id is null) or (old.project_id <> new.project_id) then set msg = concat(msg, ' project_id=', old.project_id); end if;
  if (old.type_id is null) or (old.type_id <> new.type_id) then set msg = concat(msg, ' type_id=', old.type_id); end if;
  if (old.category_id is null) or (old.category_id <> new.category_id) then set msg = concat(msg, ' category_id=', old.category_id); end if;
  if (old.status_id is null) or (old.status_id <> new.status_id) then set msg = concat(msg, ' status_id=', old.status_id); end if;
  if (old.priority_id is null) or (old.priority_id <> new.priority_id) then set msg = concat(msg, ' priority_id=', old.priority_id); end if;
  if (old.author_id is null) or (old.author_id <> new.author_id) then set msg = concat(msg, ' author_id=', old.author_id); end if;
  if (old.assigned_to is null) or (old.assigned_to <> new.assigned_to) then set msg = concat(msg, ' assigned_to=', old.assigned_to); end if;
  if (old.team_name is null) or (old.team_name <> new.team_name) then set msg = concat(msg, ' team_name=', old.team_name); end if;
  if (old.start_date is null) or (old.start_date <> new.start_date) then set msg = concat(msg, ' start_date=', old.start_date); end if;
  if (old.due_date is null) or (old.due_date <> new.due_date) then set msg = concat(msg, ' due_date=', old.due_date); end if;
  if (old.completion_date is null) or (old.completion_date <> new.completion_date) then set msg = concat(msg, ' completion_date=', old.completion_date); end if;
#   if old.email_to <> new.email_to then set msg = msg + ' email_to=' + old.email_to; end if;
#   if old.email_cc <> new.email_cc then set msg = msg + ' email_cc=' + old.email_cc; end if;
  if (old.spent_time is null) or (old.spent_time <> new.spent_time) then
      set msg = concat(msg, ' spent_time=', old.spent_time);
      select sum(spent_time) into l_spent_time
        from gb_curs_dnk.journal
       where object_id = old.id;
      set l_spent_time = l_spent_time + old.spent_time;
  end if;
  if (old.done_ratio is null) or (old.done_ratio <> new.done_ratio) then set msg = concat(msg, ' done_ratio=', old.done_ratio); end if;
#   if old.fixed_version_id <> new.fixed_version_id then set msg = msg + ' fixed_version_id=' + old.fixed_version_id;
#   if old.notes <> new.notes then set msg = msg + ' notes=' + old.notes;
#   if old.subject <> new.subject then set msg = msg + ' subject=' + old.subject;
#   if old.description <> new.description then set msg = msg + ' description=' + old.description;

  insert into gb_curs_dnk.journal (object_type_id, object_id, user_id, spent_time, notes, created_at)
  values (0, old.id, new.updated_by, l_spent_time, msg, now());

end;

delimiter ;

####################################
call gb_curs_dnk.sp_add_issue('Собрать сведения о транспорте', null, 14,
    'BUSINESS', 'NORMAL', '', 1, 1, 'TASK',
    STR_TO_DATE('10/10/2021', '%d/%m/%Y'), STR_TO_DATE('30/10/2021', '%d/%m/%Y'),
    'Транспорт', 'Собрать сведения об имуществе', '');

call gb_curs_dnk.sp_add_issue('Собрать сведения о недвижимости', null, 14,
    'BUSINESS', 'NORMAL', '', 1, 1, 'TASK',
    STR_TO_DATE('10/10/2021', '%d/%m/%Y'), STR_TO_DATE('30/10/2021', '%d/%m/%Y'),
    'Недвижимость', 'Собрать сведения об имуществе', '');

call gb_curs_dnk.sp_add_issue('Собрать сведения об имуществе', null, 14,
    'BUSINESS', 'NORMAL', '', 1, 1, 'TASK',
    STR_TO_DATE('10/10/2021', '%d/%m/%Y'), STR_TO_DATE('30/10/2021', '%d/%m/%Y'),
    'Имущество', 'Собрать сведения об имуществе', '');


####################################
insert into gb_curs_dnk.core_system(user_id, project_id, profile_id)
values (1, 14, null);



####################################
drop view if exists gb_curs_dnk.v_issues;

-- Представление по задачам
create view gb_curs_dnk.v_issues as
select i.id, cp.name as project, i.name, i.subject, i.start_date, i.due_date,
       cli_cat.value as category, cli_typ.value as type, cli_sta.value as status, cli_pri.value as priority,
       concat(u_aut.first_name, ' ', u_aut.last_name) as author,
       concat(u_asn.first_name, ' ', u_asn.last_name) as assignee
  from gb_curs_dnk.core_issue i
  join core_projects                   cp on cp.id = i.project_id
  join gb_curs_dnk.core_list_info cli_cat on cli_cat.id = i.category_id
  join gb_curs_dnk.core_list_info cli_typ on cli_typ.id = i.type_id
  join gb_curs_dnk.core_list_info cli_sta on cli_sta.id = i.status_id
  join gb_curs_dnk.core_list_info cli_pri on cli_pri.id = i.priority_id
  join gb_curs_dnk.core_users       u_aut on u_aut.id = i.author_id
  join gb_curs_dnk.core_users       u_asn on u_asn.id = i.assigned_to;

####################################
drop view if exists gb_curs_dnk.v_core_list_values;

-- Представление по системным переменным
create view gb_curs_dnk.v_core_list_values as
select cli.id, cli.list_name, cli.list_code, cli.value
  from gb_curs_dnk.core_list_info as cli
 where cli.valid_from is null
   and cli.valid_to is null;
