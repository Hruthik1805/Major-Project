-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 04, 2021 at 12:15 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `heart_disease_identification`
--
CREATE DATABASE IF NOT EXISTS `heart_disease_identification` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `heart_disease_identification`;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add client register_ model', 7, 'add_clientregister_model'),
(20, 'Can change client register_ model', 7, 'change_clientregister_model'),
(21, 'Can delete client register_ model', 7, 'delete_clientregister_model'),
(22, 'Can add client posts_ model', 8, 'add_clientposts_model'),
(23, 'Can change client posts_ model', 8, 'change_clientposts_model'),
(24, 'Can delete client posts_ model', 8, 'delete_clientposts_model'),
(25, 'Can add feedbacks_ model', 9, 'add_feedbacks_model'),
(26, 'Can change feedbacks_ model', 9, 'change_feedbacks_model'),
(27, 'Can delete feedbacks_ model', 9, 'delete_feedbacks_model');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(8, 'Client_Site', 'clientposts_model'),
(7, 'Client_Site', 'clientregister_model'),
(9, 'Client_Site', 'feedbacks_model'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Remote_User', '0001_initial', '2019-04-23 07:01:48.050781'),
(2, 'contenttypes', '0001_initial', '2019-04-23 07:01:49.494140'),
(3, 'auth', '0001_initial', '2019-04-23 07:02:03.837890'),
(4, 'admin', '0001_initial', '2019-04-23 07:02:05.832031'),
(5, 'admin', '0002_logentry_remove_auto_add', '2019-04-23 07:02:05.863281'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-04-23 07:02:07.041015'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-04-23 07:02:07.839843'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-04-23 07:02:08.330078'),
(9, 'auth', '0004_alter_user_username_opts', '2019-04-23 07:02:08.361328'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-04-23 07:02:08.921875'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-04-23 07:02:08.953125'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-04-23 07:02:08.989257'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-04-23 07:02:09.785156'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-04-23 07:02:10.580078'),
(15, 'sessions', '0001_initial', '2019-04-23 07:02:11.764648'),
(16, 'Remote_User', '0002_clientposts_model', '2019-04-25 05:53:57.702132'),
(17, 'Remote_User', '0003_clientposts_model_usefulcounts', '2019-04-25 10:00:02.521468'),
(18, 'Remote_User', '0004_auto_20190429_1027', '2019-04-29 04:57:32.672296'),
(19, 'Remote_User', '0005_clientposts_model_dislikes', '2019-04-29 05:15:16.668390'),
(20, 'Remote_User', '0006_Review_model', '2019-04-29 05:19:26.382257'),
(21, 'Remote_User', '0007_clientposts_model_names', '2019-04-30 04:45:46.472656');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0jpcgnd1gmwbp3e8tw54e6nxjylsogyo', 'YmM4NjE0MDQ2MzBmYWIxNzIzNTkxZjBiN2I5M2MxMzQyYTE0YmMxODp7InVzZXJpZCI6Mn0=', '2020-02-21 08:52:28.687500'),
('49qo7iki5uxczhyymi8ka7dnh6a2wva5', 'MmE4N2EzZmM3NTI1ODc3MjUxYjUxNWM3OWM4ZGExNWViMzRkN2MzYTp7Im5hbWUiOjF9', '2019-05-08 09:19:45.486328'),
('4df7s82pddaszour6twx23d86058ppjq', 'ZmNkODA5MmI1ZGQ0Yjk5MmZlNzEyNTcwNTcxNjk2ZWYxZTE3NThkMjp7InVzZXJpZCI6NX0=', '2020-11-23 11:49:21.396484'),
('4x6b78w9rfcn34v650kd2j7oij6atr8p', 'Zjk0Y2RlYjc4OTJhNWMyZjQyNmM4ZGRhYTVjNmVlNDFhZGE4ZmU3NTp7InVzZXJpZCI6Nn0=', '2019-12-27 12:07:42.082031'),
('b9cu6cjsfqfm5mame5dy1ikpiiy7yn3w', 'OTk3NTk2YTE0NjM5MWQ0OGQ0MjY3NzBjNzdhOTc0ZWJhM2ZkMzdkMjp7InVzZXJpZCI6MX0=', '2019-05-09 11:00:08.480453'),
('ct13q5fpn94zvnij8ekixwzcky2imc5e', 'YWUzM2IzMWJiYmQ3YmY2YzlkMGFlNTM1YmU5ZGM4YjQ0MmY1YTc0NTp7InVzZXJpZCI6NH0=', '2019-05-14 11:44:10.978515'),
('e07j4duysh402dedtomm8icctvs9ljgy', 'MmE4N2EzZmM3NTI1ODc3MjUxYjUxNWM3OWM4ZGExNWViMzRkN2MzYTp7Im5hbWUiOjF9', '2019-05-09 06:08:12.306625'),
('hbv74sg6w6e4wp89vq807vw0xhkh5s1h', 'MzU0ZWYzNTQ3MjM4MWZlOTVjM2M1MWQ4MmE5ODE0OTlkNDRkNDkwMDp7InVzZXJpZCI6MX0=', '2020-01-10 07:40:38.067382'),
('hhtt48je70l9nzw6dee4ocuxxm9blqej', 'NGRhY2JkNmQ4ZTM4OTU0Y2UzMzFlZmZmOTgzYmE0MWVkOThiNjc2NTp7Im5hbWUiOjEsInVzZXJpZCI6MX0=', '2019-05-09 10:12:38.380843'),
('o7x1vhluuypdfmgv7fmv6nohgfn5ub55', 'NzMyZjlhNzFhZjk2ZGUzZmFiMmIzYjMwNTJkYTg5MDUzNmNlMDk4Mjp7InVzZXJpZCI6MTZ9', '2020-01-02 12:51:55.659179'),
('qnaolidvfx6bu9ra3uyqvkgva7bv92f1', 'OTk3NTk2YTE0NjM5MWQ0OGQ0MjY3NzBjNzdhOTc0ZWJhM2ZkMzdkMjp7InVzZXJpZCI6MX0=', '2019-05-14 05:34:50.069335'),
('tejgl09oettnyva23kqdbns5nfz5g8ug', 'OTk3NTk2YTE0NjM5MWQ0OGQ0MjY3NzBjNzdhOTc0ZWJhM2ZkMzdkMjp7InVzZXJpZCI6MX0=', '2019-05-09 11:19:24.387679'),
('u5icgvq3qt5nthdlv99go3r804ccghbo', 'MmE4N2EzZmM3NTI1ODc3MjUxYjUxNWM3OWM4ZGExNWViMzRkN2MzYTp7Im5hbWUiOjF9', '2019-05-09 06:00:13.573226'),
('zega5sz46ivu1tb1o1mtmg3v2ysxog1w', 'eyJ1c2VyaWQiOjh9:1kuaiJ:kW-jQwhm_s6sUpTq1h_DEDbguuOBrMPBzBsF2IHsJZs', '2021-01-13 12:36:27.519912');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_clientregister_model`
--

CREATE TABLE IF NOT EXISTS `remote_user_clientregister_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phoneno` varchar(50) NOT NULL,
  `country` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `remote_user_clientregister_model`
--

INSERT INTO `remote_user_clientregister_model` (`id`, `username`, `email`, `password`, `phoneno`, `country`, `state`, `city`) VALUES
(7, 'Swathi', 'Swathi.123@gmail.com', 'Swathi', '9535866270', 'India', 'Karnataka', 'Bangalore'),
(8, 'Manjunath', 'tmksmanju13@gmail.com', 'Manjunath', '9535866270', 'India', 'Karnataka', 'Bangalore');

-- --------------------------------------------------------

--
-- Table structure for table `remote_user_heart_disease_model`
--

CREATE TABLE IF NOT EXISTS `remote_user_heart_disease_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(300) NOT NULL,
  `age` varchar(300) NOT NULL,
  `sex` varchar(300) NOT NULL,
  `chest_pain` varchar(300) NOT NULL,
  `resting_bp` int(11) NOT NULL,
  `serum_cholesterol` int(11) NOT NULL,
  `fasting_blood_sugar` int(11) NOT NULL,
  `resting_electro_cardiographic` varchar(300) NOT NULL,
  `max_heart_rate` int(11) NOT NULL,
  `exercise_induced_angina` varchar(300) NOT NULL,
  `depression_induced_by_exercise` varchar(300) NOT NULL,
  `fluoroscopy` varchar(300) NOT NULL,
  `thallium_scan` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
