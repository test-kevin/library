# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Hôte: 127.0.0.1 (MySQL 5.5.38)
# Base de données: ota
# Temps de génération: 2014-06-05 14:13:05 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Affichage de la table _booking_invoice_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_booking_invoice_items`;

CREATE TABLE `_booking_invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `passenger_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_type` enum('sale','refund') COLLATE utf8_unicode_ci NOT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `currency` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','paid','deleted','failed','refunded','voided') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `net_fare` decimal(10,2) NOT NULL,
  `base_fare` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `comission` decimal(10,2) NOT NULL,
  `customer_amount` decimal(10,2) NOT NULL,
  `internal_amount` decimal(10,2) NOT NULL,
  `fop` enum('cheque','credit_card') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'credit_card',
  `billing_info_id` int(11) DEFAULT NULL,
  `payment_processor` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gds_account_id` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `paid_by` int(11) DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `paid_transaction_id` int(11) DEFAULT NULL,
  `parent_item_id` int(11) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `statement_item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='models removed in commit 2827b22386d5f06e6ee653dc099addb141f';



# Affichage de la table _booking_invoices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `_booking_invoices`;

CREATE TABLE `_booking_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `status` enum('closed','voided','open') NOT NULL,
  `closed_date` datetime NOT NULL,
  `closed_by` int(11) NOT NULL,
  `voided_by` int(11) DEFAULT NULL,
  `voided_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='models removed in commit 2827b22386d5f06e6ee653dc099addb141f';



# Affichage de la table ac2u_promo_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ac2u_promo_codes`;

CREATE TABLE `ac2u_promo_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `description` text,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table account_searches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_searches`;

CREATE TABLE `account_searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `seg0_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg0_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg0_date` date DEFAULT NULL,
  `seg0_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg1_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg1_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg1_date` date DEFAULT NULL,
  `seg1_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg2_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg2_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg2_date` date DEFAULT NULL,
  `seg2_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg3_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg3_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg3_date` date DEFAULT NULL,
  `seg3_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg4_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg4_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg4_date` date DEFAULT NULL,
  `seg4_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flexible_date` tinyint(1) DEFAULT '0',
  `nearby_airports` tinyint(1) DEFAULT '0',
  `no_penalty` tinyint(1) DEFAULT '0',
  `num_adults` int(2) DEFAULT '0',
  `num_children` int(2) DEFAULT '0',
  `num_infants` int(2) DEFAULT '0',
  `num_infants_lap` int(2) DEFAULT '0',
  `date_added` datetime NOT NULL,
  `preferred_carrier_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seat_class` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `non_stop` tinyint(1) DEFAULT '0',
  `no_penalties` tinyint(1) DEFAULT '0',
  `num_segments` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table account_travellers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account_travellers`;

CREATE TABLE `account_travellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `gender` enum('M','F') COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `ff_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ff_airline_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meal_preference_code` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accounts`;

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('blacklisted','whitelisted') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `main_traveller_id` int(11) DEFAULT NULL,
  `login_hash` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `password_reset_req` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ad_searches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ad_searches`;

CREATE TABLE `ad_searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(5) DEFAULT '2',
  `seg0_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg0_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg0_from_continent_id` int(3) DEFAULT NULL,
  `seg0_to_continent_id` int(3) DEFAULT NULL,
  `seg0_date` date DEFAULT NULL,
  `seg0_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg1_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg1_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg1_from_continent_id` int(3) DEFAULT NULL,
  `seg1_to_continent_id` int(3) DEFAULT NULL,
  `seg1_date` date DEFAULT NULL,
  `seg1_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg2_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg2_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg2_from_continent_id` int(3) DEFAULT NULL,
  `seg2_to_continent_id` int(3) DEFAULT NULL,
  `seg2_date` date DEFAULT NULL,
  `seg2_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg3_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg3_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg3_from_continent_id` int(3) DEFAULT NULL,
  `seg3_to_continent_id` int(3) DEFAULT NULL,
  `seg3_date` date DEFAULT NULL,
  `seg3_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg4_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg4_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg4_from_continent_id` int(3) DEFAULT NULL,
  `seg4_to_continent_id` int(3) DEFAULT NULL,
  `seg4_date` date DEFAULT NULL,
  `seg4_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flexible_date` tinyint(1) DEFAULT '0',
  `nearby_airports` tinyint(1) DEFAULT '0',
  `no_penalty` tinyint(1) DEFAULT '0',
  `num_adults` int(2) DEFAULT '0',
  `num_children` int(2) DEFAULT '0',
  `num_infants` int(2) DEFAULT '0',
  `num_infants_lap` int(2) DEFAULT '0',
  `date_added` datetime NOT NULL,
  `preferred_carrier_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seat_class` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `non_stop` tinyint(1) DEFAULT '0',
  `no_penalties` tinyint(1) DEFAULT '0',
  `num_segments` int(1) DEFAULT '0',
  `supplier1_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `supplier1_best_fare` decimal(10,2) NOT NULL,
  `supplier2_code` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier2_best_fare` decimal(10,2) DEFAULT NULL,
  `supplier3_code` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier3_best_fare` decimal(10,2) DEFAULT NULL,
  `supplier4_code` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier4_best_fare` decimal(10,2) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id-date_added-seg0_date` (`site_id`,`seg0_date`,`date_added`),
  KEY `site_id` (`site_id`,`date_added`),
  KEY `seg0_from` (`seg0_from`,`seg0_to`),
  KEY `supplier_origins` (`supplier1_code`,`seg0_from`,`seg0_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table adm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adm`;

CREATE TABLE `adm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_number` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `create_date` datetime NOT NULL,
  `update_date` datetime DEFAULT NULL,
  `resolve_date` datetime DEFAULT NULL,
  `create_agent` int(11) NOT NULL,
  `update_agent` int(11) DEFAULT NULL,
  `airline_code` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `settled_amount` decimal(10,2) DEFAULT NULL,
  `fees` decimal(10,2) DEFAULT NULL,
  `currency` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `source` enum('bsp','supplier','merchant') COLLATE utf8_unicode_ci NOT NULL,
  `reason` text COLLATE utf8_unicode_ci,
  `note` text COLLATE utf8_unicode_ci,
  `adm_type` enum('fraud','dispute','commission','missing_items','fare','fare_advance_purchase','fare_invalid','fare_system_issue','hx_segment','exchange','other','web_fare') COLLATE utf8_unicode_ci NOT NULL,
  `adm_status` enum('active','deleted') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `dispute_type` enum('pending','gds','airline','merchant','supplier','not_disputed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `dispute_status` enum('pending','in_progress','rejected','approved','settled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `agent_error` tinyint(1) NOT NULL DEFAULT '0',
  `more_action_required` tinyint(1) NOT NULL DEFAULT '0',
  `reviewed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table adm_bookings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adm_bookings`;

CREATE TABLE `adm_bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adm_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adm_id_2` (`adm_id`,`booking_id`),
  KEY `booking_id` (`booking_id`),
  KEY `adm_id` (`adm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table adm_tickets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `adm_tickets`;

CREATE TABLE `adm_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adm_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adm_id_2` (`adm_id`,`ticket_id`),
  KEY `adm_id` (`adm_id`),
  KEY `ticket_id` (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table affiliate_campaigns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affiliate_campaigns`;

CREATE TABLE `affiliate_campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siid` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `status` enum('active','deleted','suspended') COLLATE utf8_unicode_ci NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `old_program` int(11) DEFAULT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_type` enum('meta','compare','sem','retargeting','direct','other') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'other',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table affiliate_kayak_pixel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affiliate_kayak_pixel`;

CREATE TABLE `affiliate_kayak_pixel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `click_id` varchar(200) NOT NULL,
  `search_id` varchar(200) DEFAULT NULL,
  `package_id` varchar(200) DEFAULT NULL,
  `remote_addr` varchar(200) DEFAULT NULL,
  `server_addr` varchar(200) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table affiliate_landing_pages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affiliate_landing_pages`;

CREATE TABLE `affiliate_landing_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `internal_only` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table affiliate_payments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affiliate_payments`;

CREATE TABLE `affiliate_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `affiliate_id` int(11) NOT NULL,
  `payment_period_start` date NOT NULL,
  `payment_period_interval_unit` enum('day','week','month','year') COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_period_interval_quantity` int(11) DEFAULT NULL,
  `payment_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `adjusted_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('active','deleted','suspended','paid','pending') COLLATE utf8_unicode_ci NOT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `payment_method` enum('paypal','wire','check') COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_paid` datetime DEFAULT NULL,
  `transaction_reference` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table affiliate_program_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affiliate_program_access`;

CREATE TABLE `affiliate_program_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_program_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `symlink` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table affiliate_program_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affiliate_program_details`;

CREATE TABLE `affiliate_program_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `status` enum('active','deleted','suspended') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payout_amount` decimal(10,4) NOT NULL,
  `geoip_country_code` text COLLATE utf8_unicode_ci,
  `cpa_trigger` enum('booking','issued') COLLATE utf8_unicode_ci DEFAULT NULL,
  `departure_country_codes` text COLLATE utf8_unicode_ci,
  `destination_country_codes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table affiliate_programs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affiliate_programs`;

CREATE TABLE `affiliate_programs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `status` enum('active','deleted','suspended') COLLATE utf8_unicode_ci NOT NULL,
  `auto_assigned` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `payout_type` enum('cpm','cpa','cpc') COLLATE utf8_unicode_ci NOT NULL,
  `payout_amount` decimal(10,4) NOT NULL,
  `cpa_trigger` enum('booking','issued') COLLATE utf8_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table affiliate_report_fields
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affiliate_report_fields`;

CREATE TABLE `affiliate_report_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `type` enum('metric','dimension') COLLATE utf8_unicode_ci NOT NULL,
  `field_id` int(11) NOT NULL,
  `field_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table affiliates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `affiliates`;

CREATE TABLE `affiliates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `status` enum('active','deleted','suspended') COLLATE utf8_unicode_ci NOT NULL,
  `is_internal` tinyint(1) DEFAULT '0',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stateprov_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cell_phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `aim` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `msn` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `accounting_contact` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accounting_email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_type` enum('paypal','wire','check') COLLATE utf8_unicode_ci NOT NULL,
  `account` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_email` varchar(60) CHARACTER SET utf8 DEFAULT NULL,
  `type` enum('meta','direct','compare','fare-alert','newsletter','phone','other','adword','adword2','uncommon-search','uncommon-device') COLLATE utf8_unicode_ci NOT NULL,
  `fraud_risk_level` enum('low_risk','medium_risk','high_risk') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='	';



# Affichage de la table agent_announcements
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_announcements`;

CREATE TABLE `agent_announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_by` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('general','support','fraud','ticketing') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table agent_calls_taken_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_calls_taken_log`;

CREATE TABLE `agent_calls_taken_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `num_calls` int(11) NOT NULL,
  `avg_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_id` (`agent_id`,`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table agent_cms_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_cms_log`;

CREATE TABLE `agent_cms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table agent_group_gds_accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_group_gds_accounts`;

CREATE TABLE `agent_group_gds_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('active','deleted') NOT NULL,
  `group_id` int(11) NOT NULL,
  `gds` varchar(50) NOT NULL,
  `gds_account_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table agent_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_groups`;

CREATE TABLE `agent_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('active','deleted') NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` enum('internal','external') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table agent_level_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_level_permissions`;

CREATE TABLE `agent_level_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_permission` (`level`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table agent_level_tasks_actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_level_tasks_actions`;

CREATE TABLE `agent_level_tasks_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_level` int(11) NOT NULL,
  `task_type` int(11) NOT NULL,
  `task_action` varchar(50) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table agent_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_permissions`;

CREATE TABLE `agent_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_type` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table agent_shifts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agent_shifts`;

CREATE TABLE `agent_shifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `start_day` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `end_day` char(3) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table agents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `agents`;

CREATE TABLE `agents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('active','inactive','deleted') COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime DEFAULT '0000-00-00 00:00:00',
  `group_id` int(11) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `session_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '2',
  `force_change_password` tinyint(1) NOT NULL,
  `failed_login_attempts` text COLLATE utf8_unicode_ci NOT NULL,
  `shift_id` int(11) NOT NULL DEFAULT '0',
  `is_it` tinyint(1) DEFAULT '0',
  `is_external` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table aircrafts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `aircrafts`;

CREATE TABLE `aircrafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `manufacturer` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wake` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table airline_baggage_fees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `airline_baggage_fees`;

CREATE TABLE `airline_baggage_fees` (
  `airline_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `policy_url` text COLLATE utf8_unicode_ci,
  `domestic_policy` text COLLATE utf8_unicode_ci,
  `domestic_bag_1_price` text COLLATE utf8_unicode_ci,
  `domestic_bag_2_price` text COLLATE utf8_unicode_ci,
  `domestic_bag_3_price` text COLLATE utf8_unicode_ci,
  `domestic_bag_additional_price` text COLLATE utf8_unicode_ci,
  `domestic_overweight_bags` text COLLATE utf8_unicode_ci,
  `domestic_oversize_bags` text COLLATE utf8_unicode_ci,
  `international_policy` text COLLATE utf8_unicode_ci,
  `international_bag_1_price` text COLLATE utf8_unicode_ci,
  `international_bag_2_price` text COLLATE utf8_unicode_ci,
  `international_bag_3_price` text COLLATE utf8_unicode_ci,
  `international_bag_additional_price` text COLLATE utf8_unicode_ci,
  `international_overweight_bags` text COLLATE utf8_unicode_ci,
  `international_oversize_bags` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`airline_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table airline_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `airline_routes`;

CREATE TABLE `airline_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airline_code` varchar(4) NOT NULL,
  `departure_airport_code` varchar(4) NOT NULL,
  `destination_airport_code` varchar(4) NOT NULL,
  `codeshare` varchar(2) NOT NULL,
  `stops` int(11) NOT NULL,
  `misc` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `airline_code` (`airline_code`),
  KEY `departure_airport_code` (`departure_airport_code`),
  KEY `destination_airport_code` (`destination_airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table airlines
# ------------------------------------------------------------

DROP TABLE IF EXISTS `airlines`;

CREATE TABLE `airlines` (
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `seat_guru_url` text COLLATE utf8_unicode_ci,
  `fee_info_url` text COLLATE utf8_unicode_ci,
  `check_in_url` text COLLATE utf8_unicode_ci,
  `contact_phone_no` varchar(14) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table airports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `airports`;

CREATE TABLE `airports` (
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `city_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` float(10,6) NOT NULL,
  `longitude` float(10,6) NOT NULL,
  `altitude` int(11) NOT NULL,
  `timezone` float(2,1) NOT NULL,
  `DST` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `is_city` tinyint(1) NOT NULL,
  `is_major_airport` tinyint(1) NOT NULL DEFAULT '0',
  `search_count_departure` int(11) DEFAULT NULL,
  `search_count_destination` int(11) DEFAULT NULL,
  `popularity_tier` int(11) NOT NULL DEFAULT '3',
  `geohash` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promo_discount` int(11) DEFAULT '0',
  PRIMARY KEY (`code`),
  KEY `country_code` (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table amadeus_offices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `amadeus_offices`;

CREATE TABLE `amadeus_offices` (
  `office_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `is_external` tinyint(1) NOT NULL,
  `queue_command` text COLLATE utf8_unicode_ci,
  `queue_command_mod` text COLLATE utf8_unicode_ci,
  `supplier_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wsdl` text COLLATE utf8_unicode_ci,
  `wsdl_mptb` text COLLATE utf8_unicode_ci,
  `originator` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `binary_password` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `binary_password_length` int(11) DEFAULT NULL,
  `soap_server_location` text COLLATE utf8_unicode_ci,
  `soap_header_namespace` text COLLATE utf8_unicode_ci,
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disabled',
  `can_ticket` tinyint(1) NOT NULL,
  `makes_incognito_tickets` tinyint(1) DEFAULT '0',
  `aian_number` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mptb_soap_action` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`office_id`),
  UNIQUE KEY `is_external` (`is_external`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table amadeus_security_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `amadeus_security_log`;

CREATE TABLE `amadeus_security_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_query_date` datetime NOT NULL,
  `action` enum('securityAuthenticate','securitySignout') COLLATE utf8_unicode_ci NOT NULL,
  `trace` text COLLATE utf8_unicode_ci NOT NULL,
  `response` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table amadeus_sessions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `amadeus_sessions`;

CREATE TABLE `amadeus_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sequence_number` int(11) NOT NULL DEFAULT '1',
  `last_query_date` datetime NOT NULL,
  `security_token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `office_id` (`office_id`,`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table api_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `api_users`;

CREATE TABLE `api_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `api_key` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('internal','external') COLLATE utf8_unicode_ci NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table atd_travel_guides
# ------------------------------------------------------------

DROP TABLE IF EXISTS `atd_travel_guides`;

CREATE TABLE `atd_travel_guides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `language_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('city','country') COLLATE utf8_unicode_ci NOT NULL,
  `txt_overview` text COLLATE utf8_unicode_ci,
  `txt_things_to_do` text COLLATE utf8_unicode_ci,
  `txt_where_to_stay` text COLLATE utf8_unicode_ci,
  `txt_visa_info` text COLLATE utf8_unicode_ci,
  `txt_when_to_visit` text COLLATE utf8_unicode_ci,
  `txt_local_weather` text COLLATE utf8_unicode_ci,
  `txt_currency` text COLLATE utf8_unicode_ci,
  `featured` tinyint(1) DEFAULT '0',
  `featured_home` tinyint(1) DEFAULT '0',
  `order_position` int(2) DEFAULT NULL,
  `airport_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `weather_place_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table auto_ticketing_console
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auto_ticketing_console`;

CREATE TABLE `auto_ticketing_console` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `is_on` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table baggage_fees_data
# ------------------------------------------------------------

DROP TABLE IF EXISTS `baggage_fees_data`;

CREATE TABLE `baggage_fees_data` (
  `A` varchar(2) DEFAULT NULL,
  `B` varchar(10) DEFAULT NULL,
  `C` varchar(10) DEFAULT NULL,
  `D` varchar(7) DEFAULT NULL,
  `E` varchar(7) DEFAULT NULL,
  `F` varchar(8) DEFAULT NULL,
  `G` varchar(38) DEFAULT NULL,
  `H` varchar(32) DEFAULT NULL,
  `I` varchar(35) DEFAULT NULL,
  `J` varchar(10) DEFAULT NULL,
  `K` int(2) DEFAULT NULL,
  `L` varchar(15) DEFAULT NULL,
  `M` varchar(33) DEFAULT NULL,
  `N` varchar(38) DEFAULT NULL,
  `O` varchar(47) DEFAULT NULL,
  `P` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table binbase
# ------------------------------------------------------------

DROP TABLE IF EXISTS `binbase`;

CREATE TABLE `binbase` (
  `bin` int(6) NOT NULL,
  `card_company_name` varchar(50) NOT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `card_type` varchar(50) NOT NULL,
  `card_class` varchar(50) DEFAULT NULL,
  `country` varchar(100) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `country_code_iso` varchar(3) NOT NULL,
  `bank_code` int(11) NOT NULL,
  `bank_website` varchar(200) DEFAULT NULL,
  `bank_phone` varchar(200) DEFAULT NULL,
  `card_phone` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`bin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table blacklist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `blacklist`;

CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cc_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_number` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `fraud_score` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_attachments`;

CREATE TABLE `booking_attachments` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `agent_id` int(11) DEFAULT '0',
  `date_added` datetime NOT NULL,
  `attachment_extension` text NOT NULL,
  `attachment_name` text NOT NULL,
  `delete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_auto_ticketing_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_auto_ticketing_log`;

CREATE TABLE `booking_auto_ticketing_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_billing_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_billing_info`;

CREATE TABLE `booking_billing_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `cc_number` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `cc_first_6` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `cc_last_4` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `cc_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `cc_exp_month` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `cc_exp_year` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `cc_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `address_line1` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `address_line2` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `region_code` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `zip_code` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avs` enum('yes','no','undefined') COLLATE utf8_unicode_ci DEFAULT 'undefined',
  `sent_to_ethoca` tinyint(1) DEFAULT '0',
  `ethoca_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ethoca_cancelled` tinyint(1) DEFAULT '0',
  `pre_auth_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avs_code` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_contestants
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_contestants`;

CREATE TABLE `booking_contestants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `gds` enum('amadeus','travelport') DEFAULT 'amadeus',
  `gds_account_id` varchar(25) NOT NULL,
  `fare_type` enum('private','published') DEFAULT NULL,
  `is_ddf` tinyint(1) DEFAULT '0',
  `rule_type` varchar(50) DEFAULT NULL,
  `booking_order` int(11) NOT NULL,
  `is_booked` tinyint(1) NOT NULL,
  `is_original` tinyint(1) NOT NULL,
  `base` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `markup` decimal(10,2) NOT NULL,
  `supplier_fee` decimal(10,2) NOT NULL,
  `commission` decimal(10,2) NOT NULL,
  `merchant_fee` decimal(10,2) DEFAULT '0.00',
  `revenue` decimal(10,2) NOT NULL,
  `booking_classes` varchar(50) DEFAULT NULL,
  `cabin_codes` varchar(50) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `free_text` text,
  `override_fare_qualifier` varchar(10) DEFAULT NULL,
  `trip_id` int(11) DEFAULT NULL,
  `multiticket_part` enum('slave','master') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_details`;

CREATE TABLE `booking_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `domain_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `affiliate_campaign_id` int(11) DEFAULT NULL,
  `affiliate_program_id` int(11) DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  `session_affiliate_id` int(11) DEFAULT NULL,
  `affiliate_payout_type` enum('cpm','cpa','cpc') COLLATE utf8_unicode_ci DEFAULT NULL,
  `affiliate_payout_unit_amount` decimal(10,4) DEFAULT NULL,
  `affiliate_search_type` enum('meta','compare','sem','retargeting','direct','other') COLLATE utf8_unicode_ci DEFAULT 'other',
  `device` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_version` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser_version` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referrer_domain` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `server_addr` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trip_type` enum('roundtrip','oneway','multi') COLLATE utf8_unicode_ci DEFAULT NULL,
  `itinerary_routing` enum('domestic','international','transborder') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_emails
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_emails`;

CREATE TABLE `booking_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `from` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_fare_rules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_fare_rules`;

CREATE TABLE `booking_fare_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `booking_fare_id` int(11) NOT NULL,
  `flight_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `airline_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tour_operator` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule` text COLLATE utf8_unicode_ci NOT NULL,
  `web_fare` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_fare_taxes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_fare_taxes`;

CREATE TABLE `booking_fare_taxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `booking_fare_id` int(11) NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `tax_nature` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `tax_identifier` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_fares
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_fares`;

CREATE TABLE `booking_fares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `validating_carrier` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tour_operator` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passenger_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `net_fare` decimal(10,2) NOT NULL,
  `base_fare` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `markup` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fare_basis` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `original_markup` decimal(10,2) DEFAULT '0.00',
  `original_commission` decimal(10,2) DEFAULT '0.00',
  `target_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_fraud_events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_fraud_events`;

CREATE TABLE `booking_fraud_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `fraud_score` int(5) DEFAULT NULL,
  `new_booking` tinyint(1) NOT NULL,
  `new_booking_abort` tinyint(1) NOT NULL,
  `new_booking_issue` tinyint(1) NOT NULL,
  `man_verification` tinyint(1) NOT NULL,
  `man_verification_abort` tinyint(1) NOT NULL,
  `man_verification_issue` tinyint(1) NOT NULL,
  `call_bank` tinyint(1) NOT NULL,
  `call_bank_abort` tinyint(1) NOT NULL,
  `call_bank_issue` tinyint(1) NOT NULL,
  `man_auth` tinyint(1) NOT NULL,
  `man_auth_abort` tinyint(1) NOT NULL,
  `man_auth_issue` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Booking ID` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_fraud_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_fraud_log`;

CREATE TABLE `booking_fraud_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_fraud_management
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_fraud_management`;

CREATE TABLE `booking_fraud_management` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `blacklist_email` tinyint(1) NOT NULL DEFAULT '0',
  `blacklist_names` tinyint(1) NOT NULL DEFAULT '0',
  `blacklist_ip_address` tinyint(1) NOT NULL DEFAULT '0',
  `blacklist_cc_num` tinyint(1) NOT NULL DEFAULT '0',
  `blacklist_phone_num` tinyint(1) NOT NULL DEFAULT '0',
  `fraud_risky_routes_level` enum('low_risk','medium_risk','high_risk') DEFAULT NULL,
  `fraud_countries_matrix_level` enum('low_risk','medium_risk','high_risk') DEFAULT NULL,
  `fraud_email_domains_level` enum('low_risk','medium_risk','high_risk') DEFAULT NULL,
  `fraud_email_wildcards_level` enum('low_risk','medium_risk','high_risk') DEFAULT NULL,
  `perseuss_email_address` tinyint(1) DEFAULT NULL,
  `perseuss_first_name` tinyint(1) DEFAULT NULL,
  `perseuss_last_name` tinyint(1) DEFAULT NULL,
  `perseuss_ip_address` tinyint(1) DEFAULT NULL,
  `perseuss_departure_airport` tinyint(1) DEFAULT NULL,
  `perseuss_destination_airport` tinyint(1) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_hotel_cancel_policies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_hotel_cancel_policies`;

CREATE TABLE `booking_hotel_cancel_policies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_hotel_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `start_provider_policy_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_cancel_time` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_start_window_hours` int(11) DEFAULT NULL,
  `start_night_count` int(11) DEFAULT NULL,
  `start_percent` decimal(5,2) DEFAULT NULL,
  `start_amount` decimal(10,2) DEFAULT NULL,
  `start_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_timezone_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_provider_policy_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_cancel_time` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_start_window_hours` int(11) DEFAULT NULL,
  `end_night_count` int(11) DEFAULT NULL,
  `end_percent` decimal(5,2) DEFAULT NULL,
  `end_amount` decimal(10,2) DEFAULT NULL,
  `end_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_timezone_description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_hotel_id` (`booking_hotel_id`,`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_hotel_room_rates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_hotel_room_rates`;

CREATE TABLE `booking_hotel_room_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `booking_hotel_id` int(11) NOT NULL,
  `booking_hotel_room_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `promo` tinyint(1) NOT NULL DEFAULT '0',
  `rate` decimal(10,6) NOT NULL,
  `base_rate` decimal(10,6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`,`booking_hotel_id`,`booking_hotel_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_hotel_rooms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_hotel_rooms`;

CREATE TABLE `booking_hotel_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_hotel_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `confirmation_number` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('confirmed','cancelled','unconfirmed','pending_supplier','pending_issue','error','deleted_itinerary') COLLATE utf8_unicode_ci NOT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `cancellation_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refunded_amount` decimal(10,6) DEFAULT NULL,
  `bed_type_description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_bed_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `smoking_preference` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num_adults` int(11) DEFAULT NULL,
  `num_children` int(11) DEFAULT NULL,
  `child_ages` varchar(21) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promo` tinyint(1) DEFAULT NULL,
  `rate` decimal(9,2) DEFAULT NULL,
  `base_rate` decimal(9,2) DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_request` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `booking_hotel_id` (`booking_hotel_id`,`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_hotel_surcharges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_hotel_surcharges`;

CREATE TABLE `booking_hotel_surcharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `booking_hotel_id` int(11) NOT NULL,
  `type` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_hotels
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_hotels`;

CREATE TABLE `booking_hotels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `provider` enum('ean','tourico','carsolize') COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_account_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_reservation_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `property_id` int(11) DEFAULT NULL,
  `hotel_reply` text COLLATE utf8_unicode_ci,
  `status` enum('cancelled','unconfirmed','pending_supplier','pending_issue','error','deleted_itinerary','confirmed') COLLATE utf8_unicode_ci NOT NULL,
  `num_rooms_booked` int(11) DEFAULT NULL,
  `driving_directions` text COLLATE utf8_unicode_ci,
  `check_in_instructions` text COLLATE utf8_unicode_ci,
  `arrival_date` datetime DEFAULT NULL,
  `departure_date` datetime DEFAULT NULL,
  `hotel_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_address` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_city` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_state_province` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_country_code` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_postal_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_rating` decimal(3,2) DEFAULT NULL,
  `property_category` enum('hotel','suite','resort','vacation_rental','bed_and_breakfast','all_inclusive') COLLATE utf8_unicode_ci DEFAULT NULL,
  `amenity_mask` int(11) DEFAULT NULL,
  `hotel_short_description` text COLLATE utf8_unicode_ci,
  `hotel_location_description` text COLLATE utf8_unicode_ci,
  `provider_hotel_id` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_url` text COLLATE utf8_unicode_ci,
  `trip_advisor_rating` decimal(3,2) DEFAULT NULL,
  `trip_advisor_review_count` int(11) DEFAULT NULL,
  `trip_advisor_rating_url` text COLLATE utf8_unicode_ci,
  `room_description` text COLLATE utf8_unicode_ci,
  `is_refundable` tinyint(1) DEFAULT NULL,
  `occupancy_per_room` int(11) DEFAULT NULL,
  `quoted_occupancy_per_room` int(11) DEFAULT NULL,
  `cancellation_policy` text COLLATE utf8_unicode_ci,
  `promo` tinyint(1) DEFAULT NULL,
  `rate_change` tinyint(1) DEFAULT NULL,
  `commissionable_usd_total` decimal(9,2) DEFAULT NULL,
  `total` decimal(9,2) DEFAULT NULL,
  `surcharge_total` decimal(9,2) DEFAULT NULL,
  `nightly_rate_total` decimal(9,2) DEFAULT NULL,
  `average_base_rate` decimal(9,2) DEFAULT NULL,
  `average_rate` decimal(9,2) DEFAULT NULL,
  `max_nightly_rate` decimal(9,2) DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `cancel_reason` enum('customer_request','test') COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate_key` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rate_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `room_type_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `special_request` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_inactive_osi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_inactive_osi`;

CREATE TABLE `booking_inactive_osi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `reference_qualifier` varchar(5) DEFAULT NULL,
  `reference_number` int(11) DEFAULT NULL,
  `line_number` int(11) DEFAULT NULL,
  `subject_qualifier` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `airline_code` varchar(5) DEFAULT NULL,
  `content` text,
  `inactive_date` datetime NOT NULL,
  `inactive_reason` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_inactive_remarks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_inactive_remarks`;

CREATE TABLE `booking_inactive_remarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `remark_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `remark_category` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark_text` text COLLATE utf8_unicode_ci NOT NULL,
  `reference_qualifier` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference_number` int(11) DEFAULT NULL,
  `line_number` int(11) DEFAULT NULL,
  `segment_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `inactive_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_inactive_segments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_inactive_segments`;

CREATE TABLE `booking_inactive_segments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `from_airport_code` varchar(3) NOT NULL,
  `to_airport_code` varchar(3) NOT NULL,
  `departure_date` datetime NOT NULL,
  `arrival_date` datetime NOT NULL,
  `supplier_code` varchar(2) NOT NULL,
  `operating_supplier_code` varchar(2) DEFAULT NULL,
  `aircraft_id` int(11) DEFAULT NULL,
  `flight_id` varchar(6) NOT NULL,
  `has_stopover` tinyint(1) DEFAULT NULL,
  `class_code` varchar(1) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `inactive_date` datetime NOT NULL,
  `inactive_reason` varchar(100) DEFAULT NULL,
  `new_segment_id` int(11) NOT NULL,
  `cabin_class` varchar(50) DEFAULT NULL,
  `departure_terminal` varchar(10) DEFAULT NULL,
  `arrival_terminal` varchar(10) DEFAULT NULL,
  `fare_family` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_inactive_ssrs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_inactive_ssrs`;

CREATE TABLE `booking_inactive_ssrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `management_reference_qualifier` varchar(5) DEFAULT NULL,
  `management_reference_number` int(11) DEFAULT NULL,
  `line_number` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `airline_code` char(4) DEFAULT NULL,
  `reference_qualifier` varchar(5) DEFAULT NULL,
  `reference_number` int(11) DEFAULT NULL,
  `content` text,
  `inactive_date` datetime NOT NULL,
  `inactive_reason` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_inactive_tickets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_inactive_tickets`;

CREATE TABLE `booking_inactive_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `passenger_type` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `ticket_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `issued_date` datetime NOT NULL,
  `inactive_date` datetime NOT NULL,
  `inactive_reason` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `original_office_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_insurance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_insurance`;

CREATE TABLE `booking_insurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `status` enum('pending','issued','refunded','cancelled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `processor` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `processor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_insurance_csa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_insurance_csa`;

CREATE TABLE `booking_insurance_csa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `status` enum('pending','issued','refunded','cancelled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `policy_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sum_insured_prior` int(11) NOT NULL,
  `sum_insured_after` int(11) NOT NULL,
  `issued_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `quoted_premium` decimal(10,2) NOT NULL,
  `quoted_tax` decimal(10,2) NOT NULL,
  `quoted_commission` decimal(10,2) NOT NULL,
  `quoted_supplier_fee` decimal(10,2) DEFAULT NULL,
  `quoted_region_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quoted_country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `statement_item_id` int(11) DEFAULT NULL,
  `is_cancelled` int(11) DEFAULT NULL,
  `refund_reason_comment` text COLLATE utf8_unicode_ci,
  `refund_reason_code` int(5) DEFAULT NULL,
  `refund_auth_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_insurance_rbc
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_insurance_rbc`;

CREATE TABLE `booking_insurance_rbc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `status` enum('pending','issued','refunded','cancelled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `policy_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sum_insured_prior` int(11) NOT NULL,
  `sum_insured_after` int(11) NOT NULL,
  `issued_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `quoted_ref` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quoted_premium` decimal(10,2) NOT NULL,
  `quoted_tax` decimal(10,2) NOT NULL,
  `quoted_commission` decimal(10,2) NOT NULL,
  `quoted_supplier_fee` decimal(10,2) DEFAULT NULL,
  `quoted_region_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quoted_country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `statement_item_id` int(11) DEFAULT NULL,
  `is_cancelled` int(11) DEFAULT NULL,
  `refund_reason_comment` text COLLATE utf8_unicode_ci,
  `refund_reason_code` int(5) DEFAULT NULL,
  `refund_auth_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_invoice_atd
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_invoice_atd`;

CREATE TABLE `booking_invoice_atd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_invoice_fhub
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_invoice_fhub`;

CREATE TABLE `booking_invoice_fhub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_invoice_item_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_invoice_item_transactions`;

CREATE TABLE `booking_invoice_item_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_item_id` int(11) NOT NULL,
  `booking_transaction_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_invoice_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_invoice_items`;

CREATE TABLE `booking_invoice_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `office_id` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_id` int(11) NOT NULL,
  `statement_item_id` int(11) NOT NULL,
  `statement_transaction_id` int(11) NOT NULL,
  `invoice_item_reference_id` int(11) DEFAULT NULL,
  `credit_amount` decimal(10,2) NOT NULL,
  `debit_amount` decimal(10,2) NOT NULL,
  `commission` decimal(10,2) NOT NULL,
  `supplier_fees` decimal(10,2) NOT NULL,
  `merchant_fees` decimal(10,2) NOT NULL DEFAULT '0.00',
  `product_type` enum('base_fare','markup','taxes','service_fee','rbc_insurance','csa_insurance','modification_fee','purchase_guarantee','cc_payment','room','penalty','surcharge') COLLATE utf8_unicode_ci NOT NULL,
  `product_identifier` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_type` enum('payment','sale','refund','exchange','reconcile') COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `fop` enum('cheque','credit_card') COLLATE utf8_unicode_ci NOT NULL,
  `payment_processor` enum('agency','chase','moneris','rbc','csa','ean') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `void` tinyint(1) NOT NULL,
  `order_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `merchant_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_info_id` int(11) NOT NULL,
  `segments` int(3) DEFAULT NULL,
  `departure_date` datetime DEFAULT NULL,
  `fare_type` enum('published','private') COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_class` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_first_six` int(6) DEFAULT NULL,
  `cc_last_four` int(4) DEFAULT NULL,
  `cc_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_invoices
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_invoices`;

CREATE TABLE `booking_invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `pnr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `gds_account_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validating_carrier` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `origin` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destination` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_log`;

CREATE TABLE `booking_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT '0',
  `date_added` datetime NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_notes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_notes`;

CREATE TABLE `booking_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT '0',
  `date_added` datetime NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_osi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_osi`;

CREATE TABLE `booking_osi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `reference_qualifier` varchar(5) DEFAULT NULL,
  `reference_number` int(11) DEFAULT NULL,
  `line_number` int(11) DEFAULT NULL,
  `subject_qualifier` varchar(10) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `airline_code` varchar(5) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_passenger_contact_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_passenger_contact_info`;

CREATE TABLE `booking_passenger_contact_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `type` enum('email','phone') NOT NULL,
  `phone_type` enum('home','work','mobile','other','billing','daytime') DEFAULT NULL,
  `value` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_passenger_segments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_passenger_segments`;

CREATE TABLE `booking_passenger_segments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `segment_id` int(11) NOT NULL,
  `got_requested_seat` tinyint(1) NOT NULL DEFAULT '0',
  `requested_seat` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_passengers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_passengers`;

CREATE TABLE `booking_passengers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `primary_contact` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` datetime NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `ff_airline_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT '',
  `ff_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `meal_preference_code` varchar(4) COLLATE utf8_unicode_ci DEFAULT '',
  `booking_fare_id` int(11) NOT NULL,
  `amadeus_pt` int(11) DEFAULT NULL,
  `passport_country` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `first_name` (`first_name`,`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_pnrs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_pnrs`;

CREATE TABLE `booking_pnrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `segment_id` int(11) DEFAULT NULL,
  `supplier_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `pnr` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_problems
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_problems`;

CREATE TABLE `booking_problems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `problem_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `was_viewed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_rbc_insurance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_rbc_insurance`;

CREATE TABLE `booking_rbc_insurance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `status` enum('pending','issued','refunded','cancelled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `policy_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sum_insured_prior` int(11) NOT NULL,
  `sum_insured_after` int(11) NOT NULL,
  `issued_date` datetime DEFAULT NULL,
  `modification_date` datetime DEFAULT NULL,
  `quoted_ref` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quoted_premium` decimal(10,2) NOT NULL,
  `quoted_tax` decimal(10,2) NOT NULL,
  `quoted_commission` decimal(10,2) NOT NULL,
  `quoted_region_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quoted_country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `statement_item_id` int(11) DEFAULT NULL,
  `is_cancelled` int(11) DEFAULT NULL,
  `refund_reason_comment` text COLLATE utf8_unicode_ci,
  `refund_reason_code` int(5) DEFAULT NULL,
  `refund_auth_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_remarks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_remarks`;

CREATE TABLE `booking_remarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `remark_type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `remark_category` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark_text` text COLLATE utf8_unicode_ci NOT NULL,
  `reference_qualifier` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference_number` int(11) DEFAULT NULL,
  `line_number` int(11) DEFAULT NULL,
  `segment_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `booking_id_2` (`booking_id`,`remark_type`,`reference_qualifier`,`reference_number`,`segment_name`,`remark_category`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_schedule_change_email_alerts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_schedule_change_email_alerts`;

CREATE TABLE `booking_schedule_change_email_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `next_send_date` datetime NOT NULL,
  `next_departure_date` datetime DEFAULT NULL,
  `last_send_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_id_index` (`task_id`),
  KEY `booking_id_index` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_search_results
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_search_results`;

CREATE TABLE `booking_search_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(20) NOT NULL,
  `packages_serialized` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `search_params_serialized` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `selected_package` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_segments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_segments`;

CREATE TABLE `booking_segments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `from_airport_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `to_airport_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `departure_date` datetime NOT NULL,
  `arrival_date` datetime NOT NULL,
  `supplier_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `operating_supplier_code` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aircraft_id` int(11) DEFAULT NULL,
  `flight_id` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_stopover` tinyint(1) DEFAULT '0',
  `class_code` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `reference_qualifier` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference_number` int(11) DEFAULT NULL,
  `line_number` int(11) DEFAULT NULL,
  `control_number` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operated_by_legend` text COLLATE utf8_unicode_ci,
  `cabin_class` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baggage_quantity` int(2) DEFAULT NULL,
  `baggage_type` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baggage_unit` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `baggage_weight` int(5) DEFAULT NULL,
  `provider_code` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_locator_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host_token_key` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `departure_terminal` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `arrival_terminal` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fare_basis_types` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fare_family` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `join_booking` (`id`,`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_service_fees
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_service_fees`;

CREATE TABLE `booking_service_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `agent_id` int(11) NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_ssrs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_ssrs`;

CREATE TABLE `booking_ssrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `management_reference_qualifier` varchar(5) DEFAULT NULL,
  `management_reference_number` int(11) DEFAULT NULL,
  `line_number` int(11) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `airline_code` char(4) DEFAULT NULL,
  `reference_qualifier` varchar(5) DEFAULT NULL,
  `reference_number` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_statement_item_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_statement_item_transactions`;

CREATE TABLE `booking_statement_item_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statement_item_id` int(11) NOT NULL,
  `statement_transaction_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_statement_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_statement_items`;

CREATE TABLE `booking_statement_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `passenger_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `optional_service_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_type` enum('sale','refund','exchange') COLLATE utf8_unicode_ci NOT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `currency` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','paid','deleted','failed','refunded','voided') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `net_fare` decimal(10,2) NOT NULL,
  `base_fare` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) NOT NULL,
  `comission` decimal(10,2) NOT NULL,
  `merchant_fee` float DEFAULT NULL,
  `supplier_fee` float(10,2) DEFAULT NULL,
  `penalty` float(10,2) DEFAULT NULL,
  `surcharges` decimal(10,2) DEFAULT NULL,
  `customer_amount` decimal(10,2) NOT NULL,
  `internal_amount` decimal(10,2) NOT NULL,
  `fop` enum('cheque','credit_card') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'credit_card',
  `billing_info_id` int(11) DEFAULT NULL,
  `payment_processor` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gds_account_id` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `paid_by` int(11) DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `paid_transaction_id` int(11) DEFAULT NULL,
  `parent_item_id` int(11) DEFAULT NULL,
  `is_invoiced` tinyint(1) NOT NULL DEFAULT '0',
  `booking_ticket_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_ticket_id` (`booking_ticket_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_statement_transaction_chase
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_statement_transaction_chase`;

CREATE TABLE `booking_statement_transaction_chase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `statement_transaction_id` int(11) NOT NULL,
  `billing_info_id` int(11) NOT NULL,
  `parent_transaction_id` int(11) DEFAULT NULL,
  `type` enum('auth_capture','refund','void','auth_reversal','auth','capture') COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','success','failed') COLLATE utf8_unicode_ci NOT NULL,
  `status_message` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float(10,2) NOT NULL,
  `order_id` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `merchant_id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_ref_num` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_ref_index` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avs_response_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cvv_response_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `response_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `retry_trace` int(11) DEFAULT NULL,
  `retry_attempt_count` int(11) DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `processed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_statement_transaction_csa
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_statement_transaction_csa`;

CREATE TABLE `booking_statement_transaction_csa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `statement_transaction_id` int(11) DEFAULT NULL,
  `billing_info_id` int(11) NOT NULL,
  `parent_transaction_id` int(11) DEFAULT NULL,
  `booking_insurance_csa_id` int(11) NOT NULL,
  `type` enum('issue','refund') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('failed','success') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `error_code` varchar(20) DEFAULT NULL,
  `premium` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `commission` decimal(10,2) DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `refund_reason_comment` text,
  `refund_reason_code` int(5) DEFAULT NULL,
  `refund_auth_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_statement_transaction_moneris
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_statement_transaction_moneris`;

CREATE TABLE `booking_statement_transaction_moneris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `statement_transaction_id` int(11) NOT NULL,
  `billing_info_id` int(11) NOT NULL,
  `cc_first_6` int(6) DEFAULT NULL,
  `cc_last_4` int(4) DEFAULT NULL,
  `parent_transaction_id` int(11) DEFAULT NULL,
  `type` enum('auth','reauth','capture','void','refund','auth_capture','independend_refund','card_verification') COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','success','failed') COLLATE utf8_unicode_ci NOT NULL,
  `status_message` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float(10,2) NOT NULL,
  `order_id` varchar(22) COLLATE utf8_unicode_ci DEFAULT NULL,
  `merchant_id` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_num` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `institution_auth_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avs_response_code` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cvv_response_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `response_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timed_out` tinyint(1) DEFAULT NULL,
  `iso` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `processed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`,`statement_transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_statement_transaction_rbc
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_statement_transaction_rbc`;

CREATE TABLE `booking_statement_transaction_rbc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `statement_transaction_id` int(11) DEFAULT NULL,
  `billing_info_id` int(11) NOT NULL,
  `parent_transaction_id` int(11) DEFAULT NULL,
  `booking_rbc_insurance_id` int(11) DEFAULT NULL,
  `booking_insurance_rbc_id` int(11) DEFAULT NULL,
  `type` enum('issue','refund') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('failed','success') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_number` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `error_code` int(10) DEFAULT NULL,
  `premium` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `commission` decimal(10,2) DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `refund_reason_comment` text,
  `refund_reason_code` int(5) DEFAULT NULL,
  `refund_auth_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_statement_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_statement_transactions`;

CREATE TABLE `booking_statement_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` enum('auth_capture','auth_reversal','refund','void','auth','capture','card_verification') COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('pending','success','failed','voided') COLLATE utf8_unicode_ci NOT NULL,
  `transaction_date` datetime NOT NULL,
  `processor_transaction_id` int(11) DEFAULT NULL,
  `processor` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `parent_transaction_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_summary_temp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_summary_temp`;

CREATE TABLE `booking_summary_temp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_airport` char(3) NOT NULL,
  `to_airport` char(3) NOT NULL,
  `average_duration` float unsigned DEFAULT NULL,
  `average_duration_pool` int(11) unsigned NOT NULL DEFAULT '0',
  `airlines` text,
  `average_price` float unsigned DEFAULT NULL,
  `average_price_pool` int(10) unsigned NOT NULL DEFAULT '0',
  `cheapest_price` float unsigned DEFAULT NULL,
  `average_num_segments` float unsigned DEFAULT NULL,
  `average_num_segments_pool` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_airports_pair` (`from_airport`,`to_airport`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_task_call_bank_results
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_task_call_bank_results`;

CREATE TABLE `booking_task_call_bank_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `name_on_card` varchar(100) NOT NULL,
  `billing_address` varchar(200) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name_on_card_result` varchar(20) NOT NULL,
  `billing_address_result` varchar(20) NOT NULL,
  `phone_result` varchar(20) NOT NULL,
  `email_result` varchar(20) NOT NULL,
  `account_closed` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_task_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_task_messages`;

CREATE TABLE `booking_task_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `from_group_id` int(11) NOT NULL,
  `to_group_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` enum('new','replied') NOT NULL DEFAULT 'new',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_task_process_action_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_task_process_action_log`;

CREATE TABLE `booking_task_process_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `task_type` int(11) NOT NULL,
  `action` enum('sleep','resolve','abort','open','wake','set_manual','set_auto','create','escalate','flag_long_term','queue','close','save_call_bank_evaluation','flag_urgent','unflag_urgent') NOT NULL,
  `agent_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `mistake` tinyint(1) NOT NULL DEFAULT '0',
  `mistake_date_added` datetime DEFAULT NULL,
  `mistake_flagged_by` int(11) DEFAULT NULL,
  `is_test` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_task_process_goal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_task_process_goal`;

CREATE TABLE `booking_task_process_goal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_type` int(11) NOT NULL,
  `goal_type` enum('idle_time','resolve_time') NOT NULL,
  `goal_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_task_process_time_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_task_process_time_log`;

CREATE TABLE `booking_task_process_time_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `task_type` int(11) NOT NULL,
  `action` enum('sleep','idle','work') NOT NULL,
  `agent_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `is_test` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_tasks`;

CREATE TABLE `booking_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `deadline_date` datetime NOT NULL,
  `agent_group_id` int(11) NOT NULL,
  `status` enum('unresolved','resolved') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unresolved',
  `was_aborted` tinyint(1) DEFAULT NULL,
  `sent_to_queue` tinyint(1) DEFAULT NULL,
  `max_queued_date` datetime DEFAULT NULL,
  `is_open` tinyint(1) NOT NULL DEFAULT '0',
  `sleep_until` datetime DEFAULT NULL,
  `handled_by` int(11) DEFAULT '0',
  `created_by` int(11) DEFAULT '0',
  `resolved_by` int(11) DEFAULT NULL,
  `create_date` datetime NOT NULL,
  `open_date` datetime DEFAULT NULL,
  `resolve_date` datetime DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `parent_task_type` int(11) DEFAULT NULL,
  `has_unresolved_children` tinyint(1) NOT NULL DEFAULT '0',
  `note` text COLLATE utf8_unicode_ci,
  `handle_type` enum('manual','auto') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'manual',
  `next_check_auto_queued` datetime DEFAULT NULL,
  `is_long_term` tinyint(1) DEFAULT '0',
  `is_escalated` tinyint(1) DEFAULT '0',
  `is_urgent` tinyint(1) DEFAULT '0',
  `qa_task_id` int(11) DEFAULT NULL,
  `num_sleeps` int(11) DEFAULT NULL,
  `agent_level` int(11) DEFAULT '2',
  `ticket_during_checkout` tinyint(1) DEFAULT NULL,
  `cc_change_deadline` datetime DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `num_sc_emails_sent` int(11) DEFAULT '0',
  `sent_to_fulfillment` tinyint(1) DEFAULT '0',
  `is_test_booking` tinyint(1) DEFAULT '0',
  `sent_to_sos` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_ticket_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_ticket_status`;

CREATE TABLE `booking_ticket_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `company` varchar(15) NOT NULL,
  `flight_id` varchar(30) NOT NULL,
  `departure_date` datetime DEFAULT NULL,
  `airport_from` varchar(5) DEFAULT NULL,
  `airport_to` varchar(5) DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flight_status` (`booking_id`,`ticket_id`,`flight_id`,`company`,`departure_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table booking_tickets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_tickets`;

CREATE TABLE `booking_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `passenger_type` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `ticket_number` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `coupon_status` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issued_date` datetime NOT NULL,
  `amadeus_pt` int(11) DEFAULT NULL,
  `processed` tinyint(1) DEFAULT NULL,
  `original_office_id` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key` (`booking_id`,`passenger_id`,`ticket_number`,`status`,`passenger_type`),
  KEY `ticket_number_index` (`ticket_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table booking_validation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booking_validation`;

CREATE TABLE `booking_validation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `ft` tinyint(1) DEFAULT '0',
  `osi` tinyint(1) DEFAULT '0',
  `commission` tinyint(1) DEFAULT '0',
  `ptc` tinyint(1) DEFAULT '0',
  `documents` tinyint(1) DEFAULT '0',
  `transactions` tinyint(1) DEFAULT '0',
  `has_been_reviewed` tinyint(1) DEFAULT '0',
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table bookings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bookings`;

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pnr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('not_issued','issued','cancelled','voided') COLLATE utf8_unicode_ci DEFAULT 'not_issued',
  `process_status` enum('open','resolved') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `status_updated_by_admin` tinyint(4) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `gds` enum('Amadeus','Travelport','Softvoyage') COLLATE utf8_unicode_ci DEFAULT 'Amadeus',
  `gds_account_id` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cancel_reason` enum('aborted','aborted_booking','blacklisted','customer_request','fraud','invalid_cc','user','manual_auth','fare_invalid','test','cc_decline','multiticket_booking_fail') COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `ticketing_deadline` datetime DEFAULT NULL,
  `departure_date` datetime DEFAULT NULL,
  `departure_airport_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destination_airport_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `ip_address` varchar(20) COLLATE utf8_unicode_ci DEFAULT '',
  `user_agent` text COLLATE utf8_unicode_ci,
  `fare_type` enum('private','published') COLLATE utf8_unicode_ci DEFAULT NULL,
  `ticketed_date` datetime DEFAULT '0000-00-00 00:00:00',
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rebooked` tinyint(1) DEFAULT '0',
  `validating_carrier` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_hash` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `primary_email_contact_info_id` int(11) DEFAULT NULL,
  `primary_phone_contact_info_id` int(11) DEFAULT NULL,
  `contact_first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferred_language` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferred_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_exchange_rate` decimal(20,10) DEFAULT '1.0000000000',
  `is_test` tinyint(1) DEFAULT '0',
  `geoip_country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geoip_region` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `geoip_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_pnr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_info_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `sp_booking_id` int(11) DEFAULT NULL,
  `insurance_eligible` tinyint(1) DEFAULT NULL,
  `is_fraud` tinyint(1) DEFAULT NULL,
  `processed` tinyint(1) DEFAULT NULL,
  `has_air` tinyint(1) DEFAULT '1',
  `has_hotel` tinyint(1) DEFAULT '0',
  `invoice_num` int(11) DEFAULT NULL,
  `is_urgent` tinyint(1) DEFAULT NULL,
  `pre_auth_failed` tinyint(1) DEFAULT NULL,
  `create_commission_task` tinyint(1) DEFAULT NULL,
  `checkout_redirected` tinyint(1) DEFAULT '0',
  `default_merchant` enum('moneris','chase') COLLATE utf8_unicode_ci DEFAULT 'chase',
  `site_version` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkout_status` enum('booked','pending') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'booked',
  `checkout_length` int(11) DEFAULT NULL,
  `debug_transaction_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `air_pnr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `universal_pnr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider_code` enum('ach','1v','') COLLATE utf8_unicode_ci DEFAULT '',
  `softvoyage_booking_number` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `softvoyage_pin_number` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tour_operator` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_user_id` int(11) DEFAULT NULL,
  `valc_agent_id` int(11) DEFAULT NULL,
  `is_multiticket` tinyint(1) DEFAULT '0',
  `multiticket_related_booking_id` int(11) DEFAULT NULL,
  `multiticket_relationship_type` enum('master','slave') COLLATE utf8_unicode_ci DEFAULT NULL,
  `multiticket_currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `multiticket_exchange_rate` decimal(20,10) DEFAULT NULL,
  `fare_corporate_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `out_of_sync` tinyint(1) DEFAULT '0',
  `sync_time` datetime DEFAULT NULL,
  `send_sync_email` tinyint(1) DEFAULT '0',
  `next_sc_check` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table bsp_hot_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bsp_hot_files`;

CREATE TABLE `bsp_hot_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `bsp_id` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `ticket_airline_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `handbook_revision_nb` int(3) NOT NULL,
  `processed_date` datetime NOT NULL,
  `billing_analysis_end_date` date NOT NULL,
  `hot_reporting_end_date` date NOT NULL,
  `agent_code` int(8) NOT NULL,
  `remittance_period_end_date` date NOT NULL,
  `hot_file_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `total_transaction_cash` decimal(11,2) NOT NULL,
  `total_transaction_credit` decimal(11,2) NOT NULL,
  `total_tax_cash` decimal(11,2) NOT NULL,
  `total_tax_credit` decimal(11,2) NOT NULL,
  `total_commission_amount` decimal(11,2) NOT NULL,
  `total_supplement_amount` decimal(11,2) NOT NULL,
  `total_tax_commission` decimal(11,2) NOT NULL,
  `grand_total` decimal(11,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table bsp_hot_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bsp_hot_transactions`;

CREATE TABLE `bsp_hot_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `bsp_hot_file_id` int(11) NOT NULL,
  `type` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `airline_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `document_num` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ticket_num` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `issued_date` date DEFAULT NULL,
  `pnr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon_use_indicator` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_cash` decimal(11,2) DEFAULT '0.00',
  `transaction_credit` decimal(11,2) DEFAULT '0.00',
  `tax_cash` decimal(11,2) DEFAULT '0.00',
  `tax_credit` decimal(11,2) DEFAULT '0.00',
  `tax_description` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `standard_rate` decimal(5,2) DEFAULT '0.00',
  `commission_amount` decimal(11,2) DEFAULT '0.00',
  `supplement_amount` decimal(11,2) DEFAULT '0.00',
  `stat_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commission_tax` decimal(11,2) DEFAULT '0.00',
  `conjunction` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_account` varchar(19) COLLATE utf8_unicode_ci DEFAULT NULL,
  `balance` decimal(11,2) NOT NULL,
  `reconciled` tinyint(1) NOT NULL DEFAULT '0',
  `run_once` tinyint(1) NOT NULL DEFAULT '0',
  `booking_id` int(11) DEFAULT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `respro_base` decimal(11,2) DEFAULT '0.00',
  `respro_taxes` decimal(11,2) DEFAULT '0.00',
  `respro_commission` decimal(11,2) DEFAULT '0.00',
  `respro_balance` decimal(11,2) DEFAULT '0.00',
  `difference` decimal(11,2) DEFAULT '0.00',
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table cakemail_relay_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cakemail_relay_logs`;

CREATE TABLE `cakemail_relay_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` enum('sent','open','bounce','clickthru') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `relay_id` int(11) NOT NULL,
  `sent_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `tracking_id` int(11) NOT NULL,
  `host` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `bounce_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_to` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table cakemail_suppression_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cakemail_suppression_list`;

CREATE TABLE `cakemail_suppression_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `source_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table call_history_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `call_history_log`;

CREATE TABLE `call_history_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `call_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `result` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `call_duration` time NOT NULL,
  `phone_number` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `agents` text COLLATE utf8_unicode_ci NOT NULL,
  `queues` text COLLATE utf8_unicode_ci NOT NULL,
  `extensions` text COLLATE utf8_unicode_ci NOT NULL,
  `trunk` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `account_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `start_time` (`start_time`,`call_type`,`result`,`call_duration`,`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table chase_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `chase_transactions`;

CREATE TABLE `chase_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `filename` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `merchant_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_date` datetime NOT NULL,
  `card_type` int(2) NOT NULL,
  `credit_card_num` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `order_id` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `reconciled` tinyint(1) NOT NULL,
  `run_once` tinyint(1) NOT NULL,
  `statement_transaction_chase_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `pnr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recorded_amount` decimal(11,2) DEFAULT '0.00',
  `difference` decimal(11,2) DEFAULT '0.00',
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table checkout_booking_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checkout_booking_log`;

CREATE TABLE `checkout_booking_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `session_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hash_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra_hash_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table checkout_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checkout_history`;

CREATE TABLE `checkout_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_type` enum('desktop','mobile') COLLATE utf8_unicode_ci NOT NULL,
  `checkout_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `step` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `session_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hash_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extra_hash_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_data` text COLLATE utf8_unicode_ci,
  `rooms_occupancy` text COLLATE utf8_unicode_ci,
  `payment_info` text COLLATE utf8_unicode_ci,
  `rbc_insurance` text COLLATE utf8_unicode_ci,
  `create_account` text COLLATE utf8_unicode_ci,
  `terms` text COLLATE utf8_unicode_ci,
  `frontend_validation_errors` text COLLATE utf8_unicode_ci,
  `backend_validation_errors` text COLLATE utf8_unicode_ci,
  `server_info` text COLLATE utf8_unicode_ci,
  `date_added` datetime NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flight_airport_from` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flight_airport_to` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flight_departure_date` datetime DEFAULT NULL,
  `hotel_region_id` int(11) DEFAULT NULL,
  `hotel_destination` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hotel_arrival_date` datetime DEFAULT NULL,
  `hotel_num_rooms` int(11) DEFAULT NULL,
  `search_params` text COLLATE utf8_unicode_ci,
  `booking_id` int(11) DEFAULT NULL,
  `ip_address` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_first_six` int(6) DEFAULT NULL,
  `cc_last_four` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table checkout_ticketing_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `checkout_ticketing_log`;

CREATE TABLE `checkout_ticketing_log` (
  `booking_id` int(11) NOT NULL,
  `ticketing_type` enum('manual','auto','cron') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'auto',
  `failed_to_auto_ticket` tinyint(1) DEFAULT '0',
  `flag_call_bank` tinyint(1) DEFAULT '0',
  `flag_commission` tinyint(1) DEFAULT '0',
  `queued_to_supplier` tinyint(1) DEFAULT '0',
  `failed_merchant_charges` tinyint(1) DEFAULT '0',
  `cc_declined` tinyint(1) DEFAULT '0',
  `date_added` datetime NOT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table club_searches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `club_searches`;

CREATE TABLE `club_searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_airport` varchar(3) DEFAULT NULL,
  `destination_airport` varchar(3) DEFAULT NULL,
  `departure_date` datetime DEFAULT NULL,
  `return_date` datetime DEFAULT NULL,
  `our_price` decimal(10,2) DEFAULT NULL,
  `their_price` decimal(10,2) DEFAULT NULL,
  `search_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table club_signup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `club_signup`;

CREATE TABLE `club_signup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `session_id` varchar(50) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `geoip_country` varchar(2) DEFAULT NULL,
  `geoip_region` int(2) DEFAULT NULL,
  `geoip_city` varchar(200) NOT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `search_params` varchar(500) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table cms_emails
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_emails`;

CREATE TABLE `cms_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `email_date` datetime DEFAULT NULL,
  `from` text COLLATE utf8_unicode_ci NOT NULL,
  `to` text COLLATE utf8_unicode_ci NOT NULL,
  `cc` text COLLATE utf8_unicode_ci,
  `bcc` text COLLATE utf8_unicode_ci,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `message_html` text COLLATE utf8_unicode_ci,
  `message_text` text COLLATE utf8_unicode_ci,
  `attachments` text COLLATE utf8_unicode_ci,
  `status` enum('new','open','resolved') COLLATE utf8_unicode_ci NOT NULL,
  `customer_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table commission_contract_files
# ------------------------------------------------------------

DROP TABLE IF EXISTS `commission_contract_files`;

CREATE TABLE `commission_contract_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commission_contract_id` int(11) NOT NULL,
  `filename` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `commission_contract_id` (`commission_contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table commission_contract_rules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `commission_contract_rules`;

CREATE TABLE `commission_contract_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `permitted_operating_carriers` text COLLATE utf8_unicode_ci,
  `permitted_operating_carriers_exclude` tinyint(1) DEFAULT NULL,
  `permitted_marketing_carriers` text COLLATE utf8_unicode_ci,
  `permitted_marketing_carriers_exclude` tinyint(1) DEFAULT NULL,
  `permitted_operating_or_marketing_carriers` tinyint(1) DEFAULT '0',
  `permitted_operating_on_all_segments` int(11) DEFAULT '0',
  `transpacific_airlines` text COLLATE utf8_unicode_ci,
  `transpacific_airlines_exclude` tinyint(1) DEFAULT NULL,
  `transpacific_segment_required` tinyint(1) DEFAULT '0',
  `transatlantic_airlines` text COLLATE utf8_unicode_ci,
  `transatlantic_airlines_exclude` tinyint(1) DEFAULT NULL,
  `transatlantic_segment_required` tinyint(1) DEFAULT '0',
  `transborder_airlines` text COLLATE utf8_unicode_ci,
  `transborder_airlines_exclude` tinyint(1) DEFAULT NULL,
  `transborder_segment_required` tinyint(1) DEFAULT '0',
  `only_through_fare` tinyint(1) DEFAULT NULL,
  `exclude_airline_surcharge` tinyint(1) DEFAULT NULL,
  `fare_basis` text COLLATE utf8_unicode_ci,
  `fare_basis_exclude` tinyint(1) DEFAULT NULL,
  `booking_classes` text COLLATE utf8_unicode_ci,
  `booking_classes_exclude` tinyint(1) DEFAULT NULL,
  `booking_classes_from_carriers_enabled` tinyint(1) DEFAULT '0',
  `booking_classes_from_carriers` text COLLATE utf8_unicode_ci,
  `flight_numbers` text COLLATE utf8_unicode_ci,
  `flight_numbers_exclude` tinyint(1) DEFAULT NULL,
  `trip_type` enum('all','roundtrip','one_way') COLLATE utf8_unicode_ci NOT NULL,
  `commission_type` enum('flat_per_way','flat_per_ticket','percentage_per_ticket') COLLATE utf8_unicode_ci NOT NULL,
  `commission_amount` decimal(10,2) NOT NULL,
  `tour_code` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ticket_designator` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `osi` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endorsement` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `last_modified_by` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `ssr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transpacific_segment_count_operator` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transatlantic_segment_count_operator` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transborder_segment_count_operator` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transpacific_segment_count_value` int(11) NOT NULL DEFAULT '0',
  `transatlantic_segment_count_value` int(11) NOT NULL DEFAULT '0',
  `transborder_segment_count_value` int(11) NOT NULL DEFAULT '0',
  `transpacific_first_criteria_field` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transpacific_second_criteria_field` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transpacific_first_criteria_value` tinyint(1) DEFAULT '0',
  `transpacific_second_criteria_value` tinyint(1) DEFAULT '0',
  `transatlantic_first_criteria_field` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transatlantic_second_criteria_field` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transatlantic_first_criteria_value` tinyint(1) DEFAULT '0',
  `transatlantic_second_criteria_value` tinyint(1) DEFAULT '0',
  `transborder_first_criteria_field` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transborder_second_criteria_field` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transborder_first_criteria_value` tinyint(1) DEFAULT '0',
  `transborder_second_criteria_value` tinyint(1) DEFAULT '0',
  `transpacific_criteria_operator` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transatlantic_criteria_operator` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transborder_criteria_operator` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `codeshare_disallowed_airlines` text COLLATE utf8_unicode_ci,
  `season` enum('all','k','l','h') COLLATE utf8_unicode_ci DEFAULT 'all',
  `fare_basis_filter` text COLLATE utf8_unicode_ci,
  `no_fare_break_allowed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table commission_contracts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `commission_contracts`;

CREATE TABLE `commission_contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `validating_carrier` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `alliance_id` int(11) DEFAULT NULL,
  `fare_filling` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gds` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fare_type` enum('published','private') COLLATE utf8_unicode_ci NOT NULL,
  `office_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ref_num` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pax_type_adt` tinyint(1) NOT NULL,
  `pax_type_chd` tinyint(1) NOT NULL,
  `pax_type_inf` tinyint(1) NOT NULL,
  `effective_date_ranges` text COLLATE utf8_unicode_ci,
  `ticketing_date_ranges` text COLLATE utf8_unicode_ci,
  `departure_date_ranges` text COLLATE utf8_unicode_ci,
  `return_date_ranges` text COLLATE utf8_unicode_ci,
  `effective_date_min` date DEFAULT NULL,
  `effective_date_max` date DEFAULT NULL,
  `ticketing_date_min` date DEFAULT NULL,
  `ticketing_date_max` date DEFAULT NULL,
  `departure_date_min` date DEFAULT NULL,
  `departure_date_max` date DEFAULT NULL,
  `return_date_min` date DEFAULT NULL,
  `return_date_max` date DEFAULT NULL,
  `lowest_combined_commission` tinyint(1) NOT NULL,
  `required_departing_portion` tinyint(1) DEFAULT '1',
  `allowed_break_itinerary` tinyint(1) NOT NULL DEFAULT '1',
  `override_commission_amount` decimal(10,2) DEFAULT NULL,
  `override_commission_type` enum('percent','flat') COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `reporting_method` enum('standard','bt','it') COLLATE utf8_unicode_ci DEFAULT NULL,
  `fare_box_text` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tour_code` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ticket_designator` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `osi` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endorsement` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `last_modified_by` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `ssr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table commission_data_trips
# ------------------------------------------------------------

DROP TABLE IF EXISTS `commission_data_trips`;

CREATE TABLE `commission_data_trips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `validating_carrier` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `gds` enum('amadeus','travelport') COLLATE utf8_unicode_ci NOT NULL,
  `gds_account_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fare_type` enum('private','published') COLLATE utf8_unicode_ci NOT NULL,
  `pax_types` text COLLATE utf8_unicode_ci NOT NULL,
  `ticketed_date` datetime NOT NULL,
  `journey_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `itinerary_routing` enum('international','domestic','transborder') COLLATE utf8_unicode_ci DEFAULT NULL,
  `routing` enum('transit','stop-over') COLLATE utf8_unicode_ci NOT NULL,
  `nb_points_after_gateway` int(3) NOT NULL DEFAULT '0',
  `num_adt` int(3) DEFAULT '0',
  `num_chd` int(3) DEFAULT '0',
  `num_ins` int(3) DEFAULT '0',
  `num_inl` int(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `commission_data_trips_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table continent_regions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `continent_regions`;

CREATE TABLE `continent_regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `continent_id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `bsp_region_code` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `continent_id` (`continent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table continents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `continents`;

CREATE TABLE `continents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table continents_travel_guide
# ------------------------------------------------------------

DROP TABLE IF EXISTS `continents_travel_guide`;

CREATE TABLE `continents_travel_guide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table countries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `country_code_iso_3` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `continent_id` int(11) NOT NULL,
  `continent_region_id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `fraud_score` decimal(10,2) NOT NULL,
  `bsp_region_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`country_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table country_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `country_groups`;

CREATE TABLE `country_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table country_regions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `country_regions`;

CREATE TABLE `country_regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table country_stateprov
# ------------------------------------------------------------

DROP TABLE IF EXISTS `country_stateprov`;

CREATE TABLE `country_stateprov` (
  `stateprov_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`stateprov_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table creditcard_phones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `creditcard_phones`;

CREATE TABLE `creditcard_phones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `phone` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Affichage de la table currency_rates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `currency_rates`;

CREATE TABLE `currency_rates` (
  `currency_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `rate` decimal(20,10) NOT NULL,
  `base_currency_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `date_rated` datetime NOT NULL,
  PRIMARY KEY (`currency_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table customer_credits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_credits`;

CREATE TABLE `customer_credits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `issued_by` int(11) NOT NULL,
  `status` enum('new','paid') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table customer_searches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_searches`;

CREATE TABLE `customer_searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `seg0_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg0_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg0_date` date DEFAULT NULL,
  `seg0_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg1_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg1_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg1_date` date DEFAULT NULL,
  `seg1_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg2_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg2_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg2_date` date DEFAULT NULL,
  `seg2_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg3_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg3_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg3_date` date DEFAULT NULL,
  `seg3_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg4_from` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg4_to` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seg4_date` date DEFAULT NULL,
  `seg4_time` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flexible_date` tinyint(1) DEFAULT '0',
  `nearby_airports` tinyint(1) DEFAULT '0',
  `no_penalty` tinyint(1) DEFAULT '0',
  `num_adults` int(2) DEFAULT '0',
  `num_children` int(2) DEFAULT '0',
  `num_infants` int(2) DEFAULT '0',
  `num_infants_lap` int(2) DEFAULT '0',
  `date_added` datetime NOT NULL,
  `preferred_carrier_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seat_class` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `non_stop` tinyint(1) DEFAULT '0',
  `no_penalties` tinyint(1) DEFAULT '0',
  `num_segments` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table customer_travellers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_travellers`;

CREATE TABLE `customer_travellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `gender` enum('M','F') COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `middle_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `ff_number` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ff_airline_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meal_preference_code` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `status` enum('blacklisted','whitelisted','neutral') COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `main_traveller_id` int(11) DEFAULT NULL,
  `login_hash` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `password_reset_req` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `main_traveller_id` (`main_traveller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_airports_coordinates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_airports_coordinates`;

CREATE TABLE `ean_airports_coordinates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airport_id` int(11) NOT NULL,
  `airport_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `airport_name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `main_city_id` int(11) NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `airport_id_idx` (`airport_id`),
  KEY `main_city_id_idx` (`main_city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_airports_coordinates_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_airports_coordinates_old`;

CREATE TABLE `ean_airports_coordinates_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airport_id` int(11) NOT NULL,
  `airport_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `airport_name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `main_city_id` int(11) NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `airport_id_idx` (`airport_id`),
  KEY `main_city_id_idx` (`main_city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_alias_region
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_alias_region`;

CREATE TABLE `ean_alias_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `language_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `alias_string` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id_idx` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_alias_region_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_alias_region_old`;

CREATE TABLE `ean_alias_region_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `language_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `alias_string` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id_idx` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_area_attractions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_area_attractions`;

CREATE TABLE `ean_area_attractions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `attractions` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_area_attractions_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_area_attractions_old`;

CREATE TABLE `ean_area_attractions_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `attractions` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_chains
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_chains`;

CREATE TABLE `ean_chains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_city_coordinates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_city_coordinates`;

CREATE TABLE `ean_city_coordinates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `region_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `coordinates` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id_idx` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_city_coordinates_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_city_coordinates_old`;

CREATE TABLE `ean_city_coordinates_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `region_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `coordinates` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id_idx` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_country`;

CREATE TABLE `ean_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `language_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `transliteration` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `continent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id_idx` (`country_id`),
  KEY `continent_id_idx` (`continent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_country_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_country_old`;

CREATE TABLE `ean_country_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `language_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `country_name` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `transliteration` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `continent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id_idx` (`country_id`),
  KEY `continent_id_idx` (`continent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_dining_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_dining_description`;

CREATE TABLE `ean_dining_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_dining_description_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_dining_description_old`;

CREATE TABLE `ean_dining_description_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_hotel_destinations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_hotel_destinations`;

CREATE TABLE `ean_hotel_destinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` varchar(100) NOT NULL,
  `destination` varchar(280) NOT NULL,
  `center_latitude` decimal(10,6) NOT NULL,
  `center_longitude` decimal(10,6) NOT NULL,
  `state_province` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `destination_id_idx` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_hotel_destinations_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_hotel_destinations_old`;

CREATE TABLE `ean_hotel_destinations_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` varchar(100) NOT NULL,
  `destination` varchar(280) NOT NULL,
  `center_latitude` decimal(10,6) NOT NULL,
  `center_longitude` decimal(10,6) NOT NULL,
  `state_province` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `destination_id_idx` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_hotel_image_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_hotel_image_list`;

CREATE TABLE `ean_hotel_image_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `caption` varchar(70) DEFAULT NULL,
  `url` varchar(300) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `byte_size` int(11) DEFAULT NULL,
  `thumbnail_url` varchar(300) NOT NULL,
  `default_image` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_hotel_image_list_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_hotel_image_list_old`;

CREATE TABLE `ean_hotel_image_list_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `caption` varchar(70) DEFAULT NULL,
  `url` varchar(300) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `byte_size` int(11) DEFAULT NULL,
  `thumbnail_url` varchar(300) NOT NULL,
  `default_image` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_hotel_landmark_destinations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_hotel_landmark_destinations`;

CREATE TABLE `ean_hotel_landmark_destinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` varchar(100) NOT NULL,
  `name` varchar(280) NOT NULL,
  `city` varchar(300) DEFAULT NULL,
  `state_province` varchar(32) DEFAULT NULL,
  `country` varchar(32) NOT NULL,
  `center_latitude` decimal(10,6) NOT NULL,
  `center_longitude` decimal(10,6) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `destination_id_idx` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_hotel_landmark_destinations_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_hotel_landmark_destinations_old`;

CREATE TABLE `ean_hotel_landmark_destinations_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `destination_id` varchar(100) NOT NULL,
  `name` varchar(280) NOT NULL,
  `city` varchar(300) DEFAULT NULL,
  `state_province` varchar(32) DEFAULT NULL,
  `country` varchar(32) NOT NULL,
  `center_latitude` decimal(10,6) NOT NULL,
  `center_longitude` decimal(10,6) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `destination_id_idx` (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_neighborhood_coordinates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_neighborhood_coordinates`;

CREATE TABLE `ean_neighborhood_coordinates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `region_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `coordinates` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id_idx` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_neighborhood_coordinates_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_neighborhood_coordinates_old`;

CREATE TABLE `ean_neighborhood_coordinates_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `region_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `coordinates` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id_idx` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_parent_region
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_parent_region`;

CREATE TABLE `ean_parent_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) DEFAULT NULL,
  `region_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relative_significance` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_class` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_name_long` varchar(510) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_region_id` int(11) DEFAULT NULL,
  `parent_region_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_region_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_region_name_long` varchar(510) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `region_id` (`region_id`),
  KEY `parent_region_id` (`parent_region_id`),
  KEY `region_id_idx` (`region_id`),
  KEY `parent_region_id_idx` (`parent_region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_parent_region_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_parent_region_old`;

CREATE TABLE `ean_parent_region_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) DEFAULT NULL,
  `region_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relative_significance` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_class` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_name_long` varchar(510) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_region_id` int(11) DEFAULT NULL,
  `parent_region_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_region_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_region_name_long` varchar(510) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `region_id` (`region_id`),
  KEY `parent_region_id` (`parent_region_id`),
  KEY `region_id_idx` (`region_id`),
  KEY `parent_region_id_idx` (`parent_region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_points_of_interest_coordinates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_points_of_interest_coordinates`;

CREATE TABLE `ean_points_of_interest_coordinates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `region_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `region_name_long` varchar(510) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `sub_classification` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id_idx` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_points_of_interest_coordinates_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_points_of_interest_coordinates_old`;

CREATE TABLE `ean_points_of_interest_coordinates_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `region_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `region_name_long` varchar(510) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL,
  `sub_classification` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id_idx` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_policy_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_policy_description`;

CREATE TABLE `ean_policy_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_policy_description_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_policy_description_old`;

CREATE TABLE `ean_policy_description_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_properties
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_properties`;

CREATE TABLE `ean_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `city` varchar(75) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `postal_code` varchar(15) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(10,8) DEFAULT NULL,
  `airport_code` varchar(10) DEFAULT NULL,
  `property_category` int(11) DEFAULT NULL,
  `property_currency` varchar(3) DEFAULT NULL,
  `star_rating` decimal(3,2) DEFAULT NULL,
  `confidence` int(11) DEFAULT NULL,
  `supplier_type` enum('ESR','EEM','GDS') DEFAULT 'ESR',
  `location` text,
  `chain_code_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `high_rate` decimal(20,8) DEFAULT NULL,
  `low_rate` decimal(20,8) DEFAULT NULL,
  `check_in_time` varchar(20) DEFAULT NULL,
  `check_out_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`),
  KEY `region_id_idx` (`region_id`),
  KEY `chain_code_id_idx` (`chain_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_properties_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_properties_old`;

CREATE TABLE `ean_properties_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `sequence_number` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `city` varchar(75) DEFAULT NULL,
  `state_province` varchar(50) DEFAULT NULL,
  `postal_code` varchar(15) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(10,8) DEFAULT NULL,
  `airport_code` varchar(10) DEFAULT NULL,
  `property_category` int(11) DEFAULT NULL,
  `property_currency` varchar(3) DEFAULT NULL,
  `star_rating` decimal(3,2) DEFAULT NULL,
  `confidence` int(11) DEFAULT NULL,
  `supplier_type` enum('ESR','EEM','GDS') DEFAULT 'ESR',
  `location` text,
  `chain_code_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `high_rate` decimal(20,8) DEFAULT NULL,
  `low_rate` decimal(20,8) DEFAULT NULL,
  `check_in_time` varchar(20) DEFAULT NULL,
  `check_out_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`),
  KEY `region_id_idx` (`region_id`),
  KEY `chain_code_id_idx` (`chain_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_property_attribute_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_property_attribute_link`;

CREATE TABLE `ean_property_attribute_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `append_txt` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`),
  KEY `attribute_id_idx` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_property_attribute_link_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_property_attribute_link_old`;

CREATE TABLE `ean_property_attribute_link_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `append_txt` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`),
  KEY `attribute_id_idx` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_property_attribute_list
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_property_attribute_list`;

CREATE TABLE `ean_property_attribute_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `attribute_desc` varchar(255) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `subtype` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_id_idx` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_property_attribute_list_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_property_attribute_list_old`;

CREATE TABLE `ean_property_attribute_list_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `language_code` varchar(5) DEFAULT NULL,
  `attribute_desc` varchar(255) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `subtype` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_id_idx` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_property_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_property_description`;

CREATE TABLE `ean_property_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_property_description_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_property_description_old`;

CREATE TABLE `ean_property_description_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_property_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_property_types`;

CREATE TABLE `ean_property_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_category` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_recreation_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_recreation_description`;

CREATE TABLE `ean_recreation_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_recreation_description_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_recreation_description_old`;

CREATE TABLE `ean_recreation_description_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_region
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_region`;

CREATE TABLE `ean_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `ean_hotel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  KEY `ean_hotel_id` (`ean_hotel_id`),
  KEY `region_id_idx` (`region_id`),
  KEY `ean_hotel_id_idx` (`ean_hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_region_center_coordinates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_region_center_coordinates`;

CREATE TABLE `ean_region_center_coordinates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) DEFAULT NULL,
  `region_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `center_latitude` decimal(9,6) DEFAULT NULL,
  `center_longitude` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id_idx` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_region_center_coordinates_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_region_center_coordinates_old`;

CREATE TABLE `ean_region_center_coordinates_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) DEFAULT NULL,
  `region_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `center_latitude` decimal(9,6) DEFAULT NULL,
  `center_longitude` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id_idx` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_region_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_region_old`;

CREATE TABLE `ean_region_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `ean_hotel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  KEY `ean_hotel_id` (`ean_hotel_id`),
  KEY `region_id_idx` (`region_id`),
  KEY `ean_hotel_id_idx` (`ean_hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_room_type_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_room_type_description`;

CREATE TABLE `ean_room_type_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `type_image` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_room_type_description_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_room_type_description_old`;

CREATE TABLE `ean_room_type_description_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `type_image` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_name` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ean_spa_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_spa_description`;

CREATE TABLE `ean_spa_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_spa_description_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_spa_description_old`;

CREATE TABLE `ean_spa_description_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_what_to_expect_description
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_what_to_expect_description`;

CREATE TABLE `ean_what_to_expect_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ean_what_to_expect_description_old
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ean_what_to_expect_description_old`;

CREATE TABLE `ean_what_to_expect_description_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hotel_id` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotel_id_idx` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table email_hash_ids
# ------------------------------------------------------------

DROP TABLE IF EXISTS `email_hash_ids`;

CREATE TABLE `email_hash_ids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hash_id` text COLLATE utf8_unicode_ci NOT NULL,
  `old_hash_id` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ext_translations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ext_translations`;

CREATE TABLE `ext_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(11) NOT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ext_translations_lookup` (`field`,`language_code`,`foreign_key`,`object_class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table faq_display
# ------------------------------------------------------------

DROP TABLE IF EXISTS `faq_display`;

CREATE TABLE `faq_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faq_id` int(11) NOT NULL,
  `controller` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table faq_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `faq_items`;

CREATE TABLE `faq_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `category` enum('general','travel_tool','travel_essential') NOT NULL,
  `popularity` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `language` enum('en','fr') NOT NULL DEFAULT 'en',
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`,`language`),
  FULLTEXT KEY `faq_search` (`question`,`answer`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Affichage de la table fare_alerts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fare_alerts`;

CREATE TABLE `fare_alerts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `site_id` int(11) NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `search_type` enum('one-way','round-trip','multi-city') COLLATE utf8_unicode_ci NOT NULL,
  `search_params` text COLLATE utf8_unicode_ci NOT NULL,
  `departure_date` datetime NOT NULL,
  `departure_airport_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `destination_airport_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_subscribe` datetime NOT NULL,
  `date_unsubscribe` datetime DEFAULT NULL,
  `next_send_date` datetime NOT NULL,
  `hash_id` text COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fare_alerts_outbox
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fare_alerts_outbox`;

CREATE TABLE `fare_alerts_outbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fare_blacklist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fare_blacklist`;

CREATE TABLE `fare_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gds_account_id` varchar(20) NOT NULL,
  `fare_type` enum('private','published') NOT NULL,
  `airline_code` char(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table fare_fetcher_route_amadeus_targets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fare_fetcher_route_amadeus_targets`;

CREATE TABLE `fare_fetcher_route_amadeus_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fare_fetcher_route_id` int(11) NOT NULL,
  `office_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `fare_type` enum('private','published','all') COLLATE utf8_unicode_ci NOT NULL,
  `airline_codes` text COLLATE utf8_unicode_ci NOT NULL,
  `airline_codes_exclude` text COLLATE utf8_unicode_ci NOT NULL,
  `disable_airline_diversity` tinyint(1) NOT NULL DEFAULT '0',
  `ptc_type` enum('pfa','adt','both') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'adt',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fare_fetcher_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fare_fetcher_routes`;

CREATE TABLE `fare_fetcher_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `origin_country_codes` text COLLATE utf8_unicode_ci NOT NULL,
  `destination_country_codes` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fare_scanner_destinations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fare_scanner_destinations`;

CREATE TABLE `fare_scanner_destinations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airport_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fare_scanner_entries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fare_scanner_entries`;

CREATE TABLE `fare_scanner_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inserted_date` datetime NOT NULL,
  `from_airport_code` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `to_airport_code` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `flight_type` enum('non_stop','one_stop','multi_stop') COLLATE utf8_unicode_ci NOT NULL,
  `trip_type` enum('one-way','roundtrip') COLLATE utf8_unicode_ci NOT NULL,
  `departure_date` date NOT NULL,
  `return_date` date NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `is_latest_price` tinyint(1) NOT NULL,
  `traffic_source_id` int(11) NOT NULL,
  `travel_agent_site_id` int(11) NOT NULL,
  `carrier` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `fare_type` enum('private','published') COLLATE utf8_unicode_ci DEFAULT NULL,
  `gds_account_id` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fare_scanner_origins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fare_scanner_origins`;

CREATE TABLE `fare_scanner_origins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airport_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fare_scanner_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fare_scanner_routes`;

CREATE TABLE `fare_scanner_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_airport_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `to_airport_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `frequency_hours` int(4) NOT NULL,
  `next_run` datetime DEFAULT NULL,
  `scanning` tinyint(1) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `route_from_to` (`from_airport_code`,`to_airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fare_scanner_site_traffic_sources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fare_scanner_site_traffic_sources`;

CREATE TABLE `fare_scanner_site_traffic_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `travel_agent_site_id` int(11) NOT NULL,
  `traffic_source_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fare_scanner_traffic_sources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fare_scanner_traffic_sources`;

CREATE TABLE `fare_scanner_traffic_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `category` enum('meta','compare','direct') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fare_scanner_travel_agent_sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fare_scanner_travel_agent_sites`;

CREATE TABLE `fare_scanner_travel_agent_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `domain_url` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `booking_engine` enum('amadeus','odysseus','flightnetwork','budgetair','cheapoair','webjet') COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fares_carriers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fares_carriers`;

CREATE TABLE `fares_carriers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `carrier_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table ffo_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ffo_config`;

CREATE TABLE `ffo_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_currency` enum('CAD','USD') NOT NULL,
  `setting` varchar(50) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ffo_route_airlines
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ffo_route_airlines`;

CREATE TABLE `ffo_route_airlines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `airlines` varchar(50) NOT NULL,
  `num_bookings` int(11) NOT NULL,
  `office_id` varchar(50) NOT NULL,
  `fare_type` enum('private','published') NOT NULL,
  `num_scans` int(11) NOT NULL,
  `num_wins` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ffo_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ffo_routes`;

CREATE TABLE `ffo_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_currency` enum('CAD','USD') NOT NULL,
  `origin` varchar(10) NOT NULL,
  `destination` varchar(10) NOT NULL,
  `city_route` tinyint(1) NOT NULL,
  `num_bookings` int(11) NOT NULL,
  `next_update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table fraud_blacklist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_blacklist`;

CREATE TABLE `fraud_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_num` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fraud_countries_matrix
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_countries_matrix`;

CREATE TABLE `fraud_countries_matrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cc_country_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ip_country_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `risk_level` enum('low_risk','medium_risk','high_risk') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fraud_email_domains
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_email_domains`;

CREATE TABLE `fraud_email_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `risk_level` enum('low_risk','medium_risk','high_risk') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fraud_email_wildcards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_email_wildcards`;

CREATE TABLE `fraud_email_wildcards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wildcard` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `risk_level` enum('low_risk','medium_risk','high_risk') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wildcard` (`wildcard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fraud_logger
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_logger`;

CREATE TABLE `fraud_logger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `details` text COLLATE utf8_unicode_ci NOT NULL,
  `score` int(11) NOT NULL,
  `session_id` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `abort_reason` text COLLATE utf8_unicode_ci,
  `cc_holder_called` tinyint(1) DEFAULT NULL,
  `cc_address_confirmed` tinyint(1) DEFAULT NULL,
  `perseuss_record_identifier` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fraud_monitorlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_monitorlist`;

CREATE TABLE `fraud_monitorlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_num` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_num` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_until` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fraud_risky_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_risky_routes`;

CREATE TABLE `fraud_risky_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_airport_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `to_airport_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `risk_level` enum('low_risk','medium_risk','high_risk') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fraud_simulation_logger
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_simulation_logger`;

CREATE TABLE `fraud_simulation_logger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `simulation_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `details` text,
  `score` int(11) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `process_status` enum('pending','running','completed','failed') NOT NULL DEFAULT 'pending',
  `inaccurate_score` tinyint(1) DEFAULT NULL,
  `is_fraud` tinyint(1) DEFAULT '0',
  `fraud_zone` enum('green','yellow','red') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `simulation_id` (`simulation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table fraud_simulation_weights
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_simulation_weights`;

CREATE TABLE `fraud_simulation_weights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `simulation_id` int(11) NOT NULL,
  `fraud_weight_id` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `simulation_id` (`simulation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table fraud_simulations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_simulations`;

CREATE TABLE `fraud_simulations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('paused','pending','running','done') NOT NULL DEFAULT 'pending',
  `booking_date_from` datetime NOT NULL,
  `booking_date_to` datetime NOT NULL,
  `bookings_total` int(11) DEFAULT '0',
  `bookings_total_red_zone` int(11) DEFAULT '0',
  `bookings_total_yellow_zone` int(11) DEFAULT '0',
  `bookings_total_green_zone` int(11) DEFAULT '0',
  `fraud_bookings_total` int(11) DEFAULT '0',
  `fraud_bookings_total_red_zone` int(11) DEFAULT '0',
  `fraud_bookings_total_yellow_zone` int(11) DEFAULT '0',
  `fraud_bookings_total_green_zone` int(11) DEFAULT '0',
  `inaccurate_bookings_total` int(11) DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `simulation_date` datetime DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table fraud_spot_checks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_spot_checks`;

CREATE TABLE `fraud_spot_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `spot_check_agent_id` int(11) NOT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `note` text,
  `task_id` int(11) NOT NULL,
  `date_reviewed` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table fraud_tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_tasks`;

CREATE TABLE `fraud_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `status` enum('new','open','waiting','resolved') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'new',
  `waiting_for` enum('customer','supplier') COLLATE utf8_unicode_ci DEFAULT NULL,
  `handled_by` int(11) DEFAULT '0',
  `resolved_by` int(11) DEFAULT '0',
  `create_date` datetime NOT NULL,
  `open_date` datetime DEFAULT NULL,
  `resolve_date` datetime DEFAULT NULL,
  `transfered_by` int(11) DEFAULT NULL,
  `manual_auth_sent` tinyint(1) DEFAULT '0',
  `approved` tinyint(1) DEFAULT '0',
  `flagged_as_fraud` tinyint(1) DEFAULT '0',
  `cancelled` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fraud_weights
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_weights`;

CREATE TABLE `fraud_weights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fraud_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fraud_weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table fraud_weights_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fraud_weights_log`;

CREATE TABLE `fraud_weights_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fraud_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `initial_weight` int(11) NOT NULL,
  `final_weight` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table location_city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location_city`;

CREATE TABLE `location_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `rank` mediumint(8) unsigned DEFAULT NULL,
  `country_id` char(2) DEFAULT NULL,
  `state_id` mediumint(8) unsigned DEFAULT NULL,
  `valid_departure` tinyint(4) NOT NULL DEFAULT '0',
  `valid_destination` tinyint(4) NOT NULL DEFAULT '1',
  `description` text,
  `head_title` varchar(255) DEFAULT NULL,
  `head_description` varchar(255) DEFAULT NULL,
  `head_keyword` varchar(255) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `numbeo_city_name` varchar(100) DEFAULT NULL,
  `numbeo_country_name` varchar(100) DEFAULT NULL,
  `airport_code` varchar(5) DEFAULT NULL,
  `airport_belong_to_me` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `numbeo_last_update_date` datetime DEFAULT '0000-00-00 00:00:00',
  `worldweatheronline_last_update_date` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table location_city_airport
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location_city_airport`;

CREATE TABLE `location_city_airport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` mediumint(11) unsigned NOT NULL,
  `airport_code` char(3) NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table location_city_cost_of_living
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location_city_cost_of_living`;

CREATE TABLE `location_city_cost_of_living` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` mediumint(8) unsigned NOT NULL,
  `item_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency` char(3) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_guide_city_id` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table location_city_weather
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location_city_weather`;

CREATE TABLE `location_city_weather` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_id` int(10) unsigned NOT NULL,
  `month` tinyint(3) unsigned NOT NULL,
  `year` year(4) DEFAULT NULL,
  `average_rainfall_last_year` float unsigned DEFAULT NULL,
  `total_rainfall_last_year` float unsigned DEFAULT NULL,
  `average_snowfall_last_year` float unsigned DEFAULT NULL,
  `total_snowfall_last_year` float unsigned DEFAULT NULL,
  `average_windspeed_last_year` tinyint(3) unsigned DEFAULT NULL,
  `average_temperature_last_year` tinyint(4) DEFAULT NULL,
  `max_temperature_last_year` tinyint(4) DEFAULT NULL,
  `min_temperature_last_year` tinyint(4) DEFAULT NULL,
  `max_temperature` tinyint(4) DEFAULT NULL,
  `min_temperature` tinyint(4) DEFAULT NULL,
  `average_daily_rainfall` tinyint(3) unsigned DEFAULT NULL,
  `average_dry_day` tinyint(3) unsigned DEFAULT NULL,
  `average_temperature` tinyint(4) DEFAULT NULL,
  `average_rainfall` float unsigned DEFAULT NULL,
  `average_snow_day` tinyint(3) unsigned DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table location_continent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location_continent`;

CREATE TABLE `location_continent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `rank` mediumint(8) unsigned DEFAULT NULL,
  `valid_departure` tinyint(4) NOT NULL DEFAULT '0',
  `valid_destination` tinyint(4) NOT NULL DEFAULT '1',
  `description` text,
  `useful_info` text,
  `head_title` varchar(255) DEFAULT NULL,
  `head_description` varchar(255) DEFAULT NULL,
  `head_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table location_country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location_country`;

CREATE TABLE `location_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(2) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `states_definition` varchar(50) DEFAULT NULL,
  `nationality_singular` varchar(100) DEFAULT NULL,
  `nationality_plural` varchar(100) DEFAULT NULL,
  `population` int(10) unsigned DEFAULT NULL,
  `population_rank` tinyint(3) unsigned DEFAULT NULL,
  `rank` mediumint(8) unsigned DEFAULT NULL,
  `continent_id` int(11) DEFAULT NULL,
  `valid_departure` tinyint(4) NOT NULL DEFAULT '0',
  `valid_destination` tinyint(4) NOT NULL DEFAULT '1',
  `description` text,
  `capital_city_id` int(10) unsigned DEFAULT NULL,
  `currency_name` varchar(50) DEFAULT NULL,
  `currency_code` char(3) DEFAULT NULL,
  `head_title` varchar(255) DEFAULT NULL,
  `head_description` varchar(255) DEFAULT NULL,
  `head_keyword` varchar(255) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `numbeo_country_name` varchar(100) DEFAULT NULL,
  `numbeo_last_update_date` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_code` (`code`),
  KEY `continent_id` (`continent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table location_country_cost_of_living
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location_country_cost_of_living`;

CREATE TABLE `location_country_cost_of_living` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` mediumint(8) unsigned NOT NULL,
  `item_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency` char(3) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_guide_country_id` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table location_region
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location_region`;

CREATE TABLE `location_region` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` mediumint(8) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `valid_departure` tinyint(4) NOT NULL DEFAULT '0',
  `valid_destination` tinyint(4) NOT NULL DEFAULT '1',
  `description` text,
  `useful_info` text,
  `head_title` varchar(255) DEFAULT NULL,
  `head_description` varchar(255) DEFAULT NULL,
  `head_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table location_slug
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location_slug`;

CREATE TABLE `location_slug` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `location_type` varchar(10) NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `is_alias` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table location_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `location_state`;

CREATE TABLE `location_state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` mediumint(8) unsigned DEFAULT NULL,
  `region_id` mediumint(8) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `valid_departure` tinyint(4) NOT NULL DEFAULT '0',
  `valid_destination` tinyint(4) NOT NULL DEFAULT '1',
  `description` text,
  `useful_info` text,
  `head_title` varchar(255) DEFAULT NULL,
  `head_description` varchar(255) DEFAULT NULL,
  `head_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table logger_entry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `logger_entry`;

CREATE TABLE `logger_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_level` tinyint(1) NOT NULL,
  `context` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `host` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table markup_generic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `markup_generic`;

CREATE TABLE `markup_generic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `affiliate_id` int(11) DEFAULT NULL,
  `fare_type` enum('published','private') COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_id` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_country_codes` text COLLATE utf8_unicode_ci,
  `to_country_codes` text COLLATE utf8_unicode_ci,
  `country_level_note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `markup` float(10,2) DEFAULT NULL,
  `markup_trickle_down` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table markup_generic_adjustments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `markup_generic_adjustments`;

CREATE TABLE `markup_generic_adjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `last_minute_markup` decimal(10,2) DEFAULT '0.00',
  `roundtrip_markup` decimal(10,2) DEFAULT '0.00',
  `oneway_markup` decimal(10,2) DEFAULT '0.00',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table markup_specific
# ------------------------------------------------------------

DROP TABLE IF EXISTS `markup_specific`;

CREATE TABLE `markup_specific` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `fare_type` enum('published','private') COLLATE utf8_unicode_ci NOT NULL,
  `office_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `from_airport_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `to_airport_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `airline_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `itinerary_type` enum('roundtrip','oneway') COLLATE utf8_unicode_ci NOT NULL,
  `lead_time` enum('last_minute','regular') COLLATE utf8_unicode_ci NOT NULL,
  `markup` float(10,2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table moneris_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `moneris_transactions`;

CREATE TABLE `moneris_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `filename` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `merchant_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `transaction_date` datetime NOT NULL,
  `settlement_date` date NOT NULL,
  `device_num` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `card_type` int(2) NOT NULL,
  `credit_card_num` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `auth_code` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `reconciled` tinyint(1) NOT NULL,
  `run_once` tinyint(1) NOT NULL,
  `statement_transaction_moneris_id` int(11) DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `pnr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recorded_amount` decimal(11,2) DEFAULT '0.00',
  `difference` decimal(11,2) DEFAULT '0.00',
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table newsletter_subscribers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `newsletter_subscribers`;

CREATE TABLE `newsletter_subscribers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_unsubscribed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table phone_call_reasons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `phone_call_reasons`;

CREATE TABLE `phone_call_reasons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `client_type` enum('new','old') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table phone_calls
# ------------------------------------------------------------

DROP TABLE IF EXISTS `phone_calls`;

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `reason_id` int(11) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pre_auth_failures
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pre_auth_failures`;

CREATE TABLE `pre_auth_failures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` date NOT NULL,
  `num_cvv_errors` int(11) NOT NULL,
  `num_exp_date_errors` int(11) NOT NULL,
  `num_pre_auth_errors` int(11) NOT NULL,
  `blocked_until` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip_address` (`ip_address`,`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table pricing_behavior_rule_location_conditions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_behavior_rule_location_conditions`;

CREATE TABLE `pricing_behavior_rule_location_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pricing_behavior_rule_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `latitude` decimal(10,5) DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `exclude` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pricing_behavior_condition_id` (`pricing_behavior_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pricing_behavior_rule_time_conditions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_behavior_rule_time_conditions`;

CREATE TABLE `pricing_behavior_rule_time_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pricing_behavior_rule_id` int(11) NOT NULL,
  `start_time` tinyint(4) NOT NULL,
  `end_time` tinyint(4) NOT NULL,
  `apply_on_mon` tinyint(1) NOT NULL,
  `apply_on_tue` tinyint(1) NOT NULL,
  `apply_on_wed` tinyint(1) NOT NULL,
  `apply_on_thu` tinyint(1) NOT NULL,
  `apply_on_fri` tinyint(1) NOT NULL,
  `apply_on_sat` tinyint(1) NOT NULL,
  `apply_on_sun` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pricing_behavior_rule_id` (`pricing_behavior_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pricing_behavior_rules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_behavior_rules`;

CREATE TABLE `pricing_behavior_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pricing_behavior_id` int(11) NOT NULL,
  `published_pricepoint_id` int(11) NOT NULL,
  `private_pricepoint_id` int(11) NOT NULL,
  `priority_index` smallint(6) NOT NULL,
  `country_codes_include` text NOT NULL,
  `country_codes_exclude` text NOT NULL,
  `include_proxy` tinyint(1) NOT NULL,
  `include_ip_list` text NOT NULL,
  `exclude_proxy` tinyint(1) NOT NULL,
  `exclude_ip_list` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pricing_behavior_id` (`pricing_behavior_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pricing_behaviors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_behaviors`;

CREATE TABLE `pricing_behaviors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `site_currency` char(3) NOT NULL,
  `default_published_pricepoint_id` int(11) NOT NULL,
  `default_private_pricepoint_id` int(11) NOT NULL,
  `is_global` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pricing_bns_config_time_conditions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_bns_config_time_conditions`;

CREATE TABLE `pricing_bns_config_time_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bns_config_id` int(11) NOT NULL,
  `start_time` tinyint(4) NOT NULL,
  `end_time` tinyint(4) NOT NULL,
  `apply_on_mon` tinyint(1) NOT NULL,
  `apply_on_tue` tinyint(1) NOT NULL,
  `apply_on_wed` tinyint(1) NOT NULL,
  `apply_on_thu` tinyint(1) NOT NULL,
  `apply_on_fri` tinyint(1) NOT NULL,
  `apply_on_sat` tinyint(1) NOT NULL,
  `apply_on_sun` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bns_config_id` (`bns_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pricing_bns_configs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_bns_configs`;

CREATE TABLE `pricing_bns_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_currency` char(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='bns = Bait and switch';



# Affichage de la table pricing_mapping
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_mapping`;

CREATE TABLE `pricing_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `product_group_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_type` enum('meta','direct','compare','fare-alert','newsletter','phone','other','adword','uncommon-search','uncommon-device') NOT NULL,
  `behavior_id` int(11) NOT NULL,
  `night_behavior_id` int(11) NOT NULL DEFAULT '0',
  `bait_and_switch` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `route_id` (`route_id`,`product_group_id`,`affiliate_type`),
  KEY `behavior_id` (`behavior_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pricing_mapping_behaviors
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_mapping_behaviors`;

CREATE TABLE `pricing_mapping_behaviors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `product_group_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) DEFAULT NULL,
  `affiliate_type` enum('meta','direct','compare','fare-alert','newsletter','phone','other','adword','adword2','uncommon-search','uncommon-device') DEFAULT NULL,
  `behavior_id` int(11) NOT NULL,
  `night_behavior_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `route_id` (`route_id`,`product_group_id`,`affiliate_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pricing_mapping_bns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_mapping_bns`;

CREATE TABLE `pricing_mapping_bns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `product_group_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) DEFAULT NULL,
  `affiliate_type` enum('meta','direct','compare','fare-alert','newsletter','phone','other','adword','adword2','uncommon-search','uncommon-device') DEFAULT NULL,
  `frequency_percentage` int(11) DEFAULT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `route_id` (`route_id`,`product_group_id`,`affiliate_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pricing_mapping_limits
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_mapping_limits`;

CREATE TABLE `pricing_mapping_limits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `product_group_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) DEFAULT NULL,
  `affiliate_type` enum('meta','direct','compare','fare-alert','newsletter','phone','other','adword','adword2','uncommon-search','uncommon-device') DEFAULT NULL,
  `min_published_markup` decimal(10,2) DEFAULT NULL,
  `min_private_markup` decimal(10,2) DEFAULT NULL,
  `restrict_published` tinyint(1) DEFAULT NULL,
  `restrict_private` tinyint(1) DEFAULT NULL,
  `night_min_published_markup` decimal(10,2) DEFAULT NULL,
  `night_min_private_markup` decimal(10,2) DEFAULT NULL,
  `night_restrict_published` tinyint(1) DEFAULT NULL,
  `night_restrict_private` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `route_id` (`route_id`,`product_group_id`,`affiliate_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pricing_mapping_overrides
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_mapping_overrides`;

CREATE TABLE `pricing_mapping_overrides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `product_group_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) DEFAULT NULL,
  `affiliate_type` enum('meta','direct','compare','fare-alert','newsletter','phone','other','adword','adword2','uncommon-search','uncommon-device') DEFAULT NULL,
  `published_amount` decimal(10,2) DEFAULT NULL,
  `private_amount` decimal(10,2) DEFAULT NULL,
  `pub_limit` decimal(10,2) DEFAULT NULL,
  `night_published_amount` decimal(10,2) DEFAULT NULL,
  `night_private_amount` decimal(10,2) DEFAULT NULL,
  `night_pub_limit` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `route_id` (`route_id`,`product_group_id`,`affiliate_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pricing_multi_pax_configs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_multi_pax_configs`;

CREATE TABLE `pricing_multi_pax_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_currency` char(3) NOT NULL,
  `adt_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `chd_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `inf_discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pricing_pricepoints
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_pricepoints`;

CREATE TABLE `pricing_pricepoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fare_type` enum('private','published') COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `pub_limit` decimal(10,2) NOT NULL,
  `display_as_opaque` tinyint(1) NOT NULL,
  `hide_airline_logo` tinyint(1) NOT NULL,
  `do_not_display` tinyint(1) NOT NULL,
  `bait_and_switch` tinyint(1) NOT NULL,
  `bait_and_switch_amount` decimal(10,2) NOT NULL,
  `disable_bpg_precheck` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table pricing_route_product_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_route_product_groups`;

CREATE TABLE `pricing_route_product_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pricing_route_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pricing_route_id` (`pricing_route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pricing_route_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_route_products`;

CREATE TABLE `pricing_route_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_group_id` int(11) NOT NULL,
  `airline_codes` text NOT NULL,
  `mixed_only` tinyint(1) DEFAULT NULL,
  `one_way_only` tinyint(1) DEFAULT NULL,
  `destination_countries` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_group_id` (`product_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table pricing_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pricing_routes`;

CREATE TABLE `pricing_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `origin` varchar(3) NOT NULL,
  `destination` varchar(3) NOT NULL,
  `is_specific` tinyint(1) NOT NULL,
  `site_currency` char(3) NOT NULL,
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table provider_group_fee_rule_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provider_group_fee_rule_products`;

CREATE TABLE `provider_group_fee_rule_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `airline_codes` text NOT NULL,
  `mixed_only` tinyint(1) NOT NULL,
  `origin_countries` text NOT NULL,
  `destination_countries` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fee_rule_id` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table provider_group_fee_rules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provider_group_fee_rules`;

CREATE TABLE `provider_group_fee_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_group_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `private_merchant_fee` decimal(10,4) NOT NULL,
  `private_ticket_fee` decimal(10,2) NOT NULL,
  `published_merchant_fee` decimal(10,4) NOT NULL,
  `published_ticket_fee` decimal(10,2) NOT NULL,
  `note` text,
  PRIMARY KEY (`id`),
  KEY `provider_group_id` (`provider_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table provider_group_providers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provider_group_providers`;

CREATE TABLE `provider_group_providers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_group_id` int(11) NOT NULL,
  `gds` enum('amadeus','travelport','softvoyage') NOT NULL,
  `gds_pcc` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `provider_group_id` (`provider_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table provider_group_selling_rule_products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provider_group_selling_rule_products`;

CREATE TABLE `provider_group_selling_rule_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_id` int(11) NOT NULL,
  `airline_codes` text NOT NULL,
  `mixed_only` tinyint(1) NOT NULL,
  `origin_countries` text NOT NULL,
  `destination_countries` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_rule_id` (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table provider_group_selling_rules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provider_group_selling_rules`;

CREATE TABLE `provider_group_selling_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_group_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `private_can_sell_standard_web` tinyint(1) NOT NULL,
  `private_can_sell_opaque` tinyint(1) NOT NULL,
  `private_can_sell_offline` tinyint(1) NOT NULL,
  `published_can_sell_standard_web` tinyint(1) NOT NULL,
  `published_can_sell_opaque` tinyint(1) NOT NULL,
  `published_can_sell_offline` tinyint(1) NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `provider_group_id` (`provider_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table provider_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `provider_groups`;

CREATE TABLE `provider_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `site_currency` varchar(3) NOT NULL,
  `private_merchant_fee` decimal(10,4) NOT NULL,
  `private_ticket_fee` decimal(10,2) NOT NULL,
  `published_merchant_fee` decimal(10,4) NOT NULL,
  `published_ticket_fee` decimal(10,2) NOT NULL,
  `private_can_sell_standard_web` tinyint(1) NOT NULL,
  `private_can_sell_opaque` tinyint(1) NOT NULL,
  `private_can_sell_offline` tinyint(1) NOT NULL,
  `published_can_sell_standard_web` tinyint(1) NOT NULL,
  `published_can_sell_opaque` tinyint(1) NOT NULL,
  `published_can_sell_offline` tinyint(1) NOT NULL,
  `refund_fee` decimal(10,2) NOT NULL,
  `exchange_fee` decimal(10,2) NOT NULL,
  `void_fee` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table reconciliation_changes_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reconciliation_changes_log`;

CREATE TABLE `reconciliation_changes_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `statement_item_id` int(11) NOT NULL,
  `statement_transaction_id` int(11) DEFAULT NULL,
  `action` enum('add','edit','delete') NOT NULL,
  `type` enum('agency','insurance','merchant','transaction') NOT NULL,
  `date_added` datetime NOT NULL,
  `agent_id` int(11) NOT NULL,
  `commission_before` decimal(10,2) DEFAULT '0.00',
  `commission_after` decimal(10,2) DEFAULT '0.00',
  `sup_fee_before` decimal(10,2) DEFAULT '0.00',
  `sup_fee_after` decimal(10,2) DEFAULT '0.00',
  `mrc_fee_before` decimal(10,2) DEFAULT '0.00',
  `mrc_fee_after` decimal(10,2) DEFAULT '0.00',
  `net_fare_before` decimal(10,2) DEFAULT '0.00',
  `net_fare_after` decimal(10,2) DEFAULT '0.00',
  `base_fare_before` decimal(10,2) DEFAULT '0.00',
  `base_fare_after` decimal(10,2) DEFAULT '0.00',
  `tax_fare_before` decimal(10,2) DEFAULT '0.00',
  `tax_fare_after` decimal(10,2) DEFAULT '0.00',
  `penalty_before` decimal(10,2) DEFAULT '0.00',
  `penalty_after` decimal(10,2) DEFAULT '0.00',
  `cc_amount_before` decimal(10,2) DEFAULT '0.00',
  `cc_amount_after` decimal(10,2) DEFAULT '0.00',
  `transaction_date_before` datetime DEFAULT NULL,
  `transaction_date_after` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table reconciliation_download_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reconciliation_download_log`;

CREATE TABLE `reconciliation_download_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type` varchar(50) NOT NULL,
  `report_from` date NOT NULL,
  `report_to` date NOT NULL,
  `download_date` datetime NOT NULL,
  `download_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table respro_issue_attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `respro_issue_attachments`;

CREATE TABLE `respro_issue_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `respro_issue_id` int(11) NOT NULL,
  `respro_issue_message_id` int(11) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `file_path` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table respro_issue_messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `respro_issue_messages`;

CREATE TABLE `respro_issue_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `respro_issue_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `date_added` datetime NOT NULL,
  `added_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table respro_issues
# ------------------------------------------------------------

DROP TABLE IF EXISTS `respro_issues`;

CREATE TABLE `respro_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_added` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `issue_type` enum('technical') NOT NULL DEFAULT 'technical',
  `priority` enum('urgent','very_high','high','moderate','low','very_low') NOT NULL,
  `status` enum('unresolved','resolved') NOT NULL DEFAULT 'unresolved',
  `title` varchar(256) NOT NULL,
  `resolved_by` int(11) DEFAULT NULL,
  `resolve_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table route_destination_trends
# ------------------------------------------------------------

DROP TABLE IF EXISTS `route_destination_trends`;

CREATE TABLE `route_destination_trends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_continent` smallint(5) unsigned NOT NULL,
  `from_country` char(3) NOT NULL,
  `from_region` smallint(5) unsigned DEFAULT NULL,
  `from_state` smallint(5) unsigned DEFAULT NULL,
  `from_city` smallint(5) unsigned NOT NULL,
  `from_airport` char(3) NOT NULL,
  `to_continent` smallint(5) unsigned NOT NULL,
  `to_country` char(3) NOT NULL,
  `to_region` smallint(5) unsigned DEFAULT NULL,
  `to_state` smallint(5) unsigned DEFAULT NULL,
  `to_city` smallint(5) unsigned NOT NULL,
  `to_airport` char(3) NOT NULL,
  `num_searches` int(11) NOT NULL DEFAULT '1',
  `site_currency` char(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `from_airport` (`from_airport`),
  KEY `to_airport` (`to_airport`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table route_destination_trends_temp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `route_destination_trends_temp`;

CREATE TABLE `route_destination_trends_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_continent` smallint(5) unsigned NOT NULL,
  `from_country` char(3) NOT NULL,
  `from_region` smallint(5) unsigned DEFAULT NULL,
  `from_state` smallint(5) unsigned DEFAULT NULL,
  `from_city` smallint(5) unsigned NOT NULL,
  `from_airport` char(3) NOT NULL,
  `to_continent` smallint(5) unsigned NOT NULL,
  `to_country` char(3) NOT NULL,
  `to_region` smallint(5) unsigned DEFAULT NULL,
  `to_state` smallint(5) unsigned DEFAULT NULL,
  `to_city` smallint(5) unsigned NOT NULL,
  `to_airport` char(3) NOT NULL,
  `num_searches` int(11) NOT NULL DEFAULT '1',
  `site_currency` char(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table route_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `route_groups`;

CREATE TABLE `route_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table route_groups_airports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `route_groups_airports`;

CREATE TABLE `route_groups_airports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airport_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `route_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `route_group_id` (`route_group_id`),
  KEY `airport_code` (`airport_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table route_price_trends
# ------------------------------------------------------------

DROP TABLE IF EXISTS `route_price_trends`;

CREATE TABLE `route_price_trends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `search_year` year(4) NOT NULL,
  `search_week` tinyint(2) NOT NULL,
  `departure_year` year(4) NOT NULL,
  `departure_week` tinyint(2) NOT NULL,
  `from_airport` char(3) NOT NULL,
  `to_airport` char(3) NOT NULL,
  `from_country` char(3) NOT NULL,
  `to_country` char(3) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency` char(3) NOT NULL,
  `last_update_time` datetime NOT NULL,
  `validating_carrier` char(2) NOT NULL,
  `departure_date` datetime NOT NULL,
  `return_date` datetime NOT NULL,
  `itinerary` text NOT NULL,
  `num_stops` tinyint(2) NOT NULL DEFAULT '0',
  `num_searches` int(10) unsigned NOT NULL DEFAULT '1',
  `site_currency` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_route` (`search_year`,`search_week`,`departure_year`,`departure_week`,`from_airport`,`to_airport`),
  KEY `from_airport` (`from_airport`),
  KEY `to_airport` (`to_airport`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `routes`;

CREATE TABLE `routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `from_route_group_id` int(11) DEFAULT NULL,
  `to_route_group_id` int(11) DEFAULT NULL,
  `gateway_route_group_id` int(11) DEFAULT NULL,
  `limit_of_points_beyond_destination` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_route_group_id` (`from_route_group_id`),
  KEY `to_route_group_id` (`to_route_group_id`),
  KEY `gateway_route_group_id` (`gateway_route_group_id`),
  CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`from_route_group_id`) REFERENCES `route_groups` (`id`),
  CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`to_route_group_id`) REFERENCES `route_groups` (`id`),
  CONSTRAINT `routes_ibfk_3` FOREIGN KEY (`gateway_route_group_id`) REFERENCES `route_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table rules_fare
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rules_fare`;

CREATE TABLE `rules_fare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_ids` varchar(50) NOT NULL,
  `office_ids` text NOT NULL,
  `fare_type` enum('published','private') NOT NULL,
  `airline_codes` text NOT NULL,
  `from_country_codes` text NOT NULL,
  `to_country_codes` text NOT NULL,
  `sell` tinyint(1) NOT NULL,
  `display_private` tinyint(1) NOT NULL,
  `display_opaque` tinyint(1) NOT NULL,
  `pub_tst_first` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `note` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rules_fare_fetch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rules_fare_fetch`;

CREATE TABLE `rules_fare_fetch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT '1',
  `level` enum('office_id','route','country','airport','currency') DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `office_id` varchar(15) DEFAULT NULL,
  `rule_route_id` int(11) DEFAULT NULL,
  `to_country_codes` text,
  `to_airport_codes` text,
  `airline_no_sell` text,
  `num_winners_published` int(11) DEFAULT NULL,
  `num_winners_private` int(11) DEFAULT NULL,
  `num_winners_published_trickle_down` tinyint(1) DEFAULT NULL,
  `num_winners_private_trickle_down` tinyint(1) DEFAULT NULL,
  `airline_no_sell_trickle_down` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rules_fare_fetch_targets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rules_fare_fetch_targets`;

CREATE TABLE `rules_fare_fetch_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_fare_fetch_id` int(11) NOT NULL,
  `fare_type` enum('all','published','private') NOT NULL,
  `num_results` int(11) NOT NULL,
  `airline_codes` text,
  `airline_codes_type` enum('including','excluding') NOT NULL,
  `use_pfa` tinyint(1) DEFAULT NULL,
  `search_ptcs` varchar(15) DEFAULT 'ADT',
  `use_expert_search` tinyint(1) DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL,
  `internal_api_user` tinyint(1) NOT NULL DEFAULT '1',
  `external_api_user` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rules_markup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rules_markup`;

CREATE TABLE `rules_markup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT '1',
  `level` varchar(50) DEFAULT NULL,
  `rule_route_id` int(11) DEFAULT NULL,
  `affiliate_ids` text,
  `affiliate_group_name` varchar(255) DEFAULT NULL,
  `to_country_codes` text,
  `airline_codes` text,
  `published_com` float(10,2) DEFAULT NULL,
  `published_com_type` enum('flat','percent') DEFAULT NULL,
  `published_com_floor` float(10,2) DEFAULT NULL,
  `published_com_ceil` float(10,2) DEFAULT NULL,
  `published_com_trickle_down` tinyint(1) DEFAULT NULL,
  `published_non_com` float(10,2) DEFAULT NULL,
  `published_non_com_type` enum('flat','percent') DEFAULT NULL,
  `published_non_com_floor` float(10,2) DEFAULT NULL,
  `published_non_com_ceil` float(10,2) DEFAULT NULL,
  `published_non_com_trickle_down` tinyint(1) DEFAULT NULL,
  `private` float(10,2) DEFAULT NULL,
  `private_type` enum('flat','percent') DEFAULT NULL,
  `private_floor` float(10,2) DEFAULT NULL,
  `private_ceil` float(10,2) DEFAULT NULL,
  `private_trickle_down` tinyint(1) DEFAULT NULL,
  `private_published_limit` float(10,2) DEFAULT NULL,
  `opaque` float(10,2) DEFAULT NULL,
  `opaque_type` enum('flat','percent') DEFAULT NULL,
  `opaque_floor` float(10,2) DEFAULT NULL,
  `opaque_ceil` float(10,2) DEFAULT NULL,
  `opaque_trickle_down` tinyint(1) DEFAULT NULL,
  `opaque_private_limit` float(10,2) DEFAULT NULL,
  `num_opaque_per_airline` int(11) DEFAULT NULL,
  `num_opaque_per_airline_trickle_down` tinyint(1) DEFAULT NULL,
  `adjustment_oneway` float(10,2) DEFAULT NULL,
  `adjustment_oneway_trickle_down` tinyint(1) DEFAULT NULL,
  `adjustment_inbound` float(10,2) DEFAULT NULL,
  `adjustment_inbound_trickle_down` tinyint(1) DEFAULT NULL,
  `adjustment_lastminute` float(10,2) DEFAULT NULL,
  `adjustment_lastminute_trickle_down` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rules_markup_speficic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rules_markup_speficic`;

CREATE TABLE `rules_markup_speficic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_markup_id` int(11) NOT NULL,
  `fare_type` enum('published','private') COLLATE utf8_unicode_ci NOT NULL,
  `office_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `from_airport_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `to_airport_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `airline_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `itinerary_type` enum('roundtrip','oneway') COLLATE utf8_unicode_ci NOT NULL,
  `lead_time` enum('last_minute','regular') COLLATE utf8_unicode_ci NOT NULL,
  `markup` float(10,2) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table rules_office_override
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rules_office_override`;

CREATE TABLE `rules_office_override` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `rule_route_id` int(11) DEFAULT NULL,
  `to_country_codes` text,
  `airline_codes` text,
  `published_com` varchar(30) DEFAULT NULL,
  `published_com_trickle_down` tinyint(1) DEFAULT NULL,
  `published_non_com` varchar(30) DEFAULT NULL,
  `published_non_com_trickle_down` tinyint(1) DEFAULT NULL,
  `private` varchar(30) DEFAULT NULL,
  `private_trickle_down` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table rules_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rules_routes`;

CREATE TABLE `rules_routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `from_country_codes` text NOT NULL,
  `to_country_codes` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table sales_reports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sales_reports`;

CREATE TABLE `sales_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pnr` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ticket_number` bigint(18) NOT NULL,
  `ticket_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `taxes` decimal(10,2) NOT NULL,
  `commission` decimal(10,2) NOT NULL,
  `fop` enum('credit_card','cheque','cash','miscellaneous','tkt_exchange') COLLATE utf8_unicode_ci NOT NULL,
  `reconcile_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `office_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `date_updated` datetime DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `debug` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `pnr` (`pnr`,`ticket_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table sites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sites`;

CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `secure_url` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email_layout` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `acronym` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_small` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_txt` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_class` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manual_auth_pdf` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table supplier_commission_rule_conditions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier_commission_rule_conditions`;

CREATE TABLE `supplier_commission_rule_conditions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_commission_rule_id` int(11) NOT NULL,
  `from_country_code` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_continent_region_id` int(11) DEFAULT NULL,
  `from_continent_id` int(11) DEFAULT NULL,
  `to_country_code` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_continent_region_id` int(11) DEFAULT NULL,
  `to_continent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `supplier_commission_rule_id` (`supplier_commission_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table supplier_commission_rules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier_commission_rules`;

CREATE TABLE `supplier_commission_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `office_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `validating_carrier` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fare_type` enum('published','private','all') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `booking_classes_inclusive` varchar(51) COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_classes_exclusive` varchar(51) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `fee_type` enum('flat','percent') COLLATE utf8_unicode_ci NOT NULL,
  `fee_amount` decimal(12,4) NOT NULL,
  `default_rule` tinyint(1) DEFAULT NULL,
  `from_country_codes` text COLLATE utf8_unicode_ci,
  `to_country_codes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table supplier_rules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier_rules`;

CREATE TABLE `supplier_rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `level` enum('route','airline','office_id','fare_type') COLLATE utf8_unicode_ci DEFAULT NULL,
  `fare_type` enum('private','published') COLLATE utf8_unicode_ci NOT NULL,
  `office_id` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `airline_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_country_codes` text COLLATE utf8_unicode_ci,
  `to_country_codes` text COLLATE utf8_unicode_ci,
  `country_level_note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_markup` decimal(10,2) DEFAULT NULL,
  `min_markup_type` enum('percent','flat') COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_markup_trickle_down` tinyint(1) DEFAULT NULL,
  `max_markup` decimal(10,2) DEFAULT NULL,
  `max_markup_type` enum('percent','flat') COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_markup_trickle_down` tinyint(1) DEFAULT NULL,
  `supplier_fee_flat` decimal(10,2) DEFAULT NULL,
  `supplier_fee_flat_type` enum('per_passenger','per_booking') COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_fee_trickle_down` tinyint(1) DEFAULT NULL,
  `websell` tinyint(1) DEFAULT NULL,
  `websell_trickle_down` tinyint(1) DEFAULT NULL,
  `cc_not_accepted` tinyint(1) DEFAULT '0',
  `merchant_fee` decimal(5,2) DEFAULT NULL,
  `merchant_fee_trickle_down` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table suppliers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table support_email_canned_replies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `support_email_canned_replies`;

CREATE TABLE `support_email_canned_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table support_emails
# ------------------------------------------------------------

DROP TABLE IF EXISTS `support_emails`;

CREATE TABLE `support_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `support_ticket_id` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `support_ticket_task_id` int(11) DEFAULT NULL,
  `site_id` int(11) NOT NULL,
  `email_date` datetime DEFAULT NULL,
  `from` text COLLATE utf8_unicode_ci NOT NULL,
  `to` text COLLATE utf8_unicode_ci NOT NULL,
  `cc` text COLLATE utf8_unicode_ci,
  `bcc` text COLLATE utf8_unicode_ci,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `message_html` text COLLATE utf8_unicode_ci,
  `message_text` text COLLATE utf8_unicode_ci,
  `attachments` text COLLATE utf8_unicode_ci,
  `status` enum('new','open','resolved') COLLATE utf8_unicode_ci NOT NULL,
  `customer_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `marked_as_spam_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table support_ticket_bookings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `support_ticket_bookings`;

CREATE TABLE `support_ticket_bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `support_ticket_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table support_ticket_tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `support_ticket_tasks`;

CREATE TABLE `support_ticket_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `support_ticket_id` int(11) NOT NULL,
  `source` enum('email','phone') COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('new','open','waiting','resolved') COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  `handled_by` int(11) DEFAULT NULL,
  `resolved_by` int(11) DEFAULT NULL,
  `date_resolved` datetime DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `customer_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfered_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table support_tickets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `support_tickets`;

CREATE TABLE `support_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table surfer_fare_searches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `surfer_fare_searches`;

CREATE TABLE `surfer_fare_searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surfer_id` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `trip_type` enum('one-way','round-trip','multi-city') COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_airport_code` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_airport_code` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `num_adults` int(11) DEFAULT NULL,
  `num_children` int(11) DEFAULT NULL,
  `num_infant_seat` int(11) DEFAULT NULL,
  `num_infant_lap` int(11) DEFAULT NULL,
  `search_params` text COLLATE utf8_unicode_ci,
  `search_id` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `min_price_per_passenger` decimal(10,2) DEFAULT NULL,
  `currency` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `surfer_id_2` (`surfer_id`,`search_id`),
  KEY `surfer_id` (`surfer_id`,`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table surfer_hotel_searches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `surfer_hotel_searches`;

CREATE TABLE `surfer_hotel_searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `surfer_id` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `arrival_date` date DEFAULT NULL,
  `departure_date` date DEFAULT NULL,
  `num_rooms` int(11) DEFAULT NULL,
  `num_adults` int(11) DEFAULT NULL,
  `num_children` int(11) DEFAULT NULL,
  `search_params` text COLLATE utf8_unicode_ci,
  `search_id` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `booking_id` int(11) DEFAULT NULL,
  `min_avg_price_per_night` decimal(10,2) DEFAULT NULL,
  `currency` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `surfer_id_2` (`surfer_id`,`search_id`),
  KEY `surfer_id` (`surfer_id`,`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table system_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `system_settings`;

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `Description` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_running` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table TABLE 136
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TABLE 136`;

CREATE TABLE `TABLE 136` (
  `Destination` varchar(58) DEFAULT NULL,
  `DestinationID` varchar(36) DEFAULT NULL,
  `CenterLongitude` varchar(36) DEFAULT NULL,
  `CenterLatitude` decimal(10,6) DEFAULT NULL,
  `StateProvince` varchar(20) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Affichage de la table temp_cities_coord
# ------------------------------------------------------------

DROP TABLE IF EXISTS `temp_cities_coord`;

CREATE TABLE `temp_cities_coord` (
  `city_id` varchar(255) NOT NULL,
  `country_id` varchar(255) NOT NULL,
  `region_id` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `latitude` varchar(255) NOT NULL,
  `longitude` varchar(255) NOT NULL,
  `timezone` varchar(255) NOT NULL,
  `dma_id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table temp_countries_coord
# ------------------------------------------------------------

DROP TABLE IF EXISTS `temp_countries_coord`;

CREATE TABLE `temp_countries_coord` (
  `country_id` int(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `fips104` varchar(255) DEFAULT NULL,
  `iso2` varchar(255) DEFAULT NULL,
  `iso3` varchar(255) DEFAULT NULL,
  `ison` varchar(255) DEFAULT NULL,
  `internet` varchar(255) DEFAULT NULL,
  `capital` varchar(255) DEFAULT NULL,
  `map_reference` varchar(255) DEFAULT NULL,
  `nationality_singular` varchar(255) DEFAULT NULL,
  `nationality_plural` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `population` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table test
# ------------------------------------------------------------

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fuck` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table ticketing_tasks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ticketing_tasks`;

CREATE TABLE `ticketing_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) NOT NULL,
  `status` enum('new','open','waiting','resolved') COLLATE utf8_unicode_ci NOT NULL,
  `waiting_for` enum('customer','airline') COLLATE utf8_unicode_ci DEFAULT NULL,
  `deadline_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  `handled_by` int(11) DEFAULT NULL,
  `open_date` datetime DEFAULT NULL,
  `resolved_by` int(11) DEFAULT NULL,
  `resolve_date` datetime DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `transfered_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table travel_guide_city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `travel_guide_city`;

CREATE TABLE `travel_guide_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) NOT NULL,
  `city_rank` mediumint(8) unsigned DEFAULT NULL,
  `country_code` varchar(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `valid_departure` tinyint(4) NOT NULL DEFAULT '0',
  `valid_destination` tinyint(4) NOT NULL DEFAULT '1',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `location_slug` varchar(255) DEFAULT NULL,
  `image_path` text NOT NULL,
  `head_title` varchar(255) DEFAULT NULL,
  `head_desc` varchar(255) DEFAULT NULL,
  `head_keyword` varchar(255) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `weather_network_code` text NOT NULL,
  `numbeo_city_name` varchar(100) NOT NULL,
  `numbeo_country_name` varchar(100) DEFAULT NULL,
  `airport_code` varchar(5) DEFAULT NULL,
  `numbeo_last_update_date` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table travel_guide_city_airport
# ------------------------------------------------------------

DROP TABLE IF EXISTS `travel_guide_city_airport`;

CREATE TABLE `travel_guide_city_airport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL,
  `airport_code` char(3) NOT NULL,
  `airport_rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table travel_guide_city_cost_of_living
# ------------------------------------------------------------

DROP TABLE IF EXISTS `travel_guide_city_cost_of_living`;

CREATE TABLE `travel_guide_city_cost_of_living` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_guide_city_id` int(11) NOT NULL,
  `item_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency` char(3) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_guide_city_id` (`travel_guide_city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table travel_guide_continent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `travel_guide_continent`;

CREATE TABLE `travel_guide_continent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `continent_id` int(11) DEFAULT NULL,
  `continent_name` varchar(255) NOT NULL,
  `continent_rank` mediumint(8) unsigned DEFAULT NULL,
  `valid_departure` tinyint(4) NOT NULL DEFAULT '0',
  `valid_destination` tinyint(4) NOT NULL DEFAULT '1',
  `content` text NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `location_slug` varchar(255) DEFAULT NULL,
  `image_path` text,
  `head_title` varchar(255) DEFAULT NULL,
  `head_desc` varchar(255) DEFAULT NULL,
  `head_keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `continent_id` (`continent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table travel_guide_country
# ------------------------------------------------------------

DROP TABLE IF EXISTS `travel_guide_country`;

CREATE TABLE `travel_guide_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(11) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `country_rank` mediumint(8) unsigned DEFAULT NULL,
  `continent_id` int(11) DEFAULT NULL,
  `valid_departure` tinyint(4) NOT NULL DEFAULT '0',
  `valid_destination` tinyint(4) NOT NULL DEFAULT '1',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `location_slug` varchar(255) NOT NULL,
  `capital_city_id` int(10) unsigned DEFAULT NULL,
  `currency_code` char(3) DEFAULT NULL,
  `image_path` text NOT NULL,
  `head_title` varchar(255) DEFAULT NULL,
  `head_desc` varchar(255) DEFAULT NULL,
  `head_keyword` varchar(255) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `weather_network_code` text,
  `numbeo_country_name` varchar(100) DEFAULT NULL,
  `numbeo_last_update_date` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_code` (`country_code`),
  KEY `continent_id` (`continent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Affichage de la table travel_guide_country_cost_of_living
# ------------------------------------------------------------

DROP TABLE IF EXISTS `travel_guide_country_cost_of_living`;

CREATE TABLE `travel_guide_country_cost_of_living` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_guide_country_id` int(11) NOT NULL,
  `item_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency` char(3) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `travel_guide_country_id` (`travel_guide_country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table travel_guides
# ------------------------------------------------------------

DROP TABLE IF EXISTS `travel_guides`;

CREATE TABLE `travel_guides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(1) NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `language_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('city','country') COLLATE utf8_unicode_ci NOT NULL,
  `txt_overview` text COLLATE utf8_unicode_ci,
  `txt_things_to_do` text COLLATE utf8_unicode_ci,
  `txt_where_to_stay` text COLLATE utf8_unicode_ci,
  `txt_visa_info` text COLLATE utf8_unicode_ci,
  `txt_when_to_visit` text COLLATE utf8_unicode_ci,
  `txt_local_weather` text COLLATE utf8_unicode_ci,
  `txt_currency` text COLLATE utf8_unicode_ci,
  `featured` tinyint(1) DEFAULT '0',
  `featured_home` tinyint(1) DEFAULT '0',
  `order_position` int(2) DEFAULT NULL,
  `airport_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `weather_place_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table valc_account_request
# ------------------------------------------------------------

DROP TABLE IF EXISTS `valc_account_request`;

CREATE TABLE `valc_account_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registrant_first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `registrant_last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `manager_first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `manager_last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `manager_is_registrant` tinyint(1) DEFAULT '0',
  `owner_first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `owner_last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `owner_is_registrant` tinyint(1) DEFAULT '0',
  `address` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `state_province` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `travel_agency_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fax_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gst_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `iata_tids` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `system_type` enum('none','amadeus','sabre','travelport') COLLATE utf8_unicode_ci DEFAULT 'none',
  `language` enum('fr','en') COLLATE utf8_unicode_ci DEFAULT 'en',
  `how_heard_about_us` enum('trade_magazine','brochure','fax','email','travel_guide','sales_rep','colleague','trade_show','tourism_bureau','other') COLLATE utf8_unicode_ci DEFAULT 'other',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table valc_agents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `valc_agents`;

CREATE TABLE `valc_agents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Affichage de la table whitelist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `whitelist`;

CREATE TABLE `whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cc_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_number` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `fraud_score` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
