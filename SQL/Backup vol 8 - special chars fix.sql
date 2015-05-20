-- phpMyAdmin SQL Dump
-- version 4.4.4
-- http://www.phpmyadmin.net
--
-- Vært: localhost
-- Genereringstid: 20. 05 2015 kl. 14:33:54
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
  `name` varchar(35) CHARACTER SET latin1 COLLATE latin1_danish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `company`
--

CREATE TABLE IF NOT EXISTS `company` (
  `id` int(11) NOT NULL,
  `email` varchar(35) COLLATE utf8_danish_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_danish_ci NOT NULL,
  `name` varchar(35) COLLATE utf8_danish_ci DEFAULT NULL,
  `contactPerson` varchar(50) COLLATE utf8_danish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

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
(7, '<p>kage æøå ÆØÅ<br></p>', 1, 1432110838, 'wevwevwe', NULL);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `edu`
--

CREATE TABLE IF NOT EXISTS `edu` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `eqType`
--

CREATE TABLE IF NOT EXISTS `eqType` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

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
  `name` varchar(45) COLLATE utf8_danish_ci NOT NULL,
  `sn` varchar(100) COLLATE utf8_danish_ci NOT NULL,
  `fk_prodId` int(11) NOT NULL,
  `fk_eqTypeId` int(11) NOT NULL,
  `spec` text COLLATE utf8_danish_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

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
  `image_big` text COLLATE utf8_danish_ci NOT NULL,
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `main_menu_cat`
--

CREATE TABLE IF NOT EXISTS `main_menu_cat` (
  `id` int(11) NOT NULL,
  `menu_cat_name` varchar(255) COLLATE utf8_danish_ci NOT NULL,
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
  `menu_subcat_name` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `sort_nr` int(11) NOT NULL,
  `fk_menu_cat_id` int(11) NOT NULL,
  `icon` text COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `main_menu_subcat`
--

INSERT INTO `main_menu_subcat` (`id`, `menu_subcat_name`, `sort_nr`, `fk_menu_cat_id`, `icon`) VALUES
(3, 'Kage Manden', 2, 2, '');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `main_menu_subsubcat`
--

CREATE TABLE IF NOT EXISTS `main_menu_subsubcat` (
  `id` int(11) NOT NULL,
  `menu_subsubcat_name` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `order` int(11) NOT NULL,
  `fk_menu_subcat_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `news`
--

INSERT INTO `news` (`id`, `titel`, `txt`, `date`) VALUES
(23, 'Ny Sponsor Dansk Metal', '<p><p><span class="f-img-wrap"><img alt="Image title" src="/uploads/036380f2c71e2642e7696c6bb9247e9a2ff27d41.jpg" style="min-width: 16px; min-height: 16px; margin: 10px 10px 10px 3px; float: left;" width="208"></span></p><p><strong>Lorem Ipsum</strong> er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en bog til sammenligning af forskellige skrifttyper. Lorem Ipsum har ikke alene overlevet fem århundreder, men har også vundet indpas i elektronisk typografi uden væsentlige ændringer. Sætningen blev gjordt kendt i 1960''erne med lanceringen af Letraset-ark, som indeholdt afsnit med Lorem Ipsum, og senere med layoutprogrammer som Aldus PageMaker, som også indeholdt en udgave af Lorem Ipsum.</p><div><p>Det er en kendsgerning, at man bliver distraheret af læsbart indhold på en side, når man betragter dens layout. Meningen med at bruge Lorem Ipsum er, at teksten indeholder mere eller mindre almindelig tekstopbygning i modsætning til "Tekst her – og mere tekst her", mens det samtidigt ligner almindelig tekst. Mange layoutprogrammer og webdesignere bruger Lorem Ipsum som fyldtekst. En søgning på Lorem Ipsum afslører mange websider, som stadig er på udviklingsstadiet. Der har været et utal af variationer, som er opstået enten på grund af fejl og andre gange med vilje (som blandt andet et resultat af humor).</p></div><div><p>I modsætning til hvad mange tror, er Lorem Ipsum ikke bare tilfældig tekst. Det stammer fra et stykke litteratur på latin fra år 45 f.kr., hvilket gør teksten over 2000 år gammel. Richard McClintock, professor i latin fra Hampden-Sydney universitet i Virginia, undersøgte et af de mindst kendte ord "consectetur" fra en del af Lorem Ipsum, og fandt frem til dets oprindelse ved at studere brugen gennem klassisk litteratur. Lorem Ipsum stammer fra afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" (Det gode og ondes ekstremer), som er skrevet af Cicero i år 45 f.kr. Bogen, som var meget populær i renæssancen, er en afhandling om etik. Den første linie af Lorem Ipsum "Lorem ipsum dolor sit amet..." kommer fra en linje i afsnit 1.10.32.</p><p>Standardafsnittet af Lorem Ipsum, som er brugt siden 1500-tallet, er gengivet nedenfor for de, der er interesserede. Afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" af Cicero er også gengivet i deres nøjagtige udgave i selskab med den engelske udgave fra oversættelsen af H. Rackham fra 1914.</p></div><p>Der er mange tilgængelige udgaver af Lorem Ipsum, men de fleste udgaver har gennemgået forandringer, når nogen har tilføjet humor eller tilfældige ord, som på ingen måde ser ægte ud. Hvis du skal bruge en udgave af Lorem Ipsum, skal du sikre dig, at der ikke indgår noget pinligt midt i teksten. Alle Lorem Ipsum-generatore på nettet har en tendens til kun at dublere små brudstykker af Lorem Ipsum efter behov, hvilket gør dette til den første ægte generator på internettet. Den bruger en ordbog på over 200 ord på latin kombineret med en håndfuld sætningsstrukturer til at generere sætninger, som ser pålidelige ud. Resultatet af Lorem Ipsum er derfor altid fri for gentagelser, tilføjet humor eller utroværdige ord osv.</p></p>', 1431497081),
(25, 'ÆØÅ', '<p>ÆØÅ æøå<br></p>', 1432110847);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL,
  `perName` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_danish_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `permissions`
--

INSERT INTO `permissions` (`id`, `perName`, `description`) VALUES
(2, 'create_user', 'Permission to create user'),
(3, 'DynamicEditPages', 'Tillader at man kan redigere de dynamiske sider, som kan tilgås via et link på hver enkelt side'),
(4, 'create_project', 'Tilladelse til at kunne oprette nye projekter.');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `producent`
--

CREATE TABLE IF NOT EXISTS `producent` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

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
  `name` varchar(40) COLLATE utf8_danish_ci NOT NULL,
  `description` text COLLATE utf8_danish_ci,
  `leaderId` int(11) NOT NULL,
  `inst` int(11) NOT NULL,
  `start` int(15) NOT NULL,
  `end` int(15) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `project`
--

INSERT INTO `project` (`id`, `name`, `description`, `leaderId`, `inst`, `start`, `end`) VALUES
(3, 'Skp Management', 'Projektstyrings system', 14, 1, 1431334978, 1432334978),
(5, 'Svendeprøve IT-Supporter', 'Projektet er med til at forberede eleven på den alt afgørende svendeprøve', 50, 14, 2000000, 900000000),
(7, 'Svendeprøve Infrastruktur', 'Projektet er med til at forberede eleven på den alt afgørende svendeprøve\r\n', 47, 14, 1611, 1620),
(8, 'Projekt test', 'Dette er et test projekt', 14, 1, 2015, 2015),
(9, 'kage bagening', NULL, 0, 0, 1432334978, 1532334978),
(10, 'jule manden kommer', NULL, 0, 0, 1432334978, 1632334978),
(11, 'adf', 'Indtast en udfÃ¸dfarlig beskrivelse af projektet.', 29, 14, 1431554400, 1431640800),
(12, 'Test 1', 'Dette er den fÃ¸rste test. FormÃ¥let er at fÃ¥ alle disse informationer ind i databasen. pÃ¸j pÃ¸j.', 50, 46, 1432072800, 1432159200),
(13, 'Ã¦Ã¸Ã¥Ã¦Ã¸Ã¥Ã¦Ã¸Ã¥Ã¦Ã¸Ã¥Ã¦', 'Indtast en uaetqÃ¸Ã¦Ã¥Ã¸Ã¦Ã¥Ã¸Ã¦Ã¥Ã¦Ã¸Ã¦Ã¥Ã¦Ã¸Ã¦Ã¥Ã¦Ã¸Ã¥Ã¦Ã¸Ã¦Ã¥Ã¦Ã¥Ã¦Ã¸Ã¦Ã¸Ã¥Ã¸Ã¦Ã¥Ã¥Ã¥Ã¦Ã¸Ã¥Ã¦Ã¸Ã¦Ã¥Ã¦Ã¥Ã¦Ã¥Ã¦Ã¥Ã¥Ã¦Ã¥Ã¥Ã¸Ã¥Ã¸Ã¥Ã¦Ã¸Ã¸Ã¦Ã¦Ã¥dfÃ¸rlig beskrivelse af projektet.', 30, 1, 1431122400, 1432850400),
(14, 'Test 2', 'Indtast en udfÃ¸rlig besksfgsfgrivelse af projektet.', 1, 14, 1432850400, 1433023200),
(15, 'Test 3', 'adfadadfaf', 31, 46, 1432936800, 1435183200),
(16, 'Test 4', '56ad4f65a4df6a54fd6a54df6a5f4 a65f4 a65f4 a65f4 a65f4 a65f4a6 5f 4a654df6a54f 6a5 4f6\r\na54df6+a54df6\r\na54df6\r\na5 4df \r\na5s4df\r\n6a54df\r\n6a5 4df 56\r\nas', 33, 51, 1433368800, 1434060000),
(17, 'Test 5', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus eleifend ipsum a orci pharetra euismod. Nullam vulputate lacinia magna ac ornare. Pellentesque id mollis mauris. Ut vitae dui elit. Donec facilisis, eros vitae convallis iaculis, libero erat ullamcorper lacus, et fringilla sem diam quis tellus. Pellentesque venenatis sed erat ut ornare. Duis consequat quam risus, sit amet vulputate felis sodales at. Pellentesque ligula ligula, mattis quis ullamcorper ac, hendrerit eget purus. Phasellus suscipit aliquet nulla, vitae tempor sem egestas nec. Sed id erat pretium nulla dapibus molestie. Vivamus tempor dui ligula, a ultrices magna auctor quis. Curabitur leo magna, porta ut leo nec, venenatis posuere lorem. Duis justo tellus, pulvinar nec magna et, mollis laoreet massa. Sed pellentesque odio ac justo ultrices, sagittis mattis lacus pretium.\r\n\r\nDuis purus est, gravida et placerat vitae, rhoncus in mauris. Fusce at imperdiet tortor. Vivamus erat ante, tincidunt vel felis dignissim, pellentesque interdum elit. Quisque augue velit, rutrum ac luctus ut, semper sed mi. In molestie massa ut lectus tristique dictum. Sed egestas sagittis lacus in tincidunt. Aenean mollis nisi sit amet metus ullamcorper pharetra.\r\n\r\nMauris posuere tellus at dui imperdiet tempus. Donec vitae metus a sem vestibulum venenatis. Etiam ac posuere augue. Vivamus vehicula vehicula dictum. Nullam efficitur facilisis elit, ut mattis sem. Aenean in laoreet sem, nec interdum enim. Praesent pharetra orci ac est accumsan interdum.\r\n\r\nMorbi vulputate blandit porta. Morbi sit amet urna ipsum. Curabitur nunc ante, posuere vitae varius ut, accumsan sit amet nibh. Quisque sagittis quam et quam pulvinar cursus. Praesent hendrerit lacus ullamcorper felis vestibulum, nec volutpat massa volutpat. Mauris ac pellentesque nisl. Aliquam sit amet sapien enim. Praesent vel nisi facilisis sem feugiat tincidunt. Sed pulvinar ipsum id erat viverra ornare eget at ante. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec eros libero, venenatis in leo eleifend, tincidunt tincidunt nisl. Sed rutrum tellus nec risus elementum, nec venenatis libero varius. Nunc fringilla fringilla enim, in malesuada augue sollicitudin id. Donec varius ornare magna eu auctor. Phasellus sollicitudin, sapien et porttitor cursus, mauris mauris lacinia lorem, sed fringilla neque ipsum nec odio.\r\n\r\nNulla suscipit, dolor nec commodo dignissim, tortor orci imperdiet risus, nec accumsan arcu lorem vel lorem. Ut porta non lacus et pretium. Nam dictum, metus sed fermentum fermentum, tellus dui congue enim, eu posuere elit justo ac nulla. Morbi volutpat nibh velit, in elementum justo rhoncus ut. Pellentesque condimentum, lectus in lacinia luctus, leo tortor ultrices lorem, sed accumsan odio dolor venenatis neque. Mauris quis ligula eget nibh consequat tempor eu nec tellus. Maecenas suscipit risus accumsan neque hendrerit, ut euismod justo tristique. Nunc condimentum ipsum eu bibendum commodo.\r\n\r\nNulla eget tincidunt massa. Donec sed sagittis magna. Fusce imperdiet lobortis finibus. Morbi faucibus magna elit, vitae ullamcorper augue malesuada vitae. Mauris sit amet leo volutpat, hendrerit ipsum at, aliquam nibh. In ac auctor leo. Nullam rhoncus, dolor quis eleifend suscipit, ipsum purus pretium velit, vel pellentesque neque sem eget metus. Vestibulum sed nulla a mi blandit lacinia.\r\n\r\nInteger dictum sapien non sollicitudin tempus. Nam semper metus et leo interdum, eget tincidunt elit malesuada. Nullam sagittis rutrum ipsum, a aliquet quam laoreet sit amet. Praesent eget mi bibendum, viverra ligula eu, gravida est. Fusce euismod eget dolor ut ullamcorper. Nam congue lacinia sem, ut varius quam scelerisque nec. In vulputate, urna at tristique venenatis, lectus ligula euismod augue, a pulvinar nisl massa vitae mi. Praesent et orci non libero ultrices malesuada porta quis magna. Praesent ac lorem aliquam massa maximus vulputate eget ut augue. Ut quis varius augue. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec eleifend molestie enim accumsan laoreet.\r\n\r\nNulla quis arcu dignissim tortor egestas auctor id id odio. Nullam tempus augue sit amet pellentesque eleifend. Quisque in eros lobortis, hendrerit velit a, pulvinar diam. Mauris non pretium eros, id facilisis justo. Nulla mauris massa, dictum et libero sit amet, posuere varius felis. Maecenas nec magna vel ante pharetra egestas ac quis orci. Sed et congue nisl, ac vulputate orci.\r\n\r\nFusce sagittis dolor ligula, quis condimentum nunc dictum a. Integer interdum, leo in facilisis consectetur, erat enim vehicula diam, nec placerat nibh massa in ligula. Cras vehicula volutpat diam ac aliquet. Nullam ac odio vestibulum, pharetra ex ut, aliquam leo. Vestibulum ut orci bibendum, placerat nulla id, pretium nisl. Donec tempus vestibulum enim. Donec placerat eleifend turpis, malesuada feugiat ligula efficitur eget.\r\n\r\nMorbi non aliquet augue. Phasellus hendrerit, nunc at ultricies sollicitudin, orci lectus accumsan orci, ac faucibus libero leo et nisl. Integer vulputate arcu non diam gravida blandit. Donec fermentum sem in risus gravida, pellentesque scelerisque nibh auctor. Sed tincidunt diam a eros fermentum, sollicitudin varius ipsum varius. Maecenas elit nisi, vulputate a fermentum nec, ultrices sit amet magna. Sed bibendum est molestie mattis fermentum. Ut vulputate massa non velit pretium vestibulum. Donec eu blandit tortor, sit amet aliquet lectus. Duis venenatis dapibus elementum.', 29, 1, 1433973600, 1435183200);

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
(3, '“I do not fear computers. I fear lack of them.” – Isaac Asimov', 20),
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
(17, '"I''m dishonest, and a dishonest man you can always trust to be dishonest. Honestly. It''s the honest ones you want to watch out for, because you can never predict when they''re going to do something incredibly... stupid. " - Captain Jack Sparrow', 0),
(18, '“The problem is not the problem. The problem is your attitude about the problem. Do you understand?” - Captain Jack Sparrow', 0);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `rolesPermissions`
--

INSERT INTO `rolesPermissions` (`rolesId`, `permissionsId`) VALUES
(2, 2),
(2, 3),
(2, 3),
(2, 4);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `skills`
--

CREATE TABLE IF NOT EXISTS `skills` (
  `id` int(11) NOT NULL,
  `skill` varchar(100) COLLATE utf8_danish_ci NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

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
  `password` char(128) COLLATE utf8_danish_ci NOT NULL,
  `fName` varchar(40) COLLATE utf8_danish_ci DEFAULT NULL,
  `lName` varchar(50) COLLATE utf8_danish_ci DEFAULT NULL,
  `pic` varchar(255) COLLATE utf8_danish_ci DEFAULT NULL,
  `email` varchar(35) COLLATE utf8_danish_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_danish_ci DEFAULT NULL,
  `bDay` date DEFAULT NULL,
  `maincurse` int(11) DEFAULT NULL,
  `edu` int(11) DEFAULT NULL,
  `eduEnd` date DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `userProject`
--

INSERT INTO `userProject` (`userId`, `projectId`) VALUES
(14, 3),
(50, 1),
(39, 3),
(1, 3),
(50, 7),
(46, 8),
(29, 17);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `userRoles`
--

CREATE TABLE IF NOT EXISTS `userRoles` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- Tilføj AUTO_INCREMENT i tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Tilføj AUTO_INCREMENT i tabel `producent`
--
ALTER TABLE `producent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Tilføj AUTO_INCREMENT i tabel `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
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
