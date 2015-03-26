-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Vært: localhost
-- Genereringstid: 26. 03 2015 kl. 09:20:50
-- Serverversion: 5.1.73
-- PHP-version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `praktikcenter`
--
CREATE DATABASE `praktikcenter` DEFAULT CHARACTER SET latin1 COLLATE latin1_danish_ci;
USE `praktikcenter`;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `assignment`
--

CREATE TABLE IF NOT EXISTS `assignment` (
  `id` int(11) NOT NULL,
  `name` varchar(35) COLLATE latin1_danish_ci NOT NULL,
  PRIMARY KEY (`id`)
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `eqProj`
--

CREATE TABLE IF NOT EXISTS `eqProj` (
  `projectId` int(11) NOT NULL,
  `equipmentId` int(11) NOT NULL,
  KEY `projectId` (`projectId`),
  KEY `equipmentId` (`equipmentId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `eqType`
--

CREATE TABLE IF NOT EXISTS `eqType` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE latin1_danish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `spec` text COLLATE latin1_danish_ci,
  PRIMARY KEY (`sn`,`fk_prodId`),
  KEY `fk_prodId` (`fk_prodId`),
  KEY `fk_eqTypeId` (`fk_eqTypeId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `inst`
--

CREATE TABLE IF NOT EXISTS `inst` (
  `studUserId` int(11) NOT NULL,
  `instUserId` int(11) NOT NULL,
  KEY `studUserId` (`studUserId`),
  KEY `instUserId` (`instUserId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL,
  `perName` varchar(45) COLLATE latin1_danish_ci DEFAULT NULL,
  `description` varchar(500) COLLATE latin1_danish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `producent`
--

CREATE TABLE IF NOT EXISTS `producent` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE latin1_danish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE latin1_danish_ci NOT NULL,
  `assignmentId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assignmentId` (`assignmentId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE latin1_danish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `rolesPermissions`
--

CREATE TABLE IF NOT EXISTS `rolesPermissions` (
  `rolesId` int(11) NOT NULL,
  `permissionsId` int(11) NOT NULL,
  KEY `rolesId` (`rolesId`),
  KEY `permissionsId` (`permissionsId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `skills`
--

CREATE TABLE IF NOT EXISTS `skills` (
  `id` int(11) NOT NULL,
  `skill` varchar(100) COLLATE latin1_danish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `username` varchar(35) COLLATE latin1_danish_ci NOT NULL,
  `password` char(128) COLLATE latin1_danish_ci NOT NULL,
  `fName` varchar(40) COLLATE latin1_danish_ci DEFAULT NULL,
  `lName` varchar(50) COLLATE latin1_danish_ci DEFAULT NULL,
  `pic` longblob,
  `email` varchar(35) COLLATE latin1_danish_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(100) COLLATE latin1_danish_ci DEFAULT NULL,
  `bDay` date DEFAULT NULL,
  `maincurse` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `userProject`
--

CREATE TABLE IF NOT EXISTS `userProject` (
  `userId` int(11) NOT NULL,
  `projectId` int(11) NOT NULL,
  KEY `userId` (`userId`),
  KEY `projectId` (`projectId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `userRoles`
--

CREATE TABLE IF NOT EXISTS `userRoles` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  KEY `userId` (`userId`),
  KEY `roleId` (`roleId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `userSkills`
--

CREATE TABLE IF NOT EXISTS `userSkills` (
  `userId` int(11) NOT NULL,
  `skillId` int(11) NOT NULL,
  KEY `userId` (`userId`),
  KEY `skillId` (`skillId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
