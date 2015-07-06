-- phpMyAdmin SQL Dump
-- version 4.4.4
-- http://www.phpmyadmin.net
--
-- Vært: localhost
-- Genereringstid: 06. 07 2015 kl. 09:33:24
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
  `name` varchar(35) CHARACTER SET latin1 COLLATE latin1_danish_ci NOT NULL,
  `description` text COLLATE utf8_danish_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  `FK_ProId` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `assignment`
--

INSERT INTO `assignment` (`id`, `name`, `description`, `status`, `FK_ProId`) VALUES
(1, 'Oprettelse af database', '', 20, 3),
(2, 'Opsætning af webserver', '', 60, 3),
(6, 'Kagen skal bages', '3 dl mel\n3 dl blødt smør\n3 dl hakkede pecannødder\n230 g flødeost\n2½ dl flormelis\n500 g creme fraiche\n3 breve chokoladebudding\n1 liter mælk\n\nForvarm ovnen til 175°.\nFørste lag: Bland mel, smør og pecannødder (gem lidt nødder til pynt). Bag i ca. 20 min. Afkøl.\n\nAndet lag: Rør flødeost og flormelis sammen og tilsæt 300 g creme fraiche. Smør det oven på det første lag.\n\nTredje lag: Bland mælken med buddingpulveret, som der står på pakken og fordel det over 2. lag.\n\nØverst: Fordel resten af cremefraichen oven på og drys lidt nødder og chokoladespåner over.\n\nSæt det på køl natten over.', 25, 3),
(7, 'CHOKOLADEKAGE', 'Kage:	 \n250 g hvedemel\n1½ tsk bagepulver\n40 g cacao\n250 g smør i små tern\n1 spsk olie\n200 g mørk chokolade, hakket	 \n375 g sukker	 \n1 spsk pulverkaffe	 \n2 æg, sammenpiskede	 \nOvertræk:\n150 g smør i små tern\n150 g mørk chokolade, hakket\n\nOvnen forvarmes til 160°. Smør en dyb rund kageform (20 cm). Den fores med bagepapir. Sigt mel, bagepulver og cacao i en stor skål og lave en fordybning i midten.\nKom smør, olie, chokolade, sukker og pulverkaffe samt 2½ dl vand i en gryde. Rør det sammen for svag varme, til chokolade og smør er smeltet og sukkeret opløst. Tages fra varmen. Hæld chokoladeblandingen i melet og pisk det sammen. Tilsæt æg og pisk det sammen, men ikke for meget.\n\nHæld dejen i formen og bag kagen i 2 timer, eller til der ikke hænger noget ved et grillspyd der stikkes ind midt i kagen. Afkøles helt i formen og vendes derefter ud på en rist.\n\nTil overtrækket røres smør og chokolade sammen for svag varme, til begge dele er smeltet. Tages fra varmen og afkøles en smule.\n\nSkær kagens overside til så den er flad. Anbring den med bunden i vejret på en rist over en bradepande. Hæld chokoladeovertræk over kagen så det løber ned ad siderne. Serveres med creme fraiche.\n\n ', 15, 3),
(8, 'Oste skal smeltes', 'Gøres i en gryde', 45, 19),
(9, 'Gut', 'fælakjdfæoaifæoaiehf', 40, 18),
(10, 'aælkdajædkjfælkdjælafkj', 'æakdjfælakjdfæakjdfæakjdfæakjIndtast en udførlig beskrivelse af opgaven', 70, 18),
(11, 'Bagning af kage', 'Den skal bare indeholde en masse ost.', 40, 18),
(12, 'Arbejde hjemme', 'alt laves hjemmefra', 90, 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `dynamicPages`
--

INSERT INTO `dynamicPages` (`id`, `text`, `fk_userID_lastEdit`, `lastEdited`, `fk_subcat_name`, `fk_subsubcat_name`) VALUES
(7, '<p>kage æøå ÆØÅ<br></p>', 1, 1432110838, 'wevwevwe', NULL),
(8, '<p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur erat ipsum, eleifend at ligula ac, sodales tincidunt mi. Aliquam tincidunt, augue a dictum luctus, nisi sem tristique massa, vitae dapibus nibh ante in lacus. Donec justo nisi, sodales id faucibus ac, vehicula id ex. Morbi suscipit ut sem eget venenatis. Curabitur ullamcorper augue non justo posuere ultricies. Pellentesque eu risus accumsan, malesuada odio et, interdum tellus. Praesent sed urna tincidunt, convallis ante placerat, scelerisque nunc. Curabitur eget nisl nec nisi tincidunt varius eu sed neque. Mauris tempor nisi at ex ornare, quis mollis orci ultrices. Maecenas consequat eros et enim gravida semper. Nam et augue in ipsum pulvinar vestibulum. Nulla nulla tellus, dapibus ut mauris eu, faucibus pulvinar leo. Nullam ultrices ultricies condimentum. Nam vestibulum nisi efficitur porta tincidunt. Vivamus ultrices nec libero id molestie.</p><p>Nulla efficitur vestibulum hendrerit. Suspendisse sem lectus, semper non arcu eget, cursus pulvinar lectus. Integer nisl arcu, imperdiet vel viverra ut, facilisis sit amet justo. Cras pretium lobortis ipsum, id tempus neque ornare et. Aliquam mattis tortor id lacus lobortis aliquam. Pellentesque lacinia maximus leo, sit amet tempus ante malesuada quis. Nulla facilisi. Aenean imperdiet, massa nec finibus condimentum, mi risus mollis ligula, in pretium arcu erat et nulla.</p><p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut sodales ligula id blandit dapibus. Fusce felis eros, vulputate vitae dictum a, iaculis id nunc. Praesent sodales, lectus sit amet aliquam pretium, mi orci hendrerit eros, finibus elementum nulla augue non nulla. Phasellus elementum leo a ante ornare condimentum. Suspendisse sed enim nisi. Vivamus ut sagittis purus. Morbi nec laoreet justo. Etiam ut eros eu risus tincidunt posuere id sit amet enim. Sed sagittis vehicula velit in eleifend. Phasellus sit amet eleifend justo, cursus sollicitudin magna. Integer augue massa, efficitur ac lacinia et, aliquam nec urna.</p><p>Suspendisse vitae mauris ac nisl elementum auctor sit amet in tortor. Nunc quis sapien vitae ex volutpat maximus. Nunc vitae nulla rhoncus, dictum quam a, scelerisque tellus. Fusce semper enim et malesuada porttitor. Suspendisse non mattis nunc. Nam felis eros, hendrerit consectetur diam id, rutrum dictum ligula. Sed aliquet sem a condimentum vehicula. Quisque congue condimentum nisi sodales facilisis. Etiam pellentesque iaculis mollis. Nullam tincidunt orci libero, vehicula varius tellus sodales et. Ut ut malesuada elit, eu lacinia mauris. Vestibulum eget ex interdum, varius nisl ut, dictum erat. Nullam ultrices nisi quis tincidunt luctus.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis nulla vel massa elementum dapibus at elementum elit. Nam vel mattis odio. Etiam quis lacus purus. Quisque interdum tristique viverra. Curabitur pharetra faucibus sapien, id fringilla risus accumsan sed. Cras a velit in enim egestas pharetra. Praesent eleifend neque eu urna consectetur ultricies. Nulla vel massa mattis, commodo lectus non, tincidunt nisi. Donec orci ligula, finibus sed rhoncus viverra, volutpat quis nulla. Mauris non suscipit nibh.</p><p>Ut sagittis libero in risus pharetra, vel dignissim tortor egestas. Morbi non sem a nunc tempus ultrices. Donec et dapibus magna. Proin facilisis, arcu ac placerat posuere, massa velit volutpat neque, vel rutrum neque purus sit amet leo. Suspendisse potenti. Proin et orci eget velit rutrum iaculis. Etiam lacinia dictum metus, a egestas nunc ornare ut. Ut pretium efficitur cursus. Fusce sed gravida lectus.</p><p>Maecenas porttitor arcu ex, id pellentesque ipsum interdum dictum. Nulla non sodales nisi, nec rhoncus metus. Nulla libero turpis, sodales et ex vitae, condimentum accumsan tortor. Sed malesuada ullamcorper dapibus. Integer lorem augue, iaculis a congue quis, convallis nec arcu. Sed vehicula ligula eget nisl ultrices, id efficitur ex imperdiet. Proin quis maximus ante. Nulla at consequat justo, quis fermentum neque. Nam fringilla aliquet egestas. Praesent at ante felis. Curabitur sagittis, neque sit amet tincidunt accumsan, justo libero vulputate enim, quis fermentum libero nibh ac nunc. Morbi egestas ante vel mauris sodales, sed tincidunt mauris tempor.</p><p>Sed at eros ut felis lobortis interdum. Curabitur in sapien eget mi elementum lacinia. Proin rutrum pellentesque interdum. Maecenas eu posuere nulla. Sed efficitur nisi lacus, eu scelerisque nulla pretium vel. Praesent dignissim aliquet leo id fermentum. Quisque hendrerit quis metus in lacinia.</p><p>Suspendisse ullamcorper congue facilisis. Nulla turpis lorem, iaculis sit amet libero vitae, aliquet posuere felis. Vivamus vel arcu vitae orci ultricies dapibus. Nunc imperdiet feugiat elementum. Ut cursus diam nec pulvinar bibendum. Quisque in quam quam. Fusce vulputate arcu id placerat ullamcorper. In rhoncus, orci sit amet pretium lobortis, metus sem luctus enim, et maximus nisl sapien ut orci. Sed nunc nisi, fringilla vel vestibulum vel, scelerisque sit amet lectus.</p><p>Curabitur tempus ipsum ac nulla posuere, ac scelerisque ligula tincidunt. Vestibulum molestie non lectus vitae ultricies. Aliquam imperdiet et ex sed pretium. Ut imperdiet, turpis ut semper pretium, risus augue lobortis tellus, at fringilla nibh nulla et nulla. Vestibulum quam lorem, tempus ac suscipit nec, porttitor ac augue. Quisque eleifend pulvinar lacus, ut sodales lacus aliquet tristique. Fusce auctor lectus tortor, sit amet gravida eros pulvinar sed. In auctor, augue pulvinar rutrum aliquam, enim arcu maximus turpis, quis tristique felis justo quis arcu. Aliquam auctor, metus sed posuere feugiat, est leo semper justo, eget rutrum lorem libero ac libero. Ut vel vestibulum neque, id euismod ipsum. Donec placerat euismod pharetra. Duis quis nisl ipsum. Nam suscipit viverra finibus. Praesent bibendum neque sed tincidunt viverra.</p><p>Etiam id tellus magna. Nunc eget arcu eu nunc vehicula porttitor ut a neque. Vestibulum tristique fermentum dolor, ac accumsan leo dictum eu. Pellentesque quis nisi rhoncus, ultricies nunc ut, malesuada ligula. Phasellus pretium sem vel dictum rutrum. Nam enim libero, placerat eu nibh eu, vulputate dignissim nunc. Nulla ultricies nunc quis scelerisque finibus. Proin rhoncus ex id ex convallis porta.</p><p>Maecenas at nulla lectus. Donec at erat vel ex dignissim ultrices. Proin at facilisis eros. Morbi quam eros, facilisis non lacus sed, sollicitudin euismod arcu. Quisque quis ante ante. Maecenas euismod sodales eros eu facilisis. Nullam a sem ornare, sollicitudin felis nec, vehicula odio. Sed luctus pulvinar ante, a condimentum purus dignissim in. Fusce pretium ullamcorper purus, nec imperdiet felis egestas sed. Vivamus nec quam at tortor sollicitudin.</p></p>', 14, 1434966435, NULL, 'Nisse 2'),
(9, '<p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur erat ipsum, eleifend at ligula ac, sodales tincidunt mi. Aliquam tincidunt, augue a dictum luctus, nisi sem tristique massa, vitae dapibus nibh ante in lacus. Donec justo nisi, sodales id faucibus ac, vehicula id ex. Morbi suscipit ut sem eget venenatis. Curabitur ullamcorper augue non justo posuere ultricies. Pellentesque eu risus accumsan, malesuada odio et, interdum tellus. Praesent sed urna tincidunt, convallis ante placerat, scelerisque nunc. Curabitur eget nisl nec nisi tincidunt varius eu sed neque. Mauris tempor nisi at ex ornare, quis mollis orci ultrices. Maecenas consequat eros et enim gravida semper. Nam et augue in ipsum pulvinar vestibulum. Nulla nulla tellus, dapibus ut mauris eu, faucibus pulvinar leo. Nullam ultrices ultricies condimentum. Nam vestibulum nisi efficitur porta tincidunt. Vivamus ultrices nec libero id molestie.</p><p>Nulla efficitur vestibulum hendrerit. Suspendisse sem lectus, semper non arcu eget, cursus pulvinar lectus. Integer nisl arcu, imperdiet vel viverra ut, facilisis sit amet justo. Cras pretium lobortis ipsum, id tempus neque ornare et. Aliquam mattis tortor id lacus lobortis aliquam. Pellentesque lacinia maximus leo, sit amet tempus ante malesuada quis. Nulla facilisi. Aenean imperdiet, massa nec finibus condimentum, mi risus mollis ligula, in pretium arcu erat et nulla.</p><p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut sodales ligula id blandit dapibus. Fusce felis eros, vulputate vitae dictum a, iaculis id nunc. Praesent sodales, lectus sit amet aliquam pretium, mi orci hendrerit eros, finibus elementum nulla augue non nulla. Phasellus elementum leo a ante ornare condimentum. Suspendisse sed enim nisi. Vivamus ut sagittis purus. Morbi nec laoreet justo. Etiam ut eros eu risus tincidunt posuere id sit amet enim. Sed sagittis vehicula velit in eleifend. Phasellus sit amet eleifend justo, cursus sollicitudin magna. Integer augue massa, efficitur ac lacinia et, aliquam nec urna.</p><p>Suspendisse vitae mauris ac nisl elementum auctor sit amet in tortor. Nunc quis sapien vitae ex volutpat maximus. Nunc vitae nulla rhoncus, dictum quam a, scelerisque tellus. Fusce semper enim et malesuada porttitor. Suspendisse non mattis nunc. Nam felis eros, hendrerit consectetur diam id, rutrum dictum ligula. Sed aliquet sem a condimentum vehicula. Quisque congue condimentum nisi sodales facilisis. Etiam pellentesque iaculis mollis. Nullam tincidunt orci libero, vehicula varius tellus sodales et. Ut ut malesuada elit, eu lacinia mauris. Vestibulum eget ex interdum, varius nisl ut, dictum erat. Nullam ultrices nisi quis tincidunt luctus.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis nulla vel massa elementum dapibus at elementum elit. Nam vel mattis odio. Etiam quis lacus purus. Quisque interdum tristique viverra. Curabitur pharetra faucibus sapien, id fringilla risus accumsan sed. Cras a velit in enim egestas pharetra. Praesent eleifend neque eu urna consectetur ultricies. Nulla vel massa mattis, commodo lectus non, tincidunt nisi. Donec orci ligula, finibus sed rhoncus viverra, volutpat quis nulla. Mauris non suscipit nibh.</p><p>Ut sagittis libero in risus pharetra, vel dignissim tortor egestas. Morbi non sem a nunc tempus ultrices. Donec et dapibus magna. Proin facilisis, arcu ac placerat posuere, massa velit volutpat neque, vel rutrum neque purus sit amet leo. Suspendisse potenti. Proin et orci eget velit rutrum iaculis. Etiam lacinia dictum metus, a egestas nunc ornare ut. Ut pretium efficitur cursus. Fusce sed gravida lectus.</p><p>Maecenas porttitor arcu ex, id pellentesque ipsum interdum dictum. Nulla non sodales nisi, nec rhoncus metus. Nulla libero turpis, sodales et ex vitae, condimentum accumsan tortor. Sed malesuada ullamcorper dapibus. Integer lorem augue, iaculis a congue quis, convallis nec arcu. Sed vehicula ligula eget nisl ultrices, id efficitur ex imperdiet. Proin quis maximus ante. Nulla at consequat justo, quis fermentum neque. Nam fringilla aliquet egestas. Praesent at ante felis. Curabitur sagittis, neque sit amet tincidunt accumsan, justo libero vulputate enim, quis fermentum libero nibh ac nunc. Morbi egestas ante vel mauris sodales, sed tincidunt mauris tempor.</p><p>Sed at eros ut felis lobortis interdum. Curabitur in sapien eget mi elementum lacinia. Proin rutrum pellentesque interdum. Maecenas eu posuere nulla. Sed efficitur nisi lacus, eu scelerisque nulla pretium vel. Praesent dignissim aliquet leo id fermentum. Quisque hendrerit quis metus in lacinia.</p><p>Suspendisse ullamcorper congue facilisis. Nulla turpis lorem, iaculis sit amet libero vitae, aliquet posuere felis. Vivamus vel arcu vitae orci ultricies dapibus. Nunc imperdiet feugiat elementum. Ut cursus diam nec pulvinar bibendum. Quisque in quam quam. Fusce vulputate arcu id placerat ullamcorper. In rhoncus, orci sit amet pretium lobortis, metus sem luctus enim, et maximus nisl sapien ut orci. Sed nunc nisi, fringilla vel vestibulum vel, scelerisque sit amet lectus.</p><p>Curabitur tempus ipsum ac nulla posuere, ac scelerisque ligula tincidunt. Vestibulum molestie non lectus vitae ultricies. Aliquam imperdiet et ex sed pretium. Ut imperdiet, turpis ut semper pretium, risus augue lobortis tellus, at fringilla nibh nulla et nulla. Vestibulum quam lorem, tempus ac suscipit nec, porttitor ac augue. Quisque eleifend pulvinar lacus, ut sodales lacus aliquet tristique. Fusce auctor lectus tortor, sit amet gravida eros pulvinar sed. In auctor, augue pulvinar rutrum aliquam, enim arcu maximus turpis, quis tristique felis justo quis arcu. Aliquam auctor, metus sed posuere feugiat, est leo semper justo, eget rutrum lorem libero ac libero. Ut vel vestibulum neque, id euismod ipsum. Donec placerat euismod pharetra. Duis quis nisl ipsum. Nam suscipit viverra finibus. Praesent bibendum neque sed tincidunt viverra.</p><p>Etiam id tellus magna. Nunc eget arcu eu nunc vehicula porttitor ut a neque. Vestibulum tristique fermentum dolor, ac accumsan leo dictum eu. Pellentesque quis nisi rhoncus, ultricies nunc ut, malesuada ligula. Phasellus pretium sem vel dictum rutrum. Nam enim libero, placerat eu nibh eu, vulputate dignissim nunc. Nulla ultricies nunc quis scelerisque finibus. Proin rhoncus ex id ex convallis porta.</p><p>Maecenas at nulla lectus. Donec at erat vel ex dignissim ultrices. Proin at facilisis eros. Morbi quam eros, facilisis non lacus sed, sollicitudin euismod arcu. Quisque quis ante ante. Maecenas euismod sodales eros eu facilisis. Nullam a sem ornare, sollicitudin felis nec, vehicula odio. Sed luctus pulvinar ante, a condimentum purus dignissim in. Fusce pretium ullamcorper purus, nec imperdiet felis egestas sed. Vivamus nec quam at tortor sollicitudin.</p></p>', 14, 1434966395, NULL, 'Nisse 1'),
(10, '<p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur erat ipsum, eleifend at ligula ac, sodales tincidunt mi. Aliquam tincidunt, augue a dictum luctus, nisi sem tristique massa, vitae dapibus nibh ante in lacus. Donec justo nisi, sodales id faucibus ac, vehicula id ex. Morbi suscipit ut sem eget venenatis. Curabitur ullamcorper augue non justo posuere ultricies. Pellentesque eu risus accumsan, malesuada odio et, interdum tellus. Praesent sed urna tincidunt, convallis ante placerat, scelerisque nunc. Curabitur eget nisl nec nisi tincidunt varius eu sed neque. Mauris tempor nisi at ex ornare, quis mollis orci ultrices. Maecenas consequat eros et enim gravida semper. Nam et augue in ipsum pulvinar vestibulum. Nulla nulla tellus, dapibus ut mauris eu, faucibus pulvinar leo. Nullam ultrices ultricies condimentum. Nam vestibulum nisi efficitur porta tincidunt. Vivamus ultrices nec libero id molestie.</p><p>Nulla efficitur vestibulum hendrerit. Suspendisse sem lectus, semper non arcu eget, cursus pulvinar lectus. Integer nisl arcu, imperdiet vel viverra ut, facilisis sit amet justo. Cras pretium lobortis ipsum, id tempus neque ornare et. Aliquam mattis tortor id lacus lobortis aliquam. Pellentesque lacinia maximus leo, sit amet tempus ante malesuada quis. Nulla facilisi. Aenean imperdiet, massa nec finibus condimentum, mi risus mollis ligula, in pretium arcu erat et nulla.</p><p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut sodales ligula id blandit dapibus. Fusce felis eros, vulputate vitae dictum a, iaculis id nunc. Praesent sodales, lectus sit amet aliquam pretium, mi orci hendrerit eros, finibus elementum nulla augue non nulla. Phasellus elementum leo a ante ornare condimentum. Suspendisse sed enim nisi. Vivamus ut sagittis purus. Morbi nec laoreet justo. Etiam ut eros eu risus tincidunt posuere id sit amet enim. Sed sagittis vehicula velit in eleifend. Phasellus sit amet eleifend justo, cursus sollicitudin magna. Integer augue massa, efficitur ac lacinia et, aliquam nec urna.</p><p>Suspendisse vitae mauris ac nisl elementum auctor sit amet in tortor. Nunc quis sapien vitae ex volutpat maximus. Nunc vitae nulla rhoncus, dictum quam a, scelerisque tellus. Fusce semper enim et malesuada porttitor. Suspendisse non mattis nunc. Nam felis eros, hendrerit consectetur diam id, rutrum dictum ligula. Sed aliquet sem a condimentum vehicula. Quisque congue condimentum nisi sodales facilisis. Etiam pellentesque iaculis mollis. Nullam tincidunt orci libero, vehicula varius tellus sodales et. Ut ut malesuada elit, eu lacinia mauris. Vestibulum eget ex interdum, varius nisl ut, dictum erat. Nullam ultrices nisi quis tincidunt luctus.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis nulla vel massa elementum dapibus at elementum elit. Nam vel mattis odio. Etiam quis lacus purus. Quisque interdum tristique viverra. Curabitur pharetra faucibus sapien, id fringilla risus accumsan sed. Cras a velit in enim egestas pharetra. Praesent eleifend neque eu urna consectetur ultricies. Nulla vel massa mattis, commodo lectus non, tincidunt nisi. Donec orci ligula, finibus sed rhoncus viverra, volutpat quis nulla. Mauris non suscipit nibh.</p><p>Ut sagittis libero in risus pharetra, vel dignissim tortor egestas. Morbi non sem a nunc tempus ultrices. Donec et dapibus magna. Proin facilisis, arcu ac placerat posuere, massa velit volutpat neque, vel rutrum neque purus sit amet leo. Suspendisse potenti. Proin et orci eget velit rutrum iaculis. Etiam lacinia dictum metus, a egestas nunc ornare ut. Ut pretium efficitur cursus. Fusce sed gravida lectus.</p><p>Maecenas porttitor arcu ex, id pellentesque ipsum interdum dictum. Nulla non sodales nisi, nec rhoncus metus. Nulla libero turpis, sodales et ex vitae, condimentum accumsan tortor. Sed malesuada ullamcorper dapibus. Integer lorem augue, iaculis a congue quis, convallis nec arcu. Sed vehicula ligula eget nisl ultrices, id efficitur ex imperdiet. Proin quis maximus ante. Nulla at consequat justo, quis fermentum neque. Nam fringilla aliquet egestas. Praesent at ante felis. Curabitur sagittis, neque sit amet tincidunt accumsan, justo libero vulputate enim, quis fermentum libero nibh ac nunc. Morbi egestas ante vel mauris sodales, sed tincidunt mauris tempor.</p><p>Sed at eros ut felis lobortis interdum. Curabitur in sapien eget mi elementum lacinia. Proin rutrum pellentesque interdum. Maecenas eu posuere nulla. Sed efficitur nisi lacus, eu scelerisque nulla pretium vel. Praesent dignissim aliquet leo id fermentum. Quisque hendrerit quis metus in lacinia.</p><p>Suspendisse ullamcorper congue facilisis. Nulla turpis lorem, iaculis sit amet libero vitae, aliquet posuere felis. Vivamus vel arcu vitae orci ultricies dapibus. Nunc imperdiet feugiat elementum. Ut cursus diam nec pulvinar bibendum. Quisque in quam quam. Fusce vulputate arcu id placerat ullamcorper. In rhoncus, orci sit amet pretium lobortis, metus sem luctus enim, et maximus nisl sapien ut orci. Sed nunc nisi, fringilla vel vestibulum vel, scelerisque sit amet lectus.</p><p>Curabitur tempus ipsum ac nulla posuere, ac scelerisque ligula tincidunt. Vestibulum molestie non lectus vitae ultricies. Aliquam imperdiet et ex sed pretium. Ut imperdiet, turpis ut semper pretium, risus augue lobortis tellus, at fringilla nibh nulla et nulla. Vestibulum quam lorem, tempus ac suscipit nec, porttitor ac augue. Quisque eleifend pulvinar lacus, ut sodales lacus aliquet tristique. Fusce auctor lectus tortor, sit amet gravida eros pulvinar sed. In auctor, augue pulvinar rutrum aliquam, enim arcu maximus turpis, quis tristique felis justo quis arcu. Aliquam auctor, metus sed posuere feugiat, est leo semper justo, eget rutrum lorem libero ac libero. Ut vel vestibulum neque, id euismod ipsum. Donec placerat euismod pharetra. Duis quis nisl ipsum. Nam suscipit viverra finibus. Praesent bibendum neque sed tincidunt viverra.</p><p>Etiam id tellus magna. Nunc eget arcu eu nunc vehicula porttitor ut a neque. Vestibulum tristique fermentum dolor, ac accumsan leo dictum eu. Pellentesque quis nisi rhoncus, ultricies nunc ut, malesuada ligula. Phasellus pretium sem vel dictum rutrum. Nam enim libero, placerat eu nibh eu, vulputate dignissim nunc. Nulla ultricies nunc quis scelerisque finibus. Proin rhoncus ex id ex convallis porta.</p><p>Maecenas at nulla lectus. Donec at erat vel ex dignissim ultrices. Proin at facilisis eros. Morbi quam eros, facilisis non lacus sed, sollicitudin euismod arcu. Quisque quis ante ante. Maecenas euismod sodales eros eu facilisis. Nullam a sem ornare, sollicitudin felis nec, vehicula odio. Sed luctus pulvinar ante, a condimentum purus dignissim in. Fusce pretium ullamcorper purus, nec imperdiet felis egestas sed. Vivamus nec quam at tortor sollicitudin.</p></p>', 14, 1434966412, 'Kage Manden', NULL),
(11, '<p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur erat ipsum, eleifend at ligula ac, sodales tincidunt mi. Aliquam tincidunt, augue a dictum luctus, nisi sem tristique massa, vitae dapibus nibh ante in lacus. Donec justo nisi, sodales id faucibus ac, vehicula id ex. Morbi suscipit ut sem eget venenatis. Curabitur ullamcorper augue non justo posuere ultricies. Pellentesque eu risus accumsan, malesuada odio et, interdum tellus. Praesent sed urna tincidunt, convallis ante placerat, scelerisque nunc. Curabitur eget nisl nec nisi tincidunt varius eu sed neque. Mauris tempor nisi at ex ornare, quis mollis orci ultrices. Maecenas consequat eros et enim gravida semper. Nam et augue in ipsum pulvinar vestibulum. Nulla nulla tellus, dapibus ut mauris eu, faucibus pulvinar leo. Nullam ultrices ultricies condimentum. Nam vestibulum nisi efficitur porta tincidunt. Vivamus ultrices nec libero id molestie.</p><p>Nulla efficitur vestibulum hendrerit. Suspendisse sem lectus, semper non arcu eget, cursus pulvinar lectus. Integer nisl arcu, imperdiet vel viverra ut, facilisis sit amet justo. Cras pretium lobortis ipsum, id tempus neque ornare et. Aliquam mattis tortor id lacus lobortis aliquam. Pellentesque lacinia maximus leo, sit amet tempus ante malesuada quis. Nulla facilisi. Aenean imperdiet, massa nec finibus condimentum, mi risus mollis ligula, in pretium arcu erat et nulla.</p><p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut sodales ligula id blandit dapibus. Fusce felis eros, vulputate vitae dictum a, iaculis id nunc. Praesent sodales, lectus sit amet aliquam pretium, mi orci hendrerit eros, finibus elementum nulla augue non nulla. Phasellus elementum leo a ante ornare condimentum. Suspendisse sed enim nisi. Vivamus ut sagittis purus. Morbi nec laoreet justo. Etiam ut eros eu risus tincidunt posuere id sit amet enim. Sed sagittis vehicula velit in eleifend. Phasellus sit amet eleifend justo, cursus sollicitudin magna. Integer augue massa, efficitur ac lacinia et, aliquam nec urna.</p><p>Suspendisse vitae mauris ac nisl elementum auctor sit amet in tortor. Nunc quis sapien vitae ex volutpat maximus. Nunc vitae nulla rhoncus, dictum quam a, scelerisque tellus. Fusce semper enim et malesuada porttitor. Suspendisse non mattis nunc. Nam felis eros, hendrerit consectetur diam id, rutrum dictum ligula. Sed aliquet sem a condimentum vehicula. Quisque congue condimentum nisi sodales facilisis. Etiam pellentesque iaculis mollis. Nullam tincidunt orci libero, vehicula varius tellus sodales et. Ut ut malesuada elit, eu lacinia mauris. Vestibulum eget ex interdum, varius nisl ut, dictum erat. Nullam ultrices nisi quis tincidunt luctus.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis nulla vel massa elementum dapibus at elementum elit. Nam vel mattis odio. Etiam quis lacus purus. Quisque interdum tristique viverra. Curabitur pharetra faucibus sapien, id fringilla risus accumsan sed. Cras a velit in enim egestas pharetra. Praesent eleifend neque eu urna consectetur ultricies. Nulla vel massa mattis, commodo lectus non, tincidunt nisi. Donec orci ligula, finibus sed rhoncus viverra, volutpat quis nulla. Mauris non suscipit nibh.</p><p>Ut sagittis libero in risus pharetra, vel dignissim tortor egestas. Morbi non sem a nunc tempus ultrices. Donec et dapibus magna. Proin facilisis, arcu ac placerat posuere, massa velit volutpat neque, vel rutrum neque purus sit amet leo. Suspendisse potenti. Proin et orci eget velit rutrum iaculis. Etiam lacinia dictum metus, a egestas nunc ornare ut. Ut pretium efficitur cursus. Fusce sed gravida lectus.</p><p>Maecenas porttitor arcu ex, id pellentesque ipsum interdum dictum. Nulla non sodales nisi, nec rhoncus metus. Nulla libero turpis, sodales et ex vitae, condimentum accumsan tortor. Sed malesuada ullamcorper dapibus. Integer lorem augue, iaculis a congue quis, convallis nec arcu. Sed vehicula ligula eget nisl ultrices, id efficitur ex imperdiet. Proin quis maximus ante. Nulla at consequat justo, quis fermentum neque. Nam fringilla aliquet egestas. Praesent at ante felis. Curabitur sagittis, neque sit amet tincidunt accumsan, justo libero vulputate enim, quis fermentum libero nibh ac nunc. Morbi egestas ante vel mauris sodales, sed tincidunt mauris tempor.</p><p>Sed at eros ut felis lobortis interdum. Curabitur in sapien eget mi elementum lacinia. Proin rutrum pellentesque interdum. Maecenas eu posuere nulla. Sed efficitur nisi lacus, eu scelerisque nulla pretium vel. Praesent dignissim aliquet leo id fermentum. Quisque hendrerit quis metus in lacinia.</p><p>Suspendisse ullamcorper congue facilisis. Nulla turpis lorem, iaculis sit amet libero vitae, aliquet posuere felis. Vivamus vel arcu vitae orci ultricies dapibus. Nunc imperdiet feugiat elementum. Ut cursus diam nec pulvinar bibendum. Quisque in quam quam. Fusce vulputate arcu id placerat ullamcorper. In rhoncus, orci sit amet pretium lobortis, metus sem luctus enim, et maximus nisl sapien ut orci. Sed nunc nisi, fringilla vel vestibulum vel, scelerisque sit amet lectus.</p><p>Curabitur tempus ipsum ac nulla posuere, ac scelerisque ligula tincidunt. Vestibulum molestie non lectus vitae ultricies. Aliquam imperdiet et ex sed pretium. Ut imperdiet, turpis ut semper pretium, risus augue lobortis tellus, at fringilla nibh nulla et nulla. Vestibulum quam lorem, tempus ac suscipit nec, porttitor ac augue. Quisque eleifend pulvinar lacus, ut sodales lacus aliquet tristique. Fusce auctor lectus tortor, sit amet gravida eros pulvinar sed. In auctor, augue pulvinar rutrum aliquam, enim arcu maximus turpis, quis tristique felis justo quis arcu. Aliquam auctor, metus sed posuere feugiat, est leo semper justo, eget rutrum lorem libero ac libero. Ut vel vestibulum neque, id euismod ipsum. Donec placerat euismod pharetra. Duis quis nisl ipsum. Nam suscipit viverra finibus. Praesent bibendum neque sed tincidunt viverra.</p><p>Etiam id tellus magna. Nunc eget arcu eu nunc vehicula porttitor ut a neque. Vestibulum tristique fermentum dolor, ac accumsan leo dictum eu. Pellentesque quis nisi rhoncus, ultricies nunc ut, malesuada ligula. Phasellus pretium sem vel dictum rutrum. Nam enim libero, placerat eu nibh eu, vulputate dignissim nunc. Nulla ultricies nunc quis scelerisque finibus. Proin rhoncus ex id ex convallis porta.</p><p>Maecenas at nulla lectus. Donec at erat vel ex dignissim ultrices. Proin at facilisis eros. Morbi quam eros, facilisis non lacus sed, sollicitudin euismod arcu. Quisque quis ante ante. Maecenas euismod sodales eros eu facilisis. Nullam a sem ornare, sollicitudin felis nec, vehicula odio. Sed luctus pulvinar ante, a condimentum purus dignissim in. Fusce pretium ullamcorper purus, nec imperdiet felis egestas sed. Vivamus nec quam at tortor sollicitudin.</p></p>', 14, 1434966445, NULL, 'Nisse 3'),
(12, '<p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur erat ipsum, eleifend at ligula ac, sodales tincidunt mi. Aliquam tincidunt, augue a dictum luctus, nisi sem tristique massa, vitae dapibus nibh ante in lacus. Donec justo nisi, sodales id faucibus ac, vehicula id ex. Morbi suscipit ut sem eget venenatis. Curabitur ullamcorper augue non justo posuere ultricies. Pellentesque eu risus accumsan, malesuada odio et, interdum tellus. Praesent sed urna tincidunt, convallis ante placerat, scelerisque nunc. Curabitur eget nisl nec nisi tincidunt varius eu sed neque. Mauris tempor nisi at ex ornare, quis mollis orci ultrices. Maecenas consequat eros et enim gravida semper. Nam et augue in ipsum pulvinar vestibulum. Nulla nulla tellus, dapibus ut mauris eu, faucibus pulvinar leo. Nullam ultrices ultricies condimentum. Nam vestibulum nisi efficitur porta tincidunt. Vivamus ultrices nec libero id molestie.</p><p>Nulla efficitur vestibulum hendrerit. Suspendisse sem lectus, semper non arcu eget, cursus pulvinar lectus. Integer nisl arcu, imperdiet vel viverra ut, facilisis sit amet justo. Cras pretium lobortis ipsum, id tempus neque ornare et. Aliquam mattis tortor id lacus lobortis aliquam. Pellentesque lacinia maximus leo, sit amet tempus ante malesuada quis. Nulla facilisi. Aenean imperdiet, massa nec finibus condimentum, mi risus mollis ligula, in pretium arcu erat et nulla.</p><p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut sodales ligula id blandit dapibus. Fusce felis eros, vulputate vitae dictum a, iaculis id nunc. Praesent sodales, lectus sit amet aliquam pretium, mi orci hendrerit eros, finibus elementum nulla augue non nulla. Phasellus elementum leo a ante ornare condimentum. Suspendisse sed enim nisi. Vivamus ut sagittis purus. Morbi nec laoreet justo. Etiam ut eros eu risus tincidunt posuere id sit amet enim. Sed sagittis vehicula velit in eleifend. Phasellus sit amet eleifend justo, cursus sollicitudin magna. Integer augue massa, efficitur ac lacinia et, aliquam nec urna.</p><p>Suspendisse vitae mauris ac nisl elementum auctor sit amet in tortor. Nunc quis sapien vitae ex volutpat maximus. Nunc vitae nulla rhoncus, dictum quam a, scelerisque tellus. Fusce semper enim et malesuada porttitor. Suspendisse non mattis nunc. Nam felis eros, hendrerit consectetur diam id, rutrum dictum ligula. Sed aliquet sem a condimentum vehicula. Quisque congue condimentum nisi sodales facilisis. Etiam pellentesque iaculis mollis. Nullam tincidunt orci libero, vehicula varius tellus sodales et. Ut ut malesuada elit, eu lacinia mauris. Vestibulum eget ex interdum, varius nisl ut, dictum erat. Nullam ultrices nisi quis tincidunt luctus.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis nulla vel massa elementum dapibus at elementum elit. Nam vel mattis odio. Etiam quis lacus purus. Quisque interdum tristique viverra. Curabitur pharetra faucibus sapien, id fringilla risus accumsan sed. Cras a velit in enim egestas pharetra. Praesent eleifend neque eu urna consectetur ultricies. Nulla vel massa mattis, commodo lectus non, tincidunt nisi. Donec orci ligula, finibus sed rhoncus viverra, volutpat quis nulla. Mauris non suscipit nibh.</p><p>Ut sagittis libero in risus pharetra, vel dignissim tortor egestas. Morbi non sem a nunc tempus ultrices. Donec et dapibus magna. Proin facilisis, arcu ac placerat posuere, massa velit volutpat neque, vel rutrum neque purus sit amet leo. Suspendisse potenti. Proin et orci eget velit rutrum iaculis. Etiam lacinia dictum metus, a egestas nunc ornare ut. Ut pretium efficitur cursus. Fusce sed gravida lectus.</p><p>Maecenas porttitor arcu ex, id pellentesque ipsum interdum dictum. Nulla non sodales nisi, nec rhoncus metus. Nulla libero turpis, sodales et ex vitae, condimentum accumsan tortor. Sed malesuada ullamcorper dapibus. Integer lorem augue, iaculis a congue quis, convallis nec arcu. Sed vehicula ligula eget nisl ultrices, id efficitur ex imperdiet. Proin quis maximus ante. Nulla at consequat justo, quis fermentum neque. Nam fringilla aliquet egestas. Praesent at ante felis. Curabitur sagittis, neque sit amet tincidunt accumsan, justo libero vulputate enim, quis fermentum libero nibh ac nunc. Morbi egestas ante vel mauris sodales, sed tincidunt mauris tempor.</p><p>Sed at eros ut felis lobortis interdum. Curabitur in sapien eget mi elementum lacinia. Proin rutrum pellentesque interdum. Maecenas eu posuere nulla. Sed efficitur nisi lacus, eu scelerisque nulla pretium vel. Praesent dignissim aliquet leo id fermentum. Quisque hendrerit quis metus in lacinia.</p><p>Suspendisse ullamcorper congue facilisis. Nulla turpis lorem, iaculis sit amet libero vitae, aliquet posuere felis. Vivamus vel arcu vitae orci ultricies dapibus. Nunc imperdiet feugiat elementum. Ut cursus diam nec pulvinar bibendum. Quisque in quam quam. Fusce vulputate arcu id placerat ullamcorper. In rhoncus, orci sit amet pretium lobortis, metus sem luctus enim, et maximus nisl sapien ut orci. Sed nunc nisi, fringilla vel vestibulum vel, scelerisque sit amet lectus.</p><p>Curabitur tempus ipsum ac nulla posuere, ac scelerisque ligula tincidunt. Vestibulum molestie non lectus vitae ultricies. Aliquam imperdiet et ex sed pretium. Ut imperdiet, turpis ut semper pretium, risus augue lobortis tellus, at fringilla nibh nulla et nulla. Vestibulum quam lorem, tempus ac suscipit nec, porttitor ac augue. Quisque eleifend pulvinar lacus, ut sodales lacus aliquet tristique. Fusce auctor lectus tortor, sit amet gravida eros pulvinar sed. In auctor, augue pulvinar rutrum aliquam, enim arcu maximus turpis, quis tristique felis justo quis arcu. Aliquam auctor, metus sed posuere feugiat, est leo semper justo, eget rutrum lorem libero ac libero. Ut vel vestibulum neque, id euismod ipsum. Donec placerat euismod pharetra. Duis quis nisl ipsum. Nam suscipit viverra finibus. Praesent bibendum neque sed tincidunt viverra.</p><p>Etiam id tellus magna. Nunc eget arcu eu nunc vehicula porttitor ut a neque. Vestibulum tristique fermentum dolor, ac accumsan leo dictum eu. Pellentesque quis nisi rhoncus, ultricies nunc ut, malesuada ligula. Phasellus pretium sem vel dictum rutrum. Nam enim libero, placerat eu nibh eu, vulputate dignissim nunc. Nulla ultricies nunc quis scelerisque finibus. Proin rhoncus ex id ex convallis porta.</p><p>Maecenas at nulla lectus. Donec at erat vel ex dignissim ultrices. Proin at facilisis eros. Morbi quam eros, facilisis non lacus sed, sollicitudin euismod arcu. Quisque quis ante ante. Maecenas euismod sodales eros eu facilisis. Nullam a sem ornare, sollicitudin felis nec, vehicula odio. Sed luctus pulvinar ante, a condimentum purus dignissim in. Fusce pretium ullamcorper purus, nec imperdiet felis egestas sed. Vivamus nec quam at tortor sollicitudin.</p></p>', 14, 1434966461, NULL, 'Nisse 4');

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
-- Struktur-dump for tabellen `edu_skills`
--

CREATE TABLE IF NOT EXISTS `edu_skills` (
  `id` int(11) NOT NULL,
  `fk_edu_id` int(11) NOT NULL,
  `fk_skill_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `edu_skills`
--

INSERT INTO `edu_skills` (`id`, `fk_edu_id`, `fk_skill_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 5),
(7, 3, 6),
(8, 3, 7),
(9, 3, 8),
(10, 2, 8);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `main_menu_subsubcat`
--

INSERT INTO `main_menu_subsubcat` (`id`, `menu_subsubcat_name`, `order`, `fk_menu_subcat_id`) VALUES
(4, 'Nisse 1', 1, 3),
(5, 'Nisse 2', 2, 3),
(6, 'Nisse 3', 3, 3),
(7, 'Nisse 4', 4, 3);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL,
  `titel` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `txt` text COLLATE utf8_danish_ci NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `news`
--

INSERT INTO `news` (`id`, `titel`, `txt`, `date`) VALUES
(23, 'Ny Sponsor Dansk Metal', '<p><p><span class="f-img-wrap"><img alt="Image title" src="/uploads/036380f2c71e2642e7696c6bb9247e9a2ff27d41.jpg" style="min-width: 16px; min-height: 16px; margin: 10px 10px 10px 3px; float: left;" width="208"></span></p><p><strong>Lorem Ipsum</strong> er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en bog til sammenligning af forskellige skrifttyper. Lorem Ipsum har ikke alene overlevet fem århundreder, men har også vundet indpas i elektronisk typografi uden væsentlige ændringer. Sætningen blev gjordt kendt i 1960''erne med lanceringen af Letraset-ark, som indeholdt afsnit med Lorem Ipsum, og senere med layoutprogrammer som Aldus PageMaker, som også indeholdt en udgave af Lorem Ipsum.</p><div><p>Det er en kendsgerning, at man bliver distraheret af læsbart indhold på en side, når man betragter dens layout. Meningen med at bruge Lorem Ipsum er, at teksten indeholder mere eller mindre almindelig tekstopbygning i modsætning til "Tekst her – og mere tekst her", mens det samtidigt ligner almindelig tekst. Mange layoutprogrammer og webdesignere bruger Lorem Ipsum som fyldtekst. En søgning på Lorem Ipsum afslører mange websider, som stadig er på udviklingsstadiet. Der har været et utal af variationer, som er opstået enten på grund af fejl og andre gange med vilje (som blandt andet et resultat af humor).</p></div><div><p>I modsætning til hvad mange tror, er Lorem Ipsum ikke bare tilfældig tekst. Det stammer fra et stykke litteratur på latin fra år 45 f.kr., hvilket gør teksten over 2000 år gammel. Richard McClintock, professor i latin fra Hampden-Sydney universitet i Virginia, undersøgte et af de mindst kendte ord "consectetur" fra en del af Lorem Ipsum, og fandt frem til dets oprindelse ved at studere brugen gennem klassisk litteratur. Lorem Ipsum stammer fra afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" (Det gode og ondes ekstremer), som er skrevet af Cicero i år 45 f.kr. Bogen, som var meget populær i renæssancen, er en afhandling om etik. Den første linie af Lorem Ipsum "Lorem ipsum dolor sit amet..." kommer fra en linje i afsnit 1.10.32.</p><p>Standardafsnittet af Lorem Ipsum, som er brugt siden 1500-tallet, er gengivet nedenfor for de, der er interesserede. Afsnittene 1.10.32 og 1.10.33 fra "de Finibus Bonorum et Malorum" af Cicero er også gengivet i deres nøjagtige udgave i selskab med den engelske udgave fra oversættelsen af H. Rackham fra 1914.</p></div><p>Der er mange tilgængelige udgaver af Lorem Ipsum, men de fleste udgaver har gennemgået forandringer, når nogen har tilføjet humor eller tilfældige ord, som på ingen måde ser ægte ud. Hvis du skal bruge en udgave af Lorem Ipsum, skal du sikre dig, at der ikke indgår noget pinligt midt i teksten. Alle Lorem Ipsum-generatore på nettet har en tendens til kun at dublere små brudstykker af Lorem Ipsum efter behov, hvilket gør dette til den første ægte generator på internettet. Den bruger en ordbog på over 200 ord på latin kombineret med en håndfuld sætningsstrukturer til at generere sætninger, som ser pålidelige ud. Resultatet af Lorem Ipsum er derfor altid fri for gentagelser, tilføjet humor eller utroværdige ord osv.</p></p>', 1431497081),
(25, 'ÆØÅ', '<p>ÆØÅ æøå<br></p>', 1432110847),
(26, 'jaaa image oplaode virker igen', '<p><span style="text-align: center;" class="f-img-wrap"><img alt="Image title" src="/uploads/516bd5eb2fbc38f1b41fad7a5369f70d791c5315.jpg" style="min-width: 16px; min-height: 16px; margin: 10px 10px 10px 3px; float: left;" width="126"></span></p><p><strong>Lorem Ipsum</strong> er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en bog til sammenligning af forskellige skrifttyper. Lorem Ipsum har ikke alene overlevet fem århundreder, men har også vundet indpas i elektronisk typografi uden væsentlige ændringer. Sætningen blev gjordt kendt i 1960''erne med lanceringen af Letraset-ark, som indeholdt afsnit med Lorem Ipsum, og senere med layoutprogrammer som Aldus PageMaker, som også indeholdt en udgave af Lorem Ipsum.<br></p>', 1434437726),
(28, 'Lorem Ipsum', '<p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur erat ipsum, eleifend at ligula ac, sodales tincidunt mi. Aliquam tincidunt, augue a dictum luctus, nisi sem tristique massa, vitae dapibus nibh ante in lacus. Donec justo nisi, sodales id faucibus ac, vehicula id ex. Morbi suscipit ut sem eget venenatis. Curabitur ullamcorper augue non justo posuere ultricies. Pellentesque eu risus accumsan, malesuada odio et, interdum tellus. Praesent sed urna tincidunt, convallis ante placerat, scelerisque nunc. Curabitur eget nisl nec nisi tincidunt varius eu sed neque. Mauris tempor nisi at ex ornare, quis mollis orci ultrices. Maecenas consequat eros et enim gravida semper. Nam et augue in ipsum pulvinar vestibulum. Nulla nulla tellus, dapibus ut mauris eu, faucibus pulvinar leo. Nullam ultrices ultricies condimentum. Nam vestibulum nisi efficitur porta tincidunt. Vivamus ultrices nec libero id molestie.</p><p>Nulla efficitur vestibulum hendrerit. Suspendisse sem lectus, semper non arcu eget, cursus pulvinar lectus. Integer nisl arcu, imperdiet vel viverra ut, facilisis sit amet justo. Cras pretium lobortis ipsum, id tempus neque ornare et. Aliquam mattis tortor id lacus lobortis aliquam. Pellentesque lacinia maximus leo, sit amet tempus ante malesuada quis. Nulla facilisi. Aenean imperdiet, massa nec finibus condimentum, mi risus mollis ligula, in pretium arcu erat et nulla.</p><p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut sodales ligula id blandit dapibus. Fusce felis eros, vulputate vitae dictum a, iaculis id nunc. Praesent sodales, lectus sit amet aliquam pretium, mi orci hendrerit eros, finibus elementum nulla augue non nulla. Phasellus elementum leo a ante ornare condimentum. Suspendisse sed enim nisi. Vivamus ut sagittis purus. Morbi nec laoreet justo. Etiam ut eros eu risus tincidunt posuere id sit amet enim. Sed sagittis vehicula velit in eleifend. Phasellus sit amet eleifend justo, cursus sollicitudin magna. Integer augue massa, efficitur ac lacinia et, aliquam nec urna.</p><p>Suspendisse vitae mauris ac nisl elementum auctor sit amet in tortor. Nunc quis sapien vitae ex volutpat maximus. Nunc vitae nulla rhoncus, dictum quam a, scelerisque tellus. Fusce semper enim et malesuada porttitor. Suspendisse non mattis nunc. Nam felis eros, hendrerit consectetur diam id, rutrum dictum ligula. Sed aliquet sem a condimentum vehicula. Quisque congue condimentum nisi sodales facilisis. Etiam pellentesque iaculis mollis. Nullam tincidunt orci libero, vehicula varius tellus sodales et. Ut ut malesuada elit, eu lacinia mauris. Vestibulum eget ex interdum, varius nisl ut, dictum erat. Nullam ultrices nisi quis tincidunt luctus.</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis nulla vel massa elementum dapibus at elementum elit. Nam vel mattis odio. Etiam quis lacus purus. Quisque interdum tristique viverra. Curabitur pharetra faucibus sapien, id fringilla risus accumsan sed. Cras a velit in enim egestas pharetra. Praesent eleifend neque eu urna consectetur ultricies. Nulla vel massa mattis, commodo lectus non, tincidunt nisi. Donec orci ligula, finibus sed rhoncus viverra, volutpat quis nulla. Mauris non suscipit nibh.</p><p>Ut sagittis libero in risus pharetra, vel dignissim tortor egestas. Morbi non sem a nunc tempus ultrices. Donec et dapibus magna. Proin facilisis, arcu ac placerat posuere, massa velit volutpat neque, vel rutrum neque purus sit amet leo. Suspendisse potenti. Proin et orci eget velit rutrum iaculis. Etiam lacinia dictum metus, a egestas nunc ornare ut. Ut pretium efficitur cursus. Fusce sed gravida lectus.</p><p>Maecenas porttitor arcu ex, id pellentesque ipsum interdum dictum. Nulla non sodales nisi, nec rhoncus metus. Nulla libero turpis, sodales et ex vitae, condimentum accumsan tortor. Sed malesuada ullamcorper dapibus. Integer lorem augue, iaculis a congue quis, convallis nec arcu. Sed vehicula ligula eget nisl ultrices, id efficitur ex imperdiet. Proin quis maximus ante. Nulla at consequat justo, quis fermentum neque. Nam fringilla aliquet egestas. Praesent at ante felis. Curabitur sagittis, neque sit amet tincidunt accumsan, justo libero vulputate enim, quis fermentum libero nibh ac nunc. Morbi egestas ante vel mauris sodales, sed tincidunt mauris tempor.</p><p>Sed at eros ut felis lobortis interdum. Curabitur in sapien eget mi elementum lacinia. Proin rutrum pellentesque interdum. Maecenas eu posuere nulla. Sed efficitur nisi lacus, eu scelerisque nulla pretium vel. Praesent dignissim aliquet leo id fermentum. Quisque hendrerit quis metus in lacinia.</p><p>Suspendisse ullamcorper congue facilisis. Nulla turpis lorem, iaculis sit amet libero vitae, aliquet posuere felis. Vivamus vel arcu vitae orci ultricies dapibus. Nunc imperdiet feugiat elementum. Ut cursus diam nec pulvinar bibendum. Quisque in quam quam. Fusce vulputate arcu id placerat ullamcorper. In rhoncus, orci sit amet pretium lobortis, metus sem luctus enim, et maximus nisl sapien ut orci. Sed nunc nisi, fringilla vel vestibulum vel, scelerisque sit amet lectus.</p><p>Curabitur tempus ipsum ac nulla posuere, ac scelerisque ligula tincidunt. Vestibulum molestie non lectus vitae ultricies. Aliquam imperdiet et ex sed pretium. Ut imperdiet, turpis ut semper pretium, risus augue lobortis tellus, at fringilla nibh nulla et nulla. Vestibulum quam lorem, tempus ac suscipit nec, porttitor ac augue. Quisque eleifend pulvinar lacus, ut sodales lacus aliquet tristique. Fusce auctor lectus tortor, sit amet gravida eros pulvinar sed. In auctor, augue pulvinar rutrum aliquam, enim arcu maximus turpis, quis tristique felis justo quis arcu. Aliquam auctor, metus sed posuere feugiat, est leo semper justo, eget rutrum lorem libero ac libero. Ut vel vestibulum neque, id euismod ipsum. Donec placerat euismod pharetra. Duis quis nisl ipsum. Nam suscipit viverra finibus. Praesent bibendum neque sed tincidunt viverra.</p><p>Etiam id tellus magna. Nunc eget arcu eu nunc vehicula porttitor ut a neque. Vestibulum tristique fermentum dolor, ac accumsan leo dictum eu. Pellentesque quis nisi rhoncus, ultricies nunc ut, malesuada ligula. Phasellus pretium sem vel dictum rutrum. Nam enim libero, placerat eu nibh eu, vulputate dignissim nunc. Nulla ultricies nunc quis scelerisque finibus. Proin rhoncus ex id ex convallis porta.</p><p>Maecenas at nulla lectus. Donec at erat vel ex dignissim ultrices. Proin at facilisis eros. Morbi quam eros, facilisis non lacus sed, sollicitudin euismod arcu. Quisque quis ante ante. Maecenas euismod sodales eros eu facilisis. Nullam a sem ornare, sollicitudin felis nec, vehicula odio. Sed luctus pulvinar ante, a condimentum purus dignissim in. Fusce pretium ullamcorper purus, nec imperdiet felis egestas sed. Vivamus nec quam at tortor sollicitudin.</p><br></p>', 1434966549);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL,
  `perName` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8_danish_ci DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `permissions`
--

INSERT INTO `permissions` (`id`, `perName`, `description`) VALUES
(2, 'create_user', 'Permission to create user'),
(3, 'DynamicEditPages', 'Tillader at man kan redigere de dynamiske sider, som kan tilgås via et link på hver enkelt side'),
(4, 'create_project', 'Tilladelse til at kunne oprette nye projekter.'),
(6, 'CreateNews', 'allows the user to creata news on the webportal');

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
  `leaderId` int(11) NOT NULL,
  `inst` int(11) NOT NULL,
  `start` int(15) NOT NULL,
  `end` int(15) NOT NULL,
  `FK_ProTemp` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `project`
--

INSERT INTO `project` (`id`, `name`, `leaderId`, `inst`, `start`, `end`, `FK_ProTemp`) VALUES
(3, 'Skp Management', 14, 38, 1431334978, 1435183200, 3),
(24, 'Cisco router opsætning', 40, 1, 1435096800, 1435183200, 31),
(23, 'Cisco router opsætning', 29, 1, 1435096800, 1435615200, 31),
(22, 'Cisco router opsætning', 29, 1, 1435096800, 1435615200, 31),
(21, 'Cisco router opsætning', 29, 1, 1435096800, 1435615200, 31),
(20, 'Cisco router opsætning', 47, 14, 1435010400, 1435269600, 31),
(19, 'Oste klokke', 1, 1, 1432813943, 1482813943, 3),
(18, 'Oste mand', 1, 34, 1432813943, 1532813943, 3),
(25, 'Cisco router opsætning', 42, 1, 1435096800, 1435615200, 31),
(26, 'Cisco router opsætning', 42, 1, 1435096800, 1435615200, 31),
(27, 'Cisco router opsætning', 42, 1, 1435096800, 1435615200, 31),
(34, 'SKP Management', 40, 1, 1435096800, 1435615200, 3),
(29, 'Svendeprøve H6', 42, 1, 1435096800, 1435615200, 29),
(30, 'Svendeprøve H6', 42, 1, 1435096800, 1435615200, 29),
(31, 'Svendeprøve H6', 42, 1, 1435096800, 1435615200, 29),
(32, 'Svendeprøve H6', 42, 1, 1435096800, 1435615200, 29),
(33, 'Svendeprøve H6', 42, 1, 1435096800, 1435615200, 29),
(35, 'Cisco router opsætning', 39, 1, 1435096800, 1435096800, 31),
(36, 'Frikadelle Maskinen # 2', 40, 1, 1435096800, 1435183200, 30),
(37, 'Svendeprøve H6', 46, 1, 1435096800, 1435615200, 29),
(38, 'Frikadelle Maskinen', 29, 1, 1435096800, 1435615200, 28),
(39, 'SKP Management', 53, 1, 1435096800, 1435615200, 3);

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `proLog`
--

CREATE TABLE IF NOT EXISTS `proLog` (
  `id` int(11) NOT NULL,
  `date` int(15) NOT NULL,
  `user` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `txt` text COLLATE utf8_danish_ci NOT NULL,
  `FK_ProId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `proTemp`
--

CREATE TABLE IF NOT EXISTS `proTemp` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_danish_ci NOT NULL,
  `description` text COLLATE utf8_danish_ci NOT NULL,
  `FK_CatId` int(11) NOT NULL,
  `Frs_file` text COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `proTemp`
--

INSERT INTO `proTemp` (`id`, `name`, `description`, `FK_CatId`, `Frs_file`) VALUES
(3, 'SKP Management', 'Projektet er startet af Kim Møller Jensen som er instruktør i SKP Ballerup. Projektet går ud på at udvikle et database system med to tilhørende brugerinterfaces, et i C# og et web interface. Grunden til udviklingen af dette it system er at lave et system som kan hjælpe instruktørende fra SKP, til at få et bedre overblik over det arbejde som praktikanterne udføre. Derudover skal systemet fungere som en videnshåndterings system så alle tilknyttet SKP har mulighed for at læse om de igangværende projekter, samt tidligere udførte projekter. Til denne del af systemet skal der være en fildelingstjeneste hvori der oprettes et mappe system som gemmer alle projekt beskrivelser og dokumentation.', 0, '\\\\192.168.0.250\\Ting og sager\\Projekter\\SKP Management projekt\\C# gamle filer\\Dokumentation for projekt SKP Management'),
(28, 'Frikadelle Maskinen', 'Lave en maskine der kan lave frikadeller', 2, ''),
(29, 'Svendeprøve H6', 'infrastruktur', 0, ''),
(30, 'Frikadelle Maskinen # 2', 'Indtast en udførlig beskrivelse af projektet.', 0, ''),
(31, 'Cisco router opsætning', 'Opgaven går ud på at opsætte en router som sidder iforbindelse med en swich, som har 4 hostmaskiner tilsluttet.', 1, '');

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `proTempCat`
--

CREATE TABLE IF NOT EXISTS `proTempCat` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_danish_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `proTempCat`
--

INSERT INTO `proTempCat` (`id`, `name`) VALUES
(1, 'Projektskabeloner for dem som har gennemført Grundforløb'),
(2, 'Projektskabeloner for dem som har gennemført Hovedforløb 1'),
(3, 'Projektskabeloner for dem som har gennemført Hovedforløb 2'),
(4, 'Projektskabeloner for dem som har gennemført Hovedforløb 3'),
(5, 'Projektskabeloner for dem som har gennemført Hovedforløb 4'),
(6, 'Projektskabeloner for dem som har gennemført Hovedforløb 5'),
(7, 'Projektskabeloner for dem som har gennemført Hovedforløb 6');

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
(7, '“Software is like entropy: It is difficult to grasp, weighs nothing, and obeys the Second Law of Thermodynamics; i.e., it always increases.” – Norman Augustine', 6),
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
  `name` varchar(45) COLLATE utf8_danish_ci DEFAULT NULL,
  `roleRank` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `roles`
--

INSERT INTO `roles` (`id`, `name`, `roleRank`) VALUES
(1, 'Elev', 3),
(2, 'Instruktør', 1),
(3, 'Værkføre', 2);

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
(2, 4),
(2, 6);

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
  `pic` varchar(255) COLLATE utf8_danish_ci DEFAULT 'nopic.png',
  `email` varchar(35) COLLATE utf8_danish_ci DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_danish_ci DEFAULT NULL,
  `bDay` date DEFAULT NULL,
  `maincurse` int(11) DEFAULT NULL,
  `edu` int(11) DEFAULT NULL,
  `eduEnd` int(15) DEFAULT NULL,
  `fk_role_id` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci;

--
-- Data dump for tabellen `user`
--

INSERT INTO `user` (`id`, `password`, `fName`, `lName`, `pic`, `email`, `phone`, `address`, `bDay`, `maincurse`, `edu`, `eduEnd`, `fk_role_id`) VALUES
(1, 'b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86', 'Tor', 'Soya', 'nopic.png', 'torsoya@gmail.com', 21204261, 'Blommevej 1 3660 Stenløse', '1991-07-05', NULL, 1, 1462460400, 2),
(34, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 5', 'Testersen', NULL, 'testersen5@test.dk', 55555555, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-30', 1, 3, 2015, 1),
(14, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Emil Schytte', 'Bækgaard', 'nopic.png', 'emilschytte@gmail.com', 22971719, 'Hovedgaden 54 A, 4140 Borup', '1985-10-25', 1, 3, 1475247600, 2),
(33, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 5', 'Testersen', NULL, 'testersen5@test.dk', 55555555, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-30', 1, 3, 2015, 1),
(32, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 4', 'Testersen', NULL, 'testersen4@test.dk', 55555555, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-15', 5, 2, 2015, 1),
(31, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 4', 'Testersen', NULL, 'testersen4@test.dk', 55555555, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-15', 5, 2, 2015, 1),
(30, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 3', 'Testersen', NULL, 'testersen3@test.dk', 11111111, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-30', 4, 2, 2015, 1),
(29, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 2', 'adfaf', NULL, 'testersen@test.dk', 22971719, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-02', 4, 1, 2015, 1),
(28, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger', 'Testersen', NULL, 'testersen@test.dk', 55555555, 'Hovedgaden 54 A', '2015-05-02', 3, 2, 2015, 1),
(35, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 5', 'Testersen', NULL, 'testersen5@test.dk', 55555555, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-30', 1, 3, 2015, 1),
(36, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 4', 'Testersen', NULL, 'testersen@test.dk', 11111111, 'Hovedgaden 54 A', '2015-05-29', 2, 2, 2015, 1),
(37, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 4', 'Testersen', NULL, 'testersen@test.dk', 11111111, 'Hovedgaden 54 A', '2015-05-29', 2, 2, 2015, 1),
(38, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 2', 'Testersen', NULL, 'adfa@df.df', 11111111, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-20', 3, NULL, 2015, 1),
(39, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'ada', 'Testersen', NULL, 'emilschefyoytte@gmail.com', 33333333, 'Hovedgaden 54 A', '1985-10-25', 2, 2, 2015, 1),
(40, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Emil Schytte', 'Testersen', NULL, 'adgfdgdfghfdgfdfa@df.df', 55555555, 'adf', '2015-05-30', 2, 1, 2015, 1),
(41, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'ada', 'adfaf', NULL, 'gefsgasegemilschytte@gmail.com', 22222222, 'adf', '1985-10-25', 1, 1, 2016, 1),
(42, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Emil', 'Testersen', NULL, 'afrg@hotmail.com', 22222222, 'Hovedgaden 54 A', '1985-10-25', 1, 2, 2024, 1),
(43, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Emil', 'Testersen', NULL, 'abcdefghij@sol.dk', 22971719, 'Hovedgaden 54 A', '2015-05-30', 4, 2, 2015, 1),
(44, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Emil', 'adfaf', NULL, 'kagemanden@sol.dk', 12345675, 'kage vej 1', '2015-05-25', 3, 2, 2015, 1),
(45, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Testbruger 2', 'Testersen', NULL, 'kagedamen@hus.dk', 12345678, 'Hovedgaden 54 A, 4140 Borup', '2015-05-30', 2, 1, 2015, 1),
(46, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Scarlet', 'Johanson', NULL, 'Dejligdame@dkhostmaster.dk', 57487456, 'Hjemme hos mig hehe', '2015-05-15', NULL, NULL, NULL, 1),
(47, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Jan', 'Jeppesen', NULL, 'testersen564644@test.dk', 11111111, 'kage vej 1', '2015-05-22', NULL, NULL, NULL, 1),
(48, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Emil', 'Schytte', NULL, 'abc@sol.dk', 12345678, 'Andeby Hovedgade 224, 1010 Andeby', '2015-05-23', 5, 2, 2015, 1),
(49, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'kage"manded;', 'Schytte', NULL, 'adfafgsfgs@df.df', 22971719, 'Hovedgaden 54 A', '2015-05-23', 2, 1, 2015, 1),
(50, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Hans Christian', 'Andersen', NULL, 'hca@gmail.com', 12345678, 'MunkemÃ¸llestrÃ¦de 3, 5000 Odense ', '1805-04-02', 3, 2, 0, 1),
(51, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'Clark Joseph', 'Kent', NULL, 'superman@gmail.com', 99999999, 'Main st. Kansas, KS Usa', '1938-06-01', NULL, NULL, NULL, 1),
(52, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'kage', 'manden', 'nopic.png', 'kage@madnen.dk', 12345678, 'Blommevej 1 3660 Stenløse', '1991-07-05', 5, 1, 0, 1),
(53, '47d80e3d06534ada8054f085b1e04d1eb9e0ecab0c1ca75bdcc701a37170b7fd38d6583eb89eadc380445da3ccbed0ee488b86a69d5db61caf967e0b4b6d7427', 'ada', 'adfaf', 'nopic.png', '123@sol.dk', 12345678, 'kage vej 1', '2015-06-18', 5, 2, 0, 1);

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
(14, 18),
(39, 3),
(1, 19),
(14, 19),
(1, 18),
(1, 3),
(32, 24),
(31, 25),
(31, 27),
(34, 34),
(0, 29),
(0, 30),
(0, 31),
(0, 32),
(0, 33),
(33, 34),
(32, 34),
(34, 35),
(33, 35),
(32, 35),
(31, 35),
(34, 36),
(33, 36),
(32, 36),
(34, 37),
(33, 37),
(33, 38),
(32, 38),
(31, 38),
(34, 39),
(33, 39),
(32, 39),
(31, 39),
(30, 39),
(29, 39),
(28, 39),
(35, 39),
(36, 39),
(37, 39),
(38, 39),
(39, 39),
(40, 39),
(41, 39),
(42, 39),
(43, 39),
(44, 39),
(45, 39),
(46, 39),
(47, 39),
(48, 39),
(49, 39),
(50, 39),
(51, 39),
(52, 39);

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
(14, 5),
(14, 8),
(1, 8),
(1, 2);

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
-- Indeks for tabel `edu_skills`
--
ALTER TABLE `edu_skills`
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
-- Indeks for tabel `proLog`
--
ALTER TABLE `proLog`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `proTemp`
--
ALTER TABLE `proTemp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_CatId` (`FK_CatId`);

--
-- Indeks for tabel `proTempCat`
--
ALTER TABLE `proTempCat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- Tilføj AUTO_INCREMENT i tabel `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `dynamicPages`
--
ALTER TABLE `dynamicPages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- Tilføj AUTO_INCREMENT i tabel `edu`
--
ALTER TABLE `edu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Tilføj AUTO_INCREMENT i tabel `edu_skills`
--
ALTER TABLE `edu_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- Tilføj AUTO_INCREMENT i tabel `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- Tilføj AUTO_INCREMENT i tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- Tilføj AUTO_INCREMENT i tabel `producent`
--
ALTER TABLE `producent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Tilføj AUTO_INCREMENT i tabel `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- Tilføj AUTO_INCREMENT i tabel `proLog`
--
ALTER TABLE `proLog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `proTemp`
--
ALTER TABLE `proTemp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- Tilføj AUTO_INCREMENT i tabel `proTempCat`
--
ALTER TABLE `proTempCat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
