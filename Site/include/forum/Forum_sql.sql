-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 10, 2013 at 08:50 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `skpdashboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `forum_kat`
--

CREATE TABLE IF NOT EXISTS `forum_kat` (
  `kat_id` int(11) NOT NULL AUTO_INCREMENT,
  `kat_navn` varchar(255) NOT NULL,
  `fk_stik_id` int(11) NOT NULL,
  `fk_last_traad_ind_date` text NOT NULL,
  PRIMARY KEY (`kat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- Table structure for table `forum_reply`
--

CREATE TABLE IF NOT EXISTS `forum_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_traad_id` int(11) NOT NULL,
  `fk_bruger_id` int(11) NOT NULL,
  `re_text` text NOT NULL,
  `re_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=78 ;

-- --------------------------------------------------------

--
-- Table structure for table `forum_traad`
--

CREATE TABLE IF NOT EXISTS `forum_traad` (
  `traad_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_bruger_id` int(11) NOT NULL,
  `ind_head` varchar(255) NOT NULL,
  `ind_text` text NOT NULL,
  `ind_date` datetime NOT NULL,
  `fk_kat_id` int(11) NOT NULL,
  `fk_stik_id` int(11) NOT NULL,
  `fk_reply_date` text NOT NULL,
  PRIMARY KEY (`traad_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- Table structure for table `stik_id`
--

CREATE TABLE IF NOT EXISTS `stik_id` (
  `stik_navn` varchar(255) NOT NULL,
  `stik_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`stik_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
