-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2023 at 10:14 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qbcoreframework_3d03a8`
--

-- --------------------------------------------------------

--
-- Table structure for table `acbans`
--

CREATE TABLE `acbans` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `nazwa` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `powod` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `typkary` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `datanadania` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `xbl` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

CREATE TABLE `apartments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `apartments`
--

INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
(1, 'apartment18007', 'apartment1', 'South Rockford Drive Apartment 8007', 'VLI46610'),
(2, 'apartment13238', 'apartment1', 'South Rockford Drive Apartment 3238', 'JJC15494'),
(3, 'apartment12246', 'apartment1', 'South Rockford Drive Apartment 2246', 'BIY64957');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank_cards`
--

CREATE TABLE `bank_cards` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` varchar(50) DEFAULT NULL,
  `cardActive` tinyint(4) DEFAULT 1,
  `cardLocked` tinyint(4) DEFAULT 0,
  `cardType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bank_statements`
--

CREATE TABLE `bank_statements` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `crypto`
--

CREATE TABLE `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `crypto`
--

INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
('qbit', 1050, '[{\"PreviousWorth\":1050,\"NewWorth\":1055},{\"PreviousWorth\":1050,\"NewWorth\":1055},{\"PreviousWorth\":1050,\"NewWorth\":1055},{\"PreviousWorth\":1055,\"NewWorth\":1050}]');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_transactions`
--

CREATE TABLE `crypto_transactions` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_app_chat`
--

CREATE TABLE `gksphone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_bank_transfer`
--

CREATE TABLE `gksphone_bank_transfer` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `identifier` longtext DEFAULT NULL,
  `price` longtext NOT NULL,
  `name` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_blockednumber`
--

CREATE TABLE `gksphone_blockednumber` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL,
  `hex` longtext NOT NULL,
  `number` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_calls`
--

CREATE TABLE `gksphone_calls` (
  `id` int(11) NOT NULL,
  `owner` longtext NOT NULL COMMENT 'Num tel proprio',
  `num` longtext NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gksphone_calls`
--

INSERT INTO `gksphone_calls` (`id`, `owner`, `num`, `incoming`, `time`, `accepts`) VALUES
(1, '2021458899', '6846113445', 1, '2023-04-18 07:03:40', 1),
(2, '6846113445', '2021458899', 0, '2023-04-18 07:03:40', 1),
(3, '2021458899', '6846113445', 1, '2023-04-18 07:04:10', 1),
(4, '6846113445', '2021458899', 0, '2023-04-18 07:04:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_gallery`
--

CREATE TABLE `gksphone_gallery` (
  `id` int(11) NOT NULL,
  `hex` longtext NOT NULL,
  `image` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_gotur`
--

CREATE TABLE `gksphone_gotur` (
  `id` int(11) NOT NULL,
  `label` longtext NOT NULL,
  `price` int(11) DEFAULT 0,
  `count` int(11) NOT NULL,
  `item` longtext NOT NULL,
  `img` text DEFAULT NULL,
  `kapat` varchar(50) DEFAULT 'false',
  `adet` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_gps`
--

CREATE TABLE `gksphone_gps` (
  `id` int(11) NOT NULL,
  `hex` longtext NOT NULL,
  `nott` longtext DEFAULT NULL,
  `gps` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_group_message`
--

CREATE TABLE `gksphone_group_message` (
  `id` int(11) NOT NULL,
  `groupid` int(11) NOT NULL,
  `owner` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `ownerphone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groupname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messages` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contacts` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_insto_accounts`
--

CREATE TABLE `gksphone_insto_accounts` (
  `id` int(11) NOT NULL,
  `forename` longtext COLLATE utf8mb4_bin NOT NULL,
  `surname` longtext COLLATE utf8mb4_bin NOT NULL,
  `username` varchar(250) CHARACTER SET utf8 NOT NULL,
  `password` longtext COLLATE utf8mb4_bin NOT NULL,
  `avatar_url` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_insto_instas`
--

CREATE TABLE `gksphone_insto_instas` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `filters` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_insto_likes`
--

CREATE TABLE `gksphone_insto_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `inapId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_insto_story`
--

CREATE TABLE `gksphone_insto_story` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stories` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `isRead` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_invoices`
--

CREATE TABLE `gksphone_invoices` (
  `id` int(10) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_job_message`
--

CREATE TABLE `gksphone_job_message` (
  `id` int(11) NOT NULL,
  `name` longtext NOT NULL,
  `number` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `photo` longtext DEFAULT NULL,
  `gps` varchar(255) NOT NULL,
  `owner` int(11) NOT NULL DEFAULT 0,
  `jobm` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_messages`
--

CREATE TABLE `gksphone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(50) NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `message` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_messages_group`
--

CREATE TABLE `gksphone_messages_group` (
  `id` int(11) NOT NULL,
  `owner` longtext NOT NULL,
  `ownerphone` varchar(50) NOT NULL,
  `groupname` varchar(255) NOT NULL,
  `gimage` longtext NOT NULL,
  `contacts` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_news`
--

CREATE TABLE `gksphone_news` (
  `id` int(11) NOT NULL,
  `hex` longtext DEFAULT NULL,
  `haber` longtext DEFAULT NULL,
  `baslik` longtext DEFAULT NULL,
  `resim` longtext DEFAULT NULL,
  `video` longtext DEFAULT NULL,
  `zaman` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_settings`
--

CREATE TABLE `gksphone_settings` (
  `id` int(11) NOT NULL,
  `identifier` longtext NOT NULL,
  `crypto` longtext NOT NULL DEFAULT '{}',
  `phone_number` varchar(50) DEFAULT NULL,
  `avatar_url` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gksphone_settings`
--

INSERT INTO `gksphone_settings` (`id`, `identifier`, `crypto`, `phone_number`, `avatar_url`) VALUES
(1, 'VLI46610', '{}', '2021458899', NULL),
(2, 'JJC15494', '{}', '6846113445', NULL),
(3, 'BIY64957', '{}', '4326393123', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_twitter_accounts`
--

CREATE TABLE `gksphone_twitter_accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `profilavatar` longtext COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_twitter_likes`
--

CREATE TABLE `gksphone_twitter_likes` (
  `id` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_twitter_tweets`
--

CREATE TABLE `gksphone_twitter_tweets` (
  `id` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_users_contacts`
--

CREATE TABLE `gksphone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(30) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` longtext CHARACTER SET utf8mb4 DEFAULT '-1',
  `avatar` longtext NOT NULL DEFAULT 'https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gksphone_users_contacts`
--

INSERT INTO `gksphone_users_contacts` (`id`, `identifier`, `number`, `display`, `avatar`) VALUES
(1, 'VLI46610', '6846113445', 'Aladin:beaming_face_with_smiling_eyes:', 'https://image.flaticon.com/icons/png/512/194/194938.png');

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_vehicle_sales`
--

CREATE TABLE `gksphone_vehicle_sales` (
  `id` int(11) NOT NULL,
  `owner` longtext NOT NULL,
  `ownerphone` varchar(255) NOT NULL,
  `plate` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `image` longtext NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gksphone_yellow`
--

CREATE TABLE `gksphone_yellow` (
  `id` int(11) NOT NULL,
  `phone_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gloveboxitems`
--

CREATE TABLE `gloveboxitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `houselocations`
--

CREATE TABLE `houselocations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `house_plants`
--

CREATE TABLE `house_plants` (
  `id` int(11) NOT NULL,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ironshield`
--

CREATE TABLE `ironshield` (
  `identifier` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `liveid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `xblid` varchar(21) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(30) COLLATE utf8mb4_bin DEFAULT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `playername` varchar(32) COLLATE utf8mb4_bin NOT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `lapraces`
--

CREATE TABLE `lapraces` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `management_funds`
--

CREATE TABLE `management_funds` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `management_funds`
--

INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
(1, 'police', 0, 'boss'),
(2, 'ambulance', 2000, 'boss'),
(3, 'realestate', 0, 'boss'),
(4, 'taxi', 0, 'boss'),
(5, 'cardealer', 0, 'boss'),
(6, 'mechanic', 0, 'boss'),
(7, 'lostmc', 0, 'gang'),
(8, 'ballas', 0, 'gang'),
(9, 'vagos', 0, 'gang'),
(10, 'cartel', 0, 'gang'),
(11, 'families', 0, 'gang'),
(12, 'triads', 0, 'gang');

-- --------------------------------------------------------

--
-- Table structure for table `mdt_bolos`
--

CREATE TABLE `mdt_bolos` (
  `id` int(11) NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_bulletin`
--

CREATE TABLE `mdt_bulletin` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_convictions`
--

CREATE TABLE `mdt_convictions` (
  `id` int(11) NOT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_data`
--

CREATE TABLE `mdt_data` (
  `id` int(11) NOT NULL,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_impound`
--

CREATE TABLE `mdt_impound` (
  `id` int(11) NOT NULL,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_incidents`
--

CREATE TABLE `mdt_incidents` (
  `id` int(11) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_logs`
--

CREATE TABLE `mdt_logs` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_reports`
--

CREATE TABLE `mdt_reports` (
  `id` int(11) NOT NULL,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mdt_vehicleinfo`
--

CREATE TABLE `mdt_vehicleinfo` (
  `id` int(11) NOT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `occasion_vehicles`
--

CREATE TABLE `occasion_vehicles` (
  `id` int(11) NOT NULL,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_gallery`
--

CREATE TABLE `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `phone_invoices`
--

CREATE TABLE `phone_invoices` (
  `id` int(10) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `phone_tweets`
--

CREATE TABLE `phone_tweets` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` varchar(512) DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
(157, 'BIY64957', 0, 'license:1e2c1161c66f941dedf89725434305b1fffc3f98', 'MADX GAMING', '{\"cash\":500,\"bank\":5000,\"crypto\":0}', '{\"birthdate\":\"2000-07-23\",\"nationality\":\"USA\",\"firstname\":\"Marco\",\"gender\":0,\"account\":\"US07QBCore5952337449\",\"phone\":\"4326393123\",\"backstory\":\"placeholder backstory\",\"lastname\":\"Cannon\"}', '{\"name\":\"unemployed\",\"grade\":{\"level\":0,\"name\":\"Freelancer\"},\"type\":\"none\",\"payment\":10,\"isboss\":false,\"onduty\":true,\"label\":\"Civilian\"}', '{\"grade\":{\"level\":0,\"name\":\"none\"},\"name\":\"none\",\"isboss\":false,\"label\":\"No Gang Affiliaton\"}', '{\"x\":-236.72967529296876,\"y\":-994.3516235351563,\"z\":29.1787109375}', '{\"dealerrep\":0,\"commandbinds\":[],\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":97253799},\"armor\":0,\"jobrep\":{\"taxi\":0,\"trucker\":0,\"hotdog\":0,\"tow\":0},\"bloodtype\":\"A+\",\"fitbit\":[],\"attachmentcraftingrep\":0,\"injail\":0,\"thirst\":96.2,\"licences\":{\"business\":false,\"weapon\":false,\"driver\":true},\"criminalrecord\":{\"hasRecord\":false},\"ishandcuffed\":false,\"isdead\":false,\"craftingrep\":0,\"callsign\":\"NO CALLSIGN\",\"jailitems\":[],\"stress\":0,\"fingerprint\":\"wu168D90Pbu4846\",\"inside\":{\"apartment\":{\"apartmentType\":\"apartment1\",\"apartmentId\":\"apartment12246\"}},\"walletid\":\"QB-55658735\",\"tracker\":false,\"status\":[],\"phone\":[],\"inlaststand\":false,\"hunger\":95.8}', '[{\"slot\":1,\"amount\":4,\"name\":\"water_bottle\",\"type\":\"item\",\"info\":[]},{\"slot\":2,\"amount\":5,\"name\":\"sandwich\",\"type\":\"item\",\"info\":[]},{\"slot\":3,\"amount\":1,\"name\":\"phone\",\"type\":\"item\",\"info\":[]}]', '2023-04-23 05:26:07'),
(85, 'JJC15494', 0, 'license:efadcd51a40db6f25efc806774371ae3b2b1db6d', 'Aladin', '{\"crypto\":0,\"cash\":500,\"bank\":5180}', '{\"account\":\"US04QBCore6235811543\",\"gender\":0,\"nationality\":\"USA\",\"backstory\":\"placeholder backstory\",\"firstname\":\"Mr\",\"birthdate\":\"1998-01-16\",\"lastname\":\"Aladin\",\"phone\":\"6846113445\"}', '{\"type\":\"leo\",\"payment\":150,\"name\":\"police\",\"isboss\":true,\"onduty\":true,\"label\":\"Law Enforcement\",\"grade\":{\"name\":\"Chief\",\"level\":4}}', '{\"isboss\":false,\"name\":\"none\",\"label\":\"No Gang Affiliaton\",\"grade\":{\"name\":\"none\",\"level\":0}}', '{\"x\":-299.70989990234377,\"y\":-18.83076477050781,\"z\":48.5728759765625}', '{\"tracker\":false,\"criminalrecord\":{\"hasRecord\":false},\"fingerprint\":\"ai046A26HEE8728\",\"stress\":0,\"attachmentcraftingrep\":0,\"walletid\":\"QB-98164295\",\"injail\":0,\"ishandcuffed\":false,\"isdead\":false,\"inlaststand\":false,\"bloodtype\":\"O+\",\"inside\":{\"apartment\":[]},\"jobrep\":{\"hotdog\":0,\"taxi\":0,\"trucker\":0,\"tow\":0},\"commandbinds\":[],\"hunger\":87.39999999999999,\"callsign\":\"NO CALLSIGN\",\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":61521984},\"phone\":[],\"thirst\":88.60000000000001,\"licences\":{\"weapon\":false,\"driver\":true,\"business\":false},\"craftingrep\":0,\"fitbit\":[],\"armor\":0,\"jailitems\":[],\"dealerrep\":0,\"status\":[]}', '[{\"slot\":1,\"type\":\"item\",\"name\":\"water_bottle\",\"amount\":3,\"info\":[]},{\"slot\":2,\"type\":\"item\",\"name\":\"sandwich\",\"amount\":5,\"info\":[]},{\"slot\":3,\"type\":\"item\",\"name\":\"phone\",\"amount\":1,\"info\":[]},{\"slot\":4,\"type\":\"weapon\",\"name\":\"weapon_hk416b\",\"amount\":1,\"info\":{\"quality\":100,\"serie\":\"43vJg5is272QyKe\",\"ammo\":0}},{\"slot\":5,\"type\":\"weapon\",\"name\":\"weapon_g17\",\"amount\":1,\"info\":{\"ammo\":0,\"quality\":100,\"serie\":\"24sAf7Vy985AWrQ\",\"attachments\":[{\"component\":\"COMPONENT_AT_PI_FLSH\",\"label\":\"Flashlight\"}]}},{\"slot\":6,\"type\":\"weapon\",\"name\":\"weapon_hk416b\",\"amount\":1,\"info\":{\"serie\":\"43vJg5is272QyKe\",\"quality\":100}},{\"slot\":7,\"type\":\"item\",\"name\":\"radio\",\"amount\":1,\"info\":[]}]', '2023-04-18 09:33:57'),
(3, 'VLI46610', 1, 'license:6bc360d96e02b95f499708356a9ae675905953f9', 'xhelbydecosta15', '{\"cash\":400,\"bank\":4425,\"crypto\":0}', '{\"birthdate\":\"1999-09-17\",\"nationality\":\"USA\",\"firstname\":\"Xhelby\",\"gender\":0,\"account\":\"US08QBCore1345334090\",\"phone\":\"2021458899\",\"backstory\":\"placeholder backstory\",\"lastname\":\"D\'Costta\"}', '{\"name\":\"police\",\"label\":\"Law Enforcement\",\"type\":\"leo\",\"onduty\":true,\"isboss\":false,\"payment\":75,\"grade\":{\"level\":1,\"name\":\"Officer\"}}', '{\"label\":\"No Gang Affiliaton\",\"name\":\"none\",\"isboss\":false,\"grade\":{\"level\":0,\"name\":\"none\"}}', '{\"x\":126.0,\"y\":-1290.3824462890626,\"z\":29.2630615234375}', '{\"dealerrep\":0,\"commandbinds\":{\"F2\":{\"argument\":\"\",\"command\":\"noclip\"},\"F7\":{\"argument\":\"\",\"command\":\"\"},\"F10\":{\"argument\":\"\",\"command\":\"\"},\"F6\":{\"argument\":\"\",\"command\":\"\"},\"F5\":{\"argument\":\"\",\"command\":\"\"},\"F9\":{\"argument\":\"\",\"command\":\"\"},\"F3\":{\"argument\":\"\",\"command\":\"\"}},\"phonedata\":{\"InstalledApps\":[],\"SerialNumber\":29755203},\"armor\":0,\"jobrep\":{\"taxi\":0,\"trucker\":0,\"hotdog\":0,\"tow\":0},\"bloodtype\":\"A-\",\"stress\":0,\"attachmentcraftingrep\":0,\"ishandcuffed\":false,\"thirst\":65.80000000000003,\"fitbit\":[],\"hunger\":62.19999999999997,\"injail\":0,\"isdead\":false,\"craftingrep\":0,\"callsign\":\"NO CALLSIGN\",\"jailitems\":[],\"fingerprint\":\"vo409p91eyZ7820\",\"licences\":{\"business\":false,\"weapon\":false,\"driver\":true},\"inside\":{\"apartment\":[]},\"walletid\":\"QB-11959214\",\"criminalrecord\":{\"hasRecord\":false},\"status\":[],\"phone\":[],\"inlaststand\":false,\"tracker\":false}', '[{\"slot\":1,\"amount\":9,\"name\":\"cokebaggy\",\"type\":\"item\",\"info\":[]},{\"slot\":7,\"amount\":1,\"name\":\"weapon_rep_p416\",\"type\":\"weapon\",\"info\":{\"quality\":100,\"serie\":\"43EJn4sq794MFgi\",\"attachments\":[{\"component\":\"COMPONENT_AT_AR_FLSH\",\"label\":\"Flashlight\"},{\"component\":\"COMPONENT_AT_SCOPE_MEDIUM\",\"label\":\"3x Scope\"}],\"ammo\":27}},{\"slot\":11,\"amount\":1,\"name\":\"lockpick\",\"type\":\"item\",\"info\":[]},{\"slot\":8,\"amount\":1,\"name\":\"weapon_arx\",\"type\":\"weapon\",\"info\":{\"quality\":100,\"serie\":\"15DzG9eL677KDQD\",\"ammo\":227}}]', '2023-04-24 19:43:44');

-- --------------------------------------------------------

--
-- Table structure for table `playerskins`
--

CREATE TABLE `playerskins` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playerskins`
--

INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
(1, 'VLI46610', '1885233650', '{\"t-shirt\":{\"defaultTexture\":0,\"defaultItem\":1,\"texture\":0,\"item\":1},\"shoes\":{\"defaultTexture\":0,\"defaultItem\":1,\"texture\":0,\"item\":1},\"facemix\":{\"defaultShapeMix\":0.0,\"shapeMix\":0,\"defaultSkinMix\":0.0,\"skinMix\":0},\"chimp_bone_lenght\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"glass\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"ear\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"cheek_1\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"lips_thickness\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"lipstick\":{\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1,\"item\":-1},\"ageing\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"beard\":{\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1,\"item\":-1},\"bag\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"nose_4\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"moles\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"pants\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"hat\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"blush\":{\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1,\"item\":-1},\"accessory\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"bracelet\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"neck_thikness\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"chimp_hole\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"nose_1\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"eyebrown_forward\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"face2\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"eyebrows\":{\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1,\"item\":-1},\"nose_0\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"chimp_bone_width\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"chimp_bone_lowering\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"hair\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"jaw_bone_back_lenght\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"eyebrown_high\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"nose_2\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"nose_3\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"jaw_bone_width\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"eye_opening\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"cheek_3\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"arms\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"cheek_2\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"torso2\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"vest\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"eye_color\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"decals\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"watch\":{\"defaultTexture\":0,\"defaultItem\":-1,\"texture\":0,\"item\":-1},\"makeup\":{\"defaultTexture\":1,\"defaultItem\":-1,\"texture\":1,\"item\":-1},\"mask\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"nose_5\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0},\"face\":{\"defaultTexture\":0,\"defaultItem\":0,\"texture\":0,\"item\":0}}', 0),
(9, 'JJC15494', 'mp_m_freemode_01', '{\"faceFeatures\":{\"cheeksWidth\":0,\"cheeksBoneWidth\":0,\"eyeBrownForward\":0,\"eyesOpening\":0,\"nosePeakSize\":0,\"noseBoneHigh\":0,\"neckThickness\":0,\"jawBoneWidth\":0,\"chinBoneLowering\":0,\"cheeksBoneHigh\":0,\"jawBoneBackSize\":0,\"noseBoneTwist\":0,\"nosePeakLowering\":0,\"noseWidth\":0,\"chinBoneLenght\":0,\"lipsThickness\":0,\"nosePeakHigh\":0,\"chinHole\":0,\"chinBoneSize\":0,\"eyeBrownHigh\":0},\"components\":[{\"drawable\":0,\"component_id\":0,\"texture\":0},{\"drawable\":0,\"component_id\":1,\"texture\":0},{\"drawable\":2,\"component_id\":2,\"texture\":0},{\"drawable\":0,\"component_id\":5,\"texture\":0},{\"drawable\":0,\"component_id\":7,\"texture\":0},{\"drawable\":15,\"component_id\":8,\"texture\":0},{\"drawable\":0,\"component_id\":10,\"texture\":0},{\"drawable\":80,\"component_id\":11,\"texture\":1},{\"drawable\":1,\"component_id\":3,\"texture\":0},{\"drawable\":28,\"component_id\":4,\"texture\":5},{\"drawable\":1,\"component_id\":9,\"texture\":0},{\"drawable\":20,\"component_id\":6,\"texture\":0}],\"hair\":{\"color\":20,\"style\":2,\"texture\":0,\"highlight\":0},\"eyeColor\":0,\"headOverlays\":{\"moleAndFreckles\":{\"color\":0,\"style\":0,\"opacity\":0},\"chestHair\":{\"color\":0,\"style\":0,\"opacity\":0},\"beard\":{\"color\":0,\"style\":2,\"opacity\":1},\"makeUp\":{\"color\":0,\"secondColor\":0,\"opacity\":0,\"style\":0},\"complexion\":{\"color\":0,\"style\":0,\"opacity\":0},\"sunDamage\":{\"color\":0,\"style\":0,\"opacity\":0},\"blush\":{\"color\":0,\"style\":0,\"opacity\":0},\"ageing\":{\"color\":0,\"style\":0,\"opacity\":0},\"blemishes\":{\"color\":0,\"style\":0,\"opacity\":0},\"lipstick\":{\"color\":0,\"style\":0,\"opacity\":0},\"eyebrows\":{\"color\":0,\"style\":0,\"opacity\":0},\"bodyBlemishes\":{\"color\":0,\"style\":0,\"opacity\":0}},\"tattoos\":[],\"headBlend\":{\"thirdMix\":0,\"skinFirst\":0,\"skinSecond\":0,\"shapeThird\":0,\"skinMix\":0,\"shapeSecond\":0,\"skinThird\":0,\"shapeMix\":0,\"shapeFirst\":0},\"model\":\"mp_m_freemode_01\",\"props\":[{\"drawable\":-1,\"prop_id\":1,\"texture\":-1},{\"drawable\":-1,\"prop_id\":2,\"texture\":-1},{\"drawable\":-1,\"prop_id\":6,\"texture\":-1},{\"drawable\":-1,\"prop_id\":7,\"texture\":-1},{\"drawable\":13,\"prop_id\":0,\"texture\":0}]}', 1),
(10, 'VLI46610', 'mp_m_freemode_01', '{\"components\":[{\"texture\":0,\"drawable\":0,\"component_id\":0},{\"texture\":0,\"drawable\":0,\"component_id\":1},{\"texture\":0,\"drawable\":32,\"component_id\":2},{\"texture\":0,\"drawable\":35,\"component_id\":4},{\"texture\":0,\"drawable\":0,\"component_id\":5},{\"texture\":0,\"drawable\":10,\"component_id\":6},{\"texture\":0,\"drawable\":1,\"component_id\":7},{\"texture\":0,\"drawable\":8,\"component_id\":10},{\"texture\":0,\"drawable\":0,\"component_id\":9},{\"texture\":0,\"drawable\":15,\"component_id\":8},{\"texture\":0,\"drawable\":22,\"component_id\":11},{\"texture\":0,\"drawable\":19,\"component_id\":3}],\"tattoos\":{\"ZONE_HAIR\":[{\"label\":\"hair-0-324\",\"collection\":\"multiplayer_overlays\",\"name\":\"hair-0-324\",\"hashFemale\":\"NGHip_F_Hair_001\",\"hashMale\":\"NGHip_M_Hair_001\",\"zone\":\"ZONE_HAIR\"}]},\"model\":\"mp_m_freemode_01\",\"headBlend\":{\"shapeSecond\":44,\"thirdMix\":0,\"shapeFirst\":44,\"skinSecond\":0,\"shapeThird\":0,\"skinMix\":0,\"skinThird\":0,\"shapeMix\":0,\"skinFirst\":0},\"headOverlays\":{\"moleAndFreckles\":{\"style\":0,\"color\":0,\"opacity\":0},\"sunDamage\":{\"style\":0,\"color\":0,\"opacity\":0},\"ageing\":{\"style\":0,\"color\":0,\"opacity\":0},\"blush\":{\"style\":0,\"color\":0,\"opacity\":0},\"complexion\":{\"style\":0,\"color\":0,\"opacity\":0},\"eyebrows\":{\"style\":30,\"color\":0,\"opacity\":1},\"bodyBlemishes\":{\"style\":0,\"color\":0,\"opacity\":0},\"chestHair\":{\"style\":0,\"color\":0,\"opacity\":0},\"makeUp\":{\"color\":0,\"style\":0,\"secondColor\":0,\"opacity\":0},\"beard\":{\"style\":7,\"color\":0,\"opacity\":1},\"lipstick\":{\"style\":0,\"color\":0,\"opacity\":0},\"blemishes\":{\"style\":0,\"color\":0,\"opacity\":0}},\"props\":[{\"texture\":-1,\"drawable\":-1,\"prop_id\":0},{\"texture\":0,\"drawable\":7,\"prop_id\":1},{\"texture\":-1,\"drawable\":-1,\"prop_id\":2},{\"texture\":-1,\"drawable\":-1,\"prop_id\":6},{\"texture\":-1,\"drawable\":-1,\"prop_id\":7}],\"eyeColor\":0,\"faceFeatures\":{\"noseWidth\":0,\"noseBoneTwist\":0,\"eyesOpening\":0,\"nosePeakLowering\":0,\"cheeksBoneWidth\":0,\"chinHole\":0,\"nosePeakSize\":0,\"cheeksWidth\":0,\"eyeBrownForward\":0,\"nosePeakHigh\":0,\"lipsThickness\":0,\"jawBoneBackSize\":0,\"jawBoneWidth\":0,\"chinBoneLenght\":0,\"chinBoneSize\":0,\"chinBoneLowering\":0,\"eyeBrownHigh\":0,\"noseBoneHigh\":0,\"cheeksBoneHigh\":0,\"neckThickness\":0},\"hair\":{\"highlight\":0,\"style\":32,\"color\":0,\"texture\":0}}', 1),
(11, 'BIY64957', 'mp_m_freemode_01', '{\"eyeColor\":0,\"tattoos\":[],\"model\":\"mp_m_freemode_01\",\"headBlend\":{\"shapeSecond\":0,\"thirdMix\":0,\"shapeFirst\":0,\"skinMix\":0,\"shapeThird\":0,\"skinSecond\":0,\"shapeMix\":0,\"skinThird\":0,\"skinFirst\":0},\"headOverlays\":{\"moleAndFreckles\":{\"style\":0,\"color\":0,\"opacity\":0},\"sunDamage\":{\"style\":0,\"color\":0,\"opacity\":0},\"chestHair\":{\"style\":0,\"color\":0,\"opacity\":0},\"blush\":{\"style\":0,\"color\":0,\"opacity\":0},\"complexion\":{\"style\":0,\"color\":0,\"opacity\":0},\"eyebrows\":{\"style\":0,\"color\":0,\"opacity\":0},\"bodyBlemishes\":{\"style\":0,\"color\":0,\"opacity\":0},\"lipstick\":{\"style\":0,\"color\":0,\"opacity\":0},\"makeUp\":{\"secondColor\":0,\"style\":0,\"color\":0,\"opacity\":0},\"beard\":{\"style\":0,\"color\":0,\"opacity\":0},\"ageing\":{\"style\":0,\"color\":0,\"opacity\":0},\"blemishes\":{\"style\":0,\"color\":0,\"opacity\":0}},\"hair\":{\"highlight\":0,\"style\":0,\"color\":0,\"texture\":0},\"components\":[{\"component_id\":0,\"drawable\":0,\"texture\":0},{\"component_id\":1,\"drawable\":0,\"texture\":0},{\"component_id\":2,\"drawable\":0,\"texture\":0},{\"component_id\":3,\"drawable\":0,\"texture\":0},{\"component_id\":4,\"drawable\":0,\"texture\":0},{\"component_id\":5,\"drawable\":0,\"texture\":0},{\"component_id\":6,\"drawable\":0,\"texture\":0},{\"component_id\":7,\"drawable\":0,\"texture\":0},{\"component_id\":8,\"drawable\":0,\"texture\":0},{\"component_id\":9,\"drawable\":0,\"texture\":0},{\"component_id\":10,\"drawable\":0,\"texture\":0},{\"component_id\":11,\"drawable\":0,\"texture\":0}],\"faceFeatures\":{\"noseWidth\":0,\"noseBoneTwist\":0,\"eyesOpening\":0,\"nosePeakLowering\":0,\"cheeksBoneWidth\":0,\"chinHole\":0,\"nosePeakSize\":0,\"cheeksWidth\":0,\"eyeBrownForward\":0,\"nosePeakHigh\":0,\"lipsThickness\":0,\"jawBoneBackSize\":0,\"jawBoneWidth\":0,\"chinBoneLenght\":0,\"chinBoneSize\":0,\"eyeBrownHigh\":0,\"chinBoneLowering\":0,\"noseBoneHigh\":0,\"cheeksBoneHigh\":0,\"neckThickness\":0},\"props\":[{\"prop_id\":0,\"drawable\":-1,\"texture\":-1},{\"prop_id\":1,\"drawable\":-1,\"texture\":-1},{\"prop_id\":2,\"drawable\":-1,\"texture\":-1},{\"prop_id\":6,\"drawable\":-1,\"texture\":-1},{\"prop_id\":7,\"drawable\":-1,\"texture\":-1}]}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_contacts`
--

CREATE TABLE `player_contacts` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `player_houses`
--

CREATE TABLE `player_houses` (
  `id` int(255) NOT NULL,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `player_mails`
--

CREATE TABLE `player_mails` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `player_mails`
--

INSERT INTO `player_mails` (`id`, `citizenid`, `sender`, `subject`, `message`, `read`, `mailid`, `date`, `button`) VALUES
(1, 'VLI46610', 'Pillbox Hospital', 'Hospital Costs', 'Dear Mr. D\'Costta, <br /><br />Hereby you received an email with the costs of the last hospital visit.<br />The final costs have become: <strong>$2000</strong><br /><br />We wish you a quick recovery!', 0, 177481, '2023-04-17 23:49:39', '[]'),
(2, 'VLI46610', 'Lionh34rt', 'PinkCage', 'I\'ve received your input codes and will now start disabling the security system..<br />This might take a minute..', 0, 389704, '2023-04-18 00:08:56', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `player_outfits`
--

CREATE TABLE `player_outfits` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `player_vehicles`
--

CREATE TABLE `player_vehicles` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  `carseller` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `player_vehicles`
--

INSERT INTO `player_vehicles` (`id`, `license`, `citizenid`, `vehicle`, `hash`, `mods`, `plate`, `fakeplate`, `garage`, `fuel`, `engine`, `body`, `state`, `depotprice`, `drivingdistance`, `status`, `balance`, `paymentamount`, `paymentsleft`, `financetime`, `carseller`) VALUES
(1, 'license:6bc360d96e02b95f499708356a9ae675905953f9', 'VLI46610', 'italirsx', '-1149725334', '{\"wheels\":7,\"modAerials\":-1,\"tireBurstState\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modKit49\":-1,\"liveryRoof\":-1,\"windowStatus\":{\"1\":true,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":true,\"7\":true,\"0\":true},\"modLivery\":-1,\"headlightColor\":255,\"doorStatus\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modKit17\":-1,\"modSteeringWheel\":-1,\"wheelWidth\":0.0,\"modHorns\":-1,\"modWindows\":-1,\"modRightFender\":-1,\"modDashboard\":-1,\"modPlateHolder\":-1,\"modTurbo\":false,\"modBackWheels\":-1,\"modCustomTiresF\":false,\"color1\":72,\"modDoorSpeaker\":-1,\"xenonColor\":255,\"modTank\":-1,\"modTrimB\":-1,\"modKit47\":-1,\"modSideSkirt\":-1,\"pearlescentColor\":8,\"modKit19\":-1,\"tireBurstCompletely\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modKit21\":-1,\"modFrontWheels\":-1,\"windowTint\":-1,\"modSuspension\":-1,\"engineHealth\":1000.0592475178704,\"modXenon\":false,\"modEngineBlock\":-1,\"tankHealth\":1000.0592475178704,\"modDial\":-1,\"modShifterLeavers\":-1,\"modSeats\":-1,\"modOrnaments\":-1,\"interiorColor\":18,\"plate\":\"27WSF994\",\"modAirFilter\":-1,\"modBrakes\":-1,\"modTrunk\":-1,\"tireHealth\":{\"1\":1000.0,\"2\":1000.0,\"3\":1000.0,\"0\":1000.0},\"modFender\":-1,\"modAPlate\":-1,\"bodyHealth\":1000.0592475178704,\"modCustomTiresR\":false,\"wheelColor\":0,\"model\":-1149725334,\"plateIndex\":0,\"dirtLevel\":0.0,\"modHood\":-1,\"modHydrolic\":-1,\"modGrille\":-1,\"modEngine\":-1,\"modFrame\":-1,\"extras\":[],\"wheelSize\":0.0,\"modRoof\":-1,\"modSpeakers\":-1,\"neonColor\":[255,0,255],\"fuelLevel\":29.39014468479841,\"modStruts\":-1,\"modVanityPlate\":-1,\"modArmor\":-1,\"modSmokeEnabled\":false,\"dashboardColor\":156,\"modExhaust\":-1,\"modTrimA\":-1,\"neonEnabled\":[false,false,false,false],\"modTransmission\":-1,\"modSpoilers\":-1,\"modRearBumper\":-1,\"tyreSmokeColor\":[255,255,255],\"modArchCover\":-1,\"modFrontBumper\":-1,\"oilLevel\":4.76596940834568,\"color2\":122}', '27WSF994', NULL, 'legionsquare', 29, 1000, 1000, 1, 0, 17475, NULL, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `player_warns`
--

CREATE TABLE `player_warns` (
  `id` int(11) NOT NULL,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `primeac`
--

CREATE TABLE `primeac` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `liveid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `xbl` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `hwid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `license` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bantrue` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `stashitems`
--

CREATE TABLE `stashitems` (
  `id` int(11) NOT NULL,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stashitems`
--

INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
(1, 'policestash_VLI46610', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `trunkitems`
--

CREATE TABLE `trunkitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acbans`
--
ALTER TABLE `acbans`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `apartments`
--
ALTER TABLE `apartments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `citizenid` (`citizenid`),
  ADD KEY `business` (`business`),
  ADD KEY `businessid` (`businessid`),
  ADD KEY `gangid` (`gangid`);

--
-- Indexes for table `bank_cards`
--
ALTER TABLE `bank_cards`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `record_id` (`record_id`);

--
-- Indexes for table `bank_statements`
--
ALTER TABLE `bank_statements`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `business` (`business`),
  ADD KEY `businessid` (`businessid`),
  ADD KEY `gangid` (`gangid`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license` (`license`),
  ADD KEY `discord` (`discord`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `crypto`
--
ALTER TABLE `crypto`
  ADD PRIMARY KEY (`crypto`);

--
-- Indexes for table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gksphone_app_chat`
--
ALTER TABLE `gksphone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gksphone_bank_transfer`
--
ALTER TABLE `gksphone_bank_transfer`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gksphone_blockednumber`
--
ALTER TABLE `gksphone_blockednumber`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gksphone_calls`
--
ALTER TABLE `gksphone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gksphone_gallery`
--
ALTER TABLE `gksphone_gallery`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gksphone_gotur`
--
ALTER TABLE `gksphone_gotur`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gksphone_gps`
--
ALTER TABLE `gksphone_gps`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gksphone_group_message`
--
ALTER TABLE `gksphone_group_message`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `groupid` (`groupid`) USING BTREE;

--
-- Indexes for table `gksphone_insto_accounts`
--
ALTER TABLE `gksphone_insto_accounts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `gksphone_insto_instas`
--
ALTER TABLE `gksphone_insto_instas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gksphone_insto_instas_gksphone_insto_accounts` (`authorId`);

--
-- Indexes for table `gksphone_insto_likes`
--
ALTER TABLE `gksphone_insto_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gksphone_insto_likes_gksphone_insto_accounts` (`authorId`),
  ADD KEY `FK_gksphone_insto_likes_gksphone_insto_instas` (`inapId`);

--
-- Indexes for table `gksphone_insto_story`
--
ALTER TABLE `gksphone_insto_story`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FK_gksphone_insto_story_gksphone_insto_accounts` (`authorId`) USING BTREE;

--
-- Indexes for table `gksphone_invoices`
--
ALTER TABLE `gksphone_invoices`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `citizenid` (`citizenid`) USING BTREE;

--
-- Indexes for table `gksphone_job_message`
--
ALTER TABLE `gksphone_job_message`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gksphone_messages`
--
ALTER TABLE `gksphone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gksphone_messages_group`
--
ALTER TABLE `gksphone_messages_group`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gksphone_news`
--
ALTER TABLE `gksphone_news`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gksphone_settings`
--
ALTER TABLE `gksphone_settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gksphone_twitter_accounts`
--
ALTER TABLE `gksphone_twitter_accounts`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `gksphone_twitter_likes`
--
ALTER TABLE `gksphone_twitter_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gksphone_twitter_likes_gksphone_twitter_accounts` (`authorId`),
  ADD KEY `FK_gksphone_twitter_likes_gksphone_twitter_tweets` (`tweetId`);

--
-- Indexes for table `gksphone_twitter_tweets`
--
ALTER TABLE `gksphone_twitter_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_gksphone_twitter_tweets_gksphone_twitter_accounts` (`authorId`);

--
-- Indexes for table `gksphone_users_contacts`
--
ALTER TABLE `gksphone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gksphone_vehicle_sales`
--
ALTER TABLE `gksphone_vehicle_sales`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gksphone_yellow`
--
ALTER TABLE `gksphone_yellow`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `houselocations`
--
ALTER TABLE `houselocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `house_plants`
--
ALTER TABLE `house_plants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building` (`building`),
  ADD KEY `plantid` (`plantid`);

--
-- Indexes for table `ironshield`
--
ALTER TABLE `ironshield`
  ADD PRIMARY KEY (`identifier`);

--
-- Indexes for table `lapraces`
--
ALTER TABLE `lapraces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raceid` (`raceid`);

--
-- Indexes for table `management_funds`
--
ALTER TABLE `management_funds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_name` (`job_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `mdt_bolos`
--
ALTER TABLE `mdt_bolos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_bulletin`
--
ALTER TABLE `mdt_bulletin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_convictions`
--
ALTER TABLE `mdt_convictions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_data`
--
ALTER TABLE `mdt_data`
  ADD PRIMARY KEY (`cid`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `mdt_impound`
--
ALTER TABLE `mdt_impound`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_incidents`
--
ALTER TABLE `mdt_incidents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_logs`
--
ALTER TABLE `mdt_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mdt_vehicleinfo`
--
ALTER TABLE `mdt_vehicleinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `occasionId` (`occasionid`);

--
-- Indexes for table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `number` (`number`);

--
-- Indexes for table `phone_tweets`
--
ALTER TABLE `phone_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `id` (`id`),
  ADD KEY `last_updated` (`last_updated`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `playerskins`
--
ALTER TABLE `playerskins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `player_contacts`
--
ALTER TABLE `player_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_houses`
--
ALTER TABLE `player_houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house` (`house`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `player_mails`
--
ALTER TABLE `player_mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_outfits`
--
ALTER TABLE `player_outfits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `outfitId` (`outfitId`);

--
-- Indexes for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plate` (`plate`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `player_warns`
--
ALTER TABLE `player_warns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `primeac`
--
ALTER TABLE `primeac`
  ADD PRIMARY KEY (`license`) USING BTREE;

--
-- Indexes for table `stashitems`
--
ALTER TABLE `stashitems`
  ADD PRIMARY KEY (`stash`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `trunkitems`
--
ALTER TABLE `trunkitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartments`
--
ALTER TABLE `apartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_cards`
--
ALTER TABLE `bank_cards`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_statements`
--
ALTER TABLE `bank_statements`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_app_chat`
--
ALTER TABLE `gksphone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_bank_transfer`
--
ALTER TABLE `gksphone_bank_transfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_blockednumber`
--
ALTER TABLE `gksphone_blockednumber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_calls`
--
ALTER TABLE `gksphone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gksphone_gallery`
--
ALTER TABLE `gksphone_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_gotur`
--
ALTER TABLE `gksphone_gotur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_gps`
--
ALTER TABLE `gksphone_gps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_group_message`
--
ALTER TABLE `gksphone_group_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_insto_accounts`
--
ALTER TABLE `gksphone_insto_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_insto_instas`
--
ALTER TABLE `gksphone_insto_instas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_insto_likes`
--
ALTER TABLE `gksphone_insto_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_insto_story`
--
ALTER TABLE `gksphone_insto_story`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_invoices`
--
ALTER TABLE `gksphone_invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_job_message`
--
ALTER TABLE `gksphone_job_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_messages`
--
ALTER TABLE `gksphone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_messages_group`
--
ALTER TABLE `gksphone_messages_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_news`
--
ALTER TABLE `gksphone_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_settings`
--
ALTER TABLE `gksphone_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gksphone_twitter_accounts`
--
ALTER TABLE `gksphone_twitter_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_twitter_likes`
--
ALTER TABLE `gksphone_twitter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_twitter_tweets`
--
ALTER TABLE `gksphone_twitter_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_users_contacts`
--
ALTER TABLE `gksphone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `gksphone_vehicle_sales`
--
ALTER TABLE `gksphone_vehicle_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gksphone_yellow`
--
ALTER TABLE `gksphone_yellow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houselocations`
--
ALTER TABLE `houselocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `house_plants`
--
ALTER TABLE `house_plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lapraces`
--
ALTER TABLE `lapraces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `management_funds`
--
ALTER TABLE `management_funds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mdt_bolos`
--
ALTER TABLE `mdt_bolos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_bulletin`
--
ALTER TABLE `mdt_bulletin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_convictions`
--
ALTER TABLE `mdt_convictions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_data`
--
ALTER TABLE `mdt_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_impound`
--
ALTER TABLE `mdt_impound`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_incidents`
--
ALTER TABLE `mdt_incidents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_logs`
--
ALTER TABLE `mdt_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_reports`
--
ALTER TABLE `mdt_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mdt_vehicleinfo`
--
ALTER TABLE `mdt_vehicleinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_tweets`
--
ALTER TABLE `phone_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- AUTO_INCREMENT for table `playerskins`
--
ALTER TABLE `playerskins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `player_contacts`
--
ALTER TABLE `player_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_houses`
--
ALTER TABLE `player_houses`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_mails`
--
ALTER TABLE `player_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `player_outfits`
--
ALTER TABLE `player_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `player_warns`
--
ALTER TABLE `player_warns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stashitems`
--
ALTER TABLE `stashitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trunkitems`
--
ALTER TABLE `trunkitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gksphone_group_message`
--
ALTER TABLE `gksphone_group_message`
  ADD CONSTRAINT `FK_phonegroupmessage` FOREIGN KEY (`groupid`) REFERENCES `gksphone_messages_group` (`id`);

--
-- Constraints for table `gksphone_insto_instas`
--
ALTER TABLE `gksphone_insto_instas`
  ADD CONSTRAINT `FK_gksphone_insto_instas_gksphone_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_insto_accounts` (`id`);

--
-- Constraints for table `gksphone_insto_likes`
--
ALTER TABLE `gksphone_insto_likes`
  ADD CONSTRAINT `FK_gksphone_insto_likes_gksphone_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_insto_accounts` (`id`),
  ADD CONSTRAINT `FK_gksphone_insto_likes_gksphone_insto_instas` FOREIGN KEY (`inapId`) REFERENCES `gksphone_insto_instas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gksphone_insto_story`
--
ALTER TABLE `gksphone_insto_story`
  ADD CONSTRAINT `FK_gksphone_insto_story_gksphone_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_insto_accounts` (`id`);

--
-- Constraints for table `gksphone_twitter_likes`
--
ALTER TABLE `gksphone_twitter_likes`
  ADD CONSTRAINT `FK_gksphone_twitter_likes_gksphone_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_twitter_accounts` (`id`),
  ADD CONSTRAINT `FK_gksphone_twitter_likes_gksphone_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `gksphone_twitter_tweets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gksphone_twitter_tweets`
--
ALTER TABLE `gksphone_twitter_tweets`
  ADD CONSTRAINT `FK_gksphone_twitter_tweets_gksphone_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `gksphone_twitter_accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
