-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 23, 2013 at 07:51 PM
-- Server version: 5.5.31
-- PHP Version: 5.3.10-1ubuntu3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bms`
--

-- --------------------------------------------------------

--
-- Table structure for table `Item`
--

CREATE TABLE IF NOT EXISTS `Item` (
  `item_id` int(8) NOT NULL AUTO_INCREMENT,
  `item_product_id` int(8) NOT NULL,
  `item_price` double NOT NULL,
  `item_discount` int(3) DEFAULT NULL,
  `item_quantity` int(3) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Job`
--

CREATE TABLE IF NOT EXISTS `Job` (
  `job_id` int(8) NOT NULL AUTO_INCREMENT,
  `job_title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `job_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `job_description` text COLLATE utf8_unicode_ci NOT NULL,
  `job_date` date NOT NULL,
  `job_time` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `job_names` text COLLATE utf8_unicode_ci NOT NULL,
  `job_address` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `job_city` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `job_state` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `job_zip` int(5) NOT NULL,
  `job_discount` int(3) NOT NULL,
  `job_status` int(3) NOT NULL,
  `job_template` int(1) NOT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Job`
--

INSERT INTO `Job` (`job_id`, `job_title`, `job_type`, `job_description`, `job_date`, `job_time`, `job_names`, `job_address`, `job_city`, `job_state`, `job_zip`, `job_discount`, `job_status`, `job_template`) VALUES
(1, 'Test', 'Newborn', 'This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  This is a test job description.  ', '2013-04-02', '1200', '', '1111 Farris Way', 'San Antonio', 'TX', 78109, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Modules`
--

CREATE TABLE IF NOT EXISTS `Modules` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `module_enabled` int(1) NOT NULL,
  `module_hook_order` int(2) DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `module_name` (`module_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `Modules`
--

INSERT INTO `Modules` (`module_id`, `module_name`, `module_enabled`, `module_hook_order`) VALUES
(1, 'login', 1, 0),
(2, 'index', 1, 0),
(3, 'item', 1, 0),
(4, 'person', 1, 0),
(5, 'photo', 1, 0),
(6, 'product', 1, 0),
(7, 'task', 1, 0),
(8, 'search', 1, 0),
(9, 'logout', 1, 0),
(11, 'person_hook_assigned_jobs', 1, 1),
(12, 'person_hook_assigned_task', 1, 2),
(13, 'person_hook_assigned_person', 1, 3),
(14, 'person_hook_assigned_photos', 1, 4),
(15, 'job', 1, 0),
(16, 'timesheet', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Person`
--

CREATE TABLE IF NOT EXISTS `Person` (
  `person_id` int(8) NOT NULL AUTO_INCREMENT,
  `person_username` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `person_firstname` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `person_lastname` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `person_company` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `person_mobile` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_home` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_address` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_city` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_state` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_zip` int(5) DEFAULT NULL,
  `person_email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `person_recommended` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_adverttype` int(1) DEFAULT NULL,
  `person_created` date NOT NULL,
  `person_password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `person_password_salt` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `person_password_attempts` int(1) DEFAULT NULL,
  `person_last_attempt` date DEFAULT NULL,
  `person_permissions` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `person_enabled` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`person_id`),
  KEY `person_username` (`person_username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `Person`
--

INSERT INTO `Person` (`person_id`, `person_username`, `person_firstname`, `person_lastname`, `person_company`, `person_mobile`, `person_home`, `person_address`, `person_city`, `person_state`, `person_zip`, `person_email`, `person_recommended`, `person_adverttype`, `person_created`, `person_password`, `person_password_salt`, `person_password_attempts`, `person_last_attempt`, `person_permissions`, `person_enabled`) VALUES
(1, 'TParis', 'Andrew', 'Pearson', 'Pearson Web Design', '210-488-1258', '210-658-6585', '7203 Autumn Acres', 'Converse', 'TX', 78109, 'tparis00ap@hotmail.com', 'Laura', 1, '2013-02-18', 'b20f8da7b8fcdce055b288d798119fe5', 'ABCD', 0, '0000-00-00', 'a:4:{s:8:"hasAdmin";b:1;s:10:"UsersAdmin";b:1;s:12:"ModulesAdmin";b:1;s:17:"ModulePermissions";a:4:{s:13:"Person_1_Read";b:1;s:14:"Person_1_Write";b:0;s:10:"Job_1_Read";b:1;s:11:"Job_1_Write";b:1;}}', b'1'),
(2, 'and', 'Andrew', 'Pills', 'Pills'' Pills', NULL, NULL, '3736 Elmira Rd', 'Eugene', 'OR', 97402, '', NULL, NULL, '0000-00-00', '', '', NULL, NULL, '', b'1'),
(3, 'GermPP', 'Jeremy', 'Parsons', 'ITU', '830-328-9125', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '0000-00-00', '', '', NULL, NULL, '', b'1'),
(4, 'Tory', 'Tory', 'Adams', '', '', '', '', '', '', 0, '', '', 0, '2013-06-23', '0d96c34bc3472fef0533e2b7d4af9ee9', 'tory', 0, '0000-00-00', 'a:4:{s:8:"hasAdmin";b:1;s:10:"UsersAdmin";b:1;s:12:"ModulesAdmin";b:1;s:17:"ModulePermissions";a:4:{s:13:"Person_1_Read";b:1;s:14:"Person_1_Write";b:0;s:10:"Job_1_Read";b:1;s:11:"Job_1_Write";b:1;}}', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `Photo`
--

CREATE TABLE IF NOT EXISTS `Photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `photo_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE IF NOT EXISTS `Product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `product_description` text COLLATE utf8_unicode_ci NOT NULL,
  `product_size` text COLLATE utf8_unicode_ci,
  `product_price` double NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Relations`
--

CREATE TABLE IF NOT EXISTS `Relations` (
  `parent_module_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_module_id` int(8) NOT NULL,
  `left` int(8) NOT NULL,
  `right` int(8) NOT NULL,
  KEY `parent_module` (`parent_module_name`,`parent_module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Relations`
--

INSERT INTO `Relations` (`parent_module_name`, `parent_module_id`, `left`, `right`) VALUES
('Timesheet', 2, 2, 3),
('Person', 1, 1, 12),
('Timesheet', 1, 5, 6),
('Person', 2, 4, 7),
('Job', 1, 8, 9),
('Task', 1, 10, 11);

-- --------------------------------------------------------

--
-- Table structure for table `Search_columns`
--

CREATE TABLE IF NOT EXISTS `Search_columns` (
  `search_table` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `search_column` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `search_search` int(11) NOT NULL,
  `search_display` int(1) NOT NULL,
  `search_display_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `search_order` int(2) NOT NULL,
  PRIMARY KEY (`search_table`,`search_column`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Search_columns`
--

INSERT INTO `Search_columns` (`search_table`, `search_column`, `search_search`, `search_display`, `search_display_title`, `search_order`) VALUES
('Person', 'person_username', 1, 1, 'Username', 1),
('Person', 'person_firstname', 1, 0, '', 6),
('Person', 'person_lastname', 1, 0, '', 7),
('Person', 'person_mobile', 1, 0, '', 8),
('Person', 'person_home', 1, 0, '', 9),
('Person', 'person_address', 1, 0, '', 10),
('Person', 'person_zip', 1, 0, '', 11),
('Person', 'person_state', 1, 0, '', 12),
('Person', 'person_email', 1, 1, 'Email', 3),
('Person', 'person_recommended', 1, 0, '', 13),
('Job', 'job_description', 1, 0, '', 4),
('Job', 'job_date', 1, 1, 'Date', 3),
('Job', 'job_names', 1, 1, 'Job title', 1),
('Job', 'job_location', 1, 1, 'Job location', 2),
('Person', 'Person_created', 0, 1, 'Created', 4),
('Person', 'Person_enabled', 0, 1, 'Enabled', 5),
('Person', 'person_company', 1, 1, 'Company', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Search_objects`
--

CREATE TABLE IF NOT EXISTS `Search_objects` (
  `Search_table` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `Search_object` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Search_table`),
  UNIQUE KEY `Search_table` (`Search_table`,`Search_object`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Search_objects`
--

INSERT INTO `Search_objects` (`Search_table`, `Search_object`) VALUES
('Person', 'CONCAT(person_firstname, " ", person_lastname)');

-- --------------------------------------------------------

--
-- Table structure for table `Task`
--

CREATE TABLE IF NOT EXISTS `Task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `task_description` text COLLATE utf8_unicode_ci NOT NULL,
  `task_status` int(3) NOT NULL,
  `task_cost` double DEFAULT NULL,
  PRIMARY KEY (`task_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Task`
--

INSERT INTO `Task` (`task_id`, `task_name`, `task_description`, `task_status`, `task_cost`) VALUES
(1, 'Test', 'Test of the tasks', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Timesheet`
--

CREATE TABLE IF NOT EXISTS `Timesheet` (
  `timesheet_id` int(6) NOT NULL AUTO_INCREMENT,
  `timesheet_invoice_num` varchar(16) NOT NULL,
  `timesheet_last_update` date NOT NULL,
  `timesheet_hours_paid` int(11) NOT NULL,
  `timesheet_expire_type` int(1) DEFAULT NULL,
  `timesheet_infinite_hours` int(1) DEFAULT NULL,
  `timesheet_expire_effective_date` int(11) NOT NULL,
  PRIMARY KEY (`timesheet_id`),
  UNIQUE KEY `timesheet_invoice_num` (`timesheet_invoice_num`),
  KEY `timesheet_hours_paid` (`timesheet_hours_paid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Timesheet`
--

INSERT INTO `Timesheet` (`timesheet_id`, `timesheet_invoice_num`, `timesheet_last_update`, `timesheet_hours_paid`, `timesheet_expire_type`, `timesheet_infinite_hours`, `timesheet_expire_effective_date`) VALUES
(1, 'TEST0001', '0000-00-00', 50, 1, 0, 0),
(2, 'TEST0002', '2013-06-12', 123, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Timesheet_log`
--

CREATE TABLE IF NOT EXISTS `Timesheet_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_timesheet_id` int(11) NOT NULL,
  `log_date` int(11) NOT NULL,
  `log_poc_name` varchar(32) DEFAULT NULL,
  `log_poc_phone` varchar(13) DEFAULT NULL,
  `log_time_in` int(11) DEFAULT NULL,
  `log_time_out` int(11) DEFAULT NULL,
  `log_lunch_hrs` int(11) DEFAULT NULL,
  `log_comments` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_timesheet_id` (`log_timesheet_id`),
  KEY `log_date` (`log_date`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `Timesheet_log`
--

INSERT INTO `Timesheet_log` (`log_id`, `log_timesheet_id`, `log_date`, `log_poc_name`, `log_poc_phone`, `log_time_in`, `log_time_out`, `log_lunch_hrs`, `log_comments`) VALUES
(1, 1, 2013, 'Andrew Pearson', '111-111-1111', 1371454200, 1371486600, 3600, 'Test'),
(2, 1, 2013, 'Andrew Pearson', '111-111-1111', 1371281400, 1371317400, 3600, 'asdasdasdasdsadsasd'),
(3, 2, 2013, 'asdsad', '0', 7200, 123213, 7200, '123'),
(4, 1, 0, 'asd', 'asd', 1368784800, 1368813600, 7200, 'asd'),
(5, 1, 123, '123', '123', 1368518400, 1368547200, 3600, 'asdasd'),
(6, 1, 123123, '123123', '123123', 1368342000, 1368374400, 3600, '12312312'),
(7, 1, 231, '123', '123', 1368604800, 1368622800, 3600, '123123123');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
