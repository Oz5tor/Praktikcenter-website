-- phpMyAdmin SQL Dump
-- version 4.3.13
-- http://www.phpmyadmin.net
--
-- Vært: localhost
-- Genereringstid: 04. 05 2015 kl. 08:47:02
-- Serverversion: 5.5.41-MariaDB
-- PHP-version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `c1praktikcenter`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `assignment`
--

CREATE TABLE IF NOT EXISTS `assignment` (
  `id` int(11) NOT NULL,
  `name` varchar(35) COLLATE latin1_danish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL,
  `email` varchar(35) COLLATE latin1_danish_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(50) COLLATE latin1_danish_ci NOT NULL,
  `name` varchar(35) COLLATE latin1_danish_ci DEFAULT NULL,
  `contactPerson` varchar(50) COLLATE latin1_danish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `edu`
--

CREATE TABLE IF NOT EXISTS `edu` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE latin1_danish_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `edu`
--

INSERT INTO `edu` (`id`, `name`) VALUES
(1, 'Datateknikker specalisering i programmering'),
(2, 'Datateknikker specalisering i infrastruktur'),
(3, 'It-Supporter');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `eqProj`
--

CREATE TABLE IF NOT EXISTS `eqProj` (
  `projectId` int(11) NOT NULL,
  `equipmentId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `eqType`
--

CREATE TABLE IF NOT EXISTS `eqType` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE latin1_danish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `equipment`
--

CREATE TABLE IF NOT EXISTS `equipment` (
  `name` varchar(45) COLLATE latin1_danish_ci NOT NULL,
  `sn` varchar(100) COLLATE latin1_danish_ci NOT NULL,
  `fk_prodId` int(11) NOT NULL,
  `fk_eqTypeId` int(11) NOT NULL,
  `spec` text COLLATE latin1_danish_ci
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `image_id` int(11) NOT NULL,
  `image_navn` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `image_small` text COLLATE utf8_danish_ci NOT NULL,
  `image_big` text CHARACTER SET latin1 NOT NULL,
  `image_date` int(11) NOT NULL,
  `fk_album_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `images`
--

INSERT INTO `images` (`image_id`, `image_navn`, `image_small`, `image_big`, `image_date`, `fk_album_id`) VALUES
(18, 'Lighthouse.jpg', 'gallery/yiolg/thumb/13636801808266_Lighthouse.jpg', 'gallery/yiolg/13636801808266_Lighthouse.jpg', 1363680181, 5),
(19, 'Hydrangeas.jpg', 'gallery/yiolg/thumb/13636801811792_Hydrangeas.jpg', 'gallery/yiolg/13636801811792_Hydrangeas.jpg', 1363680181, 5),
(20, 'julemand11.jpg', 'gallery/yiolg/thumb/13636801815336_julemand11.jpg', 'gallery/yiolg/13636801815336_julemand11.jpg', 1363680181, 5);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `inst`
--

CREATE TABLE IF NOT EXISTS `inst` (
  `studUserId` int(11) NOT NULL,
  `instUserId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `main_menu_cat`
--

CREATE TABLE IF NOT EXISTS `main_menu_cat` (
  `id` int(11) NOT NULL,
  `menu_cat_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `sort_nr` int(11) NOT NULL,
  `icon` text COLLATE utf8_danish_ci
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `main_menu_cat`
--

INSERT INTO `main_menu_cat` (`id`, `menu_cat_name`, `sort_nr`, `icon`) VALUES
(1, 'Forside', 1, ''),
(2, 'Afdelinger', 2, '');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `main_menu_subcat`
--

CREATE TABLE IF NOT EXISTS `main_menu_subcat` (
  `id` int(11) NOT NULL,
  `menu_subcat_name` varchar(255) NOT NULL,
  `sort_nr` int(11) NOT NULL,
  `fk_menu_cat_id` int(11) NOT NULL,
  `icon` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `main_menu_subcat`
--

INSERT INTO `main_menu_subcat` (`id`, `menu_subcat_name`, `sort_nr`, `fk_menu_cat_id`, `icon`) VALUES
(1, 'test sub', 1, 2, ''),
(2, 'efefe efef', 2, 1, ''),
(3, 'wevwevwe', 2, 2, '');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `main_menu_subsubcat`
--

CREATE TABLE IF NOT EXISTS `main_menu_subsubcat` (
  `id` int(11) NOT NULL,
  `menu_subsubcat_name` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `fk_menu_subcat_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `main_menu_subsubcat`
--

INSERT INTO `main_menu_subsubcat` (`id`, `menu_subsubcat_name`, `order`, `fk_menu_subcat_id`) VALUES
(1, 'kage', 1, 1),
(2, 'efef', 2, 1),
(3, 'fefe', 3, 1);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL,
  `titel` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `txt` text COLLATE utf8_danish_ci NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `news`
--

INSERT INTO `news` (`id`, `titel`, `txt`, `date`) VALUES
(4, 'lorem ipsum', '<p>Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har vï¿½ret standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfï¿½ldig spalte for at trykke en bog til sammenligning af forskellige skrifttyper. Lorem Ipsum har ikke alene overlevet fem ï¿½rhundreder, me''n har ogsï¿½ vundet indpas i elektronisk typografi uden vï¿½sentlige ï¿½ndringer. Sï¿½tningen blev gjordt kendt i 1960erne med lanceringen af Letraset-ark, som indeholdt afsnit med Lorem Ipsum, og senere med layoutprogrammer som Aldus PageMaker, som ogsï¿½ indeholdt en udgave af Lorem Ipsum.</p>', 42),
(5, 'wefewf', '<p>wfffffff<br></p>', 1416091522),
(6, 'kage mand', '<p>kage manden gik sig en tur over Ã¸ster land<br></p>', 1427116118),
(7, ',k,k,k', 'k,k,k,<p>jkmk,k<br></p>', 1427116404),
(8, 'Ã¦Ã¸Ã¥', '<p>Ã¦Ã¸Ã¥<br></p>', 1427197082),
(9, 'Ny Sponsor Dansk Metal', '<p>efwef ef wefw ef<br></p>', 1430378116),
(10, 'Ny Sponsor ESET', '<p>wf ef wfw<br></p>', 1430378239),
(11, 'Ny Sponsor Be Quiet!', '<p>&nbsp;wef wefwfwef<br></p>', 1430378244),
(13, 'Ny Sponsor Be Quiet!', '<p>efwef''Ã¦Ã¸Ã¥wefwef'' wefwefw''fwef<br></p>', 1430720343),
(14, 'je'' gi''  ''', '<p>kage''manden'' loled hele dagen''<br></p>', 1430720381),
(15, 'Ny Sponsor Dansk Metal', '<p>/efwfwefwe f/wef wef/wef wefwef we<br></p>', 1430720397),
(16, 'fwefwe''w fwefÃ¸Ã¦Ã¥wf wef'' wef', '<p>wefwefwe''wefwe fwefÃ¦Ã¸Ã¥''ef wfwefw<br></p>', 1430720500);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL,
  `perName` varchar(45) COLLATE latin1_danish_ci DEFAULT NULL,
  `description` varchar(500) COLLATE latin1_danish_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `permissions`
--

INSERT INTO `permissions` (`id`, `perName`, `description`) VALUES
(2, 'create_user', 'Permission to create user');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `producent`
--

CREATE TABLE IF NOT EXISTS `producent` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE latin1_danish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE latin1_danish_ci NOT NULL,
  `assignmentId` int(11) NOT NULL,
  `description` text COLLATE latin1_danish_ci,
  `leaderId` int(11) NOT NULL,
  `inst` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `quotes`
--

CREATE TABLE IF NOT EXISTS `quotes` (
  `id` int(11) NOT NULL,
  `quote` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `date` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `date`) VALUES
(3, '“I do not fear computers. I fear lack of them.” – Isaac Asimov', 0),
(4, '“A computer once beat me at chess, but it was no match for me at kick boxing.”  – Emo Philips', 0),
(5, '“Computer Science is no more about computers than astronomy is about telescopes.” – Edsger W. Dijkstra', 0),
(6, '“The computer was born to solve problems that did not exist before.” – Bill Gates', 0),
(7, '“Software is like entropy: It is difficult to grasp, weighs nothing, and obeys the Second Law of Thermodynamics; i.e., it always increases.” – Norman Augustine', 0),
(8, '“Software is a gas, it expands to fill its container.” – Nathan Myhrvold', 0),
(10, '“Physics is the universe’s operating system.” – Steven R Garman', 0),
(11, '“It’s hardware that makes a machine fast.  It’s software that makes a fast machine slow.” – Craig Bruce', 0),
(13, '“Just move to the Internet, its great here. We get to live inside where the weather is always awesome.” - John Green', 0),
(14, '“Don''t walk behind me; I may not lead. Don''t walk in front of me; I may not follow. Just walk beside me and be my friend.” - Albert Camus', 0),
(15, '“Be yourself; everyone else is already taken.” - Oscar Wilde', 0),
(16, '“I am by nature a dealer in words, and words are the most powerful drug known to humanity.” - Rufyard Kipling, 1865-1936', 0),
(17, '"I''m dishonest, and a dishonest man you can always trust to be dishonest. Honestly. It''s the honest ones you want to watch out for, because you can never predict when they''re going to do something incredibly... stupid. " - Captain Jack Sparrow', 4),
(18, '“The problem is not the problem. The problem is your attitude about the problem. Do you understand?” - Captain Jack Sparrow', 0);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE latin1_danish_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Elev'),
(2, 'Instruktør');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `rolesPermissions`
--

CREATE TABLE IF NOT EXISTS `rolesPermissions` (
  `rolesId` int(11) NOT NULL,
  `permissionsId` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `rolesPermissions`
--

INSERT INTO `rolesPermissions` (`rolesId`, `permissionsId`) VALUES
(2, 2);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `skills`
--

CREATE TABLE IF NOT EXISTS `skills` (
  `id` int(11) NOT NULL,
  `skill` varchar(100) COLLATE latin1_danish_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `skills`
--

INSERT INTO `skills` (`id`, `skill`) VALUES
(1, 'html'),
(2, 'PHP'),
(3, 'SQL'),
(4, 'Java'),
(5, 'C#'),
(6, 'C+'),
(7, 'C++'),
(8, 'ITIL');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `password` char(128) COLLATE latin1_danish_ci NOT NULL,
  `fName` varchar(40) COLLATE latin1_danish_ci DEFAULT NULL,
  `lName` varchar(50) COLLATE latin1_danish_ci DEFAULT NULL,
  `pic` varchar(255) COLLATE latin1_danish_ci DEFAULT NULL,
  `email` varchar(35) COLLATE latin1_danish_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(100) COLLATE latin1_danish_ci DEFAULT NULL,
  `bDay` date DEFAULT NULL,
  `maincurse` int(11) DEFAULT NULL,
  `edu` int(11) DEFAULT NULL,
  `eduEnd` date DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `user`
--

INSERT INTO `user` (`id`, `password`, `fName`, `lName`, `pic`, `email`, `phone`, `address`, `bDay`, `maincurse`, `edu`, `eduEnd`) VALUES
(1, 'b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86', 'Tor', 'Soya', 'nopic.png', 'torsoya@gmail.com', 21204261, 'Blommevej 1 3660 Stenløse', '1991-07-05', NULL, NULL, NULL),
(23, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 6', 'Testersen', NULL, 'testersen6@test.dk', 12345678, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-14', 2, 3, '2015-05-31'),
(14, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Emil Schytte', 'BÃ¦kgaard', NULL, 'emilschytte@gmail.com', 22971719, 'Hovedgaden 54 A, 4140 Borup', '1985-10-25', NULL, 3, '2016-11-01'),
(21, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 4', 'Testersen', NULL, 'testersen4@test.dk', 33333333, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-04', 3, 3, '2015-05-31'),
(22, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 5', 'Testersen', NULL, 'testersen5@test.dk', 55555555, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-05', 5, 3, '2015-05-27'),
(24, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 7', 'Schytte', NULL, 'testersen7@test.dk', 12345678, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-28', 1, 1, '2016-11-01'),
(25, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 8', 'Testersen', NULL, 'testersen8@test.dk', 12345678, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-31', 6, 2, '2024-05-23'),
(26, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 9', 'Testersen', NULL, 'testersen9@test.dk', 55555555, 'Andeby Hovedgade 224, 1010 Andeby', '2019-05-22', 4, NULL, '2021-05-26');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `userProject`
--

CREATE TABLE IF NOT EXISTS `userProject` (
  `userId` int(11) NOT NULL,
  `projectId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `userRoles`
--

CREATE TABLE IF NOT EXISTS `userRoles` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `userRoles`
--

INSERT INTO `userRoles` (`userId`, `roleId`) VALUES
(1, 1),
(1, 2),
(1, 23),
(1, 24),
(1, 25),
(26, 1);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `userSkills`
--

CREATE TABLE IF NOT EXISTS `userSkills` (
  `userId` int(11) NOT NULL,
  `skillId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `edu`
--
ALTER TABLE `edu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `eqProj`
--
ALTER TABLE `eqProj`
  ADD KEY `projectId` (`projectId`), ADD KEY `equipmentId` (`equipmentId`);

--
-- Indeks for tabel `eqType`
--
ALTER TABLE `eqType`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`sn`,`fk_prodId`), ADD KEY `fk_prodId` (`fk_prodId`), ADD KEY `fk_eqTypeId` (`fk_eqTypeId`);

--
-- Indeks for tabel `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indeks for tabel `inst`
--
ALTER TABLE `inst`
  ADD KEY `studUserId` (`studUserId`), ADD KEY `instUserId` (`instUserId`);

--
-- Indeks for tabel `main_menu_cat`
--
ALTER TABLE `main_menu_cat`
  ADD PRIMARY KEY (`id`), ADD KEY `id` (`id`);

--
-- Indeks for tabel `main_menu_subcat`
--
ALTER TABLE `main_menu_subcat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `main_menu_subsubcat`
--
ALTER TABLE `main_menu_subsubcat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `producent`
--
ALTER TABLE `producent`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`), ADD KEY `assignmentId` (`assignmentId`), ADD KEY `leaderId` (`leaderId`);

--
-- Indeks for tabel `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `rolesPermissions`
--
ALTER TABLE `rolesPermissions`
  ADD KEY `rolesId` (`rolesId`), ADD KEY `permissionsId` (`permissionsId`);

--
-- Indeks for tabel `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`), ADD KEY `edu` (`edu`);

--
-- Indeks for tabel `userProject`
--
ALTER TABLE `userProject`
  ADD KEY `userId` (`userId`), ADD KEY `projectId` (`projectId`);

--
-- Indeks for tabel `userRoles`
--
ALTER TABLE `userRoles`
  ADD KEY `userId` (`userId`), ADD KEY `roleId` (`roleId`);

--
-- Indeks for tabel `userSkills`
--
ALTER TABLE `userSkills`
  ADD KEY `userId` (`userId`), ADD KEY `skillId` (`skillId`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `assignment`
--
ALTER TABLE `assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `edu`
--
ALTER TABLE `edu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Tilføj AUTO_INCREMENT i tabel `images`
--
ALTER TABLE `images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- Tilføj AUTO_INCREMENT i tabel `main_menu_cat`
--
ALTER TABLE `main_menu_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Tilføj AUTO_INCREMENT i tabel `main_menu_subcat`
--
ALTER TABLE `main_menu_subcat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Tilføj AUTO_INCREMENT i tabel `main_menu_subsubcat`
--
ALTER TABLE `main_menu_subsubcat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Tilføj AUTO_INCREMENT i tabel `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- Tilføj AUTO_INCREMENT i tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Tilføj AUTO_INCREMENT i tabel `producent`
--
ALTER TABLE `producent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- Tilføj AUTO_INCREMENT i tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Tilføj AUTO_INCREMENT i tabel `rolesPermissions`
--
ALTER TABLE `rolesPermissions`
  MODIFY `rolesId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Tilføj AUTO_INCREMENT i tabel `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- Tilføj AUTO_INCREMENT i tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
