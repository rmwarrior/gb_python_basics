# Целью дипломного проекта было создание БД, с функциями, похожими на баг-трекер, но с элементами бухгалтерии на бытовом уровне:
#  - создание и сопровождение проектов (древовидная структура, различная вложенность, разделяются на классы);
#  - создание команд проектов, с разными ролями (например семья);
#  - для каждого проекта создаются и сопровождаются задачи (запланировано/в работе/завершено);
#  - изменения в задачах журналируются, ведется учёт потраченного времени;
#  - бухгалтерский учёт планировалось реализовать в простом виде (счета: счет в банке, наличка, карточный счет; приход; расход; текущий баланс);
#  - помимо бухгалтерского учёта хотелось бы вести учёт имущества, документов, альбомов с фотографиями на разных ресурсах
#  и еще много чего, но в рамках данного проекта все "хотелки" не реализовать...

Foreign keys решил пока не использовать, по своему опыту думаю, что при неправильном использовании от них больше вреда чем пользы

# 2021-10-12
*изменил некоторые столбцы;
+добавил некоторые системные настройки;
+добавил процедуры для вставки пользователей, проектов и задач;
*заполнил данными;
+добавил дамп "gb_curs_dnk.sql";


# 2021-10-16
+добавил представления;
+добавил внешние ключи;
+добавил диаграмму "Entity Relationship Diagram" (формат svg; получена реверс-инжинирингом из базы программой VisualParadigm)
*исправил заполнение данными в соответствии с внешними ключами;
*обновил дамп "gb_curs_dnk.sql";
-не удалось реализовать даже половины того что хотел;
-сделал для себя выводы: 1. проектировщик из меня некудышный; 2. нужно разделять обязанности кодера и постановщика;
-в результате получился недо-Redmine или недо-Jira (зато бесплатный)

SQLcourse.ddl		Создание БД
SQLcourse data 01.ddl	Добавление базовых настроек (типов) и внешних ключей
SQLcourse data 02.ddl	Создание процедур, представлений и заполнение данными
SQLcourse data 03.ddl	Вызов двух представлений