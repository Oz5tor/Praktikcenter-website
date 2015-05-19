-- phpMyAdmin SQL Dump
-- version 4.4.4
-- http://www.phpmyadmin.net
--
-- Vært: localhost
-- Genereringstid: 19. 05 2015 kl. 08:14:08
-- Serverversion: 5.5.43
-- PHP-version: 5.6.8

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
-- Struktur-dump for tabellen `dynamicPages`
--

CREATE TABLE IF NOT EXISTS `dynamicPages` (
  `id` int(11) NOT NULL,
  `text` longtext COLLATE utf8_danish_ci NOT NULL,
  `fk_userID_lastEdit` int(15) NOT NULL,
  `lastEdited` int(15) NOT NULL,
  `fk_subcat_name` varchar(255) COLLATE utf8_danish_ci DEFAULT NULL,
  `fk_subsubcat_name` varchar(255) COLLATE utf8_danish_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `dynamicPages`
--

INSERT INTO `dynamicPages` (`id`, `text`, `fk_userID_lastEdit`, `lastEdited`, `fk_subcat_name`, `fk_subsubcat_name`) VALUES
(2, '<p><span class="f-img-wrap"><img title="Image title" alt="Image title" src="/uploads/f68ffa72e74d5c220c3ceede589cd5680d680484.jpg" style="min-width: 16px; min-height: 16px; margin: 10px 3px 10px 10px; float: right;" width="412"></span></p><p><strong>Lorem Ipsum</strong> er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har vÃ¦ret standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfÃ¦ldig spalte for at trykke en bog til sammenligning af forskellige skrifttyper. Lorem Ipsum har ikke alene overlevet fem Ã¥rhundreder, men har ogsÃ¥ vundet indpas i elektronisk typografi uden vÃ¦sentlige Ã¦ndringer. SÃ¦tningen blev gjordt kendt i 1960''erne med lanceringen af Letraset-ark, som indeholdt afsnit med Lorem Ipsum, og senere med layoutprogrammer som Aldus PageMaker, som ogsÃ¥ indeholdt en udgave af Lorem Ipsum.</p><div><p>Det er en kendsgerning, at man bliver distraheret af lÃ¦sbart indhold pÃ¥ en side, nÃ¥r man betragter dens layout. Meningen med at bruge Lorem Ipsum er, at teksten indeholder mere eller mindre almindelig tekstopbygning i modsÃ¦tning til "Tekst her â€“ og mere tekst her", mens det samtidigt ligner almindelig tekst. Mange layoutprogrammer og webdesignere bruger Lorem Ipsum som fyldtekst. En sÃ¸gning pÃ¥ Lorem Ipsum afslÃ¸rer mange websider, som stadig er pÃ¥ udviklingsstadiet. Der har vÃ¦ret et utal af variationer, som er opstÃ¥et enten pÃ¥ grund af fejl og andre gange med vilje (som blandt andet et resultat af humor).</p></div><div><p>I modsÃ¦tning til hvad mange tror, er Lorem Ipsum ikke bare tilfÃ¦ldig tekst. Det stammer fra et stykke litteratur pÃ¥ latin fra Ã¥r 45 f.kr., hvilket gÃ¸r teksten over 2000 Ã¥r gammel. Richard McClintock, professor i latin fra Hampden-Sydney universitet i Virginia, undersÃ¸gte et af de mindst kendte ord "consectetur" fra en del af Lorem Ipsum, og fandt frem til dets oprindelse ved at studere brugen gennem klassisk litteratur. Lorem Ipsum stammer fra afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" (Det gode og ondes ekstremer), som er skrevet af Cicero i Ã¥r 45 f.kr. Bogen, som var meget populÃ¦r i renÃ¦ssancen, er en afhandling om etik. Den fÃ¸rste linie af Lorem Ipsum "Lorem ipsum dolor sit amet..." kommer fra en linje i afsnit 1.10.32.</p><p>Standardafsnittet af Lorem Ipsum, som er brugt siden 1500-tallet, er gengivet nedenfor for de, der er interesserede. Afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" af Cicero er ogsÃ¥ gengivet i deres nÃ¸jagtige udgave i selskab med den engelske udgave fra oversÃ¦ttelsen af H. Rackham fra 1914.</p></div>', 1, 1431413071, 'efefe efef', NULL),
(3, '<p><strong>Lorem Ipsum</strong> er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har vÃ¦ret standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfÃ¦ldig spalte for at trykke en bog til sammenligning af forskellige skrifttyper. Lorem Ipsum har ikke alene overlevet fem Ã¥rhundreder, men har ogsÃ¥ vundet indpas i elektronisk typografi uden vÃ¦sentlige Ã¦ndringer. SÃ¦tningen blev gjordt kendt i 1960''erne med lanceringen af Letraset-ark, som indeholdt afsnit med Lorem Ipsum, og senere med layoutprogrammer som Aldus PageMaker, som ogsÃ¥ indeholdt en udgave af Lorem Ipsum.</p><div><p>Det er en kendsgerning, at man bliver distraheret af lÃ¦sbart indhold pÃ¥ en side, nÃ¥r man betragter dens layout. Meningen med at bruge Lorem Ipsum er, at teksten indeholder mere eller mindre almindelig tekstopbygning i modsÃ¦tning til "Tekst her â€“ og mere tekst her", mens det samtidigt ligner almindelig tekst. Mange layoutprogrammer og webdesignere bruger Lorem Ipsum som fyldtekst. En sÃ¸gning pÃ¥ Lorem Ipsum afslÃ¸rer mange websider, som stadig er pÃ¥ udviklingsstadiet. Der har vÃ¦ret et utal af variationer, som er opstÃ¥et enten pÃ¥ grund af fejl og andre gange med vilje (som blandt andet et resultat af humor).</p></div><div><p>I modsÃ¦tning til hvad mange tror, er Lorem Ipsum ikke bare tilfÃ¦ldig tekst. Det stammer fra et stykke litteratur pÃ¥ latin fra Ã¥r 45 f.kr., hvilket gÃ¸r teksten over 2000 Ã¥r gammel. Richard McClintock, professor i latin fra Hampden-Sydney universitet i Virginia, undersÃ¸gte et af de mindst kendte ord "consectetur" fra en del af Lorem Ipsum, og fandt frem til dets oprindelse ved at studere brugen gennem klassisk litteratur. Lorem Ipsum stammer fra afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" (Det gode og ondes ekstremer), som er skrevet af Cicero i Ã¥r 45 f.kr. Bogen, som var meget populÃ¦r i renÃ¦ssancen, er en afhandling om etik. Den fÃ¸rste linie af Lorem Ipsum "Lorem ipsum dolor sit amet..." kommer fra en linje i afsnit 1.10.32.</p><p>Standardafsnittet af Lorem Ipsum, som er brugt siden 1500-tallet, er gengivet nedenfor for de, der er interesserede. Afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" af Cicero er ogsÃ¥ gengivet i deres nÃ¸jagtige udgave i selskab med den engelske udgave fra oversÃ¦ttelsen af H. Rackham fra 1914.</p></div><p><br></p>', 1, 1431413008, NULL, 'fefe'),
(4, 'Denne side har endnu ikke nogen tekst', 1, 1431327374, 'test sub', NULL),
(5, '<p><p><strong>Lorem Ipsum</strong> er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har vÃ¦ret standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfÃ¦ldig spalte for at trykke en bog til sammenligning af forskellige skrifttyper. Lorem Ipsum har ikke alene overlevet fem Ã¥rhundreder, men har ogsÃ¥ vundet indpas i elektronisk typografi uden vÃ¦sentlige Ã¦ndringer. SÃ¦tningen blev gjordt kendt i 1960''erne med lanceringen af Letraset-ark, som indeholdt afsnit med Lorem Ipsum, og senere med layoutprogrammer som Aldus PageMaker, som ogsÃ¥ indeholdt en udgave af Lorem Ipsum.</p><div><p>Det er en kendsgerning, at man bliver distraheret af lÃ¦sbart indhold pÃ¥ en side, nÃ¥r man betragter dens layout. Meningen med at bruge Lorem Ipsum er, at teksten indeholder mere eller mindre almindelig tekstopbygning i modsÃ¦tning til "Tekst her â€“ og mere tekst her", mens det samtidigt ligner almindelig tekst. Mange layoutprogrammer og webdesignere bruger Lorem Ipsum som fyldtekst. En sÃ¸gning pÃ¥ Lorem Ipsum afslÃ¸rer mange websider, som stadig er pÃ¥ udviklingsstadiet. Der har vÃ¦ret et utal af variationer, som er opstÃ¥et enten pÃ¥ grund af fejl og andre gange med vilje (som blandt andet et resultat af humor).</p></div><div><p>I modsÃ¦tning til hvad mange tror, er Lorem Ipsum ikke bare tilfÃ¦ldig tekst. Det stammer fra et stykke litteratur pÃ¥ latin fra Ã¥r 45 f.kr., hvilket gÃ¸r teksten over 2000 Ã¥r gammel. Richard McClintock, professor i latin fra Hampden-Sydney universitet i Virginia, undersÃ¸gte et af de mindst kendte ord "consectetur" fra en del af Lorem Ipsum, og fandt frem til dets oprindelse ved at studere brugen gennem klassisk litteratur. Lorem Ipsum stammer fra afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" (Det gode og ondes ekstremer), som er skrevet af Cicero i Ã¥r 45 f.kr. Bogen, som var meget populÃ¦r i renÃ¦ssancen, er en afhandling om etik. Den fÃ¸rste linie af Lorem Ipsum "Lorem ipsum dolor sit amet..." kommer fra en linje i afsnit 1.10.32.</p><p>Standardafsnittet af Lorem Ipsum, som er brugt siden 1500-tallet, er gengivet nedenfor for de, der er interesserede. Afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" af Cicero er ogsÃ¥ gengivet i deres nÃ¸jagtige udgave i selskab med den engelske udgave fra oversÃ¦ttelsen af H. Rackham fra 1914.</p></div></p>', 1, 1431413021, NULL, 'kage'),
(6, '<p><p><strong>Lorem Ipsum</strong> er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har vÃ¦ret standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfÃ¦ldig spalte for at trykke en bog til sammenligning af forskellige skrifttyper. Lorem Ipsum har ikke alene overlevet fem Ã¥rhundreder, men har ogsÃ¥ vundet indpas i elektronisk typografi uden vÃ¦sentlige Ã¦ndringer. SÃ¦tningen blev gjordt kendt i 1960''erne med lanceringen af Letraset-ark, som indeholdt afsnit med Lorem Ipsum, og senere med layoutprogrammer som Aldus PageMaker, som ogsÃ¥ indeholdt en udgave af Lorem Ipsum.</p><div><p><span class="f-img-wrap"><img alt="Image title" src="/uploads/9c12bf3cb4a3e8d862a845a9d6e7b5fda523bc8f.jpg" style="min-width: 16px; min-height: 16px; margin: 10px 10px 10px 0px; float: left;" width="300"></span></p><p>Det er en kendsgerning, at man bliver distraheret af lÃ¦sbart indhold pÃ¥ en side, nÃ¥r man betragter dens layout. Meningen med at bruge Lorem Ipsum er, at teksten indeholder mere eller mindre almindelig tekstopbygning i modsÃ¦tning til "Tekst her â€“ og mere tekst her", mens det samtidigt ligner almindelig tekst. Mange layoutprogrammer og webdesignere bruger Lorem Ipsum som fyldtekst. En sÃ¸gning pÃ¥ Lorem Ipsum afslÃ¸rer mange websider, som stadig er pÃ¥ udviklingsstadiet. Der har vÃ¦ret et utal af variationer, som er opstÃ¥et enten pÃ¥ grund af fejl og andre gange med vilje (som blandt andet et resultat af humor).</p></div><div><p>I modsÃ¦tning til hvad mange tror, er Lorem Ipsum ikke bare tilfÃ¦ldig tekst. Det stammer fra et stykke litteratur pÃ¥ latin fra Ã¥r 45 f.kr., hvilket gÃ¸r teksten over 2000 Ã¥r gammel. Richard McClintock, professor i latin fra Hampden-Sydney universitet i Virginia, undersÃ¸gte et af de mindst kendte ord "consectetur" fra en del af Lorem Ipsum, og fandt frem til dets oprindelse ved at studere brugen gennem klassisk litteratur. Lorem Ipsum stammer fra afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" (Det gode og ondes ekstremer), som er skrevet af Cicero i Ã¥r 45 f.kr. Bogen, som var meget populÃ¦r i renÃ¦ssancen, er en afhandling om etik. Den fÃ¸rste linie af Lorem Ipsum "Lorem ipsum dolor sit amet..." kommer fra en linje i afsnit 1.10.32.</p><p>Standardafsnittet af Lorem Ipsum, som er brugt siden 1500-tallet, er gengivet nedenfor for de, der er interesserede. Afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" af Cicero er ogsÃ¥ gengivet i deres nÃ¸jagtige udgave i selskab med den engelske udgave fra oversÃ¦ttelsen af H. Rackham fra 1914.</p></div></p>', 1, 1431413040, NULL, 'efef'),
(7, '<p><span style="font-size: 18px; line-height: 23px; background-color: initial;">Pis af!!</span>	<br></p><p>	<br></p><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><br><hr><hr><hr><hr><hr><hr><br><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr>&nbsp;&nbsp;&nbsp;&nbsp;<hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr><hr>', 14, 1431933556, 'wevwevwe', NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `eqType`
--

INSERT INTO `eqType` (`id`, `name`) VALUES
(1, 'PC'),
(2, 'Skærm'),
(3, 'Mus'),
(4, 'Tastatur');

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

--
-- Data dump for tabellen `equipment`
--

INSERT INTO `equipment` (`name`, `sn`, `fk_prodId`, `fk_eqTypeId`, `spec`) VALUES
('ThinkCentre M73', 'S4B01696', 1, 1, 'Intel CORE i3\r\n8GB RAM'),
('Brilliance 22IS Plus', 'AU5A1417005750', 2, 2, 'LED'),
('HP Compaq LA2306x', 'CNC202PX6F', 3, 2, 'LED'),
('ThinkCentre M73', 'S4B01465', 1, 1, 'Intel CORE i3 \r\n8GB RAM\r\n'),
('ThinkCentre M73', 'S4B01771', 1, 1, 'Intel CORE i3 \r\n8GB RAM\r\n');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `news`
--

INSERT INTO `news` (`id`, `titel`, `txt`, `date`) VALUES
(23, 'Ny Sponsor Dansk Metal', '<p><span class="f-img-wrap"><img alt="Image title" src="/uploads/912b8b1248891420af88369f7573a4676c374d2c.jpg" style="min-width: 16px; min-height: 16px; margin: 10px 10px 10px 3px; float: left;" width="369"></span></span></p><p><strong>Lorem Ipsum</strong> er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har vÃ¦ret standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfÃ¦ldig spalte for at trykke en bog til sammenligning af forskellige skrifttyper. Lorem Ipsum har ikke alene overlevet fem Ã¥rhundreder, men har ogsÃ¥ vundet indpas i elektronisk typografi uden vÃ¦sentlige Ã¦ndringer. SÃ¦tningen blev gjordt kendt i 1960''erne med lanceringen af Letraset-ark, som indeholdt afsnit med Lorem Ipsum, og senere med layoutprogrammer som Aldus PageMaker, som ogsÃ¥ indeholdt en udgave af Lorem Ipsum.</p><div><p>Det er en kendsgerning, at man bliver distraheret af<span class="f-img-wrap"><img alt="Image title" src="/uploads/5e20ccdf3b3437e23afacf9d21177fa5f99dc75d.jpg" style="min-width: 16px; min-height: 16px; margin: 10px 3px 10px 10px; float: right;" width="300"></span> lÃ¦sbart indhold pÃ¥ en side, nÃ¥r man betragter dens layout. Meningen med at bruge Lorem Ipsum er, at teksten indeholder mere eller mindre almindelig tekstopbygning i modsÃ¦tning til "Tekst her â€“ og mere tekst her", mens det samtidigt ligner almindelig tekst. Mange layoutprogrammer og webdesignere bruger Lorem Ipsum som fyldtekst. En sÃ¸gning pÃ¥ Lorem Ipsum afslÃ¸rer mange websider, som stadig er pÃ¥ udviklingsstadiet. Der har vÃ¦ret et utal af variationer, som er opstÃ¥et enten pÃ¥ grund af fejl og andre gange med vilje (som blandt andet et resultat af humor).</p></div><div><p>I modsÃ¦tning til hvad mange tror, er Lorem Ipsum ikke bare tilfÃ¦ldig tekst. Det stammer fra et stykke litteratur pÃ¥ latin fra Ã¥r 45 f.kr., hvilket gÃ¸r teksten over 2000 Ã¥r gammel. Richard McClintock, professor i latin fra Hampden-Sydney universitet i Virginia, undersÃ¸gte et af de mindst kendte ord "consectetur" fra en del af Lorem Ipsum, og fandt frem til dets oprindelse ved at studere brugen gennem klassisk litteratur. Lorem Ipsum stammer fra afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" (Det gode og ondes ekstremer), som er skrevet af Cicero i Ã¥r 45 f.kr. Bogen, som var meget populÃ¦r i renÃ¦ssancen, er en afhandling om etik. Den fÃ¸rste linie af Lorem Ipsum "Lorem ipsum dolor sit amet..." kommer fra en linje i afsnit 1.10.32.</p><p></p><p><span style="text-align: center;" class="f-img-wrap"><img alt="Image title" src="http://pc-tec.dev/uploads/8a517e1d7aebf82459b783bd1d6805caa78ee47e.jpg" style="min-width: 16px; min-height: 16px; margin: 10px 10px 10px 3px; float: left;" width="300">Standardafsnittet af Lorem Ipsum, som er brugt siden 1500-tallet, er gengivet nedenfor for de, der er interesserede. Afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" af Cicero er ogsÃ¥ gengivet i deres nÃ¸jagtige udgave i selskab med den engelske udgave fra oversÃ¦ttelsen af H. Rackham fra 1914.</p></div><p>Der er mange tilgÃ¦ngelige udgaver af Lorem Ipsum, men de fleste udgaver har gennemgÃ¥et forandringer, nÃ¥r nogen har tilfÃ¸jet humor eller tilfÃ¦ldige ord, som pÃ¥ ingen mÃ¥de ser Ã¦gte ud. Hvis du skal bruge en udgave af Lorem Ipsum, skal du sikre dig, at der ikke indgÃ¥r noget pinligt midt i teksten. Alle Lorem Ipsum-generatore pÃ¥ nettet har en tendens til kun at dublere smÃ¥ brudstykker af Lorem Ipsum efter behov, hvilket gÃ¸r dette til den fÃ¸rste Ã¦gte generator pÃ¥ internettet. Den bruger en ordbog pÃ¥ over 200 ord pÃ¥ latin kombineret med en hÃ¥ndfuld sÃ¦tningsstrukturer til at generere sÃ¦tninger, som ser pÃ¥lidelige ud. Resultatet af Lorem Ipsum er derfor altid fri for gentagelser, tilfÃ¸jet humor eller utrovÃ¦rdige ord osv.</p><p><br></p>', 1431497081),
(24, 'Stavefejl', '<p>der er en stavefejl under br<span style="line-height: 19px; background-color: initial;">uger menu''en&nbsp;</span><img alt="Image title" src="http://pc-tec.dev/uploads/7dabc0ab39f39a1b391c43f2d3d1d3e813260a5f.jpg" width="300" style="line-height: 19.2000007629395px; min-width: 16px; min-height: 16px; text-align: center; margin: 10px auto; background-color: initial;"><span style="line-height: 19px; background-color: initial;">hvor der stÃ¥r "Mine projector" skal der ikke stÃ¥ mine projekter????</span></p>', 1431927244);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL,
  `perName` varchar(45) COLLATE latin1_danish_ci DEFAULT NULL,
  `description` varchar(500) COLLATE latin1_danish_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `permissions`
--

INSERT INTO `permissions` (`id`, `perName`, `description`) VALUES
(2, 'create_user', 'Permission to create user'),
(3, 'DynamicEditPages', 'Tillader at man kan redigere de dynamiske sider, som kan tilgås via et link på hver enkelt side');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `producent`
--

CREATE TABLE IF NOT EXISTS `producent` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE latin1_danish_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `producent`
--

INSERT INTO `producent` (`id`, `name`) VALUES
(1, 'Lenovo'),
(2, 'Philips'),
(3, 'HP'),
(4, 'Samsung');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL,
  `name` varchar(40) COLLATE latin1_danish_ci NOT NULL,
  `description` text COLLATE latin1_danish_ci,
  `leaderId` int(11) NOT NULL,
  `inst` int(11) NOT NULL,
  `start` int(15) NOT NULL,
  `end` int(15) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `project`
--

INSERT INTO `project` (`id`, `name`, `description`, `leaderId`, `inst`, `start`, `end`) VALUES
(3, 'Skp Management', 'Projektstyrings system', 14, 1, 1431334978, 1432334978),
(5, 'Svendeprøve IT-Supporter', 'Projektet er med til at forberede eleven på den alt afgørende svendeprøve', 50, 14, 2000000, 900000000),
(7, 'Svendeprøve Infrastruktur', 'Projektet er med til at forberede eleven på den alt afgørende svendeprøve\r\n', 47, 14, 1611, 1620),
(8, 'Projekt test', 'Dette er et test projekt', 14, 1, 2015, 2015),
(9, 'kage bagening', NULL, 0, 0, 1432334978, 1532334978),
(10, 'jule manden kommer', NULL, 0, 0, 1432334978, 1632334978);

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
(14, '“Don''t walk behind me; I may not lead. Don''t walk in front of me; I may not follow. Just walk beside me and be my friend.” - Albert Camus', 19),
(15, '“Be yourself; everyone else is already taken.” - Oscar Wilde', 0),
(16, '“I am by nature a dealer in words, and words are the most powerful drug known to humanity.” - Rufyard Kipling, 1865-1936', 0),
(17, '"I''m dishonest, and a dishonest man you can always trust to be dishonest. Honestly. It''s the honest ones you want to watch out for, because you can never predict when they''re going to do something incredibly... stupid. " - Captain Jack Sparrow', 0),
(18, '“The problem is not the problem. The problem is your attitude about the problem. Do you understand?” - Captain Jack Sparrow', 0);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(45) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'Elev'),
(2, 'Instruktør'),
(3, 'Værkføre');

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
(2, 2),
(2, 3);

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
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `user`
--

INSERT INTO `user` (`id`, `password`, `fName`, `lName`, `pic`, `email`, `phone`, `address`, `bDay`, `maincurse`, `edu`, `eduEnd`) VALUES
(1, 'b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86', 'Tor', 'Soya', 'nopic.png', 'torsoya@gmail.com', 21204261, 'Blommevej 1 3660 Stenløse', '1991-07-05', NULL, NULL, NULL),
(34, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 5', 'Testersen', NULL, 'testersen5@test.dk', 55555555, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-30', 1, 3, '2015-05-30'),
(14, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Emil Schytte', 'BÃ¦kgaard', NULL, 'emilschytte@gmail.com', 22971719, 'Hovedgaden 54 A, 4140 Borup', '1985-10-25', NULL, 3, '2016-11-01'),
(33, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 5', 'Testersen', NULL, 'testersen5@test.dk', 55555555, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-30', 1, 3, '2015-05-30'),
(32, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 4', 'Testersen', NULL, 'testersen4@test.dk', 55555555, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-15', 5, 2, '2015-05-30'),
(31, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 4', 'Testersen', NULL, 'testersen4@test.dk', 55555555, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-15', 5, 2, '2015-05-30'),
(30, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 3', 'Testersen', NULL, 'testersen3@test.dk', 11111111, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-30', 4, 2, '2015-05-30'),
(29, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 2', 'adfaf', NULL, 'testersen@test.dk', 22971719, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-02', 4, 1, '2015-05-30'),
(28, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger', 'Testersen', NULL, 'testersen@test.dk', 55555555, 'Hovedgaden 54 A', '2015-05-02', 3, 2, '2015-05-30'),
(35, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 5', 'Testersen', NULL, 'testersen5@test.dk', 55555555, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-30', 1, 3, '2015-05-30'),
(36, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 4', 'Testersen', NULL, 'testersen@test.dk', 11111111, 'Hovedgaden 54 A', '2015-05-29', 2, 2, '2015-05-30'),
(37, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 4', 'Testersen', NULL, 'testersen@test.dk', 11111111, 'Hovedgaden 54 A', '2015-05-29', 2, 2, '2015-05-30'),
(38, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 2', 'Testersen', NULL, 'adfa@df.df', 11111111, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-20', 3, NULL, '2015-05-23'),
(39, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'ada', 'Testersen', NULL, 'emilschefyoytte@gmail.com', 33333333, 'Hovedgaden 54 A', '1985-10-25', 2, 2, '2015-05-04'),
(40, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Emil Schytte', 'Testersen', NULL, 'adgfdgdfghfdgfdfa@df.df', 55555555, 'adf', '2015-05-30', 2, 1, '2015-05-02'),
(41, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'ada', 'adfaf', NULL, 'gefsgasegemilschytte@gmail.com', 22222222, 'adf', '1985-10-25', 1, 1, '2016-11-01'),
(42, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Emil', 'Testersen', NULL, 'afrg@hotmail.com', 22222222, 'Hovedgaden 54 A', '1985-10-25', 1, 2, '2024-05-23'),
(43, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Emil', 'Testersen', NULL, 'abcdefghij@sol.dk', 22971719, 'Hovedgaden 54 A', '2015-05-30', 4, 2, '2015-05-29'),
(44, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Emil', 'adfaf', NULL, 'kagemanden@sol.dk', 12345675, 'kage vej 1', '2015-05-25', 3, 2, '2015-05-30'),
(45, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 2', 'Testersen', NULL, 'kagedamen@hus.dk', 12345678, 'Hovedgaden 54 A, 4140 Borup', '2015-05-30', 2, 1, '2015-05-29'),
(46, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Scarlet', 'Johanson', NULL, 'Dejligdame@dkhostmaster.dk', 57487456, 'Hjemme hos mig hehe', '2015-05-15', NULL, NULL, NULL),
(47, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Jan', 'Jeppesen', NULL, 'testersen564644@test.dk', 11111111, 'kage vej 1', '2015-05-22', NULL, NULL, NULL),
(48, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Emil', 'Schytte', NULL, 'abc@sol.dk', 12345678, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-23', 5, 2, '2015-05-02'),
(49, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'kage"manded;', 'Schytte', NULL, 'adfafgsfgs@df.df', 22971719, 'Hovedgaden 54 A', '2015-05-23', 2, 1, '2015-05-02'),
(50, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Hans Christian', 'Andersen', NULL, 'hca@gmail.com', 12345678, 'MunkemÃ¸llestrÃ¦de 3, 5000 Odense ', '1805-04-02', 3, 2, '0000-00-00'),
(51, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Clark Joseph', 'Kent', NULL, 'superman@gmail.com', 99999999, 'Main st. Kansas, KS Usa', '1938-06-01', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `userProject`
--

CREATE TABLE IF NOT EXISTS `userProject` (
  `userId` int(11) NOT NULL,
  `projectId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `userProject`
--

INSERT INTO `userProject` (`userId`, `projectId`) VALUES
(14, 3),
(50, 1),
(39, 3),
(1, 3),
(50, 7),
(46, 8);

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
(34, 1),
(1, 2),
(30, 1),
(29, 1),
(28, 1),
(34, 1),
(32, 1),
(1, 1),
(31, 1),
(14, 2),
(33, 1),
(29, 1),
(29, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 2),
(47, 3),
(48, 1),
(49, 1),
(50, 1),
(51, 2);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `userSkills`
--

CREATE TABLE IF NOT EXISTS `userSkills` (
  `userId` int(11) NOT NULL,
  `skillId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_danish_ci;

--
-- Data dump for tabellen `userSkills`
--

INSERT INTO `userSkills` (`userId`, `skillId`) VALUES
(45, 1),
(45, 2),
(45, 3),
(45, 4),
(48, 2),
(48, 3),
(48, 4),
(49, 2);

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
-- Indeks for tabel `dynamicPages`
--
ALTER TABLE `dynamicPages`
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
  ADD KEY `projectId` (`projectId`),
  ADD KEY `equipmentId` (`equipmentId`);

--
-- Indeks for tabel `eqType`
--
ALTER TABLE `eqType`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`sn`,`fk_prodId`),
  ADD KEY `fk_prodId` (`fk_prodId`),
  ADD KEY `fk_eqTypeId` (`fk_eqTypeId`);

--
-- Indeks for tabel `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`image_id`);

--
-- Indeks for tabel `inst`
--
ALTER TABLE `inst`
  ADD KEY `studUserId` (`studUserId`),
  ADD KEY `instUserId` (`instUserId`);

--
-- Indeks for tabel `main_menu_cat`
--
ALTER TABLE `main_menu_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaderId` (`leaderId`);

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
  ADD KEY `rolesId` (`rolesId`),
  ADD KEY `permissionsId` (`permissionsId`);

--
-- Indeks for tabel `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `edu` (`edu`);

--
-- Indeks for tabel `userProject`
--
ALTER TABLE `userProject`
  ADD KEY `userId` (`userId`),
  ADD KEY `projectId` (`projectId`);

--
-- Indeks for tabel `userRoles`
--
ALTER TABLE `userRoles`
  ADD KEY `userId` (`userId`),
  ADD KEY `roleId` (`roleId`);

--
-- Indeks for tabel `userSkills`
--
ALTER TABLE `userSkills`
  ADD KEY `userId` (`userId`),
  ADD KEY `skillId` (`skillId`);

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
-- Tilføj AUTO_INCREMENT i tabel `dynamicPages`
--
ALTER TABLE `dynamicPages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Tilføj AUTO_INCREMENT i tabel `edu`
--
ALTER TABLE `edu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Tilføj AUTO_INCREMENT i tabel `eqType`
--
ALTER TABLE `eqType`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- Tilføj AUTO_INCREMENT i tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Tilføj AUTO_INCREMENT i tabel `producent`
--
ALTER TABLE `producent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Tilføj AUTO_INCREMENT i tabel `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- Tilføj AUTO_INCREMENT i tabel `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- Tilføj AUTO_INCREMENT i tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=52;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
