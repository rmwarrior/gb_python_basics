-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: gb_curs_dnk
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `core_details`
--

DROP TABLE IF EXISTS `core_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_id` bigint NOT NULL,
  `dtl_index` bigint DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `media_id` bigint DEFAULT NULL,
  `look_id` bigint DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_details_profile_id` (`profile_id`),
  CONSTRAINT `fk_details_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `core_profiles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Подробности профиля пользователей системы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_details`
--

LOCK TABLES `core_details` WRITE;
/*!40000 ALTER TABLE `core_details` DISABLE KEYS */;
INSERT INTO `core_details` VALUES (1,1,0,'Адрес','',0,0,'2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL),(2,2,0,'Адрес','',0,0,'2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL),(3,3,0,'Адрес','',0,0,'2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL),(4,4,0,'Адрес','',0,0,'2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `core_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_issue`
--

DROP TABLE IF EXISTS `core_issue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_issue` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  `type_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `status_id` bigint DEFAULT NULL,
  `priority_id` bigint DEFAULT NULL,
  `author_id` bigint DEFAULT NULL,
  `assigned_to` bigint DEFAULT NULL,
  `team_name` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `email_cc` varchar(255) DEFAULT NULL,
  `spent_time` decimal(19,4) DEFAULT NULL,
  `done_ratio` bigint DEFAULT NULL,
  `fixed_version_id` bigint DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_issue_parent_id` (`parent_id`),
  KEY `fk_issue_project_id` (`project_id`),
  KEY `fk_issue_type_id` (`type_id`),
  KEY `fk_issue_category_id` (`category_id`),
  KEY `fk_issue_status_id` (`status_id`),
  KEY `fk_issue_priority_id` (`priority_id`),
  KEY `fk_issue_author_id` (`author_id`),
  KEY `fk_issue_assigned_to` (`assigned_to`),
  KEY `fk_issue_fixed_version_id` (`fixed_version_id`),
  CONSTRAINT `fk_issue_assigned_to` FOREIGN KEY (`assigned_to`) REFERENCES `core_users` (`id`),
  CONSTRAINT `fk_issue_author_id` FOREIGN KEY (`author_id`) REFERENCES `core_users` (`id`),
  CONSTRAINT `fk_issue_category_id` FOREIGN KEY (`category_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_issue_fixed_version_id` FOREIGN KEY (`fixed_version_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_issue_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `core_issue` (`id`),
  CONSTRAINT `fk_issue_priority_id` FOREIGN KEY (`priority_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_issue_project_id` FOREIGN KEY (`project_id`) REFERENCES `core_projects` (`id`),
  CONSTRAINT `fk_issue_status_id` FOREIGN KEY (`status_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_issue_type_id` FOREIGN KEY (`type_id`) REFERENCES `core_list_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Задачи проекта';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_issue`
--

LOCK TABLES `core_issue` WRITE;
/*!40000 ALTER TABLE `core_issue` DISABLE KEYS */;
INSERT INTO `core_issue` VALUES (1,'Собрать сведения о транспорте',NULL,14,61,63,66,89,1,1,'','2021-10-10','2021-10-30',NULL,NULL,NULL,NULL,NULL,35,'Транспорт','Собрать сведения об имуществе','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(2,'Собрать сведения о недвижимости',NULL,14,61,63,66,89,1,1,'','2021-10-10','2021-10-30',NULL,NULL,NULL,NULL,NULL,35,'Недвижимость','Собрать сведения об имуществе','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(3,'Собрать сведения об имуществе',NULL,14,61,63,66,89,1,1,'','2021-10-10','2021-10-30',NULL,NULL,NULL,NULL,NULL,35,'Имущество','Собрать сведения об имуществе','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `core_issue` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_issue_before_update` BEFORE UPDATE ON `core_issue` FOR EACH ROW begin
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

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `core_list_info`
--

DROP TABLE IF EXISTS `core_list_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_list_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scope_id` bigint DEFAULT NULL,
  `object_type_id` bigint DEFAULT NULL,
  `list_name` varchar(255) DEFAULT NULL,
  `value_type_id` bigint DEFAULT NULL,
  `object_id` bigint DEFAULT NULL,
  `list_index` bigint DEFAULT NULL,
  `list_code` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_core_list_scope_id` (`scope_id`),
  KEY `fk_core_list_object_type_id` (`object_type_id`),
  KEY `fk_core_list_value_type_id` (`value_type_id`),
  CONSTRAINT `fk_core_list_object_type_id` FOREIGN KEY (`object_type_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_core_list_scope_id` FOREIGN KEY (`scope_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_core_list_value_type_id` FOREIGN KEY (`value_type_id`) REFERENCES `core_list_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Списки системных настроек, сгруппированных и упорядоченных (недоступно для изменения)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_list_info`
--

LOCK TABLES `core_list_info` WRITE;
/*!40000 ALTER TABLE `core_list_info` DISABLE KEYS */;
INSERT INTO `core_list_info` VALUES (1,1,1,'SYS.SCOPE',1,0,0,'SYSTEM','Система','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(2,1,1,'SYS.SCOPE',1,0,1,'PROJECT','Проект','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(3,1,1,'SYS.SCOPE',1,0,2,'ISSUE','Задача','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(4,1,1,'SYS.OBJECT_TYPE',1,0,0,'SYSTEM','Система','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(5,1,1,'SYS.OBJECT_TYPE',1,0,1,'PROJECT','Проект','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(6,1,1,'SYS.OBJECT_TYPE',1,0,2,'USER','Пользователь','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(7,1,1,'SYS.OBJECT_TYPE',1,0,3,'PROFILE','Профиль','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(8,1,1,'SYS.OBJECT_TYPE',1,0,4,'TEAM','Команда','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(9,1,1,'SYS.OBJECT_TYPE',1,0,5,'ISSUE','Задача','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(10,1,1,'SYS.VALUE_TYPE',1,0,0,'TEXT','Текст','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(11,1,1,'SYS.VALUE_TYPE',1,0,1,'MEDIA','Медиа','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(12,1,1,'SYS.VALUE_TYPE',1,0,2,'TAG','Тэг','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(13,1,1,'SYS.VALUE_TYPE',1,0,3,'LIST_REF','Ссылка на список','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(14,1,2,'SYS.PROJECT_TYPE',1,0,0,'BUSINESS','Бизнес','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(15,1,2,'SYS.PROJECT_TYPE',1,0,1,'IT','IT-область','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(16,1,2,'SYS.PROJECT_STATUS',1,0,0,'NEW','Новый','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(17,1,2,'SYS.PROJECT_STATUS',1,0,1,'WIP','В работе','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(18,1,2,'SYS.PROJECT_STATUS',1,0,2,'TEST','Тестирование','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(19,1,2,'SYS.PROJECT_STATUS',1,0,3,'PAUSED','Приостановлен','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(20,1,2,'SYS.PROJECT_STATUS',1,0,4,'CANCELLED','Отменен','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(21,1,2,'SYS.PROJECT_STATUS',1,0,5,'COMPLETED','Выполнен','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(22,1,2,'SYS.PROJECT_STATUS',1,0,6,'CLOSED','Закрыт','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(23,1,2,'SYS.PROJECT_PRIORITY',1,0,0,'LOW','Низкий','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(24,1,2,'SYS.PROJECT_PRIORITY',1,0,1,'NORMAL','Нормальный','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(25,1,2,'SYS.PROJECT_PRIORITY',1,0,2,'HIGH','Высокий','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(26,1,2,'SYS.PROJECT_PRIORITY',1,0,3,'CRITICAL','Критично','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(27,1,2,'SYS.PROJECT_CLASS',1,0,0,'HEALTH','Здоровье','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(28,1,2,'SYS.PROJECT_CLASS',1,0,1,'RELATIONS','Отношения','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(29,1,2,'SYS.PROJECT_CLASS',1,0,2,'VOCATION','Призвание','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(30,1,2,'SYS.PROJECT_CLASS',1,0,3,'SPIRITUALITY','Духовность','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(31,1,2,'SYS.PROJECT_CLASS',1,0,4,'LIFE_QUALITY','Яркость жизни','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(32,1,2,'SYS.PROJECT_CLASS',1,0,5,'INVENTORY','Имущество','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(33,1,2,'SYS.PROJECT_CLASS',1,0,6,'FINANCE','Финансы','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(34,1,2,'SYS.PROJECT_CLASS',1,0,7,'IT','Информация','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(35,1,2,'SYS.PROJECT_FIXED_VERSION',1,0,0,'INITIALIZATION','Инициализация','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(36,1,2,'SYS.PROJECT_FIXED_VERSION',1,0,1,'PLANNING','Планирование','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(37,1,2,'SYS.PROJECT_FIXED_VERSION',1,0,2,'REALIZATION','Реализация','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(38,1,2,'SYS.PROJECT_FIXED_VERSION',1,0,3,'FINISHING','Завершение','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(39,1,2,'SYS.PROJECT_CATEGORY',1,0,0,'FINANCE','Финансы','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(40,1,2,'SYS.PROJECT_CATEGORY',1,0,1,'IT','Информация','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(41,1,3,'SYS.USER_TYPE',1,0,0,'YOUNG','Подросток','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(42,1,3,'SYS.USER_TYPE',1,0,1,'ADULT','Взрослый','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(43,1,3,'SYS.USER_TYPE',1,0,2,'AGED','Пожилой','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(44,1,3,'SYS.USER_TYPE',1,0,3,'LEGAL_ENTITY','Юр.лицо, ИП','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(45,1,3,'SYS.USER_STATUS',1,0,0,'NEW','Новый','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(46,1,3,'SYS.USER_STATUS',1,0,1,'ACTIVE','Активный','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(47,1,3,'SYS.USER_STATUS',1,0,2,'INACTIVE','Неактивный','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(48,1,3,'SYS.USER_STATUS',1,0,3,'EXCLUDED','Исключен','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(49,1,4,'SYS.PROFILE_TYPE',1,0,0,'PHYSICAL_PERSON','Физ. лицо','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(50,1,4,'SYS.PROFILE_TYPE',1,0,1,'LEGAL_ENTITY','Юр.лицо, ИП','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(51,1,4,'SYS.PROFILE_STATUS',1,0,0,'NEW','Новый','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(52,1,4,'SYS.PROFILE_STATUS',1,0,1,'NOT_FILLED','Неполный','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(53,1,4,'SYS.PROFILE_STATUS',1,0,2,'FILLED','Полный','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(54,1,4,'SYS.PROFILE_STATUS',1,0,3,'ACTUALIZE','Актуализировать','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(55,1,5,'SYS.TEAM_TYPE',1,0,0,'PRIVATE','Частная','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(56,1,5,'SYS.TEAM_TYPE',1,0,1,'COMMERCIAL','Коммерческая','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(57,1,5,'SYS.TEAM_STATUS',1,0,0,'NEW','Новая','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(58,1,5,'SYS.TEAM_STATUS',1,0,1,'ACTIVE','Активная','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(59,1,5,'SYS.TEAM_STATUS',1,0,2,'INACTIVE','Неактивная','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(60,1,5,'SYS.TEAM_STATUS',1,0,3,'EXCLUDED','Исключена','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(61,1,6,'SYS.ISSUE_TYPE',1,0,0,'BUSINESS','Бизнес','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(62,1,6,'SYS.ISSUE_TYPE',1,0,1,'IT','IT-область','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(63,1,6,'SYS.ISSUE_CATEGORY',1,0,0,'TASK','Задача','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(64,1,6,'SYS.ISSUE_CATEGORY',1,0,1,'ERROR','Ошибка','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(65,1,6,'SYS.ISSUE_CATEGORY',1,0,2,'TO_PROD','Установка на ПРОД','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(66,1,6,'SYS.ISSUE_TASK_STATUS',1,0,0,'NEW','Новая','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(67,1,6,'SYS.ISSUE_TASK_STATUS',1,0,1,'CANCELLED','Отменено','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(68,1,6,'SYS.ISSUE_TASK_STATUS',1,0,2,'ASSIGNED','Назначено','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(69,1,6,'SYS.ISSUE_TASK_STATUS',1,0,3,'PAUSED','Ожидание','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(70,1,6,'SYS.ISSUE_TASK_STATUS',1,0,4,'WIP','В разработке','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(71,1,6,'SYS.ISSUE_TASK_STATUS',1,0,5,'COMPLETED','Выполнено','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(72,1,6,'SYS.ISSUE_TASK_STATUS',1,0,6,'CLOSED','Завершено','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(73,1,6,'SYS.ISSUE_ERROR_STATUS',1,0,0,'NEW','Новая','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(74,1,6,'SYS.ISSUE_ERROR_STATUS',1,0,1,'CANCELLED','Отменено','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(75,1,6,'SYS.ISSUE_ERROR_STATUS',1,0,2,'ASSIGNED','Назначено','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(76,1,6,'SYS.ISSUE_ERROR_STATUS',1,0,3,'PAUSED','Ожидание','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(77,1,6,'SYS.ISSUE_ERROR_STATUS',1,0,4,'WIP','В разработке','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(78,1,6,'SYS.ISSUE_ERROR_STATUS',1,0,5,'COMPLETED','Выполнено','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(79,1,6,'SYS.ISSUE_ERROR_STATUS',1,0,6,'CLOSED','Завершено','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(80,1,6,'SYS.ISSUE_PROD_STATUS',1,0,0,'NEW','Новая','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(81,1,6,'SYS.ISSUE_PROD_STATUS',1,0,1,'CANCELLED','Отменено','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(82,1,6,'SYS.ISSUE_PROD_STATUS',1,0,2,'TO_TEST','Установке на ТЕСТ','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(83,1,6,'SYS.ISSUE_PROD_STATUS',1,0,3,'TESTING','Тестирование','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(84,1,6,'SYS.ISSUE_PROD_STATUS',1,0,4,'APPROVEMENT','Согласование установки','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(85,1,6,'SYS.ISSUE_PROD_STATUS',1,0,5,'TO_PROD','Установка на ПРОД','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(86,1,6,'SYS.ISSUE_PROD_STATUS',1,0,6,'COMPLETED','Выполнено','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(87,1,6,'SYS.ISSUE_PROD_STATUS',1,0,7,'CLOSED','Завершено','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(88,1,6,'SYS.ISSUE_PRIORITY',1,0,0,'LOW','Низкий','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(89,1,6,'SYS.ISSUE_PRIORITY',1,0,1,'NORMAL','Нормальный','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(90,1,6,'SYS.ISSUE_PRIORITY',1,0,2,'HIGH','Высокий','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL),(91,1,6,'SYS.ISSUE_PRIORITY',1,0,3,'CRITICAL','Критично','2021-10-16 02:15:58','2021-10-16 02:15:58',0,0,NULL,NULL);
/*!40000 ALTER TABLE `core_list_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_profiles`
--

DROP TABLE IF EXISTS `core_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_profiles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type_id` bigint DEFAULT NULL,
  `status_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_profiles_type_id` (`type_id`),
  KEY `fk_profiles_status_id` (`status_id`),
  KEY `fk_profiles_user_id` (`user_id`),
  CONSTRAINT `fk_profiles_status_id` FOREIGN KEY (`status_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_profiles_type_id` FOREIGN KEY (`type_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_profiles_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Профили пользователей системы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_profiles`
--

LOCK TABLES `core_profiles` WRITE;
/*!40000 ALTER TABLE `core_profiles` DISABLE KEYS */;
INSERT INTO `core_profiles` VALUES (1,49,51,1,'2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL),(2,49,51,2,'2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL),(3,49,51,3,'2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL),(4,49,51,4,'2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `core_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_projects`
--

DROP TABLE IF EXISTS `core_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_projects` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `type_id` bigint NOT NULL,
  `status_id` bigint NOT NULL,
  `priority_id` bigint NOT NULL,
  `team_id` bigint NOT NULL,
  `author_id` bigint NOT NULL,
  `class_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `start_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `completion_date` date DEFAULT NULL,
  `fixed_version_id` bigint DEFAULT NULL,
  `git_repo` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_projects_parent_id` (`parent_id`),
  KEY `fk_projects_type_id` (`type_id`),
  KEY `fk_projects_status_id` (`status_id`),
  KEY `fk_projects_priority_id` (`priority_id`),
  KEY `fk_projects_team_id` (`team_id`),
  KEY `fk_projects_author_id` (`author_id`),
  KEY `fk_projects_class_id` (`class_id`),
  KEY `fk_projects_category_id` (`category_id`),
  CONSTRAINT `fk_projects_author_id` FOREIGN KEY (`author_id`) REFERENCES `core_users` (`id`),
  CONSTRAINT `fk_projects_category_id` FOREIGN KEY (`category_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_projects_class_id` FOREIGN KEY (`class_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_projects_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `core_projects` (`id`),
  CONSTRAINT `fk_projects_priority_id` FOREIGN KEY (`priority_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_projects_status_id` FOREIGN KEY (`status_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_projects_team_id` FOREIGN KEY (`team_id`) REFERENCES `core_team` (`id`),
  CONSTRAINT `fk_projects_type_id` FOREIGN KEY (`type_id`) REFERENCES `core_list_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Проекты системы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_projects`
--

LOCK TABLES `core_projects` WRITE;
/*!40000 ALTER TABLE `core_projects` DISABLE KEYS */;
INSERT INTO `core_projects` VALUES (1,'Семья-Здоровье-21',NULL,14,16,24,1,1,27,40,'2021-01-01','2021-12-31',NULL,37,'http://github.com','2021','Семья-Здоровье','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(2,'Семья-Отношения-21',NULL,14,16,24,1,1,28,40,'2021-01-01','2021-12-31',NULL,37,'http://github.com','2021','Семья-Отношения','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(3,'Семья-Призвание-21',NULL,14,16,24,1,1,29,40,'2021-01-01','2021-12-31',NULL,37,'http://github.com','2021','Семья-Призвание','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(4,'Семья-Духовность-21',NULL,14,16,24,1,1,30,40,'2021-01-01','2021-12-31',NULL,37,'http://github.com','2021','Семья-Духовность','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(5,'Семья-Яркость жизни-21',NULL,14,16,24,1,1,31,40,'2021-01-01','2021-12-31',NULL,37,'http://github.com','2021','Семья-Яркость жизни','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(6,'Семья-Имущество-21',NULL,14,16,24,1,1,32,40,'2021-01-01','2021-12-31',NULL,37,'http://github.com','2021','Семья-Имущество','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(7,'Семья-Финансы-21',NULL,14,16,24,1,1,33,40,'2021-01-01','2021-12-31',NULL,37,'http://github.com','2021','Семья-Финансы','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(8,'Семья-Информация-21',NULL,14,16,24,1,1,34,40,'2021-01-01','2021-12-31',NULL,37,'http://github.com','2021','Семья-Информация','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(9,'Семья-Здоровье-22',NULL,14,16,24,1,1,27,40,'2022-01-01','2022-12-31',NULL,35,'http://github.com','2022','Семья-Здоровье','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(10,'Семья-Отношения-22',NULL,14,16,24,1,1,28,40,'2022-01-01','2022-12-31',NULL,35,'http://github.com','2022','Семья-Отношения','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(11,'Семья-Призвание-22',NULL,14,16,24,1,1,29,40,'2022-01-01','2022-12-31',NULL,35,'http://github.com','2022','Семья-Призвание','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(12,'Семья-Духовность-22',NULL,14,16,24,1,1,30,40,'2022-01-01','2022-12-31',NULL,35,'http://github.com','2022','Семья-Духовность','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(13,'Семья-Яркость жизни-22',NULL,14,16,24,1,1,31,40,'2022-01-01','2022-12-31',NULL,35,'http://github.com','2022','Семья-Яркость жизни','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(14,'Семья-Имущество-22',NULL,14,16,24,1,1,32,40,'2022-01-01','2022-12-31',NULL,35,'http://github.com','2022','Семья-Имущество','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(15,'Семья-Финансы-22',NULL,14,16,24,1,1,33,40,'2022-01-01','2022-12-31',NULL,35,'http://github.com','2022','Семья-Финансы','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL),(16,'Семья-Информация-22',NULL,14,16,24,1,1,34,40,'2022-01-01','2022-12-31',NULL,35,'http://github.com','2022','Семья-Информация','','2021-10-16 02:16:14','2021-10-16 02:16:14',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `core_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_system`
--

DROP TABLE IF EXISTS `core_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_system` (
  `user_id` bigint DEFAULT NULL,
  `project_id` bigint DEFAULT NULL,
  `profile_id` bigint DEFAULT NULL,
  KEY `fk_system_user_id` (`user_id`),
  KEY `fk_system_project_id` (`project_id`),
  KEY `fk_system_profile_id` (`profile_id`),
  CONSTRAINT `fk_system_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `core_profiles` (`id`),
  CONSTRAINT `fk_system_project_id` FOREIGN KEY (`project_id`) REFERENCES `core_projects` (`id`),
  CONSTRAINT `fk_system_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Стартовая конфигурация системы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_system`
--

LOCK TABLES `core_system` WRITE;
/*!40000 ALTER TABLE `core_system` DISABLE KEYS */;
INSERT INTO `core_system` VALUES (1,14,NULL);
/*!40000 ALTER TABLE `core_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_team`
--

DROP TABLE IF EXISTS `core_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_team` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parent_id` bigint DEFAULT NULL,
  `type_id` bigint DEFAULT NULL,
  `status_id` bigint DEFAULT NULL,
  `profile_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `user_role_id` bigint DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_team_parent_id` (`parent_id`),
  KEY `fk_team_type_id` (`type_id`),
  KEY `fk_team_status_id` (`status_id`),
  KEY `fk_team_profile_id` (`profile_id`),
  KEY `fk_team_user_id` (`user_id`),
  CONSTRAINT `fk_team_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `core_team` (`id`),
  CONSTRAINT `fk_team_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `core_profiles` (`id`),
  CONSTRAINT `fk_team_status_id` FOREIGN KEY (`status_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_team_type_id` FOREIGN KEY (`type_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_team_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Команды (группы) пользователей системы';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_team`
--

LOCK TABLES `core_team` WRITE;
/*!40000 ALTER TABLE `core_team` DISABLE KEYS */;
INSERT INTO `core_team` VALUES (1,'Семья Ивановых',NULL,55,57,NULL,1,0,'2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL),(2,'Семья Ивановых',NULL,55,57,NULL,2,0,'2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL),(3,'Семья Ивановых',NULL,55,57,NULL,3,0,'2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL),(4,'Семья Ивановых',NULL,55,57,NULL,4,0,'2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `core_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_users`
--

DROP TABLE IF EXISTS `core_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `type_id` bigint DEFAULT NULL,
  `status_id` bigint DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `password_hash` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_type_id` (`type_id`),
  KEY `fk_users_status_id` (`status_id`),
  CONSTRAINT `fk_users_status_id` FOREIGN KEY (`status_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_users_type_id` FOREIGN KEY (`type_id`) REFERENCES `core_list_info` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователи системы, контрагенты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_users`
--

LOCK TABLES `core_users` WRITE;
/*!40000 ALTER TABLE `core_users` DISABLE KEYS */;
INSERT INTO `core_users` VALUES (1,'Иван','Иванович','Иванов',42,45,'IVANOV_II','0xFFFFFFFF','M','1980-02-29','2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL),(2,'Анна','Петровна','Иванова',42,45,'IVANOVA_AP','0xFFFFFFFF','F','1980-12-31','2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL),(3,'Андрей','Иванович','Иванов',42,45,'IVANOV_AI','0xFFFFFFFF','M','2000-02-23','2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL),(4,'Ольга','Ивановна','Иванова',41,45,'IVANOVA_OI','0xFFFFFFFF','F','2004-03-08','2021-10-16 02:16:13','2021-10-16 02:16:13',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `core_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_list_info`
--

DROP TABLE IF EXISTS `custom_list_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_list_info` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `scope_id` bigint DEFAULT NULL,
  `object_type_id` bigint DEFAULT NULL,
  `list_name` varchar(255) DEFAULT NULL,
  `value_type_id` bigint DEFAULT NULL,
  `object_id` bigint DEFAULT NULL,
  `list_index` bigint DEFAULT NULL,
  `list_code` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_custom_list_scope_id` (`scope_id`),
  KEY `fk_custom_list_object_type_id` (`object_type_id`),
  KEY `fk_custom_list_value_type_id` (`value_type_id`),
  CONSTRAINT `fk_custom_list_object_type_id` FOREIGN KEY (`object_type_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_custom_list_scope_id` FOREIGN KEY (`scope_id`) REFERENCES `core_list_info` (`id`),
  CONSTRAINT `fk_custom_list_value_type_id` FOREIGN KEY (`value_type_id`) REFERENCES `core_list_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Списки системных настроек, сгруппированных и упорядоченных (недоступно для изменения)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_list_info`
--

LOCK TABLES `custom_list_info` WRITE;
/*!40000 ALTER TABLE `custom_list_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_list_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `object_type_id` bigint DEFAULT NULL,
  `object_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `spent_time` decimal(19,4) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_journal_user_id` (`user_id`),
  CONSTRAINT `fk_journal_user_id` FOREIGN KEY (`user_id`) REFERENCES `core_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_core_list_values`
--

DROP TABLE IF EXISTS `v_core_list_values`;
/*!50001 DROP VIEW IF EXISTS `v_core_list_values`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_core_list_values` AS SELECT 
 1 AS `id`,
 1 AS `list_name`,
 1 AS `list_code`,
 1 AS `value`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_issues`
--

DROP TABLE IF EXISTS `v_issues`;
/*!50001 DROP VIEW IF EXISTS `v_issues`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_issues` AS SELECT 
 1 AS `id`,
 1 AS `project`,
 1 AS `name`,
 1 AS `subject`,
 1 AS `start_date`,
 1 AS `due_date`,
 1 AS `category`,
 1 AS `type`,
 1 AS `status`,
 1 AS `priority`,
 1 AS `author`,
 1 AS `assignee`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_core_list_values`
--

/*!50001 DROP VIEW IF EXISTS `v_core_list_values`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_core_list_values` AS select `cli`.`id` AS `id`,`cli`.`list_name` AS `list_name`,`cli`.`list_code` AS `list_code`,`cli`.`value` AS `value` from `core_list_info` `cli` where ((`cli`.`valid_from` is null) and (`cli`.`valid_to` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_issues`
--

/*!50001 DROP VIEW IF EXISTS `v_issues`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_issues` AS select `i`.`id` AS `id`,`cp`.`name` AS `project`,`i`.`name` AS `name`,`i`.`subject` AS `subject`,`i`.`start_date` AS `start_date`,`i`.`due_date` AS `due_date`,`cli_cat`.`value` AS `category`,`cli_typ`.`value` AS `type`,`cli_sta`.`value` AS `status`,`cli_pri`.`value` AS `priority`,concat(`u_aut`.`first_name`,' ',`u_aut`.`last_name`) AS `author`,concat(`u_asn`.`first_name`,' ',`u_asn`.`last_name`) AS `assignee` from (((((((`core_issue` `i` join `core_projects` `cp` on((`cp`.`id` = `i`.`project_id`))) join `core_list_info` `cli_cat` on((`cli_cat`.`id` = `i`.`category_id`))) join `core_list_info` `cli_typ` on((`cli_typ`.`id` = `i`.`type_id`))) join `core_list_info` `cli_sta` on((`cli_sta`.`id` = `i`.`status_id`))) join `core_list_info` `cli_pri` on((`cli_pri`.`id` = `i`.`priority_id`))) join `core_users` `u_aut` on((`u_aut`.`id` = `i`.`author_id`))) join `core_users` `u_asn` on((`u_asn`.`id` = `i`.`assigned_to`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-16  2:22:30
